
-- funções para salvar os dados
local tabelaServer = {
    'kills',
    'deaths',
    'points',
    'cash'
}

addEventHandler('onPlayerLogin', root, function(old, logged)
    local info = getAllAccountData(logged)

    for key, value in pairs(info) do 

        for i, j in pairs(tabelaServer) do
            if key == j then
                setElementData(source, key, value)
            end
        end

    end


end)

addEventHandler('onPlayerQuit', root, function(quitType, reason, responsavel)



end)

addEventHandler('onPlayerLogout', root, function(Logada, new)

    triggerClientEvent(source, 'login-menu:open', source)

end)

addEventHandler('onResourceStop', getResourceRootElement(), function()

    local players = getElementsByType('player')
    for i, j in pairs(players) do     
        setPlayerTeam(j, nil)
        logOut(j)
    end


    

end)

-- funções para adicionar os dados, e fazerem eles funcionar de verdade

addEventHandler('onPlayerWasted', root, function(_, killer)
    local conta = getPlayerAccount(source)
    if not killer then
        if getElementData(source, 'start') then
            setElementData(source, 'deaths', getElementData(source,'deaths') + 1)
        end
        return
    end
    if getElementType(killer) == 'vehicle' then
        setElementData(source, 'deaths', getElementData(source,'deaths') + 1)
        return
    end
    if getElementType(killer) == 'object' then
        setElementData(source, 'deaths', getElementData(source,'deaths') + 1)
        return
    end
    if source == killer then 
        setElementData(source, 'deaths', getElementData(source,'deaths') + 1)
        return
    end

    setElementData(source, 'deaths', getElementData(source,'deaths') + 1)
    setElementData(killer, 'kills', getElementData(source,'kills') + 1)
    setElementData(killer, 'points', getElementData(source,'points') + 1)
end)


local function pegarDados(source, comando, player)
    
    if player ~= nil and not isElement(getPlayerFromName(player)) then 
        outputChatBox('Check if the player name you type is online', source, 230, 30, 30)
        return 
    end

    local conta = getPlayerAccount(source)
    local info = fromJSON(getAccountData(conta, 'JSON'))

    if jogador == nil then
        outputChatBox('---------------'.. getPlayerName(source)..'---------------', source,30,230,30)
        outputChatBox(info['points'] .. ' points', source)
        outputChatBox(info['kills'] .. ' kills', source)
        outputChatBox(info['deaths'] .. ' death', source)
        outputChatBox(info['cash'] .. ' cash', source)
        outputChatBox('---------------------------------------------', source,30,230,30)        
        return
    end
end

addCommandHandler('stats', pegarDados, false, false)



addCommandHandler('setkill', function(source, comando, jogador, arg1)
    if jogador == nil or not isElement(getPlayerFromName(jogador)) then 
        return outputChatBox('Wrong nickname or not online', source, 230,30,30)
    end
    local player = getPlayerFromName(jogador)
    local conta = getPlayerAccount(player)
    local info = fromJSON(getAccountData(conta, 'JSON'))
    info['kills'] = arg1
    setAccountData(conta, 'JSON', toJSON(info))
    outputChatBox('Kills has been changed', source, 30,230,30)

end)
addCommandHandler('setpoints', function(source, comando, jogador, arg1)
    
    if jogador == nil or not isElement(getPlayerFromName(jogador)) then 
        return outputChatBox('Wrong nickname or not online', source, 230,30,30)
    end
    local player = getPlayerFromName(jogador)
    local conta = getPlayerAccount(player)
    local info = fromJSON(getAccountData(conta, 'JSON'))
    info['points'] = arg1
    setAccountData(conta, 'JSON', toJSON(info))
    outputChatBox('points has been changed', source, 30,230,30)

end)

addCommandHandler('setcash', function(source, comando, jogador, arg1)
    
    if jogador == nil or not isElement(getPlayerFromName(jogador)) then 
        return outputChatBox('Wrong nickname or not online', source, 230,30,30)
    end
    local player = getPlayerFromName(jogador)
    local conta = getPlayerAccount(player)
    local info = fromJSON(getAccountData(conta, 'JSON'))
    info['cash'] = arg1
    setAccountData(conta, 'JSON', toJSON(info))
    outputChatBox('Player cash has been changed', source, 30,230,30)

end)

addCommandHandler('setdeath', function(source, comando, jogador, arg1)

    if jogador == nil or not isElement(getPlayerFromName(jogador)) then 
        return outputChatBox('Wrong nickname or not online', source, 230,30,30)
    end
    local player = getPlayerFromName(jogador)
    local conta = getPlayerAccount(player)
    local info = fromJSON(getAccountData(conta, 'JSON'))
    info['deaths'] = arg1
    setAccountData(conta, 'JSON', toJSON(info))
    outputChatBox('Player death has been changed', source, 30,230,30)

end)

