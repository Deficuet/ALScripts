local var_0_0 = class("ShipDestoryConfirmWindow", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "DestoryConfirmWindow"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"weaponframes",
		"shiptype",
		"ui/iconcolorful"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.getShipResList(arg_3_0, arg_3_1)
	local var_3_0 = {}

	_.each(arg_3_1 or {}, function(arg_4_0)
		if arg_4_0 then
			local var_4_0 = ResPathSupport.GetPaintingSquareIconListByPaintingName(arg_4_0:getPainting())

			table.insertto(var_3_0, var_4_0)
		end
	end)

	return var_3_0
end

function var_0_0.downloadShipResList(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0:getShipResList(arg_5_1)

	SplitPackConst.DownloadByLuaArr(var_5_0, function()
		if arg_5_0._state == var_0_0.STATES.DESTROY then
			return
		end

		arg_5_2()
	end)
end

function var_0_0.OnLoaded(arg_7_0)
	arg_7_0.closeBtn = arg_7_0._tf:Find("window/top/btnBack")

	setActive(arg_7_0._tf:Find("window/top/bg/infomation/title_en"), PLATFORM_CODE ~= PLATFORM_US)
	setText(arg_7_0._tf:Find("window/top/bg/infomation/title"), i18n("title_info"))

	arg_7_0.cancelBtn = arg_7_0._tf:Find("window/cancel_btn")
	arg_7_0.confirmBtn = arg_7_0._tf:Find("window/confirm_btn")

	setText(findTF(arg_7_0.confirmBtn, "pic"), i18n("destroy_confirm_access"))
	setText(findTF(arg_7_0.cancelBtn, "pic"), i18n("destroy_confirm_cancel"))

	arg_7_0.title = arg_7_0._tf:Find("window/content/Text")
	arg_7_0.label = arg_7_0._tf:Find("window/content/desc/label")

	setText(arg_7_0.label, i18n("destory_ship_before_tip"))

	arg_7_0.urLabel = arg_7_0._tf:Find("window/content/desc/label1")
	arg_7_0.urInput = arg_7_0._tf:Find("window/content/desc/InputField")
	arg_7_0.urOverflowLabel = arg_7_0._tf:Find("window/content/desc/label2")

	setText(arg_7_0.urOverflowLabel, i18n("destory_ur_pt_overflowa"))

	local var_7_0 = arg_7_0.urInput:Find("Placeholder")

	setText(var_7_0, i18n("box_ship_del_click"))
end

function var_0_0.OnInit(arg_8_0)
	onButton(arg_8_0, arg_8_0.cancelBtn, function()
		arg_8_0:Hide()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.confirmBtn, function()
		arg_8_0:Confirm()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0._tf:Find("bg"), function()
		arg_8_0:Hide()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.closeBtn, function()
		arg_8_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.SetCallBack(arg_13_0, arg_13_1)
	arg_13_0.callback = arg_13_1
end

function var_0_0.Confirm(arg_14_0)
	if arg_14_0.key then
		local var_14_0 = getInputText(arg_14_0.urInput)

		if arg_14_0.key ~= tonumber(var_14_0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("destory_ship_input_erro"))

			return
		end

		local var_14_1 = arg_14_0.callback

		arg_14_0:Hide()
		existCall(var_14_1)
	else
		local var_14_2 = arg_14_0.callback

		arg_14_0:Hide()
		existCall(var_14_2)
	end
end

function var_0_0.ShowOneShipProtect(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0:downloadShipResList(arg_15_1, function()
		arg_15_0:ShowOneShipProtectAfterResDownload(arg_15_1, arg_15_2)
	end)
end

function var_0_0.ShowOneShipProtectAfterResDownload(arg_17_0, arg_17_1, arg_17_2)
	var_0_0.super.Show(arg_17_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_17_0._tf)

	arg_17_0.key = nil
	arg_17_0.ships = arg_17_1

	arg_17_0:SetCallBack(arg_17_2)
	setText(arg_17_0.title, i18n("unique_ship_tip1"))

	arg_17_0.key = math.random(100000, 999999)

	setText(arg_17_0.urLabel, i18n("unique_ship_tip2", arg_17_0.key))
	setActive(arg_17_0.urLabel, true)
	setActive(arg_17_0.urInput, true)
	setActive(arg_17_0.urOverflowLabel, false)
	mergeSort(arg_17_0.ships, CompareFuncs({
		function(arg_18_0)
			return -arg_18_0.level
		end,
		function(arg_19_0)
			return -arg_19_0:getRarity()
		end
	}, true))

	if #arg_17_0.ships > 5 then
		setActive(arg_17_0._tf:Find("window/content/ships"), true)
		setActive(arg_17_0._tf:Find("window/content/ships_single"), false)

		local var_17_0 = arg_17_0._tf:Find("window/content/ships/content"):GetComponent("LScrollRect")

		function var_17_0.onUpdateItem(arg_20_0, arg_20_1)
			updateShip(tf(arg_20_1), arg_17_0.ships[arg_20_0 + 1])
		end

		onNextTick(function()
			var_17_0:SetTotalCount(#arg_17_0.ships)
		end)
	else
		setActive(arg_17_0._tf:Find("window/content/ships"), false)
		setActive(arg_17_0._tf:Find("window/content/ships_single"), true)

		local var_17_1 = arg_17_0._tf:Find("window/content/ships_single")
		local var_17_2 = UIItemList.New(var_17_1, var_17_1:Find("IconTpl"))

		var_17_2:make(function(arg_22_0, arg_22_1, arg_22_2)
			if arg_22_0 == UIItemList.EventUpdate then
				updateShip(arg_22_2, arg_17_0.ships[arg_22_1 + 1])
			end
		end)
		var_17_2:align(#arg_17_0.ships)
	end
end

function var_0_0.Show(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	local var_23_0 = table.mergeArray(arg_23_2 or {}, arg_23_1 or {})

	arg_23_0:downloadShipResList(var_23_0, function()
		arg_23_0:ShowAfterResDownload(arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	end)
end

function var_0_0.ShowAfterResDownload(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	var_0_0.super.Show(arg_25_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_25_0._tf)

	arg_25_0.key = nil
	arg_25_0.eliteShips = arg_25_1
	arg_25_0.highLevelShips = arg_25_2
	arg_25_0.overflow = arg_25_3

	arg_25_0:SetCallBack(arg_25_4)
	arg_25_0:Updatelayout()
	arg_25_0:UpdateShips()
end

function var_0_0.ShowEliteTag(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0:downloadShipResList(arg_26_1, function()
		arg_26_0:ShowEliteTagAfterResDownload(arg_26_1, arg_26_2)
	end)
end

function var_0_0.ShowEliteTagAfterResDownload(arg_28_0, arg_28_1, arg_28_2)
	var_0_0.super.Show(arg_28_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_28_0._tf)
	arg_28_0:SetCallBack(arg_28_2)
	setText(arg_28_0.title, i18n("destroy_eliteship_tip", i18n("destroy_inHardFormation_tip")))
	setActive(arg_28_0.urOverflowLabel, false)
	setActive(arg_28_0.urLabel, false)
	setActive(arg_28_0.urInput, false)

	arg_28_0.ships = arg_28_1

	if #arg_28_0.ships > 5 then
		setActive(arg_28_0._tf:Find("window/content/ships"), true)
		setActive(arg_28_0._tf:Find("window/content/ships_single"), false)

		local var_28_0 = arg_28_0._tf:Find("window/content/ships/content"):GetComponent("LScrollRect")

		function var_28_0.onUpdateItem(arg_29_0, arg_29_1)
			updateShip(tf(arg_29_1), arg_28_0.ships[arg_29_0 + 1])
		end

		onNextTick(function()
			var_28_0:SetTotalCount(#arg_28_0.ships)
		end)
	else
		setActive(arg_28_0._tf:Find("window/content/ships"), false)
		setActive(arg_28_0._tf:Find("window/content/ships_single"), true)

		local var_28_1 = arg_28_0._tf:Find("window/content/ships_single")
		local var_28_2 = UIItemList.New(var_28_1, var_28_1:Find("IconTpl"))

		var_28_2:make(function(arg_31_0, arg_31_1, arg_31_2)
			if arg_31_0 == UIItemList.EventUpdate then
				updateShip(arg_31_2, arg_28_0.ships[arg_31_1 + 1])
			end
		end)
		var_28_2:align(#arg_28_0.ships)
	end
end

function var_0_0.Updatelayout(arg_32_0)
	local var_32_0 = arg_32_0.eliteShips
	local var_32_1 = arg_32_0.highLevelShips
	local var_32_2 = {}

	if #var_32_0 > 0 then
		table.insert(var_32_2, i18n("destroy_high_rarity_tip"))
	end

	if #var_32_1 > 0 then
		table.insert(var_32_2, i18n("destroy_high_level_tip", ""))
	end

	setText(arg_32_0.title, i18n("destroy_eliteship_tip", table.concat(var_32_2, "、")))

	local var_32_3 = _.any(var_32_0, function(arg_33_0)
		return arg_33_0:getConfig("rarity") >= ShipRarity.SSR
	end)

	if var_32_3 and not arg_32_0.key then
		arg_32_0.key = math.random(100000, 999999)

		setText(arg_32_0.urLabel, i18n("destroy_ur_rarity_tip", arg_32_0.key))
	else
		setText(arg_32_0.urLabel, "")
	end

	local var_32_4 = var_32_3 and arg_32_0.overflow

	setActive(arg_32_0.urOverflowLabel, var_32_4)
	setActive(arg_32_0.urLabel, var_32_3)
	setActive(arg_32_0.urInput, var_32_3)
end

function var_0_0.UpdateShips(arg_34_0)
	local var_34_0 = arg_34_0.eliteShips
	local var_34_1 = arg_34_0.highLevelShips
	local var_34_2 = table.mergeArray(var_34_1, var_34_0)

	mergeSort(var_34_2, CompareFuncs({
		function(arg_35_0)
			return -arg_35_0.level
		end,
		function(arg_36_0)
			return -arg_36_0:getRarity()
		end
	}, true))

	arg_34_0.ships = var_34_2

	if #arg_34_0.ships > 5 then
		setActive(arg_34_0._tf:Find("window/content/ships"), true)
		setActive(arg_34_0._tf:Find("window/content/ships_single"), false)

		local var_34_3 = arg_34_0._tf:Find("window/content/ships/content"):GetComponent("LScrollRect")

		function var_34_3.onUpdateItem(arg_37_0, arg_37_1)
			updateShip(tf(arg_37_1), arg_34_0.ships[arg_37_0 + 1])
		end

		onNextTick(function()
			var_34_3:SetTotalCount(#arg_34_0.ships)
		end)
	else
		setActive(arg_34_0._tf:Find("window/content/ships"), false)
		setActive(arg_34_0._tf:Find("window/content/ships_single"), true)

		local var_34_4 = arg_34_0._tf:Find("window/content/ships_single")
		local var_34_5 = UIItemList.New(var_34_4, var_34_4:Find("IconTpl"))

		var_34_5:make(function(arg_39_0, arg_39_1, arg_39_2)
			if arg_39_0 == UIItemList.EventUpdate then
				updateShip(arg_39_2, arg_34_0.ships[arg_39_1 + 1])
			end
		end)
		var_34_5:align(#arg_34_0.ships)
	end
end

function var_0_0.Hide(arg_40_0)
	var_0_0.super.Hide(arg_40_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_40_0._tf, arg_40_0._parentTf)

	arg_40_0.key = nil
	arg_40_0.callback = nil

	setInputText(arg_40_0.urInput, "")
end

function var_0_0.OnDestroy(arg_41_0)
	if arg_41_0:isShowing() then
		arg_41_0:Hide()
	end
end

return var_0_0
