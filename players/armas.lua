addEventHandler('onResourceStart', root, function()
    setWeaponProperty(31, 'pro', 'target_range', 300)
    setWeaponProperty(31, 'pro', 'weapon_range', 300)
    setWeaponProperty(31, 'pro', 'accuracy', 999)
    setWeaponProperty(31, 'pro', 'damage', 1)
end)


function paraqueda(thePlayer, comando)
    giveWeapon(thePlayer, 46, 1)
    outputChatBox( 'Paraquedas adicionado :)',thePlayer, 50,255,50)
end

function tiraParaqueda(thePlayer, comando)
    takeWeapon(thePlayer,46)
    outputChatBox( 'Paraquedas removido :(' ,thePlayer, 255,50,50)
end



addCommandHandler('paraquedas',paraqueda, false, false)
addCommandHandler('paraqueda',paraqueda, false, false)
addCommandHandler('paraquedasn',tiraParaqueda, false, false)
addCommandHandler('paraquedan',tiraParaqueda, false, false)
addCommandHandler('parachuteal',paraqueda, false, false)
addCommandHandler('parachuteat',tiraParaqueda, false, false)
addCommandHandler('parachute',paraqueda, false, false)