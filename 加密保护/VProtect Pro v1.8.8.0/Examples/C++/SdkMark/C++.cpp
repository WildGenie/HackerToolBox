// C++.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include <windows.h>

/*
* Firsr Include Vprotect headerfiles
*/
#include "..\..\..\sdk\C++\Virtualize_Sdk.h"


BOOL fun_Virtualize_begin_end()
{
	VP_SDK_VIRTUALIZE_BEGIN
	MessageBoxW(0,L"fun_Virtualize_begin_end",L"VProtect Sdk Mark",64);
	VP_SDK_VIRTUALIZE_END
	return FALSE;
}

BOOL fun_Virtualize()
{
	VP_SDK_VIRTUALIZE
	MessageBoxW(0,L"fun_Virtualize",L"VProtect Sdk Mark",64);
	return FALSE;
}

BOOL fun_Mutation_begin_end()
{
	VP_SDK_MUTATION_BEGIN
	MessageBoxW(0,L"fun_Mutation_begin_end",L"VProtect Sdk Mark",64);
	VP_SDK_MUTATION_END
	return FALSE;
}

BOOL fun_Mutation()
{
	VP_SDK_MUTATION
	MessageBoxW(0,L"fun_Mutation",L"VProtect Sdk Mark",64);
	return FALSE;
}

int _tmain(int argc, _TCHAR* argv[])
{
	fun_Virtualize_begin_end();
	fun_Mutation_begin_end();
	fun_Virtualize();
	fun_Mutation();
	getchar();
	return 0;
}

