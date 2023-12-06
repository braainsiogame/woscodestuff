local HyperDrive = GetPartFromPort(1, "HyperDrive")
local StarMap = GetPartFromPort(1, "StarMap")
local Disk = GetPartFromPort(1, "Disk")
StarSystems = {}
ShortestDistance = 3423432943294
-- local Telescope = GetPartFromPort(1, "Telescope")
function vectordistance(a, b)
	local Distance = math.sqrt((a.x - b.x)^2 + (a.y - b.y)^2)
	return Distance
end
local function removespaces(str)
    return str:gsub(" ","")
end
	print("Nearby star systems:")
for i, v in StarMap:GetSystems() do 
		print(i)
		local bruh = i:split(",")
		table.insert(StarSystems, i)
end
if Disk:Read("CurrentSystemCoords") == nil then 
	print("Oi ya fucking fungus put it in the keyboard")
else
	for i,v in ipairs(StarSystems) do
	local bruhhh = v:split(",")
	local CurrentTarget = Vector2.new(removespaces(bruhhh[1]), removespaces(bruhhh[2]))
	local br = Disk:Read("CurrentSystemCoords")
	local bruhhhh = br:split(",")
	local CurrentSystem = Vector2.new(removespaces(bruhhhh[1]), removespaces(bruhhhh[2]))
	Disk:Write("CurrentSystemVector", CurrentSystem)
	print(vectordistance(CurrentSystem, CurrentTarget) < ShortestDistance)
	if vectordistance(CurrentSystem, CurrentTarget) < ShortestDistance and vectordistance(CurrentSystem, CurrentTarget) ~= 0 then
		print(vectordistance(CurrentSystem, CurrentTarget))
		print(ShortestDistance)
		ShortestDistance = vectordistance(CurrentSystem, CurrentTarget)
		print("Changed")
		print(ShortestDistance)
		Disk:Write("NearestPos", v)
		print(v)
		print("success")
	else
	print("too long")
	end
	TriggerPort(2)
	end 
end
-- i need to make a better one 
