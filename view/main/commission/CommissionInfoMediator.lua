local var_0_0 = class("CommissionInfoMediator", import("...base.ContextMediator"))

var_0_0.FINISH_EVENT = "CommissionInfoMediator.FINISH_EVENT"
var_0_0.FINISH_CLASS = "CommissionInfoMediator.FINISH_CLASS"
var_0_0.GET_OIL_RES = "CommissionInfoMediator.GET_OIL_RES"
var_0_0.GET_GOLD_RES = "CommissionInfoMediator.GET_GOLD_RES"
var_0_0.ON_ACTIVE_EVENT = "CommissionInfoMediator.ON_ACTIVE_EVENT"
var_0_0.ON_ACTIVE_CLASS = "CommissionInfoMediator.ON_ACTIVE_CLASS"
var_0_0.ON_ACTIVE_TECH = "CommissionInfoMediator.ON_ACTIVE_TECH"
var_0_0.ON_TECH_FINISHED = "CommissionInfoMediator.ON_TECH_FINISHED"
var_0_0.ON_TECH_QUEUE_FINISH = "CommissionInfoMediator.ON_TECH_QUEUE_FINISH"
var_0_0.ON_INS = "CommissionInfoMediator.ON_INS"
var_0_0.ON_UR_ACTIVITY = "CommissionInfoMediator:ON_UR_ACTIVITY"
var_0_0.ON_CRUSING = "CommissionInfoMediator.ON_CRUSING"
var_0_0.GET_CLASS_RES = "CommissionInfoMediator:GET_CLASS_RES"
var_0_0.FINISH_CLASS_ALL = "CommissionInfoMediator:FINISH_CLASS_ALL"
var_0_0.GO_META_BOSS = "CommissionInfoMediator:GO_META_BOSS"
var_0_0.GO_BATTLE = "CommissionInfoMediator.GO_BATTLE"
var_0_0.ON_END_CHAPTER_AUTO = "CommissionInfoMediator.ON_END_CHAPTER_AUTO"
var_0_0.GO_WORLD = "CommissionInfoMediator.GO_WORLD"

