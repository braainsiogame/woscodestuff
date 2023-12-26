local a, b = pcall(function()
local Microphone = GetPartFromPort(1, "Microphone")
local Modem = GetPartFromPort(2, "Modem")
Queue = {}
sentamessage = false
local Webhook = "lol"
while sentamessage == false do
    Modem:RealPostRequest(Webhook, JSONEncode({content = `The microcontroller is working`}), true, function(working, response)
        if working then 
            print("it worked")
			sentamessage = true
            else print("it failed")
        end
        end,
        {["Content-Type"]="application/json"})
print("bruh")
task.wait(1)
end
Microphone:Connect("Chatted", function(player, text)
local TextToSend = JSONEncode({content = `<{player}> {text}`})
table.insert(Queue, TextToSend)
end)
coroutine.resume(coroutine.create(function()
while task.wait(1) do
for i, v in Queue do
if v ~= nil then
print(v)
    Modem:RealPostRequest(Webhook, v, true, function(working, response)
        if working then 
            print("it worked")
            else print("it failed")
        end
        end,
        {["Content-Type"]="application/json"})
end
print(table.concat(Queue, ", "))
Queue[i] = nil
task.wait(5) 
end
end
end))
end)
print(a)
print(b)
