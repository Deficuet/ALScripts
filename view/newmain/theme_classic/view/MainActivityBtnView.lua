local var_0_0 = class("MainActivityBtnView", import("...base.MainBaseView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.initPos = nil
	arg_1_0.isInit = nil
	arg_1_0.actBtnTpl = arg_1_1:Find("actBtn")
	arg_1_0.linkBtnTopFoldableHelper = MainFoldableHelper.New(arg_1_0._tf.parent:Find("link_top"), Vector2(0, 1))
	arg_1_0.checkNotchRatio = NotchAdapt.CheckNotchRatio

	arg_1_0:InitBtns()
	arg_1_0:Register()
end

function var_0_0.InitBtns(arg_2_0)
	arg_2_0.activityBtns = {
		MainActSummaryBtn.New(arg_2_0.actBtnTpl, arg_2_0.event, true),
		MainCoreActivityBtn.New(arg_2_0.actBtnTpl, arg_2_0.event, false),
		MainActEscortBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActMapBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActBossBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActBackHillBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActAtelierBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainLanternFestivalBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActBossRushBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActAprilFoolBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActMedalCollectionBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActSenranBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActBossSingleBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActLayerBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActDreamlandBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActBoatAdBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActBlackFridaySalesBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActToLoveBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainActHolidayVillaBtn.New(arg_2_0.actBtnTpl, arg_2_0.event)
	}
	arg_2_0.specailBtns = {
		MainActInsBtn.New(arg_2_0._tf, arg_2_0.event),
		MainActTraingCampBtn.New(arg_2_0._tf, arg_2_0.event),
		MainActRefluxBtn.New(arg_2_0._tf, arg_2_0.event),
		MainActNewServerBtn.New(arg_2_0._tf, arg_2_0.event),
		MainActDelegationBtn.New(arg_2_0._tf, arg_2_0.event),
		MainIslandActDelegationBtn.New(arg_2_0._tf, arg_2_0.event),
		MainVoteEntranceBtn.New(arg_2_0._tf, arg_2_0.event),
		MainActCompensatBtn.New(arg_2_0._tf, arg_2_0.event)
	}

	if pg.SdkMgr.GetInstance():CheckAudit() then
		arg_2_0.specailBtns = {
			MainActTraingCampBtn.New(arg_2_0._tf, arg_2_0.event)
		}
	end
end

function var_0_0.Register(arg_3_0)
	arg_3_0:bind(GAME.REMOVE_LAYERS, function(arg_4_0, arg_4_1)
		arg_3_0:OnRemoveLayer(arg_4_1.context)
	end)
	arg_3_0:bind(MiniGameProxy.ON_HUB_DATA_UPDATE, function(arg_5_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(GAME.SEND_MINI_GAME_OP_DONE, function(arg_6_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(GAME.GET_FEAST_DATA_DONE, function(arg_7_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(GAME.FETCH_VOTE_INFO_DONE, function(arg_8_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(GAME.ZERO_HOUR_OP_DONE, function(arg_9_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(CompensateProxy.UPDATE_ATTACHMENT_COUNT, function(arg_10_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(CompensateProxy.All_Compensate_Remove, function(arg_11_0)
		arg_3_0:Refresh()
	end)
end

function var_0_0.GetBtn(arg_12_0, arg_12_1)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0.activityBtns) do
		if isa(iter_12_1, arg_12_1) then
			return iter_12_1
		end
	end

	for iter_12_2, iter_12_3 in ipairs(arg_12_0.specailBtns) do
		if isa(iter_12_3, arg_12_1) then
			return iter_12_3
		end
	end

	return nil
end

function var_0_0.OnRemoveLayer(arg_13_0, arg_13_1)
	local var_13_0

	if arg_13_1.mediator == LotteryMediator then
		var_13_0 = arg_13_0:GetBtn(MainActLotteryBtn)
	elseif arg_13_1.mediator == InstagramMainMediator then
		var_13_0 = arg_13_0:GetBtn(MainActInsBtn)
	end

	if var_13_0 and var_13_0:InShowTime() then
		var_13_0:OnInit()
	end
end

function var_0_0.Init(arg_14_0)
	arg_14_0:Flush()

	arg_14_0.isInit = true
end

function var_0_0.FilterActivityBtns(arg_15_0)
	local var_15_0 = {}
	local var_15_1 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.activityBtns) do
		if iter_15_1:InShowTime() then
			table.insert(var_15_0, iter_15_1)
		else
			table.insert(var_15_1, iter_15_1)
		end
	end

	table.sort(var_15_0, function(arg_16_0, arg_16_1)
		return arg_16_0.config.group_id < arg_16_1.config.group_id
	end)

	return var_15_0, var_15_1
end

function var_0_0.FilterSpActivityBtns(arg_17_0)
	local var_17_0 = {}
	local var_17_1 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.specailBtns) do
		if iter_17_1:InShowTime() then
			table.insert(var_17_0, iter_17_1)
		else
			table.insert(var_17_1, iter_17_1)
		end
	end

	return var_17_0, var_17_1
end

function var_0_0.Flush(arg_18_0)
	if arg_18_0.checkNotchRatio ~= NotchAdapt.CheckNotchRatio then
		arg_18_0.checkNotchRatio = NotchAdapt.CheckNotchRatio
		arg_18_0.initPos = nil
	end

	local var_18_0, var_18_1 = arg_18_0:FilterActivityBtns()

	for iter_18_0, iter_18_1 in ipairs(var_18_0) do
		iter_18_1:Init(iter_18_0)
	end

	for iter_18_2, iter_18_3 in ipairs(var_18_1) do
		iter_18_3:Clear()
	end

	local var_18_2 = #var_18_0

	assert(var_18_2 <= 4, "活动按钮不能超过4个")

	local var_18_3 = var_18_2 <= 3
	local var_18_4 = var_18_3 and 1 or 0.85
	local var_18_5 = var_18_3 and 390 or 420

	arg_18_0._tf.localScale = Vector3(var_18_4, var_18_4, 1)
	arg_18_0.initPos = arg_18_0.initPos or arg_18_0._tf.localPosition
	arg_18_0._tf.localPosition = Vector3(arg_18_0.initPos.x, var_18_5, 0)

	local var_18_6, var_18_7 = arg_18_0:FilterSpActivityBtns()

	for iter_18_4, iter_18_5 in pairs(var_18_6) do
		iter_18_5:Init(not var_18_3)
	end

	for iter_18_6, iter_18_7 in pairs(var_18_7) do
		iter_18_7:Clear()
	end
end

function var_0_0.Refresh(arg_19_0)
	if not arg_19_0.isInit then
		return
	end

	arg_19_0:Flush()

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.specailBtns) do
		if iter_19_1:InShowTime() then
			iter_19_1:Refresh()
		end
	end
end

function var_0_0.Disable(arg_20_0)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.specailBtns) do
		if iter_20_1:InShowTime() then
			iter_20_1:Disable()
		end
	end
end

function var_0_0.Dispose(arg_21_0)
	var_0_0.super.Dispose(arg_21_0)
	arg_21_0.linkBtnTopFoldableHelper:Dispose()

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.activityBtns) do
		iter_21_1:Dispose()
	end

	for iter_21_2, iter_21_3 in ipairs(arg_21_0.specailBtns) do
		iter_21_3:Dispose()
	end

	arg_21_0.specailBtns = nil
	arg_21_0.activityBtns = nil
end

function var_0_0.Fold(arg_22_0, arg_22_1, arg_22_2)
	var_0_0.super.Fold(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0.linkBtnTopFoldableHelper:Fold(arg_22_1, arg_22_2)
end

function var_0_0.GetDirection(arg_23_0)
	return Vector2(1, 0)
end

return var_0_0
