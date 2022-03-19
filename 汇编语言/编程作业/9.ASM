assume cs:codesg,ds:datasg,ss:stack

datasg segment
        db "weclome to masm!"
        db 02h,24h,71h
datasg ends

stack segment
        dw 8 dup(0)
stack ends

codesg segment

  start:mov ax,datasg
        mov ds,ax
        mov bx,0  ;string
        mov di,0  ;show
        mov bp,16 ;color

        mov ax,stack
        mov ss,ax
        mov sp,10h

        mov ax,0b872h
        mov es,ax

        mov cx,3

; color loop
s0:     mov al,ds:[bp]
        inc bp
        push cx

        mov cx,10h
    s1: mov ah,[bx]
        mov es:[di],ah    ;char to show
        mov es:[di+1],dl  ;color to show
        add di,2
        inc bx

        loop s1

        pop cx

        ; change another column
        mov ax,es
        add ax,0ah
        mov es,ax

        mov di,0
        mov bx,0
        loop s0

        mov ax,4c00h
        int 21h
codesg ends
end start
