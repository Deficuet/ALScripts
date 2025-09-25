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

	arg_5_0.ids = Clone(pg.island_collection_reward.all)

	table.sort(arg_5_0.ids, CompareFuncs({
		function(arg_7_0)
			return pg.island_collection_reward[arg_7_0].level
		end,
		function(arg_8_0)
			return arg_8_0
		end
	}))
end

function var_0_0.OnInitItem(arg_9_0, arg_9_1)
	return
end

function var_0_0.OnUpdateItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.ids[arg_10_1 + 1]
	local var_10_1 = arg_10_2.transform
	local var_10_2 = pg.island_collection_reward[var_10_0]

	updateCustomDrop(var_10_1:Find("drop"), Drop.Create(var_10_2.award_display), {
		style = "island"
	})
	setText(var_10_1:Find("level"), string.format("%02d", var_10_2.level))
	setText(var_10_1:Find("desc"), var_10_2.describe)

	local var_10_3 = table.contains(arg_10_0.gotIds, var_10_0)

	setGray(var_10_1, not var_10_3, true)
end

function var_0_0.Show(arg_11_0)
	var_0_0.super.Show(arg_11_0)

	arg_11_0.gotIds = getProxy(IslandProxy):GetIsland():GetBookAgency():GetPointAwardGotIds()

	arg_11_0.scrollRect:SetTotalCount(#arg_11_0.ids, -1)
	pg.UIMgr.GetInstance():BlurPanel(arg_11_0._tf)
end

function var_0_0.Hide(arg_12_0)
	var_0_0.super.Hide(arg_12_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_12_0._tf, arg_12_0._parentTf)
end

return var_0_0
