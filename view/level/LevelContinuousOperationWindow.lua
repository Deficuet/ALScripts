local var_0_0 = class("LevelContinuousOperationWindow", import("view.activity.worldboss.ContinuousOperationWindow"))

function var_0_0.getUIName(arg_1_0)
	return "LevelContinuousOperationWindowUI"
end

function var_0_0.ResUISettings(arg_2_0)
	return {
		reset = true,
		gemOffsetX = 628,
		showType = PlayerResUI.TYPE_OIL
	}
end

function var_0_0.init(arg_3_0)
	arg_3_0.panel = arg_3_0._tf:Find("window/panel")
	arg_3_0._countSelect = arg_3_0.panel:Find("content")
	arg_3_0._pageUtil = PageUtil.New(arg_3_0._countSelect:Find("value_bg/left"), arg_3_0._countSelect:Find("value_bg/right"), arg_3_0._countSelect:Find("max"), arg_3_0._countSelect:Find("value_bg/value"))
	arg_3_0.consumeText = arg_3_0.panel:Find("content/consume"):GetComponent("RichText")

	setText(arg_3_0._tf:Find("window/top/bg/title/title"), i18n("multiple_sorties_title"))
	setText(arg_3_0._tf:Find("window/top/bg/title/title/title_en"), i18n("multiple_sorties_title_eng"))
	setText(arg_3_0.panel:Find("content/desc_txt"), i18n("multiple_sorties_times"))
	setText(arg_3_0.panel:Find("Tip"), i18n("multiple_sorties_main_tip"))
	setText(arg_3_0.panel:Find("battle/pic"), i18n("msgbox_text_battle"))
	setText(arg_3_0.panel:Find("bonus/Text"), i18n("expedition_extra_drop_tip"))
	setText(arg_3_0.panel:Find("ticket/Text"), i18n("multiple_sorties_challenge_ticket_use"))
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf:Find("window/top/btnBack"), function()
		arg_4_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0._tf:Find("bg"), function()
		arg_4_0:closeView()
	end, SFX_CANCEL)

	local var_4_0 = arg_4_0.contextData.extraRate.enabled

	arg_4_0.contextData.useTicket = defaultValue(arg_4_0.contextData.useTicket, var_4_0)

	triggerToggle(arg_4_0.panel:Find("ticket/checkbox"), var_4_0)
	onToggle(arg_4_0, arg_4_0.panel:Find("ticket/checkbox"), function(arg_7_0)
		arg_4_0.contextData.useTicket = arg_7_0

		arg_4_0:emit(LevelMediator2.ON_SPITEM_CHANGED, arg_7_0)
		arg_4_0:UpdateContent()
	end, SFX_PANEL, SFX_CANCEL)
	arg_4_0._pageUtil:setNumUpdate(function(arg_8_0)
		arg_4_0.contextData.battleTimes = arg_8_0

		arg_4_0:UpdateContent()
	end)

	local var_4_1 = arg_4_0.contextData.maxCount

	arg_4_0._pageUtil:setMaxNum(var_4_1)

	if var_4_1 >= 0 then
		local var_4_2 = arg_4_0.contextData.oilCost
		local var_4_3 = getProxy(PlayerProxy):getRawData().oil
		local var_4_4 = math.floor(var_4_3 / var_4_2)

		warning(var_4_2, var_4_3, var_4_4)

		arg_4_0.contextData.battleTimes = math.min(var_4_1, var_4_4)
		arg_4_0.contextData.battleTimes = math.max(arg_4_0.contextData.battleTimes, 1)
	end

	arg_4_0._pageUtil:setDefaultNum(arg_4_0.contextData.battleTimes)
	arg_4_0:UpdateContent()
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
end

function var_0_0.UpdateContent(arg_9_0)
	local var_9_0 = arg_9_0.contextData.battleTimes
	local var_9_1 = arg_9_0.contextData.extraRate
	local var_9_2 = var_9_1.extraCount
	local var_9_3 = var_9_1.freeBonus
	local var_9_4 = math.clamp(var_9_0 - var_9_3, 0, var_9_2)
	local var_9_5 = arg_9_0.contextData.useTicket and var_9_4 or 0
	local var_9_6 = var_9_5

	if arg_9_0.contextData.useTicket then
		local var_9_7 = setColorStr(var_9_6, var_9_0 <= var_9_2 and COLOR_GREEN or COLOR_RED)

		setText(arg_9_0.panel:Find("ticket/Number"), var_9_7 .. "/" .. var_9_2)
	else
		setText(arg_9_0.panel:Find("ticket/Number"), var_9_2)
	end

	local var_9_8 = var_9_2 > 0 and var_9_4 > 0

	setActive(arg_9_0.panel:Find("ticket/checkboxBan"), not var_9_8)
	setToggleEnabled(arg_9_0.panel:Find("ticket/checkbox"), var_9_8)

	if arg_9_0.contextData.useTicket and not var_9_8 then
		triggerToggle(arg_9_0.panel:Find("ticket/checkbox"), false)
	end

	local var_9_9 = arg_9_0.contextData.oilCost * (var_9_0 + (var_9_1.rate - 1) * var_9_5)
	local var_9_10 = i18n("multiple_sorties_cost1", var_9_9)
	local var_9_11 = getProxy(PlayerProxy):getRawData()

	if var_9_9 > var_9_11.oil then
		var_9_10 = string.gsub(var_9_10, "#92fc63", COLOR_RED)
	end

	if var_9_5 > 0 then
		var_9_10 = var_9_10 .. i18n("multiple_sorties_cost3", var_9_5)
	end

	arg_9_0.consumeText.text = var_9_10

	onButton(arg_9_0, arg_9_0.panel:Find("battle"), function()
		if var_9_9 > var_9_11.oil then
			pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

			return
		end

		arg_9_0:emit(PreCombatMediator.CONTINUOUS_OPERATION)
	end, SFX_PANEL)
end

return var_0_0
