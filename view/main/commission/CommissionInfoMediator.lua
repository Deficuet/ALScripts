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
var_0_0.GO_ACT_BOSS = "CommissionInfoMediator.GO_ACT_BOSS"

function var_0_0.register(arg_1_0)
	local var_1_0 = getProxy(PlayerProxy)

	arg_1_0.viewComponent:setPlayer(var_1_0:getData())
	arg_1_0:bind(var_0_0.GO_ACT_BOSS, function(arg_2_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.ACT_BOSS_BATTLE)
	end)
	arg_1_0:bind(var_0_0.GO_WORLD, function(arg_3_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.WORLD)
	end)
	arg_1_0:bind(LevelMediator2.GET_CHAPTER_DROP_SHIP_LIST, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:sendNotification(GAME.GET_CHAPTER_DROP_SHIP_LIST, {
			chapterId = arg_4_1,
			callback = arg_4_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_END_CHAPTER_AUTO, function(arg_5_0)
		local var_5_0 = getProxy(ChapterAutoProxy):GetFinishedCnt()

		arg_1_0:sendNotification(GAME.END_CHAPTER_AUTO, {
			num = var_5_0
		})
	end)
	arg_1_0:bind(var_0_0.GO_BATTLE, function(arg_6_0)
		local var_6_0 = getProxy(ChapterProxy):getActiveChapter()

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = var_6_0 and var_6_0.id,
			mapIdx = var_6_0 and var_6_0:getConfig("map")
		})
	end)
	arg_1_0:bind(var_0_0.GO_META_BOSS, function(arg_7_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.WORLDBOSS)
	end)
	arg_1_0:bind(var_0_0.ON_UR_ACTIVITY, function(arg_8_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.UR_ITEM_ACT_ID
		})
	end)
	arg_1_0:bind(var_0_0.ON_CRUSING, function(arg_9_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CRUSING)
	end)
	arg_1_0:bind(var_0_0.GET_CLASS_RES, function(arg_10_0)
		arg_1_0:sendNotification(GAME.HARVEST_CLASS_RES)
	end)
	arg_1_0:bind(var_0_0.ON_TECH_QUEUE_FINISH, function(arg_11_0)
		arg_1_0:sendNotification(GAME.FINISH_QUEUE_TECHNOLOGY)
	end)
	arg_1_0:bind(var_0_0.ON_TECH_FINISHED, function(arg_12_0, arg_12_1)
		arg_1_0:sendNotification(GAME.FINISH_TECHNOLOGY, {
			id = arg_12_1.id,
			pool_id = arg_12_1.pool_id
		})
	end)
	arg_1_0:bind(var_0_0.FINISH_EVENT, function(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
		arg_1_0.contextData.oneStepFinishEventCount = arg_13_2
		arg_1_0.contextData.inFinished = true

		arg_1_0:sendNotification(GAME.EVENT_FINISH, {
			id = arg_13_1.id,
			callback = function()
				arg_1_0.contextData.inFinished = nil
			end,
			onConfirm = function()
				if arg_13_3 then
					arg_13_3()
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
	arg_1_0:bind(var_0_0.FINISH_CLASS, function(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
		arg_1_0:sendNotification(GAME.CANCEL_LEARN_TACTICS, {
			shipId = arg_16_1,
			type = arg_16_2,
			onConfirm = arg_16_3
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVE_EVENT, function(arg_17_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVE_CLASS, function(arg_18_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS)
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVE_TECH, function(arg_19_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.TECHNOLOGY)
	end)
	arg_1_0:bind(var_0_0.GET_OIL_RES, function(arg_20_0)
		arg_1_0:sendNotification(GAME.HARVEST_RES, PlayerConst.ResOil)
	end)
	arg_1_0:bind(var_0_0.GET_GOLD_RES, function(arg_21_0)
		arg_1_0:sendNotification(GAME.HARVEST_RES, PlayerConst.ResGold)
	end)
	arg_1_0:bind(var_0_0.ON_INS, function(arg_22_0)
		arg_1_0:sendNotification(GAME.ON_OPEN_INS_LAYER)
		arg_1_0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)
	arg_1_0:bind(var_0_0.FINISH_CLASS_ALL, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS)
	end)
	arg_1_0:Notify()
	getProxy(EventProxy):FlushIfDirty()
end

function var_0_0.Notify(arg_24_0)
	arg_24_0.viewComponent:NotifyIns()
	arg_24_0.viewComponent:UpdateLinkPanel()
end

function var_0_0.continueClass(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	local var_25_0 = getProxy(BayProxy):getShipById(arg_25_1)
	local var_25_1 = getProxy(BagProxy):getItemsByType(Item.LESSON_TYPE)

	if table.getCount(var_25_1 or {}) <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_no_lesson"))

		return
	end

	arg_25_0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS, {
		shipToLesson = {
			shipId = arg_25_1,
			skillIndex = var_25_0:getSkillIndex(arg_25_2),
			index = arg_25_3
		}
	})
end

function var_0_0.listNotificationInterests(arg_26_0)
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
		GAME.ZERO_HOUR_OP_DONE,
		GAME.ON_RECONNECTION
	}
end

function var_0_0.handleNotification(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1:getName()
	local var_27_1 = arg_27_1:getBody()

	if var_27_0 == PlayerProxy.UPDATED then
		arg_27_0.viewComponent:OnPlayerUpdate(var_27_1)
	elseif var_27_0 == GAME.HARVEST_RES_DONE then
		local var_27_2

		if var_27_1.type == 2 then
			var_27_2 = i18n("word_oil")
		elseif var_27_1.type == 1 then
			var_27_2 = i18n("word_gold")
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("commission_get_award", var_27_2, var_27_1.outPut))
	elseif var_27_0 == GAME.EVENT_LIST_UPDATE or var_27_0 == GAME.EVENT_FINISH_UPDATE then
		local var_27_3 = getProxy(EventProxy)

		arg_27_0.viewComponent:OnUpdateEventInfo()
	elseif var_27_0 == GAME.ON_RECONNECTION then
		getProxy(EventProxy):FlushIfDirty()
	elseif var_27_0 == GAME.EVENT_SHOW_AWARDS then
		local var_27_4

		var_27_4 = coroutine.wrap(function()
			if #var_27_1.oldShips > 0 then
				arg_27_0.viewComponent:emit(BaseUI.ON_SHIP_EXP, {
					title = pg.collection_template[var_27_1.eventId].title,
					oldShips = var_27_1.oldShips,
					newShips = var_27_1.newShips,
					isCri = var_27_1.isCri
				}, var_27_4)
				coroutine.yield()
			end

			arg_27_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_27_1.awards, function()
				if var_27_1.onConfirm then
					var_27_1.onConfirm()
				end
			end)
		end)

		var_27_4()
	elseif var_27_0 == GAME.CANCEL_LEARN_TACTICS_DONE then
		arg_27_0.viewComponent:OnUpdateClass()

		local var_27_5 = var_27_1.totalExp
		local var_27_6 = var_27_1.oldSkill
		local var_27_7 = var_27_1.newSkill
		local var_27_8 = getProxy(BayProxy):getShipById(var_27_1.shipId)
		local var_27_9 = var_27_7.id
		local var_27_10

		if var_27_7.level > var_27_6.level then
			var_27_10 = i18n("tactics_end_to_learn", var_27_8:getName(), getSkillName(var_27_9), var_27_5) .. i18n("tactics_skill_level_up", var_27_6.level, var_27_7.level)
		else
			var_27_10 = i18n("tactics_end_to_learn", var_27_8:getName(), getSkillName(var_27_9), var_27_5)
		end

		if pg.skill_data_template[var_27_9].max_level <= var_27_7.level then
			arg_27_0:HandleClassMaxLevel(var_27_8, var_27_1, var_27_9, var_27_5)
		else
			local var_27_11 = var_27_10 .. i18n("tactics_continue_to_learn")

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				hideNo = false,
				hideClose = true,
				content = var_27_11,
				onYes = function()
					arg_27_0.openMsgBox = false

					arg_27_0:continueClass(var_27_1.shipId, var_27_9, var_27_1.id)
				end,
				onNo = function()
					arg_27_0.openMsgBox = false
				end
			})
		end
	elseif var_27_0 == GAME.FINISH_TECHNOLOGY_DONE then
		arg_27_0.viewComponent:OnUpdateTechnology()

		if #var_27_1.items > 0 then
			arg_27_0.viewComponent:emit(BaseUI.ON_AWARD, {
				animation = true,
				items = var_27_1.items
			})
		end
	elseif var_27_0 == GAME.FINISH_QUEUE_TECHNOLOGY_DONE then
		arg_27_0.viewComponent:OnUpdateTechnology()

		local var_27_12 = {}

		for iter_27_0, iter_27_1 in ipairs(var_27_1.dropInfos) do
			if #iter_27_1 > 0 then
				table.insert(var_27_12, function(arg_32_0)
					arg_27_0.viewComponent:emit(BaseUI.ON_AWARD, {
						animation = true,
						items = iter_27_1,
						removeFunc = arg_32_0
					})
				end)
			end
		end

		seriesAsync(var_27_12, function()
			local var_33_0 = getProxy(TechnologyProxy):getActivateTechnology()

			if var_33_0 and var_33_0:isCompleted() then
				arg_27_0:sendNotification(GAME.FINISH_TECHNOLOGY, {
					id = var_33_0.id,
					pool_id = var_33_0.poolId
				})
			end
		end)
	elseif var_27_0 == GAME.END_CHAPTER_AUTO_DONE then
		arg_27_0:HandleChapterAutoDone(var_27_1)
	elseif var_27_0 == START_CHAPTER_AUTO_DONE then
		arg_27_0.viewComponent:OnUpdateChapterAuto()
	elseif var_27_0 == GAME.ZERO_HOUR_OP_DONE then
		arg_27_0.viewComponent:OnUpdateChapterAuto()
	end
end

function var_0_0.HandleClassMaxLevel(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	local var_34_0 = i18n("tactics_end_to_learn", arg_34_1:getName(), getSkillName(arg_34_3), arg_34_4)
	local var_34_1 = arg_34_1:getSkillList()

	if _.all(var_34_1, function(arg_35_0)
		return ShipSkill.New(arg_34_1.skills[arg_35_0]):IsMaxLevel()
	end) then
		local var_34_2 = var_34_0 .. i18n("tactics_continue_to_learn_other_ship_skill")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideClose = true,
			content = var_34_2,
			onYes = function()
				arg_34_0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS)
			end
		})
	else
		local var_34_3 = var_34_0 .. i18n("tactics_continue_to_learn_other_skill")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideClose = true,
			content = var_34_3,
			onYes = function()
				arg_34_0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS, {
					shipToLesson = {
						shipId = arg_34_2.shipId,
						index = arg_34_2.id
					}
				})
			end
		})
	end
