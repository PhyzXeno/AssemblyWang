assume cs:code
data segment 
    db 'Welcome to masm!',0
data ends

code segment 
start: mov dh,8
       mov dl,3
       mov cl,2
       mov ax,data
       mov ds,ax
       mov si,0
       mov di,0
       call show_str

       mov ax,4c00h
       int 21h

show_str: push dx   ;行列在栈底
          push cx   ;颜色在栈顶
      do: mov cl,ds:[si]
          mov ch,0
          jcxz ok
          pop dx    ;dx中保存着颜色
          pop bx    ;bx中保存着行列
          push bx
          push dx
          mov ax,0B800h
          mov es,ax
          mov al,0A0h
          mul bh
          mov bh,0
          add ax,bx
          add ax,1
          mov bx,ax
          mov es:[bx+di],cl
          mov es:[bx+di+1],dl
          inc si 
          add di,2
          jmp short do
      ok: pop cx
          pop dx
          ret

code ends

end start

       