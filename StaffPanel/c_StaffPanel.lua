local open = false

local function admPanel()
    if open then
        destroyElement(GUIEditor.window[1])
        showCursor(false,true)
        guiGetInputMode('allow_binds')
        open = false
        return
    end
    GUIEditor = {
        tab = {},
        window = {},
        tabpanel = {},
        button = {}
    }
    showCursor(true, true)
    open = true
    local screenW, screenH = guiGetScreenSize()
    GUIEditor.window[1] = guiCreateWindow((screenW - 581) / 2, (screenH - 482) / 2, 581, 482, "", false)
    guiGetInputMode('no_binds')
    guiWindowSetMovable(GUIEditor.window[1], false)
    guiWindowSetSizable(GUIEditor.window[1], false)

    GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 25, 561, 447, false, GUIEditor.window[1])

    GUIEditor.tab[1] = guiCreateTab("Painel de controle", GUIEditor.tabpanel[1])

    GUIEditor.button[1] = guiCreateButton(34, 33, 113, 39, "Remove aero", false, GUIEditor.tab[1])
    GUIEditor.button[2] = guiCreateButton(34, 131, 113, 39, "Remove aero tanks", false, GUIEditor.tab[1])
    GUIEditor.button[3] = guiCreateButton(34, 180, 113, 39, "Respawn vehicles", false, GUIEditor.tab[1])
    GUIEditor.button[4] = guiCreateButton(34, 82, 113, 39, "Remove tanks", false, GUIEditor.tab[1])
    GUIEditor.button[5] = guiCreateButton(414, 33, 113, 39, "Los Santos", false, GUIEditor.tab[1])
    GUIEditor.button[6] = guiCreateButton(414, 82, 113, 39, "San Fierro", false, GUIEditor.tab[1])
    GUIEditor.button[7] = guiCreateButton(414, 131, 113, 39, "Las Venturas", false, GUIEditor.tab[1])
    GUIEditor.button[8] = guiCreateButton(414, 180, 113, 39, "Rural", false, GUIEditor.tab[1])
    GUIEditor.button[9] = guiCreateButton(192, 359, 178, 53, "KICK ALL NON STAFF", false, GUIEditor.tab[1])


    addEventHandler('onClientGUIClick',GUIEditor.button[1], function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('destroiAero', localPlayer)   
    
    end, false)

    addEventHandler('onClientGUIClick',GUIEditor.button[2], function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('destroiAeroTank', localPlayer)   
    end, false)

    addEventHandler('onClientGUIClick',GUIEditor.button[3], function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('spawnVehicles', localPlayer)
    
    end, false)

    addEventHandler('onClientGUIClick',GUIEditor.button[4], function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('destroiTank', localPlayer)
    
    end, false)

    addEventHandler('onClientGUIClick',GUIEditor.button[5], function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('LosSantos:start', localPlayer)
    
    end, false)

    addEventHandler('onClientGUIClick',GUIEditor.button[6], function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('SanFierro:start', localPlayer)
    
    end, false)
    
    addEventHandler('onClientGUIClick',GUIEditor.button[7], function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('LasVenturas:start', localPlayer)
    
    end, false)
    
    addEventHandler('onClientGUIClick',GUIEditor.button[8], function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('MapaTodo:start', localPlayer)
    
    end, false)
    
    addEventHandler('onClientGUIClick',GUIEditor.button[9], function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('kickPlayers', localPlayer)
    
    end, false)

end

local function bindar()
    bindKey('l', 'down', admPanel)
end

addEvent('bindar', true)
addEventHandler('bindar', localPlayer, bindar)

addEventHandler('onClientResourceStart', getResourceRootElement(), function()
    triggerServerEvent('StaffPanel:Download', localPlayer)
end)