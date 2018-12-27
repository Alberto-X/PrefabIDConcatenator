--[[
NOTES:
	- 

]]

GLOBAL.ACTIONS.LOOKAT.fn = function(act)
    local targ = act.target or act.invobject

    if targ ~= nil and targ.components.inspectable ~= nil then
        local desc = targ.components.inspectable:GetDescription(act.doer) .. " [" .. targ.prefab .. "]"
        if desc ~= nil then
            if act.doer.components.playercontroller == nil or
                not act.doer.components.playercontroller.directwalking then
                act.doer.components.locomotor:Stop()
            end
            if act.doer.components.talker ~= nil then
                act.doer.components.talker:Say(desc, 2.5, targ.components.inspectable.noanim)
            end
            return true
        end
    end
end