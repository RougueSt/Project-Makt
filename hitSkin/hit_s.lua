addEvent('hit:skin', true)
addEventHandler('hit:skin',root, function(weapon, jogador)
    if weapon == 31 and getPlayerTeam(source) ~= getPlayerTeam(jogador) then 

        if getTeamName(getPlayerTeam(jogador)) == 'STAFF' then 
            outputChatBox('VOCÊ TA ATIRANDO NO STAFF, ANIMAL', source, 255,40,40)
            return 
        end
        if getPedArmor(jogador) > 8 then 
            local novoColete = getPedArmor(jogador) - 9.7
            outputDebugString('colete1: '.. novoColete)
            setPedArmor(jogador,novoColete)
            return
        end

        if getPedArmor(jogador) < 12 then 
            setPedArmor(jogador, 0)
        end

        local inimigo = getElementHealth(jogador)
        inimigo = inimigo-9.7
        setElementHealth(jogador, inimigo)
        if inimigo < 12 then 
            killPed(jogador, source, 31)
        end
        outputDebugString('vida1: '.. inimigo)
    end
end)
