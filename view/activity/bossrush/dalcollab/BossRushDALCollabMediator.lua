local var_0_0 = class("BossRushDALCollabMediator", import("view.base.ContextMediator"))

var_0_0.ON_FLEET_SELECT = "BossRushDALCollabMediator:ON_FLEET_SELECT"
var_0_0.ON_PERFORM_COMBAT = "BossRushDALCollabMediator:ON_PERFORM_COMBAT"
var_0_0.ON_UPGRADE = "BossRushDALCollabMediator:ON_UPGRADE"
var_0_0.GO_SHOPS_LAYER = "BossRushDALCollabMediator:GO_SHOPS_LAYER"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_FLEET_SELECT, function(arg_2_0, arg_2_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = BossRushFleetSelectMediator,
			viewComponent = BossRushDALFleetSelectView,
			data = {
				seriesData = arg_2_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.GO_SHOPS_LAYER, function(arg_3_0, arg_3_1)
		if not getProxy(ActivityProxy):getActivityById(arg_3_1.actId) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, arg_3_1 or {
			warp = NewShopsScene.TYPE_ACTIVITY
		})
	end)

	local var_1_0 = getProxy(ActivityProxy)
	local var_1_1 = var_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB)

	arg_1_0.viewComponent:SetActivity(var_1_1)

	local var_1_2 = var_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF)

	arg_1_0.viewComponent:SetUpgradeActvity(var_1_2)

	local var_1_3 = var_1_1:GetConfigClientPTActivity()

	arg_1_0.viewComponent:SetPTActivity(var_1_3)
	arg_1_0:sendNotification(GAME.COLLABRATE_BOSS_RUSH_REQUEST_DATA, {
		actId = var_1_1.id
	})
	arg_1_0.viewComponent:addbubbleMsgBox(function(arg_4_0)
		if getProxy(ContextProxy):getCurrentContext():getContextByMediator(BossRushTotalRewardPanelMediator) then
			return
		end

		arg_4_0()
	end)
	arg_1_0.viewComponent:addbubbleMsgBox(function(arg_5_0)
		pg.GuildMsgBoxMgr.GetInstance():NotificationForBattle(arg_5_0)
	end)
	arg_1_0:bind(var_0_0.ON_UPGRADE, function(arg_6_0, arg_6_1)
		arg_1_0:sendNotification(GAME.ACTIVITY_OPERATION, arg_6_1)
	end)
end

function var_0_0.listNotificationInterests(arg_7_0)
	return {
		ActivityProxy.ACTIVITY_UPDATED,
		GAME.SUBMIT_TASK_DONE,
		GAME.SUBMIT_ACTIVITY_TASK_DONE,
		GAME.BEGIN_STAGE_DONE,
		BossRushTotalRewardPanelMediator.ON_WILL_EXIT,
		GAME.COLLABRATE_BOSS_RUSH_REQUEST_DATA_DONE
	}
end

function var_0_0.handleNotification(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1:getName()
	local var_8_1 = arg_8_1:getBody()
	local var_8_2 = arg_8_1:getType()

	if var_8_0 == nil then
		-- block empty
	elseif var_8_0 == GAME.BEGIN_STAGE_DONE then
		if not getProxy(ContextProxy):getContextByMediator(BossRushPreCombatMediator) then
			arg_8_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_8_1)
		end
	elseif var_8_0 == ActivityProxy.ACTIVITY_UPDATED then
		local var_8_3 = var_8_1

		if var_8_3 then
			if var_8_3.id == arg_8_0.viewComponent.activity.id then
				arg_8_0.viewComponent:SetActivity(var_8_3)
				arg_8_0.viewComponent:UpdateView()
			end

			if var_8_3:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF then
				arg_8_0.viewComponent.upgradeView:SetData(var_8_3)
				arg_8_0.viewComponent.upgradeView:UpdateView()
			end
		end
	elseif var_8_0 == GAME.SUBMIT_ACTIVITY_TASK_DONE then
		arg_8_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_8_1.awards, function()
			arg_8_0.viewComponent:UpdateTasks(var_8_2)
		end)
	elseif var_8_0 == BossRushTotalRewardPanelMediator.ON_WILL_EXIT then
		arg_8_0.viewComponent:resumeBubble()
		arg_8_0.viewComponent:UpdateView()
	elseif var_8_0 == GAME.COLLABRATE_BOSS_RUSH_REQUEST_DATA_DONE then
		local var_8_4 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB)

		arg_8_0.viewComponent:SetActivity(var_8_4)
		arg_8_0.viewComponent:UpdateView()
	end
end

function var_0_0.remove(arg_10_0)
	return
end

return var_0_0
