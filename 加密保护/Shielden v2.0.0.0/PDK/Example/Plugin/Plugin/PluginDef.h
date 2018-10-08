#pragma once


typedef struct _PLUGIN_CONTEXT
{
	char Text[255];
}PLUGIN_CONTEXT, *PPLUGIN_CONTEXT;

#define PLUGIN_CONTEXT_SIZE sizeof(PLUGIN_CONTEXT)