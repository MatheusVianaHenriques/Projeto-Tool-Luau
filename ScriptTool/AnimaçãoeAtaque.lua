--Script de uma arma/objeto
--variaveis
local tool = script.Parent
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid.Animator
local combatHit = game.ReplicatedStorage.CombatHit--Evento remoto
local debounce = false--cooldown

local equip = animator:LoadAnimation(script:WaitForChild("equip"))--animação de equipar
local swing = animator:LoadAnimation(script:WaitForChild("swing"))--animação de ataque

--evento
tool.Equipped:Connect(function()
	equip:Play()
end)

tool.Activated:Connect(function()
	if debounce == true then return end
	debounce = true
	combatHit:FireServer()--Evento remoto que ira ser utilizado para fazer o sistema de dano
	swing:Play()
	wait(1)
	debounce = false
end)


