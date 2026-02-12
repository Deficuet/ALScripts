local var_0_0 = class("LoveLetterActivityScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "LoveLetterActivityUI"
end

var_0_0.optionsPath = {}

function var_0_0.init(arg_2_0)
	setText(arg_2_0.rtSlider:Find("Text"), i18n("loveactivity_ui_1"))
	setText(arg_2_0.textDailyTitle, i18n("mail_boxtitle_information"))
	setText(arg_2_0.btnDaily:Find("content/Text"), i18n("loveactivity_ui_2"))
	setText(arg_2_0.btnGift:Find("Text"), i18n("loveactivity_ui_3"))
	setText(arg_2_0.textUITitle, i18n("activity_ninjia_main_title"))
	setText(arg_2_0.btnDailyConfirm:Find("Text"), i18n("mail_box_confirm"))
	onButton(arg_2_0, arg_2_0.btnBack, function()
		arg_2_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.btnHome, function()
		arg_2_0:emit(var_0_0.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.btnSwitch, function()
		local var_5_0, var_5_1 = arg_2_0.activity:GetChangeCount()

		if var_5_0 < var_5_1 then
			arg_2_0:emit(LoveLetterActivityMediator.ON_SELECT_GROUP, arg_2_0.activity.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_count_noenough"))
		end
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.btnDaily:Find("content"), function()
		arg_2_0:ShowDailyPanel()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.btnDailyConfirm, function()
		local var_7_0 = arg_2_0.dailyActivity:getNDay()
		local var_7_1 = arg_2_0.dailyActivity:getConfig("config_data")[var_7_0]

		arg_2_0:emit(LoveLetterActivityMediator.ON_DAILY_LOGIN_REWARD, var_7_1)
	end, SFX_CONFIRM)
	onButton(arg_2_0, arg_2_0.btnDailyClose, function()
		arg_2_0:HideDailyPanel()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.btnGift, function()
		arg_2_0:emit(LoveLetterActivityMediator.ON_GO_COLLECTION)
	end, SFX_PANEL)
end

function var_0_0.SetActivity(arg_10_0, arg_10_1)
	arg_10_0.activity = arg_10_1
	arg_10_0.ll = getProxy(LoveLetterProxy):GetGroupData(arg_10_0.activity:GetTargetGroupId())

	setText(arg_10_0.rtDailyPanel:Find("panel/Text"), string.format("are you sure to add extra exp to character:%d ?", arg_10_0.ll.groupId))
end

function var_0_0.SetDailyActivity(arg_11_0, arg_11_1)
	arg_11_0.dailyActivity = arg_11_1

	local var_11_0 = arg_11_1:readyToAchieve()

	setActive(arg_11_0.btnDaily:Find("got"), not var_11_0)

	local var_11_1 = Color.NewHex("393939")

	var_11_1.a = 0.8

	setBlackMask(arg_11_0.btnDaily:Find("content"), not var_11_0, {
		color = var_11_1
	})
	setActive(arg_11_0.btnDaily:Find("pick_up"), var_11_0)
end

function var_0_0.didEnter(arg_12_0)
	arg_12_0:UpdateSlider()
	arg_12_0:UpdatePainting()
	arg_12_0:UpdateLoveLetterMedal()

	local var_12_0 = {}
	local var_12_1 = pg.NewStoryMgr.GetInstance()
	local var_12_2 = arg_12_0.activity:getNDay()

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.activity:GetConfigClientSetting("story")) do
		if iter_12_0 <= var_12_2 and not var_12_1:IsPlayed(iter_12_1[1]) then
			table.insert(var_12_0, function(arg_13_0)
				var_12_1:Play(iter_12_1[1], arg_13_0)
			end)
		end
	end

	seriesAsync(var_12_0, function()
		if not arg_12_0.contextData.checkRalizeGift then
			arg_12_0.contextData.checkRalizeGift = true

			if getProxy(LoveLetterProxy):IsTipRealizeGift() then
				arg_12_0:emit(LoveLetterActivityMediator.ON_REALIZE_GIFT)
			end
		end
	end)
end

function var_0_0.UpdateSlider(arg_15_0)
	local var_15_0, var_15_1 = arg_15_0.activity:GetDailyProgress()

	setText(arg_15_0.rtSlider:Find("Slider/progress"), var_15_0 .. "/" .. var_15_1)
	setSlider(arg_15_0.rtSlider:Find("Slider"), 0, var_15_1, var_15_0)

	local var_15_2, var_15_3 = arg_15_0.ll:GetDisplayExp()

	if var_15_3 == 0 then
		setSlider(arg_15_0.rtNow:Find("Slider"), 0, 1, 1)
	else
		setSlider(arg_15_0.rtNow:Find("Slider"), 0, var_15_3, var_15_2)
	end

	setText(arg_15_0.rtNow:Find("Text"), string.format(setColorStr("%d", "#CF90A8") .. "/%d", var_15_2, var_15_3))
end

function var_0_0.UpdatePainting(arg_16_0)
	local var_16_0, var_16_1 = arg_16_0.activity:GetChangeCount()

	setText(arg_16_0.btnSwitch:Find("Text"), string.format("%d/%d", var_16_1 - var_16_0, var_16_1))

	local var_16_2 = arg_16_0.ll:GetPainting()

	if arg_16_0.paint == var_16_2 then
		return
	end

	if arg_16_0.paint then
		retPaintingPrefab(arg_16_0.rtPainting, arg_16_0.paint)

		arg_16_0.paint = nil
	end

	arg_16_0.paint = var_16_2

	setPaintingPrefabAsync(arg_16_0.rtPainting, arg_16_0.paint, "mainNormal")
end

function var_0_0.UpdateLoveLetterMedal(arg_17_0, arg_17_1)
	setActive(arg_17_0.btnGift:Find("tip"), getProxy(LoveLetterProxy):IsTipRealizeGift())

	arg_17_1 = arg_17_1 or arg_17_0.rtNow:Find("medal")

	setLoveLetterMedal(arg_17_1, arg_17_0.ll, {
		showPickUp = arg_17_0.ll:CanLevelUp() and arg_17_0.ll.level < arg_17_0.ll:GetMaxLevel()
	})
	onButton(arg_17_0, arg_17_0.rtNow, function()
		arg_17_0:emit(LoveLetterActivityMediator.ON_GO_TROPHY)
	end, SFX_PANEL)
end

function var_0_0.ShowDailyPanel(arg_19_0)
	setActive(arg_19_0.rtDailyPanel, true)
	arg_19_0:UpdateLoveLetterMedal(arg_19_0.rtDailyNow:Find("medal"))

	local var_19_0, var_19_1 = arg_19_0.ll:GetDisplayExp()

	if var_19_1 == 0 then
		setSlider(arg_19_0.rtDailyNow:Find("Slider"), 0, 1, 1)
	else
		setSlider(arg_19_0.rtDailyNow:Find("Slider"), 0, var_19_1, var_19_0)
	end

	setText(arg_19_0.rtDailyNow:Find("Text"), string.format(setColorStr("%d", "#CF90A8") .. "/%d", var_19_0, var_19_1))
	setText(arg_19_0.textDailyContent, i18n("loveactivity_ui_4", arg_19_0.ll:GetName(), arg_19_0.dailyActivity:GetConfigClientSetting("exp")))
	arg_19_0:BlurPanel(arg_19_0.rtDailyPanel)
end

function var_0_0.HideDailyPanel(arg_20_0)
	setActive(arg_20_0.rtDailyPanel, false)
	arg_20_0:UnOverlayPanel(arg_20_0.rtDailyPanel)
end

function var_0_0.onBackPressed(arg_21_0)
	if isActive(arg_21_0.rtDailyPanel) then
		arg_21_0:HideDailyPanel()
	else
		var_0_0.super.onBackPressed(arg_21_0)
	end
end

function var_0_0.willExit(arg_22_0)
	if arg_22_0.paint then
		retPaintingPrefab(arg_22_0.rtPainting, arg_22_0.paint)

		arg_22_0.paint = nil
	end

	if arg_22_0.rtNow:Find("medal").childCount > 0 then
		eachChild(arg_22_0.rtNow:Find("medal"), function(arg_23_0, arg_23_1)
			returnLoveLetterMedal(arg_23_0)
		end)
	end
end

return var_0_0
