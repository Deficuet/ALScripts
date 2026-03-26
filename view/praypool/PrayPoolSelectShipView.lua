local var_0_0 = class("PrayPoolSelectShipView", import("..base.BaseSubView"))

var_0_0.WIDTH_MIN = 328
var_0_0.WIDTH_MAX = 438
var_0_0.FONT_SIZE_MIN = 55
var_0_0.FONT_SIZE_MID = 44
var_0_0.FONT_SIZE_MAX = 34

function var_0_0.getUIName(arg_1_0)
	return "PrayPoolSelectShipView"
end

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

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
	arg_2_0:updateUI()
	arg_2_0:Show()
end

function var_0_0.OnDestroy(arg_3_0)
	return
end

function var_0_0.OnBackPress(arg_4_0)
	return
end

function var_0_0.initData(arg_5_0)
	arg_5_0.prayProxy = getProxy(PrayProxy)
	arg_5_0.poolType = arg_5_0.prayProxy:getSelectedPoolType()
	arg_5_0.selectedCount = arg_5_0.prayProxy:getSelectedShipCount()
	arg_5_0.pickUpNum = pg.activity_ship_create[arg_5_0.poolType].pickup_num
	arg_5_0.fliteList = Clone(pg.activity_ship_create[arg_5_0.poolType].pickup_list)

	arg_5_0:orderIDListByRarity(arg_5_0.fliteList)

	arg_5_0.orderFullList = Clone(arg_5_0.fliteList)
end

