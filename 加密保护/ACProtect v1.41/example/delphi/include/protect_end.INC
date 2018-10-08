  asm
  pushad
    db 6ah,04//push 4
    db 6ah,00//push 0
    db 6ah,00//push 0
    db 6ah,0ffh//push 0ffffffffh
    call MessageBoxA
  db 235,30,'peetles_end';
  dd 0,0,0,0;
  db 0,0,0;
  popad
end;
