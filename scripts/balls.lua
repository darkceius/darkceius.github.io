-- change to the rgb of ur shirt or torso if naked

local shirtColor = Color3.fromRGB(1,1,1)

-- shutcho ass up

local char = owner.Character
local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
local moving = true 

function newBall(mainCF)
local ball = Instance.new("Part")
ball.Size = Vector3.new(1,1,1)*1.1
ball.CanCollide = false
ball.Shape = "Ball"
ball.Color = shirtColor
ball.Material = "Plastic"

local weld = Instance.new("Motor6D")
weld.Parent = ball
weld.Part0 = ball
weld.Part1 = torso
weld.C0 = mainCF

ball.Parent = torso

task.spawn(function()
while wait() do
if not moving then
weld.C0 = weld.C0:Lerp(mainCF,.2)
continue
end
local sin = math.sin((tick()*4)%(math.pi*2))
weld.C0 = weld.C0:Lerp(mainCF * CFrame.new(0, sin/7, sin/17),0.2) --* CFrame.Angles(math.clamp(sin, -1, 1)/10,0,0),0.2)
end
end)
end

task.spawn(function()
while wait() do
moving = char.Humanoid.MoveDirection.Magnitude > 0
end
end)
local up = torso.Name == "Torso" and -.25 or -.1
newBall(CFrame.new(.4,up,.22))
newBall(CFrame.new(-.4,up,.22))
