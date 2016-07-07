assume cs:code

code segment
 start:mov ax,4240h
       mov dx,000Fh
       mov cx,0Ah
       call divdw
 divdw:push ax
       push dx
       push cx
       mov bx,ss:[sp]
       mov dx,0
       mov ax,ss:[sp+2]
       div bx
       push ax
       push dx
       mov dx,ss:[sp]
       mov ax,ss:[sp+8]
       mov bx,ss:[sp+4]
       div bx
       mov cx,dx
       mov dx,ss:[sp+2]

       mov ax,4c00h
       int 21h
code ends

end