local var_0_0 = class("WSAtlasRight", import("...BaseEntity"))

var_0_0.Fields = {
	isDisplay = "boolean",
	btnSwitch = "userdata",
	rtNameBg = "userdata",
	btnSettings = "userdata",
	world = "table",
	btnDeleConfirm = "userdata",
	rtWorldInfo = "userdata",
	rtMapInfo = "userdata",
	wsWorldInfo = "table",
	rtDelegatePanel = "userdata",
	rtDisplayIcon = "userdata",
	transform = "userdata",
	rtDisplayPanel = "userdata",
	btnDeleCancel = "userdata",
	rtBg = "userdata",
	btnDelegate = "userdata",
	delegateTimer = "table"
}

function var_0_0.Setup(arg_1_0)
	pg.DelegateInfo.New(arg_1_0)
	arg_1_0:Init()
end

function var_0_0.Dispose(arg_2_0)
	if arg_2_0.delegateTimer then
		arg_2_0.delegateTimer:Stop()

		arg_2_0.delegateTimer = nil
	end

	arg_2_0.wsWorldInfo:Dispose()
	pg.DelegateInfo.Dispose(arg_2_0)
	arg_2_0:Clear()
end

function var_0_0.Init(arg_3_0)
	local var_3_0 = arg_3_0.transform

	arg_3_0.rtBg = var_3_0:Find("bg")
	arg_3_0.rtNameBg = var_3_0:Find("name_bg")
	arg_3_0.rtDisplayIcon = var_3_0:Find("line/display_icon")
	arg_3_0.rtDisplayPanel = var_3_0:Find("line/display_panel")
	arg_3_0.rtWorldInfo = arg_3_0.rtDisplayPanel:Find("world_info")
	arg_3_0.btnSettings = arg_3_0.rtDisplayPanel:Find("btns/settings_btn")
	arg_3_0.btnSwitch = arg_3_0.rtDisplayPanel:Find("btns/switch_btn")
	arg_3_0.btnDelegate = arg_3_0.rtDisplayPanel:Find("btns/delegate_btn")
	arg_3_0.rtDelegatePanel = var_3_0:Find("delegate_panel")
	arg_3_0.btnDeleCancel = arg_3_0.rtDelegatePanel:Find("doing/cancel_btn")
	arg_3_0.btnDeleConfirm = arg_3_0.rtDelegatePanel:Find("finish/confirm_btn")

	setText(arg_3_0.rtWorldInfo:Find("power/bg/Word"), i18n("world_total_power"))
	setText(arg_3_0.rtWorldInfo:Find("explore/mileage/Text"), i18n("world_mileage"))
	setText(arg_3_0.rtWorldInfo:Find("explore/pressing/Text"), i18n("world_pressing"))
	setText(arg_3_0.rtDelegatePanel:Find("doing/Slider/name"), i18n("world_auto_plan_progress"))

	arg_3_0.wsWorldInfo = WSWorldInfo.New()
	arg_3_0.wsWorldInfo.transform = arg_3_0.rtWorldInfo

	arg_3_0.wsWorldInfo:Setup()
	setActive(arg_3_0.rtWorldInfo, nowWorld():IsSystemOpen(WorldConst.SystemWorldInfo))
	setText(arg_3_0.rtDisplayIcon:Find("name"), i18n("world_map_title_tips"))
	onButton(arg_3_0, arg_3_0.rtDisplayIcon, function()
		arg_3_0.isDisplay = not arg_3_0.isDisplay

		arg_3_0:Collapse()
	end, SFX_PANEL)

	arg_3_0.isDisplay = true

	arg_3_0:Collapse()
	arg_3_0:UpdateDelegate()
end

function var_0_0.Collapse(arg_5_0)
	arg_5_0.rtDisplayIcon:Find("icon").localScale = arg_5_0.isDisplay and Vector3.one or Vector3(-1, 1, 1)

	setActive(arg_5_0.rtDisplayPanel, arg_5_0.isDisplay)
	setActive(arg_5_0.rtBg, arg_5_0.isDisplay)
	setActive(arg_5_0.rtNameBg, not arg_5_0.isDisplay)
end

function var_0_0.SetOverSize(arg_6_0, arg_6_1)
	arg_6_0.rtBg.offsetMax = Vector2(-arg_6_1, arg_6_0.rtBg.offsetMax.y)
	arg_6_0.rtNameBg.offsetMax = Vector2(-arg_6_1, arg_6_0.rtNameBg.offsetMax.y)
end

function var_0_0.UpdateDelegate(arg_7_0)
	local var_7_0 = getProxy(ChapterAutoProxy)
	local var_7_1 = var_7_0:HasTypeCommission(ChapterAutoProxy.TYPE.WORLD)

	setActive(arg_7_0.rtDelegatePanel, var_7_1)

	if not var_7_1 then
		if arg_7_0.delegateTimer then
			arg_7_0.delegateTimer:Stop()

			arg_7_0.delegateTimer = nil
		end

		return
	end

	local var_7_2 = var_7_0:GetCommissionList()
	local var_7_3 = var_7_2[1]:GetStartTime()
	local var_7_4 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_7_5 = var_7_2[#var_7_2]:GetFinishTime()

	setActive(arg_7_0.rtDelegatePanel:Find("doing"), var_7_4 < var_7_5)
	setActive(arg_7_0.rtDelegatePanel:Find("finish"), var_7_5 <= var_7_4)

	if var_7_4 < var_7_5 then
		if arg_7_0.delegateTimer then
			arg_7_0.delegateTimer:Stop()
		end

		arg_7_0.delegateTimer = Timer.New(function()
			local var_8_0 = 0

			var_7_4 = pg.TimeMgr.GetInstance():GetServerTime()

			for iter_8_0, iter_8_1 in ipairs(var_7_2) do
				if var_7_4 < iter_8_1:GetFinishTime() then
					break
				else
					var_8_0 = var_8_0 + 1
				end
			end

			if var_8_0 < #var_7_2 then
				local var_8_1 = var_7_2[var_8_0 + 1]
				local var_8_2 = var_7_5 - var_7_4

				setText(arg_7_0.rtDelegatePanel:Find("doing/time"), string.format("%02d:%02d:%02d", calcFloor(var_8_2 / 3600), calcFloor(var_8_2 % 3600 / 60), var_8_2 % 60))
				setText(arg_7_0.rtDelegatePanel:Find("doing/Slider/Text"), string.format("%d/%d", var_8_0, #var_7_2))
				setText(arg_7_0.rtDelegatePanel:Find("doing/name/Text"), pg.world_chapter_random[var_8_1.id].name)
				setSlider(arg_7_0.rtDelegatePanel:Find("doing/Slider"), 0, var_7_5 - var_7_3, var_7_4 - var_7_3)
			else
				setActive(arg_7_0.rtDelegatePanel:Find("doing"), false)
				setActive(arg_7_0.rtDelegatePanel:Find("finish"), true)
			end
		end, 1, var_7_5 - var_7_4 + 1)

		arg_7_0.delegateTimer.func()
		arg_7_0.delegateTimer:Start()
	end
end

return var_0_0
