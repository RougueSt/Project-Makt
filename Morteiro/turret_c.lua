
local sW, sH = guiGetScreenSize()
local cR = 255
local cG = 255
local cB = 255

function findRotation( x1, y1, x2, y2 ) 
    local t = -math.deg( math.atan2( x2 - x1, y2 - y1 ) )
    return t < 0 and t + 360 or t
end

addEventHandler("onClientCursorMove", root,
    function(_,_,_,_,x,y,z)
	    local wp = getElementData( localPlayer, "usingMortar" )
		if not ( wp == false ) then
	        local cx,cy,cz = getCameraMatrix()
	        setCameraMatrix( cx, cy, cz, x, y, z )	
		    local r = findRotation(cx,cy,x,y)	
			triggerServerEvent( "MORTAR:update", getLocalPlayer(), wp, 0, 0, r-180 )
		end	
	end
)	

addEventHandler("onClientRender", root,
    function()
	    local wp = getElementData( localPlayer, "usingMortar" )
		if not ( wp == false ) then	
            dxDrawImage(sW * 0.4825, sH * 0.4767, sW * 0.0362, sH * 0.0467, "files/crosshud.png", 0, 0, 0, tocolor(cR, cG, cB, 255), false)
		end	
	end
)

bindKey("fire", "down",
    function()
	    local wp = getElementData( localPlayer, "usingMortar" )
	    if not ( wp == false ) then	
			if ( getElementData( localPlayer, "MORTAR:antiSpam" ) == false ) then
	            local ox,oy,oz = getElementPosition(wp)
                local w,h = guiGetScreenSize ()
                local wx,wy,wz = getWorldFromScreenPosition ( w/2, h/2, 1000 )		
		        local hit, x, y, z, hitElement = processLineOfSight(ox,oy,oz,wx,wy,wz,true,true,true,true,false,true,false,false,wp)
	            if ( hit == true ) then
			        setElementData( localPlayer, "MORTAR:antiSpam", true )
			        setTimer(function()
					    setElementData( localPlayer, "MORTAR:antiSpam", false )
                        cG = 255
                        cB = 255			
                    end, 1000, 1 )					
                    cG = 0
                    cB = 0					
		            triggerServerEvent( "MORTAR:fire", getLocalPlayer(), wp, x, y, z )
				end	
			end	
		end	
    end
)	

addEvent("MORTAR:effect", true)
addEventHandler("MORTAR:effect", root,
    function(wp,x,y,z)
	    local ox,oy,oz = getElementPosition(wp)
		local rx,ry,rz = getElementRotation(wp)
        ox = ox - math.sin ( math.rad(rz) ) * -1
        oy = oy + math.cos ( math.rad(rz) ) * -1		
        local eff = createEffect( "prt_collisionsmoke", ox, oy, oz+0.6 )	
        setTimer( destroyElement, 500, 1, eff )		
        local eff2 = createEffect( "prt_sand", x, y, z )	
        setTimer( destroyElement, 1500, 1, eff2 )			
	end
)


