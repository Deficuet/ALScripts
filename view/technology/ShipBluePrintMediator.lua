local var_0_0 = class("ShipBluePrintMediator", import("..base.ContextMediator"))

var_0_0.ON_CLICK_SPEEDUP_BTN = "ShipBluePrintMediator:ON_CLICK_SPEEDUP_BTN"
var_0_0.ON_START = "ShipBluePrintMediator:ON_START"
var_0_0.ON_FINISHED = "ShipBluePrintMediator:ON_FINISHED"
var_0_0.ON_ITEM_UNLOCK = "ShipBluePrintMediator:ON_ITEM_UNLOCK"
var_0_0.ON_FINISH_TASK = "ShipBluePrintMediator:ON_FINISH_TASK"
var_0_0.ON_MOD = "ShipBluePrintMediator:ON_MOD"
var_0_0.ON_PURSUING = "ShipBluePrintMediator:ON_PURSUING"
var_0_0.ON_TASK_OPEN = "ShipBluePrintMediator:ON_TASK_OPEN"
var_0_0.ON_CHECK_TAKES = "ShipBluePrintMediator:ON_CHECK_TAKES"
var_0_0.SHOW_SKILL_INFO = "ShipBluePrintMediator:SHOW_SKILL_INFO"
var_0_0.SET_TECHNOLOGY_VERSION = "ShipBluePrintMediator:SET_TECHNOLOGY_VERSION"
var_0_0.SIMULATION_BATTLE = "ShipBluePrintMediator:SIMULATION_BATTLE"
var_0_0.QUICK_EXCHAGE_BLUEPRINT = "ShipBluePrintMediator:QUICK_EXCHAGE_BLUEPRINT"
var_0_0.FINISH_PHANTOM_QUEST = "ShipBluePrintMediator.FINISH_PHANTOM_QUEST"
var_0_0.OPEN_PHANTOM_LAYER = "ShipBluePrintMediator.OPEN_PHANTOM_LAYER"

