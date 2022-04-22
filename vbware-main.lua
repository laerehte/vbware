local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/laerehte/vbware/main/Header%20Files/Library.lua"))()
local Offsets = loadstring(game:HttpGet("https://raw.githubusercontent.com/laerehte/vbware/main/Header%20Files/Offsets.lua"))()
local MainScripts = loadstring(game:HttpGet("https://raw.githubusercontent.com/laerehte/vbware/main/Header%20Files/Main.lua"))()

-- Window
local Window = Library:CreateWindow("vb-ware")

-- Tabs
local Tab1 = Window:CreateTab("Local")
local Groupbox1 = Tab1:CreateGroupbox("Player", "Left")

-- Groupbox 1
local InfiniteStam = Groupbox1:CreateButton("Infinite Stamina", function()
	MainScripts.InfiniteStamina(true)
end)

local TiltChanger = Groupbox1:CreateSlider("Tilt Changer", 3000, 10000, Offsets.ROOT.Tilt.P, function(value)
	MainScripts.SetTilt(value)
end)


local StaminaRegen = Groupbox1:CreateSlider("Stamina Regen", 0, 100, 0, function(value)
	MainScripts.StaminaRegen(value)
end)

local LookAngles = Groupbox1:CreateButton("Look Angles", function()
	local function drawLine(player)
		local lookangle = Drawing.new("Line")
		lookangle.Visible = false
		lookangle.Thickness = 1
		lookangle.Color = Color3.new(1,0,0)

		local function updater()
			local c
			c = Offsets.RUN.RenderStepped:Connect(function()
				if player and player.Character and player.Character:FindFirstChild("TopHitbox") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
					for idx = 10, 1, -1 do
						local rayhit, hitpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(player.Character.TopHitbox.Position, player.Character.TopHitbox.CFrame.LookVector * idx), {Offsets.CAMERA, player.Character}, false, true, "")
						local viewportpointhit, isOnScreen = Offsets.CAMERA:WorldToViewportPoint(hitpos)
						local headpos = Offsets.CAMERA:WorldToViewportPoint(player.Character.TopHitbox.Position)

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
		if v ~= Offsets.PLAYER then
			coroutine.wrap(drawLine)(v)
		end
	end

	Offsets.PLAYERS.PlayerAdded:Connect(function(v)
		coroutine.wrap(drawLine)(v)
	end)
end)
