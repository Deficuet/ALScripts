local var_0_0 = class("IslandDockPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandDockUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.frameTr = arg_2_0._tf:Find("frame")
	arg_2_0.shipRect = arg_2_0._tf:Find("frame/ships"):GetComponent("LScrollRect")
	arg_2_0.inputTr = arg_2_0._tf:Find("frame/filter_panel/search/input")
	arg_2_0.indexBtn = arg_2_0._tf:Find("frame/filter_panel/IndexIco")
	arg_2_0.orderBtn = arg_2_0._tf:Find("frame/filter_panel/index")
	arg_2_0.orderIco = arg_2_0._tf:Find("frame/filter_panel/index/content/icon/icon")
	arg_2_0.orderTxt = arg_2_0._tf:Find("frame/filter_panel/index/content/Text"):GetComponent(typeof(Text))
	arg_2_0.animationPlayer = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.dftAniEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))

	function arg_2_0.shipRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.shipRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddListener(IslandCharacterAgency.ADD_SHIP, arg_5_0.OnAddShip)
end

function var_0_0.RemoveListeners(arg_6_0)
	arg_6_0:RemoveListener(IslandCharacterAgency.ADD_SHIP, arg_6_0.OnAddShip)
end

function var_0_0.OnAddShip(arg_7_0)
	arg_7_0:FlushShips()
end

function var_0_0.OnInit(arg_8_0)
	onButton(arg_8_0, arg_8_0._tf, function()
		arg_8_0.dftAniEvent:SetEndEvent(function()
			arg_8_0.dftAniEvent:SetEndEvent(nil)
			arg_8_0:Hide()
		end)
		arg_8_0.animationPlayer:Play("IslandDockUI_out")
	end, SFX_PANEL)
	onInputChanged(arg_8_0, arg_8_0.inputTr, function()
		local var_11_0 = getInputText(arg_8_0.inputTr)

		arg_8_0.searchKey = var_11_0

		arg_8_0:FlushShips()
	end)
	onToggle(arg_8_0, arg_8_0.indexBtn, function(arg_12_0)
		if arg_12_0 then
			arg_8_0:emit(IslandMediator.OPEN_SHIP_INDEX, {
				OnFilter = function(arg_13_0)
					arg_8_0:OnFilter(arg_13_0)
				end,
				defaultIndex = arg_8_0.sortData
			})
		end
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.orderBtn, function()
		arg_8_0.selectAsc = not arg_8_0.selectAsc

		arg_8_0:UpdateSortBtn()
		arg_8_0:FlushShips()
	end, SFX_PANEL)

	arg_8_0.cards = {}
	arg_8_0.searchKey = ""
	arg_8_0.selectAsc = true
	arg_8_0.sortData = {
		sortIndex = IslandShipIndexLayer.SortLevel,
		campIndex = ShipIndexConst.CampAll,
		rarityIndex = ShipIndexConst.RarityAll,
		extraIndex = IslandShipIndexLayer.ExtraALL
	}

	arg_8_0:UpdateSortBtn()
end

function var_0_0.OnFilter(arg_15_0, arg_15_1)
	arg_15_0.sortData = arg_15_1

	arg_15_0:UpdateSortBtn()
	arg_15_0:FlushShips()
end

function var_0_0.Show(arg_16_0)
	var_0_0.super.Show(arg_16_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_16_0.frameTr, {
		pbList = {
			arg_16_0.frameTr
		}
	})

	arg_16_0.characterAgency = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	arg_16_0:FlushShips()
end

function var_0_0.UpdateSortBtn(arg_17_0)
	arg_17_0.orderIco.localScale = arg_17_0.selectAsc and Vector3(1, 1, 1) or Vector3(1, -1, 1)

	local var_17_0, var_17_1 = IslandShipIndexLayer.getSortFuncAndName(arg_17_0.sortData.sortIndex, arg_17_0.selectAsc)

	arg_17_0.orderTxt.text = i18n(var_17_1)
end

