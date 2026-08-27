local var_0_0 = class("ChapterAutoAddTimePanel", import("view.base.BaseSubView"))

var_0_0.GET_SHOW_ID = {
	[ChapterAutoTicket.TYPE.MAIN] = 68710,
	[ChapterAutoTicket.TYPE.TIME] = 68711
}

function var_0_0.getUIName(arg_1_0)
	return "ChapterAutoAddTimePanel"
end

function var_0_0.OnLoaded(arg_2_0)
	setText(arg_2_0.uiTitleText, i18n("auto_battle_time_add_headline"))
	setText(arg_2_0.uiTitleEnText, i18n("auto_battle_time_add_headline_en"))
	setText(arg_2_0.uiSureBtn:Find("Text"), i18n("auto_battle_time_add_confirm"))
	setText(arg_2_0.uiCancelBtn:Find("Text"), i18n("auto_battle_time_add_cancel"))

	arg_2_0.uiList = UIItemList.New(arg_2_0.uiContent, arg_2_0.uiContent:Find("tpl"))
	arg_2_0.type2Second = {}
	arg_2_0.type2Second[ChapterAutoTicket.TYPE.TIME] = pg.gameset.auto_battle_tickect_to_second_type3.key_value
	arg_2_0.type2Second[ChapterAutoTicket.TYPE.MAIN] = pg.gameset.auto_battle_tickect_to_second_type1.key_value
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.uiCancelBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.uiCloseBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.uiSureBtn, function()
		local var_7_0 = arg_3_0.selectedCntByType[ChapterAutoTicket.TYPE.MAIN] or 0
		local var_7_1 = arg_3_0.selectedCntByType[ChapterAutoTicket.TYPE.TIME] or 0

		if var_7_0 == 0 and var_7_1 == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_time_add_zero_item"))

			return
		end

		pg.m02:sendNotification(GAME.ADD_CHAPTER_AUTO_TIME, {
			type1Num = var_7_0,
			type3Num = var_7_1,
			callback = function()
				arg_3_0:UpdateData()
			end
		})
	end, SFX_PANEL)
	arg_3_0.uiList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventInit then
			arg_3_0:InitTpl(arg_9_1, arg_9_2)
		elseif arg_9_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateTpl(arg_9_1, arg_9_2)
		end
	end)
end

function var_0_0.Show(arg_10_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf)
	var_0_0.super.Show(arg_10_0)
	arg_10_0:UpdateData()
end

function var_0_0.UpdateData(arg_11_0)
	local var_11_0 = getProxy(ChapterAutoProxy)

	arg_11_0.remainTime = var_11_0:GetRemainTime()
	arg_11_0.allCntByType = {}

	local var_11_1 = var_11_0:GetTicketListByType(ChapterAutoTicket.TYPE.TIME)

	arg_11_0.allCntByType[ChapterAutoTicket.TYPE.TIME] = underscore.reduce(var_11_1, 0, function(arg_12_0, arg_12_1)
		return arg_12_0 + arg_12_1:GetCount()
	end)

	local var_11_2 = var_11_0:GetTicketListByType(ChapterAutoTicket.TYPE.MAIN)

	arg_11_0.allCntByType[ChapterAutoTicket.TYPE.MAIN] = underscore.reduce(var_11_2, 0, function(arg_13_0, arg_13_1)
		return arg_13_0 + arg_13_1:GetCount()
	end)
	arg_11_0.showTypes = {
		ChapterAutoTicket.TYPE.MAIN
	}

	if pg.gameset.auto_battle_time_add_item_show_type3.key_value == 1 then
		table.insert(arg_11_0.showTypes, ChapterAutoTicket.TYPE.TIME)
	end

	arg_11_0.selectedCntByType = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0.showTypes) do
		arg_11_0.selectedCntByType[iter_11_1] = 0
	end

	arg_11_0.uiList:align(#arg_11_0.showTypes)
	arg_11_0:OnSelCntUpdate()
end

function var_0_0.OnSelCntUpdate(arg_14_0)
	local var_14_0 = 0

	for iter_14_0, iter_14_1 in pairs(arg_14_0.showTypes) do
		var_14_0 = var_14_0 + arg_14_0.type2Second[iter_14_1] * arg_14_0.selectedCntByType[iter_14_1]
	end

	local var_14_1 = pg.TimeMgr.GetInstance()
	local var_14_2 = i18n("auto_battle_time_add_info", var_14_1:DescCDTime(arg_14_0.remainTime), var_14_1:DescCDTime(var_14_0))

	if arg_14_0.remainTime < 0 then
		var_14_2 = string.gsub(var_14_2, "#ffffff", COLOR_RED)
	end

	setText(arg_14_0.uiTimeText, var_14_2)
	arg_14_0.uiList:align(#arg_14_0.showTypes)
end

function var_0_0.InitTpl(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.showTypes[arg_15_1 + 1]
	local var_15_1 = Drop.New({
		type = DROP_TYPE_VITEM,
		id = var_0_0.GET_SHOW_ID[var_15_0],
		count = arg_15_0.allCntByType[var_15_0]
	})

	updateDrop(arg_15_2:Find("IconTpl"), var_15_1, {
		count = arg_15_0.allCntByType[var_15_0]
	})
	setScrollText(arg_15_2:Find("name/Text"), var_15_1:getName())
	onButton(arg_15_0, arg_15_2, function()
		local var_16_0 = arg_15_0.allCntByType[var_15_0]

		if var_16_0 <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_time_add_item_lack"))

			return
		end

		if arg_15_0.selectedCntByType[var_15_0] == var_16_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_time_add_item_lack"))

			return
		end

		arg_15_0.selectedCntByType[var_15_0] = arg_15_0.selectedCntByType[var_15_0] + 1

		arg_15_0:OnSelCntUpdate()
	end, SFX_PANEL)
	onButton(arg_15_0, arg_15_2:Find("cnt/reduce"), function()
		if arg_15_0.selectedCntByType[var_15_0] == 0 then
			return
		end

		arg_15_0.selectedCntByType[var_15_0] = arg_15_0.selectedCntByType[var_15_0] - 1

		arg_15_0:OnSelCntUpdate()
	end, SFX_PANEL)
end

function var_0_0.UpdateTpl(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.showTypes[arg_18_1 + 1]
	local var_18_1 = arg_18_0.selectedCntByType[var_18_0]
	local var_18_2 = arg_18_0.allCntByType[var_18_0]
	local var_18_3 = var_18_1 > 0

	setActive(arg_18_2:Find("select"), var_18_3)
	setActive(arg_18_2:Find("cnt"), var_18_1 > 0)
	setText(arg_18_2:Find("cnt/Text"), var_18_1)
	setText(arg_18_2:Find("IconTpl/icon_bg/count"), var_18_2)
end

function var_0_0.Hide(arg_19_0)
	var_0_0.super.Hide(arg_19_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_19_0._tf, arg_19_0._parentTf)
end

function var_0_0.OnDestroy(arg_20_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_20_0._tf, arg_20_0._parentTf)
end

return var_0_0
