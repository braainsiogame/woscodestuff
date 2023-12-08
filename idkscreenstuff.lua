local Screen = nil
Screen:ClearElements()

local mainframe = Screen:CreateElement("Frame", { 
	BackgroundColor3 = Color3.fromHex("#090728"),
	BorderColor3 = Color3.fromHex("#000000"),
	BorderSizePixel = 0,
	Size = UDim2.fromOffset(400, 200)
})

local frame = Screen:CreateElement("Frame", { 
	BackgroundColor3 = Color3.fromHex("#000000"),
	BorderColor3 = Color3.fromHex("#000000"),
	BorderSizePixel = 0,
	Position = UDim2.fromOffset(0, 30),
	Size = UDim2.fromOffset(150, 150),
	ZIndex = 0
})

local planet = Screen:CreateElement("TextLabel", { 
	Text = "",
	TextColor3 = Color3.fromHex("#000000"),
	TextSize = 14,
	BackgroundColor3 = Color3.fromHex("#EDACE9"),
	BorderColor3 = Color3.fromHex("#000000"),
	BorderSizePixel = 0,
	Position = UDim2.fromOffset(50, 50),
	Rotation = 28.3,
	Size = UDim2.fromOffset(70, 70)
})

local ring = Screen:CreateElement("TextLabel", { 
	RichText = true,
	Text = "Set the planet's rotation to be random",
	TextColor3 = Color3.fromHex("#000000"),
	TextSize = 14,
	TextWrapped = true,
	BackgroundColor3 = Color3.fromHex("#5B5D69"),
	BorderColor3 = Color3.fromHex("#000000"),
	BorderSizePixel = 0,
	Position = UDim2.fromScale(-0.2, 0.45),
	Size = UDim2.fromOffset(100, 10)
})

local imageLabel = Screen:CreateElement("ImageLabel", { 
	Image = "http://www.roblox.com/asset/?id=2762577836",
	BackgroundColor3 = Color3.fromHex("#FFFFFF"),
	BorderColor3 = Color3.fromHex("#000000"),
	BorderSizePixel = 0,
	Size = UDim2.fromOffset(170, 170),
	ZIndex = 0
})

local textLabel = Screen:CreateElement("TextLabel", { 
	Text = "Your mother is a gypsy",
	TextColor3 = Color3.fromHex("#DDDDDD"),
	TextSize = 14,
	BackgroundColor3 = Color3.fromHex("#FFFFFF"),
	BackgroundTransparency = 1,
	BorderColor3 = Color3.fromHex("#000000"),
	BorderSizePixel = 0,
	Position = UDim2.fromOffset(50, 0),
	Size = UDim2.fromOffset(80, 30)
})

local screenName = Screen:CreateElement("TextLabel", { 
	RichText = true,
	Text = "System Navigation and Planetery Observation",
	TextColor3 = Color3.fromHex("#000000"),
	TextSize = 14,
	BackgroundColor3 = Color3.fromHex("#FFFFFF"),
	BorderColor3 = Color3.fromHex("#8AF9FF"),
	BorderSizePixel = 5,
	Size = UDim2.fromOffset(400, 30),
	ZIndex = 69
})

local textLabel1 = Screen:CreateElement("TextLabel", { 
	Text = "",
	TextColor3 = Color3.fromHex("#000000"),
	TextSize = 14,
	BackgroundColor3 = Color3.fromHex("#FFFFFF"),
	BorderColor3 = Color3.fromHex("#000000"),
	BorderSizePixel = 0,
	Position = UDim2.fromOffset(170, 35),
	Size = UDim2.fromOffset(10, 290),
	ZIndex = 4
})

local data = Screen:CreateElement("Frame", { 
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#000000"),
	BorderSizePixel = 0,
	Position = UDim2.fromOffset(180, 35),
	Size = UDim2.fromOffset(220, 170)
})

local border = Screen:CreateElement("TextLabel", { 
	Text = "",
	TextColor3 = Color3.fromHex("#000000"),
	TextSize = 14,
	BackgroundColor3 = Color3.fromHex("#FFFFFF"),
	BackgroundTransparency = 0.02,
	BorderColor3 = Color3.fromHex("#000000"),
	BorderSizePixel = 2,
	Position = UDim2.fromOffset(0, 30),
	Size = UDim2.fromOffset(220, 5),
	ZIndex = 0
})

local planetTypeEmojis = Screen:CreateElement("Folder", { 
})

local starter = Screen:CreateElement("TextLabel", { 
	RichText = true,
	Text = "🌎",
	TextColor3 = Color3.fromHex("#000000"),
	TextScaled = true,
	TextSize = 28,
	TextWrapped = true,
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#878787"),
	BorderSizePixel = 0,
	Position = UDim2.fromOffset(157, 0),
	Size = UDim2.fromOffset(28, 28),
	ZIndex = 0
})

