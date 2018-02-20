#SingleInstance force
#MaxHotkeysPerInterval 1000
#Persistent

#=::Send {Volume_Up}
#-::Send {Volume_Down}
#,::Send {Media_Prev}
#.::Send {Media_Next}
#'::Send {Media_Play_Pause}
#Esc::Send !{F4}
#CapsLock::winset,AlwaysOnTop,, A
#delete::Run ::{645FF040-5081-101B-9F08-00AA002F954E}
#/::Run, https://github.com/szzhiyang/PerfectWindows/blob/master/README.md

#a::
If FileExist("a.lnk")
Run, a.lnk
else
Send #a
return

#b::
If FileExist("b.lnk")
Run, b.lnk
else
Send #b
return

#c::
If FileExist("c.lnk")
Run, c.lnk
else
Send #c
return

#d::
If FileExist("d.lnk")
Run, d.lnk
else
Send #d
return

#e::
If FileExist("e.lnk")
Run, e.lnk
else
Send #e
return

#f::
If FileExist("f.lnk")
Run, f.lnk
else
Send #f
return

#g::
If FileExist("g.lnk")
Run, g.lnk
else
Send #g
return

#h::
If FileExist("h.lnk")
Run, h.lnk
else
Send #h
return

#i::
If FileExist("i.lnk")
Run, i.lnk
else
Send #i
return

#j::
If FileExist("j.lnk")
Run, j.lnk
else
Send #j
return

#k::
If FileExist("k.lnk")
Run, k.lnk
else
Send #k
return

#m::
If FileExist("m.lnk")
Run, m.lnk
else
Send #m
return

#n::
If FileExist("n.lnk")
Run, n.lnk
else
Send #n
return

#o::
If FileExist("o.lnk")
Run, o.lnk
else
Send #o
return

#p::
If FileExist("p.lnk")
Run, p.lnk
else
Send #p
return

#q::
If FileExist("q.lnk")
Run, q.lnk
else
Send #q
return

#r::
If FileExist("r.lnk")
Run, r.lnk
else
Send #r
return

#s::
If FileExist("s.lnk")
Run, s.lnk
else
Send #s
return

#t::
If FileExist("t.lnk")
Run, t.lnk
else
Send #t
return

#u::
If FileExist("u.lnk")
Run, u.lnk
else
Send #u
return

#v::
If FileExist("v.lnk")
Run, v.lnk
else
Send #v
return

#w::
If FileExist("w.lnk")
Run, w.lnk
else
Send #w
return

#x::
If FileExist("x.lnk")
Run, x.lnk
else
Send #x
return

#y::
If FileExist("y.lnk")
Run, y.lnk
else
Send #y
return

#z::
If FileExist("z.lnk")
Run, z.lnk
else
Send #z
return

#1::
If FileExist("1.lnk")
Run, 1.lnk
else
Send #1
return

#2::
If FileExist("2.lnk")
Run, 2.lnk
else
Send #2
return

#3::
If FileExist("3.lnk")
Run, 3.lnk
else
Send #3
return

#4::
If FileExist("4.lnk")
Run, 4.lnk
else
Send #4
return

#5::
If FileExist("5.lnk")
Run, 5.lnk
else
Send #5
return

#6::
If FileExist("6.lnk")
Run, 6.lnk
else
Send #6
return

#7::
If FileExist("7.lnk")
Run, 7.lnk
else
Send #7
return

#8::
If FileExist("8.lnk")
Run, 8.lnk
else
Send #8
return

#9::
If FileExist("9.lnk")
Run, 9.lnk
else
Send #9
return

#0::
If FileExist("0.lnk")
Run, 0.lnk
else
Send #0
return

#F1::
If FileExist("F1.lnk")
Run, F1.lnk
return

#F2::
If FileExist("F2.lnk")
Run, F2.lnk
return

#F3::
If FileExist("F3.lnk")
Run, F3.lnk
return

#F4::
If FileExist("F4.lnk")
Run, F4.lnk
return

#F5::
If FileExist("F5.lnk")
Run, F5.lnk
return

#F6::
If FileExist("F6.lnk")
Run, F6.lnk
return

#F7::
If FileExist("F7.lnk")
Run, F7.lnk
return

#F8::
If FileExist("F8.lnk")
Run, F8.lnk
return

#F9::
If FileExist("F9.lnk")
Run, F9.lnk
return

#F10::
If FileExist("F10.lnk")
Run, F10.lnk
return

#F11::
If FileExist("F11.lnk")
Run, F11.lnk
return

#F12::
If FileExist("F12.lnk")
Run, F12.lnk
return

#Enter::
If FileExist("Enter.lnk")
Run, Enter.lnk
return

#Home::
If FileExist("home.lnk")
Run, home.lnk
else
Send #{Home}
return

#End::
If FileExist("End.lnk")
Run, End.lnk
return

#BackSpace::
If FileExist("BackSpace.lnk")
Run, BackSpace.lnk
return

#PrintScreen::
If FileExist("Print Screen.lnk")
Run, "Print Screen.lnk"
else
Send #{PrintScreen}
return

#Space::
If FileExist("space.lnk")
Run, space.lnk
else
Send #{Space}
return

#scrolllock::
If FileExist("scroll lock.lnk")
Run, "scroll lock.lnk"
return

#numlock::
If FileExist("numpad lock.lnk")
Run, "numpad lock.lnk"
return