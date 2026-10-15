local var_0_0 = class("FormationSuggestionTeamItem", import("view.base.BasePanel"))

var_0_0.ON_HIDE_CARD_ITEM = "FormationSuggestionTeamItem:ON_HIDE_CARD_ITEM"
var_0_0.ON_REFRESH_CARD_ITEM = "FormationSuggestionTeamItem:ON_REFRESH_CARD_ITEM"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()

	arg_1_0.eventIDList = {
		arg_1_0:bind(var_0_0.ON_HIDE_CARD_ITEM, handler(arg_1_0, arg_1_0.OnHideCardItem)),
		arg_1_0:bind(var_0_0.ON_REFRESH_CARD_ITEM, handler(arg_1_0, arg_1_0.OnRefreshCardItem))
	}
end

function var_0_0.Init(arg_2_0)
	arg_2_0.mainItemList = {}
	arg_2_0.vanguardItemList = {}

	for iter_2_0 = 1, 3 do
		arg_2_0.mainItemList[iter_2_0] = FormationSuggestionCardItem.New(arg_2_0[string.format("uiMainShipTf%s", iter_2_0)], arg_2_0)
		arg_2_0.vanguardItemList[iter_2_0] = FormationSuggestionCardItem.New(arg_2_0[string.format("uiVanguardShipTf%s", iter_2_0)], arg_2_0)
	end

	arg_2_0.animation = arg_2_0._tf:GetComponent(typeof(Animation))
end

function var_0_0.SetID(arg_3_0, arg_3_1)
	arg_3_0.id = arg_3_1

	local var_3_0 = pg.chapter_suggestion_formation[arg_3_1]

	if var_3_0.type == FormationSuggestionScene.SUGGESTION_TYPE.SUBMARINE then
		setActive(arg_3_0.uiVanguardTopGo, false)
		setText(arg_3_0.uiMainText, i18n("pre_combat_submarine"))

		for iter_3_0, iter_3_1 in ipairs(var_3_0.teamid) do
			arg_3_0.mainItemList[iter_3_0]:SetData(iter_3_1)
		end

		for iter_3_2, iter_3_3 in ipairs(arg_3_0.vanguardItemList) do
			arg_3_0.vanguardItemList[iter_3_2]:SetData(nil)
		end
	else
		setActive(arg_3_0.uiVanguardTopGo, true)
		setText(arg_3_0.uiMainText, i18n("pre_combat_main"))
		setText(arg_3_0.uiVanguardText, i18n("pre_combat_vanguard"))

		for iter_3_4, iter_3_5 in ipairs(var_3_0.teamid) do
			arg_3_0.mainItemList[iter_3_4]:SetData(iter_3_5, iter_3_4)
		end

		for iter_3_6, iter_3_7 in ipairs(var_3_0.teamid1) do
			arg_3_0.vanguardItemList[iter_3_6]:SetData(iter_3_7)
		end
	end
end

function var_0_0.OnHideCardItem(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0._go == arg_4_2 then
		arg_4_0.id = nil
	end
end

function var_0_0.OnRefreshCardItem(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0.id ~= arg_5_2 then
		arg_5_0:OnPlayAnimation()
	end
end

function var_0_0.OnPlayAnimation(arg_6_0)
	arg_6_0.animation:Stop()
	arg_6_0.animation:Play("anim_item_in")
end

function var_0_0.willExit(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.eventIDList) do
		arg_7_0:disconnect(iter_7_1)
	end

	arg_7_0.eventIDList = nil

	for iter_7_2, iter_7_3 in ipairs(arg_7_0.mainItemList) do
		iter_7_3:willExit()
	end

	arg_7_0.mainItemList = nil

	for iter_7_4, iter_7_5 in ipairs(arg_7_0.vanguardItemList) do
		iter_7_5:willExit()
	end

	arg_7_0.vanguardItemList = nil

	arg_7_0:detach()
end

return var_0_0
