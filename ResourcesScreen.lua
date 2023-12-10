local Bins = GetPartsFromPort(1, "Bin")
local Screen = GetPartFromPort(1, "Screen")
Resource = {}
ScreenObjects = {}
Screen:ClearElements()
for _, bin in Bins do
print("Resource in bin: " .. bin:GetResource())
	if table.find(Resource, bin:GetResource()) == nil then 
		table.insert(Resource, Resource[bin:GetResource()])
	end 
	print(table.concat(Resource, ", "))
	if Resource[bin:GetResource()] == nil and bin:GetResource() ~= "nil" then
		Resource[bin:GetResource()] = bin:GetAmount()
		print("Unassigned:" .. bin:GetResource())
		print(Resource[bin:GetResource()])
	elseif bin:GetResource() ~= "nil" then 
		Resource[bin:GetResource()] = Resource[bin:GetResource()] + bin:GetAmount()
		print("Added:" .. bin:GetResource())
		print(Resource[bin:GetResource()])
	end
end 
local ResourceSign = Screen:CreateElement("TextLabel", {
	Text = "Resource",
	TextSize = 17,
	Font = "SciFi",
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#FFFFFF"),
	TextColor3 = Color3.fromHex("#FFFFFF"),
	BorderSizePixel = 2, 
	Position = UDim2.fromOffset(0, 0),
	Size = UDim2.fromOffset(Screen:GetDimensions().x/2, 50),
})
local ResourceAmountSign = Screen:CreateElement("TextLabel", {
	Text = "Amount",
	TextSize = 17,
	Font = "SciFi",
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#FFFFFF"),
	TextColor3 = Color3.fromHex("#FFFFFF"),
	BorderSizePixel = 2, 
	Position = UDim2.fromOffset(Screen:GetDimensions().x/2, 0),
	Size = UDim2.fromOffset(Screen:GetDimensions().x/2, 50),
})
ScrollingFrame = Screen:CreateElement("ScrollingFrame", {
	Active = true,
	BackgroundColor3 = Color3.fromHex("#1E0C3A"),
	BorderColor3 = Color3.fromHex("#FFFFFF"),
	BorderSizePixel = 2,
	Position = UDim2.fromOffset(0, 50),
	Size = UDim2.fromOffset(Screen:GetDimensions().x, Screen:GetDimensions().y),
	})
i = 0 
for resource, amount in Resource do 
if string.find(resource, "%d") then
print("What the fuck why is it a number")
else
i = i + 1
print("The resource: " .. resource)
print("The amount: " .. amount)
ScreenObjects[resource] = Screen:CreateElement("TextLabel", {
	Text = resource,
	TextSize = 17,
	Font = "SciFi",
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#FFFFFF"),
	TextColor3 = Color3.fromHex("#FFFFFF"),
	BorderSizePixel = 2, 
	Position = UDim2.fromOffset(0, i * 50 - 50),
	Size = UDim2.fromOffset(Screen:GetDimensions().x/2, 50),
})
ScrollingFrame:AddChild(ScreenObjects[resource])
ScreenObjects[resource .. "Amount"] = Screen:CreateElement("TextLabel", {
	Text = amount,
	TextSize = 17,
	Font = "SciFi",
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#FFFFFF"),
	TextColor3 = Color3.fromHex("#FFFFFF"),
	BorderSizePixel = 2, 
	Position = UDim2.fromOffset(Screen:GetDimensions().x/2, i * 50 - 50),
	Size = UDim2.fromOffset(Screen:GetDimensions().x/2, 50),
})
ScrollingFrame:AddChild(ScreenObjects[resource .. "Amount"])
ScreenObjects[resource .. "Index"] = i
end
end
while true do
local Binner = GetPartsFromPort(1, "Bin")
local UpdatedResource = {}
local NewScreenObjects = {}
for _, bin in Binner do
print("Resource in bin: " .. bin:GetResource())
	if table.find(UpdatedResource, bin:GetResource()) == nil and bin:GetResource() ~= "nil" then 
		table.insert(UpdatedResource, UpdatedResource[bin:GetResource()])
	end 
	print(table.concat(UpdatedResource, ", "))
	if UpdatedResource[bin:GetResource()] == nil and bin:GetResource() ~= "nil" then
		UpdatedResource[bin:GetResource()] = bin:GetAmount()
		print("Unassigned:" .. bin:GetResource())
		print(UpdatedResource[bin:GetResource()])
	elseif bin:GetResource() ~= "nil" then
		UpdatedResource[bin:GetResource()] = UpdatedResource[bin:GetResource()] + bin:GetAmount()
		print("Added:" .. bin:GetResource())
		print(UpdatedResource[bin:GetResource()])
	end
end 
for resource, amount in UpdatedResource do
print("There are " .. amount .. " in " .. resource)
if UpdatedResource[resource] ~= Resource[resource] then
i = i + 1
if UpdatedResource[resource] == nil then
Resource[resource .. "Amount"]:Destroy()
Resource[resource]:Destroy()
end
if Resource[resource] ~= nil and ScreenObjects[resource] ~= nil then
print(ScreenObjects[resource .. "Index"])
ScreenObjects[resource]:ChangeProperties({Text = resource})
ScreenObjects[resource .. "Amount"]:ChangeProperties({Text = amount})
else
NewScreenObjects[resource] = Screen:CreateElement("TextLabel", {
	Text = resource,
	TextSize = 17,
	Font = "SciFi",
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#FFFFFF"),
	TextColor3 = Color3.fromHex("#FFFFFF"),
	BorderSizePixel = 2, 
	Position = UDim2.fromOffset(0, i * 50 - 50),
	Size = UDim2.fromOffset(Screen:GetDimensions().x/2, 50),
})
NewScreenObjects[resource .. "Amount"] = Screen:CreateElement("TextLabel", {
	Text = amount,
	TextSize = 17,
	Font = "SciFi",
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#FFFFFF"),
	TextColor3 = Color3.fromHex("#FFFFFF"),
	BorderSizePixel = 2, 
	Position = UDim2.fromOffset(Screen:GetDimensions().x/2, i * 50 - 50),
	Size = UDim2.fromOffset(Screen:GetDimensions().x/2, 50),
})
ScrollingFrame:AddChild(NewScreenObjects[resource .. "Amount"])
ScrollingFrame:AddChild(NewScreenObjects[resource])
end
Resource[resource] = UpdatedResource[resource]
else
print("Bals")
end 
end
task.wait(1)
end
