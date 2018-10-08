//
//      This file is automatically executed when IDA is started.
//      You can define your own IDC functions and assign hotkeys to them.
//
//      You may add your frequently used functions here and they will
//      be always available.
//
//
#include <idc.idc>

//-----------------------------------------------------------------------
// A singleton class for managing breakpoints
class BreakpointManager
{
  // Returns the breakpoints quantity
  Count()
  {
    return GetBptQty();
  }

  // Returns a breakpoint object
  Get(index)
  {
    auto count = this.Count();
    if ( index >= count )
      throw form("Invalid breakpoint index %d (0..%d expected).", index, count);
    return Breakpoint(index);
  }

  // Adds a breakpoint
  Add(bpt)
  {
    return bpt._add();
  }

  // Deletes a breakpoint
  Delete(bpt)
  {
    return bpt._delete();
  }

  // Updates a breakpoint
  Update(bpt)
  {
    return bpt._update();
  }
}

// Breakpoint manager class instance
extern Breakpoints;

//-----------------------------------------------------------------------
// Get name of the current processor
static get_processor_name(void)
{
  auto i;

  auto procname = "";
  for ( i=0; i < 8; i++ )
  {
    auto chr = GetCharPrm(INF_PROCNAME+i);
    if ( chr == 0 )
      break;
    procname = procname + chr;
  }
  return procname;
}

//-----------------------------------------------------------------------
// Get signed extended 16-bit value
static SWord(ea)
{
  auto v = Word(ea);
  if ( v & 0x8000 )
    v = v | ~0xFFFF;
  return v;
}

//-----------------------------------------------------------------------
static main(void)
{
  //
  //      This function is executed when IDA is started.
  //
  //      Add statements to fine-tune your IDA here.
  //

  // Instantiate the breakpoints singleton object
  Breakpoints = BreakpointManager();

  // uncomment this line to remove full paths in the debugger process options:
  // SetCharPrm(INF_LFLAGS, LFLG_DBG_NOPATH|GetCharPrm(INF_LFLAGS));
}
