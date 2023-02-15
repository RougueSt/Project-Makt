function developerOn()
        setDevelopmentMode(true)
end

function developerOff()
        setDevelopmentMode(false)
end

addCommandHandler("dev",developerOn)
addCommandHandler("devoff",developerOff)

--[[ 
local weaponsToDamageRhino = {
	[38] = true, -- minigun
	[33] = true, -- country rifle
	[34] = true, -- sniper rifle
	[30] = true, -- AK-47
	[31] = true, -- M4
}

function handleRhinoDamage(attacker, weapon, loss, x, y, z, tire)
	if (weapon and getElementModel(source) == 432 and loss > 0) then
		if (weaponsToDamageRhino[weapon]) then
			setElementHealth(source, getElementHealth(source) - loss*10)
		end
	end
end
addEventHandler("onClientVehicleDamage", root, handleRhinoDamage)
 ]]