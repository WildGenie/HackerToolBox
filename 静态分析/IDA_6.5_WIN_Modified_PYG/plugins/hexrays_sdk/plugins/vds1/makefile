PROC=hexrays_sample1
#LINK_ULINK=1
!if LINK_ULINK
_LDFLAGS=/OPT:REF /OPT:NOWIN98 /OPT:ICF
!endif
!include ..\plugin.mak

# MAKEDEP dependency list ------------------
$(F)hexrays_sample1$(O): $(I)area.hpp $(I)bytes.hpp $(I)fpro.h $(I)funcs.hpp       \
	          $(I)hexrays.hpp $(I)ida.hpp $(I)idp.hpp $(I)ieee.h        \
	          $(I)kernwin.hpp $(I)lines.hpp $(I)llong.hpp               \
	          $(I)loader.hpp $(I)nalt.hpp $(I)name.hpp $(I)netnode.hpp  \
	          $(I)pro.h $(I)segment.hpp $(I)typeinf.hpp $(I)ua.hpp      \
	          $(I)xref.hpp hexrays_sample1.cpp
