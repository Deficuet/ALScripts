local var_0_0 = class("MainActMapBtn", import(".MainBaseActivityBtn"))

function var_0_0.GetEventName(arg_1_0)
	return "event_map"
end

function var_0_0.GetActivity(arg_2_0)
	if arg_2_0.config and arg_2_0.config.time and arg_2_0.config.time[1] == "default" then
		local var_2_0 = arg_2_0.config.time[2]
		local var_2_1 = getProxy(ActivityProxy):getActivityById(var_2_0)

		if var_2_1 and not var_2_1:isEnd() then
			return var_2_1
		end
	end

	return nil
end

function var_0_0.GetActivityID(arg_3_0)
	local var_3_0 = arg_3_0:GetActivity()

	return var_3_0 and var_3_0.id
end

function var_0_0.OnInit(arg_4_0)
	setActive(arg_4_0.tipTr.gameObject, arg_4_0:IsShowTip())
end

function var_0_0.IsShowTip(arg_5_0)
	local var_5_0 = arg_5_0:GetActivityID()

	if var_5_0 == ActivityConst.OTHER_WORLD_TERMINAL_BATTLE_ID then
		return OtherworldMapScene.IsShowTip()
	end

	return getProxy(ChapterProxy):IsActivitySPChapterActive(var_5_0) and SettingsProxy.IsShowActivityMapSPTip()
end

function var_0_0.CustomOnClick(arg_6_0)
	local var_6_0 = arg_6_0:GetActivity()

	if var_6_0 then
		local var_6_1 = var_6_0:getConfig("type")

		if var_6_1 == ActivityConst.ACTIVITY_TYPE_BOSSRUSH then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)
		elseif var_6_1 == ActivityConst.ACTIVITY_TYPE_ZPROJECT then
			arg_6_0:emit(NewMainMediator.SKIP_ACTIVITY_MAP, var_6_0.id)
		end
	end
end

return var_0_0
