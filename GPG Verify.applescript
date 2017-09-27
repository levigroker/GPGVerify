(*
GPG Verify
A manually activated Script to verify signed files with GPG (see GPG homepage
http://www.gnupg.org/ )
By Levi Brown <mailto:levigroker@gmail.com>
Version 1.0.2 September 27th, 2017

This script works in tandem with the 'gpg' command line binary (which should
already be installed and functional) to provide a simple user interface to the
validation of signed files with a detached signature.

The intention is for this script to be accessed from the Script Menu and acts on
the current selection in the Finder.  If only one file is selected the script
will attempt to locate the matching signed file or detached signature file based
on file name.  I suggest adding this script to the Finder Scripts Folder so it
is available from the Finder as needed.  For more information about the Script
Menu please visit: http://www.apple.com/applescript/scriptmenu/

* This script has been tested on Mac OS X 10.4.7 to 10.12.6 under US English and may
contain i18n issues which are not accounted for.

Please feel free to contact me with improvements and feedback.

Release History:
1.0   September 18th, 2006: Internal initial release.
1.0.1 September 8th,  2011: Release to GitHub.
1.0.2 September 27th, 2017: Minor compatibility fix for GPG 2.2.0.

Copyright (c) 2006-2017 Levi Brown.
This work is licensed under the Creative Commons Attribution 4.0 International
License. To view a copy of this license, visit
https://creativecommons.org/licenses/by/4.0/

1. DISCLAIMER OF WARRANTY.  ALL EXPRESS OR IMPLIED CONDITIONS, REPRESENTATIONS
AND WARRANTIES, INCLUDING ANY IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A
PARTICULAR PURPOSE OR NON-INFRINGEMENT ARE DISCLAIMED, EXCEPT TO THE EXTENT THAT
THESE DISCLAIMERS ARE HELD TO BE LEGALLY INVALID.

2. LIMITATION OF LIABILITY.  TO THE EXTENT NOT PROHIBITED BY LAW, IN NO EVENT
WILL THE AUTHOR OR THE AUTHOR'S LICENSORS BE LIABLE FOR ANY LOST REVENUE, PROFIT
OR DATA, OR FOR SPECIAL, INDIRECT, CONSEQUENTIAL, INCIDENTAL OR PUNITIVE
DAMAGES, HOWEVER CAUSED REGARDLESS OF THE THEORY OF LIABILITY, ARISING OUT OF OR
RELATED TO THE USE OF OR INABILITY TO USE SOFTWARE, EVEN IF THE AUTHOR HAS BEEN
ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.  In no event will the author's
liability to you, whether in contract, tort (including negligence), or
otherwise, exceed the amount paid by you for Software under this Agreement. The
foregoing limitations will apply even if the above stated warranty fails of its
essential purpose. Some states do not allow the exclusion of incidental or
consequential damages, so some of the terms above may not be applicable to you.
*)

property _sig_file_extensions : {".asc.txt", ".txt", ".asc", ".sig"}

on run
	tell application "Finder"
		set _sel to selection
		set cnt to number of items of _sel
		
		if cnt is 0 then
			beep
			display dialog "Please select the target file and/or the corresponding signature file." buttons {"Cancel"} default button "Cancel" with icon 0
		else if cnt > 2 then
			beep
			display dialog "Please select only the target file and/or the corresponding signature file." buttons {"Cancel"} default button "Cancel" with icon 0
		else
			
			if cnt is 1 then
				set anItem to item 1 of _sel
				set _sigFile to my findSigFile(anItem)
				if anItem is _sigFile then
					set _targetFile to my findTargetFile(anItem)
				else
					set _targetFile to anItem
				end if
			else
				set anItem to item 1 of _sel
				set _sigFile to my findSigFile(anItem)
				if anItem is _sigFile then
					set _targetFile to item 2 of _sel
				else
					set _targetFile to anItem
				end if
			end if
			
			if _targetFile is "" or _sigFile is "" then
				beep
				display dialog "Could not determine signature file from target file." buttons {"Cancel"} default button "Cancel" with icon 0
			else
				set _targetFile to POSIX path of (_targetFile as alias)
				set _sigFile to POSIX path of (_sigFile as alias)
				try
					set res to do shell script "/usr/local/bin/gpg --no-greeting --quiet --keyserver wwwkeys.pgp.net --keyserver-options auto-key-retrieve,include-subkeys,honor-http-proxy --verify-options show-photos --verify \"" & _sigFile & "\" \"" & _targetFile & "\" 2>&1"
					my parseGPGRes(res)
				on error errText number errNum
					display alert "Error: GPG Signature Validation Failed" message errText as critical buttons {"OK"} default button "OK"
				end try
			end if
		end if
	end tell
end run

on parseGPGRes(res)
	set _message to ""
	set _lines to {}
	set _oldATID to AppleScript's text item delimiters
	set AppleScript's text item delimiters to ASCII character 13
	try
		set _lines to text items of res
	on error _err
		tell application "Finder" to display dialog _err
	end try
	set AppleScript's text item delimiters to _oldATID
	
	if _lines is {} then
		beep
		tell application "Finder" to display dialog "Could not determine signature status from gpg results." buttons {"Cancel"} default button "Cancel" with icon 0
	else
		set num to number of items in _lines
		repeat with indx from 1 to num
			set _line to item indx of _lines
			-- Look for 'Good Signature' lines
			if _line starts with "gpg: Good signature from" then
				set _line to my removePrefix(_line, "gpg: ")
				set _message to _message & _line & return
				-- get all 'aka' lines following a 'Good signature' line
				repeat with jndx from (indx + 1) to num
					set _next to item jndx of _lines
					if _next starts with "gpg:                 aka" then
						set indx to jndx
						set _next to my removePrefix(_next, "gpg:                 ")
						set _message to _message & tab & _next & return
					else
						exit repeat
					end if
				end repeat
			else if _line starts with "gpg: WARNING: " then
				set _line to my removePrefix(_line, "gpg: ")
				set _message to _message & _line & return
				-- get all 'aka' lines following a 'Good signature' line
				repeat with jndx from (indx + 1) to num
					set _next to item jndx of _lines
					if _next starts with "gpg:          " then
						set indx to jndx
						set _next to my removePrefix(_next, "gpg:          ")
						set _message to _message & _next & return
					else
						exit repeat
					end if
				end repeat
				set _message to _message & return
			end if
		end repeat
	end if
	tell application "Finder" to set retButton to button returned of (display alert "GPG Signature Validation" message _message as informational buttons {"OK"} default button "OK")
end parseGPGRes

on findSigFile(anAlias)
	set _name to name of anAlias
	repeat with indx from 1 to number of items in _sig_file_extensions
		set _ext to item indx of _sig_file_extensions
		if _name ends with _ext then
			return anAlias
		end if
	end repeat
	set _pwd to my getParentPath(anAlias)
	repeat with indx from 1 to number of items in _sig_file_extensions
		set _ext to item indx of _sig_file_extensions
		set _tmpPath to _pwd & _name & _ext
		if my isThere(_tmpPath) then
			return (_tmpPath as alias)
		end if
	end repeat
	return ""
end findSigFile

on findTargetFile(anAlias)
	set _name to name of anAlias
	set sigExt to ""
	repeat with indx from 1 to number of items in _sig_file_extensions
		set _ext to item indx of _sig_file_extensions
		if _name ends with _ext then
			set sigExt to _ext
			exit repeat
		end if
	end repeat
	
	if (sigExt is "") then
		return anAlais
	else
		set _tmpPath to my removeExtension(anAlias as string, sigExt)
		if my isThere(_tmpPath) then
			return (_tmpPath as alias)
		end if
	end if
	return ""
end findTargetFile

on removePrefix(_str, _pre)
	set strChars to characters of _str
	set preLen to number of characters of _pre
	return (items (preLen + 1) thru end of strChars) as string
end removePrefix

on removeExtension(_str, _ext)
	set strChars to characters of _str
	set extLen to number of characters of _ext
	return (items 1 thru ((number of strChars) - extLen) of strChars) as string
end removeExtension

on getParentPath(anAlias)
	tell application "Finder"
		set _cont to container of anAlias
		return _cont as string
	end tell
end getParentPath

on isThere(strFilePath)
	try
		strFilePath as alias
	on error errText number errNum
		if errNum is -43 then
			return false
		else
			error number errNum
		end if
	end try
	return true
end isThere
