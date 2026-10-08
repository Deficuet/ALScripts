local var_0_0 = class("NavalAcademyScene", import("..base.BaseUI"))

var_0_0.WARP_TO_TACTIC = "WARP_TO_TACTIC"

function var_0_0.getUIName(arg_1_0)
	local var_1_0 = pg.activity_banner.get_id_list_by_type[GAMEUI_BANNER_13]
	local var_1_1 = _.filter(var_1_0, function(arg_2_0)
		local var_2_0 = pg.activity_banner[arg_2_0].time

		return pg.TimeMgr.GetInstance():inTime(var_2_0)
	end)
	local var_1_2 = pg.activity_banner[var_1_1[1]]
	local var_1_3 = var_1_2 and var_1_2.pic
	local var_1_4 = pg.naval_academy_theme[var_1_3]

	return var_1_4 and var_1_4.resource_path or "NavalAcademyUI"
end

function var_0_0.getResource(arg_3_0, arg_3_1)
	local var_3_0 = {
		"ui/xueyuan02",
		"ui/resourcefieldui_atlas"
	}
	local var_3_1 = (function()
		local var_4_0 = {}
		local var_4_1 = pg.activity_banner.get_id_list_by_type[GAMEUI_BANNER_13]

		for iter_4_0, iter_4_1 in ipairs(var_4_1) do
			local var_4_2 = pg.activity_banner[iter_4_1]
			local var_4_3

			var_4_3 = var_4_2 and var_4_2.pic

			local var_4_4 = var_4_2 and var_4_2.resource_path or "NavalAcademyUI"

			table.insert(var_4_0, "ui/" .. var_4_4)
		end

		return var_4_0
	end)()
	local var_3_2 = NavalAcademyShipsView.GetCharResList()

	return ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_3_0, arg_3_1), var_3_0, var_3_1, var_3_2)
end

function var_0_0.ResUISettings(arg_5_0)
	return true
end

function var_0_0.SetOilResField(arg_6_0, arg_6_1)
	arg_6_0.oilResField = arg_6_1
end

function var_0_0.SetGoldResField(arg_7_0, arg_7_1)
	arg_7_0.goldResField = arg_7_1
end

function var_0_0.SetClassResField(arg_8_0, arg_8_1)
	arg_8_0.classResField = arg_8_1
end

function var_0_0.SetPlayer(arg_9_0, arg_9_1)
	arg_9_0.player = arg_9_1
end

function var_0_0.UpdatePlayer(arg_10_0, arg_10_1)
	arg_10_0.player = arg_10_1
end

function var_0_0.onUILoaded(arg_11_0, arg_11_1)
	arg_11_1.name = "NavalAcademyUI"

	var_0_0.super.onUILoaded(arg_11_0, arg_11_1)
end

function var_0_0.init(arg_12_0)
	arg_12_0.backBtn = arg_12_0._tf:Find("blur_container/adapt/top/title/back")
	arg_12_0._blurLayer = arg_12_0._tf:Find("blur_container")
	arg_12_0._topPanel = arg_12_0._blurLayer:Find("adapt/top")
	arg_12_0.bg = arg_12_0._tf:Find("academyMap/map")
	arg_12_0.buildings = {
		ShopBuiding.New(arg_12_0),
		CanteenBuiding.New(arg_12_0),
		ClassRoomBuilding.New(arg_12_0),
		FountainBuiding.New(arg_12_0),
		TacticRoomBuilding.New(arg_12_0),
		CommanderBuilding.New(arg_12_0),
		SupplyShopBuilding.New(arg_12_0),
		MinigameHallBuilding.New(arg_12_0)
	}
	arg_12_0.shipsView = NavalAcademyShipsView.New(arg_12_0)
	arg_12_0.resPage = ResourcePage.New(arg_12_0._tf, arg_12_0.event)
end

function var_0_0.didEnter(arg_13_0)
	onButton(arg_13_0, arg_13_0.backBtn, function()
		arg_13_0:ExitAnim()
		arg_13_0:emit(var_0_0.ON_BACK, nil, 0.3)
	end, SFX_CANCEL)
	arg_13_0:InitBuildings()
	arg_13_0.shipsView:BindBuildings(arg_13_0.buildings)
	arg_13_0:UpdatePlayer(arg_13_0.player)
	arg_13_0:LoadEffects()
	arg_13_0:OpenDefaultLayer()
	arg_13_0:EnterAnim()
	arg_13_0:InitChars()

	arg_13_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_13_0)
end

function var_0_0.InitBuildings(arg_15_0)
	for iter_15_0, iter_15_1 in ipairs(arg_15_0.buildings) do
		iter_15_1:Init()
	end
end

function var_0_0.EnterAnim(arg_16_0)
	setAnchoredPosition(arg_16_0._topPanel, {
		y = 84
	})
	shiftPanel(arg_16_0._topPanel, nil, 0, 0.3, 0, true, true)
end

function var_0_0.ExitAnim(arg_17_0)
	shiftPanel(arg_17_0._topPanel, nil, arg_17_0._topPanel.rect.height, 0.3, 0, true, true)
