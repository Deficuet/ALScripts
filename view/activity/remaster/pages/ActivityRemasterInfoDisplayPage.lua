local var_0_0 = class("ActivityRemasterInfoDisplayPage", import("view.base.BaseSubView"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3

function var_0_0.getUIName(arg_1_0)
	return "ActivityRemasterInfoDisplayPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.toggles = {
		[var_0_1] = arg_2_0._tf:Find("window/middle/toggles/ship"),
		[var_0_2] = arg_2_0._tf:Find("window/middle/toggles/es"),
		[var_0_3] = arg_2_0._tf:Find("window/middle/toggles/other")
	}
	arg_2_0.uiItemList = {
		[var_0_1] = UIItemList.New(arg_2_0._tf:Find("window/middle/view/ship/content"), arg_2_0._tf:Find("window/middle/view/ship/content/ship_tpl")),
		[var_0_2] = UIItemList.New(arg_2_0._tf:Find("window/middle/view/es/content"), arg_2_0._tf:Find("window/middle/view/es/content/ship_tpl")),
		[var_0_3] = UIItemList.New(arg_2_0._tf:Find("window/middle/view/other/content"), arg_2_0._tf:Find("window/middle/view/es/content/ship_tpl"))
	}

	setText(arg_2_0._tf:Find("window/middle/title_bg/Text"), i18n("ActivityRemasterCore_award_preview_title"))

	arg_2_0.awardPage = ActivityRemasterInfoAwardPage.New(arg_2_0._tf, arg_2_0.event)
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0:CommonSetting({})
end

function var_0_0.Show(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)

	arg_4_0.onConfirm = arg_4_3
	arg_4_0.remasterData = ActivityRemasterData.New({
		id = arg_4_1
	})

	setText(arg_4_0._tf:Find("window/middle/content"), arg_4_2)
	setActive(arg_4_0._tf, true)
	arg_4_0:InitToggles()
	triggerToggle(arg_4_0.toggles[var_0_1], true)
end

function var_0_0.Hide(arg_5_0, arg_5_1)
	if not arg_5_0._tf then
		return
	end

	setActive(arg_5_0._tf, false)

	arg_5_0.onConfirm = nil

	if arg_5_0.awardPage and arg_5_0.awardPage:GetLoaded() then
		arg_5_0.awardPage:Hide()
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_5_0._tf, pg.UIMgr.GetInstance().OverlayMain)
end

local function var_0_4(arg_6_0, arg_6_1)
	local var_6_0 = ""

	if arg_6_1 == var_0_1 then
		var_6_0 = arg_6_0:GetShipOwnStr()
	elseif arg_6_1 == var_0_2 then
		var_6_0 = arg_6_0:GetEsOwnStr()
	elseif arg_6_1 == var_0_3 then
		var_6_0 = arg_6_0:GetOtherOwnStr()
	end

	return ({
		[var_0_1] = i18n("ActivityRemasterCore_award_preview_ship", var_6_0),
		[var_0_2] = i18n("ActivityRemasterCore_award_preview_es", var_6_0),
		[var_0_3] = i18n("ActivityRemasterCore_award_preview_other", var_6_0)
	})[arg_6_1]
end

function var_0_0.InitToggles(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.toggles) do
		local var_7_0 = var_0_4(arg_7_0.remasterData, iter_7_0)

		onToggle(arg_7_0, iter_7_1, function(arg_8_0)
			local var_8_0 = arg_8_0 and COLOR_WHITE or "#393a3c"

			setText(iter_7_1:Find("Text"), setColorStr(var_7_0, var_8_0))

			if arg_8_0 then
				arg_7_0:SwitchPage(iter_7_0)
			end
		end, SFX_PANEL)
		setText(iter_7_1:Find("Text"), setColorStr(var_7_0, "#393a3c"))
	end
end

function var_0_0.GetDisplayData(arg_9_0, arg_9_1)
	local var_9_0 = {}
	local var_9_1 = arg_9_0.remasterData

	if arg_9_1 == var_0_1 then
		var_9_0 = var_9_1:GetRawCollectableShipIdList()
	elseif arg_9_1 == var_0_2 then
		var_9_0 = var_9_1:GetRawCollectableEsList()
	elseif arg_9_1 == var_0_3 then
		var_9_0 = var_9_1:GetRawCollectableOtherList()
	end

	return var_9_0
end