function var_0_0.initUI(arg_6_0)
	arg_6_0.minRaritySpriteMap = {}
	arg_6_0.maxRaritySpriteMap = {}
	arg_6_0.ratioSpriteMap = {}

	local var_6_0 = arg_6_0._tf:Find("MiniRarity")
	local var_6_1 = arg_6_0._tf:Find("MaxRarity")
	local var_6_2 = arg_6_0._tf:Find("Ratio")

	for iter_6_0 = 2, 6 do
		local var_6_3 = getImageSprite(var_6_0:Find(tostring(iter_6_0)))
		local var_6_4 = getImageSprite(var_6_1:Find(tostring(iter_6_0)))
		local var_6_5 = getImageSprite(var_6_2:Find(tostring(iter_6_0)))

		arg_6_0.minRaritySpriteMap[iter_6_0] = var_6_3
		arg_6_0.maxRaritySpriteMap[iter_6_0] = var_6_4
		arg_6_0.ratioSpriteMap[iter_6_0] = var_6_5
	end

	arg_6_0.poolSpriteMap = {}

	local var_6_6 = arg_6_0._tf:Find("Pool")

	for iter_6_1 = 1, 3 do
		local var_6_7 = getImageSprite(var_6_6:Find(tostring(iter_6_1)))

		arg_6_0.poolSpriteMap[iter_6_1] = var_6_7
	end

	arg_6_0.poolNameImg = arg_6_0._tf:Find("PoolNameImg")
	arg_6_0.shipCardTpl = arg_6_0._tf:Find("ShipCardTpl")

	local var_6_8 = arg_6_0._tf:Find("SelectedShipMax")
	local var_6_9 = var_6_8:Find("Light")
	local var_6_10 = var_6_8:Find("Ship1")
	local var_6_11 = var_6_8:Find("Ship2")
	local var_6_12 = arg_6_0._tf:Find("SelectedShipMini")
	local var_6_13 = var_6_12:Find("Light")
	local var_6_14 = var_6_12:Find("Ship1")
	local var_6_15 = var_6_12:Find("Ship2")

	arg_6_0.selectedShipTFMap = {}
	arg_6_0.selectedShipTFMap.Max = {
		lightTF = var_6_9,
		var_6_10,
		var_6_11
	}
	arg_6_0.selectedShipTFMap.Min = {
		lightTF = var_6_13,
		var_6_14,
		var_6_15
	}

	local var_6_16 = arg_6_0:isMinPrefs()

	setActive(var_6_8, not var_6_16)
	setActive(var_6_12, var_6_16)

	arg_6_0.shipListArea = arg_6_0._tf:Find("ShipListArea")
	arg_6_0.shipListContainer = arg_6_0.shipListArea:Find("Viewport/Content")
	arg_6_0.shipListSC = GetComponent(arg_6_0.shipListArea, "LScrollRect")

	setLocalPosition(arg_6_0.shipListArea, {
		x = 0,
		y = var_6_16 and -40 or -120
	})

	arg_6_0.bg2 = arg_6_0._tf:Find("BG2")

	setLocalPosition(arg_6_0.bg2, {
		x = 0,
		y = var_6_16 and -62.5 or -174
	})

	arg_6_0.indexBtn = arg_6_0._tf:Find("IndexBtn")
	arg_6_0.preBtn = arg_6_0._tf:Find("PreBtn")
	arg_6_0.nextBtn = arg_6_0._tf:Find("NextBtn")
	arg_6_0.nextBtnCom = GetComponent(arg_6_0.nextBtn, "Button")

	arg_6_0.indexBtn:GetComponent(typeof(Image)):SetNativeSize()

	for iter_6_2, iter_6_3 in ipairs(arg_6_0.selectedShipTFMap.Max) do
		iter_6_3:Find("Tip/Tip"):GetComponent(typeof(Image)):SetNativeSize()
	end

	for iter_6_4, iter_6_5 in ipairs(arg_6_0.selectedShipTFMap.Min) do
		iter_6_5:Find("Tip/Tip"):GetComponent(typeof(Image)):SetNativeSize()
	end

	arg_6_0.nextBtnCom.interactable = false

	local var_6_17 = arg_6_0._tf:Find("InstructionText")

	setText(var_6_17, i18n("pray_build_select_ship_instruction"))
	onButton(arg_6_0, arg_6_0.preBtn, function()
		arg_6_0.prayProxy:updatePageState(PrayProxy.STATE_SELECT_POOL)
		arg_6_0:emit(PrayPoolConst.SWITCH_TO_SELECT_POOL_PAGE, PrayProxy.STATE_SELECT_POOL)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.nextBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("warning_pray_build_pool"),
			onYes = function()
				local function var_9_0()
					arg_6_0:emit(PrayPoolConst.CLICK_BUILD_BTN, {
						pooltype = arg_6_0.prayProxy:getSelectedPoolType(),
						shipIDList = arg_6_0.prayProxy:getSelectedShipIDList()
					})
				end

				if not arg_6_0:isMinPrefs() then
					var_9_0()
				else
					local var_9_1 = {}
					local var_9_2 = arg_6_0.prayProxy:getSelectedShipIDList()

					for iter_9_0, iter_9_1 in ipairs(var_9_2) do
						PaintingGroupConst.AddPaintingNameByShipConfigID(var_9_1, iter_9_1)
					end

					local var_9_3 = {
						isShowBox = true,
						paintingNameList = var_9_1,
						finishFunc = var_9_0
					}

					PaintingGroupConst.PaintingDownload(var_9_3)
				end
			end
		})
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.indexBtn, function()
		local var_11_0 = Clone(var_0_0.ShipIndexData)

		var_11_0.indexDatas = Clone(var_0_0.ShipIndex)

		function var_11_0.callback(arg_12_0)
			var_0_0.ShipIndex.typeIndex = arg_12_0.typeIndex
			var_0_0.ShipIndex.rarityIndex = arg_12_0.rarityIndex

			if arg_12_0.campIndex then
				var_0_0.ShipIndex.campIndex = arg_12_0.campIndex
			end

			arg_6_0:fliteShipIDList()
			arg_6_0:updateShipList(arg_6_0.fliteList)
		end

		arg_6_0:emit(PrayPoolConst.CLICK_INDEX_BTN, var_11_0)
	end)
end

function var_0_0.updateUI(arg_13_0)
	setImageSprite(arg_13_0.poolNameImg, arg_13_0.poolSpriteMap[arg_13_0.poolType], true)
	arg_13_0:updateSelectedShipList()
	arg_13_0:updateShipList(arg_13_0.fliteList)
end

function var_0_0.updateSelectedShipList(arg_14_0)
	if arg_14_0:isMinPrefs() then
		arg_14_0:updateMin()
	else
		arg_14_0:updateMax()
	end
end

