#pragma once
#include "KByS.h"
#include "Erika.h"
using namespace std;
DWORD __stdcall packbuff(unsigned char *inBuffer,DWORD inSize); 

//----------------------------------------------
//全局变量开始
//----------------------------------------------
//原始无壳PE头
PIMAGE_DOS_HEADER pOldDosHeader;
PIMAGE_NT_HEADERS pOldNtHeader;
//加壳后的PE头
PIMAGE_DOS_HEADER imDos_Headers;
PIMAGE_NT_HEADERS imNT_Headers;

#define isdll   ((imNT_Headers->FileHeader.Characteristics & IMAGE_FILE_DLL) != 0)

pe_header_t ih, oh;

//三个区段头
PIMAGE_SECTION_HEADER pISHUpx0;
PIMAGE_SECTION_HEADER pISHUpx1;
PIMAGE_SECTION_HEADER pISHUpxRes;

upx_byte *oexport;
unsigned soexport;
upx_byte* obuf;
upx_byte* ibuf;
int icondir_count;
//映射的文件内存
LPVOID lpFileMap;
unsigned soxrelocs;
upx_byte *oxrelocs;
#define  rvamin  (pISHUpx0->VirtualAddress)


// for use with qsort()
extern "C" {
	int __cdecl le32_compare(const void *, const void *);
} // extern "C"

int __cdecl le32_compare(const void *e1, const void *e2)
{
    const unsigned d1 = get_le32(e1);
    const unsigned d2 = get_le32(e2);
    return (d1 < d2) ? -1 : ((d1 > d2) ? 1 : 0);
}


//----------------------------------------------
//全局变量结束
//----------------------------------------------
///////////////////////////////////////////////////////////////
void BackupSrcFile(const char* szSrcFileName)
{
	char		szDstFileName[MAX_PATH];
	strcpy(szDstFileName, szSrcFileName);
	strcat(szDstFileName, ".bak");
	CopyFile(szSrcFileName, szDstFileName, FALSE);
}

///////////////////////////////////////////////////////////////
BOOL IsPE(HANDLE hFile)
{
	WORD	temp;
	DWORD	dwEntryPoint;
	DWORD	dwRead;
	DWORD	dwOffset;
	
	SetFilePointer(hFile, 0, NULL,  FILE_BEGIN); 
	ReadFile(hFile, &temp, 2, &dwRead, NULL);
	if (temp != 'ZM')
		return FALSE;
    SetFilePointer(hFile, 0x3C, NULL,  FILE_BEGIN);                    
	ReadFile(hFile, &dwOffset, 4, &dwRead, NULL);
	SetFilePointer(hFile, dwOffset, NULL, FILE_BEGIN);
	ReadFile(hFile, &temp, 2, &dwRead, NULL);
	if (temp != 'EP')
		return FALSE;
    SetFilePointer(hFile, dwOffset+0x16, NULL,  FILE_BEGIN);
	ReadFile(hFile, &temp, 2, &dwRead, NULL);
    SetFilePointer(hFile, dwOffset+0x28, NULL,  FILE_BEGIN);
	ReadFile(hFile, &dwEntryPoint, 4, &dwRead, NULL);
	if (dwEntryPoint == 0)
		return FALSE;
	if ((temp & 0x2000) != 0)
		bDLL = TRUE;
	else
		bDLL = FALSE;
	SetFilePointer(hFile, 0, NULL,  FILE_BEGIN); 
	return TRUE;
}

/*
///////////////////////////////////////////////////////////////
void MapFile(HANDLE hFile)
{
DWORD	dwRead;
DWORD	dwOffset;
DWORD	dwImageSize;
DWORD	dwHeadSize;
DWORD	i;

  SetFilePointer(hFile, 0x3C, NULL,  FILE_BEGIN);                    
  ReadFile(hFile, &dwOffset, 4, &dwRead, NULL);
  SetFilePointer(hFile, dwOffset+0x50, NULL,  FILE_BEGIN);
  ReadFile(hFile, &dwImageSize, 4, &dwRead, NULL);          
  SetFilePointer(hFile, dwOffset+0x54, NULL,  FILE_BEGIN);
  ReadFile(hFile, &dwHeadSize, 4, &dwRead, NULL); 
  
	MapOfFile = (LPBYTE)VirtualAlloc(0, dwImageSize, MEM_COMMIT, PAGE_READWRITE);
    SetFilePointer(hFile, 0, NULL,  FILE_BEGIN);
	ReadFile(hFile, MapOfFile, dwHeadSize, &dwRead, NULL);
	PE = (IMAGE_NT_HEADERS32 *)(MapOfFile+dwOffset);
	SH = IMAGE_FIRST_SECTION32(PE);
	
	  for (i=0; i<PE->FileHeader.NumberOfSections; i++)
	  {
	  SetFilePointer(hFile, (SH+i)->PointerToRawData, NULL, FILE_BEGIN);
	  ReadFile(hFile, (SH+i)->VirtualAddress+MapOfFile, (SH+i)->SizeOfRawData, &dwRead, NULL);
	  }
}*/

///////////////////////////////////////////////////////////////
void OverlayFile(HANDLE hFile)
{
	DWORD	dwFileSize;
	DWORD	dwRead;
	
	//文件实际大小
	dwFileSize = GetFileSize(hFile, NULL);
	//减去内存中最后一个区段需要映射的大小
	dwFileSize -= pISHUpxRes->SizeOfRawData + pISHUpxRes->PointerToRawData;
	SizeOfOverlay = dwFileSize;
	if (SizeOfOverlay != 0)
	{
		MapOfOverlay = (unsigned char *)VirtualAlloc(NULL, SizeOfOverlay, MEM_COMMIT, PAGE_READWRITE);
		ReadFile(hFile, MapOfOverlay, SizeOfOverlay, &dwRead, NULL);
	}
	else
	{
		MapOfOverlay = NULL;
		SizeOfOverlay = 0;
	}
	return ;
}

struct import_desc
{
    LE32  oft;      // orig first thunk
    char  _[8];
    LE32  dllname;
    LE32  iat;      // import address table
}
__attribute_packed;



Interval::Interval(void *b) : capacity(0),base(b),ivarr(NULL),ivnum(0)
{}

Interval::~Interval()
{
    free(ivarr);
}

void Interval::add(const void *start,unsigned len)
{
    add(ptr_diff(start,base),len);
}

void Interval::add(const void *start,const void *end)
{
    add(ptr_diff(start,base),ptr_diff(end,start));
}

int __cdecl Interval::compare(const void *p1,const void *p2)
{
    const interval *i1 = (const interval*) p1;
    const interval *i2 = (const interval*) p2;
    if (i1->start < i2->start) return -1;
    if (i1->start > i2->start) return 1;
    if (i1->len < i2->len) return 1;
    if (i1->len > i2->len) return -1;
    return 0;
}

