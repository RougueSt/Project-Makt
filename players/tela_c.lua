local janela = {}

local function getWindowPosition(width, height)
    local screenWidth, screenHeight = guiGetScreenSize()
    local x = (screenWidth / 2) - (width / 2)
    local y = (screenHeight / 2) - (height / 2)

    return x, y, width, height
end

local function isUsernameValid(username)
    return type(username) == 'string' and string.len(username) > 1
end

local function isPasswordValid(password)
    return type(password) == 'string' and string.len(password) > 1
end


addEventHandler('onClientResourceStart', getResourceRootElement(getThisResource()), function()
    triggerEvent('login-menu:open', localPlayer)
end)

addEvent('login-menu:open', true)
addEventHandler('login-menu:open', root, function()
    local screenW, screenH = guiGetScreenSize()
    setCameraMatrix(0, 0, 100, 0 ,100, 50)
    fadeCamera(true)

    


    showCursor(true, true)

    guiSetInputMode('no_binds')



    local x, y, width, height = getWindowPosition(600,600)
    janela['window'] = guiCreateWindow((screenW - 803) / 2, (screenH - 698) / 2, 803, 698, "LOGIN", false)
    guiWindowSetMovable(janela['window'],false)
    guiWindowSetSizable(janela['window'],false)

    janela['usernameLabel'] = guiCreateLabel(30, 50, 570, 20, "Usuario: ", false, janela['window'])
    janela['erroUsername'] = guiCreateLabel(18, 250, 570, 20, "", false, janela['window'])
    janela['usernameInput'] = guiCreateEdit(30, 74, 234, 30, "", false, janela['window'])

        
    janela['passwordLabel'] = guiCreateLabel(30, 120, 570, 20, "senha: ", false, janela['window'])
    janela['erroSenha'] = guiCreateLabel(18, 265, 570, 20, "", false, janela['window'])
    janela['passwordInput'] = guiCreateEdit(30, 140, 234, 29, "", false, janela['window'])
    janela['salvarSenha'] = guiCreateCheckBox(30, 175, 150, 15, "Salvar usuário e senha", true, false, janela['window'])
    janela['noticia'] = guiCreateMemo(17, 302, 250, 367, "NOTICIAS E NOVIDADES CARALHA:\n\nSEGUE AS NOVIDADES DE HOJE", false, janela['window'])
    guiEditSetMasked(janela['passwordInput'], true)

    if fileExists(':players/username.xml') then 
        local xml = xmlLoadFile(':players/username.xml')
        if xmlNodeGetAttribute(xml, 'checkBox') == 'true' then
            guiSetText(janela['usernameInput'], xmlNodeGetAttribute(xml, 'username'))
            guiSetText(janela['passwordInput'], xmlNodeGetAttribute(xml, 'password'))
            guiCheckBoxSetSelected(janela['salvarSenha'], true)
        end
    end

    janela['registerButton'] = guiCreateButton(148, 205, 119, 50, "Register", false, janela['window'])
    addEventHandler('onClientGUIClick', janela['registerButton'], function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end

        local username = guiGetText(janela['usernameInput'])
        local password = guiGetText(janela['passwordInput'])
        local inputValid = true

        if not isUsernameValid(username) then 
            guiSetText(janela['erroUsername'], 'Alguma coisa errada com o Usuario')
            guiLabelSetColor(janela['erroUsername'], 255,0,0)
            inputValid = false
        else
            guiSetVisible(janela['erroUsername'],false)
        end

        if not isPasswordValid(password) then  
            guiSetText(janela['erroSenha'], 'Alguma coisa errada com a Senha')
            guiLabelSetColor(janela['erroSenha'], 255,0,0)
            inputValid = false
        else
            guiSetVisible(janela['erroSenha'],false)
        end

        if not inputValid then
            return
        end

        triggerServerEvent('auth:register-attempt', localPlayer, username, password)
    end, false)






    janela['loginButton'] = guiCreateButton(30, 205, 108, 50, "Login", false, janela['window'])
    addEventHandler('onClientGUIClick',janela['loginButton'], function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end

        local username = guiGetText(janela['usernameInput'])
        local password = guiGetText(janela['passwordInput'])
        local inputValid = true

        if not isUsernameValid(username) then 
            guiSetText(janela['erroUsername'], 'Alguma coisa errada com o Usuario')
            guiLabelSetColor(janela['erroUsername'], 255,0,0)
            inputValid = false
        else
            guiSetVisible(janela['erroUsername'],false)
        end

        if not isPasswordValid(password) then  
            guiSetText(janela['erroSenha'], 'Alguma coisa errada com a Senha')
            guiLabelSetColor(janela['erroSenha'], 255,0,0)
            inputValid = false
        else
            guiSetVisible(janela['erroSenha'],false)
        end

        if not inputValid then
            return
        end
        if guiCheckBoxGetSelected(janela['salvarSenha']) then
            if not fileExists(':players/username.xml') then
                local xml = xmlCreateFile(':players/username.xml', 'login')
                xmlNodeSetAttribute(xml, 'username', username)
                xmlNodeSetAttribute(xml, 'password', password)
                xmlNodeSetAttribute(xml, 'checkBox', 'true')
                xmlSaveFile(xml)
            else
                local xml = xmlLoadFile(':players/username.xml', false)
                xmlNodeSetAttribute(xml, 'username', username)
                xmlNodeSetAttribute(xml, 'password', password)
                xmlNodeSetAttribute(xml, 'checkBox', 'true')
                xmlSaveFile(xml)
            end
        else
            if fileExists(':players/username.xml') then 
                local xml = xmlLoadFile(':players/username.xml', false)
                xmlNodeSetAttribute(xml, 'username', '')
                xmlNodeSetAttribute(xml, 'password', '')
                xmlNodeSetAttribute(xml, 'checkBox', 'false')
                xmlSaveFile(xml)
            end

        end
        

        triggerServerEvent('auth:login-attempt', localPlayer, username, password)
    end, false)



    janela['imagem'] = guiCreateStaticImage(298, 30, 495, 658, "pablo.png", false, janela['window'])

end, true)