function var_0_0.register(arg_1_0)
	PlayerPrefs.SetString("technology_day_mark", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d", true))

	local var_1_0 = getProxy(TechnologyProxy)

	if arg_1_0.contextData.shipId then
		local var_1_1 = getProxy(BayProxy):getShipById(arg_1_0.contextData.shipId)
		local var_1_2 = var_1_0:getBluePrintById(var_1_1.groupId)

		arg_1_0.contextData.shipBluePrintVO = var_1_2
	elseif arg_1_0.contextData.shipGroupId then
		local var_1_3 = var_1_0:getBluePrintById(arg_1_0.contextData.shipGroupId)

		arg_1_0.contextData.shipBluePrintVO = var_1_3
	end

	arg_1_0:bind(var_0_0.ON_CLICK_SPEEDUP_BTN, function()
		arg_1_0:addSubLayers(Context.New({
			viewComponent = TecSpeedUpLayer,
			mediator = TecSpeedUpMediator
		}))
	end)
	arg_1_0:bind(var_0_0.ON_START, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.BUILD_SHIP_BLUEPRINT, {
			id = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_FINISHED, function(arg_4_0, arg_4_1)
		arg_1_0:sendNotification(GAME.FINISH_SHIP_BLUEPRINT, {
			id = arg_4_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_ITEM_UNLOCK, function(arg_5_0, arg_5_1, arg_5_2)
		arg_1_0:sendNotification(GAME.ITEM_LOCK_SHIP_BLUPRINT, {
			id = arg_5_1,
			itemId = arg_5_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_FINISH_TASK, function(arg_6_0, arg_6_1)
		local var_6_0 = Task.New({
			id = arg_6_1
		})

		if var_6_0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			local var_6_1 = getDropInfo({
				{
					DROP_TYPE_ITEM,
					tonumber(var_6_0:getConfig("target_id")),
					var_6_0:getConfig("target_num")
				}
			})

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("blueprint_commit_tip", var_6_1),
				onYes = function()
					arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_6_1)
				end
			})
		elseif var_6_0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
			local var_6_2 = getDropInfo({
				{
					DROP_TYPE_RESOURCE,
					tonumber(var_6_0:getConfig("target_id")),
					var_6_0:getConfig("target_num")
				}
			})

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("blueprint_commit_tip", var_6_2),
				onYes = function()
					arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_6_1)
				end
			})
		else
			arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_6_1)
		end
	end)
	arg_1_0:bind(var_0_0.ON_MOD, function(arg_9_0, arg_9_1, arg_9_2)
		arg_1_0:sendNotification(GAME.MOD_BLUEPRINT, {
			id = arg_9_1,
			count = arg_9_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_PURSUING, function(arg_10_0, arg_10_1, arg_10_2)
		arg_1_0:sendNotification(GAME.PURSUING_BLUEPRINT, {
			id = arg_10_1,
			count = arg_10_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_TASK_OPEN, function(arg_11_0, arg_11_1)
		if not getProxy(TaskProxy):isFinishPrevTasks(arg_11_1) then
			return
		end

		arg_1_0:sendNotification(GAME.TRIGGER_TASK, arg_11_1)
	end)
	arg_1_0:bind(var_0_0.ON_CHECK_TAKES, function(arg_12_0, arg_12_1)
		local var_12_0 = getProxy(TechnologyProxy)
		local var_12_1 = var_12_0:getBluePrintById(arg_12_1)

		if var_12_1:isFinishedAllTasks() then
			var_12_1:finish()
			var_12_0:updateBluePrint(var_12_1)
		end
	end)
	arg_1_0:bind(var_0_0.SHOW_SKILL_INFO, function(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
		arg_1_0:addSubLayers(Context.New({
			mediator = SkillInfoMediator,
			viewComponent = SkillInfoLayer,
			data = {
				skillOnShip = arg_13_2,
				skillId = arg_13_1,
				onExit = arg_13_3
			}
		}))
	end)
	arg_1_0:bind(var_0_0.SET_TECHNOLOGY_VERSION, function(arg_14_0, arg_14_1)
		var_1_0:setVersion(arg_14_1)
	end)
	arg_1_0:bind(var_0_0.SIMULATION_BATTLE, function(arg_15_0, arg_15_1)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_SIMULATION,
			stageId = arg_15_1
		})
	end)
	arg_1_0:bind(var_0_0.QUICK_EXCHAGE_BLUEPRINT, function(arg_16_0, arg_16_1)
		arg_1_0:sendNotification(GAME.QUICK_EXCHANGE_BLUEPRINT, arg_16_1)
	end)
	arg_1_0:bind(var_0_0.FINISH_PHANTOM_QUEST, function(arg_17_0, arg_17_1, arg_17_2)
		arg_1_0:sendNotification(GAME.FINISH_PHANTOM_QUEST, {
			bluePrintId = arg_17_1,
			questId = arg_17_2
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_PHANTOM_LAYER, function(arg_18_0, arg_18_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = DockyardMediator,
			viewComponent = DockyardScene,
			data = {
				mode = DockyardScene.MODE_SHIP_PHANTOM,
				techVersion = arg_18_1
			},
			onRemoved = function()
				arg_1_0.viewComponent:changeEffectVisible(true)
				arg_1_0.viewComponent:updateMod()
			end
		}))
		arg_1_0.viewComponent:changeEffectVisible(false)
	end)

	local var_1_4 = var_1_0:getBluePrints()

	arg_1_0.viewComponent:setShipBluePrints(var_1_4)

	local var_1_5 = getProxy(BayProxy)

	arg_1_0.viewComponent:setShipVOs(var_1_5:getRawData())
	arg_1_0.viewComponent:setVersion(var_1_0:getVersion())
	arg_1_0.viewComponent:setTaskVOs(getProxy(TaskProxy):getTasksForBluePrint())
end

function var_0_0.listNotificationInterests(arg_20_0)
	return {
		GAME.BUILD_SHIP_BLUEPRINT_DONE,
		TechnologyProxy.BLUEPRINT_UPDATED,
		TaskProxy.TASK_ADDED,
		TaskProxy.TASK_UPDATED,
		TaskProxy.TASK_REMOVED,
		GAME.SUBMIT_TASK_DONE,
		GAME.FINISH_SHIP_BLUEPRINT_DONE,
		GAME.ITEM_LOCK_SHIP_BLUPRINT_DONE,
		GAME.STOP_BLUEPRINT_DONE,
		GAME.MOD_BLUEPRINT_DONE,
		BayProxy.SHIP_ADDED,
		BayProxy.SHIP_UPDATED,
		GAME.BEGIN_STAGE_DONE,
		GAME.MOD_BLUEPRINT_ANIM_LOCK,
		GAME.PURSUING_RESET_DONE,
		GAME.QUICK_EXCHANGE_BLUEPRINT_DONE,
		GAME.FINISH_PHANTOM_QUEST_DONE
	}
end

function var_0_0.handleNotification(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1:getName()
	local var_21_1 = arg_21_1:getBody()

	if var_21_0 == TechnologyProxy.BLUEPRINT_UPDATED then
		arg_21_0.viewComponent:updateShipBluePrintVO(var_21_1)
	elseif var_21_0 == GAME.EXCHANG_BLUEPRINT_DONE then
		arg_21_0.viewComponent:clearSelected()
		arg_21_0.viewComponent:updateExchangeItems()
		arg_21_0.viewComponent:updateBuildInfo()
	elseif var_21_0 == TaskProxy.TASK_ADDED or TaskProxy.TASK_UPDATED == var_21_0 or TaskProxy.TASK_REMOVED == var_21_0 then
		arg_21_0.viewComponent:setTaskVOs(getProxy(TaskProxy):getTasksForBluePrint())
		arg_21_0.viewComponent:updateTaskList()
		arg_21_0.viewComponent:updateTasksProgress()
	elseif var_21_0 == GAME.SUBMIT_TASK_DONE then
		local var_21_2 = arg_21_0.contextData.shipBluePrintVO

		if var_21_2 and var_21_2:isDeving() and var_21_2:isFinishedAllTasks() then
			local var_21_3 = getProxy(TechnologyProxy)
			local var_21_4 = var_21_3:getBluePrintById(var_21_2.id)

			var_21_4:finish()
			var_21_3:updateBluePrint(var_21_4)
		end
	elseif var_21_0 == GAME.FINISH_SHIP_BLUEPRINT_DONE or var_21_0 == GAME.ITEM_LOCK_SHIP_BLUPRINT_DONE then
		arg_21_0:addSubLayers(Context.New({
			mediator = NewShipMediator,
			viewComponent = NewShipLayer,
			data = {
				ship = var_21_1.ship,
				canSkipBatch = var_21_1.canSkipBatch
			},
			onRemoved = function()
				pg.NewStoryMgr.GetInstance():Play("FANGAN2")
			end
		}))
	elseif GAME.STOP_BLUEPRINT_DONE == var_21_0 then
		arg_21_0.viewComponent:clearTimers(var_21_1.id)
	elseif GAME.MOD_BLUEPRINT_DONE == var_21_0 then
		arg_21_0.viewComponent:doModAnim(var_21_1.oldBluePrint, var_21_1.newBluePrint)
		arg_21_0.viewComponent:updateAllPursuingCostTip()
	elseif var_21_0 == BayProxy.SHIP_ADDED or BayProxy.SHIP_UPDATED == var_21_0 then
		local var_21_5 = getProxy(BayProxy)

		arg_21_0.viewComponent:setShipVOs(var_21_5:getRawData())
	elseif GAME.BUILD_SHIP_BLUEPRINT_DONE == var_21_0 then
		arg_21_0.viewComponent:buildStartAni("researchStartWindow")
	elseif var_21_0 == GAME.BEGIN_STAGE_DONE then
		arg_21_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_21_1)
	elseif var_21_0 == GAME.MOD_BLUEPRINT_ANIM_LOCK then
		arg_21_0.viewComponent.noUpdateMod = true
	elseif var_21_0 == GAME.PURSUING_RESET_DONE then
		-- block empty
	elseif var_21_0 == GAME.QUICK_EXCHANGE_BLUEPRINT_DONE then
		arg_21_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_21_1, function()
			arg_21_0.viewComponent:updateShipBluePrintVO()
		end)
	elseif var_21_0 == GAME.FINISH_PHANTOM_QUEST_DONE then
		arg_21_0.viewComponent:updatePhantomQuest()
	end
end

return var_0_0
