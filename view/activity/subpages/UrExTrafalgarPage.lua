local var_0_0 = class("UrExTrafalgarPage", import(".TemplatePage.UrExchangeTemplatePage"))
local var_0_1 = pg.activity_holiday_site

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.icon = arg_1_0:findTF("AD/icon")
	arg_1_0.taskTypeDic = setmetatable({
		[var_0_0.MINI_GAME] = function(arg_2_0, arg_2_1)
			local var_2_0 = arg_2_1[1]
			local var_2_1 = getProxy(MiniGameProxy):GetHubByGameId(var_2_0).count == 0

			local function var_2_2()
				local var_3_0 = getProxy(TaskProxy)
				local var_3_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.HOLIDAY_ACT_ID):getConfig("config_client").function_id
				local var_3_2 = var_0_1[var_3_1[3]].task_id

				if var_3_0:getTaskVO(var_3_2):getTaskStatus() == 2 then
					arg_2_0:emit(ActivityMediator.GO_MINI_GAME, var_2_0)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_minigame_unlock"))
				end
			end

			return var_2_1 and "1/1" or "0/1", not var_2_1 and var_2_2 or nil
		end
	}, {
		__index = arg_1_0.taskTypeDic
	})
end

function var_0_0.OnFirstFlush(arg_4_0)
	var_0_0.super.OnFirstFlush(arg_4_0)
	setActive(arg_4_0._tasksTF, false)
	setActive(arg_4_0.icon, false)
	setActive(arg_4_0._btnHelp, false)
end

function var_0_0.OnUpdateFlush(arg_5_0)
	var_0_0.super.OnUpdateFlush(arg_5_0)
	setGray(arg_5_0._btnExchange, true, true)
end

return var_0_0
