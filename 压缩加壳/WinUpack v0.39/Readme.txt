                __   ______   ______   ______   ____
           ____/ /_ _\    /_ _\__  /_ _\    /_ _\  /___
          _\  /   //   /   //       //   /___//   /   /
     ____/   /   //   /   //   /   //   /   //   /   /__
  \\ \__    /   //   /   //   /   //   /   //   /   ___/ //
    ___/   /   //   /   //   /   //   /   //   /   /__
 \\ \_    /   //   /   //   /   //   /   //   /   ___// //
     /_  /   //_  ____//_  /   //_  /   //_     _/
        /______\ /__\     /______\ /______\ /__\___\
     -----------------------------------------------------
     (Win)Upack (Ultimate PE Packer) Version: 0.39final

     Author:   Dwing
     Contact:  dwing@163.com
     Homepage: http://dwing.51.net
               http://dwing.wex.cn
               http://www.wex.cn/dwing/

     ====< Introduction >=============================================

      Upack is a packer that can compress Windows PE file, which may
      self-decompress and run normally without any other decompresser.
      WinUpack is the GUI version of Upack.

      It can pack executable files of Windows PE format files
      with almost the best compression ratio.
      Whereas DOS-EXEs(MZ), Win3.x-EXE/DLLs(NE),
      and any other platform programs are not supported by Upack.
      Upack is only for compression, not for protection mainly.

      This is the first final version, also an anniversary version.
      And I means that I'm going to stop developing this tool,
      though DLL is not supported very well and not optimized well.
      But if you find any bug, still feel free to tell me.
      If there is any EXE program that Upack can't pack or that
      program can't run normally when packed with Upack, test it with
      UPX or ASPack firstly. If they can pack it and the packed
      program runs normally, send the original EXE file to me.
      Remember that Upack can't pack some self-check PE files.
      So you'd better make backup for your PE file before packing it.

     ====< Files >====================================================

      Upack.exe     --- Console version of Upack
      WinUpackE.exe --- English GUI version of Upack
      WinUpackC.exe --- Chinese GUI version of Upack
      WinUpackR.exe --- Russian GUI version of Upack
      Readme.txt    --- This document file

     ====< Usage (for console version) >==============================

     Syntax:   Upack <PE-filename> [-switches...]
     Switches: -c{0...6}   Set LC param of compression [default:3]
               -f{5...273} Set FB param of compression [default:128]
               -test       Only show the result
               -red        Preserve extra data
               -set        Strip export table
               -srt        Strip relocation table
               -rlc XXXX   Relocate base address to XXXX (HEX)
               -rai        Reserve all icons (don't compress them)
               -pdt        Preserve original file date and time
               -force      Force packing suspicious PE file
     Examples: Upack winrar.exe -set
               Upack msvcrt.dll
               Upack notepad.exe -c2 -f32
               Upack winword.exe -c3 -f273 -rlc 400000
               Upack acdsee.exe -c3 -rai
               Upack flash.exe -red -force
               Upack mydll.dll -rlc 60000000

     * The console version only runs under Windows command line
     * DO NOT pack multi-files at the same time
     * Support "Icon Drag&Drop" and "SendTo"
     * Compression result maybe affected by memory size
     * "-rlc" needs base relocation table
     * "-test" does not modify your original file

     ====< History >==================================================

     0.39final -18/12/2005
     ---------------------
      *Slim exe depacker about 23 bytes
      +Support preserving original file date and time (-pdt)
      *Fix minor bugs

     0.38beta  -26/11/2005
     ---------------------
      *Use LZMA 4.30 core
      *Slim exe depacker about 9 bytes
      *Fix a bug of DLL relocation on Win9x
      *Fix minor bugs

     0.37beta  -20/11/2005
     ---------------------
      *Slim exe depacker 56 bytes
      *Fix a bug of reserving extra data
      *Fix minor bugs

     0.36beta  -14/10/2005
     ---------------------
      *Fix compatible problems of 0.35alpha
      *Slim exe depacker about 16 bytes

     0.35alpha -12/10/2005
     ---------------------
      *Fix a conflict with ATI OpenGL driver
      *Slim exe depacker about 8 bytes

     0.34alpha - 8/10/2005
     ---------------------
      *Fix a problem that slow down depacking
      *Fix a bug that can't run on WinNT/2000

     0.33alpha - 1/10/2005
     ---------------------
      *Slim exe depacker about 125 bytes!
      -Remove depack code confusion (for EXE)
      *Fix drag&drop bug on Win98 (for GUI) (thank COdEXpLOrER)
      *Some minor changes

     0.32beta  - 13/8/2005
     ---------------------
      +Support packing resource-only DLL
      +Simple random depack code confusion (only for EXE now)
      *Fix minor bugs

     0.31beta  -  4/8/2005
     ---------------------
      *Fix string resource ID bug (thank Luis R0y0)
      *Minor changes

     0.30beta  - 18/7/2005
     ---------------------
      *Fix some bugs about export table
      *Optimize export table size
      *Fix file mapping align bug
      *Fix file open dialog bug (GUI)
      *Minor changes

     0.29beta  -  4/7/2005
     ---------------------
      *Fix MCAFEE virus detecting bug (a little trick)
      *Fix progress control bug (GUI)
      *Fix minor bugs

     0.28alpha -  1/6/2005
     ---------------------
      +Support packing all kinds of PE files (EXE/DLL/OCX/...)
       (oh, so late:]. Depacker size is 589/684 bytes)
      +Support preserving relocation table for EXE file
      +Image base address can be redefined manually (-rlc XXXX)
       (need relocation table)
      *Switches set are changed (-set/-srt)
      *Export and relocation are preserved defaultly for all PE files
      *Fix minor bugs

     0.27beta  -  2/5/2005
     ---------------------
      *Fix minor bugs

     0.26beta  - 26/4/2005
     ---------------------
      *Fix data directories bug

     0.25beta  -  7/4/2005
     ---------------------
      *Use LZMA 4.16 core
      *Fix image head size bug
      *Fix serious memory leak

     0.24beta  - 24/3/2005
     ---------------------
      *Slim depacker 16 bytes (extreme optimization?)

     0.23beta  - 20/3/2005
     ---------------------
      *Fix additional resource bug
      *Slim depacker 1 byte
      +Add an option (-test)

     0.22beta  - 17/3/2005
     ---------------------
      *Slim depacker 13 bytes

     0.21beta  - 10/3/2005
     ---------------------
      *Slim depacker 2 bytes
      *Fix icon resource bug
      +Add an option (-rlc)
      *Reserve REGISTRY resource

     0.20beta  - 05/3/2005
     ---------------------
      *More compatible on Win2000/XP
      *Fix resource compatibility problem
      +Add an option (-red)
      +Add an option (-rai)
      *Reserve version resource
      *Reserve TYPELIB resource
      *Fix multi-language resource bug
      *Fix E8/E9 transformation bug
      *Fix image size bug
      *Use MSC 13.10.3077 as Upack's compiler

     0.12beta  - 27/2/2005
     ----------------------
      +Add an option (-force)
      +Add DLL identification
      *Fix import table bug
      +Add some error message

     0.11beta  - 22/2/2005
     ----------------------
      *Unreserve version resource
      *Fix destination section address bug
      *Fix repack bug
      *Fix stack/heap size bug

     0.10beta  - 25/1/2005
     ----------------------
      *Some details
      +Add some options (-c/-f/-ret)
      *Fix some bugs

     0.09alpha - 11/1/2005
     ----------------------
      *Fix string resource ID bug
      +Add compression progress
      *Fix rebuilding export table bug

     0.08alpha - 10/1/2005
     ----------------------
      *Slim depacker 9 bytes
      *Fix rebuilding import table bug
      +Remove debug data

     0.07alpha - 09/1/2005
     ----------------------
      *Fix compatibility with some OS
      *13 bytes larger than last version

     0.06alpha - 09/1/2005
     ----------------------
      +Add some error information
      +Add displaying in/out file size
      +Auto-size dictionary
      *Slim depacker 1 byte
      *Fix some bugs

     0.05alpha - 08/1/2005
     ----------------------
      *Fix E8/E9 transformation bug
      *Add depacker 3 bytes
      +Strip relocation table
      +Remove copyright data
      *Fix some bugs

     0.04alpha - 07/1/2005
     ----------------------
      +Support export table
      *Fixed revserved icons
      *Slim depacker 2 bytes
      *Fix some bugs

     0.03alpha - 05/01/2005
     ----------------------
      +Support string resource ID
      +Support TLS table
      *Fix some bugs

     0.02alpha - 04/01/2005
     ----------------------
      +E8/E9 address transformation
      +Make PE tighter
      *Fix some bugs

     0.01alpha - 03/01/2005
     ----------------------
      !Initial version
      +LZMA data compression coder
      +Very slim depacker(624 bytes)
      +Very tight PE struct
      +Import table compression
      +Resource compression
      +Support number resource ID
      +Reserve some icons, version, xml resource

     ====< Disclaimer >===============================================

      Dwing(NOT my real name), the author of Upack, disclaims any
      liability for any damage caused by using or misusing this
      software. The author cannot be held responsible for data loss
      or other damages and any consequences from this loss or damages.

     ====< Thanks and greetings to >==================================

     * Igor Pavlov's        LZMA (the best LZ compression algorithm)
     * Microsoft's          Visual C++ (also a good assambler)
     * Oleh Yuschuk's       OllyDbg (have hard time with it)
     * Yuri's               Hedit (always use it)
     * Toshifumi Yamamoto's eXeScope
     * luis royo's          PE head optimization advice
     * Peter Ferrie's       code optimization advice
     * Dmitry's             Russian support
     * Northfox's           MEW
     * ryg's                kkrunchy
     * URSoftware's         W32Dasm
     * rambo/the_loop's     logo
     * Raiko's              icon
     * Lucho, Stanislav, and others who care this little tool
 #####################################################################
