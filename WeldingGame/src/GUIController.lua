--!strict
-- GUIController.lua
-- Controls the UI for displaying tasks to the player.

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local TaskManager = require(script.Parent.TaskManager)

local GUIController = {}
GUIController.__index = GUIController

function GUIController.new(screenGui: ScreenGui)
    local self = setmetatable({}, GUIController)
    self.screenGui = screenGui
    self.taskLabel = screenGui:FindFirstChild("TaskLabel")
    self.taskManager = TaskManager.new()
    return self
end

function GUIController:showTask()
    if self.taskLabel then
        self.taskLabel.Text = self.taskManager:refreshTask()
    end
end

function GUIController:start()
    self:showTask()
    -- Refresh the task every 10 seconds
    while true do
        wait(10)
        self:showTask()
    end
end

return GUIController
