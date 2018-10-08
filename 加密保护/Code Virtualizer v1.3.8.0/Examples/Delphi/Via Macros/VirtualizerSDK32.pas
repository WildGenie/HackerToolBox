unit VirtualizerSDK32;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

uses
  Windows;

procedure VirtualizerStart();
procedure VirtualizerEnd();
procedure Virtualizer1Start();
procedure Virtualizer1End();
procedure Virtualizer2Start();
procedure Virtualizer2End();
procedure Virtualizer3Start();
procedure Virtualizer3End();
procedure Virtualizer4Start();
procedure Virtualizer4End();
procedure Virtualizer5Start();
procedure Virtualizer5End();
procedure VirtualizerMutate1Start();
procedure VirtualizerMutate2Start();
procedure VirtualizerMutate3Start();


implementation

const
  VirtualizerSDK = 'VirtualizerSDK32.DLL';

procedure VirtualizerStart; external VirtualizerSDK name 'VirtualizerStart';
procedure VirtualizerEnd; external VirtualizerSDK name 'VirtualizerEnd';
procedure Virtualizer1Start; external VirtualizerSDK name 'Virtualizer1Start';
procedure Virtualizer1End; external VirtualizerSDK name 'Virtualizer1End';
procedure Virtualizer2Start; external VirtualizerSDK name 'Virtualizer2Start';
procedure Virtualizer2End; external VirtualizerSDK name 'Virtualizer2End';
procedure Virtualizer3Start; external VirtualizerSDK name 'Virtualizer3Start';
procedure Virtualizer3End; external VirtualizerSDK name 'Virtualizer3End';
procedure Virtualizer4Start; external VirtualizerSDK name 'Virtualizer4Start';
procedure Virtualizer4End; external VirtualizerSDK name 'Virtualizer4End';
procedure Virtualizer5Start; external VirtualizerSDK name 'Virtualizer5Start';
procedure Virtualizer5End; external VirtualizerSDK name 'Virtualizer5End';

procedure VirtualizerMutate1Start; external VirtualizerSDK name 'VirtualizerMutate1Start';
procedure VirtualizerMutate2Start; external VirtualizerSDK name 'VirtualizerMutate2Start';
procedure VirtualizerMutate3Start; external VirtualizerSDK name 'VirtualizerMutate3Start';


end.

