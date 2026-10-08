local var_0_0 = class("CourtYardScene", import("..base.BaseUI"))

function var_0_0.forceGC(arg_1_0)
	return true
end

function var_0_0.getUIName(arg_2_0)
	return "CourtYardUI"
end

function var_0_0.getAggressivePreloadResList(arg_3_0, arg_3_1)
	return {
		"ui/BackYardMsgBox",
		"ui/CourtyardUI_atlas",
		"ui/BackyardFeedUI",
		"ui/BackYardFeedShopPanel",
		"ui/BackYardFeedExtendPanel",
		"ui/NewBackYardShipInfoUI",
		"shipframeb",
		"shiptype",
		"ui/proposeShipCard",
		"ui/NewBackYardShopUI",
		"ui/NewBackYardShopUI_atlas",
		"ui/BackYardThemePage",
		"ui/BackYardThemeInfoPage",
		"ui/BackYardFurniturePage",
		"ui/FurnitureMsgboxPage",
		"ui/ThemeMsgboxPage",
		"ui/BackYardIndexUI",
		"BackYardTheme/theme_1",
		"BackYardTheme/1",
		"furnitureicon/default_theme",
		"QIcon/unknown",
		"weaponframes",
		"ui/BackYardInterActionPreview",
		"ui/BackYardDecorationUI",
		"ui/NewBackYardDecorateUI_atlas",
		"ui/BackYardDecorationThemePage",
		"ui/BackYardDecorationFurniturePage",
		"ui/BackYardPutListPage",
		"ui/BackYardDecorationMsgBox",
		"ui/BackYardDecorationDescUI",
		"ui/BackYardStatisticsUI",
		"UI/CourtYardStoreyModule",
		"UI/CourtYardFeastStoreyModule",
		"UI/CourtYardStoreyPreviewModule",
		"ui/CourtYardFurniture",
		"ui/CourtYardGrid",
		"ui/CourtYardShip",
		"ui/CourtYardWallGrid",
		"Effect/Heart"
	}
end

function var_0_0.getResource(arg_4_0, arg_4_1)
	local var_4_0 = var_0_0.super.getResource(arg_4_0, arg_4_1)
	local var_4_1 = {}

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		var_4_1[iter_4_1] = true
	end

	for iter_4_2, iter_4_3 in ipairs(arg_4_0:getAggressivePreloadResList(arg_4_1)) do
		if not var_4_1[iter_4_3] then
			var_4_1[iter_4_3] = true

			table.insert(var_4_0, iter_4_3)
		end
	end

	local var_4_2 = getProxy(DormProxy):getData():GetPurchasedFurnitures()

	for iter_4_4, iter_4_5 in pairs(var_4_2) do
		local var_4_3 = pg.furniture_data_template[iter_4_5.id].icon
		local var_4_4 = "furnitrues/" .. pg.furniture_data_template[iter_4_5.id].picture
		local var_4_5 = "furnitureicon/" .. var_4_3

		if not var_4_1[var_4_5] then
			var_4_1[var_4_5] = true

			table.insert(var_4_0, var_4_5)
		end

		local var_4_6 = pg.furniture_data_template[iter_4_5.id].type
		local var_4_7 = pg.furniture_data_template[iter_4_5.id].tag

		if var_4_6 == 1 and var_4_7 == 3 then
			for iter_4_6 = 1, 4 do
				if not var_4_1[var_4_4 .. iter_4_6] then
					var_4_1[var_4_4 .. iter_4_6] = true

					table.insert(var_4_0, var_4_4 .. iter_4_6)
				end
			end
		elseif not var_4_1[var_4_4] then
			var_4_1[var_4_4] = true

			table.insert(var_4_0, var_4_4)
		end
	end

	for iter_4_7 = 1, 4 do
		local var_4_8 = "furnitrues/base/road_" .. iter_4_7
		local var_4_9 = "furnitrues/base/wall_" .. iter_4_7

		if not var_4_1[var_4_8] then
			var_4_1[var_4_8] = true

			table.insert(var_4_0, var_4_8)
		end

		if not var_4_1[var_4_9] then
			var_4_1[var_4_9] = true

			table.insert(var_4_0, var_4_9)
		end
	end

	return var_4_0
