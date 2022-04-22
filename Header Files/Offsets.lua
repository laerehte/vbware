local offsets = {
	
	UIS = game:GetService("UserInputService"),
	PLAYERS = game:GetService("Players"),
	PLAYER = game:GetService("Players").LocalPlayer,
	CHARACTER = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait(),
	ROOT = game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"),
	STORAGE = game:GetService("ReplicatedStorage"),
	GAME_VALUES = game:GetService("ReplicatedStorage"):WaitForChild("GameValues"),
	HUMANOID = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"),
	
	Speedhack = 0,
	Speedkey = Enum.KeyCode.LeftControl,
	
}

return offsets
