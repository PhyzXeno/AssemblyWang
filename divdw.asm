assume cs:code

code segment
 start:mov ax,4240h
       mov dx,000Fh
       mov cx,0Ah
       call divdw
 divdw:push ax
       push dx
       push cx 
       mov si,sp
       mov bx,ss:[si]
       mov dx,0
       mov ax,ss:[si+2]
       div bx
       push ax
       push dx
       mov si,sp
       mov dx,ss:[si]
       mov ax,ss:[si+8]
       mov bx,ss:[si+4]
       div bx
       mov cx,dx
       mov dx,ss:[si+2]

       mov ax,4c00h
       int 21h
code ends

end