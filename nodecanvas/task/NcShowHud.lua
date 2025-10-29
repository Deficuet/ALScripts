local var_0_0 = class("NcShowHud", import("..base.NodeCanvasBaseTask"))

function var_0_0.OnExecute(arg_1_0)
	local var_1_0 = arg_1_0:GetAgent().gameObject:GetComponent(typeof(WorldObjectItem))
	local var_1_1 = arg_1_0:GetAgent().transform
	local var_1_2 = var_1_0.id
	local var_1_3 = var_1_0.type
	local var_1_4 = arg_1_0:GetBoolArg("show")
	local var_1_5 = arg_1_0:GetStringArg("viewLuaName")

	if var_1_4 then
		local var_1_6 = arg_1_0:GetStringArg("uiLuaName")
		local var_1_7 = arg_1_0:GetStringArg("positionX")
		local var_1_8 = arg_1_0:GetStringArg("positionY")
		local var_1_9 = arg_1_0:GetStringArg("param1")
		local var_1_10 = arg_1_0:GetStringArg("param2")
		local var_1_11 = arg_1_0:GetStringArg("param3")

		arg_1_0:SendEvent(ISLAND_EVT.SHOW_HUD, {
			id = tonumber(var_1_2),
			type = tonumber(var_1_3),
			unitTransform = var_1_1,
			viewLuaName = var_1_5,
			uiLuaName = var_1_6,
			positionX = tonumber(var_1_7),
			positionY = tonumber(var_1_8),
			param1 = var_1_9,
			param2 = var_1_10,
			param3 = var_1_11
		})
	else
		arg_1_0:SendEvent(ISLAND_EVT.HIDE_HUD, {
			id = tonumber(var_1_2),
			type = tonumber(var_1_3),
			viewLuaName = var_1_5
		})
	end

	arg_1_0:EndAction()
end

return var_0_0
