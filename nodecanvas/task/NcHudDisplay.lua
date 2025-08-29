local var_0_0 = class("NcHudDisplay", import("..base.NodeCanvasBaseTask"))

function var_0_0.OnExecute(arg_1_0)
	local var_1_0 = arg_1_0:GetBoolArg("show")
	local var_1_1 = arg_1_0:GetAgent().gameObject:GetComponent(typeof(WorldObjectItem)).id

	if var_1_0 then
		local function var_1_2()
			arg_1_0:EndAction()
		end

		local var_1_3 = arg_1_0:GetStringArg("type")
		local var_1_4 = arg_1_0:GetStringArg("height")

		arg_1_0:SendEvent(ISLAND_EVT.SHOW_UNIT_HUD, {
			id = tonumber(var_1_1),
			height = tonumber(var_1_4),
			operationType = tonumber(var_1_3)
		})
	else
		arg_1_0:SendEvent(ISLAND_EVT.HIDE_UNIT_HUD, {
			id = tonumber(var_1_1)
		})
		arg_1_0:EndAction()
	end
end

return var_0_0
