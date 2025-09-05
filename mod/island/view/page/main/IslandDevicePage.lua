local var_0_0 = class("IslandDevicePage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandDeviceUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.systemTimeUtil = LocalSystemTimeUtil.New()
	arg_2_0.exitBtn = arg_2_0._tf:Find("panel/exit")
	arg_2_0.timeTxt = arg_2_0._tf:Find("panel/time"):GetComponent(typeof(Text))
	arg_2_0.electricTF = arg_2_0._tf:Find("panel/battery/electric")
	arg_2_0.btnEmptyTF = arg_2_0._tf:Find("panel/content_empty")
	arg_2_0.btnContainer = arg_2_0._tf:Find("panel/content")
	arg_2_0.btnTpl = arg_2_0.btnContainer:Find("tpl")

	setActive(arg_2_0.btnTpl, false)

	arg_2_0.bannerTF = arg_2_0._tf:Find("panel/banner")
	arg_2_0.bannerEmptyTF = arg_2_0._tf:Find("panel/banner_empty")
	arg_2_0.scrollSnap = BannerScrollRect4Mellow.New(arg_2_0.bannerTF:Find("mask/content"), arg_2_0.bannerTF:Find("dots"))
	arg_2_0.animationPlayer = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.dftAniEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("close"), function()
		arg_3_0.dftAniEvent:SetEndEvent(function()
			arg_3_0.dftAniEvent:SetEndEvent(nil)
			arg_3_0:Hide()
		end)
		arg_3_0.animationPlayer:Play("IslandDeviceUI_out")
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.exitBtn, function()
		arg_3_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	setActive(arg_3_0.exitBtn, not ISLAND_PLAYER_TESTING)
	arg_3_0:InitBtns()
	arg_3_0:InitBanner()
end

function var_0_0.InitBtns(arg_7_0)
	arg_7_0.btns = {}

	local var_7_0 = pg.island_main_btns.get_id_list_by_main_type[2]

	table.sort(var_7_0, CompareFuncs({
		function(arg_8_0)
			return pg.island_main_btns[arg_8_0].order
		end,
		function(arg_9_0)
			return arg_9_0
		end
	}))

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_1 = pg.island_main_btns[iter_7_1].btn_name

		arg_7_0.btns[var_7_1] = IslandDeviceBaseBtn.New(cloneTplTo(arg_7_0.btnTpl, arg_7_0.btnContainer), arg_7_0.event, iter_7_1)
	end
end

function var_0_0.InitBanner(arg_10_0)
	local var_10_0 = arg_10_0:GetBannerDisplays()

	arg_10_0.banners = var_10_0

	for iter_10_0 = 0, #var_10_0 - 1 do
		local var_10_1 = var_10_0[iter_10_0 + 1]
		local var_10_2 = arg_10_0.scrollSnap:AddChild()

		LoadImageSpriteAsync("island/islandbanner/" .. var_10_1.pic, var_10_2)
		onButton(arg_10_0, var_10_2, function()
			arg_10_0:BannerSkip(var_10_1)
		end, SFX_MAIN)
	end

	arg_10_0.scrollSnap:SetUp()
end

function var_0_0.OnShow(arg_12_0)
	arg_12_0:AddTimer()
	arg_12_0:Flush()
	arg_12_0:FlushBattery()
	arg_12_0:FlushTime()
	arg_12_0:emitCore(ISLAND_EVT.DEVIEE_STATE_CHANGE, true)

	if IslandCameraMgr.instance then
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOCUS_CAMERA_NAME)
	end
end

function var_0_0.Flush(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.btns) do
		iter_13_1:Flush()
	end

	local var_13_0 = arg_13_0:GetBannerDisplays()
	local var_13_1 = #var_13_0 ~= 0

	setActive(arg_13_0.bannerEmptyTF, not var_13_1)
	setActive(arg_13_0.bannerTF, var_13_1)

	if var_13_1 then
		if #arg_13_0.banners ~= #var_13_0 then
			arg_13_0.scrollSnap:Reset()
			arg_13_0:InitBanner()
		else
			arg_13_0.scrollSnap:Resume()
		end
	end
end

function var_0_0.FlushBattery(arg_14_0)
	local var_14_0 = SystemInfo.batteryLevel

	if var_14_0 < 0 then
		var_14_0 = 1
	end

	setFillAmount(arg_14_0.electricTF, var_14_0)
end

function var_0_0.FlushTime(arg_15_0)
	arg_15_0.systemTimeUtil:SetUp(function(arg_16_0, arg_16_1, arg_16_2)
		arg_15_0.timeTxt.text = arg_16_0 .. ":" .. arg_16_1
	end)
end

function var_0_0.AddTimer(arg_17_0)
	arg_17_0:RemoveTimer()

	arg_17_0.timer = Timer.New(function()
		arg_17_0:FlushBattery()
		arg_17_0:FlushTime()
	end, 60, -1)

	arg_17_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_19_0)
	if arg_19_0.timer then
		arg_19_0.timer:Stop()

		arg_19_0.timer = nil
	end
end

function var_0_0.OnHide(arg_20_0)
	arg_20_0:RemoveTimer()
	arg_20_0:emitCore(ISLAND_EVT.DEVIEE_STATE_CHANGE, false)

	if IslandCameraMgr.instance then
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
	end
end

function var_0_0.OnDisable(arg_21_0)
	arg_21_0:OnHide()
end

function var_0_0.OnDestroy(arg_22_0)
	arg_22_0.systemTimeUtil:Dispose()

	arg_22_0.systemTimeUtil = nil

	arg_22_0.scrollSnap:Dispose()

	arg_22_0.scrollSnap = nil

	for iter_22_0, iter_22_1 in pairs(arg_22_0.btns) do
		iter_22_1:Dispose()
	end

	arg_22_0.btns = nil
end

function var_0_0.GetBannerDisplays(arg_23_0)
	return underscore(pg.island_banner.all):chain():map(function(arg_24_0)
		return pg.island_banner[arg_24_0]
	end):select(function(arg_25_0)
		return pg.TimeMgr.GetInstance():inTime(arg_25_0.time)
	end):value()
end

function var_0_0.BannerSkip(arg_26_0, arg_26_1)
	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandDeviceBanner(arg_26_1.id))

	if arg_26_1.type == IslandConst.BANNER_TYPE_OPEN_URL then
		Application.OpenURL(arg_26_1.param)
	elseif arg_26_1.type == IslandConst.BANNER_TYPE_SWITCH_MAP then
		arg_26_0.dftAniEvent:SetEndEvent(function()
			arg_26_0.dftAniEvent:SetEndEvent(nil)
			arg_26_0:Hide()
			arg_26_0:emit(IslandBaseMediator.SWITCH_MAP, unpack(arg_26_1.param))
		end)
		arg_26_0.animationPlayer:Play("IslandDeviceUI_out")
	elseif arg_26_1.type == IslandConst.BANNER_TYPE_OPEN_PAGE then
		arg_26_0:Hide()
		arg_26_0:emit(IslandMediator.OPEN_PAGE, arg_26_1.param[1], arg_26_1.param[2])
	elseif arg_26_1.type == IslandConst.BANNER_TYPE_SURVEY then
		local var_26_0, var_26_1 = getProxy(ActivityProxy):isSurveyOpen()

		if var_26_0 then
			pg.m02:sendNotification(GAME.SURVEY_REQUEST, {
				surveyID = var_26_1,
				surveyUrlStr = getSurveyUrl(var_26_1)
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))
		end
	end
end

return var_0_0
