assume cs:codesg,ss:stacksg

data segment
        db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
        db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
        db '1993','1994','1995'

        dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,1404717,197514
        dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000

        dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
        dw 11542,14430,15257,17800

data ends

table segment
        db 21 dup ('year summ ne ?? ')
table ends

stacksg segment
        db 0,0,0,0,0,0,0,0
stacksg ends

codesg segment

start:  mov ax,data
        mov ds,ax

        mov ax,table
        mov es,ax

        mov ax,stacksg
        mov ss,ax
        mov sp,16

        mov di,0
        mov bx,0
        mov bp,0
        mov cx,2

  s:    push cx
        mov si,0
        mov cx,4

  s0:   mov al,ds:[bp+si]
        mov es:[bx+si],al
        inc si
        loop s0

        mov si,0
        mov ax,ds:[bp+si+84]
        mov es:[bx+si+5],ax
        add si,2
        mov dx,ds:[bp+si+84]
        mov es:[bx+si+5],dx

        div word ptr ds:[di+168]
        mov es:[bx+13],ax

        mov ax,ds:[di+168]
        mov es:[bx+10],ax

        add bx,16
        add bp,4
        add di,2
        pop cx
        loop s

        mov ax,4c00h
        int 21h
codesg ends
end start
