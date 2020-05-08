#SingleInstance force
#Persistent 

Menu, Tray, Icon, 1.ico
Menu, Tray, Tip, XButton v1.8a 20'-05-08`n`nAppKey: help.`n

CoordMode, ToolTip, Screen  ;������������ �������� �����
SetTimer, ShowTip, 100

;;;;;;;;;;;;;;;;;;;;;;;			����			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MButton:: ;  ����� � ���������� �������
	Send, {ctrl} 
	status = ����������
	Gosub, OnClipboardChange
return

F1:: Gosub, PasteFunction ; ctrl + v  ��������
^F1::  Gosub, CopyFunction ; ctrl + F1 - ����������
+F1::  Gosub, Paste2 ; shift + F1
!F1:: Gosub, Paste3 ; alt+ F1

+XButton1::  Gosub, Paste2 ; shift+������� ��������
!XButton1::  Gosub, Paste3 ; alt+������� ��������;


XButton1:: Gosub, PasteFunction ; ������� - �������� ��� �����
XButton2:: Gosub, CopyFunction ; ������ - ���������� ��� ����


;;;;;;;;;;;;;;;;;;;;;;;			F-�� 	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$F3:: 
	SendMessage, 0x50,, 0x4090409,, A ; ����������
	TrayTip , ENG, _, , 1
return
$F4:: 
	SendMessage, 0x50,, 0x4190419,, A ; �������
	TrayTip , ���, _, , 0
return
^F3:: SendInput, {vk72} ; ctrl+F3 ��������� F3
^F4:: SendInput, {vk73} ; ctrl+F4 ��������� F4

;$F5:: PostMessage, 0x50, 2,,, A ; ����� �����
;^F5:: SendInput, {vk74} ; ctrl+F5 ��������� F5

F7:: 	; ������� ����� � ������� �����
	SendInput,  ^+{vk4E} 
	Sleep, 100
	
	FormatTime, now, R
	FormatTime, formatstr, now, yyyy-MM-dd HH_mm

	SendInput, %formatstr%
return

~F12:: ;ctrl+s (~ �� ��������� ����������)
	WinGetActiveTitle, win
	TrayTip , ��������� F12,  %win%, , 1 
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  ������� ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rControl & down:: send, {volume_down} 
rControl & up:: send, {volume_up} 
rControl & right:: SendInput, #{vk27}  ; win+right
rControl & left:: SendInput, #{vk25}  ; win+left

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   ALT 		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!vk43:: Run,  calc ; alt+C
!vk4B:: Run,  calc ; alt+K
!vk45:: Run,  excel.exe ; alt+E
!vk57:: Run,  winword.exe ; alt+W
!vk4E:: Run, Notepad ; alt+N
!vk48:: 
	Run,  cmd.exe /c shutdown /h ; alt+H
	MsgBox , 48 , , ����������, 10
return
!vk53:: Run,  C:\Users\Study\source ; alt+s ����� source
!vk56::  ; alt+v visual studio
	studiopath = C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe
	IfExist, %studiopath%
		Run, %studiopath% 
	else
		MsgBox, ��� ������
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  ���������� �������  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AppsKey::  Run, XButtHelp.txt
^AppsKey::   Run, explore %A_WorkingDir%  ; ctrl

~^vk53:: ; ctrl+s (~ �� ��������� ����������)
	WinGetActiveTitle, win
	TrayTip , ��������� ,  %win%, , 1 
return

+Pause:: Run, FastNote.txt ; shift
Pause::
	InputBox, str, ������� ������� �������, ,, ,100, , , Font, , 
	if !ErrorLevel
	{
		FormatTime, now, R
		FormatTime, dt, now, yyyy-MM-dd HH:mm:ss
		FileAppend, %dt% %str%`n, FastNote.txt
	}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ������� ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
OnClipboardChange: ; ����������� ��������� ������
		TrayTip , , ������ : %status%`n�����1 : %Clipboard% `n�����2(shift) : %copy2%`n�����3(alt) : %copy3% `n ,  ,
		status = ���
return

ShowTip: ; ���������� � ������ ������ ���� ������
	GetKeyState, stateNum, NumLock, T
	GetKeyState, stateCaps, CapsLock, T
	GetKeyState, stateScroll, ScrollLock, T
	GetKeyState, stateIns, Insert, T
	
	if stateNum = D
	    strN = 
	else
 	   strN = Num`n

	if stateCaps = D
 	   strC = Caps`n
	else
 	   strC = 

	if stateScroll = D
	    strS = ScrLk`n
	else
 	   strS = 
	   
	if stateIns = D
	    strI =  Ins`n
	else
 	   strI =
	
 	 ToolTip, %strC%%strN%%strS%%strI%, A_ScreenWidth   , A_ScreenHeight - 150
return

CopyFunction:
GetKeyState, stateScroll, ScrollLock, T

	if stateScroll = D
	{
		send, {down} ; ������� ����
 		TrayTip , , -|- `n \/ , ,
	}
		else
	{
   	    copy3 = %copy2%	
		copy2 = %clipboard%
		clipboard = ; ������� ��������.
		status = ����������
		SendInput, ^{vk2D} ; ctrl + insert   ����������
	}	
return

PasteFunction:
	GetKeyState, stateScroll, ScrollLock, T

	if stateScroll = D
	{
		send, {up}
		TrayTip , , /\`n |, ,    ; ������� �����
	}
		else
	{
		SendInput, ^{vk56} ; ctrl + v  ��������
		status = ��������
		Gosub, OnClipboardChange
	}
return

Paste2:
	SendInput, %copy2%
	status = ��������2 (Shift+F1)
	Gosub, OnClipboardChange
return

Paste3:
	SendInput, %copy3%
	status = ��������3 (Alt+F1)
	Gosub, OnClipboardChange
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;