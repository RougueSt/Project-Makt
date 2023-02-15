
function criarTimes() --póssivelmente ficará assim
    
end

addEventHandler("onResourceStart", getResourceRootElement(), function()
    TIME1 = createTeam("TIME 1", 11,244,244)
    setTeamFriendlyFire(TIME1,false)
    TIME2 = createTeam("TIME 2", 69, 0, 251)
    setTeamFriendlyFire(TIME2,false)
    TIME3 = createTeam("TIME 3", 45, 226, 24)
    setTeamFriendlyFire(TIME3,false)
    TIME4 = createTeam("TIME 4", 164, 0, 0)
    setTeamFriendlyFire(TIME4,false)
    TIME5 = createTeam("TIME 5", 255,62,207)
    setTeamFriendlyFire(TIME5,false)
    TIME6 = createTeam("TIME 6", 250,227,67)
    setTeamFriendlyFire(TIME6,false)
    TIME7 = createTeam("TIME 7", 206,98,0)
    setTeamFriendlyFire(TIME7,false)
    TIME8 = createTeam("TIME 8", 62,183,68)
    setTeamFriendlyFire(TIME8,false)
    TIME9 = createTeam("TIME 9", 115,115,115)
    setTeamFriendlyFire(TIME9,false)
    TIME10 = createTeam("TIME 10", 212, 212, 212)
    setTeamFriendlyFire(TIME10,false)
    TIME11 = createTeam("TIME 11", 31, 245, 101)
    setTeamFriendlyFire(TIME11,false)
    STAFF = createTeam("STAFF", 40, 40, 40)
    setTeamFriendlyFire(STAFF,false)
end)


local function trocarTime(thePlayer, comando)
    if getElementHealth(thePlayer) == 0 or COMECOU then 
        return outputDebugString(getPlayerName(thePlayer).. ' tentou trocar de time: ')
    end

    if getElementHealth(thePlayer) > 0  and not COMECOU then 
        killPed(thePlayer)
        setElementPosition(thePlayer, 0, 0, 0)
        if not getTeamName(getPlayerTeam(thePlayer)) and not COMECOU then 
            triggerClientEvent(thePlayer,'time-menu:open',thePlayer)
            return
        end
        outputDebugString(getPlayerName(thePlayer).. ' :SAIU: '.. getTeamName(getPlayerTeam(thePlayer)) )
        triggerClientEvent(thePlayer,'time-menu:open',thePlayer)
    end
end

local function entrarStaff(player, comando)

    if isObjectInACLGroup('user.' .. getAccountName(getPlayerAccount(player)), aclGetGroup('Admin')) then 
        setPlayerTeam(player, STAFF)
        setElementModel(player,264)
        outputChatBox('#2fc718Bem-vindo #e6df1e'.. getPlayerName(player), player, 0, 0, 0, true)
        outputChatBox('#bf630dMODO STAFF ATIVO | VOCÊ NÃO MORRERA PRA SAFE', player, 0, 0, 0, true)
    end

end

addCommandHandler('staff',entrarStaff,false,true)

addCommandHandler('kill',trocarTime,false,false)


addEvent('entrar:time1',true)
addEventHandler('entrar:time1', root, function(team)
    spawnPlayer(source, 323.9580078125, -1799.5830078125, 4.6758165359497, 0, 14, 0, 0, TIME1)
    setCameraTarget(source)
    fadeCamera(source,true)
    giveWeapon(source, 31, 6200)
    giveWeapon(source,46,1)
    setPedStat(source, 78, 999)
    setPedStat(source, 24, 999)
    setElementHealth(source, 999)
    setPedArmor(source,100)
    outputDebugString(getPlayerName(source)..' :ENTROU: TIME 1')
    
    return
end)

