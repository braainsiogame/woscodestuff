local success, response = pcall(function()
local Assembler = GetPartsFromPort(1, "Assembler")
local Bins = GetPartsFromPort(1, "Bin")
local Sign = GetPartFromPort(1, "Sign")
while task.wait(1) do 
local Resource = {}
local LowestResourceAmount = 9999
for _, bin in Bins do
	if table.find(Resource, bin:GetResource()) == nil then 
		table.insert(Resource, Resource[bin:GetResource()])
	end 
	if Resource[bin:GetResource()] == nil and bin:GetResource() ~= "nil" then
		Resource[bin:GetResource()] = bin:GetAmount()
	elseif bin:GetResource() ~= "nil" then 
		Resource[bin:GetResource()] = Resource[bin:GetResource()] + bin:GetAmount()
	end
end
for resource,amount in Resource do
	if amount < LowestResourceAmount then
		LowestResourceAmount = amount
		LowestResource = resource
	end
end 
for _, ass in Assembler do 
	ass:Configure({Assemble = LowestResource})
end 
print(LowestResourceAmount)
Sign:Configure({SignText = `{LowestResource}`})
end
end)
print(success)
print(response)
