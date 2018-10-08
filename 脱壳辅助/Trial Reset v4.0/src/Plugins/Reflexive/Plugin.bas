Attribute VB_Name = "Plugin"

Function Plugin_Execute()

    On Error Resume Next

    SetPluginInfo "Reflexive Arcade Games" & vbCrLf & vbCrLf & "Some game need to be reinstalled for complete the operation"
    
    AddToLog "Searching Reflexive files in " & ProgramFilesDir
    
    If ExistKey(HKEY_LOCAL_MACHINE, "SOFTWARE\ReflexiveArcade") = True Then AddToList TRRegKey, "Reflexive", "HKEY_LOCAL_MACHINE\SOFTWARE\ReflexiveArcade"

    EnumDir (ProgramFilesDir)

    For I = 1 To UBound(AllDirsList)
    
        UpdateProgress I, UBound(AllDirsList)
        CurFile = Dir(AllDirsList(I) & "*.wdt", vbHidden + vbNormal + vbSystem + vbReadOnly)
        
        Do While Replace(CurFile, ".", "") <> ""

            If FileLen(AllDirsList(I) & "\" & CurFile) < 100 Then AddToList TRFile, "Reflexive", AllDirsList(I) & "\" & CurFile
            CurFile = Dir
        Loop
    
    Next
    
    CurFile = Dir(SystemDir & "*.*", vbHidden + vbNormal + vbSystem + vbReadOnly)

    Set fs2 = CreateObject("Scripting.FileSystemObject")

    Do While Replace(CurFile, ".", "") <> ""
        
        If Right(LCase(CurFile), 4) <> ".lnk" And Right(LCase(CurFile), 4) <> ".dll" And Right(LCase(CurFile), 4) <> ".ram" And Replace(CurFile, ".", "") <> CurFile Then
            FileSize = FileLen(SystemDir & CurFile)

            If FileSize > 0 And FileSize < 2000 And Int(FileSize / 4) = FileSize / 4 Then
                Set F1 = fs2.GetFile(SystemDir & CurFile)
                ass = F1.Size
                Set F1 = fs2.openTextFile(SystemDir & CurFile)
                Txtr = F1.Read(ass)

                If Left(Txtr, 2) <> "MZ" And Len(Replace(Txtr, Chr(0), "")) / Len(Txtr) < 0.25 Then AddToList TRFile, "Reflexive", SystemDir & CurFile
                If Left(Txtr, 2) <> "MZ" And FileSize = 16 Then AddToList TRFile, "Reflexive", SystemDir & CurFile
            End If

        End If
        
        CurFile = Dir
       
    Loop
    
    If Is64bit = True And WoW64Translation = 0 And TRWoW_State = WAuto Then SetWoW64Translation 64: Plugin_Execute
    
End Function
