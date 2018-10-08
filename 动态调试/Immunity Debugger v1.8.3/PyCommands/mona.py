"""
 
U{Corelan<http://www.corelan.be>}

 
$Revision: 21 $
$Id: mona.py 21 2011-06-18 15:30:27Z corelanc0d3r $ 
"""

__VERSION__ = '1.0'
__IMM__ = '1.8'

import debugger
import immlib
import getopt
import debugtypes
import immutils
from immutils import *
import pefile

import sys
import struct
import string
import time
import datetime
import binascii
import re
import urllib
import shutil

from operator import itemgetter

import traceback
import inspect



DESC = "Corelan Team exploit development swiss army knife / PyCommand for Immunity Debugger"

#---------------------------------------#
#  Global stuff                         #
#---------------------------------------#	

TOP_USERLAND = 0x7fffffff
g_modules={}
ptr_counter = 0
ptr_to_get = -1
silent = False
ignoremodules = False
imm = immlib.Debugger()


#---------------------------------------#
#  Utility functions                    #
#---------------------------------------#	
def toHex(n):
	"""
	Converts a numeric value to hex (pointer to hex)

	Arguments:
	n - the value to convert

	Return:
	A string, representing the value in hex (8 characters long)
	"""
	return "%08x" % n

def toHexByte(n):
	"""
	Converts a numeric value to a hex byte

	Arguments:
	n - the vale to convert (max 255)

	Return:
	A string, representing the value in hex (1 byte)
	"""
	return "%02X" % n

def toAscii(n):
	"""
	Converts a byte to its ascii equivalent. Null byte = space

	Arguments:
	n - A string (2 chars) representing the byte to convert to ascii

	Return:
	A string (one character), representing the ascii equivalent
	"""
	asciiequival = " "
	try:
		if n != "00":
			asciiequival=binascii.a2b_hex(n)
		else:
			asciiequival = " "
	except:
		asciiequival=" "
	return asciiequival

def hex2bin(pattern):
	"""
	Converts a hex string (\\x??\\x??\\x??\\x??) to real hex bytes

	Arguments:
	pattern - A string representing the bytes to convert 

	Return:
	the bytes
	"""
	pattern = pattern.replace("\\x", "")
	pattern = pattern.replace("\"", "")
	pattern = pattern.replace("\'", "")
	cnt = 0
	strb = ""
	while cnt < len(pattern):
		strb += binascii.a2b_hex(pattern[cnt:cnt+2])
		cnt=cnt+2
	return strb
	
def rmLeading(input,toremove,toignore=""):
	"""
	Removes leading characters from an input string
	
	Arguments:
	input - the input string
	toremove - the character to remove from the begin of the string
	toignore - ignore this character
	
	Return:
	the input string without the leading character(s)
	"""
	newstring = ""
	cnt = 0
	while cnt < len(input):
		if input[cnt] != toremove and input[cnt] != toignore:
			break
		cnt += 1
	
	newstring = input[cnt:len(input)]
	return newstring

def getVersionInfo(filename):
	"""Retrieves version and revision numbers from a mona file
	
	Arguments : filename
	
	Return :
	version - string with version (or empty if not found)
	revision - string with revision (or empty if not found)
	"""

	file = open(filename,"rb")
	content = file.readlines()
	file.close()
	revision = ""
	version = ""
	for line in content:
		if line.startswith("$Revision"):
			parts = line.split(" ")
			if len(parts) > 1:
				revision = parts[1].replace("$","")
		if line.startswith("__VERSION__"):
			parts = line.split("=")
			if len(parts) > 1:
				version = parts[1].strip()
	return version,revision
	
def hexStrToInt(inputstr):
	"""
	Converts a string with hex bytes to a numeric value
	Arguments:
	inputstr - A string representing the bytes to convert. Example : 41414141

	Return:
	the numeric value
	"""
	return int(inputstr,16)
	
def toSize(input,size):
	"""
	Adds spaces to a string until the string reaches a certain length

	Arguments:
	input - A string
	size - the destination size of the string 

	Return:
	the expanded string of length <size>
	"""
	i = len(input)
	while i < size:
		input += " "
		i+=1
	return input
	
def toUnicode(input):
	"""
	Converts a series of bytes to unicode bytes
	
	Arguments :
	input - the source bytes
	
	Return:
	the unicode expanded version of the input
	"""
	inputlst = list(input)
	unicodebytes=""
	for inputchar in inputlst:
		unicodebytes += inputchar + '\x00'
	return unicodebytes

def isAddress(string):
	"""
	Check if a string is an address / consists of hex chars only

	Arguments:
	string - the string to check

	Return:
	Boolean - True if the address string only contains hex bytes
	"""
	string = string.replace("\\x","")
	if len(string) > 8:
		return False
	for char in string:
		if char.upper() not in ["A","B","C","D","E","F","1","2","3","4","5","6","7","8","9","0"]:
			return False
	return True

def addrToInt(string):
	"""
	Convert a textual address to an integer

	Arguments:
	string - the address

	Return:
	int - the address value
	"""
	
	string = string.replace("\\x","")
	return hexStrToInt(string)
	
def splitAddress(address):
	"""
	Splits a string (8 chars), representing a dword, into individual bytes (4 bytes)

	Arguments:
	address - The string to split

	Return:
	4 bytes
	"""
	byte1 = address >> 24 & 0xFF
	byte2 = address >> 16 & 0xFF
	byte3 = address >>  8 & 0xFF
	byte4 = address & 0xFF
	
	return byte1,byte2,byte3,byte4

def bytesInRange(address, range):
	"""
	Checks if all bytes of an address are in a range

	Arguments:
	address - the address to check (8 chars, representing a dword)
	range - a range object containing the values all bytes need to comply with

	Return:
	a boolean
	"""
	
	byte1,byte2,byte3,byte4 = splitAddress(address)
	
	# if the first is a null we keep the address anyway
	if not (byte1 == 0 or byte1 in range):
		return False
	elif not byte2 in range:
		return False
	elif not byte3 in range:
		return False
	elif not byte4 in range:
		return False
	
	return True

def readString(address):
	"""
	Reads a string from the given address until it reaches a null bytes

	Arguments:
	address - the base address (integer value)

	Return:
	the string
	"""
	toreturn = ""
	thisbyte=1
	cnt=0
	while thisbyte != 0:
		thischar = imm.readMemory(address+cnt,1)
		thisbyte = ord(thischar)
		if thisbyte != 0:
			toreturn = toreturn + thischar
		cnt += 1
	return toreturn
	
def getStacks():
	"""
	Retrieves all stacks from all threads in the current application

	Arguments:
	None

	Return:
	a dictionary, with key = threadID. Each entry contains an array with base and top of the stack
	"""
	stacks = {}
	threads = imm.getAllThreads() 
	for thread in threads:
		teb = thread.getTEB()
		tid = thread.getId()
		topStack = struct.unpack('<L',imm.readMemory(teb+4,4))[0]
		baseStack = struct.unpack('<L',imm.readMemory(teb+8,4))[0]
		stacks[tid] = [baseStack,topStack]
	return stacks

def meetsAccessLevel(page,accessLevel):
	"""
	Checks if a given page meets a given access level

	Arguments:
	page - a page object
	accesslevel - a string containing one of the following access levels :
	R,W,X,RW,RX,WR,WX,RWX or *

	Return:
	a boolean
	"""
	if "*" in accessLevel:
		return True
	
	pageAccess = page.getAccess(human=True)
	
	if "R" in accessLevel:
		if not "READ" in pageAccess:
			return False
	if "W" in accessLevel:
		if not "WRITE" in pageAccess:
			return False
	if "X" in accessLevel:
		if not "EXECUTE" in pageAccess:
			return False
			
	return True

def splitToPtrInstr(input):
	"""
	Splits a line (retrieved from a mona output file) into a pointer and a string with the instructions in the file

	Arguments:
	input : the line containing pointer and instruction

	Return:
	a pointer - (integer value)
	a string - instruction
	if the input does not contain a valid line, pointer will be set to -1 and string will be empty
	"""	
	
	thispointer = -1
	thisinstruction = ""
	split1 = re.compile(" ")
	split2 = re.compile(":")
	split3 = re.compile("\*\*")
	
	thisline = input.lower()
	if thisline.startswith("0x"):
		#get the pointer
		parts = split1.split(input)
		if len(parts[0]) != 10:
			return thispointer,thisinstruction
		else:
			thispointer = hexStrToInt(parts[0])
			if len(parts) > 1:
				subparts = split2.split(input)
				subpartsall = ""
				if len(subparts) > 1:
					cnt = 1
					while cnt < len(subparts):
						subpartsall += subparts[cnt] + ":"
						cnt +=1
					subsubparts = split3.split(subpartsall)
					thisinstruction = subsubparts[0].strip()
			return thispointer,thisinstruction
	else:
		return thispointer,thisinstruction
		
def getPatternLength(startptr,type="normal"):
	"""
	Gets length of a metasploit pattern, starting from a given pointer
	
	Arguments:
	startptr - the start pointer (integer value)
	type - optional string, indicating type of pattern :
		"normal" : normal pattern
		"unicode" : unicode pattern
		"upper" : uppercase pattern
		"lower" : lowercase pattern
	"""
	patternsize = 0
	endofpattern = False
	fullpattern = createPattern(20280)
	if type == "upper":
		fullpattern = fullpattern.upper()
	if type == "lower":
		fullpattern = fullpattern.lower()
	#if type == "unicode":
	#	fullpattern = toUnicode(fullpattern)
	
	if type in ["normal","upper","lower","unicode"]:
		previousloc = -1
		while not endofpattern and patternsize <= len(fullpattern):
			sizemeter=imm.readMemory(startptr+patternsize,4)
			if type == "unicode":
				sizemeter=imm.readMemory(startptr+patternsize,8)
				sizemeter = sizemeter.replace('\x00','')
			else:
				sizemeter=imm.readMemory(startptr+patternsize,4)
			if len(sizemeter) == 4:
				thisloc = fullpattern.find(sizemeter)
				if thisloc < 0 or thisloc <= previousloc:
					endofpattern = True
				else:
					patternsize += 4
					previousloc = thisloc
			else:
				return patternsize
		#maybe this is not the end yet
		patternsize -= 8
		endofpattern = False
		while not endofpattern and patternsize <= len(fullpattern):
			sizemeter=imm.readMemory(startptr+patternsize,4)
			if type == "unicode":
				sizemeter=imm.readMemory(startptr+patternsize,8)
				sizemeter = sizemeter.replace('\x00','')
			else:
				sizemeter=imm.readMemory(startptr+patternsize,4)
			if fullpattern.find(sizemeter) < 0:
				patternsize += 3
				endofpattern = True
			else:		
				patternsize += 1
	if type == "unicode":
		patternsize = patternsize / 2
	return patternsize
	
def getAPointer(modules,criteria,accesslevel):
	"""
	Gets the first pointer from one of the supplied module that meets a set of criteria
	
	Arguments:
	modules - array with module names
	criteria - dictionary describing the criteria the pointer needs to comply with
	accesslevel - the required access level
	
	Return:
	a pointer (integer value) or 0 if nothing was found
	"""
	pointer = 0
	imm.getMemoryPages()
	for a in imm.MemoryPages.keys():
			page_start = a
			page_size  = imm.MemoryPages[a].getSize()
			page_end   = a + page_size
			#page in one of the modules ?
			if meetsAccessLevel(imm.MemoryPages[a],accesslevel):
				pageptr = MnPointer(a)
				thismodulename = pageptr.belongsTo()
				if thismodulename != "" and thismodulename in modules:
					thismod = MnModule(thismodulename)
					start = thismod.moduleBase
					end = thismod.moduleTop
					cnt = 0
					while cnt <= page_size:
						thispointer = MnPointer(page_start + cnt)
						if meetsCriteria(thispointer,criteria):
							return page_start + cnt
						cnt += 1
	return pointer
	
	
def haveRepetition(string, pos):
	first =  string[pos]
	MIN_REPETITION = 3		
	if len(string) - pos > MIN_REPETITION:
		count = 1
		while ( count < MIN_REPETITION and string[pos+count] ==  first):
			count += 1
		if count >= MIN_REPETITION:
			return True
	return False
	
def isAscii(b):
	"""
	Check if a given hex byte is ascii or not
	
	Argument : the byte
	Returns : Boolean
	"""
	return b == 0x0a or b == 0x0d or (b >= 0x20 and b <= 0x7e)
	
def isHexString(input):
	"""
	Checks if all characters in a string are hex (0->9, a->f, A->F)
	Alias for isAddress()
	"""
	return isAddress(input)

#---------------------------------------#
#   Class to call commands & parse args #
#---------------------------------------#

class MnCommand:
	"""
	Class to call commands, show usage and parse arguments
	"""
	def __init__(self, name, description, usage, parseProc):
		self.name = name
		self.description = description
		self.usage = usage
		self.parseProc = parseProc


#---------------------------------------#
#   Class to access config file         #
#---------------------------------------#
class MnConfig:
	"""
	Class to perform config file operations
	"""
	def __init__(self):
	
		self.configfile = "mona.ini"
	
	def get(self,parameter):
		"""
		Retrieves the contents of a given parameter from the config file

		Arguments:
		parameter - the name of the parameter 

		Return:
		A string, containing the contents of that parameter
		"""	
		#read config file
		#format :  parameter=value
		toreturn = ""
		curparam=[]
		if os.path.exists(self.configfile):
			try:
				configfileobj = open(self.configfile,"rb")
				content = configfileobj.readlines()
				configfileobj.close()
				for thisLine in content:
					if not thisLine[0] == "#":
						currparam = thisLine.split('=')
						if currparam[0].strip().lower() == parameter.strip().lower() and len(currparam) > 1:
							#get value
							currvalue = ""
							i=1
							while i < len(currparam):
								currvalue = currvalue + currparam[i] + "="
								i += 1
							toreturn = currvalue.rstrip("=").replace('\n','').replace('\r','')
			except:
				toreturn=""
		
		return toreturn
	
	def set(self,parameter,paramvalue):
		"""
		Sets/Overwrites the contents of a given parameter in the config file

		Arguments:
		parameter - the name of the parameter 
		paramvalue - the new value of the parameter

		Return:
		nothing
		"""		
		if os.path.exists(self.configfile):
			#modify file
			try:
				configfileobj = open(self.configfile,"r")
				content = configfileobj.readlines()
				configfileobj.close()
				newcontent = []
				paramfound = False
				for thisLine in content:
					thisLine = thisLine.replace('\n','').replace('\r','')
					if not thisLine[0] == "#":
						currparam = thisLine.split('=')
						if currparam[0].strip().lower() == parameter.strip().lower():
							newcontent.append(parameter+"="+paramvalue+"\n")
							paramfound = True
						else:
							newcontent.append(thisLine+"\n")
					else:
						newcontent.append(thisLine+"\n")
				if not paramfound:
					newcontent.append(parameter+"="+paramvalue+"\n")
				#save new config file (rewrite)
				imm.log("[+] Saving config file, modified parameter %s" % parameter)
				FILE=open(self.configfile,"w")
				FILE.writelines(newcontent)
				FILE.close()
			except:
				imm.log("Error writing config file : %s : %s" % (sys.exc_type,sys.exc_value),highlight=1)
				return ""
		else:
			#create new file
			try:
				imm.log("[+] Creating config file, setting parameter %s" % parameter)
				FILE=open(self.configfile,"w")
				FILE.write("# -----------------------------------------------#\n")
				FILE.write("# Corelan Team PyCommand for Immunity Debugger   #\n")
				FILE.write("# configuration file                             #\n")
				FILE.write("# -----------------------------------------------#\n")
				FILE.write(parameter+"="+paramvalue+"\n")
				FILE.close()
			except:
				imm.log(" ** Error writing config file", highlight=1)
				return ""
		return ""
	
	
