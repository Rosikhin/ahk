#SingleInstance force

t:=true

SetTimer, Timer, 500

Timer:
  if FileExist("V:\") or FileExist("P:\")
  {
   if t ;������������ �������� ������
    Menu, Tray, Icon, Shell32.dll, 114 ;����
   else
    Menu, Tray, Icon, Shell32.dll, 152 ;���� ������� 152

   if t
    t:=false
   else
    t:=true
  }
  else 
   Menu, Tray, Icon, Shell32.dll, 132 ;����� �������
return


^!F12:: MsgBox, OK

F11:: send, {enter} ;��������� ����������

rControl & down:: send, {volume_down} 
rControl & up:: send, {volume_up} 


