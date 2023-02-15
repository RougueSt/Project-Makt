
------------------------
--DO NOT REMOVE
------------------------

function createMortar(x,y,z)
    if not z then 
	    return false
	end
    local mortar = createObject( 2064, x, y, z )
	local col = createColSphere( x, y, z, 3 )
	setElementParent( col, mortar )
	setElementData( col, "Mortar", true )
    setElementData( mortar, "Mortar", true )
    return mortar	
end

function useMortar(player)
    local uMortar = getElementData( player, "usingMortar" )
	if ( uMortar == false ) then
        if isPedInVehicle(player) then
            unbindKey( player, "enter_exit", "down", useMortar )	
	    end
        local x,y,z = getElementPosition(player)
        local col = createColSphere( x, y, z, 3 )
	    setTimer( destroyElement, 100, 1, col )
	    local mortar = false
	    for k,v in ipairs(getElementsWithinColShape(col,"object")) do
            if mortar == false then
                if ( getElementData( v, "Mortar" ) == true ) then
                    mortar = v			
			    end
            end		
    	end
	    if ( mortar == false ) then
	        unbindKey( player, "enter_exit", "down", useMortar )
	    else
	        local rx,ry,rz = getElementRotation(mortar)
			local mx,my,mz = getElementPosition(mortar)
			setCameraMatrix( player, mx, my, mz+0.8, 0, 0, 0 )
            attachElements( player, mortar, 0, 0.5, 0.3 )	
		    setPedRotation( player, rz-180 )
		    setElementData( player, "usingMortar", mortar )
			setPedAnimation( player, "ped", "DRIVE_BOAT", -1, false, false )
		end	
	else
        detachElements( player )
        setElementData( player, "usingMortar", false )
        setCameraTarget( player, player )		
		setPedAnimation( player, false )
		unbindKey( player, "enter_exit", "down", useMortar )
	end
end

addEventHandler("onPlayerWasted", root,
    function()
        local uMortar = getElementData( source, "usingMortar" )
    	if not ( uMortar == false ) then
            setCameraTarget( source, source )
            detachElements( source )
            setElementData( source, "usingMortar", false )			
	    end
	end
)	

addEventHandler("onColShapeHit", root,
    function(player)
	    if ( getElementData( source, "Mortar" ) == true ) then
            if ( getElementType(player) == "player" ) then
			    local mortar = getElementParent( source )
				if isElement(mortar) then
                    if not isPedInVehicle(player) then
                        bindKey( player, "enter_exit", "down", useMortar )
                    end					
				end
			end
        end		
	end
)	

addEvent("MORTAR:fire",true)
addEventHandler("MORTAR:fire", root,
    function(mortar,x,y,z)
	    local wp = getPedWeapon( source, 8 )
		if ( wp == 16 ) then
            createExplosion( x, y, z, 0 )
            takeWeapon( source, 16, 1 )		
            triggerClientEvent( root, "MORTAR:effect", source, mortar, x, y, z )			
		elseif ( wp == 18 ) then
            createExplosion( x, y, z, 1 )	
            takeWeapon( source, 18, 1 )
            triggerClientEvent( root, "MORTAR:effect", source, mortar, x, y, z )				
        else
            playSoundFrontEnd( source, 41 )
		end	
	end
)	

addEvent("MORTAR:update",true)
addEventHandler("MORTAR:update", root,
    function(wp,rx,ry,rz)
        setElementRotation( wp, rx, ry, rz )
		setPedRotation( source, rz-180 )
	end
)	

------------------------
--Command ( optional )
------------------------

addCommandHandler("mortar", --Command
    function(player)
        local x,y,z = getElementPosition(player)
        local col = createColSphere( x, y, z, 3 )
	    setTimer( destroyElement, 100, 1, col )
	    local mortar = false
	    for k,v in ipairs(getElementsWithinColShape(col,"object")) do
            if mortar == false then
                if ( getElementData( v, "Mortar" ) == true ) then
                    mortar = v			
			    end
            end		
    	end	
		if ( mortar == false ) then
            createMortar( x, y, z-0.4 )
			outputDebugString(getPlayerName(player)..' Criou um morteiro')
		else
            destroyElement(mortar)
		end	
	end
)	