#---------------------------------------#
#   Class to log entries to file        #
#---------------------------------------#
class MnLog:
	"""
	Class to perform logfile operations
	"""
	def __init__(self, filename):
		
		self.filename = filename
		
			
	def reset(self,clear=True):
		"""
		Optionally clears a log file, write a header to the log file and return filename

		Optional :
		clear = Boolean. When set to false, the logfile won't be cleared. This method can be
		used to retrieve the full path to the logfile name of the current MnLog class object
		Logfiles are written to the Immunity Debugger program folder, unless a config value 'workingfolder' is set.

		Return:
		full path to the logfile name.
		"""	
		if clear:
			imm.log("[+] Preparing log file '" + self.filename +"'")
		debuggedname = imm.getDebuggedName()
		thispid = imm.getDebuggedPid()
		thisconfig = MnConfig()
		workingfolder = thisconfig.get("workingfolder").rstrip("\\").strip()
		#strip extension from debuggedname
		parts = debuggedname.split(".")
		extlen = len(parts[len(parts)-1])+1
		debuggedname = debuggedname[0:len(debuggedname)-extlen]
		debuggedname = debuggedname.replace(" ","_")
		workingfolder = workingfolder.replace('%p', debuggedname)
		workingfolder = workingfolder.replace('%i', str(thispid))		
		logfile = workingfolder + "\\" + self.filename
		#does working folder exist ?
		if workingfolder != "":
			if not os.path.exists(workingfolder):
				try:
					imm.log("    - Creating working folder %s" % workingfolder)
					#recursively create folders
					os.makedirs(workingfolder)
					imm.log("    - Folder created")
				except:
					imm.log("   ** Unable to create working folder %s, Immunity Folder will be used instead" % workingfolder,highlight=1)
					logfile = self.filename
		else:
			logfile = self.filename
		if clear:
			imm.log("    - (Re)setting logfile %s" % logfile)
			try:
				if os.path.exists(logfile):
					try:
						os.delete(logfile+".old")
					except:
						pass
					try:
						os.rename(logfile,logfile+".old")
					except:
						try:
							os.rename(logfile,logfile+".old2")
						except:
							pass
			except:
				pass
			#write header
			try:
				FILE=open(logfile,"w")
				FILE.write("=" * 80)
				FILE.write("\n  Output generated by mona.py v"+__VERSION__+"\n")
				FILE.write("  Corelan Team - http://www.corelan.be\n")
				FILE.write("=" * 80)
				osver=imm.getOsVersion()
				osrel=imm.getOsRelease()
				FILE.write("\n  OS : " + osver + ", release " + osrel+"\n")
				FILE.write("  Process being debugged : " + debuggedname +" (pid " + str(thispid) + ")\n")
				FILE.write("=" * 80)
				FILE.write("\n  " + datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") + "\n")
				FILE.write("=" * 80)
				FILE.write("\n")
				FILE.close()
			except:
				pass
			#write module table
			try:
				if not ignoremodules:
					showModuleTable(logfile)
			except:
				pass
		return logfile
		
	def write(self,entry,logfile):
		"""
		Write an entry (can be multiline) to a given logfile

		Arguments:
		entry - the data to write to the logfile
		logfile - the full path to the logfile

		Return:
		nothing
		"""		
		towrite = ""
		#check if entry is int 
		if type(entry) == int:
			if entry > 0:
				ptrx = MnPointer(entry)
				modname = ptrx.belongsTo()
				modinfo = MnModule(modname)
				towrite = "0x" + toHex(entry) + " : " + ptrx.__str__() + " " + modinfo.__str__()
			else:
				towrite = entry
		else:
			towrite = entry
		towrite = str(towrite)
		try:
			FILE=open(logfile,"a")
			if towrite.find('\n') > -1:
				FILE.writelines(towrite)
			else:
				FILE.write(towrite+"\n")
			FILE.close()
		except:
			pass
		return True
	
	
#---------------------------------------#
#  Class to access module properties    #
#---------------------------------------#
	
class MnModule:
	"""
	Class to access module properties
	"""
	def __init__(self, modulename):
		
		modisaslr = True
		modissafeseh = True
		modrebased = True
		modisnx = True
		modisos = True
		path = ""
		mzbase = 0
		mzsize = 0
		mztop = 0
		mversion = ""
		if modulename != "":
			# if info is cached, retrieve from cache
			if ModInfoCached(modulename):
				modisaslr = getModuleProperty(modulename,"aslr")
				modissafeseh = getModuleProperty(modulename,"safeseh")
				modrebased = getModuleProperty(modulename,"rebase")
				modisnx = getModuleProperty(modulename,"nx")
				modisos = getModuleProperty(modulename,"os")
				path = getModuleProperty(modulename,"path")
				mzbase = getModuleProperty(modulename,"base")
				mzsize = getModuleProperty(modulename,"size")
				mztop = getModuleProperty(modulename,"top")
				mversion = getModuleProperty(modulename,"version")
			else:
				#gather info manually - this code should only get called from populateModuleInfo()
				self.module = imm.getModule(modulename)	
				modissafeseh = True
				modisaslr = True
				modisnx = True
				modrebased = False
				modisos = False
				
				mod=self.module
				mzbase=mod.getBaseAddress()
				mzrebase=mod.getFixupbase()
				mzsize=mod.getSize()
				mversion=mod.getVersion()
				
				mversion=mversion.replace(", ",".")
				mversionfields=mversion.split('(')
				mversion=mversionfields[0].replace(" ","")
								
				if mversion=="":
					mversion="-1.0-"
				path=mod.getPath()
				osmod=mod.getIssystemdll()
				if osmod==0:
					modisos = False
					if path.upper().find("WINDOWS") > -1:
						modisos = True
				else:
					modisos = True
				mztop=mzbase+mzsize
				if mzbase > 0:
					peoffset=struct.unpack('<L',imm.readMemory(mzbase+0x3c,4))[0]
					pebase=mzbase+peoffset
					flags=struct.unpack('<H',imm.readMemory(pebase+0x5e,2))[0]
					numberofentries=struct.unpack('<L',imm.readMemory(pebase+0x74,4))[0]
					#safeseh ?
					if (flags&0x400)!=0:
						modissafeseh=True
					else:
						if numberofentries>10:
							sectionaddress,sectionsize=struct.unpack('<LL',imm.readMemory(pebase+0x78+8*10,8))
							sectionaddress+=mzbase
							data=struct.unpack('<L',imm.readMemory(sectionaddress,4))[0]
							condition=(sectionsize!=0) and ((sectionsize==0x40) or (sectionsize==data))
							if condition==False:
								modissafeseh=False
							else:
								sehlistaddress,sehlistsize=struct.unpack('<LL',imm.readMemory(sectionaddress+0x40,8))
								if sehlistaddress!=0 and sehlistsize!=0:
									modissafeseh=True
					#aslr
					if (flags&0x0040)==0:  # 'IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE
						modisaslr=False
					#nx
					if (flags&0x0100)==0:
						modisnx=False
					#rebase
					if mzrebase <> mzbase:
						modrebased=True
		
		#check if module is excluded
		thisconfig = MnConfig()
		allexcluded = []
		excludedlist = thisconfig.get("excluded_modules")
		modfound = False
		if excludedlist:
			allexcluded = excludedlist.split(',')
			for exclentry in allexcluded:
				if exclentry.lower().strip() == modulename.lower().strip():
					modfound = True
		self.isExcluded = modfound
		
		#done - populate variables
		self.isAslr = modisaslr
		
		self.isSafeSEH = modissafeseh
		
		self.isRebase = modrebased
		
		self.isNX = modisnx
		
		self.isOS = modisos
		
		self.moduleKey = modulename
	
		self.modulePath = path
		
		self.moduleBase = mzbase
		
		self.moduleSize = mzsize
		
		self.moduleTop = mztop
		
		self.moduleVersion = mversion
		
			
	
	def __str__(self):
		#return general info about the module
		#modulename + info
		"""
		Get information about a module (human readable format)

		Arguments:
		None

		Return:
		String with various properties about a module
		"""			
		outstring = ""
		if self.moduleKey != "":
			outstring = "[" + self.moduleKey + "] ASLR: " + str(self.isAslr) + ", Rebase: " + str(self.isRebase) + ", SafeSEH: " + str(self.isSafeSEH) + ", OS: " + str(self.isOS) + ", v" + self.moduleVersion + " (" + self.modulePath + ")"
		else:
			outstring = "[None]"
		return outstring
		
	def isAslr(self):
		return self.isAslr
		
	def isSafeSEH(self):
		return self.isSafeSEH
		
	def isRebase(self):
		return self.isRebase
		
	def isOS(self):
		return self.isOS
	
	def isNX(self):
		return self.isNX
		
	def moduleKey(self):
		return self.moduleKey
		
	def modulePath(self):
		return self.modulePath
	
	def moduleBase(self):
		return self.moduleBase
	
	def moduleSize(self):
		return self.moduleSize
	
	def moduleTop(self):
		return self.moduleTop
		
	def moduleVersion(self):
		return self.moduleVersion
		
	def isExcluded(self):
		return self.isExcluded
	
	def getFunctionCalls(self,criteria):
		funccalls = {}
		sequences = []
		sequences.append(["call","\xff\x15"])
		funccalls = searchInRange(sequences, self.moduleBase, self.moduleTop,criteria)
		return funccalls
		
	
#---------------------------------------#
#  Class to access pointer properties   #
#---------------------------------------#
class MnPointer:
	"""
	Class to access pointer properties
	"""
	def __init__(self,address):
	
		# check that the address is an integer
		if not type(address) == int and not type(address) == long:
			raise Exception("address should be an integer or long")
	
		self.address = address
		
		# define the characteristics of the pointer
		byte1,byte2,byte3,byte4 = splitAddress(address)
		NullRange 			= [0]
		AsciiRange			= range(1,128)
		AsciiPrintRange		= range(20,127)
		AsciiUppercaseRange = range(65,91)
		AsciiLowercaseRange = range(97,123)
		AsciiAlphaRange     = AsciiUppercaseRange + AsciiLowercaseRange
		AsciiNumericRange   = range(48,58)
		AsciiSpaceRange     = [32]
		
		self.HexAddress = toHex(address)
		
		# Nulls
		self.hasNulls = (byte1 == 0) or (byte2 == 0) or (byte3 == 0) or (byte4 == 0)
		
		# Starts with null
		self.startsWithNull = (byte1 == 0)
		
		# Unicode
		self.isUnicode = ((byte1 == 0) and (byte3 == 0))
		
		# Unicode transform
		self.unicodeTransform = UnicodeTransformInfo(self.HexAddress) 
		
		# Ascii
		if not self.isUnicode:			
			self.isAscii = bytesInRange(address, AsciiRange)
		else:
			self.isAscii = bytesInRange(address, NullRange + AsciiRange)
		
		# AsciiPrintable
		if not self.isUnicode:
			self.isAsciiPrintable = bytesInRange(address, AsciiPrintRange)
		else:
			self.isAsciiPrintable = bytesInRange(address, NullRange + AsciiPrintRange)
			
		# Uppercase
		if not self.isUnicode:
			self.isUppercase = bytesInRange(address, AsciiUppercaseRange)
		else:
			self.isUppercase = bytesInRange(address, NullRange + AsciiUppercaseRange)
		
		# Lowercase
		if not self.isUnicode:
			self.isLowercase = bytesInRange(address, AsciiLowercaseRange)
		else:
			self.isLowercase = bytesInRange(address, NullRange + AsciiLowercaseRange)
			
		# Numeric
		if not self.isUnicode:
			self.isNumeric = bytesInRange(address, AsciiNumericRange)
		else:
			self.isNumeric = bytesInRange(address, NullRange + AsciiNumericRange)
			
		# Alpha numeric
		if not self.isUnicode:
			self.isAlphaNumeric = bytesInRange(address, AsciiAlphaRange + AsciiNumericRange + AsciiSpaceRange)
		else:
			self.isAlphaNumeric = bytesInRange(address, NullRange + AsciiAlphaRange + AsciiNumericRange + AsciiSpaceRange)
		
		# Uppercase + Numbers
		if not self.isUnicode:
			self.isUpperNum = bytesInRange(address, AsciiUppercaseRange + AsciiNumericRange)
		else:
			self.isUpperNum = bytesInRange(address, NullRange + AsciiUppercaseRange + AsciiNumericRange)
		
		# Lowercase + Numbers
		if not self.isUnicode:
			self.isLowerNum = bytesInRange(address, AsciiLowercaseRange + AsciiNumericRange)
		else:
			self.isLowerNum = bytesInRange(address, NullRange + AsciiLowercaseRange + AsciiNumericRange)
		
	
	def __str__(self):
		"""
		Get pointer properties (human readable format)

		Arguments:
		None

		Return:
		String with various properties about the pointer
		"""	
		outstring = ""
		if self.startsWithNull:
			outstring += "startnull,"
			
		elif self.hasNulls:
			outstring += "null,"
		
		#check if this pointer is unicode transform
		hexaddr = self.HexAddress
		outstring += UnicodeTransformInfo(hexaddr)

		if self.isUnicode:
			outstring += "unicode,"
		if self.isAsciiPrintable:
			outstring += "asciiprint,"
		if self.isAscii:
			outstring += "ascii,"
		if self.isUppercase:
			outstring == "upper,"
		if self.isLowercase:
			outstring += "lower,"
		if self.isNumeric:
			outstring+= "num,"
			
		if self.isAlphaNumeric and not (self.isUppercase or self.isLowercase or self.isNumeric):
			outstring += "alphanum,"
		
		if self.isUpperNum and not (self.isUppercase or self.isNumeric):
			outstring += "uppernum,"
		
		if self.isLowerNum and not (self.isLowercase or self.isNumeric):
			outstring += "lowernum,"
			
		outstring = outstring.rstrip(",")
		
		outstring += " {" + getPointerAccess(self.address)+"}"
		
		return outstring
	
	def getAddress(self):
		return self.address
	
	def isUnicode(self):
		return self.isUnicode
	
	def isUnicodeTransform(self):
		return self.unicodeTransform != ""
	
	def isAscii(self):
		return self.isAscii
	
	def isAsciiPrintable(self):
		return self.isAsciiPrintable
	
	def isUppercase(self):
		return self.isUppercase
	
	def isLowercase(self):
		return self.isLowercase
		
	def isUpperNum(self):
		return self.isUpperNum
		
	def isLowerNum(self):
		return self.isLowerNum
		
	def isNumeric(self):
		return self.isNumeric
		
	def isAlphaNumeric(self):
		return self.alphaNumeric
	
	def hasNulls(self):
		return self.hasNulls
	
	def startsWithNull(self):
		return self.startsWithNull
		
	def belongsTo(self):
		"""
		Retrieves the module a given pointer belongs to

		Arguments:
		None

		Return:
		String with the name of the module a pointer belongs to,
		or empty if pointer does not belong to a module
		"""		
		if len(g_modules)==0:
			populateModuleInfo()
		modname=""
		for thismodule,modproperties in g_modules.iteritems():
				thisbase = getModuleProperty(thismodule,"base")
				thistop = getModuleProperty(thismodule,"top")
				if (self.address >= thisbase) and (self.address <= thistop):
					return thismodule
		return modname
	
	def isOnStack(self):
		"""
		Checks if the pointer is on one of the stacks of one of the threads in the process

		Arguments:
		None

		Return:
		Boolean - True if pointer is on stack
		"""	
		stacks = getStacks()
		for stack in stacks:
			if (stacks[stack][0] < self.address) and (self.address < stacks[stack][1]):
				return True
		return False
	
	def isInHeap(self):
		"""
		Checks if the pointer is part of one of the pages associated with process heaps

		Arguments:
		None

		Return:
		Boolean - True if pointer is in heap
		"""	
		allheaps = imm.getHeapsAddress()
		inheap = False
		for heap in allheaps:
			if self.address >= heap:
				page   = imm.getMemoryPageByAddress( self.address )
				if page:
					pagesize = page.getSize()
					if self.address <= heap + pagesize:
						inheap = True
		return inheap	
		
		
#---------------------------------------#
#  Various functions                    #
#---------------------------------------#		
def containsBadChars(address,badchars="\x0a\x0d"):
	"""
	checks if the address contains bad chars
	
	Arguments:
	address  - the address
	badchars - string with the characters that should be avoided (defaults to 0x0a and 0x0d)
	
	Return:
	Boolean - True if badchars are found
	"""
	
	bytes = splitAddress(address)
	chars = []
	for byte in bytes:
		chars.append(chr(byte))
	
	# check each char
	for char in chars:
		if char in badchars:
			return True			
	return False


def meetsCriteria(pointer,criteria):
	"""
	checks if an address meets the listed criteria

	Arguments:
	pointer - the MnPointer instance of the address
	criteria - a dictionary with all the criteria to be met

	Return:
	Boolean - True if all the conditions are met
	"""
	
	# Unicode
	if "unicode" in criteria and not (pointer.isUnicode or pointer.unicodeTransform != ""):
		return False
		
	# Ascii
	if "ascii" in criteria and not pointer.isAscii:
		return False
	
	# Ascii printable
	if "asciiprint" in criteria and not pointer.isAsciiPrintable:
		return False
	
	# Uppercase
	if "upper" in criteria and not pointer.isUppercase:
		return False
		
	# Lowercase
	if "lower" in criteria and not pointer.isLowercase:
		return False
	
	# Uppercase numeric
	if "uppernum" in criteria and not pointer.isUpperNum:
		return False
	
	# Lowercase numeric
	if "lowernum" in criteria and not pointer.isLowerNum:
		return False	
		
	# Numeric
	if "numeric" in criteria and not pointer.isNumeric:
		return False
	
	# Alpha numeric
	if "alphanum" in criteria and not pointer.isAlphaNumeric:
		return False
		
	# Bad chars
	if "badchars" in criteria and containsBadChars(pointer.getAddress(), criteria["badchars"]):
		return False

	# Nulls
	if "nonull" in criteria and pointer.hasNulls:
		return False
	
	if "startswithnull" in criteria and not pointer.startsWithNull:
		return False
	
	return True

def search(sequences,criteria=[]):
	"""
	Alias for 'searchInRange'
	search for byte sequences in a specified address range

	Arguments:
	sequences - array of byte sequences to search for
	start - the start address of the search (defaults to 0)
	end   - the end address of the search
	criteria - Dictionary containing the criteria each pointer should comply with

	Return:
	Dictionary (opcode sequence => List of addresses)
	"""	
	return searchInRange(sequences,criteria)
	
	
def searchInRange(sequences, start=0, end=TOP_USERLAND,criteria=[]):
	"""
	search for byte sequences in a specified address range

	Arguments:
	sequences - array of byte sequences to search for
	start - the start address of the search (defaults to 0)
	end   - the end address of the search
	criteria - Dictionary containing the criteria each pointer should comply with

	Return:
	Dictionary (opcode sequence => List of addresses)
	"""
	
	if not "accesslevel" in criteria:
		criteria["accesslevel"] = "*"
	
	global ptr_counter
	global ptr_to_get
	
	found_opcodes = {}
	
	if (ptr_to_get < 0) or (ptr_to_get > 0 and ptr_counter < ptr_to_get):

		if not sequences:
			return {}
			
		# check that start is before end
		if start > end:
			#swap start and end
			temp = start
			start = end
			end = temp

		imm.getMemoryPages()
		imm.setStatusBar("Searching...")
		for a in imm.MemoryPages.keys():

			# get end address of the page
			page_start = a
			page_end   = a + imm.MemoryPages[a].getSize()
			
			if ( start > page_end or end < page_start ):
				# we are outside the search range, skip
				continue
			if (not meetsAccessLevel(imm.MemoryPages[a],criteria["accesslevel"])):
				#skip this page, not executable
				continue
				
			# if the criteria check for nulls or unicode, we can skip
			# modules that start with 00
			start_fb = toHex(page_start)[0:2]
			end_fb = toHex(page_end)[0:2]
			if ( ("nonull" in criteria and criteria["nonull"]) and start_fb == "00" and end_fb == "00"  ):
				if not silent:
					imm.log("      !Skipped search of range %08x-%08x (Has nulls)" % (page_start,page_end))
				continue
			
			if (( ("startswithnull" in criteria and criteria["startswithnull"]))
					and (start_fb != "00" or end_fb != "00")):
				if not silent:
					imm.log("      !Skipped search of range %08x-%08x (Doesn't start with null)" % (page_start,page_end))
				continue
			
			mem = imm.MemoryPages[a].getMemory()
			if not mem:
				continue
			

			# loop on each sequence
			for seq in sequences:
				buf = None
				human_format = ""
				if type(seq) == str:
					human_format = seq.replace("\n"," # ")
					buf = imm.assemble(seq)
				else:
					human_format = seq[0].replace("\n"," # ")
					buf = seq[1]				
				
				buf_len      = len(buf)
				mem_list     = mem.split( buf )
				total_length = buf_len * -1
				recur_find   = []
				
				for i in mem_list:
					total_length = total_length + len(i) + buf_len
					seq_address = a + total_length
					recur_find.append( seq_address )

				#The last one is the remaining slice from the split
				#so remove it from the list
				del recur_find[ len(recur_find) - 1 ]
				
				page_find = []
				for i in recur_find:
					if ( i >= start and i <= end ):
						
						ptr = MnPointer(i)

						# check if pointer meets criteria
						if not meetsCriteria(ptr, criteria):
							continue
						
						page_find.append(i)
						ptr_counter += 1
						if ptr_to_get > 0 and ptr_counter >= ptr_to_get:
						#stop search
							if human_format in found_opcodes:
								found_opcodes[human_format] += page_find
							else:
								found_opcodes[human_format] = page_find
							return found_opcodes
							
				if len(page_find) > 0:
					if human_format in found_opcodes:
						found_opcodes[human_format] += page_find
					else:
						found_opcodes[human_format] = page_find
	return found_opcodes

# search for byte sequences in a module
def searchInModule(sequences, name,criteria=[]):
	"""
	search for byte sequences in a specified module

	Arguments:
	sequences - array of byte sequences to search for
	name - the name of the module to search in

	Return:
	Dictionary (text opcode => array of addresses)
	"""	
	
	module = imm.getModule(name)
	if(not module):
		self.log("module %s not found" % name)
		return []
	
	# get the base and end address of the module
	start = module.getBaseAddress()
	end   = start + module.getSize()

	return searchInRange(sequences, start, end, criteria)

def getRangesOutsideModules():
	"""
	This function will enumerate all memory ranges that are not asssociated with a module
	
	Arguments : none
	
	Returns : array of arrays, each containing a start and end address
	"""	
	ranges=[]
	moduleranges=[]
	#get all ranges associated with modules
	#force full rebuild to get all modules
	populateModuleInfo()
	for thismodule,modproperties in g_modules.iteritems():
		top = 0
		base = 0
		for modprop,modval in modproperties.iteritems():
			if modprop == "top":
				top = modval
			if modprop == "base":
				base = modval
		moduleranges.append([base,top])
	#sort them
	moduleranges.sort()
	#get all ranges before, after and in between modules
	startpointer = 0
	endpointer = TOP_USERLAND
	for modbase,modtop in moduleranges:
		endpointer = modbase-1
		ranges.append([startpointer,endpointer])
		startpointer = modtop+1
	ranges.append([startpointer,TOP_USERLAND])
	#return array
	return ranges
	

def UnicodeTransformInfo(hexaddr):
	"""
	checks if the address can be used as unicode ansi transform
	
	Arguments:
	hexaddr  - a string containing the address in hex format (4 bytes - 8 characters)
	
	Return:
	string with unicode transform info, or empty if address is not unicode transform
	"""
	outstring = ""
	transform=0
	almosttransform=0
	begin = hexaddr[0] + hexaddr[1]
	middle = hexaddr[4] + hexaddr[5]
	twostr=hexaddr[2]+hexaddr[3]
	begintwostr = hexaddr[6]+hexaddr[7]
	threestr=hexaddr[4]+hexaddr[5]+hexaddr[6]
	fourstr=hexaddr[4]+hexaddr[5]+hexaddr[6]+hexaddr[7]
	beginfourstr = hexaddr[0]+hexaddr[1]+hexaddr[2]+hexaddr[3]
	threestr=threestr.upper()
	fourstr=fourstr.upper()
	begintwostr = begintwostr.upper()
	beginfourstr = beginfourstr.upper()
	uniansiconv = [  ["20AC","80"], ["201A","82"],
		["0192","83"], ["201E","84"], ["2026","85"],
		["2020","86"], ["2021","87"], ["02C6","88"],
		["2030","89"], ["0106","8A"], ["2039","8B"],
		["0152","8C"], ["017D","8E"], ["2018","91"],
		["2019","92"], ["201C","93"], ["201D","94"],
		["2022","95"], ["2013","96"], ["2014","97"],
		["02DC","98"], ["2122","99"], ["0161","9A"],
		["203A","9B"], ["0153","9C"], ["017E","9E"],
		["0178","9F"]
		]
	# 4 possible cases :
	# 00xxBBBB
	# 00xxBBBC (close transform)
	# AAAA00xx
	# AAAABBBB
	convbyte=""
	transbyte=""
	ansibytes=""
	#case 1 and 2
	if begin == "00":	
		for ansirec in uniansiconv:
			if ansirec[0]==fourstr:
				convbyte=ansirec[1]
				transbyte=ansirec[1]
				transform=1
				break
		if transform==1:
			outstring +="unicode ansi transformed : 00"+twostr+"00"+convbyte+","
		ansistring=""
		for ansirec in uniansiconv:
			if ansirec[0][:3]==threestr:
				if (transform==0) or (transform==1 and ansirec[1] <> transbyte):
					convbyte=ansirec[1]
					ansibytes=ansirec[0]
					ansistring=ansistring+"00"+twostr+"00"+convbyte+"->00"+twostr+ansibytes+" / "
					almosttransform=1
		if almosttransform==1:
			if transform==0:
				outstring += "unicode possible ansi transform(s) : " + ansistring
			else:
				outstring +=" / alternatives (close pointers) : " + ansistring
			
	#case 3
	if middle == "00":
		transform = 0
		for ansirec in uniansiconv:
			if ansirec[0]==beginfourstr:
				convbyte=ansirec[1]
				transform=1
				break
		if transform==1:
			outstring +="unicode ansi transformed : 00"+convbyte+"00"+begintwostr+","
	#case 4
	if begin != "00" and middle != "00":
		convbyte1=""
		convbyte2=""
		transform = 0
		for ansirec in uniansiconv:
			if ansirec[0]==beginfourstr:
				convbyte1=ansirec[1]
				transform=1
				break
		if transform == 1:
			for ansirec in uniansiconv:
				if ansirec[0]==fourstr:
					convbyte2=ansirec[1]
					transform=2	
					break						
		if transform==2:
			outstring +="unicode ansi transformed : 00"+convbyte1+"00"+convbyte2+","
	
	# done
	outstring = outstring.rstrip(" / ")
	
	if outstring:
		if not outstring.endswith(","):
			outstring += ","
	return outstring

	
def getSearchSequences(searchtype,searchcriteria=""):
	"""
	will build array with search sequences for a given search type
	
	Arguments:
	searchtype = "jmp", "seh"
	
	SearchCriteria (optional): 
		<register> in case of "jmp" : string containing a register
	
	Return:
	array with all searches to perform
	"""
	offsets = [ "", "04","08","0c","10","12","1C"]
	regs=["eax","ebx","ecx","edx","esi","edi","ebp"]
	search=[]
	
	if searchtype.lower() == "jmp":
		if not searchcriteria: 
			searchcriteria = "esp"
		searchcriteria = searchcriteria.lower()
	
		search.append("jmp "+searchcriteria)
		search.append("call "+searchcriteria)
		for roffset in offsets:
			search.append("push "+searchcriteria+"\n ret "+roffset)
			
		for reg in regs:
			if reg != searchcriteria:
				search.append("push " + searchcriteria + "\npop "+reg+"\n jmp "+reg)
				search.append("push " + searchcriteria + "\npop "+reg+"\n call "+reg)			
				search.append("mov "+reg+"," + searchcriteria + "\n jmp "+reg)
				search.append("mov "+reg+"," + searchcriteria + "\n call "+reg)
				search.append("xchg "+reg+","+searchcriteria+"\n jmp " + reg)
				search.append("xchg "+searchcriteria+","+reg+"\n jmp " + reg)
				search.append("xchg "+reg+","+searchcriteria+"\n call " + reg)
				search.append("xchg "+searchcriteria+","+reg+"\n call " + reg)				
				for roffset in offsets:
					search.append("push " + searchcriteria + "\npop "+reg+"\n push "+reg+"\n ret "+roffset)			
					search.append("mov "+reg+"," + searchcriteria + "\n push "+reg+"\n ret "+roffset)
					search.append("xchg "+reg+","+searchcriteria+"\n push " + reg + "\nret " + roffset)
					search.append("xchg "+searchcriteria+","+reg+"\n push " + reg + "\nret " + roffset)					

	if searchtype.lower() == "seh":
		for roffset in offsets:
			for r1 in regs:
				search.append( ["add esp,4\npop " + r1+"\nret "+roffset,imm.assemble("add esp,4\npop " + r1+"\nret "+roffset)] )
				search.append( ["pop " + r1+"\nadd esp,4\nret "+roffset,imm.assemble("pop " + r1+"\nadd esp,4\nret "+roffset)] )				
				for r2 in regs:
					thissearch = ["pop "+r1+"\npop "+r2+"\nret "+roffset,imm.assemble("pop "+r1+"\npop "+r2+"\nret "+roffset)]
					search.append( thissearch )
			search.append( ["add esp,8\nret "+roffset,imm.assemble("add esp,8\nret "+roffset)])
			search.append( ["popad\npush ebp\nret "+roffset,imm.assemble("popad\npush ebp\nret "+roffset)])					
		#popad + jmp/call
		search.append(["popad\njmp ebp",imm.assemble("popad\njmp ebp")])
		search.append(["popad\ncall ebp",imm.assemble("popad\ncall ebp")])		
		#call / jmp dword
		search.append(["call dword ptr ss:[esp+08]","\xff\x54\x24\x08"])
		search.append(["call dword ptr ss:[esp+08]","\xff\x94\x24\x08\x00\x00\x00"])
		search.append(["call dword ptr ds:[esp+08]","\x3e\xff\x54\x24\x08"])

		search.append(["jmp dword ptr ss:[esp+08]","\xff\x64\x24\x08"])
		search.append(["jmp dword ptr ss:[esp+08]","\xff\xa4\x24\x08\x00\x00\x00"])
		search.append(["jmp dword ptr ds:[esp+08]","\x3e\ff\x64\x24\x08"])
		
		search.append(["call dword ptr ss:[esp+14]","\xff\x54\x24\x14"])
		search.append(["call dword ptr ss:[esp+14]","\xff\x94\x24\x14\x00\x00\x00"])	
		search.append(["call dword ptr ds:[esp+14]","\x3e\xff\x54\x24\x14"])
		
		search.append(["jmp dword ptr ss:[esp+14]","\xff\x54\x24\x14"])
		search.append(["jmp dword ptr ss:[esp+14]","\xff\xa4\x24\x14\x00\x00\x00"])		
		search.append(["jmp dword ptr ds:[esp+14]","\x3e\xff\x54\x24\x14"])
		
		search.append(["call dword ptr ss:[esp+1c]","\xff\x54\x24\x1c"])
		search.append(["call dword ptr ss:[esp+1c]","\xff\x94\x24\x1c\x00\x00\x00"])		
		search.append(["call dword ptr ds:[esp+1c]","\x3e\xff\x54\x24\x1c"])
		
		search.append(["jmp dword ptr ss:[esp+1c]","\xff\x54\x24\x1c"])
		search.append(["jmp dword ptr ss:[esp+1c]","\xff\xa4\x24\x1c\x00\x00\x00"])		
		search.append(["jmp dword ptr ds:[esp+1c]","\x3e\xff\x54\x24\x1c"])
		
		search.append(["call dword ptr ss:[esp+2c]","\xff\x54\x24\x2c"])
		search.append(["call dword ptr ss:[esp+2c]","\xff\94\x24\x2c\x00\x00\x00"])
		search.append(["call dword ptr ds:[esp+2c]","\x3e\xff\x54\x24\x2c"])

		search.append(["jmp dword ptr ss:[esp+2c]","\xff\x54\x24\x2c"])
		search.append(["jmp dword ptr ss:[esp+2c]","\xff\xa4\x24\x2c\x00\x00\x00"])		
		search.append(["jmp dword ptr ds:[esp+2c]","\x3e\xff\x54\x24\x2c"])
		
		search.append(["call dword ptr ss:[esp+44]","\xff\x54\x24\x44"])
		search.append(["call dword ptr ss:[esp+44]","\xff\x94\x24\x44\x00\x00\x00"])		
		search.append(["call dword ptr ds:[esp+44]","\x3e\xff\x54\x24\x44"])		
		
		search.append(["jmp dword ptr ss:[esp+44]","\xff\x54\x24\x44"])
		search.append(["jmp dword ptr ss:[esp+44]","\xff\xa4\x24\x44\x00\x00\x00"])
		search.append(["jmp dword ptr ds:[esp+44]","\x3e\xff\x54\x24\x44"])
		
		search.append(["call dword ptr ss:[esp+50]","\xff\x54\x24\x50"])
		search.append(["call dword ptr ss:[esp+50]","\xff\x94\x24\x50\x00\x00\x00"])		
		search.append(["call dword ptr ds:[esp+50]","\x3e\xff\x54\x24\x50"])		
		
		search.append(["jmp dword ptr ss:[esp+50]","\xff\x54\x24\x50"])
		search.append(["jmp dword ptr ss:[esp+50]","\xff\xa4\x24\x50\x00\x00\x00"])
		search.append(["jmp dword ptr ds:[esp+50]","\x3e\xff\x54\x24\x50"])
		
		search.append(["call dword ptr ss:[ebp+0c]","\xff\x55\x0c"])
		search.append(["call dword ptr ss:[ebp+0c]","\xff\x95\x0c\x00\x00\x00"])		
		search.append(["call dword ptr ds:[ebp+0c]","\x3e\xff\x55\x0c"])		
		
		search.append(["jmp dword ptr ss:[ebp+0c]","\xff\x65\x0c"])
		search.append(["jmp dword ptr ss:[ebp+0c]","\xff\xa5\x0c\x00\x00\x00"])		
		search.append(["jmp dword ptr ds:[ebp+0c]","\x3e\xff\x65\x0c"])		
		
		search.append(["call dword ptr ss:[ebp+24]","\xff\x55\x24"])
		search.append(["call dword ptr ss:[ebp+24]","\xff\x95\x24\x00\x00\x00"])		
		search.append(["call dword ptr ds:[ebp+24]","\x3e\xff\x55\x24"])
		
		search.append(["jmp dword ptr ss:[ebp+24]","\xff\x65\x24"])
		search.append(["jmp dword ptr ss:[ebp+24]","\xff\xa5\x24\x00\x00\x00"])		
		search.append(["jmp dword ptr ds:[ebp+24]","\x3e\xff\x65\x24"])	
		
		search.append(["call dword ptr ss:[ebp+30]","\xff\x55\x30"])
		search.append(["call dword ptr ss:[ebp+30]","\xff\x95\x30\x00\x00\x00"])		
		search.append(["call dword ptr ds:[ebp+30]","\x3e\xff\x55\x30"])
		
		search.append(["jmp dword ptr ss:[ebp+30]","\xff\x65\x30"])
		search.append(["jmp dword ptr ss:[ebp+30]","\xff\xa5\x30\x00\x00\x00"])		
		search.append(["jmp dword ptr ds:[ebp+30]","\x3e\xff\x65\x30"])	
		
		search.append(["call dword ptr ss:[ebp-04]","\xff\x55\xfc"])
		search.append(["call dword ptr ss:[ebp-04]","\xff\x95\xfc\xff\xff\xff"])		
		search.append(["call dword ptr ds:[ebp-04]","\x3e\xff\x55\xfc"])
		
		search.append(["jmp dword ptr ss:[ebp-04]","\xff\x65\xfc",])
		search.append(["jmp dword ptr ss:[ebp-04]","\xff\xa5\xfc\xff\xff\xff",])		
		search.append(["jmp dword ptr ds:[ebp-04]","\x3e\xff\x65\xfc",])		
		
		search.append(["call dword ptr ss:[ebp-0c]","\xff\x55\xf4"])
		search.append(["call dword ptr ss:[ebp-0c]","\xff\x95\xf4\xff\xff\xff"])		
		search.append(["call dword ptr ds:[ebp-0c]","\x3e\xff\x55\xf4"])
		
		search.append(["jmp dword ptr ss:[ebp-0c]","\xff\x65\xf4",])
		search.append(["jmp dword ptr ss:[ebp-0c]","\xff\xa5\xf4\xff\xff\xff",])		
		search.append(["jmp dword ptr ds:[ebp-0c]","\x3e\xff\x65\xf4",])
		
		search.append(["call dword ptr ss:[ebp-18]","\xff\x55\xe8"])
		search.append(["call dword ptr ss:[ebp-18]","\xff\x95\xe8\xff\xff\xff"])		
		search.append(["call dword ptr ds:[ebp-18]","\x3e\xff\x55\xe8"])
		
		search.append(["jmp dword ptr ss:[ebp-18]","\xff\x65\xe8",])
		search.append(["jmp dword ptr ss:[ebp-18]","\xff\xa5\xe8\xff\xff\xff",])		
		search.append(["jmp dword ptr ds:[ebp-18]","\x3e\xff\x65\xe8",])
	return search

	
def getModulesToQuery(criteria):
	"""
	This function will return an array of modulenames
	
	Arguments:
	Criteria - dictionary with module criteria
	
	Return:
	array with module names that meet the given criteria
	
	"""	
	if len(g_modules) == 0:
		populateModuleInfo()
	modulestoquery=[]
	for thismodule,modproperties in g_modules.iteritems():
		#is this module excluded ?
		thismod = MnModule(thismodule)	
		included = True
		if not thismod.isExcluded:
			#check other criteria
			if ("safeseh" in criteria) and ((not criteria["safeseh"]) and thismod.isSafeSEH):
				included = False
			if ("aslr" in criteria) and ((not criteria["aslr"]) and thismod.isAslr):
				included = False
			if ("rebase" in criteria) and ((not criteria["rebase"]) and thismod.isRebase):
				included = False
			if ("os" in criteria) and ((not criteria["os"]) and thismod.isOS):
				included = False
			if ("nx" in criteria) and ((not criteria["nx"]) and thismod.isNX):
				included = False				
		else:
			included = False
		#override all previous decision if "modules" criteria was provided
		thismodkey = thismod.moduleKey.lower().strip()
		if ("modules" in criteria) and (criteria["modules"] != ""):
			included = False
			modulenames=criteria["modules"].split(",")
			for modulename in modulenames:
				modulename = modulename.strip('"').strip("'").lower()
				modulenamewithout = modulename.replace("*","")
				if len(modulenamewithout) <= len(thismodkey):
					#endswith ?
					if modulename[0] == "*":
						if modulenamewithout == thismodkey[len(thismodkey)-len(modulenamewithout):len(thismodkey)]:
							if not thismod.moduleKey in modulestoquery and not thismod.isExcluded:
								modulestoquery.append(thismod.moduleKey)
					#startswith ?
					if modulename[len(modulename)-1] == "*":
						if (modulenamewithout == thismodkey[0:len(modulenamewithout)] and not thismod.isExcluded):
							if not thismod.moduleKey in modulestoquery:
								modulestoquery.append(thismod.moduleKey)
					#contains ?
					if ((modulename[0] == "*" and modulename[len(modulename)-1] == "*") or (modulename.find("*") == -1)) and not thismod.isExcluded:
						if thismodkey.find(modulenamewithout) > -1:
							if not thismod.moduleKey in modulestoquery:
								modulestoquery.append(thismod.moduleKey)

		if included:
			modulestoquery.append(thismod.moduleKey)		
	return modulestoquery	
	
	
	
def getPointerAccess(address):
	"""
	Returns access level of specified address, in human readable format
	
	Arguments:
	address - integer value
	
	Return:
	Access level (human readable format)
	"""
	paccess = ""
	try:
		page   = imm.getMemoryPageByAddress( address )
		paccess = page.getAccess( human = True )
	except:
		paccess = ""
	return paccess


def getModuleProperty(modname,parameter):
	"""
	Returns value of a given module property
	Argument : 
	modname - module name
	parameter name - (see populateModuleInfo())
	
	Returns : 
	value associcated with the given parameter / module combination
	
	"""
	modname=modname.strip()
	parameter=parameter.lower()
	modnamelower=modname.lower()
	valtoreturn=""
	nroftimes = 0
	# try case sensitive first
	for thismodule,modproperties in g_modules.iteritems():
		if thismodule.strip() == modname:
			return modproperties[parameter]
	return valtoreturn


def populateModuleInfo():
	"""
	Populate global dictionary with information about all loaded modules
	
	Return:
	Dictionary
	"""
	if not silent:
		imm.setStatusBar("Getting modules info...")
		imm.log("[+] Generating module info table, hang on...")
		imm.log("    - Processing modules")
		imm.updateLog()
	global g_modules
	g_modules={}
	allmodules=imm.getAllModules()
	curmod = ""
	for key in allmodules.keys():
		modinfo={}
		thismod = MnModule(key)
		modinfo["path"]		= thismod.modulePath
		modinfo["base"] 	= thismod.moduleBase
		modinfo["size"] 	= thismod.moduleSize
		modinfo["top"]  	= thismod.moduleTop
		modinfo["safeseh"]	= thismod.isSafeSEH
		modinfo["aslr"]		= thismod.isAslr
		modinfo["nx"]		= thismod.isNX
		modinfo["rebase"]	= thismod.isRebase
		modinfo["version"]	= thismod.moduleVersion
		modinfo["os"]		= thismod.isOS
		modinfo["name"]		= key
		g_modules[thismod.moduleKey] = modinfo
	if not silent:
		imm.log("    - Done. Let's rock 'n roll.")
		imm.setStatusBar("")	
		imm.updateLog()

def ModInfoCached(modulename):
	"""
	Check if the information about a given module is already cached in the global Dictionary
	
	Arguments:
	modulename -  name of the module to check
	
	Return:
	Boolean - True if the module info is cached
	"""
	if (getModuleProperty(modulename,"base") == ""):
		return False
	else:
		return True

def showModuleTable(logfile="", modules=[]):
	"""
	Shows table with all loaded modules and their properties.

	Arguments :
	empty string - output will be sent to log window
	or
	filename - output will be written to the filename
	
	modules - dictionary with modules to query - result of a populateModuleInfo() call
	"""	
	thistable = ""
	if len(g_modules) == 0:
		populateModuleInfo()
	thistable += "----------------------------------------------------------------------------------------------------------------------------------\n"
	thistable += " Module info :\n"
	thistable += "----------------------------------------------------------------------------------------------------------------------------------\n"
	thistable += " Base       | Top        | Size       | Rebase | SafeSEH | ASLR  | NXCompat | OS Dll | Version, Modulename & Path\n"
	thistable += "----------------------------------------------------------------------------------------------------------------------------------\n"

	for thismodule,modproperties in g_modules.iteritems():
		if (len(modules) > 0 and modproperties["name"] in modules or len(logfile)>0):
			rebase	= toSize(str(modproperties["rebase"]),7)
			base 	= toSize(str("0x" + toHex(modproperties["base"])),10)
			top 	= toSize(str("0x" + toHex(modproperties["top"])),10)
			size 	= toSize(str("0x" + toHex(modproperties["size"])),10)
			safeseh = toSize(str(modproperties["safeseh"]),7)
			aslr 	= toSize(str(modproperties["aslr"]),5)
			nx 		= toSize(str(modproperties["nx"]),7)
			isos 	= toSize(str(modproperties["os"]),7)
			version = str(modproperties["version"])
			path 	= str(modproperties["path"])
			name	= str(modproperties["name"])
			thistable += " " + base + " | " + top + " | " + size + " | " + rebase +"| " +safeseh + " | " + aslr + " |  " + nx + " | " + isos + "| " + version + " [" + name + "] (" + path + ")\n"
	thistable += "----------------------------------------------------------------------------------------------------------------------------------\n"
	tableinfo = thistable.split('\n')
	if logfile == "":
		for tline in tableinfo:
			imm.log(tline)
	else:
		FILE=open(logfile,"a")
		FILE.writelines(thistable)
		FILE.close()
		
#-----------------------------------------------------------------------#
# This is where the action is
#-----------------------------------------------------------------------#	

def processResults(all_opcodes,logfile,thislog):
	"""
	Write the output of a search operation to log file

	Arguments:
	all_opcodes - dictionary containing the results of a search 
	logfile - the MnLog object
	thislog - the filename to write to

	Return:
	written content in log file
	first 20 pointers are shown in the log window
	"""
	ptrcnt = 0
	cnt = 0
	if all_opcodes:
		imm.log("[+] Writing results to %s" % thislog)
		for hf in all_opcodes:
				try:
					imm.log("    - Number of pointers of type '%s' : %d " % (hf,len(all_opcodes[hf])))
				except:
					imm.log("    - Number of pointers of type '<unable to display>' : %d " % (len(all_opcodes[hf])))
		imm.log("[+] Results : ")
		for optext,pointers in all_opcodes.iteritems():
			for ptr in pointers:
				ptrx = MnPointer(ptr)
				modname = ptrx.belongsTo()
				modinfo = MnModule(modname)
				ptrextra = ""
				rva=0
				if (modinfo.isRebase or modinfo.isAslr) and modname != "":
					rva = ptr - modinfo.moduleBase
					ptrextra = " (b+0x" + toHex(rva)+") "
				ptrinfo = "0x" + toHex(ptr) + ptrextra + " : " + optext + " | " + ptrx.__str__() + " " + modinfo.__str__()
				if modname == "":
					if ptrx.isOnStack():
						ptrinfo += " [Stack] "
					elif ptrx.isInHeap():
						ptrinfo += " [Heap] "
				logfile.write(ptrinfo,thislog)
				if (ptr_to_get > -1) or (cnt < 20):
					imm.log("  %s" % ptrinfo,address=ptr)
					cnt += 1
				ptrcnt += 1
		if cnt < ptrcnt:
			imm.log("... Only the first %d pointers are shown here. For more pointers, open %s..." % (cnt,thislog)) 
	imm.log("Done. Found %d pointers" % ptrcnt, highlight=1)
	imm.setStatusBar("Done. Found %d pointers" % ptrcnt)
	
	
def mergeOpcodes(all_opcodes,found_opcodes):
	"""
	merges two dictionaries together

	Arguments:
	all_opcodes - the target dictionary
	found_opcodes - the source dictionary

	Return:
	Dictionary (merged dictionaries)
	"""
	if found_opcodes:
		for hf in found_opcodes:
			if hf in all_opcodes:
				all_opcodes[hf] += found_opcodes[hf]
			else:
				all_opcodes[hf] = found_opcodes[hf]
	return all_opcodes

	
def findSEH(modulecriteria={},criteria={}):
	"""
	Performs a search for pointers to gain code execution in a SEH overwrite exploit

	Arguments:
	modulecriteria - dictionary with criteria modules need to comply with.
	                 Default settings are : ignore aslr, rebase and safeseh protected modules
	criteria - dictionary with criteria the pointers need to comply with.

	Return:
	Dictionary (pointers)
	"""
	search = getSearchSequences("seh",0) 
	
	found_opcodes = {}
	all_opcodes = {}
		
	modulestosearch = getModulesToQuery(modulecriteria)
	if not silent:
		imm.log("[+] Querying %d modules" % len(modulestosearch))
	
	starttime = datetime.datetime.now()
	for thismodule in modulestosearch:
		if not silent:
			imm.log("    - Querying module %s" % thismodule)
		imm.updateLog()
		#search
		found_opcodes = searchInModule(search,thismodule,criteria)
		#merge results
		all_opcodes = mergeOpcodes(all_opcodes,found_opcodes)
	#search outside modules
	rangestosearch = getRangesOutsideModules()
	if not silent:
		imm.log("[+] Querying memory outside modules")
	for thisrange in rangestosearch:
		found_opcodes = searchInRange(search, thisrange[0], thisrange[1],criteria)
		all_opcodes = mergeOpcodes(all_opcodes,found_opcodes)
	if not silent:
		imm.log("    - Search complete, processing results")
	imm.updateLog()
		
	return all_opcodes
	

def findJMP(modulecriteria={},criteria={},register="esp"):
	"""
	Performs a search for pointers to jump to a given register

	Arguments:
	modulecriteria - dictionary with criteria modules need to comply with.
	                 Default settings are : ignore aslr and rebased modules
	criteria - dictionary with criteria the pointers need to comply with.
	register - the register to jump to

	Return:
	Dictionary (pointers)
	"""
	search = getSearchSequences("jmp",register) 
	
	found_opcodes = {}
	all_opcodes = {}
		
	modulestosearch = getModulesToQuery(modulecriteria)
	if not silent:
		imm.log("[+] Querying %d modules" % len(modulestosearch))
	
	starttime = datetime.datetime.now()
	for thismodule in modulestosearch:
		if not silent:
			imm.log("    - Querying module %s" % thismodule)
		imm.updateLog()
		#search
		found_opcodes = searchInModule(search,thismodule,criteria)
		#merge results
		all_opcodes = mergeOpcodes(all_opcodes,found_opcodes)
	if not silent:
		imm.log("    - Search complete, processing results")
	imm.updateLog()
	return all_opcodes	


	
def findROPFUNC(modulecriteria={},criteria={}):
	"""
	Performs a search for pointers to pointers to interesting functions to facilitate a ROP exploit

	Arguments:
	modulecriteria - dictionary with criteria modules need to comply with.
	                 Default settings are : ignore aslr and rebased modules
	criteria - dictionary with criteria the pointers need to comply with.

	Return:
	Dictionary (pointers)
	"""
	found_opcodes = {}
	all_opcodes = {}
	ptr_counter = 0
	
	modulestosearch = getModulesToQuery(modulecriteria)
	
	functionnames = ["virtualprotect","virtualalloc","heapalloc","winexec","setprocessdeppolicy","heapcreate","setinformationprocess","writeprocessmemory","memcpy","memmove","strncpy","createmutex","getlasterror","strcpy","loadlibrary","freelibrary","getmodulehandle"]
	if not silent:
		imm.log("[+] Looking for pointers to interesting functions...")
	curmod = ""
	results = 0
	ropfuncfilename="ropfunc.txt"
	objropfuncfile = MnLog(ropfuncfilename)
	ropfuncfile = objropfuncfile.reset()
	ropfuncs = {}
	funccallresults = []
	isrebased = False
	for key in modulestosearch:
		curmod = imm.getModule(key)
		#is this module going to get rebase ?
		themodule = MnModule(key)
		isrebased = themodule.isRebase
		if not silent:
			imm.log("     - Querying %s" % (key))
		funcs = curmod.getSymbols()
		allfuncs = []		
		for fn in funcs:
			allfuncs.append(str(fn))
		funccalls = themodule.getFunctionCalls(criteria)
		for functype in funccalls:
			for fptr in funccalls[functype]:
				ptr=struct.unpack('<L',imm.readMemory(fptr+2,4))[0]
				#points into current module ?
				if ptr >= themodule.moduleBase and ptr <= themodule.moduleTop:
					if not str(ptr) in allfuncs:
						allfuncs.append(str(ptr))
		imm.updateLog()
		for fn in allfuncs:
			fn = int(fn)
			if not meetsCriteria(MnPointer(fn), criteria):
				continue
			ptr = 0
			try:
				ptr=struct.unpack('<L',imm.readMemory(fn,4))[0]
			except:
				pass
			if ptr != 0:
				thisfunc = immlib.Function(imm,ptr)
				thisfuncfullname = thisfunc.getName().lower()
				thisfuncname = thisfuncfullname.split('.')
				if len(thisfuncname) > 1:
					thisfuncname=thisfuncname[1]						 
					if thisfuncname <> "":
						#see if it's a function we are looking for
						for funcsearch in functionnames:
							if thisfuncname.find(funcsearch) > -1:
								extra = ""
								extrafunc = ""
								if isrebased:
									extra = " [Warning : module is likely to get rebased !]"
									extrafunc = "-rebased"
								if not silent:
									imm.log("       0x%s : ptr to %s (%s) %s" % (toHex(fn),thisfuncname,key,extra))
								if thisfuncfullname.lower().strip()+extrafunc in ropfuncs:
										ropfuncs[thisfuncfullname.lower().strip()+extrafunc] += [fn]
								else:
										ropfuncs[thisfuncfullname.lower().strip()+extrafunc] = [fn]
								results += 1
								ptr_counter += 1
								if ptr_to_get > 0 and ptr_counter >= ptr_to_get:
									return ropfuncs
	return ropfuncs

def assemble(instructions,encoder):
	"""
	Assembles one or more instructions to opcodes

	Arguments:
	instructions = the instructions to assemble (separated by #)

	Return:
	Dictionary (pointers)
	"""
	imm.log("Opcode results : ")
	imm.log("---------------- ")
	cnt=1
	cmdInput=""
	allopcodes=""
	encodecmd=""
	encodebad=""
	curpos=0
	
	instructions = instructions.replace('"',"").replace("'","")

	splitter=re.compile('#')
	instructions=splitter.split(instructions)
	for instruct in instructions:
		try:
			instruct = instruct.strip()
			assembled=imm.assemble(instruct)
			strAssembled=""
			for assemOpc in assembled:
				if (len(hex(ord(assemOpc)))) == 3:
					subAssembled = "\\x0"+hex(ord(assemOpc)).replace('0x','')
					strAssembled = strAssembled+subAssembled
				else:
					strAssembled =  strAssembled+hex(ord(assemOpc)).replace('0x', '\\x')
			if len(strAssembled) < 30:
				if not silent:
					imm.log(" %s = %s" % (instruct,strAssembled))
				allopcodes=allopcodes+strAssembled
			else:
				if not silent:
					imm.log(" %s => Unable to assemble this instruction !" % instruct,highlight=1)
		except:
			if not silent:
				imm.log("   Could not assemble %s " % instruct)
			pass
	if not silent:
		imm.log(" Full opcode : %s " % allopcodes)
	return allopcodes
	# if (encoder == "ascii"):
		# imm.log("Encoding to ASCII...")
		# imm.log("")
		# encodeargs=[]
		# encodeargs.append("doencode")
		# encodeargs.append(encodecmd)
		# encodeargs.append(allopcodes.replace('\\x',''))
		# encodeargs.append(encodebad)
		# doencode(encodeargs)
	
	
def findROPGADGETS(modulecriteria={},criteria={},endings=[],maxoffset=40,depth=5,split=False,pivotdistance=0,fast=False,mode="all"):
	"""
	Searches for rop gadgets

	Arguments:
	modulecriteria - dictionary with criteria modules need to comply with.
	                 Default settings are : ignore aslr and rebased modules
	criteria - dictionary with criteria the pointers need to comply with.
	endings - array with all rop gadget endings to look for. Default : RETN and RETN+offsets
	maxoffset - maximum offset value for RETN if endings are set to RETN
	depth - maximum number of instructions to go back
	split - Boolean that indicates whether routine should write all gadgets to one file, or split per module
	pivotdistance - minimum distance a stackpivot needs to be
	fast - Boolean indicating if you want to process less obvious gadgets as well
	mode - internal use only
	
	Return:
	Output is written to files, containing rop gadgets, suggestions, stack pivots and virtualprotect routine (if possible)
	"""
	found_opcodes = {}
	all_opcodes = {}
	ptr_counter = 0

	modulestosearch = getModulesToQuery(modulecriteria)
	
	progressid=toHex(imm.getDebuggedPid())
	progressfilename="_rop_progress_"+imm.getDebuggedName()+"_"+progressid+".log"
	
	objprogressfile = MnLog(progressfilename)
	progressfile = objprogressfile.reset()

	imm.log("[+] Progress will be written to %s" % progressfilename)
	imm.log("[+] Maximum offset : %d" % maxoffset)
	imm.log("[+] (Minimum/optional maximum) stackpivot distance : %s" % str(pivotdistance))
	imm.log("[+] Max nr of instructions : %d" % depth)
	imm.log("[+] Split output into module rop files ? %s" % split)

	fcnt = 0
	filesok = 0
	usefiles = False
	filestouse = []
	
	if "f" in criteria:
		if criteria["f"] <> "":
			if type(criteria["f"]).__name__.lower() != "bool":		
				rawfilenames = criteria["f"].replace('"',"")
				allfiles = rawfilenames.split(',')
				#check if files exist
				imm.log("[+] Attempting to use %d rop file(s) as input" % len(allfiles))				
				while fcnt < len(allfiles):
					allfiles[fcnt]=allfiles[fcnt].strip()
					if not os.path.exists(allfiles[fcnt]):
						imm.log("     ** %s : Does not exist !" % allfiles[fcnt],highlight=1)
					else:
						filestouse.append(allfiles[fcnt])
					fcnt=fcnt+1	
				usefiles = True
		
	if usefiles and len(filestouse) == 0:
		imm.log(" ** Unable to find any of the source files, aborting... **",highlight=1)
		return
		
	search = []
	
	if not usefiles:
		if len(endings) == 0:
			#RETN only
			offsetcnt = 0
			search.append("RETN")
			while offsetcnt <= maxoffset:
				search.append("RETN "+ toHexByte(offsetcnt))
				offsetcnt += 2
		else:
			for ending in endings:
				imm.log("[+] Custom ending : %s" % ending)
				if ending != "":
					search.append(ending)
		imm.log("[+] Enumerating %d endings in %d module(s)..." % (len(search),len(modulestosearch)))
		for thismodule in modulestosearch:
			imm.log("    - Querying module %s" % thismodule)
			imm.updateLog()
			#search
			found_opcodes = searchInModule(search,thismodule,criteria)
			#merge results
			all_opcodes = mergeOpcodes(all_opcodes,found_opcodes)
		imm.log("    - Search complete :")
	else:
		imm.log("[+] Reading input files")
		for filename in filestouse:
			imm.log("     - Reading %s" % filename)
			all_opcodes = mergeOpcodes(all_opcodes,readGadgetsFromFile(filename))
			
	imm.updateLog()
	tp = 0
	for endingtype in all_opcodes:
		if len(all_opcodes[endingtype]) > 0:
			if usefiles:
				imm.log("       Ending : %s, Nr found : %d" % (endingtype,len(all_opcodes[endingtype]) / 2))
				tp = tp + len(all_opcodes[endingtype]) / 2
			else:
				imm.log("       Ending : %s, Nr found : %d" % (endingtype,len(all_opcodes[endingtype])))
				tp = tp + len(all_opcodes[endingtype])
	global silent
	if not usefiles:		
		imm.log("    - Filtering and mutating %d gadgets" % tp)
	else:
		imm.log("    - Categorizing %d gadgets" % tp)
		silent = True
		
	imm.updateLog()
	ropgadgets = {}
	interestinggadgets = {}
	stackpivots = {}
	stackpivots_safeseh = {}
	adcnt = 0
	tc = 1
	issafeseh = False
	step = 0
	for endingtype in all_opcodes:
		if len(all_opcodes[endingtype]) > 0:
			for endingtypeptr in all_opcodes[endingtype]:
				adcnt=adcnt+1
				if usefiles:
					adcnt = adcnt - 0.5
				if adcnt > (tc*1000):
					thistimestamp=datetime.datetime.now().strftime("%a %Y/%m/%d %I:%M:%S %p")
					updatetext = "      - Progress update : " + str(tc*1000) + " / " + str(tp) + " items processed (" + thistimestamp + ") - (" + str((tc*1000*100)/tp)+"%)"
					objprogressfile.write(updatetext.strip(),progressfile)
					imm.log(updatetext)
					imm.updateLog()
					tc=tc+1				
				if not usefiles:
					#first get max backward instruction
					thisopcode = imm.disasmBackward(endingtypeptr,depth+1)
					thisptr = thisopcode.getAddress()		
					# we now have a range to mine
					startptr = thisptr
					currentmodulename = MnPointer(thisptr).belongsTo()
					modinfo = MnModule(currentmodulename)
					issafeseh = modinfo.isSafeSEH
					while startptr <= endingtypeptr:
						# get the entire chain from startptr to endingtypeptr
						thischain = ""
						chainptr = startptr
						if isGoodGadgetPtr(startptr,criteria) and not startptr in ropgadgets and not startptr in interestinggadgets:
							invalidinstr = False
							while chainptr < endingtypeptr and not invalidinstr:
								thisopcode = imm.disasm(chainptr)
								thisinstruction = thisopcode.getDisasm()
								if isGoodGadgetInstr(thisinstruction) and not isGadgetEnding(thisinstruction,search):						
									thischain =  thischain + " # " + thisinstruction
									chainptr = imm.disasmForwardAddressOnly(chainptr,1)
								else:
									invalidinstr = True						
							if endingtypeptr == chainptr and startptr != chainptr and not invalidinstr:
								fullchain = thischain + " # " + endingtype							
								if isInterestingGadget(fullchain):
									interestinggadgets[startptr] = fullchain
									#this may be a good stackpivot too
									stackpivotdistance = getStackPivotDistance(fullchain,pivotdistance) 
									if stackpivotdistance > 0:
										#safeseh or not ?
										if issafeseh:
											stackpivots_safeseh[startptr] = " {pivot " + str(stackpivotdistance)+"} " + fullchain
										else:
											stackpivots[startptr] = " {pivot " + str(stackpivotdistance)+"} " + fullchain
								else:
									if not fast:
										ropgadgets[startptr] = fullchain
						startptr = startptr+1
				else:
					#KISS
					if step == 0:
						startptr = endingtypeptr
					if step == 1:
						thischain = endingtypeptr
						chainptr = startptr
						ptrx = MnPointer(chainptr)
						modname = ptrx.belongsTo()
						issafeseh = False
						if modname != "":
							thism = MnModule(modname)
							issafeseh = thism.isSafeSEH
						if isGoodGadgetPtr(startptr,criteria) and not startptr in ropgadgets and not startptr in interestinggadgets:
							fullchain = thischain
							if isInterestingGadget(fullchain):
								interestinggadgets[startptr] = fullchain
								#this may be a good stackpivot too
								stackpivotdistance = getStackPivotDistance(fullchain,pivotdistance) 
								if stackpivotdistance > 0:
									#safeseh or not ?
									if issafeseh:
										stackpivots_safeseh[startptr] = " {pivot " + str(stackpivotdistance)+"} " + fullchain
									else:
										stackpivots[startptr] = " {pivot " + str(stackpivotdistance)+"} " + fullchain
							else:
								if not fast:
									ropgadgets[startptr] = fullchain
						step = -1
					step += 1
						
	thistimestamp=datetime.datetime.now().strftime("%a %Y/%m/%d %I:%M:%S %p")
	updatetext = "      - Progress update : " + str(tp) + " / " + str(tp) + " items processed (" + thistimestamp + ") - (100%)"
	objprogressfile.write(updatetext.strip(),progressfile)
	imm.log(updatetext)
	imm.updateLog()
	if mode == "all":
		# another round of filtering
		updatetext = "Creating suggestions list"
		objprogressfile.write(updatetext.strip(),progressfile)
		suggestions = {}
		suggestions = getRopSuggestion(interestinggadgets)

		#see if we can propose something
		updatetext = "Processing suggestions"
		objprogressfile.write(updatetext.strip(),progressfile)
		suggtowrite=""
		for suggestedtype in suggestions:
			if suggestedtype.find("pop") == -1:		#too many
				suggtowrite += "[" + suggestedtype + "]\n"
				for suggestedpointer in suggestions[suggestedtype]:
					sptr = MnPointer(suggestedpointer)
					modname = sptr.belongsTo()
					modinfo = MnModule(modname)
					suggesteddata = suggestions[suggestedtype][suggestedpointer]
					ptrinfo = "0x" + toHex(suggestedpointer) + " : " + suggesteddata + "    ** " + modinfo.__str__() + " **   |  " + sptr.__str__()+"\n"
					suggtowrite += ptrinfo
		
		updatetext = "Generating rop chain proposal if possible"
		objprogressfile.write(updatetext.strip(),progressfile)
		createRopChain(suggestions,interestinggadgets,modulecriteria,criteria)
	
	#done, write to log files
	
	imm.log("")
	logfile = MnLog("stackpivot.txt")
	thislog = logfile.reset()
	objprogressfile.write("Writing " + str(len(stackpivots)+len(stackpivots_safeseh))+" stackpivots with minimum offset " + str(pivotdistance)+" to file " + thislog,progressfile)
	imm.log("")
	imm.log("[+] Writing stackpivots to file " + thislog + " (" + str(len(stackpivots)+len(stackpivots_safeseh))+" pivots)")
	logfile.write("Stack pivots, minimum distance " + str(pivotdistance),thislog)
	logfile.write("-------------------------------------",thislog)
	logfile.write("Non-safeSEH protected pivots :",thislog)
	logfile.write("------------------------------",thislog)
	arrtowrite = ""	
	try:
		FILE=open(thislog,"a")
		for spivot in stackpivots:
				ptrx = MnPointer(spivot)
				modname = ptrx.belongsTo()
				modinfo = MnModule(modname)
				ptrinfo = "0x" + toHex(spivot) + " : " + stackpivots[spivot] + "    ** " + modinfo.__str__() + " **   |  " + ptrx.__str__()+"\n"
				arrtowrite += ptrinfo
		FILE.writelines(arrtowrite)
		FILE.close()
	except:
		pass
	logfile.write("SafeSEH protected pivots :",thislog)
	logfile.write("--------------------------",thislog)	
	arrtowrite = ""	
	try:
		FILE=open(thislog,"a")
		for spivot in stackpivots_safeseh:
				ptrx = MnPointer(spivot)
				modname = ptrx.belongsTo()
				modinfo = MnModule(modname)
				ptrinfo = "0x" + toHex(spivot) + " : " + stackpivots_safeseh[spivot] + "    ** " + modinfo.__str__() + " **   |  " + ptrx.__str__()+"\n"
				arrtowrite += ptrinfo
		FILE.writelines(arrtowrite)
		FILE.close()
	except:
		pass		
	arrtowrite = ""
	if mode == "all":
		if len(suggestions) > 0:
			logfile = MnLog("rop_suggestions.txt")
			thislog = logfile.reset()
			objprogressfile.write("Writing all suggestions to file "+thislog,progressfile)
			imm.log("[+] Writing suggestions to file " + thislog )
			logfile.write("Suggestions",thislog)
			logfile.write("-----------",thislog)
			FILE=open(thislog,"a")
			FILE.writelines(suggtowrite)
			FILE.write("\n")
			FILE.close()
		if not split:
			logfile = MnLog("rop.txt")
			thislog = logfile.reset()
			objprogressfile.write("Gathering interesting gadgets",progressfile)
			imm.log("[+] Writing results to file " + thislog + " (" + str(len(interestinggadgets))+" interesting gadgets)")
			logfile.write("Interesting gadgets",thislog)
			logfile.write("-------------------",thislog)
			imm.updateLog()
			try:
				FILE=open(thislog,"a")
				for gadget in interestinggadgets:
						ptrx = MnPointer(gadget)
						modname = ptrx.belongsTo()
						modinfo = MnModule(modname)
						ptrinfo = "0x" + toHex(gadget) + " : " + interestinggadgets[gadget] + "    ** " + modinfo.__str__() + " **   |  " + ptrx.__str__()+"\n"
						arrtowrite += ptrinfo
				objprogressfile.write("Writing results to file " + thislog + " (" + str(len(interestinggadgets))+" interesting gadgets)",progressfile)
				FILE.writelines(arrtowrite)
				FILE.close()
			except:
				pass
			arrtowrite=""
			if not fast:
				objprogressfile.write("Enumerating other gadgets (" + str(len(ropgadgets))+")",progressfile)
				try:
					logfile.write("",thislog)
					logfile.write("Other gadgets",thislog)
					logfile.write("-------------",thislog)
					FILE=open(thislog,"a")
					for gadget in ropgadgets:
							ptrx = MnPointer(gadget)
							modname = ptrx.belongsTo()
							modinfo = MnModule(modname)
							ptrinfo = "0x" + toHex(gadget) + " : " + ropgadgets[gadget] + "    ** " + modinfo.__str__() + " **   |  " + ptrx.__str__()+"\n"
							arrtowrite += ptrinfo
					objprogressfile.write("Writing results to file " + thislog + " (" + str(len(ropgadgets))+" other gadgets)",progressfile)
					FILE.writelines(arrtowrite)
					FILE.close()
				except:
					pass
		else:
			imm.log("[+] Writing results to individual files (grouped by module)")
			imm.updateLog()
			for thismodule in modulestosearch:
				thismodname = thismodule.replace(" ","_")
				thismodversion = getModuleProperty(thismodule,"version")
				logfile = MnLog("rop_"+thismodname+"_"+thismodversion+".txt")
				thislog = logfile.reset()
				logfile.write("Interesting gadgets",thislog)
				logfile.write("-------------------",thislog)
			for gadget in interestinggadgets:
				ptrx = MnPointer(gadget)
				modname = ptrx.belongsTo()
				modinfo = MnModule(modname)
				thismodversion = getModuleProperty(modname,"version")
				thismodname = modname.replace(" ","_")
				logfile = MnLog("rop_"+thismodname+"_"+thismodversion+".txt")
				thislog = logfile.reset(False)
				ptrinfo = "0x" + toHex(gadget) + " : " + interestinggadgets[gadget] + "    ** " + modinfo.__str__() + " **   |  " + ptrx.__str__()+"\n"
				FILE=open(thislog,"a")
				FILE.write(ptrinfo)
				FILE.close()
			if not fast:
				for thismodule in modulestosearch:
					thismodname = thismodule.replace(" ","_")
					thismodversion = getModuleProperty(thismodule,"version")
					logfile = MnLog("rop_"+thismodname+"_"+thismodversion+".txt")
					logfile.write("Other gadgets",thislog)
					logfile.write("-------------",thislog)
				for gadget in ropgadgets:
					ptrx = MnPointer(gadget)
					modname = ptrx.belongsTo()
					modinfo = MnModule(modname)
					thismodversion = getModuleProperty(modname,"version")
					thismodname = modname.replace(" ","_")
					logfile = MnLog("rop_"+thismodname+"_"+thismodversion+".txt")
					thislog = logfile.reset(False)
					ptrinfo = "0x" + toHex(gadget) + " : " + ropgadgets[gadget] + "    ** " + modinfo.__str__() + " **   |  " + ptrx.__str__()+"\n"
					FILE=open(thislog,"a")
					FILE.write(ptrinfo)
					FILE.close()
	thistimestamp=datetime.datetime.now().strftime("%a %Y/%m/%d %I:%M:%S %p")
	objprogressfile.write("Done (" + thistimestamp+")",progressfile)
	imm.log("Done")
	return interestinggadgets,ropgadgets
	
# File compare

def findFILECOMPARISON(modulecriteria={},criteria={},allfiles=[],tomatch="",checkstrict=True):
	"""
	Compares two or more files generated with mona.py and lists the entries that have been found in all files

	Arguments:
	modulecriteria =  not used
	criteria = not used
	allfiles = array with filenames to compare
	tomatch = variable containing a string each line should contain
	checkstrict = Boolean, when set to True, both the pointer and the instructions should be exactly the same
	
	Return:
	File containing all matching pointers
	"""
	imm.setStatusBar("Comparing files...")	
	imm.updateLog()
	fcnt=0
	filesok=0
	while fcnt < len(allfiles):
		allfiles[fcnt]=allfiles[fcnt].strip()
		if os.path.exists(allfiles[fcnt]):
			imm.log("     - %d. %s" % (fcnt,allfiles[fcnt]))
			filesok=filesok+1
		else:
			imm.log("     ** %s : Does not exist !" % allfiles[fcnt],highlight=1)
		fcnt=fcnt+1
	if filesok > 1:
		objcomparefile = MnLog("filecompare.txt")
		comparefile = objcomparefile.reset()
		objcomparefilenot = MnLog("filecompare_not.txt")
		comparefilenot = objcomparefilenot.reset()
		objcomparefilenot.write("Source files:",comparefilenot)
		fcnt=0
		while fcnt < len(allfiles):
			objcomparefile.write(" - " + str(fcnt)+". "+allfiles[fcnt],comparefile)
			objcomparefilenot.write(" - " + str(fcnt)+". "+allfiles[fcnt],comparefilenot)
			fcnt=fcnt+1
		objcomparefile.write("",comparefile)
		objcomparefile.write("Pointers found :",comparefile)
		objcomparefile.write("----------------",comparefile)
		objcomparefilenot.write("",comparefilenot)
		objcomparefilenot.write("Pointers not found :",comparefilenot)
		objcomparefilenot.write("-------------------",comparefilenot)
		imm.log("Reading reference file %s " % allfiles[0])
		imm.updateLog()
		#open reference file and read all records that contain a pointers
		reffile = open(allfiles[0],"rb")
		refcontent = reffile.readlines()
		reffile.close()
		#read all other files into a big array
		targetfiles=[]
		filecnt=1
		comppointers=0
		comppointers_not=0
		imm.log("Reading other files...")
		imm.updateLog()
		while filecnt < len(allfiles):
			imm.log("   %s" % allfiles[filecnt])
			imm.updateLog()
			targetfiles.append([])
			tfile=open(allfiles[filecnt],"rb")
			tcontent = tfile.readlines()
			tfile.close()
			nrlines=0
			for myLine in tcontent:
				targetfiles[filecnt-1].append(myLine)
				nrlines=nrlines+1
			filecnt=filecnt+1
		totalptr=0
		imm.log("Starting compare operation, please wait...")
		imm.updateLog()
		stopnow = False	
		for thisLine in refcontent:
			outtofile = "\n0. "+thisLine.replace("\n","").replace("\r","")
			if ((tomatch != "" and thisLine.upper().find(tomatch.upper()) > -1) or tomatch == "") and not stopnow:
				refpointer=""
				pointerfound=1  #pointer is in source file for sure
				#is this a pointer line ?
				refpointer,instr = splitToPtrInstr(thisLine)
				if refpointer != -1:
						totalptr=totalptr+1
						filecnt=0  #0 is actually the second file
						#is this a pointer which meets the criteria ?
						ptrx = MnPointer(refpointer)
						if meetsCriteria(ptrx,criteria):
							while filecnt < len(allfiles)-1 :
								foundinfile=0
								foundline = ""
								for srcLine in targetfiles[filecnt]:
									refpointer2,instr2 = splitToPtrInstr(srcLine)								
									if refpointer == refpointer2:
										foundinfile=1
										foundline = srcLine									
										break
								if checkstrict and foundinfile == 1:
									# do instructions match ?
									foundinfile = 0
									refpointer2,instr2 = splitToPtrInstr(foundline)
									if (refpointer == refpointer2) and (instr.lower() == instr2.lower()):
										outtofile += "\n" + str(filecnt+1)+". "+foundline.replace("\n","").replace("\r","")										
										foundinfile = 1
								else:
									if foundinfile == 1:
										outtofile += "\n" + str(filecnt+1)+". "+foundline.replace("\n","").replace("\r","")	
								pointerfound=pointerfound+foundinfile
								filecnt=filecnt+1
						#search done
						if pointerfound == len(allfiles):
							imm.log(" -> Pointer 0x%s found in %d files" % (toHex(refpointer),pointerfound))
							objcomparefile.write(outtofile,comparefile)
							comppointers=comppointers+1
							imm.updateLog()
							if ptr_to_get > 0 and comppointers >= ptr_to_get:
								stopnow = True
						else:
							objcomparefilenot.write(thisLine.replace('\n','').replace('\r',''),comparefilenot)
							comppointers_not += 1
		imm.log("Total number of pointers queried : %d" % totalptr)
		imm.log("Number of matching pointers found : %d - check filecompare.txt for more info" % comppointers)
		imm.log("Number of non-matching pointers found : %d - check filecompare_not.txt for more info" % comppointers_not)

#------------------#
# Cyclic pattern	#
#------------------#	

def createPattern(size):
	"""
	Create a cyclic (metasploit) pattern of a given size
	
	Arguments:
	size - value indicating desired length of the pattern
	       if value is > 20280, the pattern will repeat itself until it reaches desired length
		   
	Return:
	string containing the cyclic pattern
	"""
	char1="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	char2="abcdefghijklmnopqrstuvwxyz"
	char3="0123456789"
	charcnt=0
	pattern=""
	max=int(size)
	while charcnt < max:
		for ch1 in char1:
			for ch2 in char2:
				for ch3 in char3:
					if charcnt<max:
						pattern=pattern+ch1
						charcnt=charcnt+1
					if charcnt<max:
						pattern=pattern+ch2
						charcnt=charcnt+1
					if charcnt<max:
						pattern=pattern+ch3
						charcnt=charcnt+1
	return pattern

def findOffsetInPattern(searchpat,size=20280):
	"""
	Check if a given searchpattern can be found in a cyclic pattern
	
	Arguments:
	searchpat : the ascii value or hexstr to search for
	
	Return:
	entries in the log window, indicating if the pattern was found and at what position
	"""
	mspattern=""
	patsize=int(size)

	searchpats = []
	modes = []
	modes.append("normal")
	modes.append("upper")
	modes.append("lower")
	extratext = ""
	for mode in modes:
		if mode == "normal":
			mspattern=createPattern(size)
			extratext = ""
		if mode == "upper":
			mspattern=createPattern(size).upper()
			extratext = "(uppercase)"
		if mode == "lower":
			mspattern=createPattern(size).lower()
			extratext = "(lowercase)"
		if len(searchpat)==3:
			#register ?
			searchpat = searchpat.upper()
			regs = imm.getRegs()		
			if searchpat in regs:
				searchpat = "0x" + toHex(regs[searchpat])
		if len(searchpat)==4:
			ascipat=searchpat
			if not silent:
				imm.log("Looking for %s in pattern of %d bytes" % (ascipat,patsize))
			if ascipat in mspattern:
				patpos = mspattern.find(ascipat)
				if not silent:
					imm.log(" - Pattern %s found in Metasploit pattern %s at position %d" % (ascipat,extratext,patpos),highlight=1)
			else:
				#reversed ?
				ascipat_r = ascipat[3]+ascipat[2]+ascipat[1]+ascipat[0]
				if ascipat_r in mspattern:
					patpos = mspattern.find(ascipat_r)
					if not silent:
						imm.log(" - Pattern %s (%s reversed) found in Metasploit pattern %s at position %d" % (ascipat_r,ascipat,extratext,patpos),highlight=1)			
				else:
					if not silent:
						imm.log(" - Pattern %s not found in Metasploit pattern %s" % (ascipat_r,extratext))
		if len(searchpat)==8:
				searchpat="0x"+searchpat
		if len(searchpat)==10:
				hexpat=searchpat
				ascipat3 = toAscii(hexpat[8]+hexpat[9])+toAscii(hexpat[6]+hexpat[7])+toAscii(hexpat[4]+hexpat[5])+toAscii(hexpat[2]+hexpat[3])
				if not silent:
					imm.log("Looking for %s in pattern of %d bytes" % (ascipat3,patsize))
				if ascipat3 in mspattern:
					patpos = mspattern.find(ascipat3)
					if not silent:
						imm.log(" - Pattern %s (%s) found in Metasploit pattern %s at position %d" % (ascipat3,hexpat,extratext,patpos),highlight=1)
				else:
					#maybe it's reversed
					ascipat4=toAscii(hexpat[2]+hexpat[3])+toAscii(hexpat[4]+hexpat[5])+toAscii(hexpat[6]+hexpat[7])+toAscii(hexpat[8]+hexpat[9])
					if not silent:
						imm.log("Looking for %s in pattern of %d bytes" % (ascipat4,patsize))
					if ascipat4 in mspattern:
						patpos = mspattern.find(ascipat4)
						if not silent:
							imm.log(" - Pattern %s (%s reversed) found in Metasploit pattern %s at position %d" % (ascipat4,hexpat,extratext,patpos),highlight=1)
					else:
						if not silent:
							imm.log(" - Pattern %s not found in Metasploit pattern %s " % (ascipat4,extratext))


def findPattern(modulecriteria,criteria,pattern,type,base,top,consecutive,rangep2p=0):
	"""
	Performs a find in memory for a given pattern
	
	Arguments:
	modulecriteria - dictionary with criteria modules need to comply with.
	criteria - dictionary with criteria the pointers need to comply with.
				One of the criteria can be "p2p", indicating that the search should look for
				pointers to pointers to the pattern
	pattern - the pattern to search for.
	type - the type of the pattern, can be 'asc', 'bin', 'ptr', 'instr' or 'file'
		If no type is specified, the routine will try to 'guess' the types
		when type is set to file, it won't actually search in memory for pattern, but it will
		read all pointers from that file and search for pointers to those pointers
		(so basically, type 'file' is only useful in combination with -p2p)
	base - the base address in memory the search should start at
	top - the top address in memory the search should not go beyond
	consecutive - Boolean, indicating if consecutive pointers should be skipped
	rangep2p - if not set to 0, the pointer to pointer search will also look rangep2p bytes back for each pointer,
			thus allowing you to find close pointer to pointers
	
	Return:
	all pointers (or pointers to pointers) to the given search pattern in memory
	"""
	rangestosearch = []
	tmpsearch = []
	p2prangestosearch = []
	if len(modulecriteria) > 0:
		modulestosearch = getModulesToQuery(modulecriteria)
		# convert modules to ranges
		for modulename in modulestosearch:
			objmod = MnModule(modulename)
			mBase = objmod.moduleBase
			mTop = objmod.moduleTop
			if mBase < base and base < mTop:
				mBase = base
			if mTop > top:
				mTop = top
			if mBase >= base and mBase < top:
				if not [mBase,mTop] in rangestosearch:
					rangestosearch.append([mBase,mTop])
		# if no modules were specified, then also add  the other ranges (outside modules)
		if not "modules" in modulecriteria:
			outside = getRangesOutsideModules()
			for range in outside:
				mBase = range[0]
				mTop = range[1]
				if mBase < base and base < mTop:
					mBase = base
				if mTop > top:
					mTop = top
				if mBase >= base and mBase < top:
					if not [mBase,mTop] in rangestosearch:
						rangestosearch.append([mBase,mTop])
	else:
		rangestosearch.append([base,top])
	
	tmpsearch.append([0,TOP_USERLAND])
	
	allpointers = {}
	originalPattern = pattern
	
	# guess the type if it is not specified
	if type == "":
		if len(pattern) > 2 and pattern[0:2].lower() == "0x":
			type = "ptr"
		elif "\\x" in pattern:
			type = "bin"
		else:
			type = "asc"
	
	# convert the pattern to a binary string
	bytes = ""
	patternfilename = ""
	split1 = re.compile(' ')		
	split2 = re.compile(':')
	split3 = re.compile("\*")	
	
	
	if not silent:
		imm.log("    - Treating search pattern as %s" % type)
		
	if type == "ptr":
		pattern = pattern.replace("0x","")
		value = int(pattern,16)
		bytes = struct.pack('<I',value)
	elif type == "bin":
		if len(pattern) % 2 != 0:
			imm.log("Invalid hex pattern", highlight=1)
			return
		bytes = hex2bin(pattern)
	elif type == "asc":
		if pattern.startswith('"') and pattern.endswith('"'):
			pattern = pattern.replace('"',"")
		elif pattern.startswith("'") and pattern.endswith("'"):
			pattern = pattern.replace("'","")
		bytes = pattern
	elif type == "instr":
		pattern = pattern.replace("'","").replace('"',"")
		global silent
		silent = True
		bytes = hex2bin(assemble(pattern,""))
		silent = False
		if bytes == "":
			imm.log("Invalid instruction - could not assemble",highlight=1)
			return
	elif type == "file":
		patternfilename = pattern.replace("'","").replace('"',"")
		imm.log("    - Search patterns = all pointers in file %s" % patternfilename)
		imm.log("      Extracting pointers...")
		FILE=open(patternfilename,"r")
		contents = FILE.readlines()
		FILE.close()
		extracted = 0	
		for thisLine in contents:
			if thisLine.lower().startswith("0x"):
				lineparts=split1.split(thisLine)
				thispointer = lineparts[0]
				#get type  = from : to *
				if len(lineparts) > 1:
					subparts = split2.split(thisLine)
					if len(subparts) > 1:
						if subparts[1] != "":
							subsubparts = split3.split(subparts[1])
							if not subsubparts[0] in allpointers:
								allpointers[subsubparts[0]] = [hexStrToInt(thispointer)]
							else:
								allpointers[subsubparts[0]] += [hexStrToInt(thispointer)]
							extracted += 1
		imm.log("      %d pointers extracted." % extracted)							
	imm.updateLog()
	
	if "p2p" in criteria:
		#save range for later, search in all of userland for now
		p2prangestosearch = rangestosearch
		rangestosearch = tmpsearch
	
	if type != "file":
		for ranges in rangestosearch:
			mBase = ranges[0]
			mTop = ranges[1]
			if not silent:
				imm.log("[+] Searching from 0x%s to 0x%s" % (toHex(mBase),toHex(mTop)))
			imm.updateLog()
			searchPattern = []
			searchPattern.append([originalPattern, bytes])
			pointers = searchInRange(searchPattern,mBase,mTop,criteria)
			allpointers = mergeOpcodes(allpointers,pointers)
		
	if consecutive:
		# get all pointers and sort them
		rawptr = {}
		for ptrtype in allpointers:
			for ptr in allpointers[ptrtype]:
				if not ptr in rawptr:
					rawptr[ptr]=ptrtype
		if not silent:
			imm.log("[+] Number of pointers to process : %d" % len(rawptr))
		sortedptr = rawptr.items()
		sortedptr.sort(key = itemgetter(0))
		#skip consecutive ones and increment size
		consec_delta = len(bytes)
		previousptr = 0
		savedptr = 0
		consec_size = 0
		allpointers = {}
		for ptr,ptrinfo in sortedptr:
			if previousptr == 0:
				previousptr = ptr
				savedptr = ptr
			if previousptr != ptr:
				if ptr <= (previousptr + consec_delta):
					previousptr = ptr
				else:
					key = ptrinfo + " ("+ str(previousptr+consec_delta-savedptr) + ")"
					if not key in allpointers:
						allpointers[key] = [savedptr]
					else:
						allpointers[key] += [savedptr]
					previousptr = ptr
					savedptr = ptr

	if "p2p" in criteria and len(allpointers) > 0:
		if not silent:
			imm.log("[+] Looking for pointers to pointers...")
		imm.updateLog()
		searchPattern = []		
		for ptype,ptrs in allpointers.iteritems():
			for ptr in ptrs:
				cnt = 0
				while cnt <= rangep2p:
					bytes = struct.pack('<I',ptr-cnt)
					if type == "file":
						originalPattern = ptype
					if cnt == 0:
						searchPattern.append(["ptr to 0x" + toHex(ptr) +" (-> ptr to " + originalPattern + ") ** ", bytes])
					else:
						searchPattern.append(["ptr to 0x" + toHex(ptr-cnt) +" (-> close ptr to " + originalPattern + ") ** ", bytes])	
					cnt += 1			
		allpointers = {}
		for ranges in p2prangestosearch:
			mBase = ranges[0]
			mTop = ranges[1]
			if not silent:
				imm.log("[+] Searching from 0x%s to 0x%s" % (toHex(mBase),toHex(mTop)))
			imm.updateLog()
			pointers = searchInRange(searchPattern,mBase,mTop,criteria)
			allpointers = mergeOpcodes(allpointers,pointers)			
	
	return allpointers
		

def compareFileWithMemory(filename,startpos):
	imm.log("[+] Reading file %s..." % filename)
	srcdata_normal=[]
	srcdata_unicode=[]
	tagresults=[]
	criteria = {}
	criteria["accesslevel"] = "*"
	try:
		srcfile = open(filename,"rb")
		content = srcfile.readlines()
		srcfile.close()
		for eachLine in content:
			srcdata_normal += eachLine
		for eachByte in srcdata_normal:
			eachByte+=struct.pack('B', 0)
			srcdata_unicode += eachByte
		imm.log("    Read %d bytes from file" % len(srcdata_normal))
	except:
		imm.log("Error while reading file %s" % filename, highlight=1)
		return
	# loop normal and unicode
	comparetable=imm.createTable('mona Memory comparison results',['Address','Status','Type'])	
	modes = ["normal", "unicode"]
	objlogfile = MnLog("compare.txt")
	logfile = objlogfile.reset()
	for mode in modes:
		if mode == "normal":
			srcdata = srcdata_normal
		if mode == "unicode":
			srcdata = srcdata_unicode
		maxcnt = len(srcdata)
		if maxcnt < 8:
			imm.log("Error - file does not contain enough bytes (min 8 bytes needed)",highlight=1)
			return
		locations = []
		if startpos == 0:
			imm.log("[+] Locating all copies in memory (%s)" % mode)
			btcnt = 0
			cnt = 0
			linecount = 0
			hexstr = ""
			hexbytes = ""
			for eachByte in srcdata:
				if cnt < 8:
					hexbytes += eachByte
					if len((hex(ord(srcdata[cnt]))).replace('0x',''))==1:
						hexchar=hex(ord(srcdata[cnt])).replace('0x', '\\x0')
					else:
						hexchar = hex(ord(srcdata[cnt])).replace('0x', '\\x')
					hexstr += hexchar					
				cnt += 1
			imm.log("    - searching for "+hexstr)
			global silent
			silent = True
			results = findPattern({},criteria,hexstr,"bin",0,TOP_USERLAND,False)

			for type in results:
				for ptr in results[type]:
					locations.append(ptr)
		else:
			startpos_fixed = hexStrToInt(startpos)
			locations.append(startpos_fixed)
		if len(locations) > 0:
			imm.log("    - Comparing %d locations" % len(locations))
			imm.log(" Comparing bytes from file with memory :")
			for location in locations:
				memcompare(location,srcdata,comparetable,mode)
		silent = False
	return
		
def memcompare(location,srcdata,comparetable,sctype):
	objlogfile = MnLog("compare.txt")
	logfile = objlogfile.reset(False)
	imm.log("[+] Reading memory at location : 0x%s " % toHex(location),address=location,highlight=1)
	objlogfile.write("-" * 100,logfile)
	objlogfile.write("* Reading memory at location 0x" + toHex(location),logfile)
	imm.updateLog()
	memloc=location
	#read memory at that location and compare with bytes in array
	maxcnt=len(srcdata)
	brokenbytes=[]
	filelines=[]
	memlines=[]
	nrokbytes=0
	nrbrokenbytes=0
	cnt=0
	linecount=0
	firstcorruption=0
	while (cnt < maxcnt):
		#group per 8 bytes for display purposes
		btcnt=0
		hexstr=""
		thislinemem=""
		thislinefile=""
		while ((btcnt < 8) and (cnt < maxcnt)):
			try:
				if len((hex(ord(srcdata[cnt]))).replace('0x',''))==1:
					thischar=hex(ord(srcdata[cnt])).replace('0x','0')
					hexchar=hex(ord(srcdata[cnt])).replace('0x', '\\x0')
				else:
					thischar=hex(ord(srcdata[cnt])).replace('0x','')
					hexchar = hex(ord(srcdata[cnt])).replace('0x', '\\x')
				hexstr += hexchar
				memchar = imm.readMemory(memloc+cnt,1)
				if len((hex(ord(memchar))).replace('0x',''))==1:
					memchar2 = hex(ord(memchar)).replace('0x','0')
				else:
					memchar2 = hex(ord(memchar)).replace('0x','')
				thislinefile=thislinefile+thischar
				if (memchar2 == thischar):
					nrokbytes=nrokbytes+1
					thislinemem=thislinemem+thischar
				else:
					nrbrokenbytes=nrbrokenbytes+1
					thislinemem=thislinemem+"--"
					if (firstcorruption==0):
						firstcorruption=cnt
					imm.log("     Corruption at position %d : Original byte : %s - Byte in memory : %s" % (cnt,thischar,memchar2))
					objlogfile.write("   Corruption at position " +str(cnt)+" : Original byte : " + thischar + " - Byte in memory : " + memchar2,logfile)
				btcnt=btcnt+1
				cnt=cnt+1
			except:
				imm.log("   ******* Error processing byte %s " % cnt)
				objlogfile.write("   ******* Error processing byte " + str(cnt),logfile)
				imm.updateLog()
				cnt=cnt+1
				btcnt=btcnt+1
				continue
		filelines += thislinefile
		memlines += thislinemem

	if (nrokbytes == maxcnt):
		imm.log("     -> Hooray, %s shellcode unmodified" % sctype,focus=1, highlight=1)
		objlogfile.write("     -> Hooray, " + sctype + " shellcode unmodified",logfile)
		comparetable.add(0,["0x%s"%(toHex(location)),'Unmodified',sctype])
	else:
		imm.log("     -> Only %d original bytes of %s code found !" % (nrokbytes,sctype))
		objlogfile.write("     -> Only " + str(nrokbytes)+" original bytes found",logfile)
		comparetable.add(0,['0x%s'%(toHex(location)),'Corruption after %d bytes'%(firstcorruption),sctype])
		lcnt=0
		lmax = len(filelines)
		imm.log("      +-----------------------+-----------------------+")
		objlogfile.write("      +-----------------------+-----------------------+",logfile)
		imm.log("      | FILE                  | MEMORY                |")
		objlogfile.write("      | FILE                  | MEMORY                |",logfile)
		imm.log("      +-----------------------+-----------------------+")
		objlogfile.write("      +-----------------------+-----------------------+",logfile)
		while (lcnt < lmax):
			#read in pairs of 8 bytes
			bytecnt=0
			logline1="|"
			logline2=""
			while ((lcnt < lmax) and (bytecnt < 16)):
				pair=0
				while ((lcnt < lmax) and (pair < 2)):
					logline1=logline1+filelines[lcnt]
					logline2=logline2+memlines[lcnt]
					pair=pair+1
					lcnt=lcnt+1
					bytecnt=bytecnt+1
				logline1=logline1+"|"
				logline2=logline2+"|"
			if (bytecnt < 16):
				while (len(logline1) < 24 ):
					logline1=logline1+" "
					logline2=logline2+" "
					bytecnt=bytecnt+1
				logline1=logline1+"|"
				logline2=logline2+"|"
			imm.log("      %s%s" % (logline1,logline2))
			objlogfile.write("      "+logline1+logline2,logfile)
		imm.log("      +-----------------------+-----------------------+")
		objlogfile.write("      +-----------------------+-----------------------+",logfile)
		imm.log("")
		
		
		
#-----------------------------------------------------------------------#
# gadget related functions
#-----------------------------------------------------------------------#


def createRopChain(suggestions,interestinggadgets,modulecriteria,criteria):
	pushad = False
	stackpointer = False
	addreg = False
	popeax = False
	popedi = False
	popecx = False
	popedx = False
	popesi = False
	popebx = False
	popebp = False
	pickup = False
	stackdestination = ""
	shortest_pushad = 0
	shortest_stackpointer = 0
	shortest_pickup = 0
	thisshortest_pickup = 0
	pickupreg = ""
	pickupfrom = ""
	jmpesptxt = ""
	lastreturnoffset = 0

	modulestosearch = getModulesToQuery(modulecriteria)

	vpfile = MnLog("rop_virtualprotect.txt")
	thisvplog = vpfile.reset()
	
	vplogtxt =  "\n  VirtualProtect register structure (PUSHAD technique)\n"
	vplogtxt += "  ----------------------------------------------------\n"
	vplogtxt += "    EAX = NOP (0x90909090)\n"
	vplogtxt += "    ECX = lpOldProtect (Writable ptr)\n"
	vplogtxt += "    EDX = NewProtect (0x40)\n"
	vplogtxt += "    EBX = Size\n"
	vplogtxt += "    ESP = lPAddress (automatic)\n"
	vplogtxt += "    EBP = ReturnTo (ptr to jmp esp - run '!mona jmp -r esp -n -o')\n"
	vplogtxt += "    ESI = ptr to VirtualProtect()\n"
	vplogtxt += "    EDI = ROP NOP (RETN)\n"
		
	
	if len(suggestions) > 0:
		for types in suggestions:
			if types.find("move esp") > -1:
				stackpointer = True
				# get shortest one and retrieve destination
				shortest_stackpointer = getShortestGadget(suggestions[types])
				
		if "pushad" in suggestions:
			pushad = True
			#get the shortest one
			shortest_pushad = getShortestGadget(suggestions["pushad"])
			for types in suggestions:
				if types.find("pop eax") > -1:
					popeax = True
				if types.find("pop ebx") > -1:
					popebx = True
				if types.find("pop ecx") > -1:
					popecx = True
				if types.find("pop edx") > -1:
					popedx = True
				if types.find("pop esi") > -1:
					popesi = True
				if types.find("pop edi") > -1:
					popedi = True
				if types.find("pop ebp") > -1:
					popebp = True
				if types.find("pickup") > -1:
					pickup = True

		if stackpointer:
			jmpesptxt = "\n\n  In case you need it, this is how you can pickup ESP into a register :\n"
			jmpesptxt += "\t\t\t0x" + toHex(shortest_stackpointer)+",\t# "+interestinggadgets[shortest_stackpointer]+" ("+MnPointer(shortest_stackpointer).belongsTo()+")\n"
			jmpesptxt += createJunk(getJunk(interestinggadgets[shortest_stackpointer]))
		if pushad and pickup:
			vplogtxt += "\n\n  VirtualProtect() 'pushad' rop chain\n"
			vplogtxt += "  ------------------------------------\n"
			vplogtxt += "\trop_gadgets = \n"
			vplogtxt += "\t\t[\n"
			
			# pickup pointer
			pickupfound = False
			prepickuptxt = ""
			pickuptxt = ""
			postpickuptxt = ""
			popptr = 0
			
			global silent
			oldsilent = silent
			silent = True
			ropfuncs = findROPFUNC(modulecriteria,criteria)
			silent = oldsilent
			ropfuncptr = "????????"
			#first look for good one
			for ropfunctypes in ropfuncs:
				if ropfunctypes.lower().find("virtualprotect") > -1 and ropfunctypes.lower().find("rebased") == -1:
					ropfuncptr = toHex(ropfuncs[ropfunctypes][0])
					break
			if ropfuncptr == "????????":
				for ropfunctypes in ropfuncs:
					if ropfunctypes.lower().find("virtualprotect") > -1:
						ropfuncptr = toHex(ropfuncs[ropfunctypes][0])
						break
			#still haven't found ? clear out modulecriteria		
			if ropfuncptr == "????????":
				oldsilent = silent
				silent = True
				limitedmodulecriteria = {}
				limitedmodulecriteria["os"] = False
				ropfuncs2 = findROPFUNC(limitedmodulecriteria,criteria)
				silent = oldsilent
				for ropfunctypes in ropfuncs2:
					if ropfunctypes.lower().find("virtualprotect") > -1 and ropfunctypes.lower().find("rebased") == -1:
						ropfuncptr = toHex(ropfuncs2[ropfunctypes][0]) + ",\t# <- valid pointer ? (I skipped module criteria)"
						break			
			#pickup routine
			for pickuptypes in suggestions:
				if pickuptypes.find("pickup pointer into esi") > -1: 
					thisshortest_pickup = getShortestGadget(suggestions[pickuptypes])
					if shortest_pickup == 0 or (thisshortest_pickup != 0 and thisshortest_pickup < shortest_pickup):
						shortest_pickup = thisshortest_pickup
						smallparts = pickuptypes.split(" ")
						pickupreg = smallparts[len(smallparts)-1]
						parts2 = interestinggadgets[shortest_pickup].split("#")
						 #parts2[0] is empty
						smallparts = parts2[1].split("[")
						smallparts2 = smallparts[1].split("]")
						pickupfrom = smallparts2[0]
						
			pickupfound = False
			if shortest_pickup == 0: 	#no esi
				for pickuptypes in suggestions:
					if pickuptypes.find("move") > -1 and pickuptypes.find("-> esi") > -1 and not pickupfound:
						parts = pickuptypes.split(" ")
						thisreg = parts[1].lower()
						moveptr = getShortestGadget(suggestions["move "+thisreg+" -> esi"])
						#see if we have a pickup into this register
						if "pickup pointer into "+thisreg in suggestions:
							#where will we get the pointer from ?
							shortest_pickup = getShortestGadget(suggestions["pickup pointer into "+thisreg])
							pickupstr = interestinggadgets[shortest_pickup].strip()
							pickupstrparts = pickupstr.split("[")
							pickupstrsubparts = pickupstrparts[1].split("]")
							pickupfrom = pickupstrsubparts[0]
							if "pop "+pickupfrom.lower() in suggestions:
								popptr = getShortestGadget(suggestions["pop "+pickupfrom.lower()])
							else:
								popptr = 0
							if popptr > 0:
								prepickuptxt = "\t\t\t0x" + toHex(popptr)+",\t"+interestinggadgets[popptr].strip()+" ("+MnPointer(popptr).belongsTo()+")\n"
								prepickuptxt += "\t\t\t0x" + ropfuncptr + ",\t# <-ptr to ptr to VirtualProtect() \n"
								prepickuptxt += createJunk(getJunk(interestinggadgets[popptr])-4)
								lastreturnoffset = getOffset(interestinggadgets[popptr])
							else:
								prepickuptxt = "\t\t\t0x????????,\t# couldn't find a way to put ptr to ptr to VirtualProtect() into " + pickupfrom.lower() + "\n"
								prepickuptxt += "\t\t\t0x" + ropfuncptr + ",\t# <-ptr to ptr to VirtualProtect() \n"
							pickuptxt = "\t\t\t0x" + toHex(shortest_pickup)+",\t"+interestinggadgets[shortest_pickup].strip()+" ("+MnPointer(shortest_pickup).belongsTo()+")\n"
							postpickuptxt = createJunk(lastreturnoffset,"junk, compensate")
							lastreturnoffset = getOffset(interestinggadgets[shortest_pickup])
							pickuptxt += createJunk(getJunk(interestinggadgets[shortest_pickup])-4)
							postpickuptxt += "\t\t\t0x" + toHex(moveptr)+",\t"+interestinggadgets[moveptr].strip()+" ("+MnPointer(moveptr).belongsTo()+")\n"
							postpickuptxt += createJunk(lastreturnoffset,"junk, compensate")
							postpickuptxt += createJunk(getJunk(interestinggadgets[moveptr]))
							lastreturnoffset = getOffset(interestinggadgets[moveptr])	
							pickupfound = True
							
			else: #w00t - direct pickup to esi
				popptr = getShortestGadget(suggestions["pop "+pickupfrom.lower()])
				if popptr > 0:
					prepickuptxt = "\t\t\t0x" + toHex(popptr)+",\t"+interestinggadgets[popptr].strip()+" ("+MnPointer(popptr).belongsTo()+")\n"
					prepickuptxt += "\t\t\t0x" + ropfuncptr + ",\t# <- ptr to ptr to VirtualProtect()\n"
					prepickuptxt += createJunk(getJunk(interestinggadgets[popptr])-4)
					lastreturnoffset = getOffset(interestinggadgets[popptr])
				pickuptxt = "\t\t\t0x" + toHex(shortest_pickup)+",\t"+interestinggadgets[shortest_pickup].strip()+" ("+MnPointer(shortest_pickup).belongsTo()+")\n"
				lastreturnoffset = getOffset(interestinggadgets[shortest_pickup])
				pickuptxt += createJunk(getJunk(interestinggadgets[shortest_pickup])-4)
				pickupfound = True

			if not pickupfound:
				vplogtxt += "\t\t\t#couldn't find rop gadgets to pickup virtualprotect\n"
			else:
				vplogtxt += prepickuptxt
				vplogtxt += pickuptxt
				vplogtxt += postpickuptxt
			
			#set up call to finding jmp esp
			global silent
			oldsilent = silent
			silent=True
			global ptr_to_get
			global ptr_counter
			ptr_counter = 0
			ptr_to_get = 1
			jmpesp = findJMP(modulecriteria,criteria,"esp")
			espptr = 0
			esptype = ""
			silent=oldsilent
			
			preesptxt = ""
			esptxt = ""
			postesptxt = ""
			
			# can use use pointer to jmp esp in ebp ?
			if len(jmpesp) > 0:
				if popebp and popptr > 0:
					#get the shortest one
					popebpptr = getShortestGadget(suggestions["pop ebp"])
					preesptxt = "\t\t\t0x" + toHex(popebpptr)+",\t"+interestinggadgets[popebpptr].strip()+" ("+MnPointer(popebpptr).belongsTo()+")\n"
					preesptxt += createJunk(lastreturnoffset,"junk, compensate")
					preesptxt += createJunk(getJunk(interestinggadgets[popptr])-4)
					lastreturnoffset = getOffset(interestinggadgets[popebpptr])
					postesptxt += createJunk(lastreturnoffset,"junk, compensate")
				else:
					# can we get ebp from another pointer ?
					foundpopalternative = False
					for types in suggestions:
						if not foundpopalternative:
							if types.find("move") > -1 and types.find("-> ebp") > -1:
								typeparts = types.split(" ")
								srcreg = types[1].strip()
								if "pop "+srcreg in suggestions:
									imm.log("	found one !")
									popptr = getShortestGadget(suggestions["pop "+srcreg])
									moveptr = getShortestGadget(suggestions[types])
									preesptxt = "\t\t\t0x" + toHex(popptr)+",\t"+interestinggadgets[popptr].strip()+" ("+MnPointer(popptr).belongsTo()+")\n"
									preesptxt += createJunk(lastreturnoffset,"junk, compensate")
									preesptxt += createJunk(getJunk(interestinggadgets[popptr])-4)
									lastreturnoffset = getOffset(interestinggadgets[popptr])									
									postesptxt = "\t\t\t0x" + toHex(moveptr)+",\t"+interestinggadgets[moveptr].strip()+" ("+MnPointer(moveptr).belongsTo()+")\n"
									postesptxt += createJunk(lastreturnoffset,"junk, compensate")
									postesptxt += createJunk(getJunk(interestinggadgets[popptr]))
									lastreturnoffset = getOffset(interestinggadgets[moveptr])
									foundpopalternative = True
					if not foundpopalternative:
						esptxt = "\t\t\t0x????????,\t# couldn't find a way to pickup a pointer to jmp esp into ebp\n"
						esptxt += createJunk(lastreturnoffset,"junk, compensate")
				for esptype in jmpesp:
					for ptr in jmpesp[esptype]:
						espptr = ptr
						esptxt += "\t\t\t0x" + toHex(ptr)+",\t# ptr to '"+esptype+"' (from "+MnPointer(ptr).belongsTo()+")\n"
			else:
				esptxt = "\t\t\t0x????????,\t# couldn't find a pointer to put ptr to 'jmp esp' into ebp\n"
				esptxt += createJunk(lastreturnoffset,"junk, compensate")
				esptxt += "\t\t\t0x????????,\t# <- put pointer to payload here\n"
				
			vplogtxt += preesptxt
			vplogtxt += esptxt
			vplogtxt += postesptxt
			
			# other parameters
			ropptr = "????????,\t# <- ROP NOP, fill in pointer to RETN (-> edi)\n"
			otherregs = ["ebx","ecx","edi","edx","eax"]
			for reg in otherregs:
				thisline = ""
				blocktxt = ""
				junksize = 0
				if "pop "+reg in suggestions:
					popptr = getShortestGadget(suggestions["pop "+reg])
				else:
					popptr = 0
				if reg == "eax":
					thisline = "\t\t\t0x90909090,\t# NOPS (-> eax)\n"
				if reg == "ecx":
					rwptr = getAPointer(modulestosearch,criteria,"RW")
					if rwptr != 0:
						thisline = "\t\t\t0x" + toHex(rwptr)+",\t# RW pointer (lpOldProtect) (-> ecx)\n"
					else:
						rwptr = getAPointer(modulestosearch,criteria,"W")
						if rwptr != 0:
							thisline = "\t\t\t0x" + toHex(rwptr)+",\t# W pointer (lpOldProtect) (-> ecx)\n"
						else:						
							thisline = "\t\t\t0x????????,\t# <- fill in (R)W pointer (lpOldProtect) (-> ecx)\n"
				if reg == "edi":
					if popptr > 0:
						ropptr = toHex(popptr+1)+",\t# ROP NOP (-> edi)\n"
					else:
						ropptr = "????????,\t# ROP NOP (-> edi)\n"
					thisline = "\t\t\t0x"+ropptr+""

				if reg == "ebx":
					if not "nonull" in criteria:				
						thisline = "\t\t\t0x00000201,\t# <- change size to mark as executable if needed (-> ebx)\n"
					else:
						blocktxt,junksize = getGadgetValueToReg(reg,0x201,suggestions,interestinggadgets)
						
				if reg == "edx":			
					if not "nonull" in criteria:
						thisline = "\t\t\t0x00000040,\t# newProtect (0x40) (-> edx)\n"
					else:
						blocktxt,junksize = getGadgetValueToReg(reg,0x40,suggestions,interestinggadgets)
				if blocktxt != "":
					vplogtxt += blocktxt
					vplogtxt += createJunk(junksize)				
				elif popptr > 0:
					vplogtxt += "\t\t\t0x" + toHex(popptr)+",\t"+interestinggadgets[popptr].strip()+" ("+MnPointer(popptr).belongsTo()+")\n"
					vplogtxt += createJunk(lastreturnoffset,"junk, compensate")
					vplogtxt += thisline
					vplogtxt += createJunk(getJunk(interestinggadgets[popptr])-4)
					lastreturnoffset = getOffset(interestinggadgets[popptr])
				elif popptr == 0:
					#find reg pivot
					regpivot = False
					for reg2 in otherregs:
						if not regpivot:
							if reg2 != reg:
								if "pop "+reg2 in suggestions and "move "+reg2+" -> "+reg in suggestions:
									regpivot = True
									popptr = getShortestGadget(suggestions["pop "+reg2])
									vplogtxt += "\t\t\t# alternative gadget - you may have to change order\n"
									vplogtxt += "\t\t\t0x" + toHex(popptr)+",\t#"+interestinggadgets[popptr].strip()+" ("+MnPointer(popptr).belongsTo()+")\n"
									vplogtxt += createJunk(lastreturnoffset,"junk, compensate")
									if reg == "edx":
										vplogtxt += "\t\t\t0x00000040,\t# newProtect (0x40) (" + reg2 + " -> "+reg+")\n"
									if reg == "ebx":
										vplogtxt += "\t\t\t0x00000200,\t# size to martk as executable (" + reg2 + " -> "+reg+")\n"
									vplogtxt += createJunk(getJunk(interestinggadgets[popptr])-4)
									lastreturnoffset = getOffset(interestinggadgets[popptr])
									
									moveptr = getShortestGadget(suggestions["move "+reg2+" -> "+reg])
									vplogtxt += "\t\t\t0x" + toHex(moveptr)+",\t#"+interestinggadgets[moveptr].strip()+" ("+MnPointer(moveptr).belongsTo()+")\n"
									vplogtxt += createJunk(lastreturnoffset,"junk, compensate")
									vplogtxt += createJunk(getJunk(interestinggadgets[moveptr]))
									lastreturnoffset = getOffset(interestinggadgets[moveptr])
					if not regpivot:
							vplogtxt +="\t\t\t# ! I could not find a gadget to put the desired value into "+reg+"\n"
			vplogtxt += "\t\t\t0x" + toHex(shortest_pushad)+",\t"+interestinggadgets[shortest_pushad].strip()+" ("+MnPointer(shortest_pushad).belongsTo()+")\n"
			vplogtxt += createJunk(lastreturnoffset,"junk, compensate")
			vplogtxt += createJunk(getJunk(interestinggadgets[shortest_pushad]))
			vplogtxt += '\t\t# rop chain generated by mona.py\n'
			vplogtxt += '\t\t# note : this chain may not work out of the box\n'
			vplogtxt += '\t\t# you may have to change order or fix some gadgets,\n'
			vplogtxt += '\t\t# but it should give you a head start\n'
			vplogtxt += '\t\t].pack("V*")\n'
			vpfile.write(vplogtxt,thisvplog)
			vpfile.write(jmpesptxt,thisvplog)
			imm.logLines(vplogtxt.replace("\t","    "))
	return

def getGadgetValueToReg(reg,value,suggestions,interestinggadgets):
	negfound = False
	blocktxt = ""
	blocktxt2 = ""	
	tonegate = 4294967296 - value
	nregs = ["eax","ebx","ecx","edx","edi"]
	junksize = 0
	negateline = "\t\t\t0x" + toHex(tonegate)+",\t# value to negate, target value : 0x" + toHex(value) + ", target reg : " + reg +"\n"
	if "neg " + reg in suggestions:
		negfound = True
		negptr = getShortestGadget(suggestions["neg " + reg])
		blocktxt += negateline
		blocktxt += "\t\t\t0x" + toHex(negptr)+",\t"+interestinggadgets[negptr].strip()+" ("+MnPointer(negptr).belongsTo()+")\n"
		junksize = getJunk(interestinggadgets[negptr])-4
	if not negfound:
		nregs.remove(reg)
		for thisreg in nregs:
			if "neg "+ thisreg in suggestions and not negfound:
				blocktxt2 = ""
				junk2size = 0
				negfound = True
				#get pop first
				if "pop "+thisreg in suggestions:
					pptr = getShortestGadget(suggestions["pop " + thisreg])
					blocktxt2 += "\t\t\t0x" + toHex(pptr)+",\t"+interestinggadgets[pptr].strip()+" ("+MnPointer(pptr).belongsTo()+")\n"					
					blocktxt2 += negateline
					junk2size = getJunk(interestinggadgets[pptr])-4
				else:
					blocktxt2 += "\t\t\t0x????????,#\tfind a way to pop the next value into "+thisreg+"\n"					
					blocktxt2 += negateline				
				negptr = getShortestGadget(suggestions["neg " + thisreg])
				blocktxt2 += "\t\t\t0x" + toHex(negptr)+",\t"+interestinggadgets[negptr].strip()+" ("+MnPointer(negptr).belongsTo()+")\n"
				junk2size = junk2size + getJunk(interestinggadgets[negptr])-4				
				#now move it to reg
				if "move " + thisreg + " -> " + reg in suggestions:
					bptr = getShortestGadget(suggestions["move " + thisreg + " -> " + reg])
					if interestinggadgets[bptr].strip().startswith("# ADD"):
						if not "clear " + reg in suggestions:
							blocktxt2 += "\t\t\t0x????????,\t# find pointer to clear " + reg+"\n"
						else:
							clearptr = getShortestGadget(suggestions["empty " + reg])
							blocktxt2 += "\t\t\t0x" + toHex(clearptr)+",\t"+interestinggadgets[clearptr].strip()+" ("+MnPointer(clearptr).belongsTo()+")\n"	
							junk2size = junk2size + getJunk(interestinggadgets[clearptr])-4
					blocktxt2 += "\t\t\t0x" + toHex(bptr)+",\t"+interestinggadgets[bptr].strip()+" ("+MnPointer(bptr).belongsTo()+")\n"
					junk2size = junk2size + getJunk(interestinggadgets[bptr])-4
				else:
					negfound = False
	if negfound: 
		blocktxt += blocktxt2
	else:
		blocktxt = ""
	junksize = junksize + junk2size
	return blocktxt,junksize
		

def getOffset(instructions):
	offset = 0
	instrparts = instructions.split("#")
	retpart = instrparts[len(instrparts)-1].strip()
	retparts = retpart.split(" ")
	if len(retparts) > 1:
		offset = hexStrToInt(retparts[1])
	return offset
	
def getJunk(instructions):
	junkpop = instructions.count("POP ") * 4
	junkpush = instructions.count("PUSH ") * -4
	junkpopad = instructions.count("POPAD") * 32
	junk = junkpop + junkpush + junkpopad
	return junk

def createJunk(size,message="junk"):
	bytecnt = 0
	dword = 0
	junktxt = ""
	while bytecnt < size:
		dword = 0
		junktxt += "\t\t\t0x"
		while dword < 4 and bytecnt < size :
			junktxt += "41"
			dword += 1
			bytecnt += 1
		junktxt += ",\t# "+message+"\n"
	return junktxt

def getBestPickup(pickupdict):
	from_reg = ""
	to_reg = ""
	pickupptr = 0
	
	return from_reg,to_reg,pickupptr

def getShortestGadget(chaintypedict):
	shortest = 100
	shortestptr = 0
	shortestinstr = "A" * 1000
	for typeptr in chaintypedict:
		thisinstr = chaintypedict[typeptr]
		thiscount = thisinstr.count("#")
		if thiscount < shortest:
			shortest = thiscount
			shortestptr = typeptr
			shortestinstr = thisinstr
		else:
			if thiscount == shortest:
				if len(thisinstr) < len(shortestinstr):
					shortest = thiscount
					shortestptr = typeptr
					shortestinstr = thisinstr
	return shortestptr

def isInterestingGadget(instructions):
	interesting =	[
					"POP E", "XCHG E", "LEA E", "PUSH E", "XOR E", "AND E", "NEG E", 
					"OR E", "ADD E", "SUB E", "INC E", "DEC E", "POPAD", "PUSHAD",
					"SUB A", "ADD A", "NOP", "ADC E",
					"SUB BH", "SUB BL", "ADD BH", "ADD BL", 
					"SUB CH", "SUB CL", "ADD CH", "ADD CL",
					"SUB DH", "SUB DL", "ADD DH", "ADD DL",
					"MOV E", "CLC", "CLD", "FS:"
					]
	notinteresting = [ "MOV ESP,EBP", "LEA ESP"	]
	regs = immlib.Registers32BitsOrder
	individual = instructions.split("#")
	cnt = 0
	allgood = True
	toskip = False
	while (cnt < len(individual)-1) and allgood:	# do not check last one, which is the ending instruction
		thisinstr = individual[cnt].strip().upper()
		if thisinstr != "":
			toskip = False
			foundinstruction = False
			for notinterest in notinteresting:
				if thisinstr.find(notinterest) > -1:
					toskip= True 
			if not toskip:
				for interest in interesting:
					if thisinstr.find(interest) > -1:
						foundinstruction = True
				if not foundinstruction:
					#check the conditional instructions
					if thisinstr.find("MOV DWORD PTR DS:[E") > -1:
						thisinstrparts = thisinstr.split(",")
						if len(thisinstrparts) > 1:
							if thisinstrparts[1] in regs:
								foundinstruction = True
				allgood = foundinstruction
			else:
				allgood = False
		cnt += 1
	return allgood

	
def readGadgetsFromFile(filename):
	"""
	Reads a mona generated rop file 
	
	Arguments :
	filename - the full path + filename of the source file
	
	Return :
	dictionary containing the gadgets (grouped by ending type)
	"""
	
	readopcodes = {}
	
	srcfile = open(filename,"rb")
	content = srcfile.readlines()
	srcfile.close()
	for thisLine in content:
		refpointer,instr = splitToPtrInstr(thisLine)
		if refpointer != -1:
			#get ending
			instrparts = instr.split("#")
			ending = instrparts[len(instrparts)-1]
			if not ending in readopcodes:
				readopcodes[ending] = [refpointer,instr]
			else:
				readopcodes[ending] += ([refpointer,instr])
	return readopcodes
	
	
def isGoodGadgetPtr(gadget,criteria):
	gadgetptr = MnPointer(gadget)
	if meetsCriteria(gadgetptr,criteria):
		#do additional checks
		return True
	else:
		return False
		
def getStackPivotDistance(gadget,distance=0):
	allgadgets = gadget.split(" # ")
	offset = 0
	gadgets = []
	splitter = re.compile(",")
	mindistance = 0
	maxdistance = 0
	distanceparts = splitter.split(str(distance))
	if len(distanceparts) == 1:
		mindistance = int(distance)
		maxdistance = 99999999
	else:
		mindistance = int(distanceparts[0])
		maxdistance = int(distanceparts[1])
	for thisgadget in allgadgets:
		if thisgadget.strip() != "":
			gadgets.append(thisgadget.strip())
	if len(gadgets) > 1:
		# calculate the entire distance
		for g in gadgets:
			if g.find("POP") == 0 or g.find("ADD ESP,") == 0 or g.find("PUSH") == 0 or g.find("RET") == 0 or g.find("SUB ESP,") == 0:
				if g.strip().find("ADD ESP,") == 0:
					parts = g.split(",")
					try:
						offset += hexStrToInt(parts[1])
					except:
						pass
				if g.strip().find("SUB ESP,") == 0:
					parts = g.split(",")
					try:
						offset -= hexStrToInt(parts[1])
					except:
						pass
				if g.strip().find("POP ") == 0:
					offset += 4
				if g.strip().find("PUSH ") == 0:
					offset -= 4
				if g.strip().find("POPAD") == 0:
					offset += 32
				if g.strip().find("PUSHAD") == 0:
					offset -= 32
			else:
				if (g.find("DWORD PTR") > 0 or g.find("[") > 0) and not g.find("FS") > 0:
					return 0
	if mindistance <= offset and offset <= maxdistance:
		return offset
	return 0
		
def isGoodGadgetInstr(instruction):
	forbidden = [
				"???", "LEAVE", "JMP ", "CALL ", "JB ", "JL ", "JE ", "JNZ ", 
				"JGE ", "JNS ","SAL ", "LOOP", "LOCK", "BOUND", "SAR", "IN ", 
				"OUT ", "RCL", "RCR", "ROL", "ROR", "SHL", "SHR", "INT", "JECX",
				"JNP", "JPO", "JPE", "JCXZ", "JA", "JB", "JNA", "JNB", "JC", "JNC",
				"JG", "JLE", "MOVS", "CMPS", "SCAS", "LODS", "STOS", "REP", "REPE",
				"REPZ", "REPNE", "REPNZ", "LDS", "FST", "FIST", "FMUL", "FDIVR",
				"FSTP", "FST", "FLD", "FDIV", "FXCH", "JS ", "FIDIVR", "SBB",
				"SALC", "ENTER", "CWDE", "FCOM", "LAHF", "DIV", "JO", "OUT", "IRET",
				"FILD", "RETF","HALT","HLT","AAM","FINIT"
				]
	for instr in forbidden:
		if instruction.upper().find(instr) > -1:
			return False
	return True

def isGadgetEnding(instruction,endings,verbosity=False):
	endingfound=False
	for ending in endings:
		if instruction.lower().find(ending.lower()) > -1:
			endingfound = True
	return endingfound

def getRopSuggestion(ropchains):
	suggestions={}
	# pushad
	# ======================
	regs = ["EAX","EBX","ECX","EDX","EBP","ESI","EDI"]
	pushad_allowed = [ "INC ","DEC ","OR ","XOR ","LEA ","ADD ","SUB ", "PUSHAD", "RETN ", "NOP", "POP ","PUSH EAX","PUSH EDI","ADC " ]
	for r in regs:
		pushad_allowed.append("MOV "+r+",DWORD PTR DS:[ESP")	#stack
		pushad_allowed.append("MOV "+r+",DWORD PTR SS:[ESP")	#stack
		pushad_allowed.append("MOV "+r+",DWORD PTR DS:[ESI")	#virtualprotect
		pushad_allowed.append("MOV "+r+",DWORD PTR SS:[ESI")	#virtualprotect
		pushad_allowed.append("MOV "+r+",DWORD PTR DS:[EBP")	#stack
		pushad_allowed.append("MOV "+r+",DWORD PTR SS:[EBP")	#stack
		for r2 in regs:
			pushad_allowed.append("MOV "+r+","+r2)
			pushad_allowed.append("XCHG "+r+","+r2)
			pushad_allowed.append("LEA "+r+","+r2)
	pushad_notallowed = ["POP ESP","POPAD","PUSH ESP","MOV ESP","ADD ESP", "INC ESP","DEC ESP","XOR ESP","LEA ESP","SS:","DS:"]
	for gadget in ropchains:
		gadgetinstructions = ropchains[gadget].strip()
		if gadgetinstructions.find("PUSHAD") == 2:
			# does chain only contain allowed instructions
			# one pop is allowed, as long as it's not pop esp
			# push edi and push eax are allowed too (ropnop)
			if gadgetinstructions.count("POP ") < 2 and suggestedGadgetCheck(gadgetinstructions,pushad_allowed,pushad_notallowed):
				toadd={}
				toadd[gadget] = gadgetinstructions
				if not "pushad" in suggestions:
					suggestions["pushad"] = toadd
				else:
					suggestions["pushad"] = mergeOpcodes(suggestions["pushad"],toadd)
	# pick up a pointer
	# =========================
	pickedupin = []
	resulthash = ""
	allowedpickup = True
	for r in regs:
		for r2 in regs:
			pickup_allowed = ["NOP","RETN ","INC ","DEC ","OR ","XOR ","MOV ","LEA ","ADD ","SUB ","POP","ADC "]
			pickup_target = []
			pickup_notallowed = []
			pickup_allowed.append("MOV "+r+",DWORD PTR SS:["+r2+"]")
			pickup_allowed.append("MOV "+r+",DWORD PTR DS:["+r2+"]")
			pickup_target.append("MOV "+r+",DWORD PTR SS:["+r2+"]")
			pickup_target.append("MOV "+r+",DWORD PTR DS:["+r2+"]")
			pickup_notallowed = ["POP "+r, "MOV "+r+",E", "LEA "+r+",E", "MOV ESP", "XOR ESP", "LEA ESP", "MOV DWORD PTR"]
			for gadget in ropchains:
				gadgetinstructions = ropchains[gadget].strip()	
				allowedpickup = False
				for allowed in pickup_target:
					if gadgetinstructions.find(allowed) == 2 and gadgetinstructions.count("DWORD PTR") == 1:
						allowedpickup = True
				if allowedpickup:
					if suggestedGadgetCheck(gadgetinstructions,pickup_allowed,pickup_notallowed):
						toadd={}
						toadd[gadget] = gadgetinstructions
						resulthash = "pickup pointer into "+r.lower()
						if not resulthash in suggestions:
							suggestions[resulthash] = toadd
						else:
							suggestions[resulthash] = mergeOpcodes(suggestions[resulthash],toadd)
						if not r in pickedupin:
							pickedupin.append(r)
	if len(pickedupin) == 0:
		for r in regs:
			for r2 in regs:
				pickup_allowed = ["NOP","RETN ","INC ","DEC ","OR ","XOR ","MOV ","LEA ","ADD ","SUB ","POP", "ADC "]
				pickup_target = []
				pickup_notallowed = []
				pickup_allowed.append("MOV "+r+",DWORD PTR SS:["+r2+"+")
				pickup_allowed.append("MOV "+r+",DWORD PTR DS:["+r2+"+")
				pickup_target.append("MOV "+r+",DWORD PTR SS:["+r2+"+")
				pickup_target.append("MOV "+r+",DWORD PTR DS:["+r2+"+")
				pickup_notallowed = ["POP "+r, "MOV "+r+",E", "LEA "+r+",E", "MOV ESP", "XOR ESP", "LEA ESP", "MOV DWORD PTR"]
				for gadget in ropchains:
					gadgetinstructions = ropchains[gadget].strip()	
					allowedpickup = False
					for allowed in pickup_target:
						if gadgetinstructions.find(allowed) == 2 and gadgetinstructions.count("DWORD PTR") == 1:
							allowedpickup = True
					if allowedpickup:
						if suggestedGadgetCheck(gadgetinstructions,pickup_allowed,pickup_notallowed):
							toadd={}
							toadd[gadget] = gadgetinstructions
							resulthash = "pickup pointer into "+r.lower()
							if not resulthash in suggestions:
								suggestions[resulthash] = toadd
							else:
								suggestions[resulthash] = mergeOpcodes(suggestions[resulthash],toadd)
							if not r in pickedupin:
								pickedupin.append(r)
	# move pointer into another pointer
	# =================================
	for reg in regs:	#from
		for reg2 in regs:	#to
			if reg != reg2:
				moveptr_allowed = ["NOP","RETN","POP ","INC ","DEC ","OR ","XOR ","ADD ","PUSH ","AND ", "XCHG ", "ADC "]
				moveptr_notallowed = ["POP "+reg2,"MOV "+reg2+",","XCHG "+reg2+",","XOR "+reg2,"LEA "+reg2+",","AND "+reg2,"DS:","SS:","PUSHAD","POPAD"]
				suggestions = mergeOpcodes(suggestions,getRegToReg("MOVE",reg,reg2,ropchains,moveptr_allowed,moveptr_notallowed))
		reg2 = "ESP"	#special case
		if reg != reg2:
			moveptr_allowed = ["NOP","RETN","POP ","INC ","DEC ","OR ","XOR ","ADD ","PUSH ","AND ", "MOV ", "XCHG ", "ADC "]
			moveptr_notallowed = ["ADD "+reg2, "ADC "+reg2, "POP "+reg2,"MOV "+reg2+",","XCHG "+reg2+",","XOR "+reg2,"LEA "+reg2+",","AND "+reg2,"DS:","SS:","PUSHAD","POPAD"]
			suggestions = mergeOpcodes(suggestions,getRegToReg("MOVE",reg,reg2,ropchains,moveptr_allowed,moveptr_notallowed))
	# get stack pointer
	# =================
	for reg in regs:
		moveptr_allowed = ["NOP","RETN","POP ","INC ","DEC ","OR ","XOR ","ADD ","PUSH ","AND ","MOV ", "ADC "]
		moveptr_notallowed = ["POP ESP","MOV ESP,","XCHG ESP,","XOR ESP","LEA ESP,","AND ESP", "ADD ESP", "DWORD PTR"]
		moveptr_notallowed.append("POP "+reg)
		moveptr_notallowed.append("MOV "+reg)
		moveptr_notallowed.append("XCHG "+reg)
		moveptr_notallowed.append("XOR "+reg)
		moveptr_notallowed.append("LEA "+reg)
		moveptr_notallowed.append("AND "+reg)
		suggestions = mergeOpcodes(suggestions,getRegToReg("MOVE","ESP",reg,ropchains,moveptr_allowed,moveptr_notallowed))
	# add something to register
	# =========================
	for reg in regs:	#from
		for reg2 in regs:	#to
			if reg != reg2:
				moveptr_allowed = ["NOP","RETN","POP ","INC ","DEC ","OR ","XOR ","ADD ","PUSH ","AND ", "ADC "]
				moveptr_notallowed = ["POP "+reg2,"MOV "+reg2+",","XCHG "+reg2+",","XOR "+reg2,"LEA "+reg2+",","AND "+reg2,"DS:","SS:"]
				suggestions = mergeOpcodes(suggestions,getRegToReg("ADD",reg,reg2,ropchains,moveptr_allowed,moveptr_notallowed))
	# add value to register
	# =========================
	for reg in regs:	#to
		moveptr_allowed = ["NOP","RETN","POP ","INC ","DEC ","OR ","XOR ","ADD ","PUSH ","AND ", "ADC ", "SUB "]
		moveptr_notallowed = ["POP "+reg,"MOV "+reg+",","XCHG "+reg+",","XOR "+reg,"LEA "+reg+",","DS:","SS:"]
		suggestions = mergeOpcodes(suggestions,getRegToReg("ADDVAL",reg,reg,ropchains,moveptr_allowed,moveptr_notallowed))				
	# pop
	# ===
	for reg in regs:
		pop_allowed = "POP "+reg+" # RETN"
		pop_notallowed = []
		for gadget in ropchains:
			gadgetinstructions = ropchains[gadget].strip()
			if gadgetinstructions.find(pop_allowed) == 2:
				resulthash = "pop "+reg.lower()
				toadd = {}
				toadd[gadget] = gadgetinstructions
				if not resulthash in suggestions:
					suggestions[resulthash] = toadd
				else:
					suggestions[resulthash] = mergeOpcodes(suggestions[resulthash],toadd)
	# neg
	# ===
	for reg in regs:
		neg_allowed = "NEG "+reg+" # RETN"
		neg_notallowed = []
		for gadget in ropchains:
			gadgetinstructions = ropchains[gadget].strip()
			if gadgetinstructions.find(neg_allowed) == 2:
				resulthash = "neg "+reg.lower()
				toadd = {}
				toadd[gadget] = gadgetinstructions
				if not resulthash in suggestions:
					suggestions[resulthash] = toadd
				else:
					suggestions[resulthash] = mergeOpcodes(suggestions[resulthash],toadd)		
	# empty
	# =====
	for reg in regs:
		empty_allowed = ["XOR "+reg+","+reg+" # RETN","MOV "+reg+",FFFFFFFF # INC "+reg+" # RETN"]
		empty_notallowed = []
		for gadget in ropchains:
			gadgetinstructions = ropchains[gadget].strip()
			for empty in empty_allowed:
				if gadgetinstructions.find(empty) == 2:
					resulthash = "empty "+reg.lower()
					toadd = {}
					toadd[gadget] = gadgetinstructions
					if not resulthash in suggestions:
						suggestions[resulthash] = toadd
					else:
						suggestions[resulthash] = mergeOpcodes(suggestions[resulthash],toadd)						
	return suggestions

	
def getRegToReg(type,fromreg,toreg,ropchains,moveptr_allowed,moveptr_notallowed):
	moveptr = []
	instrwithout = ""
	toreg = toreg.upper()
	srcval = False
	resulthash = ""
	if type == "MOVE":
		moveptr.append("MOV "+toreg+","+fromreg)
		moveptr.append("LEA "+toreg+","+fromreg)
		#if not (fromreg == "ESP" or toreg == "ESP"):
		moveptr.append("XCHG "+fromreg+","+toreg)
		moveptr.append("XCHG "+toreg+","+fromreg)
		moveptr.append("PUSH "+fromreg)
		moveptr.append("ADD "+toreg+","+fromreg)
		moveptr.append("ADC "+toreg+","+fromreg)		
		moveptr.append("XOR "+toreg+","+fromreg)
	if type == "ADD":
		moveptr.append("ADD "+toreg+","+fromreg)
		moveptr.append("ADC "+toreg+","+fromreg)		
		moveptr.append("XOR "+toreg+","+fromreg)
	if type == "ADDVAL":
		moveptr.append("ADD "+toreg+",")
		moveptr.append("ADC "+toreg+",")		
		moveptr.append("XOR "+toreg+",")		
		srcval = True
		resulthash = "add value to " + toreg
	results = {}
	if resulthash == "":
		resulthash = type +" "+fromreg+" -> "+toreg
	resulthash = resulthash.lower()
	for tocheck in moveptr:
		for gadget in ropchains:
			gadgetinstructions = ropchains[gadget].strip()
			if gadgetinstructions.find(tocheck) == 2:
				moveon = True
				if srcval:
					#check if src is a value
					inparts = gadgetinstructions.split(",")
					if len(inparts) > 1:
						subinparts = inparts[1].split(" ")
						if isHexString(subinparts[0].strip()):
							tocheck = tocheck + subinparts[0].strip()
						else:
							moveon = False
				if moveon:	
					instrwithout = gadgetinstructions.replace(tocheck,"")
					if tocheck == "PUSH "+fromreg:
						popreg = instrwithout.find("POP "+toreg)
						popall = instrwithout.find("POP")
						#make sure pop matches push
						nrpush = gadgetinstructions.count("PUSH ")
						nrpop = gadgetinstructions.count("POP ")
						pushpopmatch = False
						if nrpop >= nrpush:
							pushes = []
							pops = []
							ropparts = gadgetinstructions.split(" # ")
							pushindex = 0
							popindex = 0
							cntpush = 0
							cntpop = nrpush
							for parts in ropparts:
								if parts.strip() != "":
									if parts.strip().find("PUSH ") > -1:
										pushes.append(parts)
										if parts.strip() == "PUSH "+fromreg:
											cntpush += 1
									if parts.strip().find("POP ") > -1:
										pops.append(parts)
										if parts.strip() == "POP "+toreg:
											cntpop -= 1
							if cntpush == cntpop:
								#imm.log("%s : POPS : %d, PUSHES : %d, pushindex : %d, popindex : %d" % (gadgetinstructions,len(pops),len(pushes),pushindex,popindex))
								#imm.log("push at %d, pop at %d" % (cntpush,cntpop))
								pushpopmatch = True
						if (popreg == popall) and instrwithout.count("POP "+toreg) == 1 and pushpopmatch:
							toadd={}
							toadd[gadget] = gadgetinstructions
							if not resulthash in results:
								results[resulthash] = toadd
							else:
								results[resulthash] = mergeOpcodes(results[resulthash],toadd)
					else:
						if suggestedGadgetCheck(instrwithout,moveptr_allowed,moveptr_notallowed):
							toadd={}
							toadd[gadget] = gadgetinstructions
							if not resulthash in results:
								results[resulthash] = toadd
							else:
								results[resulthash] = mergeOpcodes(results[resulthash],toadd)
	return results
	
def suggestedGadgetCheck(instructions,allowed,notallowed):
	individual = instructions.split("#")
	cnt = 0
	allgood = True
	toskip = False
	while (cnt < len(individual)-1) and allgood:	# do not check last one, which is the ending instruction
		thisinstr = individual[cnt].upper()
		if thisinstr.strip() != "":
			toskip = False
			foundinstruction = False
			for notok in notallowed:
				if thisinstr.find(notok) > -1:
					toskip= True 
			if not toskip:
				for ok in allowed:
					if thisinstr.find(ok) > -1:
						foundinstruction = True
				allgood = foundinstruction
			else:
				allgood = False
		cnt += 1
	return allgood

def dumpMemoryToFile(address,size,filename):
	"""
	Dump 'size' bytes of memory to a file
	
	Arguments:
	address  - the address where to read
	size     - the number of bytes to read
	filename - the name of the file where to write the file
	
	Return:
	Boolean - True if the write succeeded
	"""

	WRITE_SIZE = 10000
	
	imm.log("Dumping %d bytes from address 0x%08x to %s..."	% (size, address, filename))
	out = open(filename,'wb')
	
	# write by increments of 10000 bytes
	current = 0
	while current < size :
		bytesToWrite = size - current
		if ( bytesToWrite >= WRITE_SIZE):
			bytes = imm.readMemory(address+current,WRITE_SIZE)
			out.write(bytes)
			current += WRITE_SIZE
		else:
			bytes = imm.readMemory(address+current,bytesToWrite)
			out.write(bytes)
			current += bytesToWrite
	out.close()
	
	return True
		

def goFindMSP():
	"""
	Finds all references to cyclic pattern in memory
	
	Arguments:
	None
	
	Return:
	Dictonary with results of the search operation
	"""
	results = {}
	regs = imm.getRegs()
	criteria = {}
	criteria["accesslevel"] = "*"
	fullpattern = createPattern(20280)
	factor = 1
	
	#are we attached to an application ?
	if imm.getDebuggedPid() == 0:
		imm.log("*** Attach to an application, and trigger a crash with a cyclic pattern ! ***",highlight=1)
		return	{}
	
	#1. find beging of metasploit pattern in memory ?
	patbegin = createPattern(6)
	pattypes = ["normal","unicode","lower","upper"]
	if not silent:
		imm.log("[+] Looking for cyclic pattern in memory")
	for pattype in pattypes:
		imm.updateLog()
		searchPattern = []
		#create search pattern
		factor = 1
		if pattype == "normal":
			searchPattern.append([patbegin, patbegin])	
		if pattype == "unicode":
			patbegin_unicode = ""
			factor = 0.5
			for pbyte in patbegin:
				patbegin_unicode += pbyte + "\x00"
			searchPattern.append([patbegin_unicode, patbegin_unicode])	
		if pattype == "lower":
			searchPattern.append([patbegin.lower(), patbegin.lower()])	
		if pattype == "upper":
			searchPattern.append([patbegin.upper(), patbegin.upper()])	
		#search
		pointers = searchInRange(searchPattern,0,TOP_USERLAND,criteria)
		memory={}
		if len(pointers) > 0:
			for ptrtypes in pointers:
				for ptr in pointers[ptrtypes]:
					#get size
					thissize = getPatternLength(ptr,pattype)
					if thissize > 0:
						if not silent:
							imm.log("    Cyclic pattern (%s) found at 0x%s (length %d bytes)" % (pattype,toHex(ptr),thissize))
						if not ptr in memory:
							memory[ptr] = ([thissize,pattype])
					#get distance from ESP
					thisesp = regs["ESP"]
					thisptr = MnPointer(ptr)
					if thisptr.isOnStack():
						if ptr > thisesp:
							imm.log("    -  Stack pivot between %d & %d bytes needed to land in this pattern" % (ptr-thisesp,ptr-thisesp+thissize))
			if not "memory" in results:
				results["memory"] = memory
			
	#2. registers overwritten ?
	if not silent:
		imm.log("[+] Examining registers")
	registers = {}
	registers_to = {}
	for reg in regs:
		for pattype in pattypes:
			imm.updateLog()		
			regpattern = fullpattern
			hexpat = toHex(regs[reg])
			factor = 1
			hexpat = toAscii(hexpat[6]+hexpat[7])+toAscii(hexpat[4]+hexpat[5])+toAscii(hexpat[2]+hexpat[3])+toAscii(hexpat[0]+hexpat[1])
			if pattype == "upper":
				regpattern = regpattern.upper()
			if pattype == "lower":
				regpattern = regpattern.lower()
			if pattype == "unicode":
				regpattern = toUnicode(regpattern)
				factor = 0.5
				
			offset = regpattern.find(hexpat)
			if offset > -1:
				if pattype == "unicode":
					offset = offset * factor
				if not silent:
					imm.log("    %s overwritten with %s pattern : 0x%s (offset %d)" % (reg,pattype,toHex(regs[reg]),offset))
				if not reg in registers:
					registers[reg] = ([regs[reg],offset,pattype])

					
			# maybe register points into metasploit pattern
			mempat = ""
			try:
				mempat = imm.readMemory(regs[reg],4)
			except:
				pass
			
			if mempat != "":
				if pattype == "normal":
					regpattern = fullpattern
				if pattype == "upper":
					regpattern = fullpattern.upper()
				if pattype == "lower":
					regpattern = fullpattern.lower()
				if pattype == "unicode":
					mempat = imm.readMemory(regs[reg],8)
					mempat = mempat.replace('\x00','')
					
				offset = regpattern.find(mempat)
				
				if offset > -1:				
					thissize = getPatternLength(regs[reg],pattype)
					if thissize > 0:
						if not silent:
							imm.log("    %s (0x%s) points at offset %d in %s pattern (length %d)" % (reg,toHex(regs[reg]),offset,pattype,thissize))
						if not reg in registers_to:
							registers_to[reg] = ([regs[reg],offset,thissize,pattype])
						else:
							registers_to[reg] = ([regs[reg],offset,thissize,pattype])
							
	if not "registers" in results:
		results["registers"] = registers
	if not "registers_to" in results:
		results["registers_to"] = registers_to

	#3. SEH record overwritten ?
	seh = {}
	if not silent:
		imm.log("[+] Examining SEH chain")
		
	thissehchain=imm.getSehChain()
	
	for chainentry in thissehchain:
		for pattype in pattypes:
			imm.updateLog()		
			regpattern = fullpattern
			hexpat = toHex(chainentry[1])
			hexpat = toAscii(hexpat[6]+hexpat[7])+toAscii(hexpat[4]+hexpat[5])+toAscii(hexpat[2]+hexpat[3])+toAscii(hexpat[0]+hexpat[1])
			factor = 1
			if pattype == "upper":
				regpattern = regpattern.upper()
			if pattype == "lower":
				regpattern = regpattern.lower()
			if pattype == "unicode":
				#regpattern = toUnicode(regpattern)
				#get next 4 bytes too
				hexpat = imm.readMemory(chainentry[0],8)
				hexpat = hexpat.replace('\x00','')
	
			offset = regpattern.find(hexpat)
			thissize = 0
			if offset > -1:		
				thepointer = MnPointer(chainentry[0])
				if thepointer.isOnStack():
					thissize = getPatternLength(chainentry[0]+4,pattype)
					if thissize > 0:
						if not silent:
							imm.log("    SEH handler at 0x%s overwritten with %s pattern : 0x%s (offset %d), followed by %d bytes of cyclic data" % (toHex(chainentry[0]+4),pattype,toHex(chainentry[1]),offset,thissize))
						if not chainentry[0]+4 in seh:
							seh[chainentry[0]+4] = ([chainentry[1],offset,pattype,thissize])
							
	if not "seh" in results:
		results["seh"] = seh

	#4. walking stack
	stack = {}
	if not silent:
		imm.log("[+] Examining stack")
	maxoffset = 8192
	espoffset = -8192
	curresp = regs["ESP"]
	sign=""
	
	while espoffset < maxoffset:
		imm.updateLog()	
		if espoffset > -1:
			sign="+"			
		else:
			sign="-"	
			
		cont = imm.readMemory(curresp+espoffset,4)
		
		if len(cont) == 4:
		
			cval=""				
			for sbytes in cont:
				tval = hex(ord(sbytes)).replace("0x","")
				if len(tval) < 2:
					tval="0"+tval
				cval = tval+cval
			try:				
				contat = imm.readMemory(hexStrToInt(cval),4)
			except:
				contat = ""	
				
			if contat <> "":
				
					for pattype in pattypes:
						imm.updateLog()
						regpattern = fullpattern
						
						hexpat = contat
					
						if pattype == "upper":
							regpattern = regpattern.upper()
						if pattype == "lower":
							regpattern = regpattern.lower()
						if pattype == "unicode":
							hexpat = imm.readMemory(hexStrToInt(cval),8)
							hexpat = hexpat.replace('\x00','')
						
						offset = regpattern.find(hexpat)
						
						currptr = hexStrToInt(cval)
						
						if offset > -1:				
							thissize = getPatternLength(currptr,pattype)
							if thissize > 0:
								offsetvalue = int(str(espoffset).replace("-",""))
								if not silent:
									imm.log("    Pointer into %s cyclic pattern at ESP%s0x%s (%s%s) : 0x%s : offset %d, length %d" % (pattype,sign,rmLeading(toHex(offsetvalue),"0"),sign,offsetvalue,toHex(currptr),offset,thissize))
								if not currptr in stack:
									stack[currptr] = ([offsetvalue,sign,offset,thissize,pattype])					
						
		espoffset += 4
	
	if not "stack" in results:
		results["stack"] = stack
	
	return results
	
#-----------------------------------------------------------------------#
# convert arguments to criteria
#-----------------------------------------------------------------------#

def args2criteria(args,modulecriteria,criteria):

	imm.logLines("\n---------- Mona command started on %s ----------" % datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
	imm.log("[+] Processing arguments and criteria")
	global ptr_to_get
	
	# meets access level ?
	criteria["accesslevel"] = "X"
	if "x" in args : 
		if not args["x"].upper() in ["*","R","RW","RX","RWX","W","WX","X"]:
			imm.log("invalid access level : %s" % args["x"], highlight=1)
			criteria["accesslevel"] = ""
		else:
			criteria["accesslevel"] = args["x"].upper()
		
	imm.log("    - Pointer access level : %s" % criteria["accesslevel"])
	
	# query OS modules ?
	if "o" in args and args["o"]:
		modulecriteria["os"] = False
		imm.log("    - Ignoring OS modules")
	
	# allow nulls ?
	if "n" in args and args["n"]:
		criteria["nonull"] = True
		imm.log("    - Ignoring pointers that have null bytes")
	
	# override list of modules to query ?
	if "m" in args:
		if type(args["m"]).__name__.lower() <> "bool":
			modulecriteria["modules"] = args["m"]
			imm.log("    - Only querying modules %s" % args["m"])
				
	# limit nr of pointers to search ?
	if "p" in args:
		if str(args["p"]).lower() != "true":
			ptr_to_get = int(args["p"].strip())
		if ptr_to_get > 0:	
			imm.log("    - Maximum nr of pointers to return : %d" % ptr_to_get)
	
	# only want to see specific type of pointers ?
	if "cp" in args:
		ptrcriteria = args["cp"].split(",")
		for ptrcrit in ptrcriteria:
			ptrcrit=ptrcrit.strip("'")
			ptrcrit=ptrcrit.strip('"').lower().strip()
			criteria[ptrcrit] = True
		imm.log("    - Pointer criteria : %s" % ptrcriteria)
	
	if "cpb" in args:
		badchars = args["cpb"]
		badchars = badchars.replace("'","")
		badchars = badchars.replace('"',"")
		badchars = badchars.replace("\\x","")
		cnt = 0
		strb = ""
		while cnt < len(badchars):
			strb=strb+binascii.a2b_hex(badchars[cnt]+badchars[cnt+1])
			cnt=cnt+2
		criteria["badchars"] = strb
		imm.log("    - Bad char filter will be applied to pointers : %s " % args["cpb"])
			
	if "cm" in args:
		modcriteria = args["cm"].split(",")
		for modcrit in modcriteria:
			modcrit=modcrit.strip("'")
			modcrit=modcrit.strip('"').lower().strip()
			#each criterium has 1 or 2 parts : criteria=value
			modcritparts = modcrit.split("=")
			try:
				if len(modcritparts) < 2:
					# set to True, no value given
					modulecriteria[modcritparts[0].strip()] = True
				else:
					# read the value
					modulecriteria[modcritparts[0].strip()] = (modcritparts[1].strip() == "true")
			except:
				continue
		if (inspect.stack()[1][3] == "procShowMODULES"):
			modcriteria = args["cm"].split(",")
			for modcrit in modcriteria:
				modcrit=modcrit.strip("'")
				modcrit=modcrit.strip('"').lower().strip()
				if modcrit.startswith("+"):
					modulecriteria[modcrit]=True
				else:
					modulecriteria[modcrit]=False
		imm.log("    - Module criteria : %s" % modcriteria)

	return modulecriteria,criteria			
				
				
				

#-----------------------------------------------------------------------#
# main
#-----------------------------------------------------------------------#	
				
def main(args):
	try:
		starttime = datetime.datetime.now()
		ptr_counter = 0
		
		# initialize list of commands
		commands = {}
		
		# ----- HELP ----- #
		
		def procHelp(args):
			imm.log("     !mona - PyCommand for Immunity Debugger <= v1.8x")
			imm.log("     Current plugin version : %s " % (__VERSION__))
			imm.log("     Written by Corelan - http://www.corelan.be")
			imm.log("     Project page : http://redmine.corelan.be")
			imm.log("    |------------------------------------------------------------------|",highlight=1)
			imm.log("    |                         __               __                      |",highlight=1)
			imm.log("    |   _________  ________  / /___ _____     / /____  ____ _____ ___  |",highlight=1)
			imm.log("    |  / ___/ __ \/ ___/ _ \/ / __ `/ __ \   / __/ _ \/ __ `/ __ `__ \ |",highlight=1)
			imm.log("    | / /__/ /_/ / /  /  __/ / /_/ / / / /  / /_/  __/ /_/ / / / / / / |",highlight=1)
			imm.log("    | \___/\____/_/   \___/_/\__,_/_/ /_/   \__/\___/\__,_/_/ /_/ /_/  |",highlight=1)
			imm.log("    |                                                                  |",highlight=1)
			imm.log("    |------------------------------------------------------------------|",highlight=1)
			imm.log("Global options :")
			imm.log("----------------")
			imm.log("You can use one or more of the following global options on any command that will perform")
			imm.log("a search in one or more modules, returning a list of pointers :")
			imm.log(" -n                     : Skip modules that start with a null byte. If this is too broad, use")
			imm.log("                          option -cm nonull instead")
			imm.log(" -o                     : Ignore OS modules")
			imm.log(" -p <nr>                : Stop search after <nr> pointers.")
			imm.log(" -m <module,module,...> : only query the given modules. Be sure what you are doing !")
			imm.log("                          You can specify multiple modules (comma separated)")
			imm.log("                          Tip : you can use -m *  to include all modules. All other module criteria will be ignored")
			imm.log("                          Other wildcards : *blah.dll = ends with blah.dll, blah* = starts with blah,")
			imm.log("                          blah or *blah* = contains blah")
			imm.log(" -cm <crit,crit,...>    : Apply some additional criteria to the modules to query.")
			imm.log("                          You can use one or more of the following criteria :")
			imm.log("                          aslr,safeseh,rebase,nx,os")
			imm.log("                          You can enable or disable a certain criterium by setting it to true or false")
			imm.log("                          Example :  -cm aslr=true,safeseh=false")
			imm.log("                          Suppose you want to search for p/p/r in aslr enabled modules, you could call")
			imm.log("                          !mona seh -cm aslr")
			imm.log(" -cp <crit,crit,...>    : Apply some criteria to the pointers to return")
			imm.log("                          Available options are :")
			imm.log("                          unicode,ascii,asciiprint,upper,lower,uppernum,lowernum,numeric,alphanum,nonull,startswithnull")
			imm.log("                          Note : Multiple criteria will be evaluated using 'AND', except if you are looking for unicode + one crit")
			imm.log(" -cpb '\\x00\\x01'        : Provide list with bad chars, applies to pointers")
			imm.log(" -x <access>            : Specify desired access level of the returning pointers. If not specified,")
			imm.log("                          only executable pointers will be return.  Access levels can be one of the following values : R,W,X,RW,RX,WX,RWX or *")
			
			if not args:
				args = []
			if len(args) > 1:
				thiscmd = args[1].lower().strip()
				if thiscmd in commands:
					imm.log("")
					imm.log("Usage of command '%s' :" % thiscmd)
					imm.log("%s" % ("-" * (22 + len(thiscmd))))
					imm.logLines(commands[thiscmd].usage)
					imm.log("")
				else:
					imm.log("Command %s does not exist. Run !mona to get a list of available commands" % thiscmd,highlight=1)
			else:
				imm.logLines("\nUsage :")
				imm.logLines("-------\n")
				imm.log(" !mona <command> <parameter>")
				imm.logLines("\nAvailable commands and parameters :\n")

				items = commands.items()
				items.sort(key = itemgetter(0))
				for item in items:
					if commands[item[0]].usage <> "":
						imm.logLines("%s | %s" % (item[0] + (" " * (20 - len(item[0]))), commands[item[0]].description))
				imm.log("")
				imm.log("Want more info about a given command ?  Run !mona help <command>",highlight=1)
				imm.log("")
		
		commands["help"] = MnCommand("help", "show help", "!mona help [command]",procHelp)
		
		# ----- Config file management ----- #
		
		def procConfig(args):
			#did we specify -get, -set or -add?
			showerror = False
			if not "set" in args and not "get" in args and not "add" in args:
				showerror = True
				
			if "set" in args:
				if type(args["set"]).__name__.lower() == "bool":
					showerror = True
				else:
					#count nr of words
					params = args["set"].split(" ")
					if len(params) < 2:
						showerror = True
			if "add" in args:
				if type(args["add"]).__name__.lower() == "bool":
					showerror = True
				else:
					#count nr of words
					params = args["add"].split(" ")
					if len(params) < 2:
						showerror = True
			if "get" in args:
				if type(args["get"]).__name__.lower() == "bool":
					showerror = True
				else:
					#count nr of words
					params = args["get"].split(" ")
					if len(params) < 1:
						showerror = True
			if showerror:
				imm.log("Usage :")
				imm.logLines(configUsage,highlight=1)
				return
			else:
				if "get" in args:
					imm.log("Reading value from configuration file")
					monaConfig = MnConfig()
					thevalue = monaConfig.get(args["get"])
					imm.log("Parameter %s = %s" % (args["get"],thevalue))
				
				if "set" in args:
					imm.log("Writing value to configuration file")
					monaConfig = MnConfig()
					value = args["set"].split(" ")
					configparam = value[0].strip()
					imm.log("Old value of parameter %s = %s" % (configparam,monaConfig.get(configparam)))
					configvalue = args["set"][0+len(configparam):len(args["set"])]
					monaConfig.set(configparam,configvalue)
					imm.log("New value of parameter %s = %s" % (configparam,configvalue))
				
				if "add" in args:
					imm.log("Writing value to configuration file")
					monaConfig = MnConfig()
					value = args["add"].split(" ")
					configparam = value[0].strip()
					imm.log("Old value of parameter %s = %s" % (configparam,monaConfig.get(configparam)))
					configvalue = monaConfig.get(configparam).strip() + "," + args["add"][0+len(configparam):len(args["add"])].strip()
					monaConfig.set(configparam,configvalue)
					imm.log("New value of parameter %s = %s" % (configparam,configvalue))
				
		# ----- Jump to register ----- #
	
		def procFindJ(args):
			return procFindJMP(args)
		
		def procFindJMP(args):
			#default criteria
			modulecriteria={}
			modulecriteria["aslr"] = False
			modulecriteria["rebase"] = False
			
			if (inspect.stack()[1][3] == "procFindJ"):
				imm.log(" ** Note : command 'j' has been replaced with 'jmp'. Now launching 'jmp' instead...",highlight=1)

			criteria={}
			all_opcodes={}
			
			global ptr_to_get
			ptr_to_get = -1
			
			#did user specify -r <reg> ?
			showerror = False
			if "r" in args:
				if type(args["r"]).__name__.lower() == "bool":
					showerror = True
				else:
					#valid register ?
					thisreg = args["r"].upper().strip()
					validregs = immlib.Registers32BitsOrder
					if not thisreg in validregs:
						showerror = True
			else:
				showerror = True
			
			if showerror:
				imm.log("Usage :")
				imm.logLines(jmpUsage,highlight=1)
				return				
			else:
				modulecriteria,criteria = args2criteria(args,modulecriteria,criteria)
				# go for it !	
				all_opcodes=findJMP(modulecriteria,criteria,args["r"].lower().strip())
			
			# write to log
			logfile = MnLog("jmp.txt")
			thislog = logfile.reset()
			processResults(all_opcodes,logfile,thislog)
		
		# ----- Exception Handler Overwrites ----- #
		
		def procFindSEHp(args):
			return procFindSEH(args)
		
		def procFindSEHp1(args):
			return procFindSEH(args)

		def procFindSEHp2(args):
			return procFindSEH(args)

		def procFindSEHa(args):
			return procFindSEH(args)

		def procFindSEHjseh(args):
			return procFindSEH(args)			
					
		def procFindSEH(args):
			#default criteria
			modulecriteria={}
			modulecriteria["safeseh"] = False
			modulecriteria["aslr"] = False
			modulecriteria["rebase"] = False

			criteria={}
			all_opcodes = {}
			
			global ptr_to_get
			ptr_to_get = -1
			
			#what is the caller function (backwards compatibility with pvefindaddr)
			
			if (inspect.stack()[1][3] == "procFindSEHa"):
				imm.log(" ** Note : command 'a' has been replaced with 'seh'. Now launching 'seh' instead...",highlight=1)
			
			if (inspect.stack()[1][3] == "procFindSEHp"):
				try:
					del modulecriteria["aslr"]
				except:
					pass
				imm.log(" ** Note : command 'p' has been replaced with 'seh'. Now launching 'seh' instead...",highlight=1)
			
			if (inspect.stack()[1][3] == "procFindSEHp1"):
				imm.log(" ** Note : command 'p1' has been replaced with 'seh'. Now launching 'seh' instead...",highlight=1)
				
			if (inspect.stack()[1][3] == "procFindSEHjseh"):
				imm.log(" ** Note : command 'jseh' has been replaced with 'seh'. Now launching 'seh' instead...",highlight=1)
			
					
			if (inspect.stack()[1][3] == "procFindSEHp2"):
				try:
					del modulecriteria["aslr"]
					del modulecriteria["safeseh"]
					del modulecriteria["rebase"]
				except:
					pass
				imm.log(" ** Note : command 'p2' has been replaced with 'seh'. Now launching 'seh' instead...",highlight=1)
					
			modulecriteria,criteria = args2criteria(args,modulecriteria,criteria)
					
			# go for it !	
			all_opcodes = findSEH(modulecriteria,criteria)
			#report findings to log
			logfile = MnLog("seh.txt")
			thislog = logfile.reset()
			processResults(all_opcodes,logfile,thislog)
			
			
			

		# ----- MODULES ------ #
		def procShowMODULES(args):
			modulecriteria={}
			criteria={}
			
			modulecriteria,criteria = args2criteria(args,modulecriteria,criteria)
			modulestosearch = getModulesToQuery(modulecriteria)
			showModuleTable("",modulestosearch)

		# ----- ROP ----- #
		def procFindROPFUNC(args):
			#default criteria
			modulecriteria={}
			modulecriteria["aslr"] = False
			#modulecriteria["rebase"] = False
			modulecriteria["os"] = False
			criteria={}
			
			modulecriteria,criteria = args2criteria(args,modulecriteria,criteria)
			ropfuncs = {}
			ropfuncs = findROPFUNC(modulecriteria,criteria)
			#report findings to log
			logfile = MnLog("ropfunc.txt")
			thislog = logfile.reset()
			processResults(ropfuncs,logfile,thislog)
			
		def procStackPivots(args):
			procROP(args,"stackpivot")
			
		def procROP(args,mode="all"):
			#default criteria
			modulecriteria={}
			modulecriteria["aslr"] = False
			modulecriteria["rebase"] = False
			modulecriteria["os"] = False

			criteria={}
			
			modulecriteria,criteria = args2criteria(args,modulecriteria,criteria)
			
			# handle optional arguments
			
			depth = 6
			maxoffset = 40
			thedistance = 8
			split = False
			fast = False
			endingstr = ""
			endings = []
			
			if "depth" in args:
				if type(args["depth"]).__name__.lower() != "bool":
					try:
						depth = int(args["depth"])
					except:
						pass
			
			if "offset" in args:
				if type(args["offset"]).__name__.lower() != "bool":
					try:
						maxoffset = int(args["offset"])
					except:
						pass
			
			if "distance" in args:
				if type(args["distance"]).__name__.lower() != "bool":
					try:
						thedistance = args["distance"]
					except:
						pass
			
			if "split" in args:
				if type(args["split"]).__name__.lower() == "bool":
					split = args["split"]
					
			if "fast" in args:
				if type(args["fast"]).__name__.lower() == "bool":
					fast = args["fast"]
			
			if "end" in args:
				if type(args["end"]).__name__.lower() == "str":
					endingstr = args["end"].replace("'","").replace('"',"").strip()
					endings = endingstr.split("#")
					
			if "f" in args:
				if args["f"] <> "":
					criteria["f"] = args["f"]
					
			if mode == "stackpivot":
				fast = False
				endings = ""
				split = False
			else:
				mode = "all"
			
			findROPGADGETS(modulecriteria,criteria,endings,maxoffset,depth,split,thedistance,fast,mode)
			
			
		def procCreatePATTERN(args):
			size = 0
			pattern = ""
			if "?" in args and args["?"] != "":
				try:
					size = int(args["?"])
				except:
					size = 0
			if size == 0:
				imm.log("Please entire a valid size",highlight=1)
			else:
				imm.log("Creating cyclic pattern of %d bytes" % size)
				pattern = createPattern(size)
				imm.log(pattern)
				global ignoremodules
				ignoremodules = True
				objpatternfile = MnLog("pattern.txt")
				patternfile = objpatternfile.reset()
				objpatternfile.write("Pattern of " + str(size) + " bytes :",patternfile)
				objpatternfile.write("-" * (19 + len(str(size))),patternfile)
				objpatternfile.write(pattern,patternfile)
				ignoremodules = False
			return


		def procOffsetPATTERN(args):
			egg = ""
			if "?" in args and args["?"] != "":
				try:
					egg = args["?"]
				except:
					egg = ""
			if egg == "":
				imm.log("Please entire a valid target",highlight=1)
			else:
				findOffsetInPattern(egg)
			return
		
		# ----- Comparing file output ----- #
		def procFileCOMPARE(args):
			modulecriteria={}
			criteria={}
			modulecriteria,criteria = args2criteria(args,modulecriteria,criteria)
			allfiles=[]
			tomatch=""
			checkstrict=True
			if "f" in args:
				if args["f"] <> "":
					rawfilenames=args["f"].replace('"',"")
					allfiles = rawfilenames.split(',')
					imm.log("[+] Number of files to be examined : %d : " % len(allfiles))
			if "contains" in args:
				if type(args["contains"]).__name__.lower() == "str":
					tomatch = args["contains"].replace("'","").replace('"',"")
			if "nostrict" in args:
				if type(args["nostrict"]).__name__.lower() == "bool":
					checkstrict = not args["nostrict"]
					imm.log("[+] Instructions must match in all files ? %s" % checkstrict)
			if len(allfiles) > 1:
				findFILECOMPARISON(modulecriteria,criteria,allfiles,tomatch,checkstrict)
			else:
				imm.log("Please specify at least 2 filenames to compare",highlight=1)

		# ----- Find bytes in memory ----- #
		def procFind(args):
			modulecriteria={}
			criteria={}
			pattern = ""
			base = 0
			top  = TOP_USERLAND
			consecutive = False
			type = ""
			
			if not "a" in args:
				args["a"] = "*"
			
			modulecriteria,criteria = args2criteria(args,modulecriteria,criteria)
			if criteria["accesslevel"] == "":
				return
			if not "s" in args:
				imm.log("-s <search pattern (or filename)> is a mandatory argument",highlight=1)
				return
			pattern = args["s"]

			if "b" in args:
				try:
					base = int(args["b"],16)
				except:
					imm.log("invalid base address: %s" % args["b"],highlight=1)
					return
			if "t" in args:
				try:
					top = int(args["t"],16)
				except:
					imm.log("invalid top address: %s" % args["t"],highlight=1)
					return
			if "c" in args:
				imm.log("    - Skipping consecutive pointers, showing size instead")			
				consecutive = True
				
			if "type" in args:
				if not args["type"] in ["bin","asc","ptr","instr","file"]:
					imm.log("Invalid search type : %s" % args["type"], highlight=1)
					return
				type = args["type"] 
				if type == "file":
					filename = args["s"].replace('"',"").replace("'","")
					#see if we can read the file
					if not os.path.isfile(filename):
						imm.log("Unable to find/read file %s" % filename,highlight=1)
						return
			rangep2p = 0
			
			if "p2p" in args:
				imm.log("    - Looking for pointers to pointers")
				criteria["p2p"] = True
				if "r" in args:	
					try:
						rangep2p = int(args["r"])
					except:
						pass
					if rangep2p > 0:
						imm.log("    - Will search for close pointers (%d bytes backwards)" % rangep2p)
				
			allpointers = findPattern(modulecriteria,criteria,pattern,type,base,top,consecutive,rangep2p)
						
			logfile = MnLog("find.txt")
			thislog = logfile.reset()
			processResults(allpointers,logfile,thislog)
		
	
			
		# ----- assemble: assemble instructions to opcodes ----- #
		def procAssemble(args):
			opcodes = ""
			encoder = ""
			
			if not 's' in args:
				imm.log("Mandatory argument -s <opcodes> missing", highlight=1)
				return
			opcodes = args['s']
			
			if 'e' in args:
				# TODO: implement encoder support
				imm.log("Encoder support not yet implemented", highlight=1)
				return
				encoder = args['e'].lowercase()
				if encoder not in ["ascii"]:
					imm.log("Invalid encoder : %s" % encoder, highlight=1)
					return
			
			assemble(opcodes,encoder)
			
		# ----- info: show information about an address ----- #
		def procInfo(args):
			
			if not "a" in args:
				imm.log("Missing mandatory argument -a", highlight=1)
				return
			
			args["a"] = args["a"].replace("0x","").replace("0X","")
			
			if not isAddress(args["a"]):
				imm.log("%s is not a valid address" % args["a"], highlight=1)
				return
			
			address = addrToInt(args["a"])
			ptr = MnPointer(address)
			modname = ptr.belongsTo()
			modinfo = None
			if modname != "":
				modinfo = MnModule(modname)
			rebase = ""
			rva=0
			if modinfo :
				rva = address - modinfo.moduleBase
			imm.log("")
			imm.log("Information about address 0x%s" % toHex(address))
			imm.log("    %s" % ptr.__str__())
			if rva != 0:
				imm.log("    Offset from module base: 0x%x" % rva)
			if ptr.isOnStack():
				imm.log("    This address is in a stack segment")
			if modinfo:
				imm.log("    Module: %s" % modinfo.__str__())
			else:
				imm.log("    Module: None")
			try:
				op = imm.disasm(address)
				opstring=op.getDisasm()
				imm.log("    Instruction at %s : %s" % (toHex(address),opstring))
			except:
				pass
			
			imm.log("")
		
		# ----- dump: Dump some memory to a file ----- #
		def procDump(args):
			
			filename = ""
			if "f" not in args:
				imm.log("Missing mandatory argument -f <filename>", highlight=1)
				return
			filename = args["f"]
			
			address = None
			if "s" not in args:
				imm.log("Missing mandatory argument -s <address>", highlight=1)
			
			if not isAddress(args["s"]):
				imm.log("%s is an invalid address" % args["s"], highlight=1)
				return
			address = addrToInt(args["s"])
			
			size = 0
			if "n" in args:
				size = int(args["n"])
			elif "e" in args:
				if not isAddress(args["e"]):
					imm.log("%s is an invalid address" % args["e"], highlight=1)
					return
				end = addrToInt(args["e"])
				if end < address:
					imm.log("end address %s is before start address %s" % (args["e"],args["s"]), highlight=1)
					return
				size = end - address
			else:
				imm.log("you need to specify either the size of the copy with -n or the end address with -e ", highlight=1)
				return
			
			dumpMemoryToFile(address,size,filename)
			
		# ----- compare : Compare contents of a file with copy in memory, indicate bad chars / corruption ----- #
		def procCompare(args):
			startpos = 0
			filename = ""
			if "f" in args:
				filename = args["f"].replace('"',"").replace("'","")
				#see if we can read the file
				if not os.path.isfile(filename):
					imm.log("Unable to find/read file %s" % filename,highlight=1)
					return
			else:
				imm.log("You must specify a valid filename using parameter -f", highlight=1)
				return
			if "a" in args:
				if not isAddress(args["a"]):
					imm.log("%s is an invalid address" % args["a"], highlight=1)
					return
				else:
					startpos = args["a"]
			compareFileWithMemory(filename,startpos)
			
			
# ----- offset: Calculate the offset between two addresses ----- #
		def procOffset(args):
			extratext1 = ""
			extratext2 = ""
			isReg_a1 = False
			isReg_a2 = False
			regs = imm.getRegs()
			if "a1" not in args:
				imm.log("Missing mandatory argument -a1 <address>", highlight=1)
				return
			a1 = args["a1"]
			if "a2" not in args:
				imm.log("Missing mandatory argument -a2 <address>", highlight=1)
				return		
			a2 = args["a2"]
			
			for reg in regs:
				if reg.upper() == a1.upper():
					a1=toHex(regs[reg])					
					isReg_a1 = True
					extratext1 = " [" + reg.upper() + "] " 
					break
			a1 = a1.upper().replace("0X","").lower()
				
			if not isAddress(str(a1)):
				imm.log("%s is not a valid address" % str(a1), highlight=1)
				return


				
			for reg in regs:
				if reg.upper() == a2.upper():
					a2=toHex(regs[reg])					
					isReg_a2 = True
					extratext2 = " [" + reg.upper() + "] " 					
					break
			a2 = a2.upper().replace("0X","").lower()
			
			if not isAddress(str(a2)):
				imm.log("%s is not a valid address" % str(a2), highlight=1)
				return
				
			a1 = hexStrToInt(a1)
			a2 = hexStrToInt(a2)
			
			diff = a2 - a1
			result=toHex(diff)
			if a1 > a2:
				ndiff = a1 - a2
				result=toHex(4294967296-ndiff) 
				negjmpbytes="\\x"+ result[6]+result[7]+"\\x"+result[4]+result[5]+"\\x"+result[2]+result[3]+"\\x"+result[0]+result[1]
				imm.log("       Jump offset : %s" % negjmpbytes)
				regaction="sub"
			imm.log("Offset from 0x%08x%s to 0x%08x%s : %d (0x%s) bytes" % (a1,extratext1,a2,extratext2,diff,result))	
			if a1 > a2:
				imm.log("Negative jmp offset : %s" % negjmpbytes)
				
		# ----- bp: Set a breakpoint on read/write/exe access ----- #
		def procBp(args):
			isReg_a = False
			regs = imm.getRegs()
			thistype = ""
			
			if "a" not in args:
				imm.log("Missing mandatory argument -a <address>", highlight=1)
				return
			a = str(args["a"])

			for reg in regs:
				if reg.upper() == a.upper():
					a=toHex(regs[reg])					
					isReg_a = True
					break
			a = a.upper().replace("0X","").lower()
			
			if not isAddress(str(a)):
				imm.log("%s is not a valid address" % a, highlight=1)
				return
			
			if "t" not in args:
				imm.log("Missing mandatory argument -t <type>", highlight=1)
				return
			else:
				thistype = args["t"].upper()
				
			valid_types = ["READ", "WRITE", "SFX", "EXEC"]
			
			if not thistype in valid_types:
				imm.log("Invalid type : %s" % thistype)
				return
			
			if thistype == "EXEC":
				thistype = "SFX"
			
			a = hexStrToInt(a)
			
			imm.setMemBreakpoint(a,thistype[0])
			imm.log("Breakpoint set on %s of 0x%s" % (thistype,toHex(a)),highlight=1)
		
		
		# ----- Show info about modules -------#
		def procModInfoS(args):
			modulecriteria = {}
			criteria = {}
			modulecriteria["safeseh"] = False
			imm.log("Safeseh unprotected modules :")
			modulestosearch = getModulesToQuery(modulecriteria)
			showModuleTable("",modulestosearch)
			return
			
		def procModInfoSA(args):
			modulecriteria = {}
			criteria = {}
			modulecriteria["safeseh"] = False
			modulecriteria["aslr"] = False
			modulecriteria["rebase"] = False	
			imm.log("Safeseh unprotected, no aslr & no rebase modules :")
			modulestosearch = getModulesToQuery(modulecriteria)
			showModuleTable("",modulestosearch)			
			return

		def procModInfoA(args):
			modulecriteria = {}
			criteria = {}
			modulecriteria["aslr"] = False
			modulecriteria["rebase"] = False	
			imm.log("No aslr & no rebase modules :")			
			modulestosearch = getModulesToQuery(modulecriteria)
			showModuleTable("",modulestosearch)			
			return
			
		# ----- Print byte array ----- #
		
		def procByteArray(args):
			badchars = ""
			forward = True
			startval = 0
			endval = 255
			sign = 1
			bytesperline = 32
			if "b" in args:
				if type(args["b"]).__name__.lower() != "bool":	
					badchars = args["b"]
			if "r" in args:
				forward = False
				startval = -255
				endval = 0
				sign = -1
				
			badchars = badchars.replace("'","")
			badchars = badchars.replace('"',"")
			badchars = badchars.replace("\\x","")
			cnt = 0
			strb = ""
			while cnt < len(badchars):
				strb=strb+binascii.a2b_hex(badchars[cnt]+badchars[cnt+1])
				cnt=cnt+2			
			
			imm.log("Generating table, excluding %d bad chars..." % len(strb))
			arraytable = []
			while startval <= endval:
				thisval = startval * sign
				hexbyte = hex(thisval)[2:]
				if len(hexbyte) == 1:
					hexbyte = "0" + hexbyte
				hexbyte2 = binascii.a2b_hex(hexbyte)
				if not hexbyte2 in strb:
					arraytable.append(hexbyte)
				startval += 1
			imm.log("Dumping table to file")
			output = ""
			cnt = 0
			outputline = '"'
			totalbytes = len(arraytable)
			tablecnt = 0
			while tablecnt < totalbytes:
				if (cnt < bytesperline):
					outputline += "\\x" + arraytable[tablecnt]
				else:
					outputline += '"\n'
					cnt = 0
					output += outputline
					outputline = '"\\x' + arraytable[tablecnt]
				tablecnt += 1
				cnt += 1
			if (cnt-1) < bytesperline:
				outputline += '"\n'
			output += outputline
			
			global ignoremodules
			ignoremodules = True
			arrayfilename="bytearray.txt"
			objarrayfile = MnLog(arrayfilename)
			arrayfile = objarrayfile.reset()
			objarrayfile.write(output,arrayfile)
			ignoremodules = False
			imm.logLines(output)
			imm.log("")
			imm.log("Done, wrote %d bytes to file %s" % (len(arraytable),arrayfile))
			return
			
			
			
			
		#----- Read binary file, print 'nice' header -----#
		def procPrintHeader(args):
			filename = ""
			if "f" in args:
				if type(args["f"]).__name__.lower() != "bool":	
					filename = args["f"]
			if filename == "":
				imm.log("Missing argument -f <source filename>",highlight=1)
				return
			filename = filename.replace("'","").replace('"',"")
			content = ""
			try:		
				file = open(filename,"rb")
				content = file.read()
				file.close()
			except:
				imm.log("Unable to read file %s" % filename,highlight=1)
				return
			imm.log("Read %d bytes from %s" % (len(content),filename))	
			
			MAX_LEN_STRING = 128 		
			
			pos = 0
			output = ""
			outputline = 0
			while pos < len(content):
				if isAscii(ord(content[pos])):
					# start ascii sequence
					string = ""
					thislen = len(string)
					while (pos < len(content) and isAscii(ord(content[pos])) and thislen < MAX_LEN_STRING):
						if content[pos] == "\\":
							string += "\\\\"
						elif content[pos] == '"':
							string += "\\\""
						elif content[pos] == '\n':
							string += "\\n"
							thislen = MAX_LEN_STRING
						elif content[pos] == '\r':
							string += "\\r"
						else:
							string += content[pos]
						pos += 1
						if thislen != MAX_LEN_STRING:
							thislen = len(string)
					if outputline == 0:
						output += "header = \"" + string + "\"" + "\n"
					else:
						output += "header << \"" + string + "\"" + "\n"
					outputline += 1
					
				else:
					string = ""
					while(pos < len(content) and not isAscii(ord(content[pos])) and len(string) < MAX_LEN_STRING):
						# do a forward lookup to see if we have a repetition
						if haveRepetition(content,pos):
							# HANDLE REPETITION
							if string != "":					
								if outputline == 0:
									output += "header = \"" + string + "\"" + "\n"
								else:
									output += "header << \"" + string + "\"" + "\n"
								outputline += 1
							string = ""
							first = content[pos]
							repetitions = 1
							pos += 1
							while(pos < len(content) and content[pos] == first):
								repetitions += 1
								pos += 1								
							if outputline == 0:
								try:
									output += "header = \"\\x" + toHexByte(first) + "\" * " + str(repetitions) + "\n"
								except: 
									output += "header = \"\\x" + toHexByte(ord(first)) + " * " + str(repetitions) + "\n"
							else:
								try:
									output += "header << \"\\x" + toHexByte(first) + "\" * " + str(repetitions) + "\n"
								except: 
									output += "header << \"\\x" + toHexByte(ord(first)) + " * " + str(repetitions) + "\n"
							outputline += 1								
						else:  
							string += "\\x%02x" % ord(content[pos])
							pos += 1
					if string != "":
						if outputline == 0:
							output += "header = \"" + string + "\"" + "\n"
						else:
							output += "header << \"" + string + "\"" + "\n" 
						outputline += 1		

			global ignoremodules
			ignoremodules = True
			headerfilename="header.txt"
			objheaderfile = MnLog(headerfilename)
			headerfile = objheaderfile.reset()
			objheaderfile.write(output,headerfile)
			ignoremodules = False
			imm.logLines(output)
			imm.log("")			
			imm.log("Wrote header to %s" % headerfile)
			return
		
		#----- Update -----#
		
		def procUpdate(args):
			"""
			Function to update mona to the latest version
			
			Arguments : none
			
			Returns : new version of mona (if available)
			"""
			#dev or release ?
			tree = "release"
			if __VERSION__.find("dev") > -1:
				tree = "trunk"
			#immunity version	
			imversion = __IMM__
			#url
			updateurl = "http://redmine.corelan.be/projects/mona/repository/raw/" + tree + "/" + imversion + "/mona.py"
			currentversion,currentrevision = getVersionInfo(inspect.stack()[0][1])
			u = ""
			try:
				u = urllib.urlretrieve(updateurl)
				newversion,newrevision = getVersionInfo(u[0])
				if newversion != "" and newrevision != "":
					imm.log("[+] Version compare :")
					imm.log("    Current Version : %s, Current Revision : %s" % (currentversion,currentrevision))
					imm.log("    Latest Version : %s, Latest Revision : %s" % (newversion,newrevision))
				else:
					imm.log("[-] Unable to check latest version (corrupted file ?), try again later",highlight=1)
					return
			except:
				imm.log("[-] Unable to check latest version (download error), try again later",highlight=1)
				return
			#check versions
			doupdate = False
			if newversion != "" and newrevision != "":
				if currentversion != newversion:
					doupdate = True
				else:
					if int(currentrevision) < int(newrevision):
						doupdate = True
						
			#update if needed
				
			if doupdate:
				imm.log("[+] New version available",highlight=1)
				imm.log("    Updating to %s r%s" % (newversion,newrevision),highlight=1)
				try:
					shutil.copyfile(u[0],inspect.stack()[0][1])
					imm.log("    Done")					
				except:
					imm.log("    ** Unable to update mona.py",highlight=1)
				currentversion,currentrevision = getVersionInfo(inspect.stack()[0][1])
				imm.log("[+] Current version : %s r%s" % (currentversion,currentrevision))
			else:
				imm.log("[+] You are running the latest version")
			
			return
			
		#----- GetPC -----#
		def procgetPC(args):
			r32 = ""
			output = ""
			if "r" in args:
				if type(args["r"]).__name__.lower() != "bool":	
					r32 = args["r"].lower()
						  
			if r32 == "" or not "r" in args:
				imm.log("Missing argument -r <register>",highlight=1)
				return

			opcodes = {}
			opcodes["eax"] = "\\x58"
			opcodes["ecx"] = "\\x59"
			opcodes["edx"] = "\\x5a"
			opcodes["ebx"] = "\\x5b"				
			opcodes["esp"] = "\\x5c"
			opcodes["ebp"] = "\\x5d"
			opcodes["esi"] = "\\x5e"
			opcodes["edi"] = "\\x5f"

			calls = {}
			calls["eax"] = "\\xd0"
			calls["ecx"] = "\\xd1"
			calls["edx"] = "\\xd2"
			calls["ebx"] = "\\xd3"				
			calls["esp"] = "\\xd4"
			calls["ebp"] = "\\xd5"
			calls["esi"] = "\\xd6"
			calls["edi"] = "\\xd7"
			
			output  = "\n" + r32 + "|  jmp short back:\n\"\\xeb\\x03" + opcodes[r32] + "\\xff" + calls[r32] + "\\xe8\\xf8\\xff\\xff\\xff\"\n"
			output += r32 + "|  call + 4:\n\"\\xe8\\xff\\xff\\xff\\xff\\xc3" + opcodes[r32] + "\"\n"
			output += r32 + "|  fstenv:\n\"\\xd9\\xeb\\x9b\\xd9\\x74\\x24\\xf4" + opcodes[r32] + "\"\n"
                        
			global ignoremodules
			ignoremodules = True
			getpcfilename="getpc.txt"
			objgetpcfile = MnLog(getpcfilename)
			getpcfile = objgetpcfile.reset()
			objgetpcfile.write(output,getpcfile)
			ignoremodules = False
			imm.logLines(output)
			imm.log("")			
			imm.log("Wrote to file %s" % getpcfile)
			return		

		#----- Egghunter -----#
		def procEgg(args):
			filename = ""
			egg = "w00t"
			usechecksum = False
			egg_size = 0
			checksumbyte = ""
			extratext = ""
			
			if "f" in args:
				if type(args["f"]).__name__.lower() != "bool":
					filename = args["f"]
			filename = filename.replace("'", "").replace("\"", "")					

			#Set egg
			if "t" in args:
				if type(args["t"]).__name__.lower() != "bool":
					egg = args["t"]

			if len(egg) != 4:
				egg = 'w00t'
			imm.log("[+] Egg set to %s" % egg)
			
			if "c" in args:
				if filename != "":
					usechecksum = True
					imm.log("[+] Hunter will include checksum routine")
				else:
					imm.log("Option -c only works in conjunction with -f <filename>",highlight=1)
					return
			
			#read payload file
			data = ""
			if filename != "":
				try:
					f = open(filename, "rb")
					data = f.read()
					f.close()
					imm.log("[+] Read payload file (%d bytes)" % len(data))
				except:
					imm.log("Unable to read file %s" %filename, highlight=1)
					return

			egghunter = ""
			#Basic version of egghunter
			imm.log("[+] Generating egghunter code")
			egghunter += (
				"\x66\x81\xca\xff\x0f"+	#or dx,0xfff
				"\x42"+					#INC EDX
				"\x52"					#push edx
				"\x6a\x02"				#push 2	(NtAccessCheckAndAuditAlarm syscall)
				"\x58"					#pop eax
				"\xcd\x2e"				#int 0x2e 
				"\x3c\x05"				#cmp al,5
				"\x5a"					#pop edx
				"\x74\xef"				#je "or dx,0xfff"
				"\xb8"+egg+				#mov eax, egg
				"\x8b\xfa"				#mov edi,edx
				"\xaf"					#scasd
				"\x75\xea"				#jne "inc edx"
				"\xaf"					#scasd
				"\x75\xe7"				#jne "inc edx"
			)
			
			if usechecksum:
				imm.log("[+] Generating checksum routine")
				extratext = "+ checksum routine"
				egg_size = ""
				if len(data) < 256:
					cmp_reg = "\x80\xf9"	#cmp cl,value
					egg_size = hex2bin("%x" % len(data))
					offset1 = "\xf7"
					offset2 = "\xd3"
				elif len(data) < 65536:
					cmp_reg = "\x66\x81\xf9"	#cmp cx,value
					egg_size_normal = "%04X" % len(data)
					egg_size = hex2bin(egg_size_normal[2:4]) + hex2bin(egg_size_normal[0:2])
					offset1 = "\xf5"
					offset2 = "\xd1"
				else:
					imm.log("Cannot use checksum code with this payload size (way too big)",highlight=1)
					return
					
				sum = 0
				for byte in data:
					sum += ord(byte)
				sumstr= toHex(sum)
				checksumbyte = sumstr[len(sumstr)-2:len(sumstr)]

				egghunter += (
					"\x51"						#push ecx
					"\x31\xc9"					#xor ecx,ecx
					"\x31\xc0"					#xor eax,eax
					"\x02\x04\x0f"				#add al,byte [edi+ecx]
					"\x41"+						#inc ecx
					cmp_reg + egg_size +    	#cmp cx/cl, value
					"\x75" + offset1 +			#jnz "add al,byte [edi+ecx]
					"\x3a\x04\x39" +			#cmp al,byte [edi+ecx]
					"\x59" +					#pop ecx
					"\x75" + offset2			#jnz "inc edx"
				)		

			
			#jmp to payload
			egghunter += (
				"\xff\xe7"				#jmp edi
			)
			
			#Convert binary to printable hex format
			raw = binascii.b2a_hex(egghunter.strip().replace(" ",""))
			egghunter_hex = ""
			for i in range(0, len(raw)*2, 2):
				if raw[i:i+2] != "":
					egghunter_hex += "\\x%s" %raw[i:i+2]
					
			global ignoremodules
			ignoremodules = True
			hunterfilename="egghunter.txt"
			objegghunterfile = MnLog(hunterfilename)
			egghunterfile = objegghunterfile.reset()						

			imm.log("[+] Egghunter %s : " % extratext)
			imm.log("\"%s\"" % egghunter_hex)
			
			objegghunterfile.write("Egghunter " + extratext + ", tag " + egg + " : ",egghunterfile)
			objegghunterfile.write("\"" + egghunter_hex + "\"",egghunterfile)			

			if filename == "":
				objegghunterfile.write("Put this tag in front of your shellcode : " + egg + egg,egghunterfile)
			else:
				imm.log("[+] Shellcode, with tag : ")			
				block = "\"" + egg + egg + "\"\n"
				cnt = 0
				flip = 1
				thisline = "\""
				while cnt < len(data):
					thisline += "\\x%s" % toHexByte(ord(data[cnt]))				
					if (flip == 32) or (cnt == len(data)-1):
						if cnt == len(data)-1 and checksumbyte != "":
							thisline += "\\x%s" % checksumbyte					
						thisline += "\""
						flip = 0
						block += thisline 

						block += "\n"
						thisline = "\""
					cnt += 1
					flip += 1
				imm.logLines(block)	
				objegghunterfile.write("\nShellcode, with tag :\n",egghunterfile)
				objegghunterfile.write(block,egghunterfile)	
		
			ignoremodules = False
					
			return
		
		#----- Find MSP ------ #
		
		def procFindMSP(args):
			mspresults = {}
			mspresults = goFindMSP()
			return
			
		def procSuggest(args):
			modulecriteria={}
			criteria={}
			modulecriteria,criteria = args2criteria(args,modulecriteria,criteria)
			mspresults = {}
			mspresults = goFindMSP()
			isEIP = False
			isSEH = False
			isEIPUnicode = False
			isSEHUnicode = False
			initialoffsetSEH = 0
			initialoffsetEIP = 0
			shellcodesizeSEH = 0
			shellcodesizeEIP = 0
			nullsallowed = True
			
			targetstr = ""
			exploitstr = ""
			
			#are we attached to an application ?
			if imm.getDebuggedPid() == 0:
				return		
			
			#write to exploit.rb file
			exploitfilename="exploit.rb"
			objexploitfile = MnLog(exploitfilename)
			exploitfile = objexploitfile.reset()			
			
			imm.log(" ")
			imm.log("[+] Preparing payload...")
			imm.log(" ")			
			imm.updateLog()
			#what options do we have ?
			# 0 : pointer
			# 1 : offset
			# 2 : type
			if "registers" in mspresults:
				for reg in mspresults["registers"]:
					if reg.upper() == "EIP":
						isEIP = True
						eipval = mspresults["registers"][reg][0]
						ptrx = MnPointer(eipval)
						initialoffsetEIP = mspresults["registers"][reg][1]
						
			# 0 : pointer
			# 1 : offset
			# 2 : type
			# 3 : size
			if "seh" in mspresults:
				if len(mspresults["seh"]) > 0:
					isSEH = True
					for seh in mspresults["seh"]:
						if mspresults["seh"][seh][2] == "unicode":
							isSEHUnicode = True
						if not isSEHUnicode:
							initialoffsetSEH = mspresults["seh"][seh][1]-4
						else:
							initialoffsetSEH = mspresults["seh"][seh][1]-2
						shellcodesizeSEH = mspresults["seh"][seh][3]

			# start building exploit structure
			
			if isEIP:
				#where can we jump to - get the register that has the largest buffer size
				largestreg = ""
				largestsize = 0
				offsetreg = 0
				regptr = 0
				# register_to
				# 0 : pointer
				# 1 : offset
				# 2 : size
				# 3 : type
				eipcriteria = criteria
				modulecriteria["aslr"] = False
				modulecriteria["rebase"] = False
				modulecriteria["os"] = False
				jmp_pointers = {}
				jmppointer = 0
				instrinfo = ""

				if isEIPUnicode:
					eipcriteria["unicode"] = True
					eipcriteria["nonull"] = False
					
				if "registers_to" in mspresults:
					for reg in mspresults["registers_to"]:
						thissize = mspresults["registers_to"][reg][2]
						thisreg = reg
						thisoffset = mspresults["registers_to"][reg][1]
						thisregptr = mspresults["registers_to"][reg][0]
						if thisoffset < initialoffsetEIP:
							#fix the size, which will end at offset to EIP
							thissize = initialoffsetEIP - thisoffset
						if thissize > largestsize:								
							# can we find a jmp to that reg ?
							global silent
							silent = True
							jmp_pointers = findJMP(modulecriteria,eipcriteria,reg.lower())
							if len( jmp_pointers ) == 0:
								modulecriteria["os"] = True
								jmp_pointers = findJMP(modulecriteria,eipcriteria,reg.lower())
							modulecriteria["os"] = False
							if len( jmp_pointers ) > 0:
								largestsize = thissize 
								largestreg = thisreg
								offsetreg = thisoffset
								regptr = thisregptr
							silent = False
	
				if largestreg == "":
					imm.log("    Payload is referenced by at least one register, but I couldn't seem to find",highlight=1)
					imm.log("    a way to jump to that register",highlight=1)
				else:
					#build exploit
					for ptrtype in jmp_pointers:
						jmppointer = jmp_pointers[ptrtype][0]
						instrinfo = ptrtype
						break
					ptrx = MnPointer(jmppointer)
					modname = ptrx.belongsTo()
					targetstr = "'Targets'\t\t=>\n"
					targetstr += "\t[\n"
					targetstr += "\t\t[ '<fill in the OS/app version here>',\n"
					targetstr += "\t\t\t{\n"
					if not isEIPUnicode:
						targetstr += "\t\t\t\t'Ret'   \t=>\t0x" + toHex(jmppointer) + ",\n"
						targetstr += "\t\t\t\t'Offset'\t=>\t" + str(initialoffsetEIP) + "\n"
					else:
						origptr = toHex(jmppointer)
						#real unicode ?
						unicodeptr = ""
						transforminfo = ""
						if origptr[0] == "0" and origptr[1] == "1" and origptr[4] == "O" and origptr[5] == "0":
							unicodeptr = "\"\\x" + origptr[6] + origptr[7] + "\\x" + origptr[2] + origptr[3] + "\""
						else:
							#transform
							transform = UnicodeTransformInfo(origptr)
							transformparts = transform.split(",")
							transformsubparts = transformparts[0].split(" ")
							origptr = transformsubparts[len(transformsubparts)-1]
							transforminfo = " #unicode transformed to 0x" + toHex(jmppointer)
							unicodeptr = "\"\\x" + origptr[6] + origptr[7] + "\\x" + origptr[2] + origptr[3] + "\""
						targetstr += "\t\t\t\t'Ret'   \t=>\t" + unicodeptr + "," + transforminfo + "\n"
						targetstr += "\t\t\t\t'Offset'\t=>\t" + str(initialoffsetEIP) + "\t#Unicode\n"	
					
					targetstr += "\t\t\t}\n"
					targetstr += "\t\t], # " + instrinfo + " - " + modname + "\n"
					targetstr += "\t],\n"

					exploitstr = "def exploit\n"
					if initialoffsetEIP < offsetreg:
						# eip is before shellcode
						exploitstr += "\tbuffer =  rand_text(target['Offset'])\t\n"
						if not isEIPUnicode:
							exploitstr += "\tbuffer << [target.ret].pack('V')\t\n"
						else:
							exploitstr += "\tbuffer << target['Ret']\t#Unicode friendly jump\n\n"
						if offsetreg > initialoffsetEIP+2:
							if not isEIPUnicode:
								exploitstr += "\tbuffer << rand_text(" + str(offsetreg - initialoffsetEIP - 4) + ")\t#junk\n"
							else:
								exploitstr += "\tbuffer << rand_text(" + str((offsetreg - initialoffsetEIP - 4)/2) + ")\t#unicode junk\n"
						nops = 0
						if largestreg.upper() == "ESP":
							if not isEIPUnicode:
								exploitstr += "\tbuffer << make_nops(30)\n"
								nops = 30
								exploitstr += "\tbuffer << payload.encoded\t#max " + str(largestsize - nops) + " bytes\n"
						if isEIPUnicode:
							exploitstr += "\t# Metasploit requires double encoding for unicode : Use alpha_xxxx encoder in the payload section\n"
							exploitstr += "\t# and then manually encode with unicode inside the exploit section :\n"
							exploitstr += "\tenc = framework.encoders.create('x86/unicode_mixed')\n"
							exploitstr += "\tregister_to_align_to = '" + largestreg.upper() + "'\n"
							if largestreg.upper() == "ESP":
								exploitstr += "\t# Note : since you are using ESP as bufferregister, make sure EBP points to a writeable address !\n"
								exploitstr += "\t# or patch the unicode decoder yourself\n"
							exploitstr += "\tenc.datastore.import_options_from_hash({ 'BufferRegister' => register_to_align_to })\n"
							exploitstr += "\tunicodepayload = enc.encode(payload.encoded, nil, nil, platform)\n\n"
							exploitstr += "\tbuffer << unicodepayload"
								
					else:
						# EIP -> jump to location before EIP
						beforeEIP = initialoffsetEIP - offsetreg
						if beforeEIP > 0:
							exploitstr += "\tbuffer = rand_text(" + str(offsetreg)+")\t#offset to " + largestreg+"\n"
							exploitstr += "\tbuffer << payload.encoded\t#max " + str(initialoffsetEIP - offsetreg) + " bytes\n"
							exploitstr += "\tbuffer << rand_text(target['Offset'] - exploitstr.length)\n"
							exploitstr += "\tbuffer << [target.ret].pack('V')\t\n"
							
					exploitstr += "end\n"					
					imm.log("Metasploit 'Targets' section :")
					imm.log("------------------------------")
					imm.logLines(targetstr.replace("\t","    "))
					imm.log("")
					imm.log("Metasploit 'exploit' function :")
					imm.log("--------------------------------")
					imm.logLines(exploitstr.replace("\t","    "))
					
					objexploitfile.write("Metasploit 'Targets' section :",exploitfile)
					objexploitfile.write("------------------------------",exploitfile)
					objexploitfile.write(targetstr,exploitfile)
					objexploitfile.write("\nMetasploit 'exploit' section :\n",exploitfile)					
					objexploitfile.write("-----------------------------",exploitfile)
					objexploitfile.write(exploitstr,exploitfile)					
							
			if isSEH:
				sehcriteria = criteria
				modulecriteria["safeseh"] = False
				modulecriteria["rebase"] = False
				modulecriteria["aslr"] = False
				modulecriteria["os"] = False
				sehptr = 0
				instrinfo = ""
				if isSEHUnicode:
					sehcriteria["unicode"] = True
					if "nonull" in sehcriteria:
						sehcriteria.pop("nonull")
				modulecriteria["safeseh"] = False
				#get SEH pointers
				global silent
				silent = True
				seh_pointers = findSEH(modulecriteria,sehcriteria)
				jmpback = False
				silent = False
				if not isSEHUnicode:
					#did we find a pointer ?
					if len(seh_pointers) == 0:
						#did we try to avoid nulls ?
						imm.log("[+] No non-null pointers found, trying 'jump back' layout now...")
						if sehcriteria["nonull"] == True:
							sehcriteria.pop("nonull")
							silent = True
							seh_pointers = findSEH(modulecriteria,sehcriteria)
							silent = False
							jmpback = True
					if len(seh_pointers) != 0:
						for ptrtypes in seh_pointers:
							sehptr = seh_pointers[ptrtypes][0]
							instrinfo = ptrtypes
							break
				else:
					if len(seh_pointers) == 0:
						sehptr = 0
					else:
						for ptrtypes in seh_pointers:
							sehptr = seh_pointers[ptrtypes][0]
							instrinfo = ptrtypes
							break
						
				if sehptr != 0:
					ptrx = MnPointer(sehptr)
					modname = ptrx.belongsTo()
					mixin = ""
					if not jmpback:
						mixin += "#Don't forget to include the SEH mixin !\n"
						mixin += "include Msf::Exploit::Seh\n\n"

					targetstr = "'Targets'\t\t=>\n"
					targetstr += "\t[\n"
					targetstr += "\t\t[ '<fill in the OS/app version here>',\n"
					targetstr += "\t\t\t{\n"
					if not isSEHUnicode:
						targetstr += "\t\t\t\t'Ret'   \t=>\t0x" + toHex(sehptr) + ",\n"
						targetstr += "\t\t\t\t'Offset'\t=>\t" + str(initialoffsetSEH) + "\n"							
					else:
						origptr = toHex(sehptr)
						#real unicode ?
						unicodeptr = ""
						transforminfo = ""
						if origptr[0] == "0" and origptr[1] == "1" and origptr[4] == "O" and origptr[5] == "0":
							unicodeptr = "\"\\x" + origptr[6] + origptr[7] + "\\x" + origptr[2] + origptr[3] + "\""
						else:
							#transform
							transform = UnicodeTransformInfo(origptr)
							transformparts = transform.split(",")
							transformsubparts = transformparts[0].split(" ")
							origptr = transformsubparts[len(transformsubparts)-1]
							transforminfo = " #unicode transformed to 0x" + toHex(sehptr)
							unicodeptr = "\"\\x" + origptr[6] + origptr[7] + "\\x" + origptr[2] + origptr[3] + "\""
						targetstr += "\t\t\t\t'Ret'   \t=>\t" + unicodeptr + "," + transforminfo + "\n"
						targetstr += "\t\t\t\t'Offset'\t=>\t" + str(initialoffsetSEH) + "\t#Unicode\n"						
					targetstr += "\t\t\t}\n"
					targetstr += "\t\t], # " + instrinfo + " - " + modname + "\n"
					targetstr += "\t],\n"

					exploitstr = "def exploit\n"
					if not isSEHUnicode:
						if not jmpback:
							exploitstr += "\tbuffer = rand_text(target['Offset'])\t#junk\n"
							exploitstr += "\tbuffer << generate_seh_record(target.ret)\n"
							exploitstr += "\tbuffer << make_nops(30)\n"
							exploitstr += "\tbuffer << payload.encoded\t#" + str(shellcodesizeSEH-30) +" bytes of space\n"
						else:
							exploitstr += "\tjmp_back_val = 65534 - payload.encoded.length \n\n"
							exploitstr += "\tjmp_back_str = 'jmp $-0x' + jmp_back_val.to_s(16)\n\n"
							exploitstr += "\tjmp_back = Metasm::Shellcode.assemble(Metasm::Ia32.new, jmp_back_str).encode_string\n\n"
							exploitstr += "\tbuffer = rand_text(target['Offset'] - payload.encoded.length - jmp_back.length)\t#junk\n"
							exploitstr += "\tbuffer << payload.encoded\n"
							exploitstr += "\tbuffer << jmp_back\t#jump back to payload.encoded\n"
							exploitstr += "\tbuffer << '\\xeb\\xf9\\x41\\x41'\t#nseh, jump back to jmp_back\n"
							exploitstr += "\tbuffer << [target.ret].pack('V')\t#seh\n"
					else:
						exploitstr += "\tnseh = <insert 2 bytes that will acts as nseh walkover>\n"
						exploitstr += "\talign = <insert routine to align a register to begin of payload and jump to it>\n\n"
						exploitstr += "\tpadding = <insert bytes to fill space between alignment code and payload>\n\n"
						exploitstr += "\t# Metasploit requires double encoding for unicode : Use alpha_xxxx encoder in the payload section\n"
						exploitstr += "\t# and then manually encode with unicode inside the exploit section :\n"
						exploitstr += "\tenc = framework.encoders.create('x86/unicode_mixed')\n"
						exploitstr += "\tregister_to_align_to = <fill in the register name you will align to>\n"
						exploitstr += "\tenc.datastore.import_options_from_hash({ 'BufferRegister' => register_to_align_to })\n"
						exploitstr += "\tunicodepayload = enc.encode(payload.encoded, nil, nil, platform)\n\n"
						exploitstr += "\tbuffer = rand_text(target['Offset'])\t#unicode junk\n"
						exploitstr += "\tbuffer << nseh\t#Unicode walkover friendly dword\n"
						exploitstr += "\tbuffer << target['Ret']\t#Unicode friendly p/p/r\n"
						exploitstr += "\tbuffer << align\n"
						exploitstr += "\tbuffer << padding\n"
						exploitstr += "\tbuffer << unicodepayload\n"
						
					exploitstr += "end\n"
					if mixin != "":
						imm.log("Metasploit 'include' section :")
						imm.log("------------------------------")
						imm.logLines(mixin)
						objexploitfile.write("Metasploit 'include' section :",exploitfile)
						objexploitfile.write("-----------------------------",exploitfile)
						objexploitfile.write(mixin,exploitfile)						
					imm.log("Metasploit 'Targets' section :")
					imm.log("------------------------------")
					imm.logLines(targetstr.replace("\t","    "))
					imm.log("")
					imm.log("Metasploit 'exploit' function :")
					imm.log("--------------------------------")
					imm.logLines(exploitstr.replace("\t","    "))
					
					objexploitfile.write("Metasploit 'Targets' section :",exploitfile)
					objexploitfile.write("------------------------------",exploitfile)
					objexploitfile.write(targetstr,exploitfile)
					objexploitfile.write("\nMetasploit 'exploit' section :\n",exploitfile)					
					objexploitfile.write("-----------------------------",exploitfile)
					objexploitfile.write(exploitstr,exploitfile)
			
				else:
					imm.log("    Unable to suggest a buffer layout because I couldn't find any good pointers",highlight=1)
			
			
			return			
			
		# ----- Finally, some main stuff ----- #
		
		# All available commands and their Usage :
		
		sehUsage = """Default module criteria : non safeseh, non aslr, non rebase
This function will retrieve all stackpivot pointers that will bring you back to nseh in a seh overwrite exploit"""
	
		configUsage = """Change config of mona.py
Available options are : -get <parameter>, -set <parameter> <value> or -add <parameter> <value_to_add>
Valid parameters are : workingfolder, excluded_modules"""
	
		jmpUsage = """Default module criteria : non aslr, non rebase 
Mandatory argument :  -r <reg>  where reg is a valid register"""
	
		ropfuncUsage = """Default module criteria : non aslr, non rebase, non os
Output will be written to ropfunc.txt"""
	
		modulesUsage = ""
		
		ropUsage="""Default module criteria : non aslr,non rebase,non os
Optional parameters : 
    -offset <value> : define the maximum offset for RET instructions (integer, default : 40)
    -distance <value> : define the minimum distance for stackpivots (integer, default : 8).
                        If you want to specify a min and max distance, set the value to min,max
    -depth <value> : define the maximum nr of instructions (not ending instruction) in each gadget (integer, default : 6)
    -split : write gadgets to individual files, grouped by the module the gadget belongs to
    -fast : skip the 'non-interesting' gadgets
    -end <instruction(s)> : specify one or more instructions that will be used as chain end. 
                               (Separate instructions with #). Default ending is RETN
    -f \"file1,file2,..filen\" : use mona generated rop files as input instead of searching in memory"""
							   
							   
		stackpivotUsage="""Default module criteria : non aslr,non rebase,non os
Optional parameters : 
    -offset <value> : define the maximum offset for RET instructions (integer, default : 40)
    -distance <value> : define the minimum distance for stackpivots (integer, default : 8)
                        If you want to specify a min and max distance, set the value to min,max
    -depth <value> : define the maximum nr of instructions (not ending instruction) in each gadget (integer, default : 6)"""							   
							   
		filecompareUsage="""Compares 2 or more files created by mona using the same output commands
Make sure to use files that are created with the same version of mona and 
contain the output of the same mona command
Mandatory argument : -f \"file1,file2,...filen\"
Put all filenames between one set of double quotes, and separate files with comma's
Output will be written to filecompare.txt and filecompare_not.txt (not matching pointers)
Optional parameters : 
    -contains \"INSTRUCTION\"  (will only list if instruction is found)
    -nostrict (will also list pointer is instructions don't match in all files)"""

		patcreateUsage="""Create a cyclic pattern of a given size. Output will be written to pattern.txt
Mandatory argument : size (numberic value)"""
		patoffsetUsage="""Find the location of 4 bytes in a cyclic pattern
Mandatory argument : the 4 bytes to look for
Note :  you can also specify a register"""

		findUsage= """Find a sequence of bytes in memory.
Mandatory argument : -s <pattern> : the sequence to search for. If you specified type 'file', then use -s to specify the file.
This file needs to be a file created with mona.py, containing pointers at the begin of each line.
Optional arguments:
    -type <type>    : Type of pattern to search for : bin,asc,ptr,instr,file
    -b <address> : the bottom of the search range
    -t <address> : the top of the search range
    -c : skip consecutive pointers but show length of the pattern instead
    -p2p : show pointers to pointers to the pattern (might take a while !)
    -r <number> : if p2p is used, you can tell the find to also find close pointers by specifying -r with a value.
                  This value indicates the number of bytes to step backwards for each search"""
	
		assembleUsage = """Convert instructions to opcode. Separate multiple instructions with #.
Mandatory argument : -s <instructions> : the sequence of instructions to encode
Option arguments:
    -e <encoder> : specify an encoder to use after conversion. Encoders available: ascii"""
	
		infoUsage = """Show information about a given address in the context of the loaded application
Mandatory argument : -a <address> : the address to query"""

		dumpUsage = """Dump the specified memory range to a file. Either the end address or the size of
buffer needs to be specified.
Mandatory arguments :
    -s <address> : start address
    -f <filename> : the name of the file where to write the bytes
Optional arguments:
    -n <size> : the number of bytes to copy (size of the buffer)
    -e <address> : the end address of the copy"""
	
		compareUsage = """Compares contents of a binary file with locations in memory.
Mandatory argument :
    -f <filename> : full path to binary file
Optional argument :
    -a <address> : the address of the bytes in memory. If you don't specify an address, the script will try to
                   locate the bytes in memory by looking at the first 8 bytes"""
				   
		offsetUsage = """Calculate the number of bytes between two addresses. You can use 
registers instead of addresses. 
Mandatory arguments :
    -a1 <address> : the first address/register
    -a2 <address> : the second address/register"""
	
		bpUsage = """Set a breakpoint when a given address is read from, written to or executed
Mandatory arguments :
    -a <address> : the address where to set the breakpoint
    -t <type> : type of the breakpoint, can be READ, WRITE or SFX"""
	
		nosafesehUsage = """Show modules that are not safeseh protected"""
		nosafesehaslrUsage = """Show modules that are not safeseh protected, not subject to ASLR, and won't get rebased either"""
		noaslrUsage = """Show modules that are not subject to ASLR and won't get rebased"""
		findmspUsage = """Finds begin of a cyclic pattern in memory, looks if one of the registers is overwritten with a cyclic pattern
or points into a cyclic pattern. findmsp will also look if a SEH record is overwritten and finally, 
it will look for pointers to cyclic pattern on the stack."""

		suggestUsage = """Suggests an exploit buffer structure based on pointers to a cyclic pattern"""
		
		bytearrayUsage = """Creates a byte array, can be used to find bad characters
Optional arguments :
    -b <bytes> : bytes to exclude from the array. Example : '\\x00\\x0a\\x0d'
    -r : show array backwards (reversed), starting at \\xff"""
	
		headerUsage = """Convert contents of a binary file to a nice 'header' string
Mandatory argument :
    -f <filename> : source filename"""
	
		updateUsage = """Update mona to the latest version"""
		getpcUsage = """Find getpc routine for specific register
Mandatory argument :
    -r : register (ex: eax)"""

		EggUsage = """Creates an egghunter routine
Optional arguments :
    -t : tag (ex: w00t). Default value is w00t
    -c : enable checksum routine. Only works in conjunction with parameter -f
    -f <filename> : file containing the shellcode
		"""
		
						  
		commands["seh"] 			= MnCommand("seh", "Find pointers to assist with SEH overwrite exploits",sehUsage, procFindSEH)
		commands["p"]				= MnCommand("p", "Backwards compatibility with pvefindaddr, see command 'seh'","see 'seh'", procFindSEHp)
		commands["p1"]				= MnCommand("p1", "Backwards compatibility with pvefindaddr, see command 'seh'","see 'seh'", procFindSEHp1)
		commands["p2"]				= MnCommand("p2", "Backwards compatibility with pvefindaddr, see command 'seh'", "see 'seh'",procFindSEHp2)
		commands["a"]				= MnCommand("a", "Backwards compatibility with pvefindaddr, see command 'seh'", "see 'seh'",procFindSEHa)
		commands["jseh"]			= MnCommand("jseh", "Backwards compatibility with pvefindaddr, see command 'seh'", "see 'seh'",procFindSEHjseh)
		commands["config"] 			= MnCommand("config","Manage configuration file (mona.ini)",configUsage,procConfig)
		commands["j"]				= MnCommand("j","Backwards compatibility with pvefindaddr j, see command 'jmp'","see 'jmp'",procFindJ)
		commands["jmp"]				= MnCommand("jmp","Find pointers that will allow you to jump to a register",jmpUsage,procFindJMP)
		commands["ropfunc"] 		= MnCommand("ropfunc","Find pointers to pointers (IAT) to interesting functions that can be used in your ROP chain",ropfuncUsage,procFindROPFUNC)
		commands["rop"] 			= MnCommand("rop","Finds gadgets that can be used in ROP exploit",ropUsage,procROP)
		commands["stackpivot"]		= MnCommand("stackpivot","Finds stackpivots (move stackpointer to controlled area)",stackpivotUsage,procStackPivots)
		commands["modules"] 		= MnCommand("modules","Show all loaded modules and their properties",modulesUsage,procShowMODULES)
		commands["filecompare"]		= MnCommand("filecompare","Compares 2 or more files created by mona using the same output commands",filecompareUsage,procFileCOMPARE)
		commands["pattern_create"]	= MnCommand("pattern_create","Create a cyclic pattern of a given size",patcreateUsage,procCreatePATTERN)
		commands["pc"]				= MnCommand("pc","Create a cyclic pattern of a given size - alias for pattern_create",patcreateUsage,procCreatePATTERN)
		commands["pattern_offset"]	= MnCommand("pattern_offset","Find location of 4 bytes in a cyclic pattern",patoffsetUsage,procOffsetPATTERN)
		commands["po"]				= MnCommand("po","Find location of 4 bytes in a cyclic pattern - alias for pattern_offset",patoffsetUsage,procOffsetPATTERN)
		commands["find"] 			= MnCommand("find", "Find bytes in memory", findUsage, procFind)
		commands["assemble"] 		= MnCommand("assemble", "Convert instructions to opcode. Separate multiple instructions with #",assembleUsage,procAssemble)
		commands["info"] 			= MnCommand("info", "Show information about a given address in the context of the loaded application",infoUsage,procInfo)
		commands["dump"] 			= MnCommand("dump", "Dump the specified range of memory to a file", dumpUsage,procDump)
		commands["offset"]          = MnCommand("offset", "Calculate the number of bytes between two addresses", offsetUsage, procOffset)		
		commands["compare"]			= MnCommand("compare","Compare contents of a binary file with a copy in memory", compareUsage, procCompare)
		commands["bp"]				= MnCommand("bp","Set a memory breakpoint on read/write or execute of a given address", bpUsage, procBp)
		commands["nosafeseh"]		= MnCommand("nosafeseh", "Show modules that are not safeseh protected", nosafesehUsage, procModInfoS)
		commands["nosafesehaslr"]	= MnCommand("nosafesehaslr", "Show modules that are not safeseh protected, not aslr and not rebased", nosafesehaslrUsage, procModInfoSA)		
		commands["noaslr"]			= MnCommand("noaslr", "Show modules that are not aslr or rebased", noaslrUsage, procModInfoA)
		commands["findmsp"]			= MnCommand("findmsp","Find cyclic pattern in memory", findmspUsage,procFindMSP)
		commands["suggest"]			= MnCommand("suggest","Suggest an exploit buffer structure", suggestUsage,procSuggest)
		commands["bytearray"]		= MnCommand("bytearray","Creates a byte array, can be used to find bad characters",bytearrayUsage,procByteArray)
		commands["header"]			= MnCommand("header","Read a binary file and convert content to a nice 'header' string",headerUsage,procPrintHeader)
		commands["update"]			= MnCommand("update","Update mona to the latest version",updateUsage,procUpdate)
		commands["getpc"]			= MnCommand("getpc","Show getpc routines for specific registers",getpcUsage,procgetPC)	
		commands["egg"]				= MnCommand("egg","Create egghunter code",EggUsage,procEgg)
		# get the options
		opts = {}
		last = ""
		arguments = []
		
		if len(args) >= 2:
			arguments = args[1:]
		
		for word in arguments:
			if (word[0] == '-'):
				word = word.lstrip("-")
				opts[word] = True
				last = word
			else:
				if (last != ""):
					if str(opts[last]) == "True":
						opts[last] = word
					else:
						opts[last] = opts[last] + " " + word
					#last = ""
		# if a command only requires a value and not a switch ?
		# then we'll drop the value into dictionary with key "?"
		if len(args) == 2 and args[1][0] != "-":
			opts["?"] = args[1]
		
		if len(args) < 1:
			commands["help"].parseProc(opts)
			return("")
		
		command = args[0]

		
		# ----- execute the chosen command ----- #
		if command in commands:
			if command.lower().strip() == "help":
				commands[command].parseProc(args)
			else:
				commands[command].parseProc(opts)
		
		else:
			commands["help"].parseProc(None)
			return("** Invalid command **")
		
		# ----- report ----- #
		endtime = datetime.datetime.now()
		delta = endtime - starttime
		imm.log("Action took %s" % str(delta))
		imm.setStatusBar("Done")

				
	except:
		imm.log("*" * 80,highlight=True)
		imm.logLines(traceback.format_exc(),highlight=True)
		imm.log("*" * 80,highlight=True)
		
	return ""