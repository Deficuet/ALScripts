local var_0_0 = class("CourtYardScene", import("..base.BaseUI"))

function var_0_0.forceGC(arg_1_0)
	return true
end

function var_0_0.getUIName(arg_2_0)
	return "CourtYardUI"
end

var_0_0.AggressivePreloadResList = {
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

function var_0_0.getResource(arg_3_0)
	local var_3_0 = var_0_0.super.getResource(arg_3_0)
	local var_3_1 = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		var_3_1[iter_3_1] = true
	end

	for iter_3_2, iter_3_3 in ipairs(var_0_0.AggressivePreloadResList) do
		if not var_3_1[iter_3_3] then
			var_3_1[iter_3_3] = true

			table.insert(var_3_0, iter_3_3)
		end
	end

	local var_3_2 = getProxy(DormProxy):getData():GetPurchasedFurnitures()

	for iter_3_4, iter_3_5 in pairs(var_3_2) do
		local var_3_3 = pg.furniture_data_template[iter_3_5.id].icon
		local var_3_4 = "furnitrues/" .. pg.furniture_data_template[iter_3_5.id].picture
		local var_3_5 = "furnitureicon/" .. var_3_3

		if not var_3_1[var_3_5] then
			var_3_1[var_3_5] = true

			table.insert(var_3_0, var_3_5)
		end

		local var_3_6 = pg.furniture_data_template[iter_3_5.id].type
		local var_3_7 = pg.furniture_data_template[iter_3_5.id].tag

		if var_3_6 == 1 and var_3_7 == 3 then
			for iter_3_6 = 1, 4 do
				if not var_3_1[var_3_4 .. iter_3_6] then
					var_3_1[var_3_4 .. iter_3_6] = true

					table.insert(var_3_0, var_3_4 .. iter_3_6)
				end
			end
		elseif not var_3_1[var_3_4] then
			var_3_1[var_3_4] = true

			table.insert(var_3_0, var_3_4)
		end
	end

	for iter_3_7 = 1, 4 do
		local var_3_8 = "furnitrues/base/road_" .. iter_3_7
		local var_3_9 = "furnitrues/base/wall_" .. iter_3_7

		if not var_3_1[var_3_8] then
			var_3_1[var_3_8] = true

			table.insert(var_3_0, var_3_8)
		end

		if not var_3_1[var_3_9] then
			var_3_1[var_3_9] = true

			table.insert(var_3_0, var_3_9)
		end
	end

	return var_3_0
end

function var_0_0.PlayBGM(arg_4_0)
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.preload(arg_5_0, arg_5_1)
	_BackyardMsgBoxMgr = BackyardMsgBoxMgr.New()

	_BackyardMsgBoxMgr:Init(arg_5_0, arg_5_1)
end

function var_0_0.SetDorm(arg_6_0, arg_6_1)
	arg_6_0.dorm = arg_6_1
end

function var_0_0.init(arg_7_0)
	if not arg_7_0.contextData.floor then
		arg_7_0.contextData.floor = 1
	end

	arg_7_0.panels = {
		CourtYardLeftPanel.New(arg_7_0),
		CourtYardRightPanel.New(arg_7_0),
		CourtYardTopPanel.New(arg_7_0),
		CourtYardBottomPanel.New(arg_7_0)
	}
	arg_7_0.mainTF = arg_7_0._tf:Find("main")
	arg_7_0.mainCG = GetOrAddComponent(arg_7_0.mainTF, typeof(CanvasGroup))
	arg_7_0.bg = arg_7_0._tf:Find("bg000")
	arg_7_0.animation = arg_7_0._tf:GetComponent(typeof(Animation))
	arg_7_0.emptyFoodPage = CourtYardEmptyFoodPage.New(arg_7_0._tf, arg_7_0.event)
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0:BlockEvents()
	arg_8_0:SetUpCourtYard()
	arg_8_0:FlushMainView()

	arg_8_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_8_0)
end

function var_0_0.OnCourtYardLoaded(arg_9_0)
	pg.OSSMgr.GetInstance():Init()
	arg_9_0:AddVisitorShip()

	if arg_9_0.contextData.mode ~= CourtYardConst.SYSTEM_VISIT then
		BackYardThemeTempalteUtil.CheckSaveDirectory()
		pg.m02:sendNotification(GAME.OPEN_ADD_EXP, 1)
	end

	arg_9_0:UnBlockEvents()

	if arg_9_0.contextData.OpenShop then
		local var_9_0 = arg_9_0:GetPanel(CourtYardBottomPanel)

		triggerButton(var_9_0.shopBtn)
	end
end

