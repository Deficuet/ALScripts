local var_0_0 = class("ChapterPreCombatMediator", import("..base.ContextMediator"))

var_0_0.ON_START = "ChapterPreCombatMediator:ON_START"
var_0_0.ON_SWITCH_SHIP = "ChapterPreCombatMediator:ON_SWITCH_SHIP"
var_0_0.ON_SWITCH_FLEET = "ChapterPreCombatMediator:ON_SWITCH_FLEET"
var_0_0.ON_OP = "ChapterPreCombatMediator:ON_OP"
var_0_0.ON_AUTO = "ChapterPreCombatMediator:ON_AUTO"
var_0_0.ON_SUB_AUTO = "ChapterPreCombatMediator:ON_SUB_AUTO"
var_0_0.GET_CHAPTER_DROP_SHIP_LIST = "ChapterPreCombatMediator:GET_CHAPTER_DROP_SHIP_LIST"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.GET_CHAPTER_DROP_SHIP_LIST, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:sendNotification(GAME.GET_CHAPTER_DROP_SHIP_LIST, {
			chapterId = arg_2_1,
			callback = arg_2_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_SWITCH_SHIP, function(arg_3_0, arg_3_1)
		local var_3_0 = getProxy(ChapterProxy)
		local var_3_1 = var_3_0:getActiveChapter()

		var_3_1.fleet:synchronousShipIndex(arg_3_1)
		var_3_0:updateChapter(var_3_1, ChapterConst.DirtyFleet)
	end)
	arg_1_0:bind(var_0_0.ON_AUTO, function(arg_4_0, arg_4_1)
		arg_1_0:onAutoBtn(arg_4_1)
	end)
	arg_1_0:bind(var_0_0.ON_SUB_AUTO, function(arg_5_0, arg_5_1)
		arg_1_0:onAutoSubBtn(arg_5_1)
	end)
	arg_1_0:bind(var_0_0.ON_START, function(arg_6_0)
		local var_6_0 = getProxy(ChapterProxy):getActiveChapter()
		local var_6_1 = var_6_0.fleet
		local var_6_2 = var_6_0:getStageId(var_6_1.line.row, var_6_1.line.column)

		seriesAsync({
			function(arg_7_0)
				local var_7_0 = {}

				for iter_7_0, iter_7_1 in pairs(var_6_1.ships) do
					table.insert(var_7_0, iter_7_1)
				end

				Fleet.EnergyCheck(var_7_0, var_6_1.name, function(arg_8_0)
					if arg_8_0 then
						arg_7_0()
					end
				end)
			end,
			function(arg_9_0)
				if getProxy(PlayerProxy):getRawData():GoldMax(1) then
					local var_9_0 = i18n("gold_max_tip_title") .. i18n("resource_max_tip_battle")

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = var_9_0,
						onYes = arg_9_0
					})
				else
					arg_9_0()
				end
			end
		}, function()
			arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
				system = SYSTEM_SCENARIO,
				stageId = var_6_2
			})
		end)
	end)
	arg_1_0:bind(var_0_0.ON_OP, function(arg_11_0, arg_11_1)
		arg_1_0:sendNotification(GAME.CHAPTER_OP, arg_11_1)
	end)

	local var_1_0 = getProxy(ChapterProxy)
	local var_1_1 = var_1_0:getActiveChapter()
	local var_1_2 = var_1_1.fleet
	local var_1_3 = var_1_1:getStageId(var_1_2.line.row, var_1_2.line.column)

	arg_1_0.viewComponent:setSubFlag(var_1_0.getSubAidFlag(var_1_1, var_1_3))
	arg_1_0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getRawData())
	arg_1_0:display()
end

function var_0_0.onAutoBtn(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1.isOn
	local var_12_1 = arg_12_1.toggle

	arg_12_0:sendNotification(GAME.AUTO_BOT, {
		isActiveBot = var_12_0,
		toggle = var_12_1
	})
end

function var_0_0.onAutoSubBtn(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1.isOn
	local var_13_1 = arg_13_1.toggle

	arg_13_0:sendNotification(GAME.AUTO_SUB, {
		isActiveSub = var_13_0,
		toggle = var_13_1
	})
end

function var_0_0.listNotificationInterests(arg_14_0)
	return {
		PlayerProxy.UPDATED,
		GAME.BEGIN_STAGE_ERRO,
		GAME.CHAPTER_OP_DONE
	}
end

function var_0_0.handleNotification(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1:getName()
	local var_15_1 = arg_15_1:getBody()

	if var_15_0 == PlayerProxy.UPDATED then
		arg_15_0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getRawData())
	elseif var_15_0 == GAME.BEGIN_STAGE_ERRO then
		setActive(arg_15_0.viewComponent._startBtn, true)

		if var_15_1 == 3 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("battle_preCombatMediator_timeout"),
				onYes = function()
					arg_15_0.viewComponent:emit(BaseUI.ON_CLOSE)
				end
			})
		end
	elseif var_15_0 == GAME.CHAPTER_OP_DONE and (var_15_1.type == ChapterConst.OpStrategy or var_15_1.type == ChapterConst.OpRepair or var_15_1.type == ChapterConst.OpRequest) then
		arg_15_0:display()
	end
end

function var_0_0.display(arg_17_0)
	local var_17_0 = getProxy(ChapterProxy):getActiveChapter()

	arg_17_0.viewComponent:updateChapter(var_17_0)
end

return var_0_0
