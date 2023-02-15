local controle = 0
-------LS--------------LS--------------LS--------------LS--------------LS--------------LS--------------LS--------------LS--------------LS--------------LS-------
local function primeiraSafeLS()
    if controle == 0 then 
        safe = createRadarArea(63.3564453125, -2816.5986328125, 2900,2000, 0, 255, 0, 100)
        exports.V_infobox:addBox(root, "Primeira safezone em Los Santos. Atenção para o crônometro no canto superior esquerdo! ", "info")
        timer = exports.missionTimer:createMissionTimer(300000, true, '%m:%s', 30, 10, true, 'default-bold', 1, 255,255,255)
        controle = 1
        setTimer(primeiraSafeLS,300000,1) --------- TEMPO PARA FECHAR A PRIMEIRA SAFEZONE 
        return
    end

    if controle == 1 then 
        parede = createColRectangle(63.3564453125,-2816.5986328125, 2900,2000)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end
        end
        setRadarAreaColor(safe,255,50,50,100)
        destroiAeroTank()
        exports.V_infobox:addBox(root, "Primeira safezone fechou, | SEM VEICULOS DE ATAQUE", "warning")
        
        controle = 2
        setTimer(primeiraSafeLS,300000,1)  ------------------------------TEMPO PARA MOSTRAR A SEGUNDA SAFEZONE
        return
    end

    if controle == 2 then 
        destroyElement(parede)
        destroyElement(safe)
        x = math.random(63.3564453125,2400)
        y = math.random(852,1702)*-1 - 500
        safe = createRadarArea(x,y,500,500,0,255,0,100)
        exports.V_infobox:addBox(root, "Segunda safezone apareceu! Você tem 5 minutos pra entrar na safezone", "info")
        controle = 3
        
        exports.missionTimer:setMissionTimerTime(timer, 300000)
        setTimer(primeiraSafeLS,300000,1) ------------------------------- TEMPO PARA FECHAR A SEGUNDA SAFEZONE
        return 
    end

    if controle == 3 then 
        parede = createColRectangle(x,y, 500,500)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end 
        end
        exports.V_infobox:addBox(root, "Segunda safezone fechou | CUIDADO AI PORRA", "warning")
        controle = 4
        setRadarAreaColor(safe,255,50,50,100)
        
        setTimer(primeiraSafeLS,300000,1) ------------------------------------- TEMPO PARA MOSTRAR A TERCEIRA SAFEZONE
        return
    end

    if controle == 4 then 
        destroyElement(parede)
        destroyElement(safe)
        x = math.random(x,x+250)
        y = math.random(y,y+250)
        safe = createRadarArea(x,y,250,250,0,255,0,100)
        exports.V_infobox:addBox(root, "Terceira safezone apareceu! Você tem 5 minutos pra entrar na safezone", "info")
        controle = 5
        
        exports.missionTimer:setMissionTimerTime(timer, 300000)
        setTimer(primeiraSafeLS,300000,1) ------------------------------------- TEMPO PARA FECHAR A TERCEIRA SAFEZONE
        return 
    end

    if controle == 5 then 
        parede = createColRectangle(x,y, 250,250)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end
        end
        setRadarAreaColor(safe,255,50,50,100)
        
        exports.V_infobox:addBox(root, "Terceira safezone fechou| CUIDADO AI PORRA ||| GO PVP! NÃO FECHA MAIS", "warning")
        exports.missionTimer:setMissionTimerTime(timer, 600000)
        controle = 0
        return
    end

end


local function LosSantos()
    COMECOU = true
    adicionaTime()
    Descongela()
    exports.players:inicio()
    
    setTimer(primeiraSafeLS,10000,1)
end

addEvent('LosSantos:start', true)
addEventHandler('LosSantos:start', root, LosSantos)


-----------------------------------------------------------NOS USAMOS A LINHA DE CIMA PRA ATIVAR AS SAFEZONES DE LS--------------------------------------------------

-------SF--------------SF--------------SF--------------SF--------------SF--------------SF--------------SF--------------SF--------------SF--------------SF-------

