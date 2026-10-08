local var_0_0 = class("WorldMediator", import("..base.ContextMediator"))

var_0_0.OnMapOp = "WorldMediator.OnMapOp"
var_0_0.OnMapReq = "WorldMediator.OnMapReq"
var_0_0.OnOpenLayer = "WorldMediator.OnOpenLayer"
var_0_0.OnOpenScene = "WorldMediator.OnOpenScene"
var_0_0.OnChangeScene = "WorldMediator.OnChangeScene"
var_0_0.OnOpenMarkMap = "WorldMediator.OnOpenMarkMap"
var_0_0.OnTriggerTaskGo = "WorldMediator.OnTriggerTaskGo"
var_0_0.OnAutoSubmitTask = "WorldMediator.OnAutoSubmitTask"
var_0_0.OnNotificationOpenLayer = "WorldMediator.OnNotificationOpenLayer"
var_0_0.OnStart = "WorldMediator.OnStart"
var_0_0.OnStartPerform = "WorldMediator.OnStartPerform"
var_0_0.OnStartAutoSwitch = "WorldMediator.OnStartAutoSwitch"
var_0_0.OnMoveAndOpenLayer = "WorldMediator.OnMoveAndOpenLayer"
var_0_0.OnFinishDelegate = "WorldMediator.OnFinishDelegate"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.OnMapOp, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.WORLD_MAP_OP, arg_2_1)
	end)
	arg_1_0:bind(var_0_0.OnMapReq, function(arg_3_0, arg_3_1, arg_3_2)
		assert(arg_1_0.fetchCallback == nil)

		arg_1_0.fetchCallback = arg_3_2

		arg_1_0:sendNotification(GAME.WORLD_MAP_REQ, {
			mapId = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.OnOpenLayer, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:addSubLayers(arg_4_1, false, arg_4_2)
	end)
	arg_1_0:bind(var_0_0.OnOpenScene, function(arg_5_0, arg_5_1, ...)
		local var_5_0 = {}

		if arg_1_0.viewComponent:GetInMap() then
			table.insert(var_5_0, function(arg_6_0)
				arg_1_0.viewComponent:EaseOutMapUI(arg_6_0)
			end)
		else
			table.insert(var_5_0, function(arg_7_0)
				arg_1_0.viewComponent:EaseOutAtlasUI(arg_7_0)
			end)
		end

		local var_5_1 = packEx(...)

		pg.UIMgr.GetInstance():LoadingOn()
		seriesAsync(var_5_0, function()
			pg.UIMgr.GetInstance():LoadingOff()
			arg_1_0:sendNotification(GAME.GO_SCENE, arg_5_1, unpack(var_5_1, 1, var_5_1.len))
		end)
	end)
	arg_1_0:bind(var_0_0.OnChangeScene, function(arg_9_0, arg_9_1, ...)
		local var_9_0 = {}

		if arg_1_0.viewComponent:GetInMap() then
			table.insert(var_9_0, function(arg_10_0)
				arg_1_0.viewComponent:EaseOutMapUI(arg_10_0)
			end)
		else
			table.insert(var_9_0, function(arg_11_0)
				arg_1_0.viewComponent:EaseOutAtlasUI(arg_11_0)
			end)
		end

		local var_9_1 = packEx(...)

		pg.UIMgr.GetInstance():LoadingOn()
		seriesAsync(var_9_0, function()
			pg.UIMgr.GetInstance():LoadingOff()
			arg_1_0:sendNotification(GAME.CHANGE_SCENE, arg_9_1, unpack(var_9_1, 1, var_9_1.len))
		end)
	end)
	arg_1_0:bind(var_0_0.OnStart, function(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
		if arg_13_2.damageLevel > arg_13_3:GetLimitDamageLevel() then
			nowWorld():TriggerAutoFight(false)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideYes = true,
				content = i18n("world_low_morale")
			})
		else
			arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
				system = SYSTEM_WORLD,
				stageId = arg_13_1,
				hpRate = arg_13_3:GetHP() and arg_13_3:GetHP() / arg_13_3:GetMaxHP() or nil
			})
		end
	end)
	arg_1_0:bind(var_0_0.OnStartPerform, function(arg_14_0, arg_14_1, arg_14_2)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_PERFORM,
			stageId = arg_14_1,
			exitCallback = arg_14_2
		})
	end)
	arg_1_0:bind(var_0_0.OnAutoSubmitTask, function(arg_15_0, arg_15_1)
		arg_1_0:sendNotification(GAME.WORLD_AUTO_SUMBMIT_TASK, {
			taskId = arg_15_1.id
		})
	end)
	arg_1_0:bind(var_0_0.OnFinishDelegate, function(arg_16_0)
		pg.m02:sendNotification(GAME.END_CHAPTER_AUTO, {})
	end)
	arg_1_0.viewComponent:SetPlayer(getProxy(PlayerProxy):getRawData())
