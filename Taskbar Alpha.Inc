include windows.inc
include kernel32.inc
include user32.inc
include Comctl32.inc
include shell32.inc

includelib kernel32.lib
includelib user32.lib
includelib Comctl32.lib
includelib shell32.lib

DlgProc			PROTO	:HWND,:UINT,:WPARAM,:LPARAM

.const

IDD_DIALOG1		equ 101

GWL_EXSTYLE 	equ -20
LWA_ALPHA 		equ 2
;LWA_COLORKEY 	equ 1
;WS_EX_LAYERED 	equ 0x80000

bAlpha			equ 210

.data

lpClassName		db "Shell_TrayWnd",0

.data?

hInstance		dd ?

hwnd			dd ?
dwNewLong		dd ?
