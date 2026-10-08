local var_0_0 = class("ShipDestroyPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "DestoryInfoUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"energy",
		"shipstatus",
		"shipframe",
		"shiptype",
		"ui/proposeshipcard",
		"ui/heartshipcard",
		"shipyardicon/unknown",
		"ui/iconcolorful"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.getRefreshResList(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1 or {}) do
		local var_3_1 = arg_3_2[iter_3_1]

		if var_3_1 then
			arg_3_0:insertDockyardShipItemRes(var_3_0, var_3_1)
		end
	end

	local var_3_2, var_3_3, var_3_4 = var_0_0.CalcShipsReturnRes(arg_3_1, arg_3_2)

	table.insert(var_3_4, 1, Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = PlayerConst.ResOil,
		count = var_3_3
	}))
	table.insert(var_3_4, 1, Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = PlayerConst.ResGold,
		count = var_3_2
	}))
	_.each(var_3_4, function(arg_4_0)
		if arg_4_0.count > 0 then
			table.insert(var_3_0, arg_4_0:getIcon())
		end
	end)

	return var_3_0
end

function var_0_0.insertDockyardShipItemRes(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = string.format(ResPathSupport.ConstPath.BG.ShipCard, arg_5_2:rarity2bgPrint())

	table.insert(arg_5_1, var_5_0)

	local var_5_1 = ResPathSupport.GetPaintingShipYardIconListByPaintingName(arg_5_2:getPainting())

	table.insertto(arg_5_1, var_5_1)

	local var_5_2, var_5_3 = arg_5_2:GetFrameAndEffect()
	local var_5_4 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Effect, var_5_3)

	table.insert(arg_5_1, var_5_4)
end

function var_0_0.OnLoaded(arg_6_0)
	arg_6_0.cardScrollRect = arg_6_0._tf:Find("frame/sliders/content"):GetComponent("LScrollRect")

	function arg_6_0.cardScrollRect.onInitItem(arg_7_0)
		return
	end

	function arg_6_0.cardScrollRect.onUpdateItem(arg_8_0, arg_8_1)
		local var_8_0 = arg_6_0.shipIds[arg_8_0 + 1]
		local var_8_1 = DockyardShipItem.New(arg_8_1, ShipStatus.TAG_HIDE_DESTROY)

		var_8_1:update(arg_6_0.shipVOs[var_8_0])
		onButton(arg_6_0, var_8_1.tr, function()
			existCall(arg_6_0.OnCardClick, var_8_1)
			arg_6_0:DisplayShipList()
		end, SFX_PANEL)
	end

	function arg_6_0.cardScrollRect.onReturnItem(arg_10_0, arg_10_1)
		removeOnButton(arg_10_1)
	end

	arg_6_0.cancelBtn = arg_6_0._tf:Find("frame/cancel_button")
	arg_6_0.backBtn = arg_6_0._tf:Find("frame/top/btnBack")
	arg_6_0.confirmBtn = arg_6_0._tf:Find("frame/confirm_button")

	setText(arg_6_0._tf:Find("frame/bg_award/label"), i18n("disassemble_available") .. ":")

	local var_6_0 = arg_6_0._tf:Find("frame/bg_award/res_list")

	arg_6_0.resList = UIItemList.New(var_6_0, var_6_0:Find("res"))

	arg_6_0.resList:make(function(arg_11_0, arg_11_1, arg_11_2)
		arg_11_1 = arg_11_1 + 1

		if arg_11_0 == UIItemList.EventUpdate then
			local var_11_0 = arg_6_0.showList[arg_11_1]

			GetImageSpriteFromAtlasAsync(var_11_0:getIcon(), "", arg_11_2:Find("icon"))
			setText(arg_11_2:Find("Text"), "X" .. var_11_0.count)
		end
	end)
end

function var_0_0.OnInit(arg_12_0)
	onButton(arg_12_0, arg_12_0.cancelBtn, function()
		arg_12_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0.backBtn, function()
		arg_12_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0.confirmBtn, function()
		if arg_12_0.OnConfirm then
			arg_12_0.OnConfirm()
		end
	end, SFX_PANEL)
end

function var_0_0.SetConfirmCallBack(arg_16_0, arg_16_1)
	arg_16_0.OnConfirm = arg_16_1
end

function var_0_0.SetCardClickCallBack(arg_17_0, arg_17_1)
	arg_17_0.OnCardClick = arg_17_1
end

function var_0_0.Refresh(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.shipIds = arg_18_1
	arg_18_0.shipVOs = arg_18_2

	local var_18_0 = arg_18_0:getRefreshResList(arg_18_1, arg_18_2)

	SplitPackConst.DownloadByLuaArr(var_18_0, function()
		if arg_18_0._state == var_0_0.STATES.DESTROY then
			return
		end

		arg_18_0:DisplayShipList()
		arg_18_0:RefreshRes()
		arg_18_0:Show()
	end)
end

function var_0_0.DisplayShipList(arg_20_0)
	arg_20_0.cardScrollRect:SetTotalCount(#arg_20_0.shipIds)

	if #arg_20_0.shipIds == 0 then
		arg_20_0:Hide()
	end
end

function var_0_0.CalcShipsReturnRes(arg_21_0, arg_21_1)
	local var_21_0 = _.map(arg_21_0, function(arg_22_0)
		return arg_21_1[arg_22_0]
	end)

	return ShipCalcHelper.CalcDestoryRes(var_21_0)
end

function var_0_0.RefreshRes(arg_23_0)
	local var_23_0, var_23_1, var_23_2 = var_0_0.CalcShipsReturnRes(arg_23_0.shipIds, arg_23_0.shipVOs)

	table.insert(var_23_2, 1, Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = PlayerConst.ResOil,
		count = var_23_1
	}))
	table.insert(var_23_2, 1, Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = PlayerConst.ResGold,
		count = var_23_0
	}))

	arg_23_0.showList = underscore.filter(var_23_2, function(arg_24_0)
		return arg_24_0.count > 0
	end)

	arg_23_0.resList:align(#arg_23_0.showList)
end

function var_0_0.Show(arg_25_0)
	var_0_0.super.Show(arg_25_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_25_0._tf)
end

function var_0_0.Hide(arg_26_0)
	var_0_0.super.Hide(arg_26_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_26_0._tf, arg_26_0._parentTf)
end

function var_0_0.OnDestroy(arg_27_0)
	arg_27_0.OnCardClick = nil

	ClearLScrollrect(arg_27_0.cardScrollRect)
	arg_27_0:Hide()
end

return var_0_0
