assume cs:code

code segment

     mov ax,0ffffh
     mov ds,ax
     mov ax,0h
     mov dx,0h
     mov bx,0h
     mov cx,12

   s:mov al,[bx]
     mov ah,0h
     add dx,ax
     inc bx
     loop s
     mov ax,4c00h
     int 21h
code ends

end
