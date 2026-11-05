local var_0_0 = class("IslandVirtualInteractUnit", import(".IslandInteractUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	local function var_1_0()
		return math.floor(arg_1_0.id / 10)
	end

	arg_1_0.attach = "AgoraMainStage/furniture/" .. var_1_0() .. "/" .. arg_1_2.config.attach
end

function var_0_0.OnAttach(arg_3_0, arg_3_1)
	var_0_0.super.OnAttach(arg_3_0, arg_3_1)
	arg_3_0.signalReceiver:SetCommonEvent(function(arg_4_0)
		if arg_3_0.ignoreSignal then
			return
		end

		switch(arg_4_0.stringParameter, {
			TimelineEnd = function()
				arg_3_0:Op("AgoraVirtualInterActionEnd", arg_3_0.id, arg_3_0.view.player.id)
			end
		})
	end)
end

function var_0_0.GetTargetRoot(arg_6_0)
	if arg_6_0.attachGo then
		return arg_6_0.attachGo.transform
	else
		arg_6_0.attachGo = GameObject.Find(arg_6_0.attach)

		return arg_6_0.attachGo.transform
	end
end

function var_0_0.GetPlayerParent(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.data:GetPlayerParentPath(arg_7_1)

	if var_7_0 == nil then
		return arg_7_0:GetTargetRoot()
	else
		local var_7_1 = arg_7_0:GetTargetRoot():Find(var_7_0)

		assert(var_7_1, "can't find player parent with path: " .. var_7_0)

		return var_7_1
	end
end

return var_0_0
