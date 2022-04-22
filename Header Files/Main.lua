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

-- Look Angles
scripts.ViewAngles = function(State)
	if State == true then
		local function drawLine(player)
			local lookangle = Drawing.new("Line")
			lookangle.Visible = false
			lookangle.Thickness = 1
			lookangle.Color = Color3.new(1,0,0)

			local function updater()
				local c
				c = Offsets.RUN.RenderStepped:Connect(function()
					if player and player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
						for idx = 10, 1, -1 do
							local rayhit, hitpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(player.Character.Head.Position, player.Character.Head.CFrame.LookVector * idx), {Offsets.CAMERA, player.Character}, false, true, "")
							local viewportpointhit, isOnScreen = Offsets.CAMERA:WorldToViewportPoint(hitpos)
							local headpos = Offsets.CAMERA:WorldToViewportPoint(player.Character.Head.Position)

							if isOnScreen then
								lookangle.From = Vector2.new(headpos.X, headpos.Y)
								lookangle.To = Vector2.new(viewportpointhit.X, viewportpointhit.Y)
								lookangle.Visible = true
								break
							else
								lookangle.Visible = false
							end

						end
					end
				end)
				coroutine.wrap(updater)()




			end
		end

		for i,v in next, Offsets.PLAYERS:GetPlayers() do
			if v ~= Offsets.PLAYER and then
				coroutine.wrap(drawLine)(v)
			end
		end

		Offsets.PLAYERS.PlayerAdded:Connect(function(v)
			coroutine.wrap(drawLine)(v)
		end)
	end
end

return scripts