local function primeiraSafeSF()
    if controle == 0 then 
        safe = createRadarArea(-2985.326171875, -845.6611328125, 1800,2350, 0, 255, 0, 100)
        exports.V_infobox:addBox(root, "Primeira safezone em San Fierro. Atenção para o crônometro no canto superior esquerdo! ", "info")
        
        controle = 1
        timer = exports.missionTimer:createMissionTimer(300000, true, '%m:%s', 30, 10, true, 'default-bold', 1, 255,255,255)
        setTimer(primeiraSafeLS,300000,1) --------- TEMPO PARA FECHAR A PRIMEIRA SAFEZONE       
        return
    end

    if controle == 1 then 
        parede = createColRectangle(-2985.326171875,-845.6611328125, 1800,2350)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end
        end
        destroiAeroTank()
        setRadarAreaColor(safe,255,50,50,100)
        exports.V_infobox:addBox(root, "Primeira safezone fechou, | SEM VEICULOS DE ATAQUE", "warning")
        
        controle = 2
        setTimer(primeiraSafeLS,300000,1)  ------------------------------TEMPO PARA MOSTRAR A SEGUNDA SAFEZONE
        return
    end

    if controle == 2 then 
        destroyElement(parede)
        destroyElement(safe)
        x = math.random(1699,2985.326171875)*-1
        y = math.random(0, 1080.7880859375) - math.random(0,842.6611328125)
        safe = createRadarArea(x,y,500,500,0,255,0,100)
        exports.V_infobox:addBox(root, "Segunda safezone apareceu! Você tem 5 minutos pra entrar na safezone", "info")
        
        controle = 3
        exports.missionTimer:setMissionTimerTime(timer, 300000)
        setTimer(primeiraSafeLS,300000,1) ------------------------------- TEMPO PARA FECHAR A SEGUNDA SAFEZONE
        return
    end

    if controle == 3 then 
        parede = createColRectangle(x,y, 500,500)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end
        end
        exports.V_infobox:addBox(root, "Segunda safezone fechou | CUIDADO AI PORRA", "warning")
        
        setRadarAreaColor(safe,255,50,50,100)
        controle = 4
        setTimer(primeiraSafeLS,300000,1) ------------------------------------- TEMPO PARA MOSTRAR A TERCEIRA SAFEZONE
        return
    end

    if controle == 4 then 
        destroyElement(parede)
        destroyElement(safe)
        x = math.random(x,x+250)
        y = math.random(y,y+250)
        safe = createRadarArea(x,y,250,250,0,255,0,100)
        exports.V_infobox:addBox(root, "Terceira safezone apareceu! Você tem 5 minutos pra entrar na safezone", "info")
        
        exports.missionTimer:setMissionTimerTime(timer, 300000)
        controle = 5
        setTimer(primeiraSafeLS,300000,1) ------------------------------------- TEMPO PARA FECHAR A TERCEIRA SAFEZONE
        return
    end

    if controle == 5 then 
        parede = createColRectangle(x,y, 250,250)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end
        end
        exports.V_infobox:addBox(root, "Terceira safezone fechou| CUIDADO AI PORRA ||| GO PVP! NÃO FECHA MAIS", "warning")
        
        setRadarAreaColor(safe,255,50,50,100)
        controle = 0
        exports.missionTimer:setMissionTimerTime(timer, 600000)
        return
    end 
    
end

local function SanFierro()
    COMECOU = true
    adicionaTime()
    Descongela()
    exports.players:inicio()
    setTimer(primeiraSafeSF, 10000, 1)
    
end

addEvent('SanFierro:start', true)
addEventHandler('SanFierro:start', root, SanFierro)

-----------------------------------------------------------NOS USAMOS A LINHA DE CIMA PRA ATIVAR AS SAFEZONES DE SF--------------------------------------------------

-------LV--------------LV--------------LV--------------LV--------------LV--------------LV--------------LV--------------LV--------------LV--------------LV-------

