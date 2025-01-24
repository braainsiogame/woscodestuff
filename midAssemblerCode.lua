local Assemblers = GetParts("Assembler")
local Keyboard = GetPart("Keyboard")
local Disk = GetPart("Disk")
local Assembler = Assemblers[1]
local function awaitLoop()
    local awaiting = coroutine.running()

    local connection
    connection = Microcontroller.Loop:Connect(function()
        connection:Disconnect()
        coroutine.resume(awaiting)
    end)

    return coroutine.yield()
end
local function deepCopy(original)
    local copy = {}
    for key, value in pairs(original) do
        copy[key] = value
    end
    return copy
end
local function BirthdayCake(china, byHowMuch)
	local cake = {}
	local leftover = {}
	for stepNumber, step in pairs(china) do
		local tempTable = {}
		if cake[stepNumber] == nil then cake[stepNumber] = {} end
		for item, amount in pairs(step) do 
			local divAmount = amount/byHowMuch//1
			tempTable[item] = divAmount
			if leftover[item] == nil then 
				leftover[item] = amount % byHowMuch
			else 
				leftover[item] += amount % byHowMuch
			end
		end 
		for i = 1, byHowMuch, 1 do
			table.insert(cake[stepNumber], deepCopy(tempTable))
		end
	end

	for _, tasks in cake do 
		for i, task in tasks do
			for item, amount in task do
				if leftover[item] > 0 then
					leftover[item] += -1
					tasks[i][item] += 1
				end
			end
		end
	end
	return cake
end
local function reverse(tab)
    for i = 1, #tab//2, 1 do
        tab[i], tab[#tab-i+1] = tab[#tab-i+1], tab[i]
    end
    return tab
end
local function distanceFromRaw(item: string)
    local list = {item}
    local count = 0
    while #list ~= 0 do
        for eden, treaty in list do
            if Assembler:GetRecipe(treaty) ~= nil then
                for takanashi, hoshino in Assembler:GetRecipe(treaty) do
                    table.insert(list, takanashi)
                end
            end
            table.remove(list, eden)
        end
        count += 1
    end
    return count - 1
end
local function GetRecipeButBetter(intItem, intAmount)
    local steps = {}
	steps[1] = Assembler:GetRecipe(intItem)
    print(JSONEncode(steps[1]))
    if intAmount == nil then intAmount = 1 end
    if intAmount ~= 1 then 
        for i, v in steps[1] do 
            steps[1][i] = v * intAmount
        end
    end
	local count = 1
    local Finished 
	while not Finished and count < 30 do
        local Finished = true
		if steps[count] == nil then steps[count] = {} end
		if steps[count + 1] == nil then steps[count + 1] = {} end
		for item, amount in steps[count] do
			if Assembler:GetRecipe(item) == nil then
				if steps[count + 1][item] == nil then
					steps[count + 1][item] = amount
				else 
					steps[count + 1][item] += amount
				end
			else 
				for ing, ingAmount in Assembler:GetRecipe(item) do
                    local Finished = false
					if steps[count + 1][ing] == nil then
						steps[count + 1][ing] = amount * ingAmount
					else 
						steps[count + 1][ing] += amount * ingAmount
					end
				end
			end
		end
        count = count + 1
	end
    table.remove(steps, #steps)
    local rawMats = steps[#steps]
    table.remove(steps, #steps)
    for _, v in steps do
          for among, us in v do
            if Assembler:GetRecipe(among) == nil then 
                v[among] = nil
            end
        end
     end
    print(`Raw materials: {JSONEncode(rawMats)}`)
    local steps = reverse(steps)
    local AllSteps = {}
    for i, v in steps do
        for item, amount in steps[i] do
            if AllSteps[item] == nil then 
                AllSteps[item] = amount 
            else 
                AllSteps[item] += amount 
            end
        end
    end
    local distanceList = {}
    for item2, _ in AllSteps do
        local distance = distanceFromRaw(item2)
        distanceList[item2] = distance
    end
    local sortedList = {}
    for i, v in steps do 
        for item, amount in steps[i] do 
            if sortedList[distanceList[item]] == nil then sortedList[distanceList[item]] = {} end
            if sortedList[distanceList[item]][item] == nil then 
                sortedList[distanceList[item]][item] = amount
            else
                sortedList[distanceList[item]][item] += amount
            end
        end 
    end
    local finalList = {}
    local count = 1
    for index, value in pairs(sortedList) do 
        finalList[count] = value
        count += 1 
    end
    finalList[#finalList + 1] = {[intItem] = intAmount}
    print(JSONEncode(finalList))
    return finalList, rawMats, AllSteps
end
local function okCraftThis(item: string, amount: number)
    local steps, rawMats = GetRecipeButBetter(item, amount)
    print(JSONEncode(steps))
    print(JSONEncode(rawMats))
    local rawMatsAvailable = Disk:Read("MaterialListRaw")
    local count = 1
    if rawMats == nil then return false, "wtf" end
    for mats, matAmt in rawMats do
        print(mats)
        print(rawMatsAvailable[mats])
        if rawMatsAvailable[mats] < matAmt then 
            return false, "broke bitch"
         end
    end
    local stepCount = 1
    local tasks = BirthdayCake(steps, #Assemblers)
    local completed = {}
    local started = {}
    started[stepCount] = false
    local Finished = false
    while not Finished and count < 69 do
        if not started[stepCount] then
            print(stepCount)
            started[stepCount] = true
            if completed[stepCount] == nil then completed[stepCount] = {} end
            for i, v in tasks[stepCount] do
                task.spawn(function()
                    local AssignedAssembler = Assemblers[i]
                    for item, amount in v do 
                        for lol = 1, amount do
                            if amount > 0 then
                            AssignedAssembler:Craft(item)
                            v[item] += -1
                            end
                        end
                        --  print(JSONEncode(tasks[stepCount][i]))
                            if v[item] == 0 then v[item] = nil end
                         --   print(v == {} or v == nil)
                            print(v[item])
                            print(JSONEncode(next(v)))
                            print(next(v) == nil)
                            if next(v) == nil then 
                            completed[stepCount][i] = true end
                        --    print(JSONEncode(completed)
                    end
                    print("Finished assembler " .. i)
                end)
            end
        end
        local stillCrafting = true
        while stillCrafting do
            stillCrafting = false 
            for i = 1, #Assemblers do
                --print(JSONEncode(completed))
                --print(JSONEncode(tasks))
                if completed[stepCount][i] ~= true then
                    stillCrafting = true
                    --print("whoopsies!")
                    break
                end
            end
            if not stillCrafting then
                --print("Incrementing")
                stepCount += 1
                completed[stepCount] = {}
                started[stepCount] = false
                stillCrafting = false
            end
            awaitLoop()
        end
        print("steps:")
        print(#steps)
        print("step count:")
        print(stepCount)
        Finished = stepCount > #steps
        count += 1
        print(count)
        print(Finished)
    end
    print("Done!")
end
Keyboard.TextInputted:Connect(function(text, player)
    local text = text:match("^%s*(.-)%s*$")
    local finalText = string.split(text, ", ")
    okCraftThis(finalText[1], finalText[2])
end)
print("Initalized")
print(#Assemblers)
