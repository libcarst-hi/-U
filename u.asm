user:
mov al,"U"
call p
mov al,"s"
call p
mov al,"e"
call p
mov al,"r"
call p
mov al,":"
call p
call j
cmp al,"u"
je password
jne not

password:
call e
mov al,"P"
call p
mov al,"a"
call p
mov al,"s"
call p
mov al,"s"
call p
mov al,"w"
call p
mov al,"o"
call p
mov al,"r"
call p
mov al,"d"
call p
mov al,":"
call p
mov ah,0
int 16h
mov dh,al
mov al,"*"
call p
cmp dh,"0"
je start
jne not

not:
call e
mov al,"N"
call p
mov al,"o"
call p
mov al,"t"
call p
mov al,"!"
call p
call e
jmp user

start:
call e
mov al,"W"
call p
mov al,"e"
call p
mov al,"l"
call p
mov al,"c"
call p
mov al,"o"
call p
mov al,"m"
call p
mov al,"e"
call p
mov al," "
call p
mov al,"t"
call p
mov al,"o"
call p
mov al," "
call p
mov al,"u"
call p
mov al,"-"
call p
mov al,"o"
call p
mov al,"s"
call p
mov al,"!"
call p
call e
call beep
call beep
call beep
call main

main:
mov al,"Z"
call p
mov al,":"
call p
mov al,">"
call p

jmp input

input:
mov ah,0
int 16h
mov dh,al
cmp dh,0x0d
je end
mov ah,0x0e
int 10h

mov ah,0
int 16h
mov ah,0x0e
int 10h

cmp al,0x0d
je enter
cmp al,08
je back
jne error

enter:
mov al,0x0a
call p
mov al,0x0d
call p
jmp switch

back:
mov al,0x2e
mov ah,0x0e
int 10h
mov al,08
mov ah,0x0e
int 10h
jmp input

switch:
cmp dh,"a"
je a
cmp dh,"h"
je hello
cmp dh,"f"
je file
cmp dh,"c"
je check
cmp dh,"n"
je ned
cmp dh,"d"
je del
cmp dh,"r"
je ren
cmp dh,"l"
je lbeep
cmp dh,"u"
je uasm
cmp dh,cl
je app
cmp dh,"m"
je says
cmp dh,"+"
je nnn
cmp dh,"j"
je hdjs
cmp dh,"q"
je qemu
cmp dh,"."
je sysendr
cmp dh,"!"
je china
cmp dh,"k"
je makeimg
cmp dh,"z"
je zipmake
cmp dh,"p"
je zipcheck
jne error

zipmake:
mov al,"F"
call p
mov al,"i"
call p
mov al,"l"
call p
mov al,"e"
call p
mov al,":"
call p
call j
mov cl,al
mov si,4
jmp zipfile

zipfile:
call e
call j
mov byte[ds:0001],al
call e
call j
mov byte[ds:0002],al
call j
mov byte[ds:0003],al
call j
mov byte[ds:0004],al
call j
mov byte[ds:0005],al
call j
mov byte[ds:0006],al
call j
mov byte[ds:0007],al
call j
mov byte[ds:0008],al
call j
mov byte[ds:0009],al
call j
mov byte[ds:0010],al
call j
mov byte[ds:0011],al
call j
mov byte[ds:0012],al
call j
mov byte[ds:0013],al
call e

call j
mov byte[ds:0041],al
call e
call j
mov byte[ds:0022],al
call j
mov byte[ds:0023],al
call j
mov byte[ds:0024],al
jmp end

zipcheck:
mov al,"F"
call p
mov al,"i"
call p
mov al,"l"
call p
mov al,"e"
call p
mov al,":"
call p
call j
cmp al,byte[ds:0001]
je onezip
cmp al,byte[ds:0041]
je twozip

onezip:
call e
mov al,byte[ds:0002]
call p
mov al,byte[ds:0003]
call p
mov al,byte[ds:0004]
call p
mov al,byte[ds:0005]
call p
mov al,byte[ds:0006]
call p
mov al,byte[ds:0007]
call p
mov al,byte[ds:0008]
call p
mov al,byte[ds:0009]
call p
mov al,byte[ds:0010]
call p
mov al,byte[ds:0011]
call p
mov al,byte[ds:0012]
call p
mov al,byte[ds:0013]
call p
jmp end

