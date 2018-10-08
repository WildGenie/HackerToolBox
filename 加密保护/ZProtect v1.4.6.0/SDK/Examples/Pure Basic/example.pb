XIncludeFile "Zprotect_SDK.pbi"     ; include this file to use Zprotect macros in PureBasic applications


Enumeration
  #Window_0
EndEnumeration

;- Gadget Constants
;
Enumeration
  #String_0
  #Button_0
  #Text_0
  #Text_1
EndEnumeration


Procedure Open_Window_0()
  If OpenWindow(#Window_0, 300, 300, 460, 113, "Zprotect DEMO for PureBasic",  #PB_Window_SystemMenu | #PB_Window_SizeGadget | #PB_Window_TitleBar | #PB_Window_ScreenCentered)
    If CreateGadgetList(WindowID(#Window_0))
      TextGadget(#Text_0, 20, 20, 100, 20, "Input password:")
      StringGadget(#String_0, 20, 40, 330, 20, "", #PB_String_Password)
      ButtonGadget(#Button_0, 360, 40, 70, 20, "Check")
      TextGadget(#Text_1, 20, 80, 420, 20, "!! This demo only shows how to use Zprotect VM Marker in PureBasic !!")
      
    EndIf
  EndIf
EndProcedure


Open_Window_0()

Repeat ; Start of the event loop
  
  Event = WaitWindowEvent() ; This line waits until an event is received from Windows
  
  WindowID = EventWindow() ; The Window where the event is generated, can be used in the gadget procedures
  
  GadgetID = EventGadget() ; Is it a gadget event?
  
  EventType = EventType() ; The event type
  

   
  If Event = #PB_Event_Gadget
    
    Select GadgetID
          Case #Button_0
            s$=GetGadgetText(#String_0)
            
            !ZProtect_VM_START ; VM Start marker
            
            If s$="Zprotect" 
                MessageRequester("Zprotect VM Demo", "Great! You have input a right password!", 0)
            Else
                MessageRequester("Zprotect VM Demo", "Sorry! You input a wrong password, please try again!", 0)
                SetActiveGadget(#string_0)
            EndIf
            
            !ZProtect_VM_END  ; VM End marker

            
    EndSelect
  EndIf
  
  
Until Event = #PB_Event_CloseWindow And WindowID=#Window_0 ; End of the event loop
End


; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 59
; FirstLine = 23
; Folding = -