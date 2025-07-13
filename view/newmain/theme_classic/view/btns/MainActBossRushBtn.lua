local var_0_0 = class("MainActBossRushBtn", import(".MainBaseActivityBtn"))

function var_0_0.GetEventName(arg_1_0)
	return "event_series"
end

function var_0_0.GetActivity(arg_2_0)
	local var_2_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BOSSRUSH)

	return (_.detect(var_2_0, function(arg_3_0)
		return not arg_3_0:isEnd()
	end))
end

function var_0_0.GetActivityID(arg_4_0)
	local var_4_0 = arg_4_0:GetActivity()

	return var_4_0 and var_4_0.id
end

function var_0_0.OnInit(arg_5_0)
	setActive(arg_5_0.tipTr.gameObject, false)
end

function var_0_0.CustomOnClick(arg_6_0)
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)
end

return var_0_0