end

function var_0_0.PlayBGM(arg_5_0)
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.preload(arg_6_0, arg_6_1)
	_BackyardMsgBoxMgr = BackyardMsgBoxMgr.New()

	_BackyardMsgBoxMgr:Init(arg_6_0, arg_6_1)
end

function var_0_0.SetDorm(arg_7_0, arg_7_1)
	arg_7_0.dorm = arg_7_1
end

function var_0_0.init(arg_8_0)
	if not arg_8_0.contextData.floor then
		arg_8_0.contextData.floor = 1
	end

	arg_8_0.panels = {
		CourtYardLeftPanel.New(arg_8_0),
		CourtYardRightPanel.New(arg_8_0),
		CourtYardTopPanel.New(arg_8_0),
		CourtYardBottomPanel.New(arg_8_0)
	}
	arg_8_0.mainTF = arg_8_0._tf:Find("main")
	arg_8_0.mainCG = GetOrAddComponent(arg_8_0.mainTF, typeof(CanvasGroup))
	arg_8_0.bg = arg_8_0._tf:Find("bg000")
	arg_8_0.animation = arg_8_0._tf:GetComponent(typeof(Animation))
	arg_8_0.emptyFoodPage = CourtYardEmptyFoodPage.New(arg_8_0._tf, arg_8_0.event)
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0:BlockEvents()
	arg_9_0:SetUpCourtYard()
	arg_9_0:FlushMainView()

	arg_9_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_9_0)
end

function var_0_0.OnCourtYardLoaded(arg_10_0)
	pg.OSSMgr.GetInstance():Init()
	arg_10_0:AddVisitorShip()

	if arg_10_0.contextData.mode ~= CourtYardConst.SYSTEM_VISIT then
		BackYardThemeTempalteUtil.CheckSaveDirectory()
		pg.m02:sendNotification(GAME.OPEN_ADD_EXP, 1)
	end

	arg_10_0:UnBlockEvents()

	if arg_10_0.contextData.OpenShop then
		local var_10_0 = arg_10_0:GetPanel(CourtYardBottomPanel)

		triggerButton(var_10_0.shopBtn)
	end
end

function var_0_0.UpdateDorm(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0:SetDorm(arg_11_1)
	arg_11_0:FlushMainView(arg_11_2)
end

function var_0_0.SetUpCourtYard(arg_12_0)
	seriesAsync({
		function(arg_13_0)
			if (arg_12_0.contextData.mode or CourtYardConst.SYSTEM_VISIT) ~= CourtYardConst.SYSTEM_VISIT then
				arg_13_0()

				return
			end

			arg_12_0:emit(CourtYardMediator.ON_ADD_VISITOR_SHIP, arg_13_0)
		end
	}, function()
		local var_14_0 = arg_12_0.contextData.floor

		arg_12_0:emit(CourtYardMediator.SET_UP, var_14_0)
	end)
end

function var_0_0.FlushMainView(arg_15_0, arg_15_1)
	local var_15_0 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.panels) do
		table.insert(var_15_0, function(arg_16_0)
			iter_15_1:Flush(arg_15_0.dorm, arg_15_1)
			onNextTick(arg_16_0)
		end)
	end

	seriesAsync(var_15_0)
end

function var_0_0.SwitchFloorDone(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.panels) do
		iter_17_1:UpdateFloor(arg_17_0.dorm)
	end
end