function var_0_0.UpdateDorm(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0:SetDorm(arg_10_1)
	arg_10_0:FlushMainView(arg_10_2)
end

function var_0_0.SetUpCourtYard(arg_11_0)
	seriesAsync({
		function(arg_12_0)
			if (arg_11_0.contextData.mode or CourtYardConst.SYSTEM_VISIT) ~= CourtYardConst.SYSTEM_VISIT then
				arg_12_0()

				return
			end

			arg_11_0:emit(CourtYardMediator.ON_ADD_VISITOR_SHIP, arg_12_0)
		end
	}, function()
		local var_13_0 = arg_11_0.contextData.floor

		arg_11_0:emit(CourtYardMediator.SET_UP, var_13_0)
	end)
end

function var_0_0.FlushMainView(arg_14_0, arg_14_1)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.panels) do
		table.insert(var_14_0, function(arg_15_0)
			iter_14_1:Flush(arg_14_0.dorm, arg_14_1)
			onNextTick(arg_15_0)
		end)
	end

	seriesAsync(var_14_0)
end

function var_0_0.SwitchFloorDone(arg_16_0)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0.panels) do
		iter_16_1:UpdateFloor(arg_16_0.dorm)
	end
end

function var_0_0.ShowAddFoodTip(arg_17_0)
	if arg_17_0.contextData.mode ~= CourtYardConst.SYSTEM_VISIT and arg_17_0.dorm.food == 0 and not arg_17_0.contextData.OpenShop and not pg.NewGuideMgr.GetInstance():IsBusy() and arg_17_0.dorm:GetFloorShipCnt(DormShip.FLOOR_1) > 0 and (not arg_17_0.contextData.fromMediatorName or arg_17_0.contextData.fromMediatorName ~= "DockyardMediator" and arg_17_0.contextData.fromMediatorName ~= "ShipMainMediator") and not arg_17_0.contextData.skipToCharge then
		arg_17_0.emptyFoodPage:ExecuteAction("Flush")

		arg_17_0.contextData.fromMain = nil
	end

	arg_17_0.contextData.skipToCharge = nil
end

function var_0_0.AddVisitorShip(arg_18_0)
	if arg_18_0.contextData.mode == CourtYardConst.SYSTEM_VISIT then
		return
	end

	if arg_18_0.contextData.floor ~= 1 then
		return
	end

	if not getProxy(PlayerProxy):getRawData():GetCommonFlag(SHOW_FIREND_BACKYARD_SHIP_FLAG) then
		return
	end

	local var_18_0 = getProxy(DormProxy):GetVisitorShip()

	if var_18_0 then
		_courtyard:GetController():AddVisitorShip(var_18_0)
	end
end

function var_0_0.FoldPanel(arg_19_0, arg_19_1)
	if arg_19_1 then
		arg_19_0.animation:Play("anim_courtyard_mainui_hide")
	else
		arg_19_0.animation:Play("anim_courtyard_mainui_in")
	end
end

function var_0_0.OnEnterOrExitEdit(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.panels) do
		iter_20_1:OnEnterOrExitEdit(arg_20_1)
	end

	Input.multiTouchEnabled = not arg_20_1
end

function var_0_0.BlockEvents(arg_21_0)
	arg_21_0.mainCG.blocksRaycasts = false
end

function var_0_0.UnBlockEvents(arg_22_0)
	arg_22_0.mainCG.blocksRaycasts = true
end

function var_0_0.OnRemoveLayer(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.panels) do
		iter_23_1:OnRemoveLayer(arg_23_1.context.mediator)
	end
end

function var_0_0.OnReconnection(arg_24_0)
	pg.m02:sendNotification(GAME.OPEN_ADD_EXP, 1)
end

function var_0_0.OnAddFurniture(arg_25_0)
	arg_25_0:GetPanel(CourtYardTopPanel):OnFlush(BackYardConst.DORM_UPDATE_TYPE_LEVEL)
end

function var_0_0.GetPanel(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in ipairs(arg_26_0.panels) do
		if isa(iter_26_1, arg_26_1) then
			return iter_26_1
		end
	end
end

function var_0_0.onBackPressed(arg_27_0)
	for iter_27_0, iter_27_1 in ipairs(arg_27_0.panels) do
		if iter_27_1:onBackPressed() then
			return
		end
	end

	if _courtyard then
		_courtyard:GetController():OnBackPressed()
	else
		var_0_0.super.onBackPressed(arg_27_0)
	end
end

function var_0_0.willExit(arg_28_0)
	_BackyardMsgBoxMgr:Destroy()

	_BackyardMsgBoxMgr = nil

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.panels) do
		iter_28_1:Detach()
	end

	arg_28_0.emptyFoodPage:Destroy()

	arg_28_0.emptyFoodPage = nil

	if arg_28_0.bulinTip then
		arg_28_0.bulinTip:Destroy()

		arg_28_0.bulinTip = nil
	end

	if arg_28_0.contextData.mode ~= CourtYardConst.SYSTEM_VISIT then
		pg.m02:sendNotification(GAME.OPEN_ADD_EXP, 0)
	end

	getProxy(DormProxy):getRawData():ClearNewFlag()
end

return var_0_0
