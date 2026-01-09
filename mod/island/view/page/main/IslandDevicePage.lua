local var_0_0 = class("IslandDevicePage", import("...base.IslandBasePage"))

var_0_0.SPECIAL_BTN = {
	order = "IslandDeviceOrderBtn",
	ship_order = "IslandDeviceShipOrderBtn"
}

function var_0_0.getUIName(arg_1_0)
	return "IslandDeviceUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.exitBtn = arg_2_0._tf:Find("panel/exit")
	arg_2_0.timeTxt = arg_2_0._tf:Find("panel/top/time"):GetComponent(typeof(Text))
	arg_2_0.electricTF = arg_2_0._tf:Find("panel/top/battery/electric")
	arg_2_0.bannerTF = arg_2_0._tf:Find("panel/banner")
	arg_2_0.bannerEmptyTF = arg_2_0._tf:Find("panel/banner_empty")
	arg_2_0.scrollSnap = IslandBannerScrollRect.New(arg_2_0.bannerTF:Find("mask/content"), arg_2_0.bannerTF:Find("dots"))
	arg_2_0.btnContainer = arg_2_0._tf:Find("panel/btn_container")
	arg_2_0.systemTimeUtil = LocalSystemTimeUtil.New()
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("close"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.exitBtn, function()
		arg_3_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	setActive(arg_3_0.exitBtn, not ISLAND_PLAYER_TESTING)
	arg_3_0:InitBtns()
	arg_3_0:InitBanner()
end

function var_0_0.InitBtns(arg_6_0)
	arg_6_0.btns = {}

	local var_6_0 = pg.island_main_btns.get_id_list_by_main_type[2]
	local var_6_1 = {}

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		var_6_1[pg.island_main_btns[iter_6_1].btn_name] = iter_6_1
	end

	eachChild(arg_6_0.btnContainer, function(arg_7_0)
		local var_7_0 = arg_7_0.name
		local var_7_1 = var_6_1[var_7_0]

		if var_7_1 then
			if var_0_0.SPECIAL_BTN[var_7_0] then
				local var_7_2 = var_0_0.SPECIAL_BTN[var_7_0]

				arg_6_0.btns[var_7_0] = _G[var_7_2].New(arg_7_0, arg_6_0.event, var_7_1)
			else
				arg_6_0.btns[var_7_0] = IslandDeviceBaseBtn.New(arg_7_0, arg_6_0.event, var_7_1)
			end
		end
	end)
end

function var_0_0.InitBanner(arg_8_0)
	local var_8_0 = arg_8_0:GetBannerDisplays()

	arg_8_0.banners = var_8_0

	for iter_8_0 = 0, #var_8_0 - 1 do
		local var_8_1 = var_8_0[iter_8_0 + 1]
		local var_8_2 = arg_8_0.scrollSnap:AddChild()

		if var_8_1.id == 3 then
			LoadImageSpriteAsync("activitybanner/island_temp4", var_8_2)
		else
			LoadImageSpriteAsync("island/islandbanner/" .. var_8_1.pic, var_8_2)
		end

		onButton(arg_8_0, var_8_2, function()
			arg_8_0:BannerSkip(var_8_1)
		end, SFX_MAIN)
	end

	arg_8_0.scrollSnap:SetUp()
end

function var_0_0.OnShow(arg_10_0)
	arg_10_0:AddTimer()
	arg_10_0:Flush()
	arg_10_0:FlushBattery()
	arg_10_0:FlushTime()
	arg_10_0:emitCore(ISLAND_EVT.DEVIEE_STATE_CHANGE, true)

	if IslandCameraMgr.instance then
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOCUS_CAMERA_NAME)
	end
end