void Interval::add(unsigned start,unsigned len)
{
    if (ivnum == capacity)
        ivarr = (interval*) realloc(ivarr,(capacity += 15) * sizeof (interval));
    ivarr[ivnum].start = start;
    ivarr[ivnum++].len = len;
}

void Interval::add(const Interval *iv)
{
    for (unsigned ic = 0; ic < iv->ivnum; ic++)
        add(iv->ivarr[ic].start,iv->ivarr[ic].len);
}

void Interval::flatten()
{
    if (!ivnum)
        return;
    qsort(ivarr,ivnum,sizeof (interval),Interval::compare);
    for (unsigned ic = 0; ic < ivnum - 1; ic++)
    {
        unsigned jc;
        for (jc = ic + 1; jc < ivnum && ivarr[ic].start + ivarr[ic].len >= ivarr[jc].start; jc++)
            if (ivarr[ic].start + ivarr[ic].len < ivarr[jc].start + ivarr[jc].len)
                ivarr[ic].len = ivarr[jc].start + ivarr[jc].len - ivarr[ic].start;
			if (jc > ic + 1)
			{
				memmove(ivarr + ic + 1, ivarr + jc,sizeof(interval) * (ivnum - jc));
				ivnum -= jc - ic - 1;
			}
    }
}

void Interval::clear()
{
    for (unsigned ic = 0; ic < ivnum; ic++)
        memset((char*) base + ivarr[ic].start,0,ivarr[ic].len);
}

void Interval::dump() const
{
    printf("%d intervals:\n",ivnum);
    for (unsigned ic = 0; ic < ivnum; ic++)
        printf("%x %x\n",ivarr[ic].start,ivarr[ic].len);
}


void rebuildTls()
{
    // this is an easy one : just do nothing ;-)
}



struct Reloc::reloc
{
    LE32  pagestart;
    LE32  size;
};

void Reloc::newRelocPos(void *p)
{
    rel = (reloc*) p;
    rel1 = (LE16*) ((char*) p + sizeof (reloc));
}

Reloc::Reloc(upx_byte *s,unsigned si) :
start(s), size(si), rel(NULL), rel1(NULL)
{
    assert(sizeof(reloc) == 8);
    memset(counts,0,sizeof(counts));
    unsigned pos,type;
    while (next(pos,type))
        counts[type]++;
}

Reloc::Reloc(unsigned rnum) :
start(NULL), size(0), rel(NULL), rel1(NULL)
{
    start = new upx_byte[rnum * 4 + 8192];
    counts[0] = 0;
}

bool Reloc::next(unsigned &pos,unsigned &type)
{
    if (!rel)
        newRelocPos(start);
    if (ptr_diff(rel, start) >= (int) size || rel->pagestart == 0)
        return rel = 0,false; // rewind
	
    pos = rel->pagestart + (*rel1 & 0xfff);
    type = *rel1++ >> 12;
    //printf("%x %d\n",pos,type);
    if (ptr_diff(rel1,rel) >= (int) rel->size)
        newRelocPos(rel1);
    return type == 0 ? next(pos,type) : true;
}

void Reloc::add(unsigned pos,unsigned type)
{
    set_le32(start + 1024 + 4 * counts[0]++,(pos << 4) + type);
}

void Reloc::finish(upx_byte *&p,unsigned &siz)
{
    unsigned prev = 0xffffffff;
    set_le32(start + 1024 + 4 * counts[0]++,0xf0000000);
    qsort(start + 1024,counts[0], 4, le32_compare);
	
    rel = (reloc*) start;
    rel1 = (LE16*) rel;
    for (unsigned ic = 0; ic < counts[0]; ic++)
    {
        unsigned pos = get_le32(start + 1024 + 4 * ic);
        if ((pos ^ prev) >= 0x10000)
        {
            prev = pos;
            *rel1 = 0;
            rel->size = ALIGN_UP(ptr_diff(rel1,rel),4);
            newRelocPos((char *)rel + rel->size);
            rel->pagestart = (pos >> 4) &~ 0xfff;
        }
        *rel1++ = (pos << 12) + ((pos >> 4) & 0xfff);
    }
    p = start;
    siz = ptr_diff(rel1,start) &~ 3;
    siz -= 8;
    assert(siz > 0);
    start = 0; // safety
}


struct Resource::res_dir_entry
{
    LE32  tnl; // Type | Name | Language id - depending on level
    LE32  child;
};

struct Resource::res_dir
{
    char  _[12]; // flags, timedate, version
    LE16  namedentr;
    LE16  identr;
	
    unsigned Sizeof() const { return 16 + sizeof(res_dir_entry)*(namedentr + identr); }
    res_dir_entry entries[1];
    // it's usually safe to assume that every res_dir contains
    // at least one res_dir_entry - check() complains otherwise
};

struct Resource::res_data
{
    LE32  offset;
    LE32  size;
    char  _[8]; // codepage, reserved
};

struct Resource::upx_rnode
{
    unsigned        id;
    upx_byte        *name;
    upx_rnode       *parent;
};

struct Resource::upx_rbranch : public upx_rnode
{
    unsigned        nc;
    upx_rnode       **children;
    res_dir         data;
};

struct Resource::upx_rleaf : public upx_rnode
{
    upx_rleaf       *next;
    unsigned        newoffset;
    res_data        data;
};

Resource::Resource(const upx_byte *p)
{
    init(p);
	
}

Resource::~Resource()
{
    if (root) destroy (root,0);
}


unsigned Resource::dirsize() const
{
    return ALIGN_UP(dsize + ssize, 4u);
}

bool Resource::next()
{
    // wow, builtin autorewind... :-)
    return (current = current ? current->next : head) != NULL;
}


unsigned Resource::itype() const
{
    return current->parent->parent->id;
}

const upx_byte *Resource::ntype() const
{
    return current->parent->parent->name;
}

unsigned Resource::size() const
{
    return ALIGN_UP(current->data.size,4);
}

unsigned Resource::offs() const
{
    return current->data.offset;
}

unsigned &Resource::newoffs()
{
    return current->newoffset;
}

void Resource::dump() const
{
    dump(root,0);
}

unsigned Resource::iname() const
{
    return current->parent->id;
}

const upx_byte *Resource::nname() const
{
    return current->parent->name;
}

/*
unsigned ilang() const {return current->id;}
const upx_byte *nlang() const {return current->name;}
*/

void Resource::init(const upx_byte *res)
{
    assert(sizeof(res_dir_entry) == 8);
    assert(sizeof(res_dir) == 16 + 8);
    assert(sizeof(res_data) == 16);
	//    COMPILE_TIME_ASSERT_ALIGNED1(res_dir_entry)
	//   COMPILE_TIME_ASSERT_ALIGNED1(res_dir)
	//   COMPILE_TIME_ASSERT_ALIGNED1(res_data)
	
    start = res;
    root = head = current = NULL;
    dsize = ssize = 0;
    check((const res_dir*) start,0);
    root = convert(start,NULL,0);
}

