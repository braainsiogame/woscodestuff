local Screen = GetPartFromPort(1, "Screen")
local Instrument = GetPartFromPort(2, "Instrument")
local power = Screen:CreateElement("TextLabel", { 
    Text = "Power:",
    TextColor3 = Color3.fromHex("#000000"),
    TextSize = 14,
    BackgroundColor3 = Color3.fromHex("#FFFFFF"),
    BorderColor3 = Color3.fromHex("#000000"),
    BorderSizePixel = 0,
    Size = UDim2.fromOffset(200, 50)
})

local powerTotal = Screen:CreateElement("TextLabel", { 
    Text = "bahbahbah",
    TextColor3 = Color3.fromHex("#000000"),
    TextSize = 14,
    BackgroundColor3 = Color3.fromHex("#FFFFFF"),
    BorderColor3 = Color3.fromHex("#000000"),
    BorderSizePixel = 0,
    Position = UDim2.fromOffset(200, 0),
    Size = UDim2.fromOffset(200, 50)
})

local powerChange = Screen:CreateElement("TextLabel", { 
    Text = "Power Change:",
    TextColor3 = Color3.fromHex("#000000"),
    TextSize = 14,
    BackgroundColor3 = Color3.fromHex("#FFFFFF"),
    BorderColor3 = Color3.fromHex("#000000"),
    BorderSizePixel = 0,
    Position = UDim2.fromOffset(0, 50),
    Size = UDim2.fromOffset(200, 50)
})

local no = Screen:CreateElement("TextLabel", { 
    Text = "bahbahbah",
    TextColor3 = Color3.fromHex("#000000"),
    TextSize = 14,
    BackgroundColor3 = Color3.fromHex("#FFFFFF"),
    BorderColor3 = Color3.fromHex("#000000"),
    BorderSizePixel = 0,
    Position = UDim2.fromOffset(200, 50),
    Size = UDim2.fromOffset(200, 50)
})
while true do
local Power = Instrument:GetReading(4)
task.wait(1)
local deltaPower = Instrument:GetReading(4) - Power
no:ChangeProperties({Text = deltaPower})
powerTotal:ChangeProperties({Text = math.floor(Instrument:GetReading(4))})
end
