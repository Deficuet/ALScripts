local var_0_0 = class("WorldMediaCollectionScene", require("view.base.BaseUI"))

var_0_0.PAGE_MEMORTY = 1
var_0_0.PAGE_FILE = 2
var_0_0.PAGE_RECORD = 3
var_0_0.PAGE_ALBUM = 4
var_0_0.PAGE_SHIP = 5

function var_0_0.getUIName(arg_1_0)
	return "WorldMediaCollectionUI"
end

function var_0_0.getBGM(arg_2_0)
	local var_2_0 = arg_2_0.contextData.revertBgm

	arg_2_0.contextData.revertBgm = nil

	if var_2_0 then
		return var_2_0
	else
		return var_0_0.super.getBGM(arg_2_0)
	end
end

function var_0_0.getResource(arg_3_0, arg_3_1)
	local var_3_0 = {
		"ui/worldmediacollectionui",
		"ui/worldmediacollectionmemoryui_atlas",
		"ui/worldmediacollectionfileui_atlas",
		"ui/worldmediacollectionfiledetailui_atlas",
		"ui/worldmediacollectionrecordui_atlas",
		"memoryicon/memory_dashijie"
	}

	local function var_3_1()
		local var_4_0 = {}
		local var_4_1 = pg.memory_storyline.all
		local var_4_2 = pg.memory_group.all

		for iter_4_0, iter_4_1 in ipairs(var_4_1) do
			local var_4_3 = pg.memory_storyline[iter_4_1].icon

			if var_4_3 ~= "" then
				table.insert(var_4_0, "memorystoryline/" .. var_4_3)
			end
		end

		for iter_4_2, iter_4_3 in ipairs(var_4_2) do
			local var_4_4 = pg.memory_group[iter_4_3].icon

			if var_4_4 ~= "" then
				table.insert(var_4_0, "memoryicon/" .. var_4_4)
			end
		end

		return ResPathSupport.UniqueLuaArr(var_4_0)
	end

	local function var_3_2()
		local var_5_0 = {}

		_.each(pg.world_collection_file_group.all, function(arg_6_0)
			local var_6_0 = pg.world_collection_file_group[arg_6_0].name_abbreviate

			if var_6_0 then
				table.insert(var_5_0, "CollectionFileTitle/" .. var_6_0)
			end
		end)
		_.each(pg.world_collection_file_template.all, function(arg_7_0)
			local var_7_0 = pg.world_collection_file_template[arg_7_0].pic

			if var_7_0 then
				table.insert(var_5_0, "CollectionFileIllustration/" .. var_7_0)
			end
		end)

		return var_5_0
	end

	local function var_3_3()
		local var_8_0 = {}

		_.each(pg.memory_template.all, function(arg_9_0)
			local var_9_0 = pg.memory_template[arg_9_0].icon

			if var_9_0 then
				table.insert(var_8_0, "memoryicon/" .. var_9_0)
			end
		end)

		return ResPathSupport.UniqueLuaArr(var_8_0)
	end

	local function var_3_4()
		local var_10_0 = {}

		_.each(pg.memory_group.all, function(arg_11_0)
			local var_11_0 = pg.memory_group[arg_11_0]

			if var_11_0 and var_11_0.type == 3 and var_11_0.ship_group and var_11_0.ship_group ~= 0 then
				local var_11_1 = ShipGroup.getDefaultShipConfig(var_11_0.ship_group)
				local var_11_2 = var_11_1 and pg.ship_skin_template[var_11_1.skin_id]
				local var_11_3 = var_11_2 and var_11_2.painting

				if noEmptyStr(var_11_3) then
					table.insertto(var_10_0, ResPathSupport.GetPaintingListByPaintingName(var_11_3))
				end
			end
		end)

		return ResPathSupport.UniqueLuaArr(var_10_0)
	end

	local function var_3_5()
		local var_12_0 = {}

		for iter_12_0, iter_12_1 in ipairs(pg.activity_medal_group.all) do
			local var_12_1 = pg.activity_medal_group[iter_12_1]

			if var_12_1 and var_12_1.entrance_picture and var_12_1.entrance_picture ~= "" then
				table.insert(var_12_0, var_12_1.entrance_picture)
			end

			for iter_12_2, iter_12_3 in ipairs(pg.activity_medal_template.get_id_list_by_group[iter_12_1] or {}) do
				table.insert(var_12_0, "activitymedal/" .. iter_12_3)
				table.insert(var_12_0, "activitymedal/" .. iter_12_3 .. "_l")
			end
		end

		return ResPathSupport.UniqueLuaArr(var_12_0)
	end

	local function var_3_6()
		local var_13_0 = {}
		local var_13_1 = {}
		local var_13_2 = {}

		for iter_13_0, iter_13_1 in ipairs(pg.lover_character_template.all) do
			local var_13_3 = pg.lover_character_template[iter_13_1]
			local var_13_4 = var_13_3.exp_up
			local var_13_5 = var_13_3.exp_upper_limit

			if var_13_4 and var_13_4 > 0 and var_13_5 and var_13_5 > 0 then
				local var_13_6 = math.floor(var_13_5 / var_13_4)
				local var_13_7 = math.floor((var_13_6 - 1) / 10) + 1

				for iter_13_2 = 1, var_13_7 do
					table.insert(var_13_0, "lovelettermedal/default_" .. iter_13_2)
				end
			end
		end

		for iter_13_3, iter_13_4 in ipairs(getProxy(LoveLetterProxy):GetDisplayGroupList()) do
			table.insertto(var_13_1, ResPathSupport.GetPaintingShipYardIconListByPaintingName(iter_13_4:getPainting()))
			table.insert(var_13_2, string.format(ResPathSupport.ConstPath.BG.ShipCard, iter_13_4:rarity2bgPrint()))
		end

		return ResPathSupport.MergeLuaArr(var_13_1, var_13_0, var_13_2)
	end

	return ResPathSupport.UniqueLuaArr(ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_3_0, arg_3_1), var_3_0, var_3_1(), var_3_2(), var_3_3(), var_3_4(), var_3_6(), var_3_5()))