local desert = Screen:CreateElement("TextLabel", { 
	RichText = true,
	Text = "🏜️",
	TextColor3 = Color3.fromHex("#000000"),
	TextScaled = true,
	TextSize = 28,
	TextTransparency = 0.8,
	TextWrapped = true,
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#878787"),
	BorderSizePixel = 0,
	Size = UDim2.fromOffset(28, 28),
	ZIndex = 0
})

local exotic = Screen:CreateElement("TextLabel", { 
	RichText = true,
	Text = "⛰️",
	TextColor3 = Color3.fromHex("#000000"),
	TextScaled = true,
	TextSize = 28,
	TextTransparency = 0.8,
	TextWrapped = true,
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#878787"),
	BorderSizePixel = 0,
	Position = UDim2.fromOffset(125, 0),
	Size = UDim2.fromOffset(28, 28),
	ZIndex = 0
})

local forest = Screen:CreateElement("TextLabel", { 
	RichText = true,
	Text = "🌲",
	TextColor3 = Color3.fromHex("#000000"),
	TextScaled = true,
	TextSize = 28,
	TextTransparency = 0.8,
	TextWrapped = true,
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#878787"),
	BorderSizePixel = 0,
	Position = UDim2.fromOffset(31, 0),
	Size = UDim2.fromOffset(28, 28),
	ZIndex = 0
})

local gas = Screen:CreateElement("TextLabel", { 
	RichText = true,
	Text = "🪐",
	TextColor3 = Color3.fromHex("#000000"),
	TextScaled = true,
	TextSize = 28,
	TextTransparency = 0.8,
	TextWrapped = true,
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#878787"),
	BorderSizePixel = 0,
	Position = UDim2.fromOffset(188, 0),
	Size = UDim2.fromOffset(28, 28),
	ZIndex = 0
})

local snowflake = Screen:CreateElement("TextLabel", { 
	RichText = true,
	Text = "❄️",
	TextColor3 = Color3.fromHex("#000000"),
	TextScaled = true,
	TextSize = 28,
	TextTransparency = 0.8,
	TextWrapped = true,
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#878787"),
	BorderSizePixel = 0,
	Position = UDim2.fromOffset(94, 0),
	Size = UDim2.fromOffset(28, 28),
	ZIndex = 0
})

local barren = Screen:CreateElement("TextLabel", { 
	RichText = true,
	Text = "🌑",
	TextColor3 = Color3.fromHex("#000000"),
	TextScaled = true,
	TextSize = 28,
	TextTransparency = 0.8,
	TextWrapped = true,
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#878787"),
	BorderSizePixel = 0,
	Position = UDim2.fromOffset(62, 0),
	Size = UDim2.fromOffset(28, 28),
	ZIndex = 0
})

local temperature = Screen:CreateElement("TextLabel", { 
	Text = "Temperature: TempF",
	TextColor3 = Color3.fromHex("#FFFFFF"),
	TextSize = 14,
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#FFFFFF"),
	BorderSizePixel = 2,
	Position = UDim2.fromOffset(0, 35),
	Size = UDim2.fromOffset(220, 25)
})

local gravity = Screen:CreateElement("TextLabel", { 
	Text = "Gravity:  %g (g = 192.8)",
	TextColor3 = Color3.fromHex("#FFFFFF"),
	TextSize = 14,
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#FFFFFF"),
	BorderSizePixel = 2,
	Position = UDim2.fromOffset(0, 60),
	Size = UDim2.fromOffset(220, 25)
})

local resources = Screen:CreateElement("TextLabel", { 
	Text = "Resources:",
	TextColor3 = Color3.fromHex("#FFFFFF"),
	TextSize = 14,
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#FFFFFF"),
	BorderSizePixel = 2,
	Position = UDim2.fromOffset(0, 87),
	Size = UDim2.fromOffset(90, 76)
})

local scrollingFrame = Screen:CreateElement("ScrollingFrame", { 
	Active = true,
	BackgroundColor3 = Color3.fromHex("#1E0C3E"),
	BorderColor3 = Color3.fromHex("#FFFFFF"),
	BorderSizePixel = 2,
	Position = UDim2.fromOffset(90, 87),
	Size = UDim2.fromOffset(130, 76)
})


mainframe:AddChild(frame)
frame:AddChild(planet)
planet:AddChild(ring)
frame:AddChild(imageLabel)
frame:AddChild(textLabel)

mainframe:AddChild(screenName)

mainframe:AddChild(textLabel1)

mainframe:AddChild(data)
data:AddChild(border)
data:AddChild(planetTypeEmojis)
planetTypeEmojis:AddChild(starter)
planetTypeEmojis:AddChild(desert)
planetTypeEmojis:AddChild(exotic)
planetTypeEmojis:AddChild(forest)
planetTypeEmojis:AddChild(gas)
planetTypeEmojis:AddChild(snowflake)
planetTypeEmojis:AddChild(barren)
data:AddChild(temperature)
data:AddChild(gravity)
data:AddChild(resources)
data:AddChild(scrollingFrame)

