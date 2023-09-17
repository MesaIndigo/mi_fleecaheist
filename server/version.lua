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
        if text == currentVersion then
            versionPrint('success', '----------------------------------------')
            versionPrint('success', ('version: %s'):format(currentVersion))
            versionPrint('success', '----------------------------------------')
        else
            versionPrint('success', '----------------------------------------')
            versionPrint('error', ('please update to: %s'):format(text))
            versionPrint('success', '----------------------------------------')
        end
    end)
end

CheckMenuVersion()