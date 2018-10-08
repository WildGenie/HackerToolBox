// VirtualizerSample.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

extern "C" void VirtualizerStart();
extern "C" void Virtualizer1Start();
extern "C" void Virtualizer2Start();
extern "C" void Virtualizer3Start();
extern "C" void Virtualizer4Start();
extern "C" void Virtualizer5Start();
extern "C" void VirtualizerEnd();

#pragma optimize("", off)

int _tmain(int argc, _TCHAR* argv[])
{	
	
	// our first Virtualizer macro
		
	Virtualizer1Start();
	
	printf("Hello! We are inside a Virtualizer Macro (Machine 1)!\n");

	VirtualizerEnd();
	
	printf("Hello! We are outside a Virtualizer Macro!\n");

	// our second Virtualizer macro

	Virtualizer2Start();
	
	printf("Hello! We are AGAIN inside a Virtualizer Macro (Machine 2)!\n");

	VirtualizerEnd();

	printf("Hello! We are outside a Virtualizer Macro!\n");

	Virtualizer3Start();
	
	printf("Hello! We are AGAIN inside a Virtualizer Macro (Machine 3)!\n");

	VirtualizerEnd();

	Virtualizer2Start();
	
	printf("Hello! We are AGAIN inside a Virtualizer Macro (Machine 2)!\n");

	VirtualizerEnd();


	return 0;
}

#pragma optimize("", off)

