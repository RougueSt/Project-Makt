-- Nametag Settings --
local Nametags = {
	showing = false, -- whether or not nametags are shown
	font = "default-bold", -- nametag font
	shadow = true, -- whether or not to make shadow of nametag's text (so that it can be seen in any environment)
	showHealthbar = true, -- whether or not to show health bar and armor bar
	hpBarWidth = 40, -- Max health bar width (132 because i think max nick length is 22 and dxGetTextWidth returns around 132 for that length)
	hpBarHeight = 4, -- Health bar height
	scale = 1, -- Font scale
	shadowRecThickness = 6, -- Thickness of shadow around healthbar
	maxDistance = 33, -- Distance at which nametag starts to fade out
	adaptToTeam = true -- Should player's nametag color be changed to team's if player has a team?
}

function Player:GetNick() -- returns hexless nick
	return self:getName():gsub("#%x%x%x%x%x%x", "")
end

function getPedMaxHealth(ped)
	-- Output an error and stop executing the function if the argument is not valid
	assert(isElement(ped) and (getElementType(ped) == "ped" or getElementType(ped) == "player"), "Bad argument @ 'getPedMaxHealth' [Expected ped/player at argument 1, got " .. tostring(ped) .. "]")

	-- Grab his player health stat.
	local stat = getPedStat(ped, 24)

	-- Do a linear interpolation to get how many health a ped can have.
	-- Assumes: 100 health = 569 stat, 200 health = 1000 stat.
	local maxhealth = 100 + (stat - 569) / 4.31

	-- Return the max health. Make sure it can't be below 1
	return math.max(1, maxhealth)
end

function dxDrawEmptyRectangle(startX, startY, endX, endY, color, width, postGUI)
	dxDrawLine(startX, startY, startX + endX, startY, color, width, postGUI)
	dxDrawLine(startX, startY, startX, startY + endY, color, width, postGUI)
	dxDrawLine(startX, startY + endY, startX + endX, startY + endY, color, width, postGUI)
	dxDrawLine(startX + endX, startY, startX + endX, startY + endY, color, width, postGUI)
end

function dxDrawBorderedText( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded )
	dxDrawText ( text, x - 1, y - 1, w - 1, h - 1, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clip, wordBreak, postGUI , colorCoded )
	dxDrawText ( text, x + 1, y - 1, w + 1, h - 1, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clip, wordBreak, postGUI , colorCoded)
	dxDrawText ( text, x - 1, y + 1, w - 1, h + 1, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clip, wordBreak, postGUI , colorCoded )
	dxDrawText ( text, x + 1, y + 1, w + 1, h + 1, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clip, wordBreak, postGUI , colorCoded )
	dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded )
end

function shadowedText(text, left, top, right, bottom, ca, scale, font, alignX, alignY, clip, wordBreak,postGUI) 
	color = tocolor(0,0,0)
 	dxDrawText(RemoveHEXColorCode( text ),left+1,top+1,right,bottom,color,scale,font,alignX,alignY, false, false, false, true)
 	dxDrawText(RemoveHEXColorCode( text ),left-1,top+1,right,bottom,color,scale,font,alignX,alignY, false, false, false, true)
 	dxDrawText(RemoveHEXColorCode( text ),left+1,top-1,right,bottom,color,scale,font,alignX,alignY, false, false, false, true)
 	dxDrawText(RemoveHEXColorCode( text ),left-1,top-1,right,bottom,color,scale,font,alignX,alignY, false, false, false, true)
	dxDrawText(text,left,top,right,bottom,tocolor(255,255,255,255),scale,font,alignX,alignY, false, false, false, true)
end 

