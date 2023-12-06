local Disk = GetPartFromPort(1, "Disk")
local Bins = GetPartsFromPort(1, "Bin")
Resources = {}
Disk:ClearDisk()
for _, bin in Bins do
if table.find(Resources, bin:GetResource()) == nil and bin:GetResource() ~= nil then 
table.insert(Resources, bin:GetResource())
end
Disk:Write("Resources", Resources)
if Disk:Read(bin:GetResource()) == nil and bin:GetResource() ~= nil then 
Disk:Write(bin:GetResource(), bin:GetAmount())
else
Disk:Write(bin:GetResource(), Disk:Read(bin:GetResource()) + bin:GetAmount())
end 
end
for i, resource in Disk:Read("Resources") do 
print("There are " .. Disk:Read(resource) .. " in " .. resource)
end
