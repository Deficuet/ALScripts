local var_0_0 = class("MainTipActivityRemasterSequence")

var_0_0.isTip = false

function var_0_0.Execute(arg_1_0, arg_1_1)
	if var_0_0.isTip then
		arg_1_1()

		return
	end

	if not getProxy(ActivityRemasterProxy):ShouldShowActiveBtn() then
		arg_1_1()

		return
	end

	arg_1_0:ShowTips(arg_1_1)
end

function var_0_0.ShowTips(arg_2_0, arg_2_1)
	var_0_0.isTip = true

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACTREMASTE)
end

return var_0_0
