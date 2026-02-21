local var_0_0 = class("IslandVirtualInteractUnit", import(".IslandInteractUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.attach = "AgoraMainStage/furniture/" .. math.floor(arg_1_2.id / 10) .. "/" .. arg_1_2.config.attach
end

function var_0_0.OnAttach(arg_2_0, arg_2_1)
	var_0_0.super.OnAttach(arg_2_0, arg_2_1)
	arg_2_0.signalReceiver:SetCommonEvent(function(arg_3_0)
		if arg_2_0.ignoreSignal then
			return
		end

		switch(arg_3_0.stringParameter, {
			TimelineEnd = function()
				arg_2_0:Op("AgoraVirtualInterActionEnd", arg_2_0.id, arg_2_0.view.player.id)
			end
		})
	end)
end

function var_0_0.GetTargetRoot(arg_5_0)
	if arg_5_0.attachGo then
		return arg_5_0.attachGo.transform
	else
		arg_5_0.attachGo = GameObject.Find(arg_5_0.attach)

		return arg_5_0.attachGo.transform
	end
end

return var_0_0
