--!strict
-- TaskManager.lua
-- Handles the creation and updating of welding tasks.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local tasks = {
    "Weld two blocks together",
    "Connect three blocks in a chain",
    "Create a vertical column of blocks",
}

local TaskManager = {}
TaskManager.__index = TaskManager

function TaskManager.new()
    local self = setmetatable({}, TaskManager)
    self.currentTask = nil
    return self
end

-- Randomly selects a new task.
function TaskManager:refreshTask()
    self.currentTask = tasks[math.random(1, #tasks)]
    return self.currentTask
end

return TaskManager
