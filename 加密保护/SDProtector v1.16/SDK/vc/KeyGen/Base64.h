#ifndef __BASE64_CLASS_H__
#define __BASE64_CLASS_H__ 


class CBase64
{
public:
	CBase64();
	 ~CBase64();

	int   Decode(char * szDecoding, char * szOutput);
	void  Encode(char *szToEncoding,char *szEncoded, int nSize);


	void write_bits( UINT nBits, int nNumBts, LPTSTR szOutput, int& lp );
	UINT read_bits( int nNumBits, int* pBitsRead, int& lp );

	int m_nInputSize;
	int m_nBitsRemaining;
	ULONG m_lBitStorage;
	LPCTSTR m_szInput;

	 int m_nMask[9];
	 char  m_sBase64Alphabet[65];

};
CBase64::CBase64()
{
	strcpy(m_sBase64Alphabet,"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
        m_nMask[0]=0; //{ 0, 1, 3, 7, 15, 31, 63, 127, 255 };
	for(int i=1;i<9;i++)
        m_nMask[i]=m_nMask[i-1]*2+1;
}

CBase64::~CBase64()
{
}
void CBase64::Encode(char *szToEncoding,char *szEncoded, int nSize)
{
	char *p=szEncoded;
	int nNumBits = 6;
	UINT nDigit;
	int lp = 0;

        
	if(!szToEncoding||!szEncoded)
	   return;
	m_szInput = szToEncoding;
	m_nInputSize = nSize;

	m_nBitsRemaining = 0;
	nDigit = read_bits( nNumBits, &nNumBits, lp );
	while( nNumBits > 0 )
	{
		*szEncoded=m_sBase64Alphabet[ (int)nDigit ];
		szEncoded++;
		nDigit = read_bits( nNumBits, &nNumBits, lp );
	}
	// Pad with '=' as per RFC 1521
	while( strlen(p) % 4 != 0 )
	{
		*szEncoded= '=';
		szEncoded++;
	}
}

// The size of the output buffer must not be less than
// 3/4 the size of the input buffer. For simplicity,
// make them the same size.
int CBase64::Decode(char * szDecoding, char * szOutput)
{
	char * sInput;
    int c;
	DWORD lp =0;
	int nDigit;
    int nDecode[ 256 ];
        if(!szDecoding||!szOutput)
	   return 0;
	
	sInput = szDecoding;
	if( strlen (sInput) == 0 )
		return 0;

	// Build Decode Table
	//
	for( int i = 0; i < 256; i++ ) 
		nDecode[i] = -2; // Illegal digit
	for( i=0; i < 64; i++ )
	{
		nDecode[ m_sBase64Alphabet[ i ] ] = i;
		nDecode[ m_sBase64Alphabet[ i ] | 0x80 ] = i; // Ignore 8th bit
		nDecode[ '=' ] = -1; 
		nDecode[ '=' | 0x80 ] = -1; // Ignore MIME padding char
    }

	// Clear the output buffer
	memset( szOutput, 0, strlen(sInput) + 1 );
        m_nBitsRemaining = 0;
	// Decode the Input
	//
	for( lp = 0, i = 0; lp < strlen(sInput); lp++ )
	{
		c = sInput[ lp ];
		nDigit = nDecode[ c & 0x7F ];
		if( nDigit < -1 ) 
		{
			return 0;
		} 
		else if( nDigit >= 0 ) 
			// i (index into output) is incremented by write_bits()
			write_bits( nDigit & 0x3F, 6, szOutput, i );
    }	
	return i;
}




UINT CBase64::read_bits(int nNumBits, int * pBitsRead, int& lp)
{
    ULONG lScratch;
    while( ( m_nBitsRemaining < nNumBits ) && 
		   ( lp < m_nInputSize ) ) 
	{
		int c = m_szInput[ lp++ ];
        m_lBitStorage <<= 8;
        m_lBitStorage |= (c & 0xff);
		m_nBitsRemaining += 8;
    }
    if( m_nBitsRemaining < nNumBits ) 
	{
		lScratch = m_lBitStorage << ( nNumBits - m_nBitsRemaining );
		*pBitsRead = m_nBitsRemaining;
		m_nBitsRemaining = 0;
    } 
	else 
	{
		lScratch = m_lBitStorage >> ( m_nBitsRemaining - nNumBits );
		*pBitsRead = nNumBits;
		m_nBitsRemaining -= nNumBits;
    }
    return (UINT)lScratch & m_nMask[nNumBits];
}


void CBase64::write_bits(UINT nBits,
						 int nNumBits,
						 LPTSTR szOutput,
						 int& i)
{
	UINT nScratch;

	m_lBitStorage = (m_lBitStorage << nNumBits) | nBits;
	m_nBitsRemaining += nNumBits;
	while( m_nBitsRemaining > 7 ) 
	{
		nScratch = m_lBitStorage >> (m_nBitsRemaining - 8);
		szOutput[ i++ ] = nScratch & 0xFF;
		m_nBitsRemaining -= 8;
	}
}

#endif // !defined(AFX_BASE64_H__55383CAF_DCC9_11D5_9456_0050BAF080E4__INCLUDED_)