void Resource::check(const res_dir *node,unsigned level)
{
    int ic = node->identr + node->namedentr;
    if (ic == 0)
        return;
    for (const res_dir_entry *rde = node->entries; --ic >= 0; rde++)
        if (((rde->child & 0x80000000) == 0) ^ (level == 2))
            printf("unsupported resource structure");
        else if (level != 2)
            check((const res_dir*) (start + (rde->child & 0x7fffffff)),level + 1);
}

Resource::upx_rnode *Resource::convert(const void *rnode,
									   upx_rnode *parent,
									   unsigned level)
{
    if (level == 3)
    {
        const res_data *node = (const res_data *) rnode;
        upx_rleaf *leaf = new upx_rleaf;
        leaf->name = NULL;
        leaf->parent = parent;
        leaf->next = head;
        leaf->newoffset = 0;
        leaf->data = *node;
		
        head = leaf; // append node to a linked list for traversal
        dsize += sizeof(res_data);
        return leaf;
    }
	
    const res_dir *node = (const res_dir *) rnode;
    int ic = node->identr + node->namedentr;
    if (ic == 0)
        return NULL;
	
    upx_rbranch *branch = new upx_rbranch;
    branch->name = NULL;
    branch->parent = parent;
    branch->nc = ic;
    branch->children = new upx_rnode*[ic];
    branch->data = *node;
	
    for (const res_dir_entry *rde = node->entries + ic - 1; --ic >= 0; rde--)
    {
        upx_rnode *child = convert(start + (rde->child & 0x7fffffff),branch,level + 1);
        branch->children[ic] = child;
        child->id = rde->tnl;
        if (child->id & 0x80000000)
        {
            const upx_byte *p = start + (child->id & 0x7fffffff);
            const unsigned len = 2 + 2 * get_le16(p);
            child->name = new upx_byte[len];
            memcpy(child->name,p,len); // copy unicode string
            ssize += len; // size of unicode strings
        }
    }
    dsize += node->Sizeof();
    return branch;
}

void Resource::build(const upx_rnode *node, unsigned &bpos,
					 unsigned &spos, unsigned level)
{
    if (level == 3)
    {
        res_data *l = (res_data*) (newstart + bpos);
        const upx_rleaf *leaf = (const upx_rleaf*) node;
        *l = leaf->data;
        if (leaf->newoffset)
            l->offset = leaf->newoffset;
        bpos += sizeof(*l);
        return;
    }
    res_dir * const b = (res_dir*) (newstart + bpos);
    const upx_rbranch *branch = (const upx_rbranch*) node;
    *b = branch->data;
    bpos += b->Sizeof();
    res_dir_entry *be = b->entries;
    for (unsigned ic = 0; ic < branch->nc; ic++, be++)
    {
        be->tnl = branch->children[ic]->id;
        be->child = bpos + ((level < 2) ? 0x80000000 : 0);
		
        const upx_byte *p;
        if ((p = branch->children[ic]->name) != 0)
        {
            be->tnl = spos + 0x80000000;
            memcpy(newstart + spos,p,get_le16(p) * 2 + 2);
            spos += get_le16(p) * 2 + 2;
        }
		
        build(branch->children[ic],bpos,spos,level + 1);
    }
}

upx_byte *Resource::build()
{
    newstart = new upx_byte [dirsize()];
    unsigned bpos = 0,spos = dsize;
    build(root,bpos,spos,0);
	
    // dirsize() is 4 bytes aligned, so we may need to zero
    // up to 2 bytes to make valgrind happy
    while (spos < dirsize())
        newstart[spos++] = 0;
	
    return newstart;
}

void Resource::destroy(upx_rnode *node,unsigned level)
{
    delete [] node->name; node->name = NULL;
    if (level != 3)
    {
        upx_rbranch * const branch = (upx_rbranch *) node;
        for (int ic = branch->nc; --ic >= 0; )
            destroy(branch->children[ic],level + 1);
        delete [] branch->children; branch->children = NULL;
    }
    delete node;
}


void Resource::dump(const upx_rnode *node,unsigned level) const
{
    if (level)
    {
        for (unsigned ic = 1; ic < level; ic++)
            printf("\t\t");
        if (node->name)
            lame_print_unicode(node->name);
        else
            printf("0x%x",node->id);
        printf("\n");
    }
    if (level == 3)
        return;
    const upx_rbranch * const branch = (const upx_rbranch *) node;
    for (unsigned ic = 0; ic < branch->nc; ic++)
        dump(branch->children[ic],level + 1);
}

void Resource::clear(upx_byte *node,unsigned level,Interval *iv)
{
    if (level == 3)
        iv->add(node,sizeof (res_data));
    else
    {
        const res_dir * const rd = (res_dir*) node;
        const unsigned n = rd->identr + rd->namedentr;
        const res_dir_entry *rde = rd->entries;
        for (unsigned ic = 0; ic < n; ic++, rde++)
            clear(newstart + (rde->child & 0x7fffffff),level + 1,iv);
        iv->add(rd,rd->Sizeof());
    }
}

bool Resource::clear()
{
    newstart = const_cast<upx_byte*> (start);
    Interval iv(newstart);
    clear(newstart,0,&iv);
    iv.flatten();
    if (iv.ivnum == 1)
        iv.clear();
#if defined(DEBUG)
    if (opt->verbose > 3)
        iv.dump();
#endif
    return iv.ivnum == 1;
}


class Export : private nocopy
{
	struct export_dir_t
	{
		char  _[12]; // flags, timedate, version
		LE32  name;
		char  __[4]; // ordinal base
		LE32  functions;
		LE32  names;
		LE32  addrtable;
		LE32  nameptrtable;
		LE32  ordinaltable;
	}
	__attribute_packed;
	
	export_dir_t edir;
	char  *ename;
	char  *functionptrs;
	char  *ordinals;
	char  **names;
	
	char  *base;
	unsigned size;
	Interval iv;
	
    public:
        Export(char *_base);
        ~Export();
		
        void convert(unsigned eoffs,unsigned esize);
        void build(char *base,unsigned newoffs);
        unsigned getsize() const { return size; }
};

static unsigned unoptimizeReloc32(upx_byte **in, upx_byte *image, char **out, int bswap)
{
	upx_byte *p;
	unsigned relocn = 0;
    for (p = *in; *p; p++, relocn++)
	{
		if (*p >= 0xF0)
        {
            if (*p == 0xF0 && get_le16(p+1) == 0)
                p += 4;
            p += 2;
		}
	}
	
	//fprintf(stderr,"relocnum=%x\n",relocn);
	*out = (char *) malloc(4 * relocn + 4); // one extra data
	LE32 *outp = (LE32*) (unsigned char *) *out;
	LE32 *relocs = outp;
	unsigned jc = (unsigned) -4;
	for (p = *in; *p; p++)
	{
		if (*p < 0xF0)
			jc += *p;
		else
		{
			unsigned dif = (*p & 0x0F)*0x10000 + get_le16(p+1);
			p += 2;
			if (dif == 0)
			{
				dif = get_le32(p+1);
				p += 4;
			}
			jc += dif;
		}
		*relocs++ = jc;
		if (bswap && image)
			acc_ua_swab32s(image + jc);
	}
	//fprintf(stderr,"relocnum=%x\n",relocn);
	*in = p+1;
	return (unsigned) (relocs - outp);
}

