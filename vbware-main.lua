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
