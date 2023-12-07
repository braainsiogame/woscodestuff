local Ports = GetPartsFromPort(1, "Port")
for _, port in Ports do
coroutine.resume(coroutine.create(function()
local Reactor = GetPartFromPort(port, "Reactor")
local Polysilicon = GetPartFromPort(port, "Polysilicon")
local Dispenser = GetPartFromPort(port, "Dispenser")
Dispenser:Configure({Filter = "Uranium"})
while task.wait(0.25) do 
	for _, fuel in ipairs(Reactor:GetFuel()) do
		if fuel < 0.5 then 
			Dispenser:Dispense()
			task.wait(0.1)
		if fuel ~= 0 then
			Polysilicon:Configure{PolysiliconMode = 2}
			TriggerPort(port)
		end
		end
	end
if Reactor:GetTemp() > 1150 then 
	Polysilicon:Configure{PolysiliconMode = 0}
else
	Polysilicon:Configure{PolysiliconMode = 1}
end 
TriggerPort(port)
end
end))
end
