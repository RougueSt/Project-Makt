addEventHandler('onPlayerLogin', root, function(_, conta)
    if isObjectInACLGroup('user.' .. getAccountName(conta), aclGetGroup('Admin')) then
        triggerClientEvent(source, 'bindar', source)
    end
end)

addEvent('StaffPanel:Download', true)
addEventHandler('StaffPanel:Download', root, function()
    local conta = getPlayerAccount(client)
    if isObjectInACLGroup('user.' .. getAccountName(conta), aclGetGroup('Admin')) then
        triggerClientEvent(client, 'bindar', client)
    end
end)