end

function var_0_0.OpenDefaultLayer(arg_18_0)
	arg_18_0.warp = arg_18_0.contextData.warp
	arg_18_0.contextData.warp = nil

	if arg_18_0.warp == var_0_0.WARP_TO_TACTIC then
		arg_18_0:emit(NavalAcademyMediator.ON_OPEN_TACTICROOM)
	end
end

function var_0_0.LoadEffects(arg_19_0)
	arg_19_0:LoadWaveEffect()
	arg_19_0:LoadMainEffect()
end

function var_0_0.LoadWaveEffect(arg_20_0)
	arg_20_0:GetEffect("xueyuan02", function(arg_21_0)
		setParent(arg_21_0, arg_20_0.bg)

		arg_20_0.waveEffect = arg_21_0
	end)
end

function var_0_0.LoadMainEffect(arg_22_0)
	return
end

function var_0_0.InitChars(arg_23_0)
	arg_23_0.shipsView:Init()
end

function var_0_0.OpenGoldResField(arg_24_0)
	arg_24_0.resPage:ExecuteAction("Flush", arg_24_0.goldResField)
end

function var_0_0.OpenOilResField(arg_25_0)
	arg_25_0.resPage:ExecuteAction("Flush", arg_25_0.oilResField)
end

function var_0_0.OnAddLayer(arg_26_0)
	arg_26_0.layerCnt = (arg_26_0.layerCnt or 0) + 1

	if arg_26_0.layerCnt == 1 then
		arg_26_0:EnableEffects(false)
	end
end

function var_0_0.OnRemoveLayer(arg_27_0, arg_27_1)
	arg_27_0.layerCnt = (arg_27_0.layerCnt or 0) - 1

	if arg_27_0.layerCnt <= 0 then
		arg_27_0.layerCnt = 0

		arg_27_0:EnableEffects(true)
	end

	if arg_27_1.context.mediator == NewNavalTacticsMediator then
		arg_27_0.buildings[5]:RefreshTip()
	end
end

function var_0_0.EnableEffects(arg_28_0, arg_28_1)
	if arg_28_0.waveEffect then
		setActive(arg_28_0.waveEffect, arg_28_1)
	end

	if arg_28_0.mainEffect then
		setActive(arg_28_0.mainEffect, arg_28_1)
	end
end

function var_0_0.OnGetRes(arg_29_0, arg_29_1, arg_29_2)
	if arg_29_0.buildings[arg_29_1] then
		arg_29_0.buildings[arg_29_1]:PlayGetResAnim(arg_29_2)
	end
end

function var_0_0.OnStartUpgradeResField(arg_30_0, arg_30_1)
	local var_30_0

	if isa(arg_30_1, OilResourceField) then
		var_30_0 = arg_30_0.buildings[2]
		page = arg_30_0.resPage
	elseif isa(arg_30_1, GoldResourceField) then
		var_30_0 = arg_30_0.buildings[1]
		page = arg_30_0.resPage
	elseif isa(arg_30_1, ClassResourceField) then
		var_30_0 = arg_30_0.buildings[3]
	end

	if var_30_0 then
		var_30_0:UpdateResField()
	end

	if page and page:GetLoaded() and page:isShowing() and page.resourceField and page.resourceField:GetKeyWord() == arg_30_1:GetKeyWord() then
		page:Update(arg_30_1)
	end
end

function var_0_0.OnResFieldLevelUp(arg_31_0, arg_31_1)
	arg_31_0:OnStartUpgradeResField(arg_31_1)
end

function var_0_0.OnCollectionUpdate(arg_32_0)
	arg_32_0.buildings[4]:RefreshTip()
end

function var_0_0.RefreshChars(arg_33_0)
	arg_33_0.shipsView:Refresh()
end

function var_0_0.willExit(arg_34_0)
	for iter_34_0, iter_34_1 in ipairs(arg_34_0.buildings) do
		iter_34_1:Dispose()
	end

	arg_34_0.buildings = nil

	if arg_34_0.resPage then
		arg_34_0.resPage:Destroy()

		arg_34_0.resPage = nil
	end

	if arg_34_0.mainEffect then
		Destroy(arg_34_0.mainEffect)

		arg_34_0.mainEffect = nil
	end

	if arg_34_0.waveEffect then
		Destroy(arg_34_0.waveEffect)

		arg_34_0.waveEffect = nil
	end

	if arg_34_0.bulinTip then
		arg_34_0.bulinTip:Destroy()

		arg_34_0.bulinTip = nil
	end

	if arg_34_0.shipsView then
		arg_34_0.shipsView:Dispose()

		arg_34_0.shipsView = nil
	end
end

function var_0_0.GetEffect(arg_35_0, arg_35_1, arg_35_2)
	ResourceMgr.Inst:getAssetAsync("ui/" .. arg_35_1, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_36_0)
		if arg_35_0.exited then
			return
		end

		arg_35_2(Instantiate(arg_36_0))
	end), true, true)
end

return var_0_0