addEvent('entrar:time2',true)
addEventHandler('entrar:time2', root, function(team)
    spawnPlayer(source, -1895.5078125, -1725.703125, 21.75, 0, 15, 0, 0, TIME2)
    local team = getPlayerTeam(source)-- retorna o TEAM pelo nome do player
    createBlipAttachedTo(source, 0, 2, 255, 100, 100, 255,0, 65535, team)
    setCameraTarget(source)
    fadeCamera(source,true)
    giveWeapon(source, 31, 6200)
    giveWeapon(source,46,1)
    setPedStat(source, 78, 999)
    setPedStat(source, 24, 999)
    setElementHealth(source, 999)
    setPedArmor(source,100)
    outputDebugString(getPlayerName(source)..' :ENTROU: TIME 2')
    
    return
end)

addEvent('entrar:time3',true)
addEventHandler('entrar:time3', root, function(team)
    spawnPlayer(source, -2514.4033203125, -611.55078125, 132.5625, 0, 16, 0, 0, TIME3)
    local team = getPlayerTeam(source)-- retorna o TEAM pelo nome do player
    createBlipAttachedTo(source, 0, 2, 255, 100, 100, 255,0, 65535, team)
    setCameraTarget(source)
    fadeCamera(source,true)
    giveWeapon(source, 31, 6200)
    giveWeapon(source,46,1)
    setPedStat(source, 78, 999)
    setPedStat(source, 24, 999)
    setElementHealth(source, 999)
    setPedArmor(source,100)
    outputDebugString(getPlayerName(source)..' :ENTROU: TIME 3')
    
    return
end)

addEvent('entrar:time4',true)
addEventHandler('entrar:time4', root, function(team)
    spawnPlayer(source, -2261.251953125, 2316.5126953125, 4.8125, 0, 17, 0, 0, TIME4)
    local team = getPlayerTeam(source)-- retorna o TEAM pelo nome do player
    createBlipAttachedTo(source, 0, 2, 255, 100, 100, 255,0, 65535, team)
    setCameraTarget(source)
    fadeCamera(source,true)
    giveWeapon(source, 31, 6200)
    giveWeapon(source,46,1)
    setPedStat(source, 78, 999)
    setPedStat(source, 24, 999)
    setElementHealth(source, 999)
    setPedArmor(source,100)
    outputDebugString(getPlayerName(source)..' :ENTROU: TIME 4')
    
    return
end)

addEvent('entrar:time5',true)
addEventHandler('entrar:time5', root, function(team)
    spawnPlayer(source, 311.28125, 1852.7294921875, 17.640625, 0, 18, 0, 0, TIME5)
    local team = getPlayerTeam(source)-- retorna o TEAM pelo nome do player
    createBlipAttachedTo(source, 0, 2, 255, 100, 100, 255,0, 65535, team)
    setCameraTarget(source)
    fadeCamera(source,true)
    giveWeapon(source, 31, 6200)
    giveWeapon(source,46,1)
    setPedStat(source, 78, 999)
    setPedStat(source, 24, 999)
    setElementHealth(source, 999)
    setPedArmor(source,100)
    outputDebugString(getPlayerName(source)..' :ENTROU: TIME 5')
    
    return
end)

addEvent('entrar:time6',true)
addEventHandler('entrar:time6', root, function(team)
    spawnPlayer(source, 2794.8486328125, 2711.1572265625, 10.8203125, 0, 19, 0, 0, TIME6)
    local team = getPlayerTeam(source)-- retorna o TEAM pelo nome do player
    createBlipAttachedTo(source, 0, 2, 255, 100, 100, 255,0, 65535, team)
    setCameraTarget(source)
    fadeCamera(source,true)
    giveWeapon(source, 31, 6200)
    giveWeapon(source,46,1)
    setPedStat(source, 78, 999)
    setPedStat(source, 24, 999)
    setElementHealth(source, 999)
    setPedArmor(source,100)
    outputDebugString(getPlayerName(source)..' :ENTROU: TIME 6')
    
    return
end)

addEvent('entrar:time7',true)
addEventHandler('entrar:time7', root, function(team)
    spawnPlayer(source, 2855.65625, 1768.4462890625, 10.824938774109, 0, 20, 0, 0, TIME7)
    local team = getPlayerTeam(source)-- retorna o TEAM pelo nome do player
    createBlipAttachedTo(source, 0, 2, 255, 100, 100, 255,0, 65535, team)
    setCameraTarget(source)
    fadeCamera(source,true)
    giveWeapon(source, 31, 6200)
    giveWeapon(source,46,1)
    setPedStat(source, 78, 999)
    setPedStat(source, 24, 999)
    setElementHealth(source, 999)
    setPedArmor(source,100)
    outputDebugString(getPlayerName(source)..' :ENTROU: TIME 7')
    
    return
end)

