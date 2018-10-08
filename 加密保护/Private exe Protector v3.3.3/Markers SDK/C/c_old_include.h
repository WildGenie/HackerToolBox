#define begin_hide 
{ 
  asm 
  {
    DB EBh, 03h, 99h, 11h, 99h
  }
}; 


#define end_hide 
{ 
  asm 
  {
    DB EBh, 03h, 98h, 11h, 98h
  }
};


#define begin_key 
{ 
  asm 
  {
    DB EBh, 03h, 99h, 10h, 99h
  }
}; 


#define end_key 
{ 
  asm 
  {
    DB EBh, 03h, 98h, 10h, 98h
  }
};


#define begin_vm 
{ 
  asm 
  {
    DB EBh, 03h, 99h, 09h, 99h, 90h
  }
}; 


#define end_vm 
{ 
  asm 
  {
    DB EBh, 03h, 98h, 09h, 98h, 90h
  }
};

#define begin_morph 
{ 
  asm 
  {
    DB EBh, 03h, 99h, 08h, 99h, 90h
  }
}; 


#define end_morph 
{ 
  asm 
  {
    DB EBh, 03h, 98h, 08h, 98h, 90h
  }
};