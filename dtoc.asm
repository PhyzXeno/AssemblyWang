assume cs:code,ds:data  ;伪指令间记得要加逗号,该程序目前能做到的是反着输出十进制字符串。正着也不难，难度也不大，就不浪费时间了。
data segment
db 10 dup (0)
data ends

code segment 
start: mov ax,123
       mov bx,data
       mov ds,bx
       mov si,0
       call dtoc

next:  mov byte ptr ds:[si],'0'
       mov dh,8
       mov dl,3
       mov cl,2
       mov si,0
       call show_str

       mov ax,4c00h
       int 21h

dtoc:  mov bl,0Ah
       div bl
       add ah,30h
       mov ds:[si],ah
       mov ah,0
       mov cx,ax
       inc si
       jcxz next
       jmp short dtoc

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