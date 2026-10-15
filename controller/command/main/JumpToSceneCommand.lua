local var_0_0 = class("JumpToSceneCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0[1]
	local var_1_2 = var_1_0[2]

	switch(var_1_1, {
		[SCENE.CORE_ACTIVITY] = function()
			arg_1_0:JumpToCoreActivity(var_1_1, var_1_2)
		end
	}, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, var_1_1, var_1_2)
	end)
end

function var_0_0.JumpToCoreActivity(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_2.id

	if var_4_0 and not getProxy(ActivityProxy):IsActivityNotEnd(var_4_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_end_tip"))

		return
	end

	arg_4_0:sendNotification(GAME.GO_SCENE, arg_4_1, arg_4_2)
end

return var_0_0
