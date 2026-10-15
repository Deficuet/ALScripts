local var_0_0 = class("FormationSuggestionScene", import("view.base.BaseUI"))

var_0_0.OPEN_SHIP_INFO = "FormationSuggestionScene::OPEN_SHIP_INFO"
var_0_0.SUGGESTION_TYPE = {
	PRO = 2,
	SUBMARINE = 3,
	NORMAL = 1
}

function var_0_0.getUIName(arg_1_0)
	return "FormationSuggestionUI"
end

function var_0_0.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiBackBtn, function()
		if not isActive(arg_2_0.uiTeamGo) then
			arg_2_0:emit(FormationSuggestionMediator.ON_CLOSE_SHIP_INFO)
		else
			arg_2_0:closeView()
		end
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiPrevBtn, function()
		if arg_2_0.selectedIndex > 1 then
			arg_2_0.uiList:SwitchToPage(arg_2_0.selectedIndex - 1)

			for iter_4_0, iter_4_1 in pairs(arg_2_0.uiList:GetItemList()) do
				iter_4_1:OnPlayAnimation()
			end
		end
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiNextBtn, function()
		if arg_2_0.selectedIndex < #arg_2_0.mapIDList then
			arg_2_0.uiList:SwitchToPage(arg_2_0.selectedIndex + 1)

			for iter_5_0, iter_5_1 in pairs(arg_2_0.uiList:GetItemList()) do
				iter_5_1:OnPlayAnimation()
			end
		end
	end, SFX_PANEL)
	onToggle(arg_2_0, arg_2_0.uiToggle1, function(arg_6_0)
		if arg_6_0 and arg_2_0.isInitOver then
			arg_2_0:OnSwitchToggle(var_0_0.SUGGESTION_TYPE.NORMAL)
			arg_2_0:emit(FormationSuggestionMediator.ON_CLOSE_SHIP_INFO)
		end
	end, SFX_PANEL)
	onToggle(arg_2_0, arg_2_0.uiToggle2, function(arg_7_0)
		if arg_7_0 and arg_2_0.isInitOver then
			arg_2_0:OnSwitchToggle(var_0_0.SUGGESTION_TYPE.PRO)
			arg_2_0:emit(FormationSuggestionMediator.ON_CLOSE_SHIP_INFO)
		end
	end, SFX_PANEL)
	onToggle(arg_2_0, arg_2_0.uiToggle3, function(arg_8_0)
		if arg_8_0 and arg_2_0.isInitOver then
			arg_2_0:OnSwitchToggle(var_0_0.SUGGESTION_TYPE.SUBMARINE)
			arg_2_0:emit(FormationSuggestionMediator.ON_CLOSE_SHIP_INFO)
		end
	end, SFX_PANEL)
	onToggle(arg_2_0, arg_2_0.uiNormalToggle, function(arg_9_0)
		if arg_9_0 then
			arg_2_0:OnSwitchHardMod(not arg_9_0)
		end
	end)
	onToggle(arg_2_0, arg_2_0.uiHardToggle, function(arg_10_0)
		if arg_10_0 then
			arg_2_0:OnSwitchHardMod(arg_10_0)
		end
	end)

	arg_2_0.uiList = LuaList.New(arg_2_0, handler(arg_2_0, arg_2_0.IndexItem), arg_2_0.uiListTf, FormationSuggestionTeamItem)

	arg_2_0.uiList:SetPageChangeHandler(handler(arg_2_0, arg_2_0.OnPageChanged))
	arg_2_0.uiList:SetItemRecycleHandler(handler(arg_2_0, arg_2_0.OnScrollHideItem))
	setText(arg_2_0.uiTipsText, i18n("formation_suggestion_tip"))
	setText(arg_2_0.uiFleetTitleText, i18n("formation_suggestion_tip_title"))
	setText(arg_2_0.uiNormalText1, i18n("word_normal_junhe"))
	setText(arg_2_0.uiNormalText2, i18n("word_normal_junhe"))
	setText(arg_2_0.uiHardText1, i18n("word_hard"))
	setText(arg_2_0.uiHardText1, i18n("word_hard"))
	setText(arg_2_0.uiPrevText, i18n("formation_suggestion_prev_chapter"))
	setText(arg_2_0.uiNextText, i18n("formation_suggestion_next_chapter"))
end

