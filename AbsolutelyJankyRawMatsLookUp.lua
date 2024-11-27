local Assembler = GetPart("Assembler")
local steps = {}
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
	steps[1] = Assembler:GetRecipe(intItem)
    if intAmount == nil then intAmount = 1 end
    if intAmount ~= 1 then 
        for i, v in steps[1] do 
            steps[1][i] = v * intAmount
        end
    end
	local count = 1
	while not Finished and count < 30 do
        Finished = true
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
                    Finished = false
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
    print(JSONEncode(finalList))
    return finalList, rawMats
end
local steps, mats = GetRecipeButBetter("StarMap", 2)

-- this is so wicked
