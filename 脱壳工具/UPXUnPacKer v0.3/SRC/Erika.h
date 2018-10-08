#if !defined(ERIKAHEADER)
#define ERIKAHEADER
#pragma once

#include "stdio.h"
#include "assert.h"
#include <vector>

extern void KByS();



//一下是UPX中的一些定义
#define IPTR(type, var)         type* var = 0
#define OPTR(type, var)         type* var = 0
#define IPTR_I(type, var, v)    type* var = (v)
#define OPTR_I(type, var, v)    type* var = (v)
#define IPTR_C(type, var, v)    type* const var = (v)
#define OPTR_C(type, var, v)    type* const var = (v)

typedef UCHAR upx_byte;             
typedef WORD LE16;
typedef DWORD LE32;

#define ICHECK(x, size)     xcheck(x, size, ibuf, ibuf.getSize())
#define OCHECK(x, size)     xcheck(x, size, obuf, obuf.getSize())

#define imemset(a,b,c)      ICHECK(a,c), memset(a,b,c)
#define omemset(a,b,c)      OCHECK(a,c), memset(a,b,c)
#define imemcpy(a,b,c)      ICHECK(a,c), memcpy(a,b,c)
#define omemcpy(a,b,c)      OCHECK(a,c), memcpy(a,b,c)

inline char *strcpy(unsigned char *s1,const unsigned char *s2)
{
    return strcpy((char*) s1,(const char*) s2);
}

/*
inline int strcasecmp(const unsigned char *s1,const unsigned char *s2)
{
return strcasecmp((const char*) s1,(const char*) s2);
}*/

inline size_t strlen(const unsigned char *s)
{
    return strlen((const char*) s);
}

inline unsigned get_le16( void const* p )
{
	return  (unsigned) ((unsigned char const*) p) [1] << 8 |
		(unsigned) ((unsigned char const*) p) [0];
}

inline unsigned get_be16( void const* p )
{
	return  (unsigned) ((unsigned char const*) p) [0] << 8 |
		(unsigned) ((unsigned char const*) p) [1];
}

inline DWORD get_le32( void const* p )
{
	return  (DWORD) ((unsigned char const*) p) [3] << 24 |
		(DWORD) ((unsigned char const*) p) [2] << 16 |
		(DWORD) ((unsigned char const*) p) [1] <<  8 |
		(DWORD) ((unsigned char const*) p) [0];
}

inline DWORD  get_be32( void const* p )
{
	return  (DWORD) ((unsigned char const*) p) [0] << 24 |
		(DWORD) ((unsigned char const*) p) [1] << 16 |
		(DWORD) ((unsigned char const*) p) [2] <<  8 |
		(DWORD) ((unsigned char const*) p) [3];
}

inline void set_le16( void* p, unsigned n )
{
	((unsigned char*) p) [1] = (unsigned char) (n >> 8);
	((unsigned char*) p) [0] = (unsigned char) n;
}

inline void set_be16( void* p, unsigned n )
{
	((unsigned char*) p) [0] = (unsigned char) (n >> 8);
	((unsigned char*) p) [1] = (unsigned char) n;
}

inline void set_le32( void* p, DWORD n )
{
	((unsigned char*) p) [0] = (unsigned char) n;
	((unsigned char*) p) [1] = (unsigned char) (n >> 8);
	((unsigned char*) p) [2] = (unsigned char) (n >> 16);
	((unsigned char*) p) [3] = (unsigned char) (n >> 24);
}

inline void set_be32( void* p, DWORD n )
{
	((unsigned char*) p) [3] = (unsigned char) n;
	((unsigned char*) p) [2] = (unsigned char) (n >> 8);
	((unsigned char*) p) [1] = (unsigned char) (n >> 16);
	((unsigned char*) p) [0] = (unsigned char) (n >> 24);
}

inline void acc_ua_swab16s(void *p)
{
    set_be16(p, get_le16(p));
}

inline void acc_ua_swab32s(void *p)
{
    set_be32(p, get_le32(p));
}

inline DWORD Get4Code(DWORD dwOffset)
{
	return *(DWORD*)dwOffset;
}

inline char Get1Code(DWORD dwOffset)
{
	return *(char*)dwOffset;
}

inline int ptr_diff(const void *p1, const void *p2)
{
    assert(p1 != NULL); assert(p2 != NULL);
    ptrdiff_t d = (const char*) p1 - (const char*) p2;
    assert((int)d == d);
    return (int) d;
}

