
#SingleInstance force
Menu, Tray, Tip, v1.3.`n2020.03.11`nF1:copy`nF2
		:paste`nF3:eng`nF4:rus`nctrl+^/v`n
			:volume`nctr+</>`n:����<>`nwin+alt
				:rus`nralt:eng`nAppsKey`n
					:rus-eng`nXButton:up-down`n

F1:: SendInput, ^{vk2D} ; ctrl + insert   ����������
F2:: SendInput, ^{vk56} ; ctrl + v  ��������
F3:: SendMessage, 0x50,, 0x4090409,, A ; ����������
F4:: SendMessage, 0x50,, 0x4190419,, A ; �������


rControl & down:: send, {volume_down} 
rControl & up:: send, {volume_up} 
 
rControl & right:: SendInput, #{vk27}  ; win+right
rControl & left:: SendInput, #{vk25}  ; win+left

#lAlt:: SendMessage, 0x50,, 0x4090409,, A ; ����������
rAlt:: SendMessage, 0x50,, 0x4190419,, A ; �������
AppsKey:: PostMessage, 0x50, 2,,, A ; ����� �����

XButton1:: send, {up} ; ������� �����
XButton2:: send, {down} ; ������� ����
MButton:: send, {ctrl} ; ��� ��������� �����