local plr = game.Players.LocalPlayer
local chat = game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest
local noclip = false

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
            wait(0.075)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(weld02)
        end
    elseif cmd == ".rejoin" then
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    elseif cmd == ".re" then
        game.Workspace.Remote.loadchar:InvokeServer(plr.Name)
    elseif cmd == ".arrest" then
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
end)

chat:FireServer("Loaded Atom/Avian's Admin script (Still in development)","all")
wait(0.01)
chat:FireServer("Made by Avian 0004","all")
wait(0.01)
chat:FireServer("Prefix: .","all")
