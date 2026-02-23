local var_0_0 = class("IslandBookAwardListBox", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandBookAwardListBox"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.titleTxt = arg_2_0._tf:Find("title"):GetComponent(typeof(Text))
	arg_2_0.titleTxt.text = i18n("island_book_award_title")
	arg_2_0.closeBtn = arg_2_0._tf:Find("close")

	setActive(arg_2_0._tf:Find("tpl"), false)

	arg_2_0.scrollRect = arg_2_0._tf:Find("scrollrect"):GetComponent("LScrollRect")

	function arg_2_0.scrollRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0.closeBtn, function()
		arg_5_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_7_0, arg_7_1)
	return
end

function var_0_0.OnUpdateItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.ids[arg_8_1 + 1]
	local var_8_1 = arg_8_2.transform
	local var_8_2 = pg.island_collection_reward[var_8_0]
	local var_8_3 = Drop.Create(var_8_2.award_display)

	updateCustomDrop(var_8_1:Find("drop"), var_8_3, {
		style = "island"
	})
	onButton(arg_8_0, var_8_1, function()
		arg_8_0.contextData:ShowMsgBox({
			title = i18n("island_word_desc"),
			type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
			dropData = var_8_3
		})
	end)
	setText(var_8_1:Find("level"), string.format("%02d", var_8_2.level))
	setText(var_8_1:Find("desc"), var_8_2.describe)

	local var_8_4 = table.contains(arg_8_0.gotIds, var_8_0)

	setActive(var_8_1:Find("drop/got"), var_8_4)
	setGray(var_8_1, not var_8_4, true)
end

function var_0_0.Show(arg_10_0)
	var_0_0.super.Show(arg_10_0)

	local var_10_0 = getProxy(IslandProxy):GetIsland():GetBookAgency()

	arg_10_0.ids = var_10_0:GetPointAwardIds(arg_10_0.contextData.type)
	arg_10_0.gotIds = var_10_0:GetPointAwardGotIds(arg_10_0.contextData.type)

	arg_10_0.scrollRect:SetTotalCount(#arg_10_0.ids, -1)
	pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf)
end

function var_0_0.Hide(arg_11_0)
	var_0_0.super.Hide(arg_11_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0._tf, arg_11_0._parentTf)
end

function var_0_0.OnDestroy(arg_12_0)
	arg_12_0:Hide()
	ClearLScrollrect(arg_12_0.scrollRect)
end

return var_0_0
