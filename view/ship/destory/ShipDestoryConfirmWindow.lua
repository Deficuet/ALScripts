local var_0_0 = class("ShipDestoryConfirmWindow", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "DestoryConfirmWindow"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0:findTF("window/top/btnBack")

	setActive(arg_2_0:findTF("window/top/bg/infomation/title_en"), PLATFORM_CODE ~= PLATFORM_US)
	setText(arg_2_0:findTF("window/top/bg/infomation/title"), i18n("title_info"))

	arg_2_0.cancelBtn = arg_2_0:findTF("window/cancel_btn")
	arg_2_0.confirmBtn = arg_2_0:findTF("window/confirm_btn")

	setText(findTF(arg_2_0.confirmBtn, "pic"), i18n("destroy_confirm_access"))
	setText(findTF(arg_2_0.cancelBtn, "pic"), i18n("destroy_confirm_cancel"))

	arg_2_0.title = arg_2_0:findTF("window/content/Text")
	arg_2_0.label = arg_2_0:findTF("window/content/desc/label")

	setText(arg_2_0.label, i18n("destory_ship_before_tip"))

	arg_2_0.urLabel = arg_2_0:findTF("window/content/desc/label1")
	arg_2_0.urInput = arg_2_0:findTF("window/content/desc/InputField")
	arg_2_0.urOverflowLabel = arg_2_0:findTF("window/content/desc/label2")

	setText(arg_2_0.urOverflowLabel, i18n("destory_ur_pt_overflowa"))

	local var_2_0 = arg_2_0:findTF("Placeholder", arg_2_0.urInput)

	setText(var_2_0, i18n("box_ship_del_click"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.cancelBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		arg_3_0:Confirm()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("bg"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.SetCallBack(arg_8_0, arg_8_1)
	arg_8_0.callback = arg_8_1
end

function var_0_0.Confirm(arg_9_0)
	if arg_9_0.key then
		local var_9_0 = getInputText(arg_9_0.urInput)

		if arg_9_0.key ~= tonumber(var_9_0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("destory_ship_input_erro"))

			return
		end

		local var_9_1 = arg_9_0.callback

		arg_9_0:Hide()
		existCall(var_9_1)
	else
		local var_9_2 = arg_9_0.callback

		arg_9_0:Hide()
		existCall(var_9_2)
	end
end

function var_0_0.ShowOneShipProtect(arg_10_0, arg_10_1, arg_10_2)
	var_0_0.super.Show(arg_10_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf)

	arg_10_0.key = nil
	arg_10_0.ships = arg_10_1

	arg_10_0:SetCallBack(arg_10_2)
	setText(arg_10_0.title, i18n("unique_ship_tip1"))

	arg_10_0.key = math.random(100000, 999999)

	setText(arg_10_0.urLabel, i18n("unique_ship_tip2", arg_10_0.key))
	setActive(arg_10_0.urLabel, true)
	setActive(arg_10_0.urInput, true)
	setActive(arg_10_0.urOverflowLabel, false)
	mergeSort(arg_10_0.ships, CompareFuncs({
		function(arg_11_0)
			return -arg_11_0.level
		end,
		function(arg_12_0)
			return -arg_12_0:getRarity()
		end
	}, true))

	if #arg_10_0.ships > 5 then
		setActive(arg_10_0._tf:Find("window/content/ships"), true)
		setActive(arg_10_0._tf:Find("window/content/ships_single"), false)

		local var_10_0 = arg_10_0._tf:Find("window/content/ships/content"):GetComponent("LScrollRect")

		function var_10_0.onUpdateItem(arg_13_0, arg_13_1)
			updateShip(tf(arg_13_1), arg_10_0.ships[arg_13_0 + 1])
		end

		onNextTick(function()
			var_10_0:SetTotalCount(#arg_10_0.ships)
		end)
	else
		setActive(arg_10_0._tf:Find("window/content/ships"), false)
		setActive(arg_10_0._tf:Find("window/content/ships_single"), true)

		local var_10_1 = arg_10_0._tf:Find("window/content/ships_single")
		local var_10_2 = UIItemList.New(var_10_1, var_10_1:Find("IconTpl"))

		var_10_2:make(function(arg_15_0, arg_15_1, arg_15_2)
			if arg_15_0 == UIItemList.EventUpdate then
				updateShip(arg_15_2, arg_10_0.ships[arg_15_1 + 1])
			end
		end)
		var_10_2:align(#arg_10_0.ships)
	end
end

function var_0_0.Show(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	var_0_0.super.Show(arg_16_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_16_0._tf)

	arg_16_0.key = nil
	arg_16_0.eliteShips = arg_16_1
	arg_16_0.highLevelShips = arg_16_2
	arg_16_0.overflow = arg_16_3

	arg_16_0:SetCallBack(arg_16_4)
	arg_16_0:Updatelayout()
	arg_16_0:UpdateShips()
end

function var_0_0.ShowEliteTag(arg_17_0, arg_17_1, arg_17_2)
	var_0_0.super.Show(arg_17_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_17_0._tf)
	arg_17_0:SetCallBack(arg_17_2)
	setText(arg_17_0.title, i18n("destroy_eliteship_tip", i18n("destroy_inHardFormation_tip")))
	setActive(arg_17_0.urOverflowLabel, false)
	setActive(arg_17_0.urLabel, false)
	setActive(arg_17_0.urInput, false)

	arg_17_0.ships = arg_17_1

	if #arg_17_0.ships > 5 then
		setActive(arg_17_0._tf:Find("window/content/ships"), true)
		setActive(arg_17_0._tf:Find("window/content/ships_single"), false)

		local var_17_0 = arg_17_0._tf:Find("window/content/ships/content"):GetComponent("LScrollRect")

		function var_17_0.onUpdateItem(arg_18_0, arg_18_1)
			updateShip(tf(arg_18_1), arg_17_0.ships[arg_18_0 + 1])
		end

		onNextTick(function()
			var_17_0:SetTotalCount(#arg_17_0.ships)
		end)
	else
		setActive(arg_17_0._tf:Find("window/content/ships"), false)
		setActive(arg_17_0._tf:Find("window/content/ships_single"), true)

		local var_17_1 = arg_17_0._tf:Find("window/content/ships_single")
		local var_17_2 = UIItemList.New(var_17_1, var_17_1:Find("IconTpl"))

		var_17_2:make(function(arg_20_0, arg_20_1, arg_20_2)
			if arg_20_0 == UIItemList.EventUpdate then
				updateShip(arg_20_2, arg_17_0.ships[arg_20_1 + 1])
			end
		end)
		var_17_2:align(#arg_17_0.ships)
	end
end

function var_0_0.Updatelayout(arg_21_0)
	local var_21_0 = arg_21_0.eliteShips
	local var_21_1 = arg_21_0.highLevelShips
	local var_21_2 = {}

	if #var_21_0 > 0 then
		table.insert(var_21_2, i18n("destroy_high_rarity_tip"))
	end

	if #var_21_1 > 0 then
		table.insert(var_21_2, i18n("destroy_high_level_tip", ""))
	end

	setText(arg_21_0.title, i18n("destroy_eliteship_tip", table.concat(var_21_2, "、")))

	local var_21_3 = _.any(var_21_0, function(arg_22_0)
		return arg_22_0:getConfig("rarity") >= ShipRarity.SSR
	end)

	if var_21_3 and not arg_21_0.key then
		arg_21_0.key = math.random(100000, 999999)

		setText(arg_21_0.urLabel, i18n("destroy_ur_rarity_tip", arg_21_0.key))
	else
		setText(arg_21_0.urLabel, "")
	end

	local var_21_4 = var_21_3 and arg_21_0.overflow

	setActive(arg_21_0.urOverflowLabel, var_21_4)
	setActive(arg_21_0.urLabel, var_21_3)
	setActive(arg_21_0.urInput, var_21_3)
end

function var_0_0.UpdateShips(arg_23_0)
	local var_23_0 = arg_23_0.eliteShips
	local var_23_1 = arg_23_0.highLevelShips
	local var_23_2 = table.mergeArray(var_23_1, var_23_0)

	mergeSort(var_23_2, CompareFuncs({
		function(arg_24_0)
			return -arg_24_0.level
		end,
		function(arg_25_0)
			return -arg_25_0:getRarity()
		end
	}, true))

	arg_23_0.ships = var_23_2

	if #arg_23_0.ships > 5 then
		setActive(arg_23_0._tf:Find("window/content/ships"), true)
		setActive(arg_23_0._tf:Find("window/content/ships_single"), false)

		local var_23_3 = arg_23_0._tf:Find("window/content/ships/content"):GetComponent("LScrollRect")

		function var_23_3.onUpdateItem(arg_26_0, arg_26_1)
			updateShip(tf(arg_26_1), arg_23_0.ships[arg_26_0 + 1])
		end

		onNextTick(function()
			var_23_3:SetTotalCount(#arg_23_0.ships)
		end)
	else
		setActive(arg_23_0._tf:Find("window/content/ships"), false)
		setActive(arg_23_0._tf:Find("window/content/ships_single"), true)

		local var_23_4 = arg_23_0._tf:Find("window/content/ships_single")
		local var_23_5 = UIItemList.New(var_23_4, var_23_4:Find("IconTpl"))

		var_23_5:make(function(arg_28_0, arg_28_1, arg_28_2)
			if arg_28_0 == UIItemList.EventUpdate then
				updateShip(arg_28_2, arg_23_0.ships[arg_28_1 + 1])
			end
		end)
		var_23_5:align(#arg_23_0.ships)
	end
end

function var_0_0.Hide(arg_29_0)
	var_0_0.super.Hide(arg_29_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_29_0._tf, arg_29_0._parentTf)

	arg_29_0.key = nil
	arg_29_0.callback = nil

	setInputText(arg_29_0.urInput, "")
end

function var_0_0.OnDestroy(arg_30_0)
	if arg_30_0:isShowing() then
		arg_30_0:Hide()
	end
end

return var_0_0