twozip:
call e
mov al,byte[ds:0022]
call p
mov al,byte[ds:0023]
call p
mov al,byte[ds:0024]
call p
jmp end

sysendr:
cmp byte[ds:0900],9
je sysend
jne end

sysend:
call e
mov cl,0
mov dl,0
mov bl,0
mov ch,0
mov al,"E"
call p
mov al,"n"
call p
mov al,"d"
call p
mov al,"!"
call p
call e
jmp end

app:
cmp si,2
je debugr
jne error

a:
mov al,"A"
call p
call end

e:
mov al,0x0a
call p
mov al,0x0d
call p
ret

error:
call e
cmp al,0x0d
je errortwo
call e
mov al,"?"
call p
call end

errortwo:
mov al,"?"
call p
call end

hello:
mov al,"H"
call p
mov al,"e"
call p
mov al,"l"
call p
mov al,"l"
call p
mov al,"o"
call p
mov al,02h
call p
mov al,02h
call p
mov al,02h
call p
call end

p:
mov ah,0x0e
int 10h
ret

no:
call e
mov al,"N"
call p
mov al,"o"
call p
mov al,"!"
call p
call end

end:
call e
jmp main

file:
mov ah,0
int 16h
mov si,1
mov cl,al
mov ah,0x0e
int 10h

call e

mov ah,0
int 16h
mov dl,al
mov ah,0x0e
int 10h

mov ah,0
int 16h
mov bl,al
mov ah,0x0e
int 10h

mov ah,0
int 16h
mov ch,al
mov ah,0x0e
int 10h

jmp end

check:
mov ah,0
int 16h
mov ah,0x0e
int 10h

cmp al,cl
je printf
jne no

printf:
call e
mov al,dl
call p
mov al,bl
call p
mov al,ch
call p
jmp end

ned:
mov al,"u"
call p
mov al,"-"
call p
mov al,"o"
call p
mov al,"s"
call p
call s
mov al,"<"
call p
mov al,"N"
call p
mov al,"E"
call p
mov al,"D"
call p
mov al,">"
call p
call tab
mov al,"."
call p
mov al,"S"
call p
mov al,"Y"
call p
mov al,"S"
call p
call e

mov al,"c"
call p
mov al,"m"
call p
mov al,"d"
call p
call s
call s
mov al,"<"
call p
mov al,"N"
call p
mov al,"E"
call p
mov al,"D"
call p
mov al,">"
call p
call tab
mov al,"."
call p
mov al,"A"
call p
mov al,"M"
call p
mov al,"F"
call p
call e

mov al,"a"
call p
mov al,"p"
call p
mov al,"i"
call p
call s
call s
mov al,"<"
call p
mov al,"N"
call p
mov al,"E"
call p
mov al,"D"
call p
mov al,">"
call p
call tab
mov al,"."
call p
mov al,"A"
call p
mov al,"P"
call p
mov al,"I"
call p
call e

cmp cl,""
je main
mov al,cl
call p
call tab
mov al,"<"
call p
mov al,"N"
call p
mov al,"E"
call p
mov al,"D"
call p
mov al,">"
call p
call tab
cmp si,1
je t2b
cmp si,2
je dek
cmp si,3
je img
cmp si,4
je zip
jne end

t2b:
mov al,"."
call p
mov al,"T"
call p
mov al,"2"
call p
mov al,"B"
call p
jmp end

dek:
mov al,"."
call p
mov al,"D"
call p
mov al,"E"
call p
mov al,"K"
call p
jmp end

img:
mov al,"."
call p
mov al,"I"
call p
mov al,"M"
call p
mov al,"G"
call p
jmp end

zip:
mov al,"."
call p
mov al,"Z"
call p
mov al,"I"
call p
mov al,"P"
call p
jmp end

tab:
mov al," "
call p
mov al," "
call p
mov al," "
call p
mov al," "
call p
ret

del:
mov cl,""
mov bl,""
mov bl,""
mov ch,""
jmp end

ren:
mov ah,0
int 16h
mov ah,0x0e
int 10h
mov cl,al
jmp end

lbeep:
call beep
call beep
call beep
jmp end

beep:
mov al,07h
call p
ret