function var_0_0.SwitchPage(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0.uiItemList[arg_10_1]
	local var_10_1 = arg_10_0:GetDisplayData(arg_10_1)

	var_10_0:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			if arg_10_1 == var_0_1 then
				arg_10_0:UpdateShipCard(arg_11_2, var_10_1[arg_11_1 + 1])
			elseif arg_10_1 == var_0_2 or arg_10_1 == var_0_3 then
				arg_10_0:UpdateItemCard(arg_11_2, var_10_1[arg_11_1 + 1])
			end
		end
	end)
	var_10_0:align(#var_10_1)
	scrollToBottom(var_10_0.container.parent)
end

function var_0_0.UpdateShipCard(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_2:GetRawDropData()[2]
	local var_12_1 = ShipGroup.getDefaultShipConfig(var_12_0)
	local var_12_2 = var_12_1.skin_id
	local var_12_3 = pg.ship_skin_template[var_12_2]

	GetImageSpriteFromAtlasAsync("shipYardIcon/" .. var_12_3.painting, var_12_3.painting, arg_12_1:Find("tpl/ico"))

	local var_12_4 = getProxy(CollectionProxy):getShipGroup(var_12_0)

	setActive(arg_12_1:Find("tpl/mask"), var_12_4)
	setScrollText(arg_12_1:Find("name/mask/Text"), var_12_1.name)
	onButton(arg_12_0, arg_12_1, function()
		local var_13_0 = var_12_1.id

		arg_12_0:OpenDesc(arg_12_2)
	end, SFX_PANEL)
end

function var_0_0.UpdateItemCard(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = Drop.Create(arg_14_2:GetRawDropData())

	updateDrop(arg_14_1:Find("award"), var_14_0)
	setScrollText(arg_14_1:Find("name/mask/Text"), var_14_0.cfg.name)
	setActive(arg_14_1:Find("award/mask"), var_14_0:getOwnedCount() > 0)
	onButton(arg_14_0, arg_14_1, function()
		arg_14_0:OpenDesc(arg_14_2)
	end, SFX_PANEL)
end

function var_0_0.OpenDesc(arg_16_0, arg_16_1)
	return
end

function var_0_0.CommonSetting(arg_17_0, arg_17_1)
	setText(arg_17_0._tf:Find("window/top/title"), arg_17_1.title or i18n("words_information"))

	function arg_17_0.hideCall()
		arg_17_0.hideCall = nil

		existCall(arg_17_1.onClose)
	end

	onButton(arg_17_0, arg_17_0._tf:Find("bg"), function()
		existCall(arg_17_0.hideCall)
		arg_17_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_17_0, arg_17_0._tf:Find("window/top/btn_close"), function()
		existCall(arg_17_0.hideCall)
		arg_17_0:Hide()
	end, SFX_CANCEL)

	function arg_17_0.confirmCall()
		arg_17_0.confirmCall = nil

		existCall(arg_17_0.onConfirm)
	end

	local var_17_0 = arg_17_1.btnList or {
		{
			type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.cancel,
			name = i18n("msgbox_text_cancel"),
			func = function()
				existCall(arg_17_0.hideCall)
			end,
			sound = SFX_CANCEL
		},
		{
			type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.confirm,
			name = i18n("msgbox_text_confirm"),
			func = function()
				existCall(arg_17_0.confirmCall)
			end,
			sound = SFX_CONFIRM
		}
	}
	local var_17_1 = arg_17_0._tf:Find("window/bottom/button_container")

	eachChild(var_17_1, function(arg_24_0)
		setActive(arg_24_0, false)
	end)

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		local var_17_2 = var_17_1:Find(iter_17_1.type)

		if var_17_2:GetSiblingIndex() < var_17_1.childCount - iter_17_0 + 1 then
			var_17_2:SetAsLastSibling()
			setActive(var_17_2, true)
		else
			var_17_2 = cloneTplTo(var_17_2, var_17_1, var_17_2.name)
		end

		setText(var_17_2:Find("Text"), iter_17_1.name)
		onButton(arg_17_0, var_17_2, function()
			existCall(iter_17_1.func)
			arg_17_0:Hide()
		end, iter_17_1.sound or SFX_CONFIRM)
	end
end

function var_0_0.onBackPressed(arg_26_0)
	if arg_26_0.awardPage and arg_26_0.awardPage:GetLoaded() and arg_26_0.awardPage:isShowing() then
		arg_26_0.awardPage:Hide()

		return
	end

	arg_26_0:Hide()
end

function var_0_0.OnDestroy(arg_27_0)
	if arg_27_0:isShowing() then
		arg_27_0:Hide()
	end

	if arg_27_0.awardPage and arg_27_0.awardPage:GetLoaded() then
		arg_27_0.awardPage:Destroy()
	end

	arg_27_0.awardPage = nil
end

return var_0_0
