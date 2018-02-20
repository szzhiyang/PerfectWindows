#SingleInstance force
#MaxHotkeysPerInterval 1000
#Persistent

#=::Send {Volume_Up}
#-::Send {Volume_Down}
#,::Send {Media_Prev}
#.::Send {Media_Next}
#'::Send {Media_Play_Pause}

#b::Send ^+!b
#d::Send ^+!d
#e::Send ^+!e
#f::Send ^+!f
#h::Send #d
#j::Send ^+!j
#k::Run ::{7007ACC7-3202-11D1-AAD2-00805FC1270E}
#m::Send ^+!m
#n::Send ^+!n
#o::Send ^+!o
#p::Run ::{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}
#q::Send ^+!q
#s::Send ^+!s
#t::Send ^+!t
#u::Run ::{59031a47-3f72-44a7-89c5-5595fe6b30ee}
#v::Send ^+!v
#y::Run ::{031E4825-7B94-4dc3-B131-E946B44C8DD5}
#z::Send ^+!z

#F1::Run, https://github.com/szzhiyang/PerfectWindows/blob/master/README.md
#F3::Send #s
#F12::Send ^+!{F12}
#Esc::Send !{F4}
#CapsLock::winset,AlwaysOnTop,, A
#delete::Run ::{645FF040-5081-101B-9F08-00AA002F954E}
#PrintScreen::Send ^+!P
#/::Run, https://github.com/szzhiyang/PerfectWindows/blob/master/README.md