s:
mov al," "
call p
ret

uasm:
mov al,"F"
call p
mov al,"i"
call p
mov al,"l"
call p
mov al,"e"
call p
mov al,":"
call p
mov ah,0
int 16h
mov ah,0x0e
int 10h
cmp al,cl
je debug
jne no

debug:
mov si,2
jmp end

debugr:
cmp dl,"d"
je pri
cmp dl,"h"
je hlu
cmp dl,"k"
je key
cmp dl,"b"
je ber
cmp dl,"m"
je muk
cmp dl,"i"
je ifs
cmp dl,"c"
je command
jne printg

printg:
mov al,dl
call p
mov al,bl
call p
mov al,ch
call p
jmp end

pri:
mov al,ch
call p
jmp end

hlu:
hlt
jmp end

command:
mov dh,ch
jmp switch

key:
cmp bl,"f"
je jky
mov ah,0
int 16h
mov ah,0x0e
int 10h
cmp al,0x0d
je end
jmp end

ber:
call beep
jmp end

jky:
mov ah,0
int 16h
mov ah,0x0e
int 10h
cmp al,0x0d
je enkkr
cmp al,08
je bakk
cmp al,27
je end
jmp jky

enkkr:
call e
jmp jky

bakk:
mov al,0x2e
mov ah,0x0e
int 10h
mov al,08
mov ah,0x0e
int 10h
jmp jky

muk:
call inc
cmp bl,"x"
je null
mov al,100
call music
jmp mud

null:
call inc
cmp al,100
call music
jmp null

ifs:
mov ah,0
int 16h
cmp al,bl
je xbr
jmp ifs

xbr:
mov al,ch
call p
jmp ifs

says:
call inc
mov al,59
call music
jmp mud

inc:
mov al,0x0f
out 0x61,al
mov al,0xb6
out 0x43,al

music:
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr
call musicr

musicr:
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
out 0x42,al
ret

mud:
mov al,0x0d
out 0x61,al
call end

nnn:
call j
mov byte[ds:0200],al
call e
mov al,byte[ds:0200]
call p
jmp end

j:
mov ah,0
int 16h
mov ah,0x0e
int 10h
ret

hdjs:
cmp byte[ds:0300],1
je endr
mov al,"x"
call p
mov al,"+"
call p
mov al,"y"
call p
mov al,"="
call p
mov al,"2"
call p
mov al,"5"
call p
mov al,"0"
call p
call e
mov al,"y"
call p
mov al,"="
call p
mov al,"1"
call p
mov al,"."
call p
mov al,"5"
call p
mov al,"x"
call p
call e
mov al,"x"
call p
mov al,"y"
call p
mov al,"="
call p
mov al,"?"
call p
call e
mov al,"a"
call p
mov al,":"
call p
mov al,"1"
call p
mov al,"5"
call p
mov al,"0"
call p
mov al,"0"
call p
mov al,"0"
call p
mov al," "
call p
mov al,"b"
call p
mov al,":"
call p
mov al,"2"
call p
mov al,"0"
call p
mov al,"0"
call p
mov al,"0"
call p
mov al,"0"
call p
mov al," "
call p
mov al,"c"
call p
mov al,":"
call p
mov al,"1"
call p
mov al,"0"
call p
mov al,"0"
call p
mov al,"0"
call p
mov al,"0"
call p
call e
call j
mov byte[ds:0300],1
cmp al,"a"
je yes
jne no

yes:
call e
mov al,"Y"
call p
mov al,"e"
call p
mov al,"s"
call p
mov al,"!"
call p
jmp end

endr:
mov al,"I"
call p
mov al,"s"
call p
mov al," "
call p
mov al,"e"
call p
mov al,"n"
call p
mov al,"d"
call p
mov al,"."
call p
jmp end

qemu:
mov byte[ds:0900],9
call e
call e
mov al,"B"
call p
mov al,"o"
call p
mov al,"o"
call p
mov al,"t"
call p
mov al,"i"
call p
mov al,"n"
call p
mov al,"g"
call p
mov al,"."
call p
mov al,"."
call p
mov al,"."
call p
call e
call e
jmp booti

