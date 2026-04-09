local var_0_0 = class("IslandCheaterTavernFinishPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCheaterTavernFinishUI"
end

function var_0_0.NeedCache(arg_2_0)
	return false
end

function var_0_0.OnLoaded(arg_3_0)
	onButton(arg_3_0, arg_3_0.uiquitBtn, function()
		arg_3_0:Hide()
		arg_3_0:emit(CheaterTavernEvent.FINSH_PAGE_QUIT)
	end)
	onButton(arg_3_0, arg_3_0.conninueBtn, function()
		arg_3_0:Hide()
	end)
	setText(arg_3_0.quitText, i18n("bar_ui_end1"))
	setText(arg_3_0.continueText, i18n("bar_ui_end2"))
	setText(arg_3_0.uiPtNameText, i18n("bar_ui_game3"))
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddListener(GAME.ISLAND_CHEATER_REAL_END_NOTIFY, arg_6_0.OnGameEndNotify)
end

function var_0_0.RemoveListeners(arg_7_0)
	arg_7_0:RemoveListener(GAME.ISLAND_CHEATER_REAL_END_NOTIFY, arg_7_0.OnGameEndNotify)
end

function var_0_0.OnInit(arg_8_0)
	arg_8_0.animation = arg_8_0.uirightAdapt:GetComponent(typeof(Animation))
end

function var_0_0.OnGameEndNotify(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0:GetIsland():GetCheaterTavernAgency():GetMainPlayer().id

	if arg_9_1.win_user == var_9_0 then
		return
	end

	arg_9_0:RefreshUI(IslandCheaterTavernConst.SettlementType.ByFinal)
end

function var_0_0.RefreshUI(arg_10_0, arg_10_1)
	IslandCheaterTavernRecordTools.RecordResult(arg_10_1 == IslandCheaterTavernConst.SettlementType.ByScore and IslandCheaterTavernRecordTools.LOST or IslandCheaterTavernRecordTools.WIN)

	arg_10_0.cheaterTavernAgency = arg_10_0:GetIsland():GetCheaterTavernAgency()

	local var_10_0 = arg_10_0.cheaterTavernAgency:GetMainPlayer()
	local var_10_1 = var_10_0:GetRank()
	local var_10_2 = var_10_0:GetAddScore()

	setActive(arg_10_0.uiSus, var_10_1 == 1)
	setActive(arg_10_0.uiFail, var_10_1 ~= 1)
	setText(arg_10_0.uiWinNameText, var_10_0:GetName())
	setActive(arg_10_0.conninueBtn, var_10_1 ~= 1)

	local var_10_3 = PlayRoomTools.GetPtScoreIcon(PlayRoomTools.GetGameTypeID())

	GetImageSpriteFromAtlasAsync("Island/IslandCheaterTavernIcon/" .. var_10_3, "", arg_10_0.uiPtIcon)

	local var_10_4 = PlayRoomTools.GetPtScrore(PlayRoomTools.GetGameTypeID())

	setText(arg_10_0.uiPtText, var_10_4)
	setActive(arg_10_0.uiScore, getProxy(PlayRoomProxy):GetRoomData().roomType == PlayRoomConst.PLAY_ROOM_TYPE.MATCH)

	local var_10_5 = var_10_2 >= 0 and "+" or ""

	setText(arg_10_0.uiPtAddText, var_10_5 .. var_10_2)

	if var_10_1 == 1 then
		arg_10_0.animation:Play("Anim_IslandCheaterTavernFinishUI_win")
	else
		arg_10_0.animation:Play("Anim_IslandCheaterTavernFinishUI_los")
	end

	if arg_10_1 == IslandCheaterTavernConst.SettlementType.ByFinal then
		setActive(arg_10_0.conninueBtn, false)
	end
end

function var_0_0.Show(arg_11_0, arg_11_1)
	var_0_0.super.Show(arg_11_0)
	arg_11_0:RefreshUI(arg_11_1)
end

function var_0_0.OnDestroy(arg_12_0)
	var_0_0.super.OnDestroy(arg_12_0)
end

function var_0_0.OnHide(arg_13_0)
	return
end

return var_0_0