void rebuildRelocs(upx_byte *& extrainfo)
{
    if (!ODADDR(PEDIR_RELOC) || !ODSIZE(PEDIR_RELOC) || (oh.flags & RELOCS_STRIPPED))
        return;
	MessageBoxA(NULL, "貌似有重定位哦!", "温馨提示", 0);
	
	if (ODSIZE(PEDIR_RELOC) == 8) // some tricky dlls use this
	{
		memcpy(obuf + ODADDR(PEDIR_RELOC) - rvamin, "\x0\x0\x0\x0\x8\x0\x0\x0", 8);
		return;
	}
	
	upx_byte *rdata = obuf + get_le32(extrainfo);
	const upx_byte big = extrainfo[4];
	extrainfo += 5;
	
	OPTR_I(upx_byte, p, rdata);
	char* wrkmem = NULL;
	unsigned relocn = unoptimizeReloc32(&rdata, obuf, &wrkmem,1);
	unsigned r16 = 0;
	if (big & 6)                // 16 bit relocations
	{
		const LE32 *q = (LE32*) rdata;
		while (*q++)
			r16++;
		if ((big & 6) == 6)
			while (*++q)
				r16++;
	}
	Reloc rel(relocn + r16);
	
	if (big & 6)
	{
		LE32 *q = (LE32*) rdata;
		while (*q)
			rel.add(*q++ + rvamin,(big & 4) ? 2 : 1);
		if ((big & 6) == 6)
			while (*++q)
				rel.add(*q + rvamin,1);
			rdata = (upx_byte*) q;
	}
	
	//memset(p,0,rdata - p);
	
	for (unsigned ic = 0; ic < relocn; ic++)
	{
		p = obuf + get_le32(wrkmem + 4 * ic);
		set_le32(p, get_le32((unsigned char *)p) + imNT_Headers->OptionalHeader.ImageBase + rvamin);
		rel.add(rvamin + get_le32(wrkmem + 4 * ic),3);
	}
	rel.finish (oxrelocs, soxrelocs);
	
	if (/*opt->win32_pe.strip_relocs &&*/ !isdll)
	{
		//	  obuf.clear(ODADDR(PEDIR_RELOC) - rvamin, ODSIZE(PEDIR_RELOC));
		ODADDR(PEDIR_RELOC) = 0;
		soxrelocs = 0;
		// FIXME: try to remove the original relocation section somehow
	}
	else
	{
		memcpy(obuf + ODADDR(PEDIR_RELOC) - rvamin,oxrelocs,soxrelocs);
	}
	delete [] oxrelocs; oxrelocs = NULL;
	delete wrkmem;
	
	ODSIZE(PEDIR_RELOC) = soxrelocs;
	
}


void rebuildResources(upx_byte *& extrainfo)
{
	
    if (ODSIZE(PEDIR_RESOURCE) == 0 || IDSIZE(PEDIR_RESOURCE) == 0)
        return;
	
    icondir_count = get_le16(extrainfo);
    extrainfo += 2;
	
    const unsigned vaddr = IDADDR(PEDIR_RESOURCE);
	//TOFIX
    const upx_byte *r = ibuf - pISHUpxRes->VirtualAddress; //isection[ih.objects - 1].vaddr;
    Resource res(r + vaddr);
    while (res.next())
        if (res.offs() > vaddr)
        {
            unsigned origoffs = get_le32(r + res.offs() - 4);
            res.newoffs() = origoffs;
            memcpy(obuf + origoffs - rvamin,r + res.offs(),res.size());
            if ((char*)(icondir_count && res.itype()) == RT_GROUP_ICON)
            {
                set_le16(obuf + origoffs - rvamin + 4,icondir_count);
                icondir_count = 0;
            }
        }
		upx_byte *p = res.build();
		// write back when the original is zeroed
		if (get_le32(obuf + ODADDR(PEDIR_RESOURCE) - rvamin + 12) == 0)
			memcpy(obuf + ODADDR(PEDIR_RESOURCE) - rvamin,p,res.dirsize());
		delete [] p;
}

void rebuildImports(upx_byte *& extrainfo)
{
    if (ODADDR(PEDIR_IMPORT) == 0
		/* || ODSIZE(PEDIR_IMPORT) <= sizeof(import_desc)*/)
        return;
	
	//    const upx_byte * const idata = obuf + get_le32(extrainfo);
    OPTR_C(const upx_byte, idata, obuf + get_le32(extrainfo));
    const unsigned inamespos = get_le32(extrainfo + 4);
    extrainfo += 8;
	
    unsigned sdllnames = 0;
	
	//    const upx_byte *import = ibuf + IDADDR(PEDIR_IMPORT) - isection[2].vaddr;
	//    const upx_byte *p;
    IPTR_I(const upx_byte, import, ibuf + IDADDR(PEDIR_IMPORT) - pISHUpxRes->VirtualAddress);
	
    OPTR(const upx_byte, p);
	
    for (p = idata; get_le32(p) != 0; ++p)
    {
        const upx_byte *dname = get_le32(p) + import;
		//        ICHECK(dname, 1);
        const unsigned dlen = strlen(dname);
		//       ICHECK(dname, dlen + 1);
		
        sdllnames += dlen + 1;
        for (p += 8; *p;)
            if (*p == 1)
                p += strlen(++p) + 1;
            else if (*p == 0xff)
                p += 3; // ordinal
            else
                p += 5;
    }
    sdllnames = ALIGN_UP(sdllnames, 2u);
	
    upx_byte * const Obuf = (unsigned char*)obuf - rvamin;
    import_desc * const im0 = (import_desc*) (Obuf + ODADDR(PEDIR_IMPORT));
    import_desc *im = im0;
    upx_byte *dllnames = Obuf + inamespos;
    upx_byte *importednames = dllnames + sdllnames;
    upx_byte * const importednames_start = importednames;
	
    for (p = idata; get_le32(p) != 0; ++p)
    {
        // restore the name of the dll
        const upx_byte *dname = get_le32(p) + import;
		//        ICHECK(dname, 1);
        const unsigned dlen = strlen(dname);
		//    ICHECK(dname, dlen + 1);
		
        const unsigned iatoffs = get_le32(p + 4) + rvamin;
        if (inamespos)
        {
            // now I rebuild the dll names
			//     OCHECK(dllnames, dlen + 1);
            strcpy(dllnames, dname);
            im->dllname = ptr_diff(dllnames,Obuf);
            printf("\ndll: %s:",dllnames);
            dllnames += dlen + 1;
        }
        else
        {
			//            OCHECK(Obuf + im->dllname, dlen + 1);
            strcpy(Obuf + im->dllname, dname);
        }
        im->iat = iatoffs;
		
		//        LE32 *newiat = (LE32 *) (Obuf + iatoffs);
        OPTR_I(LE32, newiat, (LE32 *) (Obuf + iatoffs));
		
        // restore the imported names+ordinals
        for (p += 8; *p; ++newiat)
            if (*p == 1)
            {
                const unsigned ilen = strlen(++p) + 1;
                if (inamespos)
                {
                    if (ptr_diff(importednames, importednames_start) & 1)
                        importednames -= 1;
                    memcpy(importednames + 2, p, ilen);
                    printf(" %s",importednames+2);
                    *newiat = ptr_diff(importednames, Obuf);
                    importednames += 2 + ilen;
                }
                else
                {
					//   OCHECK(Obuf + *newiat + 2, ilen + 1);
                    strcpy(Obuf + *newiat + 2, p);
                }
                p += ilen;
            }
            else if (*p == 0xff)
            {
                *newiat = get_le16(p + 1) + 0x80000000;
				printf(" %x",(unsigned)*newiat);
                p += 3;
            }
            else
            {
                *newiat = get_le32(get_le32(p + 1) + import);
                assert(*newiat & 0x80000000);
                p += 5;
            }
			*newiat = 0;
			im++;
    }
    //memset(idata,0,p - idata);
}

