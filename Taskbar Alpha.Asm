.386
.model flat, stdcall  ;32 bit memory model
option casemap :none  ;case sensitive

include Taskbar Alpha.inc

.code

start:

	invoke GetModuleHandle,NULL
	mov hInstance,eax

    invoke InitCommonControls
	invoke DialogBoxParam,hInstance,IDD_DIALOG1,NULL,addr DlgProc,NULL
	invoke ExitProcess,0

DlgProc proc hWin:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM

	mov eax,uMsg
	.if eax==WM_INITDIALOG
		invoke FindWindow,addr lpClassName,NULL
		mov hwnd,eax
		invoke GetWindowLong,hwnd,GWL_EXSTYLE
		add eax,WS_EX_LAYERED
		mov dwNewLong,eax
		invoke SetWindowLong,hwnd,GWL_EXSTYLE,dwNewLong
		invoke SetLayeredWindowAttributes,hwnd,0,bAlpha,LWA_ALPHA
		invoke EndDialog,hWin,0
	.elseif eax==WM_COMMAND

	.elseif eax==WM_CLOSE
		invoke EndDialog,hWin,0
	.else
		mov eax,FALSE
		ret
	.endif
	mov eax,TRUE
	ret

DlgProc endp

end start