addEvent('entrar:time8',true)
addEventHandler('entrar:time8', root, function(team)
    spawnPlayer(source, 2411.4345703125, 154.4599609375, 26.145715713501, 0, 21, 0, 0, TIME8)
    local team = getPlayerTeam(source)-- retorna o TEAM pelo nome do player
    createBlipAttachedTo(source, 0, 2, 255, 100, 100, 255,0, 65535, team)
    setCameraTarget(source)
    fadeCamera(source,true)
    giveWeapon(source, 31, 6200)
    giveWeapon(source,46,1)
    setPedStat(source, 78, 999)
    setPedStat(source, 24, 999)
    setElementHealth(source, 999)
    setPedArmor(source,100)
    outputDebugString(getPlayerName(source)..' :ENTROU: TIME 8')
    
    return
end)

addEvent('entrar:time9',true)
addEventHandler('entrar:time9', root, function(team)
    spawnPlayer(source, -241.658203125, -102.9912109375, 3.1171875, 0, 22, 0, 0, TIME9)
    local team = getPlayerTeam(source)-- retorna o TEAM pelo nome do player
    createBlipAttachedTo(source, 0, 2, 255, 100, 100, 255,0, 65535, team)
    setCameraTarget(source)
    fadeCamera(source,true)
    giveWeapon(source, 31, 6200)
    giveWeapon(source,46,1)
    setPedStat(source, 78, 999)
    setPedStat(source, 24, 999)
    setElementHealth(source, 999)
    setPedArmor(source,100)
    outputDebugString(getPlayerName(source)..' :ENTROU: TIME 9')
    
    return
end)

addEvent('entrar:time10',true)
addEventHandler('entrar:time10', root, function(team)
    spawnPlayer(source, 2761.79296875, -2447.71875, 13.534455299377 , 0, 23, 0, 0, TIME10)
    local team = getPlayerTeam(source)-- retorna o TEAM pelo nome do player
    createBlipAttachedTo(source, 0, 2, 255, 100, 100, 255,0, 65535, team)
    setCameraTarget(source)
    fadeCamera(source,true)
    giveWeapon(source, 31, 6200)
    giveWeapon(source,46,1)
    setPedStat(source, 78, 999)
    setPedStat(source, 24, 999)
    setElementHealth(source, 999)
    setPedArmor(source,100)
    outputDebugString(getPlayerName(source)..' :ENTROU: TIME 10')
    
    return
end)

addEvent('entrar:time11',true)
addEventHandler('entrar:time11', root, function(team)
    spawnPlayer(source, -2903.8310546875, 456.1806640625, 4.9140625, 0, 24, 0, 0, TIME11)
    local team = getPlayerTeam(source)-- retorna o TEAM pelo nome do player
    createBlipAttachedTo(source, 0, 2, 255, 100, 100, 255,0, 65535, team)
    setCameraTarget(source)
    fadeCamera(source,true)
    giveWeapon(source, 31, 6200)
    giveWeapon(source,46,1)
    setPedStat(source, 78, 999)
    setPedStat(source, 24, 999)
    setElementHealth(source, 999)
    setPedArmor(source,100)
    outputDebugString(getPlayerName(source)..' :ENTROU: TIME 11')
    
    return
end)

