.model tiny
.486
.data
out1 db 0ah,0dh,"Enter the string of characters",0ah,0dh,"$"
out2 db 0ah,0dh,0ah,0dh,"The sorted string is:",0ah,0dh,"$"
max1 db 101
sze db ?
arr db 100 dup('$')
new db 0ah,0dh,'$'
.code
.startup
    lea dx,out1
    mov ah,09h
    int 21h

    lea dx, max1
    mov ah,0ah
    int 21h

    mov ch,sze
    outerloop:nop
        lea si,arr
        mov cl,sze
        dec cl
        innerloop:nop
            mov al,[si]
            cmp al,[si+1]
            jng skip
            xchg al,[si+1]
            mov [si],al
            skip:nop
            inc si
            dec cl
            jnz innerloop
        dec ch
        jnz outerloop
    nop

    lea dx,out2
    mov ah,09h
    int 21h

    lea dx,arr
    mov ah,09h
    int 21h

    lea dx,new
    mov ah,09h
    int 21h
.exit
end
