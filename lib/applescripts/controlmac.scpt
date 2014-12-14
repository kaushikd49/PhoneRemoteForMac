on run argv
    if argv is not equal to [] then
        set appname to  item 1 of argv 
        set action to  item 2 of argv 

        if appname is not equal to "" and appname is not equal to "DONT_CARE" then
            if not is_running(appname) then 
                log "Please open the application " & appname & " on your machine first"
                return 
            end if

            tell application appname
                activate
            end tell
            delay 1.0
        end if
        
        if action is equal to "up" then
            return simpleaction(126)
        else if action is equal to "down" then
            return simpleaction(125)
        else if action is equal to "left" then
            return simpleaction(123)
        else if action is equal to "right" then
            return simpleaction(124)
        else if action is equal to "pgup" then
            return shiftaction(49)
        else if action is equal to "pgdown" then
            return simpleaction(49)
        else if action is equal to "zoomout" then
            return cmdaction(27)
        else if action is equal to "zoomin" then
            return cmdaction(24)
        else if action is equal to "volplus" then
            return volumeHandler_(-6.25)
        else if action is equal to "volminus" then
            return volumeHandler_(6.25)
        end if
            
    end if
end run

on simpleaction(codenumber)
    tell application "System Events"
        key code codenumber
    end tell
end simpleaction

on cmdaction(codenumber)
    tell application "System Events"
        key code codenumber using {command down}
    end tell
end cmdaction


on shiftaction(codenumber)
    tell application "System Events"
        key code codenumber using {shift down}
    end tell
end shiftaction


on volumeHandler_(changeval)
    set theOutput to output volume of (get volume settings)
    set volume output volume (theOutput - changeval)
    do shell script "afplay /System/Library/Sounds/Pop.aiff"
end volumeHandler_


on is_running(appName)
    tell application "System Events" to (name of processes) contains appName
end is_running


