local var_0_0 = class("IslandAchievementPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandAchievementUI"
end

function var_0_0.OnLoaded(arg_2_0)
	setText(arg_2_0._tf:Find("top/title/Text"), i18n("island_achievement_title"))
	setText(arg_2_0._tf:Find("top/total/Text"), i18n("island_achv_total"))

	arg_2_0.totalTF = arg_2_0._tf:Find("top/total/value")

	local var_2_0 = arg_2_0._tf:Find("view/content")

	arg_2_0.uiList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("top/back"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0.uiList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventInit then
			arg_3_0:InitItem(arg_5_1, arg_5_2)
		elseif arg_5_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateItem(arg_5_1, arg_5_2)
		end
	end)

	arg_3_0.typeIds = pg.island_achievement_group.all
end

function var_0_0.OnShow(arg_6_0)
	arg_6_0:Flush()
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddListener(GAME.ISLAND_GET_ACHV_AWARD_DONE, arg_7_0.Flush)
end

function var_0_0.RemoveListeners(arg_8_0)
	arg_8_0:RemoveListener(GAME.ISLAND_GET_ACHV_AWARD_DONE, arg_8_0.Flush)
end

function var_0_0.Flush(arg_9_0)
	arg_9_0.achvAgency = getProxy(IslandProxy):GetIsland():GetAchievementAgency()

	setText(arg_9_0.totalTF, #arg_9_0.achvAgency:GetGotList() .. "/" .. arg_9_0.achvAgency:GetTotalCnt())
	arg_9_0.uiList:align(#arg_9_0.typeIds)
end

function var_0_0.InitItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.typeIds[arg_10_1 + 1]

	arg_10_2.name = var_10_0

	local var_10_1 = pg.island_achievement_group[var_10_0]

	LoadImageSpriteAtlasAsync("islandachievement", var_10_1.icon, arg_10_2:Find("icon"), true)
	setText(arg_10_2:Find("name"), var_10_1.name)
	onButton(arg_10_0, arg_10_2, function()
		arg_10_0:OpenPage(IslandAchvDetailPage, var_10_0)
	end, SFX_PANEL)
end

function var_0_0.UpdateItem(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.typeIds[arg_12_1 + 1]
	local var_12_1 = pg.island_achievement_group[var_12_0].achievement_list
	local var_12_2 = {}

	for iter_12_0, iter_12_1 in ipairs(var_12_1) do
		local var_12_3 = arg_12_0.achvAgency:GetGroup(iter_12_1)

		for iter_12_2, iter_12_3 in ipairs(var_12_3:GetSortAchvList()) do
			table.insert(var_12_2, iter_12_3)
		end
	end

	local var_12_4 = underscore.reduce(var_12_2, 0, function(arg_13_0, arg_13_1)
		return arg_13_0 + (arg_13_1:GetStatus() == IslandAchievement.STATUS.GOT and 1 or 0)
	end)
	local var_12_5 = underscore.reduce(var_12_2, 0, function(arg_14_0, arg_14_1)
		return arg_14_0 + (arg_14_1:IsHideType() and 0 or 1)
	end)

	setText(arg_12_2:Find("progress/cur"), var_12_4)
	setText(arg_12_2:Find("progress/all"), "/" .. var_12_5)

	arg_12_2:Find("bar"):GetComponent(typeof(Image)).fillAmount = var_12_4 / var_12_5

	local var_12_6 = var_12_4 == var_12_5

	setActive(arg_12_2:Find("bg"), not var_12_6)
	setActive(arg_12_2:Find("bg_all"), var_12_6)

	local var_12_7 = underscore.any(var_12_2, function(arg_15_0)
		return arg_15_0:GetStatus() == IslandAchievement.STATUS.GET
	end)

	setActive(arg_12_2:Find("name/tip"), var_12_7)
end

return var_0_0
