asm
  pushad
  db 0ebh,0bh,'RegOnly_end';
    db 6ah,03//push 3
    db 6ah,00//push 0
    db 6ah,00//push 0
    db 6ah,0ffh//push 0ffffffffh
    call MessageBoxA
  popad
end;