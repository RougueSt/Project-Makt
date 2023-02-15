local function getWindowPosition(width, height)
    local screenWidth, screenHeight = guiGetScreenSize()
    local x = (screenWidth / 2) - (width / 2)
    local y = (screenHeight / 2) - (height / 2)

    return x, y, width, height
end

skin = {30,32,33,34,35,36,37,38,39,40,41,43,44,45,46,47,48,49,50}

local criouSanchez = 0
local criouVortex = 0
local criouKart = 0
local usouColete = 0
local usouVida = 0
local usouPatriot = 0


addEvent('vip:abrir',true)
addEventHandler('vip:abrir',localPlayer,function()
    showCursor(true, false)

    guiSetInputMode('no_binds')



    local x, y, width, height = getWindowPosition(600,600)
    viptela = guiCreateWindow(x, y, width, height, "PAINEL VIP", false)
    guiWindowSetMovable(viptela,false)
    guiWindowSetSizable(viptela,false)
    local imagem = guiCreateStaticImage(width-665, height-115, 210, 300, "vip.png", false, viptela)
    local imagem2 = guiCreateStaticImage(width-195, height-115, 210, 300, "vip.png", false, viptela)
    guiSetAlpha(imagem,1)
    guiSetAlpha(imagem2,1)
    
    local botaoFechar = guiCreateButton(width-365, height-115, 130, 50, 'FECHAR', false, viptela)
    local botaoSanchez = guiCreateButton(width-550, height-461, 130, 50, 'SPAWN SANCHEZ', false, viptela)
    local botaoVortex = guiCreateButton(width-360, height-461, 130, 50, 'SPAWN VORTEX', false, viptela)
    local botaoKart = guiCreateButton(width-170, height-461, 130, 50, 'SPAWN KART', false, viptela)
    local botaoColete = guiCreateButton(width-265, height-379, 130, 50, 'COLETE', false, viptela)
    local botaovida = guiCreateButton(width-455, height-379, 130, 50, 'VIDA', false, viptela)

    local escolheSkin = guiCreateComboBox(width-369, height-290, 130, 170, 'Escolha skin vip',false, viptela)
    for i, v in ipairs (skin) do
        guiComboBoxAddItem(escolheSkin, 'skin '.. i)
    end
    
    local botaoEscolheSkin = guiCreateButton(width-369, height-190, 130, 50, 'TROCAR SKIN', false, viptela)

    addEventHandler('onClientGUIClick',botaoEscolheSkin, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        skinSent = guiComboBoxGetSelected(escolheSkin)
        triggerServerEvent('vipSkin',localPlayer,skinSent)

    end)


    addEventHandler('onClientGUIClick',botaoFechar, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerEvent('vip:fechar',localPlayer)
    end)

    addEventHandler('onClientGUIClick',botaoSanchez, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        criouSanchez = criouSanchez + 1    ------ TESTAR PRA VE SE NAO CONTA PRA TODO MUNDO
        if criouSanchez >= 3 then  ---------------------------------------------------------
            outputChatBox('JA CRIOU DMS CARALHO',255,40,40)
            return
        end
        triggerServerEvent('vipSanchez',localPlayer)
    end)

    addEventHandler('onClientGUIClick',botaoVortex, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        criouVortex = criouVortex + 1    ------ TESTAR PRA VE SE NAO CONTA PRA TODO MUNDO
        if criouVortex >= 3 then  ---------------------------------------------------------
            outputChatBox('JA CRIOU DMS CARALHO',255,40,40)
            return
        end
        triggerServerEvent('vipVortex',localPlayer)
    end)

    addEventHandler('onClientGUIClick',botaoKart, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        criouKart = criouKart + 1    ------ TESTAR PRA VE SE NAO CONTA PRA TODO MUNDO
        if criouKart >= 3 then  ---------------------------------------------------------
            outputChatBox('JA CRIOU DMS CARALHO',255,40,40)
            return
        end
        triggerServerEvent('vipKart',localPlayer)
    end)

    addEventHandler('onClientGUIClick',botaoColete, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        local colete = getPedArmor(localPlayer)
        if colete == 100 then 
            outputChatBox('Você ja esta com colete cheio',40,40,255)
            return 
        end
        usouColete = usouColete + 1    ------ TESTAR PRA VE SE NAO CONTA PRA TODO MUNDO
        if usouColete >= 3 then  ---------------------------------------------------------
            outputChatBox('Limite de colete',255,40,40)
            return
        end
        triggerServerEvent('vipColete',localPlayer)
    end)

    addEventHandler('onClientGUIClick',botaovida, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        local vida = getElementHealth(localPlayer)
        if vida > 199 then 
            outputChatBox('Você ja esta com com a vida cheia',40,40,255)
            return 
        end
        usouVida = usouVida + 1    ------ TESTAR PRA VE SE NAO CONTA PRA TODO MUNDO
        if usouVida >= 3 then  ---------------------------------------------------------
            outputChatBox('Limite de vida',255,40,40)
            return
        end
        triggerServerEvent('vipVida',localPlayer)
    end)


end)

addEvent('vip:fechar',true)
addEventHandler('vip:fechar',localPlayer, function()
    destroyElement(viptela)
    showCursor(false, false)
    guiSetInputMode("allow_binds")
end)

local function patriotal()
    usouPatriot = usouPatriot + 1
    if usouPatriot <= 2 then 
        triggerServerEvent('patriotal',localPlayer)
        return 
    end
    outputChatBox('Não é possivel spawn mais Patriot',255,40,40)
end

addCommandHandler('patriotal',patriotal,false,false)