///////////////////////////////////////////////////////////////
void jobdone()
{
	memset(szFileName, 0, sizeof(szFileName));
	if (MapOfFile != NULL)
	{
		VirtualFree(MapOfFile, 0, MEM_RELEASE);
		MapOfFile = NULL;
	}
	if (MapOfOverlay != NULL)
	{
		VirtualFree(MapOfOverlay, 0, MEM_RELEASE);	
		MapOfOverlay = NULL;
	}
	SizeOfOverlay = 0;
	bDLL = FALSE;
}

//取出内存中的PE头
void GetPeInfo(LPVOID pMzStart, LPVOID pPeStart,PIMAGE_DOS_HEADER& pDosHeader, PIMAGE_NT_HEADERS& pNtHeader)
{
	if (pMzStart != 0)
	{
		pDosHeader = (PIMAGE_DOS_HEADER)((char*)pMzStart);
		
		if (pPeStart != 0)
		{
			pNtHeader = (PIMAGE_NT_HEADERS)((char*)pPeStart);
		}
		else
		{
			pNtHeader = (PIMAGE_NT_HEADERS)((char*)pMzStart + pDosHeader->e_lfanew);
		}
	}
}

//将pe按windows加载器方法加载到内存
LPVOID MapFileToMemory(const char* strFileName, DWORD& dwImageSize)
{
	printf("\r\n开始Load文件到内存...");
	
	HANDLE hFile = CreateFile(strFileName, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hFile == INVALID_HANDLE_VALUE)
	{	//test File Handle
		printf("文件打开失败");
		return NULL; 
	} 
	
	//映射文件
	DWORD dwFileSize = GetFileSize(hFile,NULL);
	
	LPVOID MapOfFile = VirtualAlloc(NULL, dwFileSize, MEM_COMMIT, PAGE_READWRITE);
	DWORD dwNum = 0;
    BOOL bRet = ReadFile(hFile, MapOfFile, dwFileSize, &dwNum, NULL);
	CloseHandle(hFile); 
	if (dwNum != dwFileSize)
	{
		printf("读取文件失败");
		VirtualFree(MapOfFile, 0, MEM_RELEASE);
		return NULL; 
	}
	assert(bRet);
	
	//计算映象大小
	DWORD dwPESignOffset = *(DWORD *)((char*)MapOfFile + 0x3c);
    IMAGE_NT_HEADERS *pINHOld = (IMAGE_NT_HEADERS *)((char*)MapOfFile + dwPESignOffset);
	dwImageSize = pINHOld->OptionalHeader.SizeOfImage;
	DWORD dwHeadSize = pINHOld->OptionalHeader.SizeOfHeaders;
	
	//映射文件头
	HANDLE hModule = VirtualAlloc(NULL, dwImageSize, MEM_COMMIT, PAGE_READWRITE);
	if (hModule == NULL)
	{
		printf("申请内存失败");
		VirtualFree(MapOfFile, 0, MEM_RELEASE);
		return NULL; 
	}
	memcpy(hModule, MapOfFile, (dwHeadSize + 0x1ff)/0x200*0x200);
	//重新定位到PE
	PIMAGE_DOS_HEADER pIDH = (PIMAGE_DOS_HEADER)hModule;
	PIMAGE_NT_HEADERS pINH = (PIMAGE_NT_HEADERS)((DWORD)hModule + pIDH->e_lfanew);
	PIMAGE_SECTION_HEADER pISH = (PIMAGE_SECTION_HEADER) ((DWORD)pINH + sizeof(IMAGE_NT_HEADERS) + pINH->FileHeader.SizeOfOptionalHeader - sizeof(IMAGE_OPTIONAL_HEADER));
	
	DWORD dwSecAlignment = pINH->OptionalHeader.SectionAlignment;
	DWORD dwFileAlignment = pINH->OptionalHeader.FileAlignment;
	
	DWORD dwSectionAlignMask = dwSecAlignment - 1;  //各节在load后内存中的对齐掩码
	//	DWORD dwFileAlignMask = dwFileAlignment - 1;  
	
	DWORD dwSectionNum = pINH->FileHeader.NumberOfSections;
	
	//映射各个区段
	for (DWORD i = 0; i < dwSectionNum; i++)
	{
		//判定各节的对齐属性，合法不
		if(pISH[i].VirtualAddress & dwSectionAlignMask)
		{
			//出现非法节
			VirtualFree(hModule, 0, MEM_RELEASE);
			VirtualFree(MapOfFile, 0, MEM_RELEASE);
			return NULL;
		}
		
		DWORD dwPointToRaw = ((DWORD)(pISH[i].PointerToRawData / dwFileAlignment)) * dwFileAlignment;
		
		if (pISH[i].SizeOfRawData + pISH[i].PointerToRawData > dwFileSize)
		{
			pISH[i].SizeOfRawData = dwFileSize - pISH[i].PointerToRawData;
		}
		
        pISH[i].SizeOfRawData = (pISH[i].SizeOfRawData + dwFileAlignment - 1)/dwFileAlignment * dwFileAlignment;
		
		pISH[i].Misc.VirtualSize = (pISH[i].Misc.VirtualSize + dwSecAlignment - 1)/dwSecAlignment * dwSecAlignment;
		
		if(pISH[i].SizeOfRawData > pISH[i].Misc.VirtualSize) 
		{
			pISH[i].SizeOfRawData = pISH[i].Misc.VirtualSize;
		}
		
		memcpy((void*)((DWORD)hModule + pISH[i].VirtualAddress), (void*)((DWORD)MapOfFile + dwPointToRaw), pISH[i].SizeOfRawData);
		
		//重新计算实际大小，这里会压缩一下大小
	//	PBYTE p = (PBYTE)((DWORD)hModule + pISH[i].VirtualAddress + pISH[i].Misc.VirtualSize - 1);
	//	while((*p==0) && ((DWORD)p > (DWORD)hModule + pISH[i].VirtualAddress)) 
	//	{
	//		p--;
	//	}
	//	p++;
	//	pISH[i].SizeOfRawData = (DWORD)p - (DWORD)hModule - pISH[i].VirtualAddress;
	}
	printf("Load文件成功!\r\n");
	
	//进行 重定位处理
	if(pINH->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].Size > 0 && pINH->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress > 0)
	{
		//取第一个重定位块
		IMAGE_BASE_RELOCATION *pIBR = (IMAGE_BASE_RELOCATION *)((char*)hModule +  pINH->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress);
		
		if (::IsBadReadPtr(pIBR, sizeof(pIBR)))
		{
			printf("重定位异常!\r\n");
			goto fixres;
		}
		
		DWORD dwDifference = (DWORD)hModule - pINH->OptionalHeader.ImageBase;
		
		if (dwDifference == 0 || (pINH->FileHeader.Characteristics & IMAGE_FILE_DLL) == 0)
		{
			printf("不需要处理重定位!\r\n");
			goto fixres;
		}
		
		//循环每个重定位块
		for(int j = 0; pIBR->VirtualAddress != 0; j++)
		{
			long lCount = (pIBR->SizeOfBlock - IMAGE_SIZEOF_BASE_RELOCATION ) / sizeof(WORD);;
			
			//对这个页面中的每个需重定位的项进行处理
			short int *pRelocationItem = (short int *)((char *)pIBR + sizeof(IMAGE_BASE_RELOCATION));
			for(int nIndex = 0; nIndex < lCount; nIndex++)
			{
				WORD nOffset = (WORD)(pRelocationItem[nIndex] &0x0fff);
				WORD nType = (WORD)(pRelocationItem[nIndex] >> 12);
				
				//虽然windows定义了很多重定位类型，但是在PE文件中只能见到0和3两种
				if(nType == 3)
				{
					*(DWORD*)((char*)hModule + pIBR->VirtualAddress + nOffset) += dwDifference;
				}
				else if(nType == 0)
				{
					//什么也不做
				}
			}
			
			//pIBR指向下一个重定位块
			pIBR = (IMAGE_BASE_RELOCATION *)(pRelocationItem + lCount);
		}
		printf("加载重定位表成功!\r\n");
	}
	else
	{
		printf("没有重定位!\r\n");
	}
	
