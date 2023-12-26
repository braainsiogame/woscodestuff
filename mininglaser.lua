local success, error  = pcall(function()
local Gyro = GetPartFromPort(1, "Gyro")
local MiningLaser = GetPartsFromPort(1, "MiningLaser")
GetPort(1):Connect("Triggered", function(port)
Gyro:Configure({Seek = `Radar {GetPartFromPort(port, "Disk"):Read("ResourceToBeMined")}`})
for i, v in MiningLaser do v:Configure({MaterialToExtract = GetPartFromPort(port, "Disk"):Read("LowestResource")}) end 
end)
end)
if error then 
print("error")
print(error)
else
print("success")
end
