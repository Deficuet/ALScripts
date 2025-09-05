local var_0_0 = class("PreviewTemplatePage", import("view.base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.btnList = arg_1_0:findTF("btn_list", arg_1_0.bg)
end

function var_0_0.OnFirstFlush(arg_2_0)
	arg_2_0:initBtn()
	eachChild(arg_2_0.btnList, function(arg_3_0)
		arg_2_0.btnFuncList[arg_3_0.name](arg_3_0)
	end)
end

function var_0_0.initBtn(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = getProxy(ActivityProxy):getActivityById(arg_5_0)

		if not var_5_0 or var_5_0 and var_5_0:isEnd() then
			return true
		else
			return false
		end
	end

	local var_4_1 = arg_4_0.activity:getConfig("config_client")

	arg_4_0.btnFuncList = {
		task = function(arg_6_0)
			onButton(arg_4_0, arg_6_0, function()
				if var_4_1.taskLinkActID and var_4_0(var_4_1.taskLinkActID) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_4_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
					page = "activity"
				})
			end)
		end,
		academy = function(arg_8_0)
			onButton(arg_4_0, arg_8_0, function()
				arg_4_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.NAVALACADEMYSCENE, {
					page = "activity"
				})
			end)
		end,
		shop = function(arg_10_0)
			onButton(arg_4_0, arg_10_0, function()
				local var_11_0 = var_4_1.shopLinkActID and getProxy(ActivityProxy):getActivitiesById(var_4_1.shopLinkActID) or underscore.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_12_0)
					return not arg_12_0:isEnd()
				end)

				if not var_11_0 or var_11_0:isEnd() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_4_0:emit(ActivityMediator.GO_SHOPS_LAYER, {
					warp = NewShopsScene.TYPE_ACTIVITY,
					actId = var_11_0.id
				})
			end)
		end,
		build = function(arg_13_0)
			onButton(arg_4_0, arg_13_0, function()
				if var_4_1.buildLinkActID and var_4_0(var_4_1.buildLinkActID) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_4_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
					page = BuildShipScene.PAGE_BUILD,
					projectName = BuildShipScene.PROJECTS.ACTIVITY
				})
			end)
		end,
		fight = function(arg_15_0)
			onButton(arg_4_0, arg_15_0, function()
				if var_4_1.fightLinkActID and var_4_0(var_4_1.fightLinkActID) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_4_0:emit(ActivityMediator.BATTLE_OPERA)
			end)
		end,
		lottery = function(arg_17_0)
			onButton(arg_4_0, arg_17_0, function()
				if var_4_1.lotteryLinkActID and var_4_0(var_4_1.lotteryLinkActID) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_4_0:emit(ActivityMediator.GO_LOTTERY)
			end)
		end,
		memory = function(arg_19_0)
			return
		end,
		activity = function(arg_20_0)
			return
		end,
		mountain = function(arg_21_0)
			return
		end,
		skinshop = function(arg_22_0)
			onButton(arg_4_0, arg_22_0, function()
				arg_4_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.SKINSHOP)
			end)
		end
	}
end

return var_0_0
