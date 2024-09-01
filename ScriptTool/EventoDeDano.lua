game.ReplicatedStorage.CombatHit.OnServerEvent:Connect(function(plr)
	
	local hitbox = Instance.new("Part", game.workspace)
	local debris = game:GetService("Debris")
	local flash = game.ReplicatedStorage.redflash:Clone()
	local soundhit = game.ReplicatedStorage.soundhit:Clone()
	hitbox.Transparency = 1
	hitbox.CanCollide = false
	hitbox.Anchored = true
	hitbox.Size = Vector3.new(5, 5, 5)
	hitbox:PivotTo(plr.Character.HumanoidRootPart.CFrame *CFrame.new(0,0,-5))
	debris:AddItem(hitbox, 0.3)
	
	local HITS = {}
	hitbox.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= plr.Name then
			print(HITS)
		   if not hit.Parent.Humanoid:FindFirstChild(plr.Name) then
				if HITS[hit.Parent] then return end
				print(HITS)
				HITS[hit.Parent] = true
				print(HITS)
				hit.Parent:FindFirstChild("Humanoid"):TakeDamage(20)
				flash.Parent = hitbox
				soundhit.Parent = hitbox
				soundhit.PlaybackSpeed = 1.8
				soundhit:Play()
				print(HITS[hit.Parent.Name])
				wait(3)
				HITS[hit.Parent] = false
				
		   end
			
			
		end
	end)
end)
