local var_0_0 = class("CardPuzzleCardDetailLayer", BaseUI)

function var_0_0.getUIName(arg_1_0)
	return "CardTowerCardDetailUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.cardView = CardPuzzleCardView.New(arg_2_0:findTF("CardTowerCard"))
	arg_2_0.keywordList = arg_2_0:findTF("KeywordList")
end

local var_0_1 = {
	168,
	220
}

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0:findTF("BG"), function()
		arg_3_0:closeView()
	end, SFX_CANCEL)
	arg_3_0.cardView:SetData(arg_3_0.contextData.cardData)
	arg_3_0.cardView:UpdateView()
	setAnchoredPosition(arg_3_0.keywordList, {
		x = var_0_1[showPreview and 2 or 1]
	})

	local var_3_0 = _.filter(arg_3_0.contextData.cardData:GetKeywords(), function(arg_5_0)
		return arg_5_0.affix_type == CardPuzzleCardView.AFFIX_TYPE.SCHOOL or arg_5_0.affix_type == CardPuzzleCardView.AFFIX_TYPE.AFFIX and arg_5_0.show == 0
	end)

	UIItemList.StaticAlign(arg_3_0.keywordList, arg_3_0.keywordList:GetChild(0), #var_3_0, function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_6_0 = var_3_0[arg_6_1 + 1]
		local var_6_1 = arg_6_2

		setText(var_6_1:Find("Title"), var_6_0.name)
		setText(var_6_1:Find("Text"), var_6_0.discript)
		setText(var_6_1:Find("Title/EN"), var_6_0.name_EN)
	end)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.willExit(arg_7_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_7_0._tf)
end

return var_0_0
