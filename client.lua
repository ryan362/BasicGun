local lp = game.Players.LocalPlayer
local mouse = lp:GetMouse()
local gun = script.Parent

local cooldown = false
local cTime = 0.2

local function pew()
	gun.Handle.PointLight.Enabled = true
	game.ReplicatedStorage.Shot:FireServer(mouse.Hit.Position, gun.Handle)
end

local function shoot()
	if cooldown then
		return	
	end
	
	cooldown = true
	pew()
	
	wait(cTime)
	cooldown = false
	gun.Handle.PointLight.Enabled = false
end

gun.Activated:Connect(function()
	shoot()
end)