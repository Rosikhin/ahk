
#SingleInstance force
Menu, Tray, Tip, v.1.1.`n2020.02.21`n___________`nF1 : copy`nF2 
		: paste `nF3 : eng `nF4 : rus`nctrl+^/v `n
			: volume`nctr+</>`n  : окно<>`n___________`n

F1:: SendInput, ^{vk2D} ; ctrl + insert   копировать
F2:: SendInput, ^{vk56} ; ctrl + v  вставить
F3:: SendMessage, 0x50,, 0x4090409,, A ; английский
F4:: SendMessage, 0x50,, 0x4190419,, A ; русский
; F5:: PostMessage, 0x50, 2,,, A ; смена языка

rControl & down:: send, {volume_down} 
rControl & up:: send, {volume_up} 
 
rControl & right:: SendInput, #{vk27}  ; win+right
rControl & left:: SendInput, #{vk25}  ; win+left
