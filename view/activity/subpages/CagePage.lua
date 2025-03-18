local var_0_0 = class("CagePage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.Build = arg_1_0:findTF("build", arg_1_0.bg)
	arg_1_0.build_times = arg_1_0:findTF("build_times", arg_1_0.Build)
	arg_1_0.build_time = arg_1_0:findTF("time", arg_1_0.build_times)
	arg_1_0.Level = arg_1_0:findTF("fight", arg_1_0.bg)
	arg_1_0.Shop = arg_1_0:findTF("shop", arg_1_0.bg)
	arg_1_0.shop_times = arg_1_0:findTF("shop_times", arg_1_0.Shop)
	arg_1_0.shop_time = arg_1_0:findTF("time", arg_1_0.shop_times)
	arg_1_0.Manual = arg_1_0:findTF("Manual", arg_1_0.bg)

	SetActive(arg_1_0.build_times, false)
	SetActive(arg_1_0.shop_times, false)
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.time = arg_2_0.activity:getConfig("time")
	arg_2_0.timeMgr = pg.TimeMgr.GetInstance()
	arg_2_0.js_time = arg_2_0.timeMgr:parseTimeFromConfig(arg_2_0.time[3])
	arg_2_0.fw_time = arg_2_0.timeMgr:GetServerTime()
	arg_2_0.xc_time = arg_2_0.timeMgr:DiffDay(arg_2_0.fw_time, arg_2_0.js_time)
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.Manual, function()
		local var_4_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = DivineLightMedalAlbumView
		})

		arg_3_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_4_0)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.Build, function()
		arg_3_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
			page = BuildShipScene.PAGE_BUILD,
			projectName = BuildShipScene.PROJECTS.ACTIVITY
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.Level, function()
		arg_3_0:emit(ActivityMediator.BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.Shop, function()
		arg_3_0:emit(ActivityMediator.GO_CHANGE_SHOP)
	end, SFX_PANEL)

	if arg_3_0.xc_time <= 0 then
		SetActive(arg_3_0.build_times, true)
		SetActive(arg_3_0.shop_times, true)
		setText(arg_3_0.build_time, i18n("tolovemainpage_build_countdown"))

		arg_3_0.times = arg_3_0.timeMgr:GetServerHour()

		if os.date("%d") >= "01" then
			setText(arg_3_0.shop_time, i18n("tolovemainpage_skin_countdown", 24 - arg_3_0.times - 1))
		else
			setText(arg_3_0.shop_time, i18n("tolovemainpage_skin_countdown", 24 - arg_3_0.times))
		end
	end
end

return var_0_0