fixres:
	
    VirtualFree(MapOfFile, 0, MEM_RELEASE);
	
	return hModule;
	
}

//内存查找
DWORD FindInMemoryEx(const HGLOBAL hMem, const DWORD dwStartSearch, const int* pTargetStr, const long lStrSize, const long lSearchSize = 0x1000)
{
	DWORD dwResult = 0;
	int iFind = 0;
	long lRealSearchSize = lSearchSize - dwStartSearch;
	for (long lOffset = 0; lOffset < lRealSearchSize; lOffset++)
	{
		iFind = 0;
		
		for (long lPos = 0; lPos < lStrSize; lPos++)
		{
			if ((*(pTargetStr + lPos) == -1) || 0 == ::memcmp((LPBYTE)hMem + dwStartSearch + lOffset + lPos, pTargetStr + lPos, 1))
			{//匹配
				continue;
			}
			//不匹配
			iFind = 1;
			break;
		}
		if (iFind == 0)
		{//找到
			dwResult = dwStartSearch + lOffset;
			break;
		}	
	}
	return dwResult;
} 


Export::Export(char *_base) : base(_base), iv(_base)
{
    assert(sizeof(export_dir_t) == 40);
    ename = functionptrs = ordinals = NULL;
    names = NULL;
    memset(&edir,0,sizeof(edir));
    size = 0;
}

Export::~Export()
{
    free(ename);
    delete [] functionptrs;
    delete [] ordinals;
    for (unsigned ic = 0; ic < edir.names + edir.functions; ic++)
        free(names[ic]);
    delete [] names;
}

void Export::convert(unsigned eoffs,unsigned esize)
{
    memcpy(&edir,base + eoffs,sizeof(export_dir_t));
    size = sizeof(export_dir_t);
    iv.add(eoffs,size);
	
    unsigned len = strlen(base + edir.name) + 1;
    ename = strdup(base + edir.name);
    size += len;
    iv.add(edir.name,len);
	
    len = 4 * edir.functions;
    functionptrs = new char[len + 1];
    memcpy(functionptrs,base + edir.addrtable,len);
    size += len;
    iv.add(edir.addrtable,len);
	
    unsigned ic;
    names = new char* [edir.names + edir.functions + 1];
    for (ic = 0; ic < edir.names; ic++)
    {
        char *n = base + get_le32(base + edir.nameptrtable + ic * 4);
        len = strlen(n) + 1;
        names[ic] = strdup(n);
        size += len;
        iv.add(get_le32(base + edir.nameptrtable + ic * 4),len);
    }
    iv.add(edir.nameptrtable,4 * edir.names);
    size += 4 * edir.names;
	
    LE32 *fp = (LE32*) functionptrs;
    // export forwarders
    for (ic = 0; ic < edir.functions; ic++)
        if (fp[ic] >= eoffs && fp[ic] < eoffs + esize)
        {
            char *forw = base + fp[ic];
            len = strlen(forw) + 1;
            iv.add(forw,len);
            size += len;
            names[ic + edir.names] = strdup(forw);
        }
        else
            names[ic + edir.names] = NULL;
		
		len = 2 * edir.names;
		ordinals = new char[len + 1];
		memcpy(ordinals,base + edir.ordinaltable,len);
		size += len;
		iv.add(edir.ordinaltable,len);
		iv.flatten();
		if (iv.ivnum == 1)
			iv.clear();
#if defined(DEBUG)
		else
			iv.dump();
#endif
}

void Export::build(char *newbase, unsigned newoffs)
{
    char * const functionp = newbase + sizeof(edir);
    char * const namep = functionp + 4 * edir.functions;
    char * const ordinalp = namep + 4 * edir.names;
    char * const enamep = ordinalp + 2 * edir.names;
    char * exports = enamep + strlen(ename) + 1;
	
    edir.addrtable = newoffs + ptr_diff(functionp, newbase);
    edir.ordinaltable = newoffs + ptr_diff(ordinalp, newbase);
    memcpy(ordinalp,ordinals,2 * edir.names);
	
    edir.name = newoffs + ptr_diff(enamep, newbase);
    strcpy(enamep,ename);
    edir.nameptrtable = newoffs + ptr_diff(namep, newbase);
    unsigned ic;
    for (ic = 0; ic < edir.names; ic++)
    {
        strcpy(exports,names[ic]);
        set_le32(namep + 4 * ic,newoffs + ptr_diff(exports, newbase));
        exports += strlen(exports) + 1;
    }
	
    memcpy(functionp,functionptrs,4 * edir.functions);
    for (ic = 0; ic < edir.functions; ic++)
        if (names[edir.names + ic])
        {
            strcpy(exports,names[edir.names + ic]);
            set_le32(functionp + 4 * ic,newoffs + ptr_diff(exports, newbase));
            exports += strlen(exports) + 1;
        }
		
		memcpy(newbase,&edir,sizeof(edir));
		assert(exports - newbase == (int) size);
}

