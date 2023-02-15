----------------------------------------------------------------------
-------  Script:  ------------- Visit: --------------- Made in -------
------- 7rust-Dev ---------7rust.bplaced.de----------- GERMANY -------
----------------------------------------------------------------------

hitMarker = true

addCommandHandler("shit",
	function(x)
		if (hitMarker) then
			outputChatBox("AVISO: Você desativou o hit marker FOUND!", 0, 255, 0)
			hitMarker = false
		else
			outputChatBox("AVISO: Você ativou o hit marker FOUND!", 0, 255, 0)
			hitMarker = true
		end
	end
)

local screenX, screenY
local drawTimer
local isDrawing
local sound

function drawHitMarker()
	if (hitMarker ~= true) then return end
	if cancelDrawing then return end 
	dxDrawImage(screenX-16, screenY-16, 32, 32, "hitmarker.png")
	
end

function fireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	if (hitMarker ~= true) then return end
	if source and isElement(source) and getElementType(source) == "player" and hitElement and isElement(hitElement) and getElementType(hitElement) == "player" then
		if hitElement and not getPlayerTeam(source) or not getPlayerTeam(hitElement) or getPlayerTeam(source) ~= getPlayerTeam(hitElement) then
				if getElementType(hitElement)=="player" or getElementType(hitElement)=="ped" or getElementType(hitElement)=="vehicle" then
					
			screenX, screenY = getScreenFromWorldPosition(hitX, hitY, hitZ)

			if not screenX then return end 
			if isDrawing then return end 
			isDrawing = true
			
			local sound = playSound("hitsound.wav")
			setSoundVolume( sound , 1)
		
		
			addEventHandler("onClientRender", root, drawHitMarker) 
			if drawTimer and isTimer(drawTimer) then
				killTimer(drawTimer)
			end
			
			
			drawTimer = setTimer(function() 
				isDrawing = false
				removeEventHandler("onClientRender", root, drawHitMarker) 
			end, 500, 1)
		end
		end
	end 
end--func
addEventHandler("onClientPlayerWeaponFire", localPlayer, fireFunc)

----------------------------------------------------------------------
-------  Script:  ------------- Visit: --------------- Made in -------
------- 7rust-Dev ---------7rust.bplaced.de----------- GERMANY -------
----------------------------------------------------------------------


function get_hit2(attacker, causing, bodypart)
	if attacker and attacker == getLocalPlayer() then
		if bodypart ~= 9 then  
			cancelDrawing = false
		else 
			cancelDrawing = false
		end 
	end 
end

addEventHandler("onClientPlayerDamage",root,get_hit2)

----------------------------------------------------------------------
-------  Script:  ------------- Visit: --------------- Made in -------
------- 7rust-Dev ---------7rust.bplaced.de----------- GERMANY -------
----------------------------------------------------------------------
