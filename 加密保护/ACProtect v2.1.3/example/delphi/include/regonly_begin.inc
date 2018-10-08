    asm
      pushad 
    db 6ah,02//push 2
    db 6ah,00//push 0
    db 6ah,00//push 0
    db 6ah,0ffh//push 0ffffffffh
      call MessageBoxA
      db 0ebh,0dh,'RegOnly_begin';
      popad
    end;