function var_0_0.register(arg_1_0)
	local var_1_0 = getProxy(PlayerProxy)

	arg_1_0.viewComponent:setPlayer(var_1_0:getData())
	arg_1_0:bind(var_0_0.GO_WORLD, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.WORLD)
	end)
	arg_1_0:bind(LevelMediator2.GET_CHAPTER_DROP_SHIP_LIST, function(arg_3_0, arg_3_1, arg_3_2)
		arg_1_0:sendNotification(GAME.GET_CHAPTER_DROP_SHIP_LIST, {
			chapterId = arg_3_1,
			callback = arg_3_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_END_CHAPTER_AUTO, function(arg_4_0)
		local var_4_0 = getProxy(ChapterAutoProxy):GetFinishedCnt()

		arg_1_0:sendNotification(GAME.END_CHAPTER_AUTO, {
			num = var_4_0
		})
	end)
	arg_1_0:bind(var_0_0.GO_BATTLE, function(arg_5_0)
		local var_5_0 = getProxy(ChapterProxy):getActiveChapter()

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = var_5_0 and var_5_0.id,
			mapIdx = var_5_0 and var_5_0:getConfig("map")
		})
	end)
	arg_1_0:bind(var_0_0.GO_META_BOSS, function(arg_6_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.WORLDBOSS)
	end)
	arg_1_0:bind(var_0_0.ON_UR_ACTIVITY, function(arg_7_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.UR_ITEM_ACT_ID
		})
	end)
	arg_1_0:bind(var_0_0.ON_CRUSING, function(arg_8_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CRUSING)
	end)
	arg_1_0:bind(var_0_0.GET_CLASS_RES, function(arg_9_0)
		arg_1_0:sendNotification(GAME.HARVEST_CLASS_RES)
	end)
	arg_1_0:bind(var_0_0.ON_TECH_QUEUE_FINISH, function(arg_10_0)
		arg_1_0:sendNotification(GAME.FINISH_QUEUE_TECHNOLOGY)
	end)
	arg_1_0:bind(var_0_0.ON_TECH_FINISHED, function(arg_11_0, arg_11_1)
		arg_1_0:sendNotification(GAME.FINISH_TECHNOLOGY, {
			id = arg_11_1.id,
			pool_id = arg_11_1.pool_id
		})
	end)
	arg_1_0:bind(var_0_0.FINISH_EVENT, function(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
		arg_1_0.contextData.oneStepFinishEventCount = arg_12_2
		arg_1_0.contextData.inFinished = true

		arg_1_0:sendNotification(GAME.EVENT_FINISH, {
			id = arg_12_1.id,
			callback = function()
				arg_1_0.contextData.inFinished = nil
			end,
			onConfirm = function()
				if arg_12_3 then
					arg_12_3()
				end

				if arg_1_0.contextData.oneStepFinishEventCount then
					arg_1_0.contextData.oneStepFinishEventCount = arg_1_0.contextData.oneStepFinishEventCount - 1

					if arg_1_0.contextData.oneStepFinishEventCount <= 0 then
						MainMetaSkillSequence.New():Execute()
					end
				else
					MainMetaSkillSequence.New():Execute()
				end
			end
		})
	end)
	arg_1_0:bind(var_0_0.FINISH_CLASS, function(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
		arg_1_0:sendNotification(GAME.CANCEL_LEARN_TACTICS, {
			shipId = arg_15_1,
			type = arg_15_2,
			onConfirm = arg_15_3
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVE_EVENT, function(arg_16_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVE_CLASS, function(arg_17_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS)
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVE_TECH, function(arg_18_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.TECHNOLOGY)
	end)
	arg_1_0:bind(var_0_0.GET_OIL_RES, function(arg_19_0)
		arg_1_0:sendNotification(GAME.HARVEST_RES, PlayerConst.ResOil)
	end)
	arg_1_0:bind(var_0_0.GET_GOLD_RES, function(arg_20_0)
		arg_1_0:sendNotification(GAME.HARVEST_RES, PlayerConst.ResGold)
	end)
	arg_1_0:bind(var_0_0.ON_INS, function(arg_21_0)
		arg_1_0:sendNotification(GAME.ON_OPEN_INS_LAYER)
		arg_1_0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)
	arg_1_0:bind(var_0_0.FINISH_CLASS_ALL, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS)
	end)
	arg_1_0:Notify()
end

function var_0_0.Notify(arg_23_0)
	arg_23_0.viewComponent:NotifyIns()
	arg_23_0.viewComponent:UpdateLinkPanel()
end

function var_0_0.continueClass(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = getProxy(BayProxy):getShipById(arg_24_1)
	local var_24_1 = getProxy(BagProxy):getItemsByType(Item.LESSON_TYPE)

	if table.getCount(var_24_1 or {}) <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_no_lesson"))

		return
	end

	arg_24_0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS, {
		shipToLesson = {
			shipId = arg_24_1,
			skillIndex = var_24_0:getSkillIndex(arg_24_2),
			index = arg_24_3
		}
	})
end

function var_0_0.listNotificationInterests(arg_25_0)
	return {
		PlayerProxy.UPDATED,
		GAME.HARVEST_RES_DONE,
		GAME.EVENT_LIST_UPDATE,
		GAME.EVENT_FINISH_UPDATE,
		GAME.EVENT_SHOW_AWARDS,
		GAME.CANCEL_LEARN_TACTICS_DONE,
		GAME.FINISH_TECHNOLOGY_DONE,
		GAME.FINISH_QUEUE_TECHNOLOGY_DONE,
		GAME.START_CHAPTER_AUTO_DONE,
		GAME.END_CHAPTER_AUTO_DONE,
		GAME.ZERO_HOUR_OP_DONE
	}
end

function var_0_0.handleNotification(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1:getName()
	local var_26_1 = arg_26_1:getBody()

	if var_26_0 == PlayerProxy.UPDATED then
		arg_26_0.viewComponent:OnPlayerUpdate(var_26_1)
	elseif var_26_0 == GAME.HARVEST_RES_DONE then
		local var_26_2

		if var_26_1.type == 2 then
			var_26_2 = i18n("word_oil")
		elseif var_26_1.type == 1 then
			var_26_2 = i18n("word_gold")
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("commission_get_award", var_26_2, var_26_1.outPut))
	elseif var_26_0 == GAME.EVENT_LIST_UPDATE or var_26_0 == GAME.EVENT_FINISH_UPDATE then
		local var_26_3 = getProxy(EventProxy)

		arg_26_0.viewComponent:OnUpdateEventInfo()
	elseif var_26_0 == GAME.EVENT_SHOW_AWARDS then
		local var_26_4

		var_26_4 = coroutine.wrap(function()
			if #var_26_1.oldShips > 0 then
				arg_26_0.viewComponent:emit(BaseUI.ON_SHIP_EXP, {
					title = pg.collection_template[var_26_1.eventId].title,
					oldShips = var_26_1.oldShips,
					newShips = var_26_1.newShips,
					isCri = var_26_1.isCri
				}, var_26_4)
				coroutine.yield()
			end

			arg_26_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_26_1.awards, function()
				if var_26_1.onConfirm then
					var_26_1.onConfirm()
				end
			end)
		end)

		var_26_4()
	elseif var_26_0 == GAME.CANCEL_LEARN_TACTICS_DONE then
		arg_26_0.viewComponent:OnUpdateClass()

		local var_26_5 = var_26_1.totalExp
		local var_26_6 = var_26_1.oldSkill
		local var_26_7 = var_26_1.newSkill
		local var_26_8 = getProxy(BayProxy):getShipById(var_26_1.shipId)
		local var_26_9 = var_26_7.id
		local var_26_10

		if var_26_7.level > var_26_6.level then
			var_26_10 = i18n("tactics_end_to_learn", var_26_8:getName(), getSkillName(var_26_9), var_26_5) .. i18n("tactics_skill_level_up", var_26_6.level, var_26_7.level)
		else
			var_26_10 = i18n("tactics_end_to_learn", var_26_8:getName(), getSkillName(var_26_9), var_26_5)
		end

		if pg.skill_data_template[var_26_9].max_level <= var_26_7.level then
			arg_26_0:HandleClassMaxLevel(var_26_8, var_26_1, var_26_9, var_26_5)
		else
			local var_26_11 = var_26_10 .. i18n("tactics_continue_to_learn")

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				hideNo = false,
				hideClose = true,
				content = var_26_11,
				onYes = function()
					arg_26_0.openMsgBox = false

					arg_26_0:continueClass(var_26_1.shipId, var_26_9, var_26_1.id)
				end,
				onNo = function()
					arg_26_0.openMsgBox = false
				end
			})
		end
	elseif var_26_0 == GAME.FINISH_TECHNOLOGY_DONE then
		arg_26_0.viewComponent:OnUpdateTechnology()

		if #var_26_1.items > 0 then
			arg_26_0.viewComponent:emit(BaseUI.ON_AWARD, {
				animation = true,
				items = var_26_1.items
			})
		end
	elseif var_26_0 == GAME.FINISH_QUEUE_TECHNOLOGY_DONE then
		arg_26_0.viewComponent:OnUpdateTechnology()

		local var_26_12 = {}

		for iter_26_0, iter_26_1 in ipairs(var_26_1.dropInfos) do
			if #iter_26_1 > 0 then
				table.insert(var_26_12, function(arg_31_0)
					arg_26_0.viewComponent:emit(BaseUI.ON_AWARD, {
						animation = true,
						items = iter_26_1,
						removeFunc = arg_31_0
					})
				end)
			end
		end

		seriesAsync(var_26_12, function()
			local var_32_0 = getProxy(TechnologyProxy):getActivateTechnology()

			if var_32_0 and var_32_0:isCompleted() then
				arg_26_0:sendNotification(GAME.FINISH_TECHNOLOGY, {
					id = var_32_0.id,
					pool_id = var_32_0.poolId
				})
			end
		end)
	elseif var_26_0 == GAME.END_CHAPTER_AUTO_DONE then
		arg_26_0:HandleChapterAutoDone(var_26_1)
	elseif var_26_0 == START_CHAPTER_AUTO_DONE then
		arg_26_0.viewComponent:OnUpdateChapterAuto()
	elseif var_26_0 == GAME.ZERO_HOUR_OP_DONE then
		arg_26_0.viewComponent:OnUpdateChapterAuto()
	end
end

function var_0_0.HandleClassMaxLevel(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
	local var_33_0 = i18n("tactics_end_to_learn", arg_33_1:getName(), getSkillName(arg_33_3), arg_33_4)
	local var_33_1 = arg_33_1:getSkillList()

	if _.all(var_33_1, function(arg_34_0)
		return ShipSkill.New(arg_33_1.skills[arg_34_0]):IsMaxLevel()
	end) then
		local var_33_2 = var_33_0 .. i18n("tactics_continue_to_learn_other_ship_skill")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideClose = true,
			content = var_33_2,
			onYes = function()
				arg_33_0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS)
			end
		})
	else
		local var_33_3 = var_33_0 .. i18n("tactics_continue_to_learn_other_skill")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideClose = true,
			content = var_33_3,
			onYes = function()
				arg_33_0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS, {
					shipToLesson = {
						shipId = arg_33_2.shipId,
						index = arg_33_2.id
					}
				})
			end
		})
	end
