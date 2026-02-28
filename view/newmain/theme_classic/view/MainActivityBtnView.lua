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
		MainActHolidayVillaBtn.New(arg_2_0.actBtnTpl, arg_2_0.event),
		MainCoreActivityBtn2.New(arg_2_0.actBtnTpl, arg_2_0.event)
	}
	arg_2_0.specailBtns = {
		MainActInsBtn.New(arg_2_0._tf, arg_2_0.event),
		MainActTraingCampBtn.New(arg_2_0._tf, arg_2_0.event),
		MainActRefluxBtn.New(arg_2_0._tf, arg_2_0.event),
		MainActNewServerBtn.New(arg_2_0._tf, arg_2_0.event),
		MainActDelegationBtn.New(arg_2_0._tf, arg_2_0.event),
		MainIslandActDelegationBtn.New(arg_2_0._tf, arg_2_0.event),
		MainVoteEntranceBtn.New(arg_2_0._tf, arg_2_0.event),
		MainActCompensatBtn.New(arg_2_0._tf, arg_2_0.event),
		MainLoveLetterDelegationBtn.New(arg_2_0._tf, arg_2_0.event),
		MainCommonActDelegationBtn.New(arg_2_0._tf, arg_2_0.event)
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
	arg_3_0:bind(GAME.REQ_NEW_INSTAGRAM_DATA_DONE, function(arg_5_0)
		arg_3_0:OnInstagramDataUpdate()
	end)
	arg_3_0:bind(MiniGameProxy.ON_HUB_DATA_UPDATE, function(arg_6_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(GAME.SEND_MINI_GAME_OP_DONE, function(arg_7_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(GAME.GET_FEAST_DATA_DONE, function(arg_8_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(GAME.FETCH_VOTE_INFO_DONE, function(arg_9_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(GAME.ZERO_HOUR_OP_DONE, function(arg_10_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(CompensateProxy.UPDATE_ATTACHMENT_COUNT, function(arg_11_0)
		arg_3_0:Refresh()
	end)
	arg_3_0:bind(CompensateProxy.All_Compensate_Remove, function(arg_12_0)
		arg_3_0:Refresh()
	end)
end

function var_0_0.GetBtn(arg_13_0, arg_13_1)
	for iter_13_0, iter_13_1 in ipairs(arg_13_0.activityBtns) do
		if isa(iter_13_1, arg_13_1) then
			return iter_13_1
		end
	end

	for iter_13_2, iter_13_3 in ipairs(arg_13_0.specailBtns) do
		if isa(iter_13_3, arg_13_1) then
			return iter_13_3
		end
	end

	return nil
end

function var_0_0.OnRemoveLayer(arg_14_0, arg_14_1)
	local var_14_0

	if arg_14_1.mediator == LotteryMediator then
		var_14_0 = arg_14_0:GetBtn(MainActLotteryBtn)
	elseif arg_14_1.mediator == InstagramMainMediator then
		var_14_0 = arg_14_0:GetBtn(MainActInsBtn)
	end

	if var_14_0 and var_14_0:InShowTime() then
		var_14_0:OnInit()
	end
end

function var_0_0.OnInstagramDataUpdate(arg_15_0)
	local var_15_0 = arg_15_0:GetBtn(MainActInsBtn)

	if var_15_0 and var_15_0:InShowTime() then
		var_15_0:OnInit()
	end
end

function var_0_0.Init(arg_16_0)
	arg_16_0:Flush()

	arg_16_0.isInit = true
end

function var_0_0.FilterActivityBtns(arg_17_0)
	local var_17_0 = {}
	local var_17_1 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.activityBtns) do
		if iter_17_1:InShowTime() then
			table.insert(var_17_0, iter_17_1)
		else
			table.insert(var_17_1, iter_17_1)
		end
	end

	table.sort(var_17_0, CompareFuncs({
		function(arg_18_0)
			return arg_18_0.config.group_id
		end
	}))

	return var_17_0, var_17_1
end

function var_0_0.FilterSpActivityBtns(arg_19_0)
	local var_19_0 = {}
	local var_19_1 = {}

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.specailBtns) do
		if iter_19_1:InShowTime() then
			table.insert(var_19_0, iter_19_1)
		else
			table.insert(var_19_1, iter_19_1)
		end
	end

	return var_19_0, var_19_1
end

function var_0_0.Flush(arg_20_0)
	if arg_20_0.checkNotchRatio ~= NotchAdapt.CheckNotchRatio then
		arg_20_0.checkNotchRatio = NotchAdapt.CheckNotchRatio
		arg_20_0.initPos = nil
	end

	local var_20_0, var_20_1 = arg_20_0:FilterActivityBtns()

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		iter_20_1:Init(iter_20_0)
	end

	for iter_20_2, iter_20_3 in ipairs(var_20_1) do
		iter_20_3:Clear()
	end

	local var_20_2 = #var_20_0

	assert(var_20_2 <= 4, "活动按钮不能超过4个")

	local var_20_3 = var_20_2 <= 3
	local var_20_4 = var_20_3 and 1 or 0.85
	local var_20_5 = var_20_3 and 390 or 420

	arg_20_0._tf.localScale = Vector3(var_20_4, var_20_4, 1)
	arg_20_0.initPos = arg_20_0.initPos or arg_20_0._tf.localPosition

	onNextTick(function()
		if not IsNil(arg_20_0._tf) then
			arg_20_0._tf.localPosition = Vector3(arg_20_0.initPos.x, var_20_5, 0)
		end
	end)

	local var_20_6, var_20_7 = arg_20_0:FilterSpActivityBtns()

	for iter_20_4, iter_20_5 in pairs(var_20_6) do
		iter_20_5:Init(not var_20_3)
	end

	for iter_20_6, iter_20_7 in pairs(var_20_7) do
		iter_20_7:Clear()
	end
end

function var_0_0.Refresh(arg_22_0)
	if not arg_22_0.isInit then
		return
	end

	arg_22_0:Flush()

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.specailBtns) do
		if iter_22_1:InShowTime() then
			iter_22_1:Refresh()
		end
	end
end

function var_0_0.Disable(arg_23_0)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.specailBtns) do
		if iter_23_1:InShowTime() then
			iter_23_1:Disable()
		end
	end
end

function var_0_0.Dispose(arg_24_0)
	var_0_0.super.Dispose(arg_24_0)
	arg_24_0.linkBtnTopFoldableHelper:Dispose()

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.activityBtns) do
		iter_24_1:Dispose()
	end

	for iter_24_2, iter_24_3 in ipairs(arg_24_0.specailBtns) do
		iter_24_3:Dispose()
	end

	arg_24_0.specailBtns = nil
	arg_24_0.activityBtns = nil
end

function var_0_0.Fold(arg_25_0, arg_25_1, arg_25_2)
	var_0_0.super.Fold(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.linkBtnTopFoldableHelper:Fold(arg_25_1, arg_25_2)
end

function var_0_0.GetDirection(arg_26_0)
	return Vector2(1, 0)
end

return var_0_0