void processExports(Export *xport) // pass1
{
    soexport = ALIGN_UP(IDSIZE(PEDIR_EXPORT),4);
    if (soexport == 0)
        return;
    if (!isdll/* && opt->win32_pe.compress_exports*/)
    {
        printf("exports compressed, --compress-exports=0 might be needed");
        soexport = 0;
        return;
    }
    xport->convert(IDADDR(PEDIR_EXPORT),IDSIZE(PEDIR_EXPORT));
    soexport = ALIGN_UP(xport->getsize(), 4u);
    oexport = new upx_byte[soexport];
    memset(oexport, 0, soexport);
}

void processExports(Export *xport,unsigned newoffs) // pass2
{
    if (soexport)
        xport->build((char*) oexport,newoffs);
}


void rebuildExports()
{
    if (ODSIZE(PEDIR_EXPORT) == 0 || ODADDR(PEDIR_EXPORT) == IDADDR(PEDIR_EXPORT))
        return; // nothing to do
	
	//    opt->win32_pe.compress_exports = 0;
    Export xport((char*)(unsigned char*) ibuf -  pISHUpxRes->VirtualAddress);
    processExports(&xport);
    processExports(&xport,ODADDR(PEDIR_EXPORT));
    memcpy(obuf + ODADDR(PEDIR_EXPORT) - rvamin,oexport,soexport);
}

void ProcessErrorMessage(/*char* ErrorText*/)
{
	char ErrorMsg[400];
	LPVOID lpMsgBuf;
	FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | //自动分配消息缓冲区
		FORMAT_MESSAGE_FROM_SYSTEM, //从系统获取信息
		NULL,
		GetLastError(), //获取错误信息标识
		MAKELANGID(LANG_NEUTRAL,SUBLANG_DEFAULT),//使用系统缺省语言
		(LPTSTR)&lpMsgBuf, //消息缓冲区
		0,
		NULL);
	sprintf(ErrorMsg, "当前错误原因: %s", lpMsgBuf);
	MessageBox(NULL,ErrorMsg, "错误", MB_ICONSTOP);//弹出错误提示框
	LocalFree(lpMsgBuf);
}

