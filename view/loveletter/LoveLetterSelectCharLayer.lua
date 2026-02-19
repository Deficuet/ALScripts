local var_0_0 = class("LoveLetterSelectCharLayer", import("..base.BaseUI"))

var_0_0.ON_INDEX = "LoveLetterSelectCharLayer.ON_INDEX"
var_0_0.SELECT_CHAR = "LoveLetterSelectCharLayer.SELECT_CHAR"
var_0_0.TOGGLE_UNDEFINED = -1
var_0_0.TOGGLE_CHAR = 0
var_0_0.TOGGLE_LINK = 1
var_0_0.TOGGLE_BLUEPRINT = 2
var_0_0.ShipIndex = {
	typeIndex = ShipIndexConst.TypeAll,
	campIndex = ShipIndexConst.CampAll,
	rarityIndex = ShipIndexConst.RarityAll
}
var_0_0.ShipIndexData = {
	customPanels = {
		typeIndex = {
			blueSeleted = true,
			mode = CustomIndexLayer.Mode.AND,
			options = ShipIndexConst.TypeIndexs,
			names = ShipIndexConst.TypeNames
		},
		campIndex = {
			blueSeleted = true,
			mode = CustomIndexLayer.Mode.AND,
			options = ShipIndexConst.CampIndexs,
			names = ShipIndexConst.CampNames
		},
		rarityIndex = {
			blueSeleted = true,
			mode = CustomIndexLayer.Mode.AND,
			options = ShipIndexConst.RarityIndexs,
			names = ShipIndexConst.RarityNames
		}
	},
	groupList = {
		{
			dropdown = false,
			titleTxt = "indexsort_index",
			titleENTxt = "indexsort_indexeng",
			tags = {
				"typeIndex"
			}
		},
		{
			dropdown = false,
			titleTxt = "indexsort_camp",
			titleENTxt = "indexsort_campeng",
			tags = {
				"campIndex"
			}
		},
		{
			dropdown = false,
			titleTxt = "indexsort_rarity",
			titleENTxt = "indexsort_rarityeng",
			tags = {
				"rarityIndex"
			}
		}
	}
}

function var_0_0.setShipGroups(arg_1_0, arg_1_1)
	arg_1_0.shipGroups = arg_1_1
end

function var_0_0.setProposeList(arg_2_0, arg_2_1)
	arg_2_0.proposeList = arg_2_1
end

function var_0_0.getUIName(arg_3_0)
	return "LoveLetterGroupChangeUI"
end

function var_0_0.back(arg_4_0)
	if arg_4_0.exited then
		return
	end

	arg_4_0:emit(var_0_0.ON_CLOSE)
end

function var_0_0.init(arg_5_0)
	arg_5_0.topTF = arg_5_0._tf:Find("blur_panel/adapt/top")
	arg_5_0.backBtn = arg_5_0.topTF:Find("back_btn")
	arg_5_0.indexBtn = arg_5_0.topTF:Find("index_button")

	setActive(arg_5_0._tf:Find("list_card/types"), false)

	arg_5_0.cardItems = {}
	arg_5_0.cardList = arg_5_0._tf:Find("list_card/scroll"):GetComponent("LScrollRect")

	function arg_5_0.cardList.onInitItem(arg_6_0)
		arg_5_0:onInitCard(arg_6_0)
	end

	function arg_5_0.cardList.onUpdateItem(arg_7_0, arg_7_1)
		arg_5_0:onUpdateCard(arg_7_0, arg_7_1)
	end

	function arg_5_0.cardList.onReturnItem(arg_8_0, arg_8_1)
		arg_5_0:onReturnCard(arg_8_0, arg_8_1)
	end

	arg_5_0:OverlayPanel(arg_5_0._tf)
end

function var_0_0.didEnter(arg_9_0)
	onButton(arg_9_0, arg_9_0.backBtn, function()
		arg_9_0:back()
	end)
	onButton(arg_9_0, arg_9_0.indexBtn, function()
		local var_11_0 = Clone(var_0_0.ShipIndexData)

		var_11_0.indexDatas = Clone(var_0_0.ShipIndex)

		function var_11_0.callback(arg_12_0)
			var_0_0.ShipIndex.typeIndex = arg_12_0.typeIndex

			if arg_12_0.campIndex then
				var_0_0.ShipIndex.campIndex = arg_12_0.campIndex
			end

			var_0_0.ShipIndex.rarityIndex = arg_12_0.rarityIndex

			arg_9_0:updateCardList()
		end

		arg_9_0:emit(var_0_0.ON_INDEX, var_11_0)
	end)
	arg_9_0:updateCardList()
end

function var_0_0.willExit(arg_13_0)
	arg_13_0:UnOverlayPanel(arg_13_0._tf)
end