function var_0_0.ShowAddFoodTip(arg_18_0)
	if arg_18_0.contextData.mode ~= CourtYardConst.SYSTEM_VISIT and arg_18_0.dorm.food == 0 and not arg_18_0.contextData.OpenShop and not pg.NewGuideMgr.GetInstance():IsBusy() and arg_18_0.dorm:GetFloorShipCnt(DormShip.FLOOR_1) > 0 and (not arg_18_0.contextData.fromMediatorName or arg_18_0.contextData.fromMediatorName ~= "DockyardMediator" and arg_18_0.contextData.fromMediatorName ~= "ShipMainMediator") and not arg_18_0.contextData.skipToCharge then
		arg_18_0.emptyFoodPage:ExecuteAction("Flush")

		arg_18_0.contextData.fromMain = nil
	end

	arg_18_0.contextData.skipToCharge = nil
end

function var_0_0.AddVisitorShip(arg_19_0)
	if arg_19_0.contextData.mode == CourtYardConst.SYSTEM_VISIT then
		return
	end

	if arg_19_0.contextData.floor ~= 1 then
		return
	end

	if not getProxy(PlayerProxy):getRawData():GetCommonFlag(SHOW_FIREND_BACKYARD_SHIP_FLAG) then
		return
	end

	local var_19_0 = getProxy(DormProxy):GetVisitorShip()

	if var_19_0 then
		_courtyard:GetController():AddVisitorShip(var_19_0)
	end
end

function var_0_0.FoldPanel(arg_20_0, arg_20_1)
	if arg_20_1 then
		arg_20_0.animation:Play("anim_courtyard_mainui_hide")
	else
		arg_20_0.animation:Play("anim_courtyard_mainui_in")
	end
end

function var_0_0.OnEnterOrExitEdit(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0.panels) do
		iter_21_1:OnEnterOrExitEdit(arg_21_1)
	end

	Input.multiTouchEnabled = not arg_21_1
end

function var_0_0.BlockEvents(arg_22_0)
	arg_22_0.mainCG.blocksRaycasts = false
end

function var_0_0.UnBlockEvents(arg_23_0)
	arg_23_0.mainCG.blocksRaycasts = true
end

function var_0_0.OnRemoveLayer(arg_24_0, arg_24_1)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.panels) do
		iter_24_1:OnRemoveLayer(arg_24_1.context.mediator)
	end
end

function var_0_0.OnReconnection(arg_25_0)
	pg.m02:sendNotification(GAME.OPEN_ADD_EXP, 1)
end

function var_0_0.OnAddFurniture(arg_26_0)
	arg_26_0:GetPanel(CourtYardTopPanel):OnFlush(BackYardConst.DORM_UPDATE_TYPE_LEVEL)
end

function var_0_0.GetPanel(arg_27_0, arg_27_1)
	for iter_27_0, iter_27_1 in ipairs(arg_27_0.panels) do
		if isa(iter_27_1, arg_27_1) then
			return iter_27_1
		end
	end
end

function var_0_0.onBackPressed(arg_28_0)
	for iter_28_0, iter_28_1 in ipairs(arg_28_0.panels) do
		if iter_28_1:onBackPressed() then
			return
		end
	end

	if _courtyard then
		_courtyard:GetController():OnBackPressed()
	else
		var_0_0.super.onBackPressed(arg_28_0)
	end
end

function var_0_0.willExit(arg_29_0)
	_BackyardMsgBoxMgr:Destroy()

	_BackyardMsgBoxMgr = nil

	for iter_29_0, iter_29_1 in ipairs(arg_29_0.panels) do
		iter_29_1:Detach()
	end

	arg_29_0.emptyFoodPage:Destroy()

	arg_29_0.emptyFoodPage = nil

	if arg_29_0.bulinTip then
		arg_29_0.bulinTip:Destroy()

		arg_29_0.bulinTip = nil
	end

	if arg_29_0.contextData.mode ~= CourtYardConst.SYSTEM_VISIT then
		pg.m02:sendNotification(GAME.OPEN_ADD_EXP, 0)
	end

	getProxy(DormProxy):getRawData():ClearNewFlag()
end

return var_0_0
