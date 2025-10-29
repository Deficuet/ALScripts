local var_0_0 = class("CourtYardScene", import("..base.BaseUI"))

function var_0_0.forceGC(arg_1_0)
	return true
end

function var_0_0.getUIName(arg_2_0)
	return "CourtYardUI"
end

function var_0_0.PlayBGM(arg_3_0)
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.preload(arg_4_0, arg_4_1)
	_BackyardMsgBoxMgr = BackyardMsgBoxMgr.New()

	_BackyardMsgBoxMgr:Init(arg_4_0, arg_4_1)
end

function var_0_0.SetDorm(arg_5_0, arg_5_1)
	arg_5_0.dorm = arg_5_1
end

function var_0_0.init(arg_6_0)
	if not arg_6_0.contextData.floor then
		arg_6_0.contextData.floor = 1
	end

	arg_6_0.panels = {
		CourtYardLeftPanel.New(arg_6_0),
		CourtYardRightPanel.New(arg_6_0),
		CourtYardTopPanel.New(arg_6_0),
		CourtYardBottomPanel.New(arg_6_0)
	}
	arg_6_0.mainTF = arg_6_0._tf:Find("main")
	arg_6_0.mainCG = GetOrAddComponent(arg_6_0.mainTF, typeof(CanvasGroup))
	arg_6_0.bg = arg_6_0._tf:Find("bg000")
	arg_6_0.animation = arg_6_0._tf:GetComponent(typeof(Animation))
	arg_6_0.emptyFoodPage = CourtYardEmptyFoodPage.New(arg_6_0._tf, arg_6_0.event)
end

function var_0_0.didEnter(arg_7_0)
	arg_7_0:BlockEvents()
	arg_7_0:SetUpCourtYard()
	arg_7_0:FlushMainView()

	arg_7_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_7_0)
end

function var_0_0.OnCourtYardLoaded(arg_8_0)
	pg.OSSMgr.GetInstance():Init()
	arg_8_0:AddVisitorShip()

	if arg_8_0.contextData.mode ~= CourtYardConst.SYSTEM_VISIT then
		BackYardThemeTempalteUtil.CheckSaveDirectory()
		pg.m02:sendNotification(GAME.OPEN_ADD_EXP, 1)
	end

	arg_8_0:UnBlockEvents()

	if arg_8_0.contextData.OpenShop then
		local var_8_0 = arg_8_0:GetPanel(CourtYardBottomPanel)

		triggerButton(var_8_0.shopBtn)
	end
end

function var_0_0.UpdateDorm(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0:SetDorm(arg_9_1)
	arg_9_0:FlushMainView(arg_9_2)
end

function var_0_0.SetUpCourtYard(arg_10_0)
	local var_10_0 = arg_10_0.contextData.floor

	arg_10_0:emit(CourtYardMediator.SET_UP, var_10_0)
end

function var_0_0.FlushMainView(arg_11_0, arg_11_1)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.panels) do
		table.insert(var_11_0, function(arg_12_0)
			iter_11_1:Flush(arg_11_0.dorm, arg_11_1)
			onNextTick(arg_12_0)
		end)
	end

	seriesAsync(var_11_0)
end

function var_0_0.SwitchFloorDone(arg_13_0)
	for iter_13_0, iter_13_1 in ipairs(arg_13_0.panels) do
		iter_13_1:UpdateFloor(arg_13_0.dorm)
	end
end

function var_0_0.ShowAddFoodTip(arg_14_0)
	if arg_14_0.contextData.mode ~= CourtYardConst.SYSTEM_VISIT and arg_14_0.dorm.food == 0 and not arg_14_0.contextData.OpenShop and not pg.NewGuideMgr.GetInstance():IsBusy() and arg_14_0.dorm:GetStateShipCnt(Ship.STATE_TRAIN) > 0 and (not arg_14_0.contextData.fromMediatorName or arg_14_0.contextData.fromMediatorName ~= "DockyardMediator" and arg_14_0.contextData.fromMediatorName ~= "ShipMainMediator") and not arg_14_0.contextData.skipToCharge then
		arg_14_0.emptyFoodPage:ExecuteAction("Flush")

		arg_14_0.contextData.fromMain = nil
	end

	arg_14_0.contextData.skipToCharge = nil
end

function var_0_0.AddVisitorShip(arg_15_0)
	if arg_15_0.contextData.mode == CourtYardConst.SYSTEM_VISIT then
		return
	end

	if arg_15_0.contextData.floor ~= 1 then
		return
	end

	if not getProxy(PlayerProxy):getRawData():GetCommonFlag(SHOW_FIREND_BACKYARD_SHIP_FLAG) then
		return
	end

	arg_15_0:emit(CourtYardMediator.ON_ADD_VISITOR_SHIP)
end

function var_0_0.FoldPanel(arg_16_0, arg_16_1)
	if arg_16_1 then
		arg_16_0.animation:Play("anim_courtyard_mainui_hide")
	else
		arg_16_0.animation:Play("anim_courtyard_mainui_in")
	end
end

function var_0_0.OnEnterOrExitEdit(arg_17_0, arg_17_1)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.panels) do
		iter_17_1:OnEnterOrExitEdit(arg_17_1)
	end

	Input.multiTouchEnabled = not arg_17_1
end

function var_0_0.BlockEvents(arg_18_0)
	arg_18_0.mainCG.blocksRaycasts = false
end

function var_0_0.UnBlockEvents(arg_19_0)
	arg_19_0.mainCG.blocksRaycasts = true
end

function var_0_0.OnRemoveLayer(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.panels) do
		iter_20_1:OnRemoveLayer(arg_20_1.context.mediator)
	end
end

function var_0_0.OnReconnection(arg_21_0)
	pg.m02:sendNotification(GAME.OPEN_ADD_EXP, 1)
end

function var_0_0.OnAddFurniture(arg_22_0)
	arg_22_0:GetPanel(CourtYardTopPanel):OnFlush(BackYardConst.DORM_UPDATE_TYPE_LEVEL)
end

function var_0_0.GetPanel(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.panels) do
		if isa(iter_23_1, arg_23_1) then
			return iter_23_1
		end
	end
end

function var_0_0.onBackPressed(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.panels) do
		if iter_24_1:onBackPressed() then
			return
		end
	end

	if _courtyard then
		_courtyard:GetController():OnBackPressed()
	else
		var_0_0.super.onBackPressed(arg_24_0)
	end
end

function var_0_0.willExit(arg_25_0)
	_BackyardMsgBoxMgr:Destroy()

	_BackyardMsgBoxMgr = nil

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.panels) do
		iter_25_1:Detach()
	end

	arg_25_0.emptyFoodPage:Destroy()

	arg_25_0.emptyFoodPage = nil

	if arg_25_0.bulinTip then
		arg_25_0.bulinTip:Destroy()

		arg_25_0.bulinTip = nil
	end

	if arg_25_0.contextData.mode ~= CourtYardConst.SYSTEM_VISIT then
		pg.m02:sendNotification(GAME.OPEN_ADD_EXP, 0)
	end

	getProxy(DormProxy):ClearNewFlag()
end

return var_0_0
