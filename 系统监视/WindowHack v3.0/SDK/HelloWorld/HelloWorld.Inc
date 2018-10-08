
include windows.inc
include user32.inc
include kernel32.inc

includelib user32.lib
includelib kernel32.lib


LoadPlugin				PROTO
ExecutePlugin			PROTO	:HWND,:HWND


.data

PluginName		db 'Hello World',0
PluginMsg		db 'Hello Window Hack !!!',0


.data?

hInstance		dd ?