function var_0_0.updateMax(arg_15_0)
	local var_15_0 = arg_15_0.prayProxy:getSelectedShipIDList()
	local var_15_1 = arg_15_0.selectedShipTFMap.Max

	for iter_15_0 = 1, 2 do
		local var_15_2 = var_15_0[iter_15_0]
		local var_15_3 = var_15_1[iter_15_0]
		local var_15_4 = var_15_3:Find("Paint")
		local var_15_5 = var_15_3:Find("Tip")
		local var_15_6 = var_15_3:Find("Info")
		local var_15_7 = var_15_3:Find("Btn")
		local var_15_8 = var_15_6:Find("Name/Text")
		local var_15_9 = var_15_3:Find("RarityBG")
		local var_15_10 = var_15_6:Find("Ratio/NumImg")

		if var_15_2 then
			setActive(var_15_4, true)
			setPaintingPrefabAsync(var_15_4, Ship.getPaintingName(var_15_2), "biandui")

			if iter_15_0 == 2 then
				setLocalRotation(var_15_4, {
					z = 180
				})
			end

			setActive(var_15_5, false)
			setActive(var_15_6, true)

			local var_15_11 = pg.ship_data_statistics[var_15_2].name

			setText(var_15_8, var_15_11)

			local var_15_12 = var_15_8.localPosition
			local var_15_13 = #var_15_11

			if var_15_13 <= 6 then
				var_15_6.sizeDelta = Vector2(var_0_0.WIDTH_MIN, var_15_6.sizeDelta.y)
				GetComponent(var_15_8, "Text").fontSize = var_0_0.FONT_SIZE_MIN

				setAnchoredPosition(var_15_8, {
					y = 14
				})
			elseif var_15_13 <= 21 then
				var_15_6.sizeDelta = Vector2(var_0_0.WIDTH_MAX, var_15_6.sizeDelta.y)
				GetComponent(var_15_8, "Text").fontSize = var_0_0.FONT_SIZE_MID

				setAnchoredPosition(var_15_8, {
					y = 19
				})
			else
				var_15_6.sizeDelta = Vector2(var_0_0.WIDTH_MAX, var_15_6.sizeDelta.y)
				GetComponent(var_15_8, "Text").fontSize = var_0_0.FONT_SIZE_MAX

				setAnchoredPosition(var_15_8, {
					y = 25
				})
			end

			local var_15_14 = pg.ship_data_statistics[var_15_2].rarity

			setImageSprite(var_15_10, arg_15_0.ratioSpriteMap[var_15_14], true)
			setActive(var_15_9, true)
			setImageSprite(var_15_9, arg_15_0.maxRaritySpriteMap[var_15_14])
		else
			setActive(var_15_4, false)
			setActive(var_15_5, true)
			setActive(var_15_6, false)
			setActive(var_15_9, false)
		end

		onButton(arg_15_0, var_15_7, function()
			if isActive(var_15_4) then
				arg_15_0.prayProxy:removeSelectedShipIDList(var_15_2)

				arg_15_0.selectedCount = arg_15_0.selectedCount - 1

				arg_15_0:updateSelectedShipList()
				arg_15_0:updateShipList(arg_15_0.fliteList)
			end
		end, SFX_PANEL)
	end

	local var_15_15 = var_15_1.lightTF

	if #var_15_0 == arg_15_0.pickUpNum then
		arg_15_0.nextBtnCom.interactable = true

		setActive(var_15_15, true)
	elseif #var_15_0 < arg_15_0.pickUpNum then
		arg_15_0.nextBtnCom.interactable = false

		setActive(var_15_15, false)
	end
end

