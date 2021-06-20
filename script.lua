-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local TextBox = Instance.new("TextBox")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

TextBox.Parent = ScreenGui
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.BackgroundTransparency = 0.400
TextBox.Position = UDim2.new(0.372611463, 0, 0.105263159, 0)
TextBox.Size = UDim2.new(0, 364, 0, 50)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 30.000

-- Scripts:

local function GSMIK_fake_script() -- TextBox.LocalScript 
	local script = Instance.new('LocalScript', TextBox)

	local plr = game.Players.LocalPlayer
	local chat = game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest
	
	script.Parent.FocusLost:Connect(function()
		local args = script.Parent.Text:split(" ")
		local cmd = args[1]
	
		if cmd == ".give" then
			function findgun(stringg)
				for _, v in pairs(game.Workspace.Prison_ITEMS.giver:GetChildren()) do
					if stringg:lower() == (v.Name:lower()):sub(1, #stringg) then
						return v
					end
				end
			end
			local gun = findgun(args[2])
			if gun then
				game.Workspace.Remote.ItemHandler:InvokeServer(gun.ITEMPICKUP)
			end
		elseif cmd == ".changeteam" then
			local arg = args[2]:lower()
			if arg == "inmate" then
				game.Workspace.Remote.TeamEvent:FireServer("Bright orange")
			elseif arg == "gaurd" then
				game.Workspace.Remote.TeamEvent:FireServer("Bright blue")
			elseif arg == "criminal" then
				local weld02 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-919.958, 95.327, 2138.189)
				wait(2)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(weld02)
			elseif arg == "neutral" then
				game.Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
			end
		elseif cmd == ".rejoin" then
			game:GetService("TeleportService"):Teleport(game.PlaceId)
		elseif cmd == ".re" then
			game.Workspace.Remote.loadchar:InvokeServer(plr.Name)
		elseif cmd == ".arrest" then
			if args[2]:lower() == "all" then
				for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
					if v ~= plr then
						i = 0
						repeat wait(0.1)
							plr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
							game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
							i = i + 1
						until i == 10
					end
				end
			else
				local i = 0
				local player = findplayer(args[2])
				local pos = plr.Character.HumanoidRootPart.Position
				repeat wait(0.1)
					plr.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
					game.Workspace.Remote.arrest:InvokeServer(player.Character.HumanoidRootPart)
					i = i + 1
				until i == 10
				plr.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
			end
		elseif cmd == ".to" then
			local player = findplayer(args[2])
			plr.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
		elseif cmd == ".noclip" then
			_G.noclip = not _G.noclip
		elseif cmd == ".walkspeed" then
			if args[2] == nil then chat:FireServer("No number found!") end
			plr.Character.Humanoid.WalkSpeed = tonumber(args[2])
		elseif cmd == ".jumppower" then
			if args[2] == nil then chat:FireServer("No number found!") end
			plr.Character.Humanoid.UseJumpPower = true
			plr.Character.Humanoid.JumpPower = tonumber(args[2])
		elseif cmd == ".serverhop" then
			local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
			for i,v in pairs(Servers.data) do
				if v.playing ~= v.maxPlayers then
					game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
				end
			end
		end
	end)
end
coroutine.wrap(GSMIK_fake_script)()
local function BCCWLVH_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local plr = game.Players.LocalPlayer
	local chat = game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest
	_G.noclip = false
	
	function findplayer(stringg)
		for _, v in pairs(game.Players:GetPlayers()) do
			if stringg:lower() == (v.Name:lower()):sub(1, #stringg) then
				return v
			end
		end
	end
	
	plr.Chatted:Connect(function(msg)
		local args = msg:split(" ")
		local cmd = args[1]
	
		if cmd == ".give" then
			function findgun(stringg)
				for _, v in pairs(game.Workspace.Prison_ITEMS.giver:GetChildren()) do
					if stringg:lower() == (v.Name:lower()):sub(1, #stringg) then
						return v
					end
				end
			end
			local gun = findgun(args[2])
			if gun then
				game.Workspace.Remote.ItemHandler:InvokeServer(gun.ITEMPICKUP)
			end
		elseif cmd == ".changeteam" then
			local arg = args[2]:lower()
			if arg == "inmate" then
				game.Workspace.Remote.TeamEvent:FireServer("Bright orange")
			elseif arg == "gaurd" then
				game.Workspace.Remote.TeamEvent:FireServer("Bright blue")
			elseif arg == "criminal" then
				weld02 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-919.958, 95.327, 2138.189)
				wait(2)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(weld02)
			elseif arg == "neutral" then
				game.Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
			end
		elseif cmd == ".rejoin" then
			game:GetService("TeleportService"):Teleport(game.PlaceId)
		elseif cmd == ".re" then
			game.Workspace.Remote.loadchar:InvokeServer(plr.Name)
		elseif cmd == ".arrest" then
			if args[2]:lower() == "all" then
				for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
					if v ~= plr then
						i = 0
						repeat wait(0.1)
							plr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
							game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
							i = i + 1
						until i == 10
					end
				end
			else
				local i = 0
				local player = findplayer(args[2])
				local pos = plr.Character.HumanoidRootPart.Position
				repeat wait(0.1)
					plr.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
					game.Workspace.Remote.arrest:InvokeServer(player.Character.HumanoidRootPart)
					i = i + 1
				until i == 10
				plr.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
			end
		elseif cmd == ".to" then
			local player = findplayer(args[2])
			plr.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
		elseif cmd == ".noclip" then
			_G.noclip = not _G.noclip
		elseif cmd == ".walkspeed" then
			if args[2] == nil then chat:FireServer("No number found!") end
			plr.Character.Humanoid.WalkSpeed = tonumber(args[2])
		elseif cmd == ".jumppower" then
			if args[2] == nil then chat:FireServer("No number found!") end
			plr.Character.Humanoid.UseJumpPower = true
			plr.Character.Humanoid.JumpPower = tonumber(args[2])
		elseif cmd == ".serverhop" then
			local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
			for i,v in pairs(Servers.data) do
				if v.playing ~= v.maxPlayers then
					game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
				end
			end
		end
	end)
	
	game:GetService("RunService").RenderStepped:Connect(function()
		if _G.noclip then
			plr.Character.Humanoid:ChangeState(11) 
		end
	end)
	
	chat:FireServer("Loaded Atom/Avian's Admin script (Still in development)","all")
	wait(0.1)
	chat:FireServer("Made by Avian 0004","all")
	wait(0.1)
	chat:FireServer("Prefix: .","all")
	
end
coroutine.wrap(BCCWLVH_fake_script)()