function IsColorcode(s)
	local n = s:gsub("#%x%x%x%x%x%x", "")
	if (#n) < (#s) then
		return true
	else
		return false
	end
end

function Nametags.render()
	local bIgnoreDistance = false
	local people = {}

	-- Check if we're aiming at someone, if yes, force the nametag to be shown
	if localPlayer:getTargetStart() and localPlayer:getTargetEnd() and getKeyState("mouse2") then
		local sx, sy, sz = getPedTargetStart(localPlayer)
		local ex, ey, ez = getPedTargetEnd(localPlayer)
		bIgnoreDistance, _, _, _, hitElement = processLineOfSight(sx, sy, sz, ex, ey, ez, false, true, true, false, false, true, false, true, localPlayer, false, false)

		-- Check if it's a player or is it a vehicle with players
		if hitElement then
			if hitElement:getType() == "player" then
				people[hitElement] = true
			elseif hitElement:getType() == "vehicle" then
				-- get passengers if there are any
				for _, v in pairs(getVehicleOccupants(hitElement)) do
					people[v] = true
				end
			end
		end
	end

	for i, player in pairs(getElementsByType("player", nil, true)) do
		local x, y, z = getPedBonePosition(player, 2)
		local mx, my, mz = getCameraMatrix()
		local distance = getDistanceBetweenPoints3D(mx, my, mz, x, y, z)

		if player ~= localPlayer and (distance <= 50 or people[player] == true) then
			if isLineOfSightClear(mx, my, mz, x, y, z, true, false, false, true, false, false, false, localPlayer) then
				local additional_z = .20
				local X, Y = getScreenFromWorldPosition(x, y, z + additional_z)

				if X and Y then
					local text = Nametags.shadow and player:GetNick() or player:getName()
					local texto = player:getName()

					local r, g, b

					local alpha = 175
					local font = IsColorcode(texto) and "default-bold" or "default"

					-- Check for team
					if player:getTeam() and Nametags.adaptToTeam then
						r, g, b = player:getTeam():getColor()
					else
						r, g, b = player:getNametagColor()
					end

					-- Should we fade out? --
					if distance >= Nametags.maxDistance and not bIgnoreDistance then

						local leftover = distance - Nametags.maxDistance;
						alpha = math.max(0, alpha - distance * (leftover/5));

					end

					-- Draw player text --
					--dxDrawText(text, X - dxGetTextWidth(text, Nametags.scale, font), Y, X + dxGetTextWidth(text, Nametags.scale, font), Y, Nametags.shadow and tocolor(0, 0, 0, alpha) or tocolor(r, g, b, alpha), Nametags.scale, font, "center", "top", false, false, false, Nametags.shadow and false or true);
					
					local vip = getElementData(player,"premium.rank")
					--if vip then
					 --  	dxDrawText("["..vip.."]", X - dxGetTextWidth(texto, Nametags.scale, font)-1, Y-1, X + dxGetTextWidth(texto, Nametags.scale, font)-1, Y-1, tocolor(0, 0, 0, 160), 0.9, "default-bold", "center", "top", false, false, false, true);
					--	dxDrawText("["..vip.."]", X - dxGetTextWidth(texto, Nametags.scale, font), Y, X + dxGetTextWidth(texto, Nametags.scale, font), Y, tocolor(255, 153, 0, 160), 0.9, "default-bold", "center", "top", false, false, false, true);
					--end
					
					--local premium = exports.premium:isPlayerVIP()
					--if premium and not mission then
					--    dxDrawText(""..premium.." VIP", X - dxGetTextWidth(texto, Nametags.scale, font)-1, Y-15-1, X + dxGetTextWidth(texto, Nametags.scale, font)-1, Y-12-1, tocolor(0, 0, 0, 160), 0.9, "default-bold", "center", "top", false, false, false, true);
					--	dxDrawText(""..premium.." VIP", X - dxGetTextWidth(texto, Nametags.scale, font), Y-15, X + dxGetTextWidth(texto, Nametags.scale, font), Y-12, tocolor(255, 153, 0, 160), 0.9, "default-bold", "center", "top", false, false, false, true);
					--end
                    local renk = RGBToHex(r, g, b)

					if Nametags.shadow and not vip then
						dxDrawText(texto, X - dxGetTextWidth(texto, Nametags.scale, font), Y, X + dxGetTextWidth(texto, Nametags.scale, font) - 2, Y - 2, tocolor(0, 0, 0, alpha), Nametags.scale, "default-bold", "center", "top", false, false, false, true);
						dxDrawText(texto, X - dxGetTextWidth(texto, Nametags.scale, font) - 1, Y - 1, X + dxGetTextWidth(texto, Nametags.scale, font) - 1, Y - 1, tocolor(r, g, b, alpha), Nametags.scale, "default-bold", "center", "top", false, false, false, true);
					elseif Nametags.shadow and vip and getPlayerTeam(localPlayer)==getPlayerTeam(player) then
					    dxDrawText("VIP "..texto.."", X - dxGetTextWidth(texto, Nametags.scale, font), Y, X + dxGetTextWidth(texto, Nametags.scale, font) - 2, Y - 2, tocolor(0, 0, 0, alpha), Nametags.scale, "default-bold", "center", "top", false, false, false, true);
						dxDrawText("#FF9900VIP "..renk..""..texto.."", X - dxGetTextWidth(texto, Nametags.scale, font) - 1, Y - 1, X + dxGetTextWidth(texto, Nametags.scale, font) - 1, Y - 1, tocolor(r, g, b, alpha), Nametags.scale, "default-bold", "center", "top", false, false, false, true);
					elseif Nametags.shadow and vip and getPlayerTeam(localPlayer)~=getPlayerTeam(player) then
					   dxDrawText(texto, X - dxGetTextWidth(texto, Nametags.scale, font), Y, X + dxGetTextWidth(texto, Nametags.scale, font) - 2, Y - 2, tocolor(0, 0, 0, alpha), Nametags.scale, "default-bold", "center", "top", false, false, false, true);
					   dxDrawText(texto, X - dxGetTextWidth(texto, Nametags.scale, font) - 1, Y - 1, X + dxGetTextWidth(texto, Nametags.scale, font) - 1, Y - 1, tocolor(r, g, b, alpha), Nametags.scale, "default-bold", "center", "top", false, false, false, true);
					end

					-- Draw healthbar --
					if Nametags.showHealthbar then
						local fontHeight = dxGetFontHeight(Nametags.scale, font)
						local distanceScaling = distance * 1.5
						local alpha2 = alpha - 150
						local alphaDivider = 255 / 150

						-- Alpha fix --
						if alpha2 < 10 then
							alpha2 = 0
						end

						-- If we are aiming from distance longer than fade distance then dont scale the rectangles --
						if (bIgnoreDistance and distance > Nametags.maxDistance) or (distance > Nametags.maxDistance + (distance - Nametags.maxDistance)) then
							distanceScaling = 0
							distance = 0
						end

						local multiplier = Nametags.hpBarWidth / getPedMaxHealth(player)
						local middleDistanceScale = ((X - Nametags.hpBarWidth / 2 + distanceScaling / 2) - (X - Nametags.hpBarWidth / 2)) / 2
						local colorMultiplier = 255 / getPedMaxHealth(player)
						local armor = player:getArmor()
						local divider = (10 - (player:getHealth() / getPedMaxHealth(player)) * 8)

						local recX = X - Nametags.hpBarWidth / 2 + middleDistanceScale
						local recY = Y + fontHeight + Nametags.shadowRecThickness * 2 - distanceScaling / 10
						local recWidth = math.max(player:getHealth() * multiplier - distanceScaling / divider, 1) -- distanceScaling / 10 makes it so low health doesnt 'decrease' when you get far away from player but it causes issue of full health getting out of healtbar, and distanceScaling / 2 makes it at full health to stay inside but on small health when you go away from player it looks like his health is lowering
						local recHeight = Nametags.hpBarHeight - distanceScaling / 20

						-- Dead issue fix --
						if player:getHealth() == 0 then
							recWidth = 0
						end

						-- Fix when player has 200hp eventho his max is 100, and fixes other impossible cases, this is actually more of a safeguard that health bar never gets out of its 'prison'
						if recWidth > Nametags.hpBarWidth then
							recWidth = Nametags.hpBarWidth - Nametags.shadowRecThickness
						end

						dxDrawRectangle(recX - Nametags.shadowRecThickness, recY - Nametags.shadowRecThickness, Nametags.hpBarWidth + Nametags.shadowRecThickness * 2 - distanceScaling / 2, recHeight + Nametags.shadowRecThickness*2, armor > 0 and tocolor(120, 120, 120, alpha) or tocolor(0, 0, 0, alpha));
						dxDrawRectangle(recX, recY, Nametags.hpBarWidth - distanceScaling / 2, recHeight, tocolor(0, 0, 0, alpha));
						dxDrawRectangle(recX, recY, Nametags.hpBarWidth - distanceScaling / 2, recHeight, tocolor(math.max(255 - player:getHealth() * colorMultiplier, 0), math.max(0 + player:getHealth() * colorMultiplier, 0), 0, alpha2));

						dxDrawRectangle(recX, recY, recWidth, recHeight, tocolor(math.max(255 - player:getHealth() * colorMultiplier, 0), math.max(0 + player:getHealth() * colorMultiplier, 0), 0, alpha));
					end
				end
			end
		end
	end
end

function RGBToHex(red, green, blue, alpha)
	
	-- Make sure RGB values passed to this function are correct
	if( ( red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255 ) or ( alpha and ( alpha < 0 or alpha > 255 ) ) ) then
		return nil
	end

	-- Alpha check
	if alpha then
		return string.format("#%.2X%.2X%.2X%.2X", red, green, blue, alpha)
	else
		return string.format("#%.2X%.2X%.2X", red, green, blue)
	end

end

function Nametags:isShowing()
	return Nametags.showing
end

function Nametags:setShowing(bShowing)
	if bShowing then
		if not Nametags:isShowing() then
			addEventHandler("onClientRender", root, Nametags.render)
			Nametags.showing = true
		end
	else
		if Nametags:isShowing() then
			removeEventHandler("onClientRender", root, Nametags.render)
			Nametags.showing = false
		end
	end
end

function show (bool)
		if bool and not Nametags:isShowing() then
			addEventHandler("onClientRender", root, Nametags.render)
			Nametags.showing = true
			for _, player in pairs(getElementsByType("player")) do
			   player:setNametagShowing(false)
		    end
		else
			removeEventHandler("onClientRender", root, Nametags.render)
			Nametags.showing = false
			for _, player in pairs(getElementsByType("player")) do
			   player:setNametagShowing(true)
		    end
		end
end
addEvent("nametag:Showing",true)
addEventHandler("nametag:Showing", root, show)

addEventHandler("onClientPlayerJoin", root,
	function()
	   if Nametags.showing then
		  source:setNametagShowing(false)
	   end
	end
)