end

function var_0_0.listNotificationInterests(arg_17_0)
	local var_17_0 = {
		PlayerProxy.UPDATED,
		GAME.WORLD_MAP_OP_DONE,
		GAME.BEGIN_STAGE_DONE,
		GAME.WORLD_STAMINA_EXCHANGE_DONE,
		WorldInventoryMediator.OnMap,
		WorldCollectionMediator.ON_MAP,
		var_0_0.OnOpenMarkMap,
		GAME.WORLD_TRIGGER_TASK_DONE,
		GAME.WORLD_SUMBMIT_TASK_DONE,
		GAME.WORLD_AUTO_SUMBMIT_TASK_DONE,
		GAME.WORLD_ITEM_USE_DONE,
		GAME.WORLD_RETREAT_FLEET,
		var_0_0.OnTriggerTaskGo,
		GAME.WORLD_MAP_REQ_DONE,
		var_0_0.OnNotificationOpenLayer,
		GAME.WORLD_TRIGGER_AUTO_FIGHT,
		GAME.WORLD_TRIGGER_AUTO_SWITCH,
		var_0_0.OnStartAutoSwitch,
		var_0_0.OnMoveAndOpenLayer,
		GAME.END_CHAPTER_AUTO_DONE,
		GAME.START_WORLD_CHAPTER_AUTO_DONE
	}
	local var_17_1 = WorldGuider.GetInstance():GetWorldGuiderNotifies()

	_.each(var_17_1, function(arg_18_0)
		var_17_0[#var_17_0 + 1] = arg_18_0
	end)

	return var_17_0
end

function var_0_0.handleNotification(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1:getName()
	local var_19_1 = arg_19_1:getBody()

	WorldGuider.GetInstance():WorldGuiderNotifyHandler(var_19_0, var_19_1, arg_19_0.viewComponent)

	local var_19_2 = nowWorld()

	switch(var_19_0, {
		[GAME.WORLD_MAP_OP_DONE] = function()
			local var_20_0 = var_19_1.mapOp
			local var_20_1 = arg_19_0.viewComponent:GetCommand(var_20_0.depth)

			if var_19_1.result ~= 0 then
				var_20_1:OpDone()

				if var_19_1.result == 130 then
					var_19_2.staminaMgr:Show()
				end

				return
			end

			local var_20_2 = {}
			local var_20_3

			arg_19_0.viewComponent:RegistMapOp(var_20_0)

			if #var_20_0.drops > 0 then
				if var_20_0.op == WorldConst.OpReqCatSalvage then
					local var_20_4 = var_19_2:GetFleet(var_20_0.id):GetSalvageScoreRarity()

					if var_19_2.isAutoFight then
						var_19_2:AddAutoInfo("salvage", {
							drops = var_20_0.drops,
							rarity = var_20_4
						})
					else
						table.insert(var_20_2, function(arg_21_0)
							arg_19_0.viewComponent:DisplayAwards(var_20_0.drops, {
								title = "commander",
								titleExtra = tostring(var_20_4)
							}, arg_21_0)
						end)
					end
				elseif var_19_2.isAutoFight then
					var_19_2:AddAutoInfo("drops", var_20_0.drops)
				else
					table.insert(var_20_2, function(arg_22_0)
						arg_19_0.viewComponent:DisplayAwards(var_20_0.drops, {}, arg_22_0)
					end)
				end
			end

			if var_20_0.routine then
				function var_20_3()
					var_20_0.routine(var_20_0)
				end
			else
				local var_20_5 = var_20_0.op

				var_19_0 = WorldConst.ReqName[var_20_5]

				assert(var_19_0, "invalid operation: " .. var_20_5)

				if var_20_5 == WorldConst.OpReqTask then
					-- block empty
				elseif var_20_5 == WorldConst.OpReqPressingMap or var_20_5 == WorldConst.OpReqCatSalvage then
					local var_20_6 = var_20_2

					var_20_2 = {}

					function var_20_3()
						var_20_1:OpDone(var_19_0 .. "Done", var_20_0, var_20_6)
					end
				else
					function var_20_3()
						var_20_1:OpDone(var_19_0 .. "Done", var_20_0)
					end
				end
			end

			seriesAsync(var_20_2, var_20_3)
		end,
		[PlayerProxy.UPDATED] = function()
			arg_19_0.viewComponent:SetPlayer(getProxy(PlayerProxy):getRawData())
		end,
		[GAME.BEGIN_STAGE_DONE] = function()
			arg_19_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_19_1)
		end,
		[GAME.WORLD_STAMINA_EXCHANGE_DONE] = function()
			if not arg_19_0.viewComponent:GetInMap() then
				local var_28_0 = arg_19_0.viewComponent.svFloatPanel

				if var_28_0:isShowing() then
					var_28_0:UpdateCost()
				end
			end
		end,
		[WorldInventoryMediator.OnMap] = function()
			arg_19_0.viewComponent:Op("OpFocusTargetEntrance", var_19_1)
		end,
		[WorldCollectionMediator.ON_MAP] = function()
			arg_19_0.viewComponent:Op("OpFocusTargetEntrance", var_19_1)
		end,
		[var_0_0.OnOpenMarkMap] = function()
			arg_19_0.viewComponent:Op("OpShowMarkOverview", var_19_1)
		end,
		[GAME.WORLD_TRIGGER_TASK_DONE] = function()
			pg.WorldToastMgr.GetInstance():ShowToast(var_19_1.task, false)
		end,
		[GAME.WORLD_SUMBMIT_TASK_DONE] = function()
			local var_33_0 = {}
			local var_33_1 = var_19_1.task

			if #var_33_1.config.task_ed > 0 then
				table.insert(var_33_0, function(arg_34_0)
					pg.NewStoryMgr.GetInstance():Play(var_33_1.config.task_ed, arg_34_0, true)
				end)
			end

			if var_19_1.drops and #var_19_1.drops > 0 then
				if var_19_2.isAutoFight then
					var_19_2:AddAutoInfo("drops", var_19_1.drops)
				else
					table.insert(var_33_0, function(arg_35_0)
						arg_19_0.viewComponent:DisplayAwards(var_19_1.drops, {}, arg_35_0)
					end)
				end
			end

			for iter_33_0, iter_33_1 in ipairs(var_19_1.expfleets) do
				table.insert(var_33_0, function(arg_36_0)
					local var_36_0 = iter_33_1.oldships
					local var_36_1 = iter_33_1.newships

					arg_19_0.viewComponent:emit(BaseUI.ON_SHIP_EXP, {
						title = "without word",
						oldShips = var_36_0,
						newShips = var_36_1
					}, arg_36_0)
				end)
			end

			seriesAsync(var_33_0, function()
				pg.WorldToastMgr.GetInstance():ShowToast(var_33_1, true)
			end)
		end,
		[GAME.WORLD_AUTO_SUMBMIT_TASK_DONE] = function()
			local var_38_0 = {}
			local var_38_1 = var_19_1.task

			if #var_38_1.config.task_ed > 0 then
				table.insert(var_38_0, function(arg_39_0)
					pg.NewStoryMgr.GetInstance():Play(var_38_1.config.task_ed, arg_39_0, true)
				end)
			end

			if var_19_1.drops and #var_19_1.drops > 0 then
				if var_19_2.isAutoFight then
					var_19_2:AddAutoInfo("drops", var_19_1.drops)
				else
					table.insert(var_38_0, function(arg_40_0)
						arg_19_0.viewComponent:DisplayAwards(var_19_1.drops, {}, arg_40_0)
					end)
				end
			end

			for iter_38_0, iter_38_1 in ipairs(var_19_1.expfleets) do
				table.insert(var_38_0, function(arg_41_0)
					local var_41_0 = iter_38_1.oldships
					local var_41_1 = iter_38_1.newships

					arg_19_0.viewComponent:emit(BaseUI.ON_SHIP_EXP, {
						title = "without word",
						oldShips = var_41_0,
						newShips = var_41_1
					}, arg_41_0)
				end)
			end

			seriesAsync(var_38_0, function()
				pg.WorldToastMgr.GetInstance():ShowToast(var_38_1, true)
				arg_19_0.viewComponent:GetCommand():OpDone("OpAutoSubmitTaskDone", var_38_1)
			end)
		end,
		[GAME.WORLD_ITEM_USE_DONE] = function()
			local var_43_0 = var_19_1.item
			local var_43_1 = var_19_1.drops
			local var_43_2 = {}

			switch(var_43_0:getWorldItemType(), {
				[WorldItem.UsageWorldClean] = function()
					table.insert(var_43_2, function(arg_45_0)
						local var_45_0 = pg.gameset.world_story_recycle_item.description[1]

						pg.NewStoryMgr.GetInstance():Play(var_45_0, arg_45_0, true)
					end)
					table.insert(var_43_2, function(arg_46_0)
						arg_19_0.viewComponent:GetAllPessingAward(arg_46_0)
					end)
				end,
				[WorldItem.UsageWorldFlag] = function()
					table.insert(var_43_2, function(arg_48_0)
						local var_48_0 = pg.gameset.world_story_treasure_item.description[1]

						pg.NewStoryMgr.GetInstance():Play(var_48_0, arg_48_0, true)
					end)
				end,
				[WorldItem.UsageWorldBuff] = function()
					local var_49_0, var_49_1 = var_43_0:getItemWorldBuff()
					local var_49_2 = var_49_1 * var_43_0.count

					table.insert(var_43_2, function(arg_50_0)
						local var_50_0 = {
							id = var_49_0,
							floor = var_49_2,
							before = var_19_2:GetGlobalBuff(var_49_0):GetFloor()
						}

						arg_19_0.viewComponent:ShowSubView("GlobalBuff", {
							var_50_0,
							arg_50_0
						})
					end)
					table.insert(var_43_2, function(arg_51_0)
						var_19_2:AddGlobalBuff(var_49_0, var_49_2)
						arg_51_0()
					end)
				end,
				[WorldItem.UsageWorldFlag] = function()
					switch(var_43_0:getItemFlagKey(), {
						function()
							table.insert(var_43_2, function(arg_54_0)
								local var_54_0 = var_19_2:GetActiveMap()

								if not var_54_0.visionFlag and var_19_2:IsMapVisioned(var_54_0.id) then
									var_54_0:UpdateVisionFlag(true)
								end

								arg_54_0()
							end)
						end
					})
				end
			})

			if #var_43_1 > 0 then
				if var_19_2.isAutoFight then
					var_19_2:AddAutoInfo("drops", var_43_1)
				else
					table.insert(var_43_2, function(arg_55_0)
						arg_19_0.viewComponent:DisplayAwards(var_43_1, {}, arg_55_0)
					end)
				end
			end

			seriesAsync(var_43_2, function()
				return
			end)
		end,
		[GAME.WORLD_RETREAT_FLEET] = function()
			local var_57_0 = var_19_2:GetFleet()

			arg_19_0.viewComponent:Op("OpReqRetreat", var_57_0)
		end,
		[var_0_0.OnTriggerTaskGo] = function()
			arg_19_0.viewComponent:Op("OpTaskGoto", var_19_1.taskId)
		end,
		[GAME.WORLD_MAP_REQ_DONE] = function()
			assert(arg_19_0.fetchCallback)
			existCall(arg_19_0.fetchCallback)

			arg_19_0.fetchCallback = nil
		end,
		[var_0_0.OnNotificationOpenLayer] = function()
			arg_19_0:addSubLayers(var_19_1.context)
		end,
		[GAME.WORLD_TRIGGER_AUTO_FIGHT] = function()
			arg_19_0.viewComponent:UpdateAutoFightDisplay()
		end,
		[GAME.WORLD_TRIGGER_AUTO_SWITCH] = function()
			arg_19_0.viewComponent:UpdateAutoSwitchDisplay()
		end,
		[var_0_0.OnStartAutoSwitch] = function()
			arg_19_0.viewComponent:StartAutoSwitch()
		end,
		[var_0_0.OnMoveAndOpenLayer] = function()
			arg_19_0.viewComponent:MoveAndOpenLayer(var_19_1)
		end,
		[GAME.END_CHAPTER_AUTO_DONE] = function()
			if var_19_1.type ~= ChapterAutoProxy.TYPE.WORLD then
				return
			end

			getProxy(WorldProxy):RemoveDelegateAward()

			local var_65_0 = {}

			table.insert(var_65_0, function(arg_66_0)
				arg_19_0.viewComponent:GetDelegatedAwards(var_19_1.mapList, var_19_1.awards, var_19_1.proficiency, arg_66_0)
			end)
			seriesAsync(var_65_0, function()
				arg_19_0.viewComponent:UpdateDelegateDisplay()
			end)
		end,
		[GAME.START_WORLD_CHAPTER_AUTO_DONE] = function()
			arg_19_0.viewComponent:UpdateDelegateDisplay()
		end
	})
end

return var_0_0