end

function var_0_0.HandleChapterAutoDone(arg_38_0, arg_38_1)
	local function var_38_0()
		arg_38_0:addSubLayers(Context.New({
			viewComponent = ChapterAutoTotalRewardLayer,
			mediator = ChapterAutoTotalRewardMediator,
			data = {
				rewards = arg_38_1.awards,
				totalTimes = arg_38_1.allCnt,
				finishTimes = arg_38_1.finishCnt,
				proficiency = arg_38_1.proficiency,
				onClose = function()
					arg_38_0.viewComponent:OnUpdateChapterAuto()
				end
			}
		}), true)
	end

	switch(arg_38_1.type, {
		[ChapterAutoProxy.TYPE.SLG] = function()
			var_38_0()
		end,
		[ChapterAutoProxy.TYPE.WORLD] = function()
			local var_42_0 = nowWorld()
			local var_42_1 = var_42_0:GetAtlas()
			local var_42_2 = {}

			for iter_42_0, iter_42_1 in ipairs(arg_38_1.mapList) do
				local var_42_3 = var_42_0.pressingAwardDic[iter_42_1]

				if var_42_3.flag then
					var_42_0:FlagMapPressingAward(iter_42_1)
					var_42_1:MarkMapTransport(iter_42_1)

					local var_42_4 = pg.world_event_complete[var_42_3.id].event_reward_slgbuff

					if #var_42_4 > 0 then
						var_42_2[var_42_4[1]] = defaultValue(var_42_2[var_42_4[1]], 0) + var_42_4[2]
					end
				end
			end

			local var_42_5 = {}

			for iter_42_2, iter_42_3 in pairs(var_42_2) do
				local var_42_6 = {
					id = iter_42_2,
					floor = iter_42_3,
					before = var_42_0:GetGlobalBuff(iter_42_2):GetFloor()
				}

				table.insert(var_42_5, var_42_6)
				var_42_0:AddGlobalBuff(iter_42_2, iter_42_3)
			end

			arg_38_0:addSubLayers(Context.New({
				viewComponent = WorldChapterAutoRewardLayer,
				mediator = WorldChapterAutoRewardMediator,
				data = {
					awards = arg_38_1.awards,
					buffInfos = var_42_5,
					proficiency = arg_38_1.proficiency,
					onClose = function()
						arg_38_0.viewComponent:OnUpdateChapterAuto()
					end
				}
			}), true)
		end,
		[ChapterAutoProxy.TYPE.BOSS] = function()
			var_38_0()
		end,
		[ChapterAutoProxy.TYPE.RUSH] = function()
			var_38_0()
		end
	}, function()
		assert(false, "Unknown commission type: " .. arg_38_1.type)
	end)
end

return var_0_0