end

function var_0_0.HandleChapterAutoDone(arg_37_0, arg_37_1)
	switch(arg_37_1.type, {
		[ChapterAutoProxy.TYPE.SLG] = function()
			arg_37_0:addSubLayers(Context.New({
				viewComponent = ChapterAutoTotalRewardLayer,
				mediator = ChapterAutoTotalRewardMediator,
				data = {
					rewards = arg_37_1.awards,
					totalTimes = arg_37_1.allCnt,
					finishTimes = arg_37_1.finishCnt,
					proficiency = arg_37_1.proficiency,
					onClose = function()
						arg_37_0.viewComponent:OnUpdateChapterAuto()
					end
				}
			}), true)
		end,
		[ChapterAutoProxy.TYPE.WORLD] = function()
			local var_40_0 = nowWorld()
			local var_40_1 = var_40_0:GetAtlas()
			local var_40_2 = {}

			for iter_40_0, iter_40_1 in ipairs(arg_37_1.mapList) do
				local var_40_3 = var_40_0.pressingAwardDic[iter_40_1]

				if var_40_3.flag then
					var_40_0:FlagMapPressingAward(iter_40_1)
					var_40_1:MarkMapTransport(iter_40_1)

					local var_40_4 = pg.world_event_complete[var_40_3.id].event_reward_slgbuff

					if #var_40_4 > 0 then
						var_40_2[var_40_4[1]] = defaultValue(var_40_2[var_40_4[1]], 0) + var_40_4[2]
					end
				end
			end

			local var_40_5 = {}

			for iter_40_2, iter_40_3 in pairs(var_40_2) do
				local var_40_6 = {
					id = iter_40_2,
					floor = iter_40_3,
					before = var_40_0:GetGlobalBuff(iter_40_2):GetFloor()
				}

				table.insert(var_40_5, var_40_6)
				var_40_0:AddGlobalBuff(iter_40_2, iter_40_3)
			end

			arg_37_0:addSubLayers(Context.New({
				viewComponent = WorldChapterAutoRewardLayer,
				mediator = WorldChapterAutoRewardMediator,
				data = {
					awards = arg_37_1.awards,
					buffInfos = var_40_5,
					proficiency = arg_37_1.proficiency,
					onClose = function()
						arg_37_0.viewComponent:OnUpdateChapterAuto()
					end
				}
			}), true)
		end
	}, function()
		assert(false, "Unknown commission type: " .. arg_37_1.type)
	end)
end

return var_0_0
