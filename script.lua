 local player = game.Players.LocalPlayer
local chr = player.Character
local hdr = chr.HumanoidRootPart

print(hdr)

--gui 
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("LM GUI", "DarkTheme")

local Tab = Window:NewTab("About")



local MainSection = Tab:NewSection("Owner")

MainSection:NewButton("Change speed to 100", "Change speed", function()
    
    
   
 while(true) do
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
   wait()
   end


end)

MainSection:NewButton("Keycard", "get", function()
local plrUtils = game:GetService("ReplicatedStorage").Game.PlayerUtils
local oldHasKey = require(plrUtils).hasKey
require(plrUtils).hasKey = function()
return true
end
end)

local function Nocl(state)
	if state then
		for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA('BasePart') and v.CanCollide then
				v.CanCollide = false
			end
		end
	else
		for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA('BasePart') and not v.CanCollide then
				v.CanCollide = true
			end
		end
	end
end

local Noclip = nil
MainSection:NewToggle("Noclip", "ToggleInfo", function(state)
	if state then
		spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)
	else
		if Noclip then
			Noclip:Disconnect()
			Noclip = nil
			Nocl(false)
		end
	end
end)

MainSection:NewButton("Tp to base criminal", "autorob", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(239.09440612793, 18.738416671753, 1179.3385009766)
wait(0.1)
local ggg;
ggg = game.Players.LocalPlayer.Character.HumanoidRootPart:GetPropertyChangedSignal("CFrame"):connect(function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(239.09440612793, 18.738416671753, 1179.3385009766)
    wait(1)
    ggg:Disconnect()
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(252.56745910645, 18.565673828125, 1185.0828857422)
end)

end)


getgenv().Toggled = true -- Set to true or false

getgenv().old = getgenv().old or require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList

if getgenv().Toggled then
    require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList = function(...)
        local nearestDistance, nearestEnemy = 600, nil
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Team ~= game:GetService("Players").LocalPlayer.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                if (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < nearestDistance then
                    nearestDistance, nearestEnemy = (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude, v
                end
            end
        end
        local arg = { getgenv().old(...) }
        if (tostring(getfenv(2).script) == "BulletEmitter" or tostring(getfenv(2).script) == "Taser") and nearestEnemy then
            arg[1] = nearestEnemy.Character.HumanoidRootPart
            arg[2] = nearestEnemy.Character.HumanoidRootPart.Position
        end
        return unpack(arg)
    end
else
    require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList = getgenv().old
end

local toggle = MainSection:NewToggle("Aim", "Info", function(state)
    getgenv().Toggled = state
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Toggled then
        toggle:UpdateToggle("Toggle On")
    else
        toggle:UpdateToggle("Toggle Off")
    end
end)

MainSection:NewButton("Fly", "fle", function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
end)

    --LOCAL PLAYER
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Player")

    PlayerSection:NewSlider("Walkspeed", "SPEED!!", 500, 16, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)

    PlayerSection:NewSlider("Jumppower", "JUMP HIGH!!", 350, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)

    PlayerSection:NewButton("Reset WS/JP", "Resets to all defaults", function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end)
    PlayerSection:NewButton("Rejoin", "Rejoin in the game", function()
       local ts = game:GetService("TeleportService")
       local p = game:GetService("Players").LocalPlayer
       ts:Teleport(game.PlaceId, p)
   end)
   PlayerSection:NewButton("Auto rob", "autorob", function()
   --loadstring(game:HttpGet("https://projectevo.xyz/v4/script.lua", true))();
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/5d4b0843f800d5dcac07568e18190b7e.lua"))()
  
  
  end)
   
 local Other = Window:NewTab("Other")
local OtherSection = Other:NewSection("Others")

OtherSection:NewToggle("Weapons Instant Reload", "Weapons", function(enabled)
    if enabled == true then
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.ReloadTime = 0
        end
    else
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
            local gun = require(v)
            gun.ReloadTime = 1
        end
    end
end)

OtherSection:NewButton("Get them","Get Weapons", function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("ClickDetector") then
            fireclickdetector(v)
        end
    end
end)

OtherSection:NewButton("Get ak47", "Read", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local modelName = "AK47"

local function giveModelToLocalPlayer(model)
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local clone = model:Clone()
    clone.Parent = backpack
end

local itemsFolder = workspace:FindFirstChild("Items")
if itemsFolder then
    local model = itemsFolder:FindFirstChild(modelName)
    if model then
        giveModelToLocalPlayer(model)
        print("Gave model", modelName, "to local player")
    else
        print("Model", modelName, "not found in the Items folder")
    end
else
    print("Items folder not found in the workspace")
end


end)
local Vehicles = {
    CarHeight = 2,
    CarSpeed = 20,
    TurnSpeed = 1,
    InfNitro = false,
    AntiTirePop = false;
}

local mouse = game:GetService('Players').LocalPlayer:GetMouse()
local function hotkeyHandler(key)
    if (key == 'q') then
        if Vehicles.InfNitro == true then
            for _, v in next, getgc(true) do
                if (type(v) == 'table' and rawget(v, 'Nitro')) then
                    v.Nitro = 250
                end
            end
        end
    end
end
  
mouse.KeyDown:connect(hotkeyHandler)

   local Car = Window:NewTab("Car")
    local CarSection = Car:NewSection("Car Cheats")
    CarSection:NewSlider("Car Height","Height", 500,0, function(a)
    Vehicles.CarHeight = a
end)

CarSection:NewSlider("Car Speed","Speed" ,500,0, function(a)
    Vehicles.CarSpeed = a
end)

CarSection:NewSlider("Turn Speed","Speed", 20,0 ,function(a)
    Vehicles.TurnSpeed = a
end)

CarSection:NewSlider("Inf Nitro", "Nitro", function(a)
    Vehicles.InfNitro = aw
end)
CarSection:NewToggle("Anti Tire Pop", function(a)
    Vehicles.AntiTirePop = a
end)
local Cell = Window:NewTab("Cell")



local CellSection = Cell:NewSection("Optinos")
  
    CellSection:NewToggle("No cell", "No cell time", function(a)
    if a then
        engine.OtherValues.Time.Cell = 0
    else
        engine.OtherValues.Time.Cell = 20
    end
end)

CellSection:NewToggle("No tazer","No Tazer", function(a)
    if a then
        engine.OtherValues.Time.Stunned = 0
    else
        engine.OtherValues.Time.Stunned = 2.5
    end
end)