addEvent('login-menu:close', true)
addEventHandler('login-menu:close',root, function()
    destroyElement(janela['window'])
    showCursor(false)
    guiSetInputMode('allow_binds')
    triggerEvent('time-menu:open',localPlayer)
end)

addEvent('time-menu:open', true)
addEventHandler('time-menu:open',root, function()
    setCameraMatrix(-1926.7548828125, -1761.599609375, 36.827644348145,-1895.5078125, -1725.703125, 21.75)
    fadeCamera(true)
    local x, y, width, height = getWindowPosition(530,470)
    painelTime = guiCreateWindow(x, y, width, height, "Seleção do time", false)
    guiWindowSetMovable(painelTime,false)
    guiWindowSetSizable(painelTime,false)
    showCursor(true, true)
    guiSetInputMode('allow_binds')



    -----botão dos times

    local time1 = guiCreateButton(30,30, 150, 90, 'TIME 1', false, painelTime )
    local time2 = guiCreateButton(30,140, 150, 90, 'TIME 2', false, painelTime )
    local time3 = guiCreateButton(30,250, 150, 90, 'TIME 3', false, painelTime )
    local time4 = guiCreateButton(30,360, 150, 90, 'TIME 4', false, painelTime )
    local time5 = guiCreateButton(190,30, 150, 90, 'TIME 5', false, painelTime )
    local time6 = guiCreateButton(190,140, 150, 90, 'TIME 6', false, painelTime )
    local time7 = guiCreateButton(190,250, 150, 90, 'TIME 7', false, painelTime )
    local time8 = guiCreateButton(190,360, 150, 90, 'TIME 8', false, painelTime )
    local time9 = guiCreateButton(350,90, 150, 90, 'TIME 9', false, painelTime )
    local time10 = guiCreateButton(350,200, 150, 90, 'TIME 10', false, painelTime )
    local time11 = guiCreateButton(350,310, 150, 90, 'TIME 11', false, painelTime )

    addEventHandler('onClientGUIClick', time1, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('entrar:time1', localPlayer, TIME1)
        triggerEvent('time-menu:close',localPlayer)
    end, false)

    addEventHandler('onClientGUIClick', time2, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('entrar:time2', localPlayer, TIME2)
        triggerEvent('time-menu:close', localPlayer)
    end, false)

    addEventHandler('onClientGUIClick', time3, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('entrar:time3', localPlayer, TIME3)
        triggerEvent('time-menu:close', localPlayer)
    end, false)

    addEventHandler('onClientGUIClick', time4, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('entrar:time4', localPlayer, TIME4)
        triggerEvent('time-menu:close', localPlayer)
    end, false)

    addEventHandler('onClientGUIClick', time5, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('entrar:time5', localPlayer, TIME5)
        triggerEvent('time-menu:close', localPlayer)
    end, false)

    addEventHandler('onClientGUIClick', time6, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('entrar:time6', localPlayer, TIME6)
        triggerEvent('time-menu:close', localPlayer)
    end, false)

    addEventHandler('onClientGUIClick', time7, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('entrar:time7', localPlayer, TIME7)
        triggerEvent('time-menu:close', localPlayer)
    end, false)

    addEventHandler('onClientGUIClick', time8, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('entrar:time8', localPlayer, TIME8)
        triggerEvent('time-menu:close', localPlayer)
    end, false)

    addEventHandler('onClientGUIClick', time9, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('entrar:time9', localPlayer, TIME9)
        triggerEvent('time-menu:close', localPlayer)
    end, false)

    addEventHandler('onClientGUIClick', time10, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('entrar:time10', localPlayer, TIME10)
        triggerEvent('time-menu:close', localPlayer)
    end, false)

    addEventHandler('onClientGUIClick', time11, function(button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end
        triggerServerEvent('entrar:time11', localPlayer, TIME11)
        triggerEvent('time-menu:close', localPlayer)
    end, false)



end)

addEvent('time-menu:close')
addEventHandler('time-menu:close',root, function()
    destroyElement(painelTime)
    showCursor(false)
    guiSetInputMode('allow_binds')
end)

addEventHandler( 'onClientRender', root,
    function()
        setTime( 12, 0 )
    end
)

