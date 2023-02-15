CONT = 1

addEvent('spec',true)

addEventHandler('spec',localPlayer, function()
    TIME = getPlayersInTeam(getPlayerTeam(localPlayer))
    setCameraTarget(TIME[1])

    bindKey('arrow_r', "down", function()
        TIME = getPlayersInTeam(getPlayerTeam(localPlayer))
        quantidade = countPlayersInTeam(getPlayerTeam(localPlayer))
        if CONT > quantidade then
            CONT = 1
            outputDebugString('contagem R CONT:'.. CONT)
        end
        if CONT == 1 then
            outputDebugString('contagem R CONT:'.. CONT)
            setCameraTarget(TIME[CONT])
            return
        end
        if CONT < quantidade then
            CONT = CONT + 1
        end
        setCameraTarget(TIME[CONT])
        outputDebugString('contagem R CONT:'.. CONT)
    
    end)

    bindKey('arrow_l', 'down', function()
        TIME = getPlayersInTeam(getPlayerTeam(localPlayer))
        quantidade = countPlayersInTeam(getPlayerTeam(localPlayer))
        CONT = CONT - 1
        if CONT == 1 then 
            CONT = quantidade
        end

        if CONT == 0 then
            CONT = quantidade
        end

        if CONT <= quantidade then 
            setCameraTarget(TIME[CONT])
            outputDebugString('contagem L CONT:'.. CONT)
            outputDebugString(quantidade)
        end
        
    end)
    
end)