booti:
cmp dl,"!"
je prk
cmp dl,"?"
je prj
cmp dl,"b"
je bekp
cmp dl,"i"
je iks
cmp dl,"x"
je isk
cmp dl,"k"
je kky

kky:
call j
cmp al,27
je sysknd
jmp kky

isk:
call beep
jmp iks

prk:
mov al,ch
call p
jmp hkt

prj:
mov al,ch
call p
call e
jmp hkt

hkt:
sti
hlt
mov ah,0
int 16h
cmp al,27
je sysknd
jmp hkt

bekp:
call beep
jmp hkt

iks:
mov al,">"
call p
jmp inkut

inkut:
call j
mov dh,al
cmp dh,27
je knd
call j
cmp al,0x0d
je enker
cmp al,08
je bkck

enker:
call e
jmp swktch

bkck:
call kkk
jmp inkut

swktch:
cmp dh,bl
je world
jne errkr

world:
mov al,ch
call p
call e
jmp iks

errkr:
mov al,"?"
call p
call e
jmp iks

knd:
call e
call e
jmp sysknd

sysknd:
call e
mov al,"E"
call p
mov al,"n"
call p
mov al,"d"
call p
mov al,"!"
call p
call e
call e
jmp end

makeimg:
mov si,3
jmp end

china:
mov al,0xa0
call p
mov al,0xa1
call p
mov al,0xa2
call p
mov al,0xa3
call p
mov al,0xa4
call p
mov al,0xa5
call p
mov al,0xa6
call p
mov al,0xa7
call p
mov al,0xa8
call p
mov al,0xa9
call p
mov al,0xaa
call p
mov al,0xab
call p
mov al,0xac
call p
mov al,0xad
call p
mov al,0xaf
call p
mov al,0xb0
call p
mov al,0xb1
call p
mov al,0xb2
call p
mov al,0xb3
call p
mov al,0xb4
call p
mov al,0xb5
call p
mov al,0xb6
call p
mov al,0xb7
call p
mov al,0xb8
call p
mov al,0xb9
call p
mov al,0xba
call p
mov al,0xbb
call p
mov al,0xbc
call p
mov al,0xbd
call p
mov al,0xbe
call p
mov al,0xbf
call p
mov al,0xc0
call p
mov al,0xc1
call p
mov al,0xc2
call p
mov al,0xc3
call p
mov al,0xc4
call p
mov al,0xc5
call p
mov al,0xc6
call p
mov al,0xc7
call p
mov al,0xc8
call p
mov al,0xc9
call p
mov al,0xca
call p
mov al,0xcb
call p
mov al,0xcc
call p
mov al,0xcd
call p
mov al,0xce
call p
mov al,0xcf
call p
mov al,0xd0
call p
mov al,0xd1
call p
mov al,0xd2
call p
mov al,0xd3
call p
mov al,0xd4
call p
mov al,0xd5
call p
mov al,0xd6
call p
mov al,0xd7
call p
mov al,0xd8
call p
mov al,0xd9
call p
mov al,0xda
call p
mov al,0xdb
call p
mov al,0xdc
call p
mov al,0xdd
call p
mov al,0xde
call p
mov al,0xdf
call p
mov al,0xe0
call p
mov al,0xe1
call p
mov al,0xe2
call p
mov al,0xe3
call p
mov al,0xe4
call p
mov al,0xe5
call p
mov al,0xe6
call p
mov al,0xe7
call p
mov al,0xe8
call p
mov al,0xe9
call p
mov al,0xea
call p
mov al,0xeb
call p
mov al,0xec
call p
mov al,0xed
call p
mov al,0xee
call p
mov al,0xef
call p
mov al,0xf0
call p
mov al,0xf1
call p
mov al,0xf2
call p
mov al,0xf3
call p
mov al,0xf4
call p
mov al,0xf5
call p
mov al,0xf6
call p
mov al,0xf7
call p
mov al,0xf8
call p
mov al,0xf9
call p
mov al,0xfa
call p
mov al,0xfb
call p
mov al,0xfc
call p
mov al,0xfd
call p
mov al,0xfe
call p
mov al,0xff
call p
jmp end

kkk:
mov al,0x2e
mov ah,0x0e
int 10h
mov al,08
mov ah,0x0e
int 10h
ret

bios:
times  5000-($-$$) db 0
dw 0xaa55
