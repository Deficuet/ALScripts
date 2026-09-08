local var_0_0 = class("MainUrgencySceneSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	local var_1_0 = {
		"SkipToActivity",
		"SkipToTechnology"
	}

	arg_1_0:NextOne(1, var_1_0, arg_1_1)
end

function var_0_0.NextOne(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = arg_2_0[arg_2_2[arg_2_1]](arg_2_0)

	if not var_2_0 then
		return
	end

	if var_2_0 and arg_2_1 < #arg_2_2 then
		arg_2_0:NextOne(arg_2_1 + 1, arg_2_2, arg_2_3)
	else
		arg_2_3()
	end
end

function var_0_0.SkipToActivity(arg_3_0)
	if getProxy(ActivityProxy):findNextAutoActivity() then
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)

		return false
	end

	return true
end

function var_0_0.SkipToTechnology(arg_4_0)
	local var_4_0 = getProxy(PlayerProxy):getRawData().level

	if not LOCK_TECHNOLOGY and pg.SystemOpenMgr.GetInstance():isOpenSystem(var_4_0, "TechnologyMediator") and not pg.NewStoryMgr.GetInstance():IsPlayed("FANGAN1") then
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SELTECHNOLOGY)
		pg.NewStoryMgr.GetInstance():Play("FANGAN1", function()
			return
		end, true)

		return false
	end

	return true
end

return var_0_0
