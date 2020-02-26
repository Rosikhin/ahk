;macros current version

; ��������: �� ����� �������� ��������� �\��� ����
; ���\���� ���� �� ��� �������
; ��� ������� - ������� ������ (����� ����� �������)
; ������ �� �������� ������ (����� blat)

#SingleInstance force
Menu, Tray, Tip, Macros v.1.8 2020-02-18

Esc:: Gosub, CreateDocument ; �������� ��������� 

AppsKey:: ; �������� ��������� � ������� � ������ ������ (����� WinWait)
    Gosub, CreateDocument   
	SendInput {ENTER}
	SendInput {ENTER}
	SendInput {ENTER}
return

F1:: SendInput, ^{vk2D} ; ctrl + insert   ����������
F2:: SendInput, ^{vk56} ; ctrl + v  ��������
F3:: SendMessage, 0x50,, 0x4090409,, A ; ����������
F4:: SendMessage, 0x50,, 0x4190419,, A ; �������
F5:: PostMessage, 0x50, 2,,, A ; ����� �����

F7:: Run, calc
F8:: Run, https://e.mail.ru/inbox/

F9:: Run, C:\Users\Nadya\Desktop\������\������ �� �����.xlsx

~NumpadAdd::
	IfWinActive, ���������
	{
		SendInput {ENTER}
		SendInput {ENTER}
		SendInput {ENTER}
	}
return

F10:: ; ������� ��������
	MouseGetPos, x, y 
	
	MouseClick, left, 250, 180, 1, 0 ; �����
	WinWait, �����, , 3	
	
	clipboard = ������� ��������
	
	SendInput, ^{vk56} ; ctrl + v  ��������
	SendInput {ENTER}
	Sleep, 700
	SendInput {ENTER}
	
	WinWait, ���������, , 3
	MouseClick, left, 80, 340, 1, 0 ; ��������
	
	MouseMove, x, y, 0
	
	WinActivate, ������������
	WinWait, ������������, , 3
	SendInput, ^{vk51} ;ctrl+Q
	
	WinActivate, ���������
return


F12:: 
	MsgBox, , , ������ ������� ������ `n 
		- Esc / ����������� ���� - �������� ��������� `n 
		- F1 - ���������� `n 
		- F2 - �������� `n 
		- F3,4 - ��������� `n 
		- F7 - ����������� `n 
		- F8 - ����� `n 
		- F9 - ������ `n 
		- F10 - ������� �������� `n 
		- NumPad "-" - ������ `n 
		- PrtSc SysRq "-" - ������ 2-� ����� `n 
		- NumPad "+" - 3 entera (������� �� ����� ������) `n 
		- End - ������� ������ � ���������
		
	, 5
 return
 
End:: ; ������� ������ � ���������
	MouseGetPos, x, y 
	MouseClick, left, 150, 330, 1, 0 ; ������� �� ���������
	MouseMove, x, y, 0
	; SendInput {INSERT} ; 
return

$NumpadSub:: Gosub, PrintDocument ; $ - ��� ����, ����� ������ �������� � ������

Pause:: ; ������ ������ ctrl+P mouseclick (�� ���������� ��� PrtSc/SysRq)

	;SoundPlay, %A_WinDir%\Media\1.wav
	IfWinExist, ���������
	{
		TrayTip , , ������ ��������� , , 
		WinActivate ; ������������ ����, ��������� ����
	
		MouseClick, left, 150, 75, 1, 0 ; ������ ������
		Sleep, 700

		SendInput {ENTER} ; ���� ������ ��� �� ��������
		
		MouseGetPos, x, y 
			MouseClick, left, 645, 15, 1, 0  ; ������: SendInput, ^{vk50} ; ctrl + P ; ���� ��������
		MouseMove, x, y, 0
		
		WinWait, ������, , 3
		SendInput {ENTER}

		SendInput, ^{vk73} ; ctrl + F4 ; �������� ���� ������
		SendInput, ^{vk0D} ; ctrl + enter ; �������� ���������
	}
	 else SendInput {NumpadSub}
	 ; MsgBox, ��� ��������� ��� ������
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CreateDocument: ; �������� ���������
	;SoundPlay, %A_WinDir%\Media\1.wav
	TrayTip , , �������� ��������� , , 
	IfWinExist, ������������
		{	
			WinActivate ; ������������ ����, ��������� ����
			MouseClick, left, 50, 100, 1, 0 ; ��� ����
			MouseClick, left, 80, 180, 1, 0
			SendInput {TAB}
			SendInput {ENTER}
			WinWait, �����������, , 3
			SendInput {DOWN 2}
		}
		else MsgBox, 1C �� ��������
return

PrintDocument: ; ����� �� ���������
	;SoundPlay, %A_WinDir%\Media\1.wav
	IfWinExist, ���������
	{
		TrayTip , , ������ ��������� , , 
		WinActivate ; ������������ ����, ��������� ����
	
		MouseClick, left, 150, 75, 1, 0 ; ������ ������
		Sleep, 700

		SendInput {ENTER} ; ���� ������ ��� �� ��������
	
		SendInput, ^{vk50} ; ctrl + P ; ���� ��������
		WinWait, ������, , 5
		SendInput {ENTER}

		SendInput, ^{vk73} ; ctrl + F4 ; �������� ���� ������
		SendInput, ^{vk0D} ; ctrl + enter ; �������� ���������
	}
	 else SendInput {NumpadSub}
	 ; MsgBox, ��� ��������� ��� ������
return



 