end

function var_0_0.init(arg_14_0)
	arg_14_0.top = arg_14_0._tf:Find("Top")
	arg_14_0.viewContainer = arg_14_0._tf:Find("Main")
	arg_14_0.subViews = {}

	arg_14_0:OverlayPanel(arg_14_0.top)
end

local var_0_1 = {
	import(".WorldMediaCollectionMemoryLayer"),
	import(".WorldMediaCollectionRecordLayer"),
	import(".WorldMediaCollectionFileLayer"),
	import(".WorldMediaCollectionAlbumLayer"),
	import(".NewWorldMediaCollectionMemoryLayer")
}

function var_0_0.GetCurrentPage(arg_15_0)
	return arg_15_0.contextData.page and arg_15_0.subViews[arg_15_0.contextData.page]
end

function var_0_0.didEnter(arg_16_0)
	onButton(arg_16_0, arg_16_0.top:Find("blur_panel/adapt/top/option"), function()
		arg_16_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.top:Find("blur_panel/adapt/top/back_btn"), function()
		arg_16_0:Backward()
	end, SFX_UI_CANCEL)

	local var_16_0 = arg_16_0.contextData.page or var_0_0.PAGE_MEMORTY

	arg_16_0.contextData.page = nil

	arg_16_0:EnterPage(var_16_0)
	arg_16_0:UpdateView()
end

function var_0_0.EnterPage(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1 == arg_19_0.contextData.page
	local var_19_1 = arg_19_0.subViews[arg_19_1]

	if not var_19_1 then
		local var_19_2 = var_0_1[arg_19_1]

		if not var_19_2 then
			return
		end

		arg_19_0.contextData[var_19_2] = arg_19_0.contextData[var_19_2] or {}
		var_19_1 = var_19_2.New(arg_19_0, arg_19_0.viewContainer, arg_19_0.event, arg_19_0.contextData)

		var_19_1:RegisterView(arg_19_0)
		var_19_1:Load()
	end

	if arg_19_0.contextData.page and arg_19_0.subViews[arg_19_0.contextData.page] and not var_19_0 then
		arg_19_0.subViews[arg_19_0.contextData.page].buffer:OnDeselected()
	end

	arg_19_0.contextData.page = arg_19_1
	arg_19_0.subViews[arg_19_1] = var_19_1

	if not var_19_0 then
		var_19_1.buffer:OnSelected()
	else
		var_19_1.buffer:OnReselected()
	end
end

function var_0_0.WarpToRecord(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	arg_20_0.contextData.recordGroup = arg_20_1
	arg_20_0.contextData.storyNodeID = arg_20_3

	arg_20_0:EnterPage(var_0_0.PAGE_FILE)
end

function var_0_0.WarpToStoryNode(arg_21_0, arg_21_1)
	arg_21_0:EnterPage(var_0_0.PAGE_MEMORTY)
	arg_21_0.subViews[var_0_0.PAGE_MEMORTY]:WrapToStoryLine(arg_21_1)
end

function var_0_0.Backward(arg_22_0)
	local var_22_0 = arg_22_0.subViews[arg_22_0.contextData.page]
	local var_22_1 = var_22_0 and var_22_0:OnBackward()

	if var_22_1 then
		return var_22_1
	end

	arg_22_0:closeView()
end

function var_0_0.onBackPressed(arg_23_0)
	arg_23_0:Backward()
end

function var_0_0.WorldRecordLock()
	local function var_24_0()
		local var_25_0 = getProxy(PlayerProxy):getRawData().level

		return pg.SystemOpenMgr.GetInstance():isOpenSystem(var_25_0, "WorldMediaCollectionRecordMediator")
	end

	return LOCK_WORLD_COLLECTION or not var_24_0()
end

function var_0_0.UpdateView(arg_26_0)
	local var_26_0 = arg_26_0.subViews[arg_26_0.contextData.page]

	if not var_26_0 then
		return
	end

	var_26_0.buffer:UpdateView()
end

function var_0_0.willExit(arg_27_0)
	local var_27_0 = arg_27_0:GetCurrentPage()

	if var_27_0 then
		var_27_0.buffer:Hide()
	end

	for iter_27_0, iter_27_1 in pairs(arg_27_0.subViews) do
		iter_27_1:Destroy()
	end

	table.clear(arg_27_0.subViews)
	arg_27_0:UnOverlayPanel(arg_27_0.top, arg_27_0._tf)
end

return var_0_0
