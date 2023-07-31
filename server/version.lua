----------------------------------------------------------------------------------------------------
-- check version of script / don't touch this thing / i mean it, keep scrolling you goober
----------------------------------------------------------------------------------------------------
local function versionPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'
    print(('^3[^6Mesa Indigo^3]%s %s^7'):format(color, log))
end

local function CheckMenuVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/MesaIndigo/mi_fleecaheist/master/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
        if not text then 
            versionPrint('error', 'ERROR: Unable to check version. Your ports or connections may be blocking access.')
            return
        end
        versionPrint('success', '----------------------------------------')
        if text == currentVersion then
            versionPrint('success', ('script version up to date: %s'):format(currentVersion))
            versionPrint('success', '----------------------------------------')
        else
            versionPrint('error', ('script version out of date: %s'):format(text))
            versionPrint('success', 'please update to the latest version')
            versionPrint('success', '----------------------------------------')
        end
    end)
end

CheckMenuVersion()