local function primeiraSafeLV()
    if controle == 0 then 
        safe = createRadarArea(796.1474609375, 585.357421875, 2200,2350, 0, 255, 0, 100)
        exports.V_infobox:addBox(root, "Primeira safezone em Las Venturas. Atenção para o crônometro no canto superior esquerdo! ", "info")
        controle = 1
        
        timer = exports.missionTimer:createMissionTimer(300000, true, '%m:%s', 30, 10, true, 'default-bold', 1, 255,255,255)
        setTimer(primeiraSafeLS,300000,1) --------- TEMPO PARA FECHAR A PRIMEIRA SAFEZONE       
        return
    end

    if controle == 1 then 
        parede = createColRectangle(796.1474609375, 585.357421875, 2200,2350)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end
        end
        destroiAeroTank()
        exports.V_infobox:addBox(root, "Primeira safezone fechou, | SEM VEICULOS DE ATAQUE", "warning")
        
        controle = 2 
        setRadarAreaColor(safe,255,50,50,100)
        exports.missionTimer:setMissionTimerTime(timer, 300000)
        setTimer(primeiraSafeLS,300000,1)  ------------------------------TEMPO PARA MOSTRAR A SEGUNDA SAFEZONE
        return 
    end

    if controle == 2 then 
        destroyElement(parede)
        destroyElement(safe)
        x = math.random(796.1474609375,2676.7841796875)
        y = math.random(585.357421875, 2588.3505859375)
        safe = createRadarArea(x,y,500,500,0,255,0,100)
        exports.V_infobox:addBox(root, "Segunda safezone apareceu! Você tem 5 minutos pra entrar na safezone", "info")
        
        controle = 3 
        setTimer(primeiraSafeLS,300000,1) ------------------------------- TEMPO PARA FECHAR A SEGUNDA SAFEZONE
        return 
    end

    if controle == 3 then 
        parede = createColRectangle(x,y, 500,500)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end
        end
        exports.V_infobox:addBox(root, "Segunda safezone fechou | CUIDADO AI PORRA", "warning")
        
        controle = 4
        setRadarAreaColor(safe,255,50,50,100)
        setTimer(primeiraSafeLS,300000,1) ------------------------------------- TEMPO PARA MOSTRAR A TERCEIRA SAFEZONE
        return 
    end

    if controle == 4 then 
        destroyElement(parede)
        destroyElement(safe)
        x = math.random(x,x+250)
        y = math.random(y,y+250)
        safe = createRadarArea(x,y,250,250,0,255,0,100)
        exports.V_infobox:addBox(root, "Terceira safezone apareceu! Você tem 5 minutos pra entrar na safezone", "info")
        
        controle = 5
        exports.missionTimer:setMissionTimerTime(timer, 300000)
        setTimer(primeiraSafeLS,300000,1) ------------------------------------- TEMPO PARA FECHAR A TERCEIRA SAFEZONE
        return 
    end

    if controle == 5 then 
        parede = createColRectangle(x,y, 250,250)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end
        end
        exports.V_infobox:addBox(root, "Terceira safezone fechou| CUIDADO AI PORRA ||| GO PVP! NÃO FECHA MAIS", "warning")
        
        setRadarAreaColor(safe,255,50,50,100)
        controle = 0
        exports.missionTimer:setMissionTimerTime(timer, 600000)
        return
    end

end

local function LasVenturas()
    COMECOU = true
    Descongela()
    adicionaTime()
    exports.players:inicio()
    setTimer(primeiraSafeLV,10000,1)
    
end

addEvent('LasVenturas:start', true)
addEventHandler('LasVenturas:start', root, LasVenturas)

-----------------------------------------------------------NOS USAMOS A LINHA DE CIMA PRA ATIVAR AS SAFEZONES DE LV--------------------------------------------------



----------------------------------------------------MAPA TODO

local function primeiraSafeMP()
    if controle == 0 then 
        x = math.random(0,3000)*-1
        y = math.random(0,3000)*-1
        safe = createRadarArea(x, y, 2500,2500, 0, 255, 0, 100)
        exports.V_infobox:addBox(root, "Primeira safezone valendo mapa todo. Você tem 5 minutos. Atenção para o crônometro no canto superior esquerdo! Corra!", "info")
        controle = 1
        timer = exports.missionTimer:createMissionTimer(300000, true, '%m:%s', 30, 10, true, 'default-bold', 1, 255,255,255)
        setTimer(primeiraSafeMP,300000,1) --------- TEMPO PARA FECHAR A PRIMEIRA SAFEZONE       
        return
    end

    if controle == 1 then 
        parede = createColRectangle(x, y, 2500,2500)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end
        end
        destroiAeroTank()
        setRadarAreaColor(safe,255,50,50,100)
        exports.V_infobox:addBox(root, "Primeira safezone fechou, | SEM VEICULOS DE ATAQUE", "warning")
        
        controle = 2
        setTimer(primeiraSafeMP,300000,1) --------- TEMPO PARA FECHAR A PRIMEIRA SAFEZONE       
        return
    end

    if controle == 2 then 
        destroyElement(parede)
        destroyElement(safe)
        x = math.random(0,3000)*-1
        y = math.random(0,3000)*-1
        safe = createRadarArea(x,y,1000,1000,0,255,0,100)
        exports.V_infobox:addBox(root, "Segunda safezone apareceu! Você tem 5 minutos pra entrar na safezone", "info")
        
        controle = 3
        exports.missionTimer:setMissionTimerTime(timer, 300000)
        setTimer(primeiraSafeMP,300000,1) --------- TEMPO PARA FECHAR A PRIMEIRA SAFEZONE       
        return
    end

    if controle == 3 then 
        parede = createColRectangle(x,y, 1000,1000)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end
        end
        setRadarAreaColor(safe,255,50,50,100)
        exports.V_infobox:addBox(root, "Segunda safezone fechou | CUIDADO AI PORRA", "warning")
        
        controle = 4
        setTimer(primeiraSafeMP,300000,1) --------- TEMPO PARA FECHAR A PRIMEIRA SAFEZONE       
        return
    end

    if controle == 4 then 
        destroyElement(parede)
        destroyElement(safe)
        x = math.random(x,x+250)
        y = math.random(y,y+250)
        safe = createRadarArea(x,y,250,250,0,255,0,100)
        exports.V_infobox:addBox(root, "Terceira safezone apareceu! Você tem 5 minutos pra entrar na safezone", "info")
        
        controle = 5
        exports.missionTimer:setMissionTimerTime(timer, 300000)
        setTimer(primeiraSafeMP,300000,1) --------- TEMPO PARA FECHAR A PRIMEIRA SAFEZONE       
        return
    end

    if controle == 5 then 
        parede = createColRectangle(x,y, 250,250)
        local lista  = getElementsByType("player")
        for a,b in pairs(lista)do 
            local dentro = isElementWithinColShape(b,parede)
            if getTeamName(getPlayerTeam(b)) == 'STAFF' then 
                dentro = true 
            end
            if not dentro then
                outputChatBox(getPlayerName(b).. " MORREU FORA DA SAFE!!!",lista,200,0,0)
                setElementHealth(b,0.0)
            end
        end
        setRadarAreaColor(safe,255,50,50,100)
        exports.V_infobox:addBox(root, "Terceira safezone fechou| CUIDADO AI PORRA ||| GO PVP! NÃO FECHA MAIS", "warning")
        
        controle = 0
        exports.missionTimer:setMissionTimerTime(timer, 600000)
        return
    end