function var_0_0.updateMin(arg_17_0)
	local var_17_0 = arg_17_0.prayProxy:getSelectedShipIDList()
	local var_17_1 = arg_17_0.selectedShipTFMap.Min

	for iter_17_0 = 1, 2 do
		local var_17_2 = var_17_0[iter_17_0]
		local var_17_3 = var_17_1[iter_17_0]
		local var_17_4 = var_17_3:Find("Mask/Paint")
		local var_17_5 = var_17_3:Find("Tip")
		local var_17_6 = var_17_3:Find("Info")
		local var_17_7 = var_17_3:Find("Btn")
		local var_17_8 = var_17_6:Find("Name/Text")
		local var_17_9 = var_17_3:Find("Mask/RarityBG")
		local var_17_10 = var_17_6:Find("Ratio/NumImg")

		if var_17_2 then
			setActive(var_17_4, true)
			setImageSprite(var_17_4, LoadSprite("herohrzicon/" .. Ship.getPaintingName(var_17_2)))
			setActive(var_17_5, false)
			setActive(var_17_6, true)

			local var_17_11 = pg.ship_data_statistics[var_17_2].name

			setText(var_17_8, var_17_11)

			local var_17_12 = var_17_8.localPosition
			local var_17_13 = #var_17_11

			if var_17_13 <= 6 then
				var_17_6.sizeDelta = Vector2(var_0_0.WIDTH_MIN, var_17_6.sizeDelta.y)
				GetComponent(var_17_8, "Text").fontSize = var_0_0.FONT_SIZE_MIN

				setAnchoredPosition(var_17_8, {
					y = 0
				})
			elseif var_17_13 <= 21 then
				var_17_6.sizeDelta = Vector2(var_0_0.WIDTH_MAX, var_17_6.sizeDelta.y)
				GetComponent(var_17_8, "Text").fontSize = var_0_0.FONT_SIZE_MID

				setAnchoredPosition(var_17_8, {
					y = 5
				})
			else
				var_17_6.sizeDelta = Vector2(var_0_0.WIDTH_MAX, var_17_6.sizeDelta.y)
				GetComponent(var_17_8, "Text").fontSize = var_0_0.FONT_SIZE_MAX

				setAnchoredPosition(var_17_8, {
					y = 11
				})
			end

			Canvas.ForceUpdateCanvases()

			local var_17_14 = pg.ship_data_statistics[var_17_2].rarity

			setImageSprite(var_17_10, arg_17_0.ratioSpriteMap[var_17_14], true)
			setActive(var_17_9, true)
			setImageSprite(var_17_9, arg_17_0.minRaritySpriteMap[var_17_14])
		else
			setActive(var_17_4, false)
			setActive(var_17_5, true)
			setActive(var_17_6, false)
			setActive(var_17_9, false)
		end

		onButton(arg_17_0, var_17_7, function()
			if isActive(var_17_4) then
				arg_17_0.prayProxy:removeSelectedShipIDList(var_17_2)

				arg_17_0.selectedCount = arg_17_0.selectedCount - 1

				arg_17_0:updateSelectedShipList()
				arg_17_0:updateShipList(arg_17_0.fliteList)
			end
		end, SFX_PANEL)
	end

	local var_17_15 = var_17_1.lightTF

	if #var_17_0 == arg_17_0.pickUpNum then
		arg_17_0.nextBtnCom.interactable = true

		setActive(var_17_15, true)
	elseif #var_17_0 < arg_17_0.pickUpNum then
		arg_17_0.nextBtnCom.interactable = false

		setActive(var_17_15, false)
	end
end

