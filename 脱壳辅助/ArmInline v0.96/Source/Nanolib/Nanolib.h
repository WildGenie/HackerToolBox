const INT JUnknown = 0;
const INT NotNanomite = 1;
const INT JMP = 2;
const INT JNZ = 3;
const INT JZ = 4;
const INT JB = 5;
const INT JBE = 6;
const INT JA = 7;
const INT JNB = 8;
const INT JG = 9;
const INT JGE = 10;
const INT JL = 11;
const INT JLE = 12;
const INT JP = 13;
const INT JPE = 14;
const INT JNP = 15;
const INT JPO = 16;
const INT JS = 17;
const INT JNS = 18;
const INT JCXZ = 19;
const INT JNCXZ = 20;
const INT JC = 21;
const INT JNC = 22;
const INT JO = 23;
const INT JNO = 24;

enum JFlag {
	CX = 1,
	PF = 2,
	OF = 4,
	SF = 8,
	ZF = 16,
	CF = 32,
};

struct Nanomite {
	PVOID Address;
	PVOID Destination;
	LONG Size;
	INT JumpType;
};

struct VBNano {			// Equivalent structure to 'Nanomite', but is padded into LONGs for compatibility with VB.
	long Address;
	long Destination;
	long Size;
	long JumpType;
};

struct UpdateReport {
	signed long CurrentNano;
	signed long NumDuf;
	signed long TotalINT3;
	bool Inconsistency;
};