end

local function mapaTodo()
    COMECOU = true
    adicionaTime()
    Descongela()
    exports.players:inicio()
    setTimer(primeiraSafeMP,10000,1)
    
end

addEvent('MapaTodo:start',true)
addEventHandler('MapaTodo:start', root, mapaTodo)








function destroiAeroTank() --PARTIDA 3
    -- get a table of all the vehicles that exist and loop through it
	local vehicles = getElementsByType("vehicle")
	for i,v in ipairs(vehicles) do
		-- if the vehicle's ID is the one provided, destroy it
		if (getElementModel(v) == 425 or getElementModel(v) == 520 or getElementModel(v) == 432 or getElementModel(v) == 487) then
			destroyElement(v)
		end
	end
    
end


function Descongela() --FUNÇÃO DE COMEÇAR
    local vehicles = getElementsByType("vehicle")
	for i,v in ipairs(vehicles) do
		setElementFrozen(v, false)
        setVehicleDamageProof(v, false)
	end

    for i,j in pairs(getElementsByType('player')) do 
        setElementData(j, 'start', true)
    end
    setTime(6,00)
    COMECOU = true
    exports.V_infobox:addBox(root, "PARTIDA COMEÇOU BORAAAAAA!", "success")
end



function adicionaTime() ---- ADICIONA BLIPS NOS TIMES
    local listaPlayers = getElementsByType('Player')
    for i,v in ipairs(listaPlayers) do
		timeDoJogador = getPlayerTeam(v)
        for a,b in ipairs(listaPlayers)do
            if getTeamName( getPlayerTeam(v)) == getTeamName( getPlayerTeam(b)) then
                cr, cg, cb = getTeamColor(getPlayerTeam(v))
                blip = createBlipAttachedTo(b, 0, 2, cr, cg, cb, 255,0, 65535, resourceRoot)
                setElementVisibleTo(blip, v, true)
            end
            if getTeamName(getPlayerTeam(v)) == 'STAFF' then
                setElementVisibleTo(blip, v, true)
                outputChatBox('BLIP DE TIMES', v)
            end 
        end
	end

end



local function ativaSafe( colShapeLeft )
    if colShapeLeft == parede then
        if getElementType(source) ~= 'player' then
            return
        end
        if getTeamName(getPlayerTeam(source)) == 'STAFF' then 
            return 
        end
        outputChatBox( "Você saiu da Safe",source,200,0,0 ) -- print the type of the element to chatbox
        setElementHealth(source, 0.00)
    end
end




addEventHandler( "onElementColShapeLeave", getRootElement(), ativaSafe )

--[[ addEventHandler('onVehicleDamage',root, function()
    if not COMECOU then 
        fixVehicle(source)
    end
end)
 ]]