function var_0_0.updateShipList(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.prayProxy:getSelectedShipIDList()

	function arg_19_0.shipListSC.onUpdateItem(arg_20_0, arg_20_1)
		local var_20_0 = arg_19_1[arg_20_0 + 1]

		arg_20_1 = tf(arg_20_1)

		local var_20_1 = arg_20_1:Find("BG/Icon")

		GetImageSpriteFromAtlasAsync("SquareIcon/" .. Ship.getPaintingName(var_20_0), "", var_20_1)

		local var_20_2 = arg_20_1:Find("BG/GroupLocked")
		local var_20_3 = pg.ship_data_template[var_20_0].group_type

		if var_20_3 and var_20_3 > 0 then
			setActive(var_20_2, not getProxy(CollectionProxy):getShipGroup(var_20_3))
		else
			setActive(var_20_2, false)
		end

		local var_20_4 = arg_20_1:Find("BG/icon_bg/frame")
		local var_20_5 = pg.ship_data_statistics[var_20_0].rarity
		local var_20_6 = ShipRarity.Rarity2Print(var_20_5)

		setFrame(var_20_4, var_20_6)
		setIconColorful(arg_20_1:Find("BG"), var_20_5 - 1, {})

		local var_20_7 = arg_20_1:Find("BG")

		setImageSprite(var_20_7, GetSpriteFromAtlas("weaponframes", "bg" .. var_20_6))

		local var_20_8 = pg.ship_data_statistics[var_20_0].name
		local var_20_9 = arg_20_1:Find("NameBG/NameText")

		setText(var_20_9, shortenString(var_20_8, 6))

		local var_20_10 = arg_20_1:Find("BG/SelectedImg")

		if table.indexof(var_19_0, var_20_0, 1) then
			SetActive(var_20_10, true)
		else
			SetActive(var_20_10, false)
		end

		setBlackMask(tf(arg_20_1), var_20_5 == ShipRarity.SSR and arg_19_0:isSelectedSSR() and not isActive(var_20_10), {
			recursive = true,
			color = Color(0, 0, 0, 0.6)
		})
		onButton(arg_19_0, arg_20_1, function()
			if arg_19_0.selectedCount < arg_19_0.pickUpNum then
				if isActive(var_20_10) then
					arg_19_0.prayProxy:removeSelectedShipIDList(var_20_0)

					arg_19_0.selectedCount = arg_19_0.selectedCount - 1

					SetActive(var_20_10, false)
					arg_19_0:updateSelectedShipList()
					arg_19_0:updateShipList(arg_19_0.fliteList)
				elseif var_20_5 == ShipRarity.SSR and arg_19_0:isSelectedSSR() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("pray_build_UR_warning"))
				else
					arg_19_0.prayProxy:insertSelectedShipIDList(var_20_0)

					arg_19_0.selectedCount = arg_19_0.selectedCount + 1

					SetActive(var_20_10, true)
					arg_19_0:updateSelectedShipList()
					arg_19_0:updateShipList(arg_19_0.fliteList)
				end
			elseif arg_19_0.selectedCount == arg_19_0.pickUpNum then
				if isActive(var_20_10) then
					arg_19_0.prayProxy:removeSelectedShipIDList(var_20_0)

					arg_19_0.selectedCount = arg_19_0.selectedCount - 1

					SetActive(var_20_10, false)
					arg_19_0:updateSelectedShipList()
					arg_19_0:updateShipList(arg_19_0.fliteList)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("error_pray_select_ship_max"))
				end
			end
		end, SFX_PANEL)
	end

	function arg_19_0.shipListSC.onReturnItem(arg_22_0, arg_22_1)
		return
	end

	arg_19_0.shipListSC:SetTotalCount(#arg_19_1)
end

function var_0_0.orderIDListByRarity(arg_23_0, arg_23_1)
	local var_23_0 = getProxy(CollectionProxy)

	local function var_23_1(arg_24_0, arg_24_1)
		local var_24_0 = pg.ship_data_statistics[arg_24_0].rarity
		local var_24_1 = pg.ship_data_statistics[arg_24_1].rarity
		local var_24_2 = var_23_0:getShipGroup(pg.ship_data_template[arg_24_0].group_type) and 1 or 0
		local var_24_3 = var_23_0:getShipGroup(pg.ship_data_template[arg_24_1].group_type) and 1 or 0

		if var_24_2 == var_24_3 then
			return var_24_1 < var_24_0
		else
			return var_24_2 < var_24_3
		end
	end

	table.sort(arg_23_1, var_23_1)
end

function var_0_0.fliteShipIDList(arg_25_0)
	local var_25_0 = {}
	local var_25_1 = arg_25_0.prayProxy:getSelectedShipIDList()

	if var_25_1 and #var_25_1 > 0 then
		for iter_25_0, iter_25_1 in ipairs(var_25_1) do
			table.insert(var_25_0, 1, iter_25_1)
		end
	end

	for iter_25_2, iter_25_3 in ipairs(arg_25_0.orderFullList) do
		if not table.indexof(var_25_1, iter_25_3, 1) then
			local var_25_2 = math.modf(iter_25_3 / 10)
			local var_25_3 = ShipGroup.New({
				id = var_25_2
			})

			if ShipIndexConst.filterByType(var_25_3, var_0_0.ShipIndex.typeIndex) and ShipIndexConst.filterByRarity(var_25_3, var_0_0.ShipIndex.rarityIndex) and ShipIndexConst.filterByCamp(var_25_3, var_0_0.ShipIndex.campIndex) then
				var_25_0[#var_25_0 + 1] = iter_25_3
			end
		end
	end

	arg_25_0.fliteList = var_25_0
end

function var_0_0.isMinPrefs(arg_26_0)
	return GroupHelper.GetGroupPrefsByName("PAINTING") == DMFileChecker.Prefs.Min
end

function var_0_0.isSelectedSSR(arg_27_0)
	local var_27_0 = false
	local var_27_1 = arg_27_0.prayProxy:getSelectedShipIDList()

	if var_27_1 and #var_27_1 > 0 then
		for iter_27_0, iter_27_1 in ipairs(var_27_1) do
			if pg.ship_data_statistics[iter_27_1].rarity == ShipRarity.SSR then
				var_27_0 = true

				break
			end
		end
	end

	return var_27_0
end

return var_0_0