static void xcheck(const void *p, size_t plen, const void *b, size_t blen)
{
    const char *pp = (const char *) p;
    const char *bb = (const char *) b;
    if (pp < bb || pp > bb + blen || pp + plen > bb + blen)
	{
		MessageBox(NULL, "pointer out of range; take care!", "error", 0);
	}
}


#if 0
static void xcheck(size_t poff, size_t plen, const void *b, size_t blen)
{
    ACC_UNUSED(b);
    if (poff > blen || poff + plen > blen)
        throwCantUnpack("pointer out of range; take care!");
}
#endif

#define ICHECK(x, size)     xcheck(x, size, ibuf, ibuf.getSize())
#define OCHECK(x, size)     xcheck(x, size, obuf, obuf.getSize())

#define imemset(a,b,c)      ICHECK(a,c), memset(a,b,c)
#define omemset(a,b,c)      OCHECK(a,c), memset(a,b,c)
#define imemcpy(a,b,c)      ICHECK(a,c), memcpy(a,b,c)
#define omemcpy(a,b,c)      OCHECK(a,c), memcpy(a,b,c)

static void lame_print_unicode(const upx_byte *p)
{
    for (unsigned ic = 0; ic < get_le16(p); ic++)
        printf("%c",(char)p[ic * 2 + 2]);
}

#if 0
#define ALIGN_DOWN(a,b)     (((a) / (b)) * (b))
#define ALIGN_UP(a,b)       ALIGN_DOWN((a) + ((b) - 1), b)
#define ALIGN_GAP(a,b)      (ALIGN_UP(a,b) - (a))
#elif 1
template <class T>
inline T ALIGN_DOWN(const T& a, const T& b) { T r; r = (a / b) * b; return r; }
template <class T>
inline T ALIGN_UP  (const T& a, const T& b) { T r; r = ((a + b - 1) / b) * b; return r; }
template <class T>
inline T ALIGN_GAP (const T& a, const T& b) { T r; r = ALIGN_UP(a, b) - a; return r; }
#else
inline unsigned ALIGN_DOWN(unsigned a, unsigned b) { return (a / b) * b; }
inline unsigned ALIGN_UP  (unsigned a, unsigned b) { return ((a + b - 1) / b) * b; }
inline unsigned ALIGN_GAP (unsigned a, unsigned b) { return ALIGN_UP(a, b) - a; }
#endif

#if 1 && !defined(ALIGN_DOWN)
inline unsigned ALIGN_DOWN(unsigned a, const LE32& b) { return ALIGN_DOWN(a, (unsigned) b); }
inline unsigned ALIGN_DOWN(const LE32& a, unsigned b) { return ALIGN_DOWN((unsigned) a, b); }
inline unsigned ALIGN_UP  (unsigned a, const LE32& b) { return ALIGN_UP  (a, (unsigned) b); }
inline unsigned ALIGN_UP  (const LE32& a, unsigned b) { return ALIGN_UP  ((unsigned) a, b); }
#endif

#define IDSIZE(x)       imNT_Headers->OptionalHeader.DataDirectory[x].Size
#define IDADDR(x)       imNT_Headers->OptionalHeader.DataDirectory[x].VirtualAddress
#define ODSIZE(x)       pOldNtHeader->OptionalHeader.DataDirectory[x].Size
#define ODADDR(x)       pOldNtHeader->OptionalHeader.DataDirectory[x].VirtualAddress

enum {
	PEDIR_EXPORT    = 0,
        PEDIR_IMPORT    = 1,
        PEDIR_RESOURCE  = 2,
        PEDIR_EXCEPTION = 3,            // Exception table
        PEDIR_SEC       = 4,            // Certificate table (file pointer)
        PEDIR_RELOC     = 5,
        PEDIR_DEBUG     = 6,
        PEDIR_COPYRIGHT = 7,            // Architecture-specific data
        PEDIR_GLOBALPTR = 8,            // Global pointer
        PEDIR_TLS       = 9,
        PEDIR_LOADCONF  = 10,           // Load Config Table
        PEDIR_BOUNDIM   = 11,
        PEDIR_IAT       = 12,
        PEDIR_DELAYIMP  = 13,           // Delay Import Descriptor
        PEDIR_COMRT     = 14            // Com+ Runtime Header
};


