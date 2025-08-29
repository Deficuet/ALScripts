local var_0_0 = class("IslandAchvDetailPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandAchvDetailUI"
end

function var_0_0.OnLoaded(arg_2_0)
	setText(arg_2_0._tf:Find("top/title/Text"), i18n("island_achievement_title"))
	setText(arg_2_0._tf:Find("top/total/Text"), i18n("island_achv_total"))

	arg_2_0.totalTF = arg_2_0._tf:Find("top/total/value")

	local var_2_0 = arg_2_0._tf:Find("toggles/content")

	arg_2_0.typeUIList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	local var_2_1 = arg_2_0._tf:Find("view/content")

	arg_2_0.itemUIList = UIItemList.New(var_2_1, var_2_1:Find("tpl"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("top/back"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0.typeUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventInit then
			arg_3_0:InitToggle(arg_5_1, arg_5_2)
		elseif arg_5_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateToggle(arg_5_1, arg_5_2)
		end
	end)

	arg_3_0.typeIds = pg.island_achievement_group.all

	arg_3_0.itemUIList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateItem(arg_6_1, arg_6_2)
		end
	end)
end

function var_0_0.InitToggle(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.typeIds[arg_7_1 + 1]

	arg_7_2.name = var_7_0

	local var_7_1 = pg.island_achievement_group[var_7_0]

	LoadImageSpriteAtlasAsync("island/islandachievement", var_7_1.icon, arg_7_2:Find("icon"), true)
	setText(arg_7_2:Find("name"), var_7_1.name)
	onToggle(arg_7_0, arg_7_2, function(arg_8_0)
		if arg_8_0 then
			arg_7_0.showType = var_7_0

			arg_7_0:FlushDetail()
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateToggle(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.typeIds[arg_9_1 + 1]
	local var_9_1 = pg.island_achievement_group[var_9_0].achievement_list
	local var_9_2 = {}

	for iter_9_0, iter_9_1 in ipairs(var_9_1) do
		local var_9_3 = arg_9_0.achvAgency:GetGroup(iter_9_1)

		for iter_9_2, iter_9_3 in ipairs(var_9_3:GetSortAchvList()) do
			table.insert(var_9_2, iter_9_3)
		end
	end

	local var_9_4 = underscore.any(var_9_2, function(arg_10_0)
		return arg_10_0:GetStatus() == IslandAchievement.STATUS.GET
	end)

	setActive(arg_9_2:Find("name/tip"), var_9_4)

	local var_9_5 = underscore.all(var_9_2, function(arg_11_0)
		return arg_11_0:GetStatus() == IslandAchievement.STATUS.GOT
	end)

	setActive(arg_9_2:Find("bg"), not var_9_5)
	setActive(arg_9_2:Find("bg_all"), var_9_5)
end

function var_0_0.AddListeners(arg_12_0)
	arg_12_0:AddListener(GAME.ISLAND_GET_ACHV_AWARD_DONE, arg_12_0.Flush)
end

function var_0_0.RemoveListeners(arg_13_0)
	arg_13_0:RemoveListener(GAME.ISLAND_GET_ACHV_AWARD_DONE, arg_13_0.Flush)
end

function var_0_0.OnShow(arg_14_0, arg_14_1)
	arg_14_0.showType = arg_14_1

	arg_14_0:Flush()
end

function var_0_0.Flush(arg_15_0)
	arg_15_0.achvAgency = getProxy(IslandProxy):GetIsland():GetAchievementAgency()

	setText(arg_15_0.totalTF, #arg_15_0.achvAgency:GetGotList() .. "/" .. arg_15_0.achvAgency:GetTotalCnt())
	arg_15_0.typeUIList:align(#arg_15_0.typeIds)
	triggerToggle(arg_15_0.typeUIList.container:Find(tostring(arg_15_0.showType)), true)
end

function var_0_0.FlushDetail(arg_16_0)
	arg_16_0.showGroupIds = pg.island_achievement_group[arg_16_0.showType].achievement_list
	arg_16_0.showAchvList = underscore.map(arg_16_0.showGroupIds, function(arg_17_0)
		local var_17_0 = arg_16_0.achvAgency:GetGroup(arg_17_0):GetSortAchvList()
		local var_17_1 = underscore.select(var_17_0, function(arg_18_0)
			return not arg_18_0:IsHideType() or arg_18_0:GetStatus() == IslandAchievement.STATUS.GET
		end)

		return underscore.detect(var_17_1, function(arg_19_0)
			return arg_19_0:GetStatus() ~= IslandAchievement.STATUS.GOT
		end) or var_17_1[#var_17_1]
	end)

	table.sort(arg_16_0.showAchvList, CompareFuncs({
		function(arg_20_0)
			return arg_20_0:GetStatus() == IslandAchievement.STATUS.GET and 0 or 1
		end,
		function(arg_21_0)
			return arg_21_0:GetStatus() == IslandAchievement.STATUS.GOT and 1 or 0
		end,
		function(arg_22_0)
			return arg_22_0.id
		end
	}))
	arg_16_0.itemUIList:align(#arg_16_0.showAchvList)
end

function var_0_0.UpdateItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.showAchvList[arg_23_1 + 1]

	arg_23_2.name = var_23_0.id

	setText(arg_23_2:Find("name"), var_23_0:getConfig("name"))
	setText(arg_23_2:Find("desc"), var_23_0:getConfig("desc"))

	local var_23_1 = var_23_0:GetAwards()

	UIItemList.StaticAlign(arg_23_2:Find("awards"), arg_23_2:Find("awards/tpl"), #var_23_1, function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 == UIItemList.EventUpdate then
			local var_24_0 = var_23_1[arg_24_1 + 1]
			local var_24_1 = var_24_0:getConfigTable().icon

			GetImageSpriteFromAtlasAsync("island/" .. var_24_1, "", arg_24_2:Find("icon"))
			setText(arg_24_2:Find("count"), var_24_0.count)
		end
	end)

	local var_23_2 = var_23_0:GetStatus()

	setActive(arg_23_2:Find("status/got"), var_23_2 == IslandAchievement.STATUS.GOT)

	local var_23_3 = var_23_2 == IslandAchievement.STATUS.GET

	setActive(arg_23_2:Find("status/get"), var_23_3)

	if var_23_3 then
		onButton(arg_23_0, arg_23_2:Find("status/get"), function()
			arg_23_0:emit(IslandMediator.GET_ACHIEVEMENT_AWARD, {
				var_23_0.id
			})
		end, SFX_PANEL)
	else
		removeOnButton(arg_23_2:Find("status/get"))
	end

	local var_23_4 = var_23_2 == IslandAchievement.STATUS.NORMAL

	setActive(arg_23_2:Find("status/go"), var_23_4)

	if var_23_4 then
		local var_23_5 = arg_23_0.achvAgency:GetCurProgress(var_23_0)

		setText(arg_23_2:Find("status/go/Text"), var_23_5 .. "/" .. var_23_0:GetNum())
	end

	local var_23_6 = var_23_0:getConfig("group")
	local var_23_7 = arg_23_0.achvAgency:GetGroup(var_23_6):GetSortAchvList()
	local var_23_8 = underscore.select(var_23_7, function(arg_26_0)
		return not arg_26_0:IsHideType() or arg_26_0:GetStatus() == IslandAchievement.STATUS.GET
	end)

	UIItemList.StaticAlign(arg_23_2:Find("stages"), arg_23_2:Find("stages/tpl"), #var_23_8, function(arg_27_0, arg_27_1, arg_27_2)
		if arg_27_0 == UIItemList.EventUpdate then
			local var_27_0 = arg_27_1 + 1

			GetImageSpriteFromAtlasAsync("ui/islandachievementui_atlas", "stage_" .. var_27_0, arg_27_2:Find("icon"))

			local var_27_1 = var_27_0 == #var_23_8
			local var_27_2 = var_23_8[var_27_0]

			setActive(arg_27_2:Find("line"), not var_27_1)

			local var_27_3 = var_27_2:GetStatus() == IslandAchievement.STATUS.GOT

			setActive(arg_27_2:Find("line/got"), var_27_3)
			setActive(arg_27_2:Find("circle/got"), var_27_3)
		end
	end)
end

return var_0_0
