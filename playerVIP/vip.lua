
function vipAbrir(thePlayer)
    triggerClientEvent('vip:abrir',thePlayer)
end

function vipFechar(thePlayer)
    triggerClientEvent('vip:fechar',thePlayer)
end

addEvent('vip:abrir',true)
addEventHandler('vip:abrir',root,vipAbrir)


addEvent('vipSanchez',true)
addEventHandler('vipSanchez',root,function ()
    if getPedOccupiedVehicle(source) then 
        outputChatBox('Você não pode spawnar um veiculo agora', source, 255,40,40)
        return
    else 
        local x,y,z = getElementPosition(source)
        local xr,yr,zr = getElementRotation(source)
        local r,g,b = getTeamColor(getPlayerTeam(source))
        local sanchez = createVehicle(468, x,y,z,xr,yr,zr, getPlayerName(source))
        setVehicleColor(sanchez,r,g,b,r,g,b)
        warpPedIntoVehicle(source, sanchez, 0)
        outputChatBox('Veiculo criado com sucesso!', source, 40,255,40)
        outputDebugString(getPlayerName(source).. ' Criou uma sanchez!')
    end
end)

addEvent('vipVortex',true)
addEventHandler('vipVortex',root,function ()
    if getPedOccupiedVehicle(source) then 
        outputChatBox('Você não pode spawnar um veiculo agora', source, 255,40,40)
        return
    else 
        local x,y,z = getElementPosition(source)
        local xr,yr,zr = getElementRotation(source)
        local r,g,b = getTeamColor(getPlayerTeam(source))
        local Vortex = createVehicle(539, x,y,z,xr,yr,zr, getPlayerName(source))
        setVehicleColor(Vortex,r,g,b,r,g,b,r,g,b,r,g,b)
        warpPedIntoVehicle(source, Vortex, 0)
        outputChatBox('Veiculo criado com sucesso!', source, 40,255,40)
        outputDebugString(getPlayerName(source).. ' Criou um Vortex!')
    end
end)

addEvent('vipKart',true)
addEventHandler('vipKart',root,function ()
    if getPedOccupiedVehicle(source) then 
        outputChatBox('Você não pode spawnar um veiculo agora', source, 255,40,40)
        return
    else 
        local x,y,z = getElementPosition(source)
        local xr,yr,zr = getElementRotation(source)
        local r,g,b = getTeamColor(getPlayerTeam(source))
        local Kart = createVehicle(571, x,y,z,xr,yr,zr, getPlayerName(source))
        setVehicleColor(Vortex,r,g,b,r,g,b)
        warpPedIntoVehicle(source, Kart, 0)
        outputChatBox('Veiculo criado com sucesso!', source, 40,255,40)
        outputDebugString(getPlayerName(source).. ' Criou um Kart!')
    end
end)

addEvent('vipColete',true)
addEventHandler('vipColete',root,function ()
    local colete = getPedArmor(source)
    setPedArmor(source, colete+25)
end)

addEvent('vipVida',true)
addEventHandler('vipVida',root,function ()
    local vida = getElementHealth(source)
    setElementHealth(source, vida+25)
end)

addEvent('vipSkin',true)
addEventHandler('vipSkin',root,function(id)
    if id ~= nil then
        setElementModel(source, id)
    end

    if id == 0 then 
        setElementModel(source,30)
    end
    if id == 1 then 
        setElementModel(source,32)
    end
    if id == 2 then 
        setElementModel(source,33)
    end
    if id == 3 then 
        setElementModel(source,34)
    end
    if id == 4 then 
        setElementModel(source,35)
    end
    if id == 5 then 
        setElementModel(source,36)
    end
    if id == 6 then 
        setElementModel(source,37)
    end
    if id == 7 then 
        setElementModel(source,38)
    end
    if id == 8 then 
        setElementModel(source,39)
    end
    if id == 9 then 
        setElementModel(source,40)
    end
    if id == 10 then 
        setElementModel(source,41)
    end
    if id == 11 then 
        setElementModel(source,43)
    end
    if id == 12 then 
        setElementModel(source,44)
    end
    if id == 13 then 
        setElementModel(source,45)
    end
    if id == 14 then 
        setElementModel(source,46)
    end
    if id == 15 then 
        setElementModel(source,47)
    end
    if id == 16 then 
        setElementModel(source,48)
    end
    if id == 17 then 
        setElementModel(source,49)
    end
    if id == 18 then 
        setElementModel(source,50)
    end

end)

addEvent('patriotal',true)
addEventHandler('patriotal',root, function()
    if getPedOccupiedVehicle(source) then 
        outputChatBox('Você não pode spawnar um veiculo agora', source, 255,40,40)
        return
    else 
        local x,y,z = getElementPosition(source)
        local xr,yr,zr = getElementRotation(source)
        local r,g,b = getTeamColor(getPlayerTeam(source))
        local patriot = createVehicle(560, x,y,z,xr,yr,zr, getPlayerName(source))
        setVehicleColor(patriot,r,g,b,r,g,b,r,g,b,r,g,b)
        warpPedIntoVehicle(source, patriot, 0)
        outputChatBox('Veiculo criado com sucesso!', source, 40,255,40)
        outputDebugString(getPlayerName(source).. ' Pegou um Patriotal!')
    end
end)

addCommandHandler('vip',vipAbrir,false,false)