enum {
        RELOCS_STRIPPED = 0x0001,
        EXECUTABLE      = 0x0002,
        LNUM_STRIPPED   = 0x0004,
        LSYMS_STRIPPED  = 0x0008,
        AGGRESSIVE_TRIM = 0x0010,
        TWO_GIGS_AWARE  = 0x0020,
        FLITTLE_ENDIAN  = 0x0080,
        BITS_32_MACHINE = 0x0100,
        DEBUG_STRIPPED  = 0x0200,
        REMOVABLE_SWAP  = 0x0400,
        SYSTEM_PROGRAM  = 0x1000,
        DLL_FLAG        = 0x2000,
        FBIG_ENDIAN     = 0x8000
    };



 struct pe_header_t
    {
        //NtHeader 0x0
        char    _[4];               // pemagic
		//FileHeader
        LE16    cpu;                //Machine
        LE16    objects;			//NumberOfSections
        char    __[12];             // timestamp + PointerToSymbolTable + NumberOfSymbols
        LE16    opthdrsize;			//SizeOfOptionalHeader
        LE16    flags;				//Characteristics
        // optional header
        char    ___[4];             // coffmagic + linkerversion
        LE32    codesize;
        // 0x20
        LE32    datasize;
        LE32    bsssize;
        LE32    entry;
        LE32    codebase;
        // 0x30
        LE32    database;
        // nt specific fields
        LE32    imagebase;
        LE32    objectalign;
        LE32    filealign;          // should set to 0x200 ?
        // 0x40
        char    ____[16];           // versions
        // 0x50
        LE32    imagesize;
        LE32    headersize;
        LE32    chksum;             // should set to 0
        LE16    subsystem;
        LE16    dllflags;
        // 0x60
        char    _____[20];          // stack + heap sizes
        // 0x74
        LE32    ddirsentries;       // usually 16

        struct ddirs_t
        {
            LE32    vaddr;
            LE32    size;
        }
        __attribute_packed;

        struct ddirs_t ddirs[16];
    };

struct nocopy
{
    inline nocopy() {}
private:
    nocopy(const nocopy &); // undefined
    nocopy& operator=(const nocopy &); // undefined
};

class Interval : private nocopy
{
	unsigned capacity;
	void *base;
public:
	struct interval
	{
		unsigned start, len;
	} *ivarr;
	
	unsigned ivnum;
	
	Interval(void *b);
	~Interval();
	
	void add(unsigned start,unsigned len);
	void add(const void *start,unsigned len);
	void add(const void *start,const void *end);
	void add(const Interval *iv);
	void flatten();
	
	void clear();
	void dump() const;
	
    private:
        static int __cdecl compare(const void *p1,const void *p2);
};



class Reloc : private nocopy
{
	upx_byte *start;
	unsigned size;
	
	void newRelocPos(void *p);
	
	struct reloc;
	reloc *rel;
	LE16 *rel1;
	unsigned counts[16];
	
    public:
        Reloc(upx_byte *,unsigned);
        Reloc(unsigned rnum);
        //
        bool next(unsigned &pos,unsigned &type);
        const unsigned *getcounts() const { return counts; }
        //
        void add(unsigned pos,unsigned type);
        void finish(upx_byte *&p,unsigned &size);
};


class Resource : private nocopy
{
	struct res_dir_entry;
	struct res_dir;
	struct res_data;
	struct upx_rnode;
	struct upx_rbranch;
	struct upx_rleaf;
	
	const upx_byte *start;
	upx_byte   *newstart;
	upx_rnode  *root;
	upx_rleaf  *head;
	upx_rleaf  *current;
	unsigned   dsize;
	unsigned   ssize;
	
	void check(const res_dir*,unsigned);
	upx_rnode *convert(const void *,upx_rnode *,unsigned);
	void build(const upx_rnode *,unsigned &,unsigned &,unsigned);
	void clear(upx_byte *,unsigned,Interval *);
	void dump(const upx_rnode *,unsigned) const;
	void destroy(upx_rnode *urd,unsigned level);
	
    public:
        Resource();
        Resource(const upx_byte *p);
        ~Resource();
        void init(const upx_byte *);
		
        unsigned dirsize() const;
        bool next();
		
        unsigned itype() const;
        const upx_byte *ntype() const;
        unsigned size() const;
        unsigned offs() const;
        unsigned &newoffs();
		
        upx_byte *build();
        bool clear();
		
        void dump() const;
        unsigned iname() const;
        const upx_byte *nname() const;
        /*
		unsigned ilang() const {return current->id;}
		const upx_byte *nlang() const {return current->name;}
		*/
};


/*
unsigned ilang() const {return current->id;}
const upx_byte *nlang() const {return current->name;}
*/

#endif