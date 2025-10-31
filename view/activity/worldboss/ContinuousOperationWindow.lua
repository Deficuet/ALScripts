local var_0_0 = class("ContinuousOperationWindow", import("view.base.BaseUI"))
local var_0_1 = 15

function var_0_0.getUIName(arg_1_0)
	return "ContinuousOperationWindowUI"
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
	setText(arg_3_0.panel:Find("Tip"), i18n("multiple_sorties_tip"))
	setText(arg_3_0.panel:Find("battle/pic"), i18n("msgbox_text_battle"))
	setText(arg_3_0.panel:Find("bonus/Text"), i18n("expedition_extra_drop_tip"))
	setText(arg_3_0.panel:Find("ticket/Text"), i18n("multiple_sorties_challenge_ticket_use"))
end

function var_0_0.SetActivity(arg_4_0, arg_4_1)
	arg_4_0.activity = arg_4_1
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0.panel:Find("battle"), function()
		local var_6_0 = arg_5_0.contextData.battleTimes

		if arg_5_0.contextData.oilCost * var_6_0 > getProxy(PlayerProxy):getRawData().oil then
			pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

			return
		end

		arg_5_0:emit(PreCombatMediator.CONTINUOUS_OPERATION)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("window/top/btnBack"), function()
		arg_5_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0._tf:Find("bg"), function()
		arg_5_0:closeView()
	end, SFX_CANCEL)

	local var_5_0 = getProxy(SettingsProxy):isTipActBossExchangeTicket() == 1

	arg_5_0.contextData.useTicket = defaultValue(arg_5_0.contextData.useTicket, var_5_0)

	triggerToggle(arg_5_0.panel:Find("ticket/checkbox"), var_5_0)
	onToggle(arg_5_0, arg_5_0.panel:Find("ticket/checkbox"), function(arg_9_0)
		arg_5_0.contextData.useTicket = arg_9_0

		arg_5_0:UpdateContent()
	end, SFX_PANEL, SFX_CANCEL)

	local var_5_1 = arg_5_0.activity:getConfig("config_id")
	local var_5_2 = pg.activity_event_worldboss[var_5_1].ticket
	local var_5_3 = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = var_5_2
	}):getIcon()
	local var_5_4 = LoadSprite(var_5_3, "")

	arg_5_0.consumeText:AddSprite("ticket", var_5_4)
	setImageSprite(arg_5_0.panel:Find("ticket/Text/Icon"), var_5_4)
	arg_5_0._pageUtil:setNumUpdate(function(arg_10_0)
		arg_5_0.contextData.battleTimes = arg_10_0

		arg_5_0:UpdateContent()
	end)
	arg_5_0._pageUtil:setMaxNum(var_0_1)

	arg_5_0.contextData.battleTimes = arg_5_0.contextData.battleTimes or 1

	arg_5_0._pageUtil:setDefaultNum(arg_5_0.contextData.battleTimes)
	arg_5_0:UpdateContent()
	pg.UIMgr.GetInstance():BlurPanel(arg_5_0._tf)
end

function var_0_0.UpdateContent(arg_11_0)
	local var_11_0 = arg_11_0.contextData.battleTimes
	local var_11_1 = arg_11_0.contextData.stageId
	local var_11_2 = arg_11_0.activity:getConfig("config_id")
	local var_11_3 = pg.activity_event_worldboss[var_11_2].ticket
	local var_11_4 = getProxy(PlayerProxy):getRawData():getResource(var_11_3)
	local var_11_5 = arg_11_0.activity:GetStageBonus(var_11_1)
	local var_11_6 = math.clamp(var_11_0 - var_11_5, 0, var_11_4)
	local var_11_7 = arg_11_0.contextData.useTicket and var_11_6 or 0
	local var_11_8 = tostring(var_11_5)

	if var_11_7 > 0 then
		var_11_8 = var_11_8 .. setColorStr("+" .. var_11_7, COLOR_GREEN)
	end

	setText(arg_11_0.panel:Find("bonus/Number"), var_11_8)
	setText(arg_11_0.panel:Find("ticket/Number"), var_11_7 .. "/" .. var_11_4)

	local var_11_9 = var_11_4 > 0 and var_11_6 > 0

	setActive(arg_11_0.panel:Find("ticket/checkboxBan"), not var_11_9)
	setToggleEnabled(arg_11_0.panel:Find("ticket/checkbox"), var_11_9)

	local var_11_10 = arg_11_0.contextData.oilCost * var_11_0
	local var_11_11 = i18n("multiple_sorties_cost1", var_11_10)

	if var_11_10 > getProxy(PlayerProxy):getRawData().oil then
		var_11_11 = string.gsub(var_11_11, "#92fc63", COLOR_RED)
	end

	if var_11_7 > 0 then
		var_11_11 = var_11_11 .. i18n("multiple_sorties_cost2", var_11_7)
	end

	arg_11_0.consumeText.text = var_11_11
end

function var_0_0.willExit(arg_12_0)
	arg_12_0._pageUtil:Dispose()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_12_0._tf)
end

return var_0_0
