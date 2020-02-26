;macros current version

; добавить: на паузу повесить сообщение и\или звук
; вкл\откл звук на гор клавиши
; гор клавиша - создать ценник (через ексел макросы)
; батник на отправку письма (через blat)

#SingleInstance force
Menu, Tray, Tip, Macros v.1.8 2020-02-18

Esc:: Gosub, CreateDocument ; создание накладной 

AppsKey:: ; создание накладной и переход к первой строке (через WinWait)
    Gosub, CreateDocument   
	SendInput {ENTER}
	SendInput {ENTER}
	SendInput {ENTER}
return

F1:: SendInput, ^{vk2D} ; ctrl + insert   копировать
F2:: SendInput, ^{vk56} ; ctrl + v  вставить
F3:: SendMessage, 0x50,, 0x4090409,, A ; английский
F4:: SendMessage, 0x50,, 0x4190419,, A ; русский
F5:: PostMessage, 0x50, 2,,, A ; смена языка

F7:: Run, calc
F8:: Run, https://e.mail.ru/inbox/

F9:: Run, C:\Users\Nadya\Desktop\Деньги\дельта по кассе.xlsx

~NumpadAdd::
	IfWinActive, Расходная
	{
		SendInput {ENTER}
		SendInput {ENTER}
		SendInput {ENTER}
	}
return

F10:: ; Розница Павильон
	MouseGetPos, x, y 
	
	MouseClick, left, 250, 180, 1, 0 ; найти
	WinWait, Найти, , 3	
	
	clipboard = РОЗНИЦА Павильон
	
	SendInput, ^{vk56} ; ctrl + v  вставить
	SendInput {ENTER}
	Sleep, 700
	SendInput {ENTER}
	
	WinWait, Расходная, , 3
	MouseClick, left, 80, 340, 1, 0 ; добавить
	
	MouseMove, x, y, 0
	
	WinActivate, Конфигурация
	WinWait, Конфигурация, , 3
	SendInput, ^{vk51} ;ctrl+Q
	
	WinActivate, Расходная
return


F12:: 
	MsgBox, , , Список горячих клавиш `n 
		- Esc / контекстное меню - создание накладной `n 
		- F1 - копировать `n 
		- F2 - вставить `n 
		- F3,4 - раскладка `n 
		- F7 - калькулятор `n 
		- F8 - почта `n 
		- F9 - дельта `n 
		- F10 - розница павильон `n 
		- NumPad "-" - печать `n 
		- PrtSc SysRq "-" - печать 2-й метод `n 
		- NumPad "+" - 3 entera (переход на новую строку) `n 
		- End - удалить строку в накладной
		
	, 5
 return
 
End:: ; удалить строку в накладной
	MouseGetPos, x, y 
	MouseClick, left, 150, 330, 1, 0 ; крестик на накладной
	MouseMove, x, y, 0
	; SendInput {INSERT} ; 
return

$NumpadSub:: Gosub, PrintDocument ; $ - для того, чтобы кнопка работала и дальше

Pause:: ; печать вместо ctrl+P mouseclick (на клавиатуре это PrtSc/SysRq)

	;SoundPlay, %A_WinDir%\Media\1.wav
	IfWinExist, Расходная
	{
		TrayTip , , ПЕЧАТЬ НАКЛАДНОЙ , , 
		WinActivate ; Используется окно, найденное выше
	
		MouseClick, left, 150, 75, 1, 0 ; кнопка печать
		Sleep, 700

		SendInput {ENTER} ; окно данные еще не записаны
		
		MouseGetPos, x, y 
			MouseClick, left, 645, 15, 1, 0  ; вместо: SendInput, ^{vk50} ; ctrl + P ; окно принтера
		MouseMove, x, y, 0
		
		WinWait, Печать, , 3
		SendInput {ENTER}

		SendInput, ^{vk73} ; ctrl + F4 ; закрытие окна печати
		SendInput, ^{vk0D} ; ctrl + enter ; закрытие накладной
	}
	 else SendInput {NumpadSub}
	 ; MsgBox, НЕТ НАКЛАДНОЙ ДЛЯ ПЕЧАТИ
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CreateDocument: ; создание накладной
	;SoundPlay, %A_WinDir%\Media\1.wav
	TrayTip , , СОЗДАНИЕ НАКЛАДНОЙ , , 
	IfWinExist, Конфигурация
		{	
			WinActivate ; Используется окно, найденное выше
			MouseClick, left, 50, 100, 1, 0 ; раб стол
			MouseClick, left, 80, 180, 1, 0
			SendInput {TAB}
			SendInput {ENTER}
			WinWait, Контрагенты, , 3
			SendInput {DOWN 2}
		}
		else MsgBox, 1C не запущена
return

PrintDocument: ; печть из накладной
	;SoundPlay, %A_WinDir%\Media\1.wav
	IfWinExist, Расходная
	{
		TrayTip , , ПЕЧАТЬ НАКЛАДНОЙ , , 
		WinActivate ; Используется окно, найденное выше
	
		MouseClick, left, 150, 75, 1, 0 ; кнопка печать
		Sleep, 700

		SendInput {ENTER} ; окно данные еще не записаны
	
		SendInput, ^{vk50} ; ctrl + P ; окно принтера
		WinWait, Печать, , 5
		SendInput {ENTER}

		SendInput, ^{vk73} ; ctrl + F4 ; закрытие окна печати
		SendInput, ^{vk0D} ; ctrl + enter ; закрытие накладной
	}
	 else SendInput {NumpadSub}
	 ; MsgBox, НЕТ НАКЛАДНОЙ ДЛЯ ПЕЧАТИ
return



 