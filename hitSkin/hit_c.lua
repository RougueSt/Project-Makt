addEventHandler('onClientPlayerWeaponFire',localPlayer, function(weapon, ammo, ammoInClip, hitx, hity, hitz, jogador, sx,sy,sz)
    if jogador == nil then 
        return 
    end

    if getElementType(jogador) == 'player' then
        triggerServerEvent('hit:skin',getLocalPlayer(),weapon, jogador)
    end

end)