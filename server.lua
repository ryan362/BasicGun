game.ReplicatedStorage.Shot.OnServerEvent:Connect(function(plr, loc, handle)
	if plr.Character == nil then return end
	local damage = handle:GetAttribute('damage')
	local range = handle:GetAttribute('range')
	
	handle.Sound:Play()
	
	local beam = Instance.new('Part', workspace)
	beam.BrickColor = BrickColor.new("New Yeller")
	beam.Transparency = 0.25
	beam.Material = "Neon"
	beam.Anchored = true
	beam.CanCollide = false
	
	local dist = (handle.Position - loc).magnitude
	beam.Size = Vector3.new(0.1, 0.1, dist)
	beam.CFrame = CFrame.new(handle.Position, loc) * CFrame.new(0, 0, -dist/2)
	
	game.Debris:AddItem(beam, 0.1)
	
	local ray = RaycastParams.new()
	local rayDir = (loc - handle.Position) * range
	
	ray.FilterDescendantsInstances = {plr.Character}
	
	local res = workspace:Raycast(handle.Position, rayDir, ray)
	
	if res then
		if res.Instance then
			if res.Instance.Parent:FindFirstChild('Humanoid') then
				if res.Instance.Name == 'Head' then
					res.Instance.Parent.Humanoid.Health -= (damage*2)
				else
					res.Instance.Parent.Humanoid.Health -= damage
				end
			end
		end
	end
end)