function var_0_0.didEnter(arg_11_0)
	arg_11_0:OverlayPanel(tf(arg_11_0.uiTeamGo), {
		pbList = {
			arg_11_0.uiBlurTf
		}
	})

	arg_11_0.selectedType = arg_11_0.contextData.selectedType or var_0_0.SUGGESTION_TYPE.NORMAL

	local var_11_0 = arg_11_0.contextData.mapID or LevelTools.GetMaxFormationSuggestionID()

	arg_11_0.mapIDList = LevelTools.GetSuggestionMapIDList(var_11_0)
	arg_11_0.selectedIndex = arg_11_0:GetMapIndex(arg_11_0.mapIDList, var_11_0)
	arg_11_0.contextData.mapID = arg_11_0.mapIDList[arg_11_0.selectedIndex]

	if arg_11_0.selectedType == var_0_0.SUGGESTION_TYPE.NORMAL then
		triggerToggle(arg_11_0.uiToggle1, true)
	elseif arg_11_0.selectedType == var_0_0.SUGGESTION_TYPE.PRO then
		triggerToggle(arg_11_0.uiToggle2, true)
	elseif arg_11_0.selectedType == var_0_0.SUGGESTION_TYPE.SUBMARINE then
		triggerToggle(arg_11_0.uiToggle3, true)
	end

	arg_11_0.eventIDList = {
		arg_11_0:bind(var_0_0.OPEN_SHIP_INFO, handler(arg_11_0, arg_11_0.OnClickShipCard))
	}

	setActive(arg_11_0.uiDifficultyGo, LevelTools.HasUnlockSuggestionHardMap())

	local var_11_1 = pg.expedition_data_by_map[arg_11_0.contextData.mapID]

	arg_11_0.contextData.mapID = var_11_1.bind_map

	if var_11_1.type == 1 then
		triggerToggle(arg_11_0.uiNormalToggle, true)
	else
		triggerToggle(arg_11_0.uiHardToggle, true)
	end

	arg_11_0.isInitOver = true
end

function var_0_0.RefreshText(arg_12_0)
	local var_12_0 = pg.chapter_suggestion_formation[pg.chapter_suggestion_formation.get_id_list_by_chapter[arg_12_0.mapIDList[arg_12_0.selectedIndex]][arg_12_0.selectedType]]

	setText(arg_12_0.uiTitleText, var_12_0.page_title)
	setScrollText(arg_12_0.uiFleetTipsText, var_12_0.describe)
	setGray(arg_12_0.uiPrevBtn, arg_12_0.selectedIndex == 1)
	setGray(arg_12_0.uiNextBtn, arg_12_0.selectedIndex == #arg_12_0.mapIDList)
	arg_12_0:emit(FormationSuggestionTeamItem.ON_REFRESH_CARD_ITEM, var_12_0.id)
end

function var_0_0.OnSwitchToggle(arg_13_0, arg_13_1)
	arg_13_0.selectedType = arg_13_1
	arg_13_0.contextData.selectedType = arg_13_1

	arg_13_0:RefreshUI()
end

function var_0_0.OnSwitchHardMod(arg_14_0, arg_14_1)
	if arg_14_0.selectedHard == arg_14_1 then
		return
	end

	arg_14_0.selectedHard = arg_14_1

	local var_14_0 = arg_14_0.contextData.mapID
	local var_14_1 = pg.expedition_data_by_map[var_14_0].bind_map

	arg_14_0.mapIDList = LevelTools.GetSuggestionMapIDList(var_14_1)
	arg_14_0.selectedIndex = arg_14_0:GetMapIndex(arg_14_0.mapIDList, var_14_1)
	arg_14_0.contextData.mapID = var_14_1

	arg_14_0:RefreshText()
	arg_14_0.uiList:StartScroll(#arg_14_0.mapIDList, arg_14_0.selectedIndex, true)
	arg_14_0.uiList:Refresh()
end

function var_0_0.RefreshUI(arg_15_0)
	arg_15_0:RefreshText()
	arg_15_0.uiList:Refresh()
end

function var_0_0.GetMapIndex(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = 1

	for iter_16_0 = 2, #arg_16_1 do
		if arg_16_2 < arg_16_1[iter_16_0] then
			return var_16_0
		else
			var_16_0 = iter_16_0
		end
	end

	return var_16_0
end

function var_0_0.IndexItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.mapIDList[arg_17_1]
	local var_17_1 = pg.chapter_suggestion_formation.get_id_list_by_chapter[var_17_0][arg_17_0.selectedType]

	arg_17_2:SetID(var_17_1)
end

function var_0_0.OnPageChanged(arg_18_0, arg_18_1)
	arg_18_0.selectedIndex = arg_18_1
	arg_18_0.contextData.mapID = arg_18_0.mapIDList[arg_18_0.selectedIndex]

	arg_18_0:RefreshText()
end

function var_0_0.OnScrollHideItem(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0:emit(FormationSuggestionTeamItem.ON_HIDE_CARD_ITEM, arg_19_2)
end

function var_0_0.OnClickShipCard(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
		viewComponent = FormationSuggestionShipInfoScene,
		mediator = FormationSuggestionShipInfoMediator,
		data = {
			id = arg_20_2
		}
	}))
end

function var_0_0.OnOpenShipInfo(arg_21_0)
	setActive(arg_21_0.uiTeamGo, false)
	setActive(arg_21_0.uiDifficultyGo, false)
end

function var_0_0.OnCloseShipInfo(arg_22_0)
	setActive(arg_22_0.uiTeamGo, true)
	arg_22_0.uiList:StartScroll(#arg_22_0.mapIDList, arg_22_0.selectedIndex, true)
	setActive(arg_22_0.uiDifficultyGo, (LevelTools.HasUnlockSuggestionHardMap()))
end

function var_0_0.willExit(arg_23_0)
	arg_23_0:UnOverlayPanel(tf(arg_23_0.uiTeamGo), arg_23_0._tf)

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.eventIDList) do
		arg_23_0:disconnect(iter_23_1)
	end

	arg_23_0.eventIDList = nil

	arg_23_0.uiList:Dispose()

	arg_23_0.uiList = nil
end

return var_0_0