function var_0_0.Flush(arg_11_0)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.btns) do
		iter_11_1:Flush()
	end

	local var_11_0 = arg_11_0:GetBannerDisplays()
	local var_11_1 = #var_11_0 ~= 0

	setActive(arg_11_0.bannerEmptyTF, not var_11_1)
	setActive(arg_11_0.bannerTF, var_11_1)

	if var_11_1 then
		if #arg_11_0.banners ~= #var_11_0 then
			arg_11_0.scrollSnap:Reset()
			arg_11_0:InitBanner()
		else
			arg_11_0.scrollSnap:Resume()
		end
	end
end

function var_0_0.FlushBattery(arg_12_0)
	local var_12_0 = SystemInfo.batteryLevel

	if var_12_0 < 0 then
		var_12_0 = 1
	end

	setFillAmount(arg_12_0.electricTF, var_12_0)
end

function var_0_0.FlushTime(arg_13_0)
	arg_13_0.systemTimeUtil:SetUp(function(arg_14_0, arg_14_1, arg_14_2)
		arg_13_0.timeTxt.text = arg_14_0 .. ":" .. arg_14_1
	end)
end

function var_0_0.AddTimer(arg_15_0)
	arg_15_0:RemoveTimer()

	arg_15_0.timer = Timer.New(function()
		arg_15_0:FlushBattery()
		arg_15_0:FlushTime()
	end, 60, -1)

	arg_15_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_17_0)
	if arg_17_0.timer then
		arg_17_0.timer:Stop()

		arg_17_0.timer = nil
	end
end

function var_0_0.OnHide(arg_18_0)
	arg_18_0:RemoveTimer()
	arg_18_0:emitCore(ISLAND_EVT.DEVIEE_STATE_CHANGE, false)

	if IslandCameraMgr.instance then
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
	end
end

function var_0_0.OnEnable(arg_19_0)
	arg_19_0:OnShow()
end

function var_0_0.OnDisable(arg_20_0)
	arg_20_0:OnHide()
end

function var_0_0.OnDestroy(arg_21_0)
	arg_21_0:OnHide()
	arg_21_0:RemoveTimer()
	arg_21_0.systemTimeUtil:Dispose()

	arg_21_0.systemTimeUtil = nil

	arg_21_0.scrollSnap:Dispose()

	arg_21_0.scrollSnap = nil

	for iter_21_0, iter_21_1 in pairs(arg_21_0.btns) do
		iter_21_1:Dispose()
	end

	arg_21_0.btns = nil
end

function var_0_0.GetBannerDisplays(arg_22_0)
	return underscore(pg.island_banner.all):chain():map(function(arg_23_0)
		return pg.island_banner[arg_23_0]
	end):select(function(arg_24_0)
		return pg.TimeMgr.GetInstance():inTime(arg_24_0.time)
	end):value()
end

function var_0_0.BannerSkip(arg_25_0, arg_25_1)
	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandDeviceBanner(arg_25_1.id))

	if arg_25_1.type == IslandConst.BANNER_TYPE_OPEN_URL then
		Application.OpenURL(arg_25_1.param)
	elseif arg_25_1.type == IslandConst.BANNER_TYPE_SWITCH_MAP then
		arg_25_0:Hide()
		arg_25_0:emit(IslandBaseMediator.SWITCH_MAP, unpack(arg_25_1.param))
	elseif arg_25_1.type == IslandConst.BANNER_TYPE_OPEN_PAGE then
		arg_25_0:Hide()
		arg_25_0:emit(IslandMediator.OPEN_PAGE, arg_25_1.param[1], arg_25_1.param[2])
	elseif arg_25_1.type == IslandConst.BANNER_TYPE_SURVEY then
		local var_25_0, var_25_1 = getProxy(ActivityProxy):isSurveyOpen()
		local var_25_2 = getProxy(ActivityProxy):isSurveyDone()

		if var_25_0 and not isFinish then
			arg_25_0:Hide()
			arg_25_0:emit(IslandMediator.OPEN_PAGE, arg_25_1.param[1], arg_25_1.param[2])
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))
		end
	end
end

return var_0_0
