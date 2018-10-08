// VirtualizerSample.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

extern "C" void VirtualizerStart();
extern "C" void VirtualizerEnd();

#pragma optimize("", off)

int _tmain(int argc, _TCHAR* argv[])
{	
	
	// our first Virtualizer macro
		
	VirtualizerStart();
	
	printf("Hello! We are inside a Virtualizer Macro!\n");

	VirtualizerEnd();
	
	printf("Hello! We are outside a Virtualizer Macro!\n");

	// our second Virtualizer macro

	VirtualizerStart();
	
	printf("Hello! We are AGAIN inside a Virtualizer Macro!\n");

	VirtualizerEnd();

	return 0;
}

#pragma optimize("", off)

