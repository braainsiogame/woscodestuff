local Disk = GetPartFromPort(1, "Disk")
local Bins = GetPartsFromPort(1, "Bin")
Resources = {}
for _, bin in Bins do 
if table.find(Resources, bin) == nil then 
table.insert(Resources, bin)
end
Disk:Write("Resources", resources)
if Disk:Read(bin:GetResource()) == nil then 
Disk:Write(bin:getResource(), bin:GetAmount())
else 
Disk:Write(bin:getResource(), Disk:Read(bin:GetResource()) + bin:GetAmount()
end
end 
