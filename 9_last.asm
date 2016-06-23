assume cs:code,ds:data

data segment

     db 'welcome to masm!'

data ends

code segment  
 
start:     mov ax,data
     mov ds,ax
     mov bx,0
     mov ax,0B800h
     mov es,ax
     mov si,0
     mov cx,16

   s:mov al,ds:[bx]
     mov es:[780h+si],al
     mov byte ptr es:[781h+si],00000010b
     add bx,1
     add si,2
     loop s
     mov bx,0
     mov cx,16
     jmp s1
 
  s1:mov al,ds:[bx]
     mov es:[780h+si],al
     mov byte ptr es:[781h+si],10100100b
     add bx,1
     add si,2
     loop s1
     mov bx,0
     mov cx,16
     jmp s2

  s2:mov al,ds:[bx]
     mov es:[780h+si],al
     mov byte ptr es:[781h+si],01111001b
     add bx,1
     add si,2
     loop s2
   
     mov ax,4c00h
     int 21

code ends

end start
