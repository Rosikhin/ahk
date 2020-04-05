#SingleInstance force

t:=true

SetTimer, Timer, 500

Timer:
  if FileExist("V:\") or FileExist("P:\")
  {
   if t ;попеременное моргание иконки
    Menu, Tray, Icon, Shell32.dll, 114 ;диск
   else
    Menu, Tray, Icon, Shell32.dll, 152 ;диск красный 152

   if t
    t:=false
   else
    t:=true
  }
  else 
   Menu, Tray, Icon, Shell32.dll, 132 ;крест красный
return


^!F12:: MsgBox, OK

F11:: send, {enter} ;отпправка коментария

rControl & down:: send, {volume_down} 
rControl & up:: send, {volume_up} 


