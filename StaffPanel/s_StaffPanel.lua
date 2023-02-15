addEventHandler('onPlayerLogin', root, function(_, conta)
    if isObjectInACLGroup('user.' .. getAccountName(conta), aclGetGroup('Admin')) then
        triggerClientEvent(source, 'bindar', source)
    end
end)