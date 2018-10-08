program Test;

uses
  Windows;


Function EnvelopeCheck: Boolean;
{$I Inc\DelphiEnvelopeCheckFunc.inc}


begin

  MessageBox(0,'Begin','',0);

  {$I Inc\DelphiEnvelopeCheck.inc}

  If EnvelopeCheck then MessageBox(0,'Envelope found!','',0) else
                        MessageBox(0,'Envelope not found!','',0);

  MessageBox(0,'End','',0);

end.