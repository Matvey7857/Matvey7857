--!strict
-- WeldingMechanic.lua
-- Handles basic welding interactions for players.

local Players = game:GetService("Players")

local WeldingMechanic = {}
WeldingMechanic.__index = WeldingMechanic

-- Creates a welding tool and assigns weld functionality to it.
function WeldingMechanic.new(tool: Tool)
    local self = setmetatable({}, WeldingMechanic)
    self.tool = tool
    self.weldConstraint = Instance.new("WeldConstraint")
    self.weldConstraint.Parent = tool
    self.partA = nil
    return self
end

-- Called when the player activates the tool.
function WeldingMechanic:onActivate(targetPart: BasePart)
    if not self.partA then
        -- Select the first part to weld.
        self.partA = targetPart
        return
    end

    -- Create a weld between the first part and the target part.
    self.weldConstraint.Part0 = self.partA
    self.weldConstraint.Part1 = targetPart
    self.weldConstraint.Parent = self.partA
    self.partA = nil
end

return WeldingMechanic