function var_0_0.OnInitItem(arg_18_0, arg_18_1)
	local var_18_0 = IslandShipCard.New(arg_18_1)

	onButton(arg_18_0, var_18_0.go, function()
		arg_18_0:ClearSelected(arg_18_0.contextData.selectedId)
		arg_18_0:emit(IslandShipMainPage.SELECT_SHIP, var_18_0.configId)
		var_18_0:UpdateSelected(arg_18_0.contextData.selectedId)
	end, SFX_PANEL)

	arg_18_0.cards[arg_18_1] = var_18_0
end

function var_0_0.ClearSelected(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.cards) do
		if iter_20_1.configId == arg_20_1 then
			iter_20_1:UpdateSelected(nil)

			break
		end
	end
end

function var_0_0.OnUpdateItem(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.cards[arg_21_2]

	if not var_21_0 then
		arg_21_0:OnInitItem(arg_21_2)

		var_21_0 = arg_21_0.cards[arg_21_2]
	end

	local var_21_1 = arg_21_0.displays[arg_21_1 + 1]

	var_21_0:Update(var_21_1, arg_21_0.contextData.selectedId)
end

function var_0_0.FlushShips(arg_22_0)
	arg_22_0.displays = arg_22_0:GetShips()

	arg_22_0.shipRect:SetTotalCount(#arg_22_0.displays)
end

local function var_0_1(arg_23_0, arg_23_1)
	if not arg_23_1 or arg_23_1 == "" then
		return true
	end

	local var_23_0 = string.lower(string.gsub(arg_23_1, "%.", "%%."))
	local var_23_1 = IslandShip.StaticGetName(arg_23_0)

	return string.find(string.lower(var_23_1), var_23_0)
end

function var_0_0.ToVShip(arg_24_0, arg_24_1)
	if not arg_24_0.vship then
		arg_24_0.vship = {}

		function arg_24_0.vship.getNation()
			return arg_24_0.vship.config.nationality
		end

		function arg_24_0.vship.getShipType()
			return arg_24_0.vship.config.type
		end

		function arg_24_0.vship.getTeamType()
			return TeamType.GetTeamFromShipType(arg_24_0.vship.config.type)
		end

		function arg_24_0.vship.getRarity()
			return arg_24_0.vship.config.rarity
		end
	end

	arg_24_0.vship.config = arg_24_1

	return arg_24_0.vship
end

local function var_0_2(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_1
	local var_29_1 = ShipGroup.getDefaultShipConfig(var_29_0)
	local var_29_2 = arg_29_0:ToVShip(var_29_1)
	local var_29_3 = arg_29_0.characterAgency:GetShipById(arg_29_1)

	if ShipIndexConst.filterByCamp(var_29_2, arg_29_2.campIndex) and ShipIndexConst.filterByRarity(var_29_2, arg_29_2.rarityIndex) and IslandShipIndexLayer.filterByExtra(var_29_3, arg_29_2.extraIndex) then
		return true
	end

	return false
end

function var_0_0.GetShips(arg_30_0)
	local var_30_0 = {}
	local var_30_1 = arg_30_0.characterAgency:GetUnlockOrCanUnlockShipConfigIds()

	for iter_30_0, iter_30_1 in ipairs(var_30_1) do
		if var_0_1(iter_30_1, arg_30_0.searchKey) and var_0_2(arg_30_0, iter_30_1, arg_30_0.sortData) then
			table.insert(var_30_0, iter_30_1)
		end
	end

	local var_30_2 = IslandShipIndexLayer.getSortFuncAndName(arg_30_0.sortData.sortIndex, arg_30_0.selectAsc)

	table.sort(var_30_0, CompareFuncs(var_30_2))

	return var_30_0
end

function var_0_0.Hide(arg_31_0)
	var_0_0.super.Hide(arg_31_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_31_0.frameTr, arg_31_0._tf)
	arg_31_0:emit(IslandShipMainPage.CLOSE_DOCK)
end

function var_0_0.OnDestroy(arg_32_0)
	ClearLScrollrect(arg_32_0.shipRect)

	for iter_32_0, iter_32_1 in pairs(arg_32_0.cards) do
		iter_32_1:Dispose()
	end

	arg_32_0.cards = nil
end

return var_0_0
