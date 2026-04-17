local var_0_0 = class("IslandCheaterTavernStartGameView", import(".IslandCheaterTavernBaseView"))

function var_0_0.Show(arg_1_0)
	arg_1_0.startCardList = pg.gameset.bar_card.description

	arg_1_0.cardItemList:align(#arg_1_0.startCardList)

	if not arg_1_0.cheaterTavernAgency:GetMainPlayer():IsOut() then
		IslandCheaterTavernRecordTools.AddTurnCnt()
	end
end

function var_0_0.Init(arg_2_0)
	arg_2_0.uiParent_ = arg_2_0._tf.parent

	arg_2_0.super.Init(arg_2_0)

	arg_2_0.cardItemList = UIItemList.New(arg_2_0.uiStartGameItemList, arg_2_0.uiStartGameItem)

	arg_2_0.cardItemList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			arg_2_0:OnUpdateItem(arg_3_1, arg_3_2)
		end
	end)
end

function var_0_0.OnCheaterEveryRoundStart(arg_4_0)
	arg_4_0:SetActiveState(true)
	arg_4_0:Show()
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
end

function var_0_0.OnCheaterEveryRoundStartDone(arg_5_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_5_0._tf, arg_5_0.uiParent_)
	arg_5_0:SetActiveState(false)
end

function var_0_0.OnUpdateItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = tf(arg_6_2)
	local var_6_1 = arg_6_1 + 1
	local var_6_2 = arg_6_0.startCardList[var_6_1]
	local var_6_3 = var_6_2[1]
	local var_6_4 = pg.bar_card[var_6_3]
	local var_6_5 = var_6_2[2]

	GetImageSpriteFromAtlasAsync("Island/IslandCheaterTavernIcon/" .. var_6_4.card_res, "", var_6_0:Find("cardImage"))
	setText(var_6_0:Find("numBg/numText"), "x" .. var_6_5)

	local var_6_6 = arg_6_0.cheaterTavernAgency:GetRealCard()

	setActive(var_6_0:Find("selected"), var_6_6 == var_6_3)
end

function var_0_0.OnInit(arg_7_0)
	return
end

function var_0_0.OnHide(arg_8_0)
	if arg_8_0._tf.parent ~= arg_8_0.uiParent_ then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_8_0._tf, arg_8_0.uiParent_)
	end
end

return var_0_0
