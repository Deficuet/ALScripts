local var_0_0 = class("IslandPostEventWindow", import(".IslandBaseMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandPostEventboxUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.titleTxt = arg_2_0._tf:Find("title/Text"):GetComponent(typeof(Text))
	arg_2_0.descTxt = arg_2_0._tf:Find("title/desc"):GetComponent(typeof(Text))
	arg_2_0.icon = arg_2_0._tf:Find("title/icon_bg/icon"):GetComponent(typeof(Image))
	arg_2_0.bigIcon = arg_2_0._tf:Find("frame/ico"):GetComponent(typeof(Image))
	arg_2_0.itemsList = UIItemList.New(arg_2_0._tf:Find("frame/items"), arg_2_0._tf:Find("frame/items/tpl"))
	arg_2_0.additionList = UIItemList.New(arg_2_0._tf:Find("frame/addition"), arg_2_0._tf:Find("frame/addition/tpl"))
	arg_2_0.closeBtn = arg_2_0._tf:Find("frame/btns/close")
	arg_2_0.openBtn = arg_2_0._tf:Find("frame/btns/open")

	setText(arg_2_0._tf:Find("title/event/Text"), i18n("island_post_event_label"))
	setText(arg_2_0._tf:Find("frame/btns/close/Text"), i18n("island_post_event_close_label"))
	setText(arg_2_0._tf:Find("frame/btns/open/Text"), i18n("island_post_event_open_label"))
	setText(arg_2_0._tf:Find("frame/title/Text"), i18n("island_post_event_addition_label"))

	arg_2_0.animation = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.dftAniEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		if not arg_3_0.isSwitch then
			arg_3_0:Switch()

			return
		end

		triggerButton(arg_3_0.closeBtn)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.openBtn, function()
		local var_6_0 = arg_3_0.settings.onYes

		arg_3_0:Hide()

		if var_6_0 then
			var_6_0()
		end
	end, SFX_PANEL)
end

function var_0_0.Switch(arg_7_0)
	if arg_7_0.isAnimating then
		return
	end

	arg_7_0.isAnimating = true

	arg_7_0.animation:Play("switch")
end

function var_0_0.OnShow(arg_8_0)
	arg_8_0.dftAniEvent:SetEndEvent(function()
		arg_8_0.isSwitch = true
		arg_8_0.isAnimating = false
	end)

	arg_8_0.isSwitch = false
	arg_8_0.isAnimating = false

	local var_8_0 = arg_8_0.settings.rest
	local var_8_1 = var_8_0:GetEventInfo()

	arg_8_0.config = pg.island_manage_event[var_8_1]

	arg_8_0:UpdateTitle(var_8_0)
	arg_8_0:UpdateMainView(var_8_0)

	if not arg_8_0.settings.isNew then
		triggerButton(arg_8_0._tf)
	end

	if arg_8_0.settings.blur then
		arg_8_0:BlurPanel()
	end

	if arg_8_0.settings.isNew then
		getProxy(SettingsProxy):RecordIslandRestEvet()
	end
end

function var_0_0.BlurPanel(arg_10_0)
	arg_10_0.view.viewComponent:BlurPanel(arg_10_0.view._tf)
end

function var_0_0.UnBlurPanel(arg_11_0)
	arg_11_0.view.viewComponent:UnOverlayPanel(arg_11_0.view._tf, pg.UIMgr.GetInstance().OverlayMain)
end

function var_0_0.UpdateTitle(arg_12_0, arg_12_1)
	arg_12_0.titleTxt.text = arg_12_0.config.name
	arg_12_0.descTxt.text = string.gsub(arg_12_0.config.desc, "$1", arg_12_1:getConfig("name"))

	local var_12_0 = "icon" .. arg_12_0.config.id
	local var_12_1 = GetSpriteFromAtlas("ui/islandpostmsgboxui_atlas", var_12_0)

	arg_12_0.icon.sprite = var_12_1
end

function var_0_0.UpdateMainView(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0:WarpItemInfo(arg_13_1)

	arg_13_0.itemsList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = var_13_0[arg_14_1 + 1]
			local var_14_1 = Drop.New({
				count = 0,
				type = DROP_TYPE_ISLAND_ITEM,
				id = var_14_0.id
			})

			updateCustomDrop(arg_14_2, var_14_1)
		end
	end)
	arg_13_0.itemsList:align(#var_13_0)

	local var_13_1 = arg_13_0:WarpAdditionInfo()

	arg_13_0.additionList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			setText(arg_15_2:Find("Text"), var_13_1[arg_15_1 + 1][1])
			setText(arg_15_2:Find("value"), "+" .. var_13_1[arg_15_1 + 1][2] .. "%")
		end
	end)
	arg_13_0.additionList:align(#var_13_1)

	local var_13_2 = (arg_13_1:getConfig("aera_group") or 1) .. arg_13_0.config.id

	LoadSpriteAsync("island/islandrestevent/" .. var_13_2, function(arg_16_0)
		if IsNil(arg_13_0.bigIcon) then
			return
		end

		arg_13_0.bigIcon.sprite = arg_16_0
	end)
end

function var_0_0.WarpItemInfo(arg_17_0, arg_17_1)
	local var_17_0 = {}
	local var_17_1, var_17_2 = arg_17_1:GetEventInfo()
	local var_17_3 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	for iter_17_0, iter_17_1 in ipairs(arg_17_1:getConfig("item_id")) do
		local var_17_4 = var_17_3:GetItemById(iter_17_1[1]) or IslandItem.New({
			id = iter_17_1[1]
		})

		if var_17_4 and var_17_2[var_17_4.id] then
			table.insert(var_17_0, var_17_4)
		end
	end

	return var_17_0
end

function var_0_0.WarpAdditionInfo(arg_18_0)
	local var_18_0 = {}

	table.insert(var_18_0, {
		i18n("island_addition_influence"),
		arg_18_0.config.influence_bonus
	})
	table.insert(var_18_0, {
		i18n("island_addition_sale"),
		arg_18_0.config.event_effect[1][1]
	})

	return var_18_0
end

function var_0_0.OnHide(arg_19_0)
	if arg_19_0.settings.onHide then
		arg_19_0.settings.onHide()

		arg_19_0.settings.onHide = nil
	end

	if arg_19_0.dftAniEvent then
		arg_19_0.dftAniEvent:SetEndEvent(nil)
	end

	if arg_19_0.settings.blur then
		arg_19_0:UnBlurPanel()
	end
end

return var_0_0
