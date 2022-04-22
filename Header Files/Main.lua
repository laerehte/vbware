local scripts = {}
local Offsets = loadstring(game:HttpGet("https://raw.githubusercontent.com/laerehte/vbware/main/Header%20Files/Offsets.lua"))()

-- Infinite Stamina
scripts.InfiniteStamina = function(State)
	
	if State == true then
		
		for i, v in pairs(getgc()) do
			if typeof(v) == "function" then
				if getfenv(v).script then
					if getfenv(v).script.Name == "InputHandler" then
						local ups = debug.getupvalues(v)
						if ups[2] == 10 then
							debug.setupvalue(v,2,math.huge)
							break
						end
					end
				end
			end
		end

		
	elseif State == false then
		
		for i, v in pairs(getgc()) do
			if typeof(v) == "function" then
				if getfenv(v).script then
					if getfenv(v).script.Name == "InputHandler" then
						local ups = debug.getupvalues(v)
						if ups[2] == 10 then
							debug.setupvalue(v,2, 10)
							break
						end
					end
				end
			end
		end

		
	end
	
end

-- Stamina Regen
scripts.StaminaRegen = function(Value)
	Offsets.GAME_VALUES.staminaRegen.Value = Value
end

-- Tilt Changer
scripts.SetTilt = function(Value)
	Offsets.ROOT.Tilt.P = Value
end 

return scripts
