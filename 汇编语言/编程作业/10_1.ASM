assume cs:code
data segment
        db 'Weclome to masm!',0
data ends

code segment
start:  mov dh,8
        mov dl,3
        mov cl,2
        mov ax,data
        mov ds,ax
        mov si,0
        call show_str

        mov ax,4c00h
        int 21h
show_str:
         ; set start
         mov bx,0B800h
         ; cal rows
         mov al,0ah
         mul dh
         add bx,ax
         ; cal columns
         mov al,2
         sub dl,1
         mul dl
         mov di,ax
         mov es,bx

         ; printloop
         mov al,2
         call capital
 capital:
         mov cl,[si]
         mov ch,0
         jcxz ok
         ; print char
         mov es:[di],cl
         mov es:[di+1],al

         add di,2
         inc si

         jmp short capital
      ok:ret

code ends
end start
                      s