col = {}
function base1() -- Definição das áreas de bases
    
    local areaPorto = createRadarArea(2667.9736328125, -2533.037109375, 150, 170, 212, 212, 212, 120)
    setRadarAreaFlashing (areaPorto,true)
    col['paredePorto'] = createColRectangle(2667.9736328125, -2533.037109375, 150, 170)

    local areaPraia = createRadarArea(275.15625, -1887.3583984375, 150, 170, 11,244,244, 120)
    setRadarAreaFlashing (areaPraia,true)
    col['paredePraia'] = createColRectangle(275.15625, -1887.3583984375, 150, 170)

    local areaLixo = createRadarArea(-1949.1015625, -1790.830078125, 150, 170, 0, 0, 210, 120)
    setRadarAreaFlashing (areaLixo,true)
    col['paredeLixo'] = createColRectangle(-1949.1015625, -1790.830078125, 150, 170)

    local areaTorre = createRadarArea(-2588.7138671875, -725.1787109375, 150, 170, 45,226,24, 120)
    setRadarAreaFlashing (areaTorre,true)
    col['paredeTorre'] = createColRectangle(-2588.7138671875, -725.1787109375, 150, 170)

    local areaAgua = createRadarArea(-3003.4033203125, 376.92578125, 150, 170, 31,245,101, 120)
    setRadarAreaFlashing (areaAgua,true)
    col['paredeAgua'] = createColRectangle(-3003.4033203125, 376.92578125, 150, 170)

    local areaBay = createRadarArea(-2323.359375, 2240.7314453125, 150, 170, 164, 0, 0, 120)
    setRadarAreaFlashing (areaBay,true)
    col['paredeBay'] = createColRectangle(-2323.359375, 2240.7314453125, 150, 170)

    local area51 = createRadarArea(271.2236328125, 1791.341796875, 150, 170, 255,62,207, 120)
    setRadarAreaFlashing (area51,true)
    col['parede51'] = createColRectangle(271.2236328125, 1791.341796875, 150, 170)

    local areaKCC = createRadarArea(2715.298828125, 2638.5439453125, 150, 170, 250,227,67, 120)
    setRadarAreaFlashing (areaKCC,true)
    col['paredeKCC'] = createColRectangle(2715.298828125, 2638.5439453125, 150, 170)

    local areaLV = createRadarArea(2777.126953125, 1712.4716796875, 150, 170, 206,98,0, 120)
    setRadarAreaFlashing(areaLV, true)
    col['paredeLV'] = createColRectangle(2777.126953125, 1712.4716796875, 150, 170)

    local areaPalom = createRadarArea(2368.109375, 77.0751953125, 150, 170, 62,183,68, 120)
    setRadarAreaFlashing (areaPalom,true)
    col['paredePalom'] = createColRectangle(2368.109375, 77.0751953125, 150, 170)

    local areaBB = createRadarArea(-306.1455078125, -165.607421875, 150, 170, 115,115,115, 120)
    setRadarAreaFlashing (areaBB,true)
    col['paredeBB'] = createColRectangle(-306.1455078125, -165.607421875, 150, 170)

end

addEventHandler("onResourceStart", getResourceRootElement(), base1)

function inicio()
    destroyElement(col['paredePraia'])
    destroyElement(col['paredePorto'])
    destroyElement(col['paredeLixo'])
    destroyElement(col['paredeTorre'])
    destroyElement(col['paredeAgua'])
    destroyElement(col['paredeBay'])
    destroyElement(col['parede51'])
    destroyElement(col['paredeKCC'])
    destroyElement(col['paredeLV'])
    destroyElement(col['paredePalom'])
    destroyElement(col['paredeBB'])
    COMECOU = true
end

function saiuBaseA2 ( thePlayer )
    if getElementType(thePlayer) ~= 'player' or isPedDead(thePlayer) then
        return
    end
    if getElementType ( thePlayer ) == "player" and not COMECOU then -- if the element that left was player
        if getTeamName(getPlayerTeam(thePlayer)) == 'STAFF' then 
            return 
        end
       killPed( thePlayer ) -- kill the player
       outputChatBox ( "Não saia da zona de time", thePlayer )
       outputDebugString(getPlayerName(thePlayer) .. ' Saiu da base do '.. getTeamName(getPlayerTeam(thePlayer)))
        setPlayerTeam(thePlayer,nil)
       triggerClientEvent(thePlayer,'time-menu:open',thePlayer)
    end
end
addEventHandler ( "onColShapeLeave", getRootElement(), saiuBaseA2 )