///////////////////////////////////////////////////////////////
void KByS()
{
	HANDLE		hFile;
	
	hFile = CreateFile(szFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hFile == INVALID_HANDLE_VALUE)
	{
		ProcessErrorMessage();
		if (bChinese)
			strcpy(szMessage, "打开文件失败");
		else
			strcpy(szMessage, "fail to open the file");
		return;
	}
	if (!IsPE(hFile))
	{
		if (bChinese)
			strcpy(szMessage, "无效PE");
		else
			strcpy(szMessage, "invalid PE file");
		CloseHandle(hFile);
		return;
	}
	
	//映射文件到内存
	DWORD dwImageSize = 0;
	lpFileMap = MapFileToMemory(szFileName, dwImageSize);
	
	//定位加壳后的PE头
	imDos_Headers = (PIMAGE_DOS_HEADER)lpFileMap;	//设置初始指针地址
	imNT_Headers = (PIMAGE_NT_HEADERS)((char *)imDos_Headers + imDos_Headers->e_lfanew);//NT头指针地址
	
	DWORD dwNewSectionNum = imNT_Headers->FileHeader.NumberOfSections;
	
	//设置PE指针
	pISHUpx0 = (PIMAGE_SECTION_HEADER)((char *)imNT_Headers + sizeof(DWORD) + sizeof(IMAGE_FILE_HEADER) + imNT_Headers->FileHeader.SizeOfOptionalHeader);
	pISHUpx1 = (pISHUpx0 + 1);
	pISHUpxRes = (pISHUpx1 + 1);
	
	//读取overlay
	OverlayFile(hFile);

	//查找自解码结束地址
	int iIatStart[] = {0x8B, 0x07, 0x09, 0xC0, 0x74, -1, 0x8B, 0x5F, 0x04, 0x8D};
	bool bOldVersion = false;

	DWORD dwEp = imNT_Headers->OptionalHeader.AddressOfEntryPoint;

	DWORD dwIatBegin = 	::FindInMemoryEx(lpFileMap, dwEp, iIatStart, 10, dwImageSize);
	if (0 == dwIatBegin)
	{ 
		if (bChinese)
			strcpy(szMessage, "脱壳失败 code = -1");
		else
			strcpy(szMessage, "job fail code = -1");
		CloseHandle(hFile);
		jobdone();
		return;
	}
	
	//查找入口点
	int szEpMagic[] = {0x60, 0xBE, -1, -1, -1, -1, 0x8D, 0xBE};
	int szEpMagicOld[] = {0x60, 0xE8, -1, -1, -1, -1, 0x83, 0xCD};
	dwEp = ::FindInMemoryEx(lpFileMap, 0, szEpMagic, 8, dwImageSize);
	if (dwEp == 0)
	{
		bOldVersion = true; //旧版本
		dwEp = ::FindInMemoryEx(lpFileMap, 0, szEpMagicOld, 8, dwImageSize);
		if (dwEp == 0)
		{
			if (bChinese)
				strcpy(szMessage, "脱壳失败 code = -3");
			else
				strcpy(szMessage, "job fail code = -3");
			return;
		}
	}
	
	
	DWORD dwIatTable = 0;
	try
	{//这个try里面准备 解码区段和修复跳转表
		char* szEp = (char*)lpFileMap + dwEp;

		//保存EDI
		*(char*)((char*)lpFileMap + dwIatBegin) = (char)0x89;
		*(char*)((char*)lpFileMap + dwIatBegin + 1) = (char)0x3D;
		*(DWORD*)((char*)lpFileMap + dwIatBegin + 2) = (DWORD)&dwIatTable;
		//堆栈平衡
		*(char*)((char*)lpFileMap + dwIatBegin + 6) = (char)0x61;
		//制作返回
		*(char*)((char*)lpFileMap + dwIatBegin + 7) = (char)0xC3;
		
		//exe需要 手工重定位
		if (!bDLL)
		{
			if (bOldVersion)
			{//旧的版本不需要重定位，做得好一些
			}
			else
			{	
				DWORD dwOEsi = *(DWORD*)(szEp + 2);
				*(DWORD*)(szEp + 2) = dwOEsi - imNT_Headers->OptionalHeader.ImageBase + (DWORD)lpFileMap;
			}
		}
		
		DWORD dwOldProtect = 0;
		DWORD dwNewProtect = PAGE_EXECUTE_READWRITE;
		::VirtualProtect(lpFileMap, dwImageSize, dwNewProtect, &dwOldProtect);
		_asm
		{//解码区段和修复跳转表(以壳解壳)
			
			call szEp
		}
		::VirtualProtect(lpFileMap, dwImageSize, dwOldProtect, &dwNewProtect);
	}
	catch(...)
	{
		if (bChinese)
			strcpy(szMessage, "脱壳失败 code = -2");
		else
			strcpy(szMessage, "job fail code = -2");
		return;
	}
	
	DWORD dwSecionUpx0 = (DWORD)((char*)lpFileMap + pISHUpx0->VirtualAddress);

	if (bOldVersion)
	{//旧版
		if (bChinese)
			strcpy(szMessage, "脱壳失败 upx版本太老");
		else
			strcpy(szMessage, "job fail upx to old");
		return;
	}

	obuf = (UCHAR*)imDos_Headers + pISHUpx0->VirtualAddress;
	ibuf = (UCHAR*)imDos_Headers + pISHUpxRes->VirtualAddress;

	//找原始PE头
	int iOPeMagin[] = {0x50, 0x45, 0x00, 0x00};
	DWORD dwOriginPE = ::FindInMemoryEx(lpFileMap, dwIatTable - (DWORD)lpFileMap, iOPeMagin, 4, dwImageSize);
	if (dwOriginPE == 0)
	{
		if (bChinese)
			strcpy(szMessage, "脱壳失败 code = -8");
		else
			strcpy(szMessage, "job fail code = -8");
		return;
	}
	GetPeInfo((char*)lpFileMap, (char*)lpFileMap + dwOriginPE, pOldDosHeader, pOldNtHeader);
	
	//初始化 ih, oh
	memcpy(&ih, lpFileMap, sizeof (ih));
	memcpy(&oh, pOldNtHeader, sizeof (oh));
    unsigned objs = oh.objects;
    const unsigned iobjs = ih.objects;

	//下面找附属数据(UPX专为脱壳而增加)
	upx_byte * extrainfo = (UCHAR*)((char*)pOldNtHeader + sizeof(IMAGE_NT_HEADERS) - sizeof(IMAGE_OPTIONAL_HEADER32) + pOldNtHeader->FileHeader.SizeOfOptionalHeader + sizeof(IMAGE_SECTION_HEADER) * objs);     

	rebuildImports(extrainfo);
	rebuildRelocs(extrainfo);
    rebuildTls();
    rebuildExports();
 
	 if (iobjs == 4)
    {
		pISHUpxRes++;
		ibuf = (UCHAR*)imDos_Headers + pISHUpxRes->VirtualAddress;
	 }

    rebuildResources(extrainfo);
	
	// fill the data directory
	ODADDR(PEDIR_DEBUG) = 0;
	ODSIZE(PEDIR_DEBUG) = 0;
	ODADDR(PEDIR_IAT) = 0;
	ODSIZE(PEDIR_IAT) = 0;
	ODADDR(PEDIR_BOUNDIM) = 0;
	ODSIZE(PEDIR_BOUNDIM) = 0;

    oh.headersize = rvamin;
    oh.chksum = 0;

    // FIXME: ih.flags is checked here because of a bug in UPX 0.92
    if ((/*opt->win32_pe.strip_relocs && */!isdll) || (ih.flags & RELOCS_STRIPPED))
    {
        oh.flags |= RELOCS_STRIPPED;
        ODADDR(PEDIR_RELOC) = 0;
        ODSIZE(PEDIR_RELOC) = 0;
    }

	//下面开始写文件 基本就没有抄UPX的源码了
	//备份文件
	BackupSrcFile(szFileName);
	
	::SetFilePointer(hFile, 0, NULL, FILE_BEGIN);
	SetEndOfFile(hFile);
	
	int NumberOfBytesWritten;
	//写文件
	//写mz头 
	DWORD dwMzSize = ((imDos_Headers->e_lfanew > 0x40) ? imDos_Headers->e_lfanew : sizeof(IMAGE_DOS_HEADER));
	WriteFile(hFile, (char*)lpFileMap, dwMzSize, (LPDWORD)&NumberOfBytesWritten, NULL);    //注意这个函数第三个参数是必要的！
	
	//写NT头
	DWORD dwHeaderSize = sizeof(IMAGE_NT_HEADERS) - sizeof(IMAGE_OPTIONAL_HEADER32) + pOldNtHeader->FileHeader.SizeOfOptionalHeader + sizeof(IMAGE_SECTION_HEADER) * objs;
	SetFilePointer(hFile, pOldDosHeader->e_lfanew, NULL, FILE_BEGIN);
	WriteFile(hFile, (char*)pOldNtHeader, dwHeaderSize, (LPDWORD)&NumberOfBytesWritten, NULL);    //注意这个函数第三个参数是必要的！
	
	if (imDos_Headers->e_lfanew < 0x3C)
	{//某些被修改了的PE修复
		SetFilePointer(hFile, 0x3C, NULL, FILE_BEGIN);
		WriteFile(hFile, (char*)&imDos_Headers->e_lfanew, sizeof(DWORD), (LPDWORD)&NumberOfBytesWritten, NULL); 
	}
	
	PIMAGE_SECTION_HEADER pISH;
	DWORD dwFileAlignment = pOldNtHeader->OptionalHeader.FileAlignment;
	//遍历各个区段
	for (DWORD i = 0; i < objs; i++)
	{
		pISH = (PIMAGE_SECTION_HEADER)((char *)pOldNtHeader + sizeof(IMAGE_NT_HEADERS) - sizeof(IMAGE_OPTIONAL_HEADER32) + pOldNtHeader->FileHeader.SizeOfOptionalHeader +  sizeof(IMAGE_SECTION_HEADER) * i);
		
		//移动区段头
		SetFilePointer(hFile, pISH->PointerToRawData, NULL, FILE_BEGIN);
		
		DWORD dwSize = (pISH->SizeOfRawData + dwFileAlignment - 1)/dwFileAlignment * dwFileAlignment;
		//写入区段
		WriteFile(hFile, (char*)lpFileMap + pISH->VirtualAddress, dwSize, (LPDWORD)&NumberOfBytesWritten, NULL);
	}
	
	//写入overlay
	if (MapOfOverlay !=0 && SizeOfOverlay !=0)
	{
		DWORD dwWritten;
		WriteFile(hFile, MapOfOverlay, SizeOfOverlay, &dwWritten, NULL);
	}
	CloseHandle(hFile);
	jobdone();
	if (bChinese)
		strcpy(szMessage, "脱壳完成");
	else
		strcpy(szMessage, "job done");
	return;
}