local function var_0_1(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_0 == var_0_0.TOGGLE_CHAR and not arg_14_1 then
		return arg_14_2
	elseif arg_14_0 == var_0_0.TOGGLE_LINK and arg_14_1 then
		return arg_14_2 - 10000
	elseif arg_14_0 == var_0_0.TOGGLE_BLUEPRINT then
		return arg_14_2 - 20000
	end

	return -1
end

function var_0_0.updateCardList(arg_15_0)
	local var_15_0 = {}
	local var_15_1 = {}

	for iter_15_0, iter_15_1 in ipairs(pg.lover_character_template.all) do
		local var_15_2 = pg.ship_data_group.get_id_list_by_group_type[iter_15_1]

		assert(not var_15_2 or #var_15_2 == 1)

		if not var_15_2 then
			warning(iter_15_1)
		elseif underscore.any(table.insertto({
			iter_15_1
		}, pg.lover_character_template[iter_15_1].relate_group_id), function(arg_16_0)
			return arg_15_0.shipGroups[arg_16_0]
		end) then
			table.insert(var_15_1, var_15_2[1])
		end
	end

	table.sort(var_15_1)

	if var_0_0.ShipIndex.typeIndex == ShipIndexConst.TypeAll and var_0_0.ShipIndex.rarityIndex == ShipIndexConst.RarityAll and var_0_0.ShipIndex.campIndex == ShipIndexConst.CampAll then
		for iter_15_2, iter_15_3 in ipairs(var_15_1) do
			local var_15_3 = pg.ship_data_group[iter_15_3]
			local var_15_4
			local var_15_5 = false

			if var_15_3 then
				var_15_4 = arg_15_0.shipGroups[var_15_3.group_type] or ShipGroup.New({
					id = var_15_3.group_type
				})
				var_15_5 = Nation.IsLinkType(ShipGroup.getDefaultShipConfig(var_15_3.group_type).nationality)
			end

			local var_15_6 = var_15_3.handbook_type
			local var_15_7 = var_0_1(var_15_6, var_15_5, iter_15_3)

			if var_15_7 ~= -1 then
				var_15_0[iter_15_2] = {
					showTrans = false,
					code = var_15_7,
					group = var_15_4
				}
			end
		end
	else
		for iter_15_4, iter_15_5 in ipairs(var_15_1) do
			local var_15_8 = pg.ship_data_group[iter_15_5]

			if var_15_8 then
				local var_15_9 = ShipGroup.New({
					id = var_15_8.group_type
				})
				local var_15_10 = arg_15_0.shipGroups[var_15_8.group_type]

				if var_15_9 and ShipIndexConst.filterByType(var_15_9, var_0_0.ShipIndex.typeIndex) and ShipIndexConst.filterByRarity(var_15_9, var_0_0.ShipIndex.rarityIndex) then
					local var_15_11 = Nation.IsLinkType(var_15_9:getNation())
					local var_15_12 = var_15_8.handbook_type

					if ShipIndexConst.filterByCamp(var_15_9, var_0_0.ShipIndex.campIndex) then
						var_15_0[#var_15_0 + 1] = {
							showTrans = false,
							code = var_0_1(var_15_12, var_15_11, iter_15_5),
							group = var_15_10
						}
					end
				end
			end
		end
	end

	arg_15_0.cardInfos = var_15_0

	arg_15_0.cardList:SetTotalCount(#arg_15_0.cardInfos, -1)
end

local function var_0_2(arg_17_0)
	return getProxy(ShipSkinProxy):GetAllSkinForARCamera(arg_17_0)
end

local function var_0_3(arg_18_0)
	local var_18_0 = {}
	local var_18_1 = getProxy(ShipSkinProxy)
	local var_18_2 = var_18_1:getSkinList()
	local var_18_3 = getProxy(CollectionProxy):getShipGroup(arg_18_0)

	if var_18_3 then
		local var_18_4 = ShipGroup.getSkinList(arg_18_0)

		for iter_18_0, iter_18_1 in ipairs(var_18_4) do
			if iter_18_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_18_2, iter_18_1.id) or iter_18_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_18_3.trans or iter_18_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_18_3.married == 1 or var_18_1:hasSkin(iter_18_1.id) then
				var_18_0[iter_18_1.id] = true
			end
		end
	end

	return var_18_0
end

function var_0_0.onInitCard(arg_19_0, arg_19_1)
	local var_19_0 = LoveLetterShipCard.New(arg_19_1)

	onButton(arg_19_0, var_19_0.go, function()
		if var_19_0.shipGroup then
			arg_19_0:emit(var_0_0.SELECT_CHAR, var_19_0.shipGroup.id)
		end
	end)

	arg_19_0.cardItems[arg_19_1] = var_19_0
end

function var_0_0.onUpdateCard(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.cardItems[arg_21_2]

	if not var_21_0 then
		arg_21_0:onInitCard(arg_21_2)

		var_21_0 = arg_21_0.cardItems[arg_21_2]
	end

	local var_21_1 = arg_21_1 + 1
	local var_21_2 = arg_21_0.cardInfos[var_21_1]

	if not var_21_2 then
		return
	end

	local var_21_3

	if var_21_2.group then
		local var_21_4 = arg_21_0.proposeList[var_21_2.group.id]
	end

	var_21_0:update(var_21_2.group)
end

function var_0_0.onReturnCard(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0.exited then
		return
	end

	local var_22_0 = arg_22_0.cardItems[arg_22_2]

	if var_22_0 then
		var_22_0:clear()
	end

	arg_22_0.cardItems[arg_22_2] = nil
end

return var_0_0
