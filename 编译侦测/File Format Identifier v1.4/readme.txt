Sucop virus analysis tool(File Format Identifier) v1.4


unnoo-dswlab products


    It is an auxiliary tool for virus analysis, which includes various file format recognition engine code, sniffing packers, unpacking by virtual machine, editing PE file, rebuilding PE file, obtaining the import table(using virtual machine to decode the encode import table), dumpping memory, processesing the overlay, PE address conversion, supporting PEid plugins, computing MD5 and efficient use of third-party tools, and so on. It is also used for disposing the Trojan virus samples during virus analysis.

    This software is free; you can download, install, copy and distribute it noncommercially; For commercial sale, copy and distribute, you should get the warranty and permission of DSWLAB before(for example, if the anti-virus company want to use it to analyses the Trojan horse in batches, he must get mandate and permission of DSWLAB before). 
    
    v1.4 new features£º
    
    ¡ïadd obtaining the import table function, for some encode import table, you can decode it by the virutal machine. (See section 9 following), welcome the contact us if you have more suggestions
    
    ¡ïshow more useful descriptions for the invalid pe file, thanks to Pedro Lopez for proposing it
    
    ¡ïnew skin to make more beautiful, you can switch skin style after hitting option button, thanks to fly(unpack.cn) for proposing it
    
    ¡ïadd the external signatures library which collected by fly(unpack.cn), thanks for the authorization
    
    ¡ïcorrect several bugs
    
    v1.3 new features£º
    
    ¡ïadd a task view which supports three functions:
    	a.terminate the process
    	b.corrent the image size of the module
    	c.dump the memory with three mode(Dump Full¡¢Dump Partial and Dump Region)
    
    v1.2 new features£º

    ¡ïsupport PEid plugins
    
    ¡ïadd a feature for rebuilding PE
    
    v1.1 new features£º
    
    ¡ïadd VMUnpacker unpack engine for unpacking, the unpacking capacity is equal VMUnpacker v1.4
    
    ¡ïadd some external signatures from the internet
    
    ¡ïadd a feature for deleting overlay and saving overlay
    
    ¡ïadd PE Address Conversion(RAV<->RAW)
    
First, Sniff Packers

    Supporting file drag, directory drag, you can also install shell extensions to recognize file and directory. In order to recognize more packers, you can use the external signatures library (must named userdb.txt, the library format is as same as the PEid's external signatures library).
    
   
    Note: A '*' will appear if this packers was sniffed by the external signatures.
    
Second, Unpack
	
    You can unpack the packer if the "unpack" button can hit. The fucntion based on the technology of virtual machine, it could unpack various known & unknown packers. It is suitable for unpacking the protected Trojan horse in virus analyses, and because all codes are run under the virtual machine, so they will not take any danger to your system.
    
Third, PE Editor

   Hit the button after "PE Section", you can edit the information of the sections.
   
   The mainly functions are:
   
       ¡ïDisplay section information
       ¡ïCan modify section name, section size, section attributes and other related information
       ¡ïRemove the selected section name
       ¡ïAutomatic fix of the section
       ¡ïLoad section from the disk
       ¡ïSave section to disk
       ¡ïAdd a new section
       ¡ïDelete section from PE file
       ¡ïDelete section only from PE header
       ¡ïFill section with the specified char
   
   Hit the SubSystem button can get the detailed PE information, you can editor them.
   
Fourth, Delete & Save Overlay

   You can hit "Del Overlay" button to delete the overlay if the PE file has overlay, you also can hit "Save Overlay" button to save the overlay.
   
Fifth, Support PEid plugins

    Hit Options button to set using PEid plugins, without restart FFI, the PEid plugins must be put the directory named plugins, and then Hit Plugin>>> to use PEid plugins.
 
sixth, ReBuild PE

    This function is primarily used for repairing the PE file which was dumped from unpacking.
    
seventh, Support the third-party tools   

   Hit Manage Tools button after Hitting Options button, you can add / remove IDA / OllyDBG and other third-party tools to shell extensions, than you can activate the third-party tools in the FFI to open the target file directly.
   
   Note: After add the third-party tools, you can hit Pulig>>> button to get their information, click them you can use the third-party to open the target file.
   
eighth, Dump the memory of the process

   Hit TaskView button£¬then you can terminate the process and dump the memory with three mode(Dump Full¡¢Dump Partial and Dump Region), and you can also corrent the image size of the module.
   
ninth, Get Import table

   After hitting the Get IAT button, getting the import table after choose the process, input the right OEP information before hitting DumpFixer button. 
   
   If any undistinguished API appears, you can set virtual machine decode steps, and decode this item by hitting VM Decode menu.
   
   If there is any information which you do not want, hit Del Thunk menu or Cut Thunk menu to delete it.
   
   If you want to get the import table for the non-main module of the process, please use right button in Manipulation records frame, and hitting Load this module menu, that is the module's import table obtained in this way.
   
Contact Us:   

   If you have any problems/suggestions in using or necessary us to add new functions in it, send us email and we will try to help, if you think the current file is good at that we modify the bug of FFI, you can send to us too.
   
   
Supercop£ºKill various kinds of Trojan horse completely, protect the security of system in an all-round way. 
more free tools download£ºhttp://www.dswlab.com
Specialized desktop and safe products of content £ºhttp://www.unnoo.com
