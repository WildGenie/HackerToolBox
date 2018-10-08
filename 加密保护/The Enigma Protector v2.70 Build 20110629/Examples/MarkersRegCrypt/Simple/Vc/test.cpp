// test.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <windows.h>

int main(int argc, char* argv[])
{
	MessageBox(0, "This message always appears on application start!\nYou can register it by means Simple_Key.reg file.", "Application", 0);

	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_begin1.inc"
	MessageBox(0, "This message appears only if application is registered\nand section #1 unlocked by registration key", "Application", 0);
	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_end1.inc"

	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_begin2.inc"
	MessageBox(0, "This message appears only if application is registered\nand section #2 unlocked by registration key", "Application", 0);
	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_end2.inc"

	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_begin3.inc"
	MessageBox(0, "This message appears only if application is registered\nand section #3 unlocked by registration key", "Application", 0);
	#include "..\..\..\..\EnigmaSDK\VC\reg_crypt_end3.inc"

	return 0;
}

