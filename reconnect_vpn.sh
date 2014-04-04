on idle
    tell application "System Events"
        tell current location of network preferences
            set myConnection to the service "VPN University"
            if myConnection is not null then
                if current configuration of myConnection is not connected then
                    connect myConnection
                end if
            end if
        end tell
        return 120
    end tell
end idle
