local success, response = pcall(function()
local Disk = GetPartFromPort(1, "Disk")
print(Disk)
local Bins = GetPartsFromPort(1, "Bin")
local Sign = GetPartFromPort(1, "Sign")
local MineableResources = {"Iron", "Copper", "Stone", "Silicon", "Sulfur", "Quartz", "Flint", "Ruby", "Ice", "Titanium", "Diamond", "Uranium", "Aluminum", "Beryllium"}
local StoneResources = {"Stone", "Silicon", "Sulfur", "Quartz", "Flint", "Ruby", "Ice"}
while task.wait(1) do 
Disk:ClearDisk()
local Resource = {}
local LowestResourceAmount = 9999
for _, bin in Bins do
if table.find(MineableResources, bin:GetResource()) ~= nil then
	if table.find(Resource, bin:GetResource()) == nil then 
		table.insert(Resource, Resource[bin:GetResource()])
	end 
	if Resource[bin:GetResource()] == nil and bin:GetResource() ~= "nil" then
		Resource[bin:GetResource()] = bin:GetAmount()
	elseif bin:GetResource() ~= "nil" then 
		Resource[bin:GetResource()] = Resource[bin:GetResource()] + bin:GetAmount()
	end
end
end
for resource,amount in Resource do
	if amount < LowestResourceAmount and table.find(MineableResources, resource) ~= nil then
		LowestResourceAmount = amount
		LowestResource = resource
	end
end 
	if table.find(StoneResources, LowestResource) == nil then
		Disk:Write("ResourceToBeMined", LowestResource .. "Deposit")
		Disk:Write("LowestResource", LowestResource)
	else
		Disk:Write("ResourceToBeMined", "Marble")
		Disk:Write("LowestResource", LowestResource)
	end
print(LowestResourceAmount)
TriggerPort(1)
Sign:Configure({SignText = `{LowestResource}`})
task.wait(2)
end
end)
print(success)
print(response)
