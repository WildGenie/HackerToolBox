/****************************************************************************** 
/* Module: Driver Example (32-bit)
/* Description: Shows how to call Code Virtualizer Macros within a device driver
/*
/* Authors: Rafael Ahucha  
/* (c) 2006 Oreans Technologies
/*****************************************************************************/ 


/****************************************************************************** 
/*                   Libraries used by this module
/*****************************************************************************/ 


#include <ntddk.h>


/****************************************************************************** 
/*                          Function prototypes
/*****************************************************************************/ 

__declspec(dllimport) void VirtualizerStart(void);
__declspec(dllimport) void VirtualizerEnd(void);

#define DebugPrint(_x_) \
                DbgPrint _x_;



/*****************************************************************************
* DriverEntry
*
*  Driver entry point
*
* Inputs
*  Standard DriverEntry parameters
* 
* Outputs
*  None
*
* Returns
*  Exit Code
******************************************************************************/

NTSTATUS
DriverEntry(
    IN PDRIVER_OBJECT  DriverObject,
    IN PUNICODE_STRING RegistryPath
    )

{

    NTSTATUS            status = STATUS_SUCCESS;

    //
    // Virtualize area starts here
    //

	VirtualizerStart();

	// the code here will go protected by Code Virtualizer

    DebugPrint(("==>DriverEntry\n"));

	VirtualizerEnd();


    return( status );
}

