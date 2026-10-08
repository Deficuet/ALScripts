local var_0_0 = class("PrayPoolSelectShipView", import("..base.BaseSubView"))

var_0_0.WIDTH_MIN = 328
var_0_0.WIDTH_MAX = 438
var_0_0.FONT_SIZE_MIN = 55
var_0_0.FONT_SIZE_MID = 44
var_0_0.FONT_SIZE_MAX = 34

function var_0_0.getResource(arg_1_0)
	local var_1_0 = {
		"weaponframes"
	}

	for iter_1_0, iter_1_1 in ipairs(pg.activity_ship_create.all) do
		local var_1_1 = pg.activity_ship_create[iter_1_1]

		for iter_1_2, iter_1_3 in ipairs(var_1_1.pickup_list or {}) do
			table.insertto(var_1_0, ResPathSupport.GetPaintingSquareIconListByPaintingName(Ship.getPaintingName(iter_1_3)))
		end
	end

	local var_1_2 = getProxy(PrayProxy)

	for iter_1_4, iter_1_5 in ipairs(var_1_2:getSelectedShipIDList() or {}) do
		local var_1_3 = Ship.getPaintingName(iter_1_5)

		table.insertto(var_1_0, ResPathSupport.GetPaintingListByPaintingName(var_1_3))
		table.insertto(var_1_0, ResPathSupport.GetPaintingHeroHrzIconListByPaintingName(var_1_3))
	end

	return table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))
end

function var_0_0.getUIName(arg_2_0)
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

function var_0_0.OnInit(arg_3_0)
	arg_3_0:initData()
	arg_3_0:initUI()
	arg_3_0:updateUI()
	arg_3_0:Show()
end

function var_0_0.OnDestroy(arg_4_0)
	return
end

function var_0_0.OnBackPress(arg_5_0)
	return
end

function var_0_0.initData(arg_6_0)
	arg_6_0.prayProxy = getProxy(PrayProxy)
	arg_6_0.poolType = arg_6_0.prayProxy:getSelectedPoolType()
	arg_6_0.selectedCount = arg_6_0.prayProxy:getSelectedShipCount()
	arg_6_0.pickUpNum = pg.activity_ship_create[arg_6_0.poolType].pickup_num
	arg_6_0.fliteList = Clone(pg.activity_ship_create[arg_6_0.poolType].pickup_list)

	arg_6_0:orderIDListByRarity(arg_6_0.fliteList)

	arg_6_0.orderFullList = Clone(arg_6_0.fliteList)
end

function var_0_0.initUI(arg_7_0)
	arg_7_0.minRaritySpriteMap = {}
	arg_7_0.maxRaritySpriteMap = {}
	arg_7_0.ratioSpriteMap = {}

	local var_7_0 = arg_7_0._tf:Find("MiniRarity")
	local var_7_1 = arg_7_0._tf:Find("MaxRarity")
	local var_7_2 = arg_7_0._tf:Find("Ratio")

	for iter_7_0 = 2, 6 do
		local var_7_3 = getImageSprite(var_7_0:Find(tostring(iter_7_0)))
		local var_7_4 = getImageSprite(var_7_1:Find(tostring(iter_7_0)))
		local var_7_5 = getImageSprite(var_7_2:Find(tostring(iter_7_0)))

		arg_7_0.minRaritySpriteMap[iter_7_0] = var_7_3
		arg_7_0.maxRaritySpriteMap[iter_7_0] = var_7_4
		arg_7_0.ratioSpriteMap[iter_7_0] = var_7_5
	end

	arg_7_0.poolSpriteMap = {}

	local var_7_6 = arg_7_0._tf:Find("Pool")

	for iter_7_1 = 1, 3 do
		local var_7_7 = getImageSprite(var_7_6:Find(tostring(iter_7_1)))

		arg_7_0.poolSpriteMap[iter_7_1] = var_7_7
	end

	arg_7_0.poolNameImg = arg_7_0._tf:Find("PoolNameImg")
	arg_7_0.shipCardTpl = arg_7_0._tf:Find("ShipCardTpl")

	local var_7_8 = arg_7_0._tf:Find("SelectedShipMax")
	local var_7_9 = var_7_8:Find("Light")
	local var_7_10 = var_7_8:Find("Ship1")
	local var_7_11 = var_7_8:Find("Ship2")
	local var_7_12 = arg_7_0._tf:Find("SelectedShipMini")
	local var_7_13 = var_7_12:Find("Light")
	local var_7_14 = var_7_12:Find("Ship1")
	local var_7_15 = var_7_12:Find("Ship2")

	arg_7_0.selectedShipTFMap = {}
	arg_7_0.selectedShipTFMap.Max = {
		lightTF = var_7_9,
		var_7_10,
		var_7_11
	}
	arg_7_0.selectedShipTFMap.Min = {
		lightTF = var_7_13,
		var_7_14,
		var_7_15
	}

	local var_7_16 = arg_7_0:isMinPrefs()

	setActive(var_7_8, not var_7_16)
	setActive(var_7_12, var_7_16)

	arg_7_0.shipListArea = arg_7_0._tf:Find("ShipListArea")
	arg_7_0.shipListContainer = arg_7_0.shipListArea:Find("Viewport/Content")
	arg_7_0.shipListSC = GetComponent(arg_7_0.shipListArea, "LScrollRect")

	setLocalPosition(arg_7_0.shipListArea, {
		x = 0,
		y = var_7_16 and -40 or -120
	})

	arg_7_0.bg2 = arg_7_0._tf:Find("BG2")

	setLocalPosition(arg_7_0.bg2, {
		x = 0,
		y = var_7_16 and -62.5 or -174
	})

	arg_7_0.indexBtn = arg_7_0._tf:Find("IndexBtn")
	arg_7_0.preBtn = arg_7_0._tf:Find("PreBtn")
	arg_7_0.nextBtn = arg_7_0._tf:Find("NextBtn")
	arg_7_0.nextBtnCom = GetComponent(arg_7_0.nextBtn, "Button")

	arg_7_0.indexBtn:GetComponent(typeof(Image)):SetNativeSize()

	for iter_7_2, iter_7_3 in ipairs(arg_7_0.selectedShipTFMap.Max) do
		iter_7_3:Find("Tip/Tip"):GetComponent(typeof(Image)):SetNativeSize()
	end

	for iter_7_4, iter_7_5 in ipairs(arg_7_0.selectedShipTFMap.Min) do
		iter_7_5:Find("Tip/Tip"):GetComponent(typeof(Image)):SetNativeSize()
	end

	arg_7_0.nextBtnCom.interactable = false

	local var_7_17 = arg_7_0._tf:Find("InstructionText")

	setText(var_7_17, i18n("pray_build_select_ship_instruction"))
	onButton(arg_7_0, arg_7_0.preBtn, function()
		arg_7_0.prayProxy:updatePageState(PrayProxy.STATE_SELECT_POOL)
		arg_7_0:emit(PrayPoolConst.SWITCH_TO_SELECT_POOL_PAGE, PrayProxy.STATE_SELECT_POOL)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.nextBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("warning_pray_build_pool"),
			onYes = function()
				local function var_10_0()
					arg_7_0:emit(PrayPoolConst.CLICK_BUILD_BTN, {
						pooltype = arg_7_0.prayProxy:getSelectedPoolType(),
						shipIDList = arg_7_0.prayProxy:getSelectedShipIDList()
					})
				end

				if not arg_7_0:isMinPrefs() then
					var_10_0()
				else
					local var_10_1 = {}
					local var_10_2 = arg_7_0.prayProxy:getSelectedShipIDList()

					for iter_10_0, iter_10_1 in ipairs(var_10_2) do
						PaintingGroupConst.AddPaintingNameByShipConfigID(var_10_1, iter_10_1)
					end

					local var_10_3 = {
						isShowBox = true,
						paintingNameList = var_10_1,
						finishFunc = var_10_0
					}

					PaintingGroupConst.PaintingDownload(var_10_3)
				end
			end
		})
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.indexBtn, function()
		local var_12_0 = Clone(var_0_0.ShipIndexData)

		var_12_0.indexDatas = Clone(var_0_0.ShipIndex)

		function var_12_0.callback(arg_13_0)
			var_0_0.ShipIndex.typeIndex = arg_13_0.typeIndex
			var_0_0.ShipIndex.rarityIndex = arg_13_0.rarityIndex

			if arg_13_0.campIndex then
				var_0_0.ShipIndex.campIndex = arg_13_0.campIndex
			end

			arg_7_0:fliteShipIDList()
			arg_7_0:updateShipList(arg_7_0.fliteList)
		end

		arg_7_0:emit(PrayPoolConst.CLICK_INDEX_BTN, var_12_0)
	end)
end

function var_0_0.updateUI(arg_14_0)
	setImageSprite(arg_14_0.poolNameImg, arg_14_0.poolSpriteMap[arg_14_0.poolType], true)
	arg_14_0:updateSelectedShipList()
	arg_14_0:updateShipList(arg_14_0.fliteList)
end

function var_0_0.updateSelectedShipList(arg_15_0)
	local var_15_0 = arg_15_0.prayProxy:getSelectedShipIDList()
	local var_15_1 = {}

	for iter_15_0, iter_15_1 in ipairs(var_15_0 or {}) do
		local var_15_2 = Ship.getPaintingName(iter_15_1)

		table.insertto(var_15_1, ResPathSupport.GetPaintingListByPaintingName(var_15_2))
		table.insertto(var_15_1, ResPathSupport.GetPaintingHeroHrzIconListByPaintingName(var_15_2))
	end

	SplitPackConst.DownloadByLuaArr(var_15_1, function()
		if arg_15_0:isMinPrefs() then
			arg_15_0:updateMin()
		else
			arg_15_0:updateMax()
		end
	end)
end

function var_0_0.updateMax(arg_17_0)
	local var_17_0 = arg_17_0.prayProxy:getSelectedShipIDList()
	local var_17_1 = arg_17_0.selectedShipTFMap.Max

	for iter_17_0 = 1, 2 do
		local var_17_2 = var_17_0[iter_17_0]
		local var_17_3 = var_17_1[iter_17_0]
		local var_17_4 = var_17_3:Find("Paint")
		local var_17_5 = var_17_3:Find("Tip")
		local var_17_6 = var_17_3:Find("Info")
		local var_17_7 = var_17_3:Find("Btn")
		local var_17_8 = var_17_6:Find("Name/Text")
		local var_17_9 = var_17_3:Find("RarityBG")
		local var_17_10 = var_17_6:Find("Ratio/NumImg")

		if var_17_2 then
			setActive(var_17_4, true)
			setPaintingPrefabAsync(var_17_4, Ship.getPaintingName(var_17_2), "biandui")

			if iter_17_0 == 2 then
				setLocalRotation(var_17_4, {
					z = 180
				})
			end

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
					y = 14
				})
			elseif var_17_13 <= 21 then
				var_17_6.sizeDelta = Vector2(var_0_0.WIDTH_MAX, var_17_6.sizeDelta.y)
				GetComponent(var_17_8, "Text").fontSize = var_0_0.FONT_SIZE_MID

				setAnchoredPosition(var_17_8, {
					y = 19
				})
			else
				var_17_6.sizeDelta = Vector2(var_0_0.WIDTH_MAX, var_17_6.sizeDelta.y)
				GetComponent(var_17_8, "Text").fontSize = var_0_0.FONT_SIZE_MAX

				setAnchoredPosition(var_17_8, {
					y = 25
				})
			end

			local var_17_14 = pg.ship_data_statistics[var_17_2].rarity

			setImageSprite(var_17_10, arg_17_0.ratioSpriteMap[var_17_14], true)
			setActive(var_17_9, true)
			setImageSprite(var_17_9, arg_17_0.maxRaritySpriteMap[var_17_14])
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

function var_0_0.updateMin(arg_19_0)
	local var_19_0 = arg_19_0.prayProxy:getSelectedShipIDList()
	local var_19_1 = arg_19_0.selectedShipTFMap.Min

	for iter_19_0 = 1, 2 do
		local var_19_2 = var_19_0[iter_19_0]
		local var_19_3 = var_19_1[iter_19_0]
		local var_19_4 = var_19_3:Find("Mask/Paint")
		local var_19_5 = var_19_3:Find("Tip")
		local var_19_6 = var_19_3:Find("Info")
		local var_19_7 = var_19_3:Find("Btn")
		local var_19_8 = var_19_6:Find("Name/Text")
		local var_19_9 = var_19_3:Find("Mask/RarityBG")
		local var_19_10 = var_19_6:Find("Ratio/NumImg")

		if var_19_2 then
			setActive(var_19_4, true)
			setImageSprite(var_19_4, LoadSprite("herohrzicon/" .. Ship.getPaintingName(var_19_2)))
			setActive(var_19_5, false)
			setActive(var_19_6, true)

			local var_19_11 = pg.ship_data_statistics[var_19_2].name

			setText(var_19_8, var_19_11)

			local var_19_12 = var_19_8.localPosition
			local var_19_13 = #var_19_11

			if var_19_13 <= 6 then
				var_19_6.sizeDelta = Vector2(var_0_0.WIDTH_MIN, var_19_6.sizeDelta.y)
				GetComponent(var_19_8, "Text").fontSize = var_0_0.FONT_SIZE_MIN

				setAnchoredPosition(var_19_8, {
					y = 0
				})
			elseif var_19_13 <= 21 then
				var_19_6.sizeDelta = Vector2(var_0_0.WIDTH_MAX, var_19_6.sizeDelta.y)
				GetComponent(var_19_8, "Text").fontSize = var_0_0.FONT_SIZE_MID

				setAnchoredPosition(var_19_8, {
					y = 5
				})
			else
				var_19_6.sizeDelta = Vector2(var_0_0.WIDTH_MAX, var_19_6.sizeDelta.y)
				GetComponent(var_19_8, "Text").fontSize = var_0_0.FONT_SIZE_MAX

				setAnchoredPosition(var_19_8, {
					y = 11
				})
			end

			Canvas.ForceUpdateCanvases()

			local var_19_14 = pg.ship_data_statistics[var_19_2].rarity

			setImageSprite(var_19_10, arg_19_0.ratioSpriteMap[var_19_14], true)
			setActive(var_19_9, true)
			setImageSprite(var_19_9, arg_19_0.minRaritySpriteMap[var_19_14])
		else
			setActive(var_19_4, false)
			setActive(var_19_5, true)
			setActive(var_19_6, false)
			setActive(var_19_9, false)
		end

		onButton(arg_19_0, var_19_7, function()
			if isActive(var_19_4) then
				arg_19_0.prayProxy:removeSelectedShipIDList(var_19_2)

				arg_19_0.selectedCount = arg_19_0.selectedCount - 1

				arg_19_0:updateSelectedShipList()
				arg_19_0:updateShipList(arg_19_0.fliteList)
			end
		end, SFX_PANEL)
	end

	local var_19_15 = var_19_1.lightTF

	if #var_19_0 == arg_19_0.pickUpNum then
		arg_19_0.nextBtnCom.interactable = true

		setActive(var_19_15, true)
	elseif #var_19_0 < arg_19_0.pickUpNum then
		arg_19_0.nextBtnCom.interactable = false

		setActive(var_19_15, false)
	end
end

function var_0_0.updateShipList(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.prayProxy:getSelectedShipIDList()

	function arg_21_0.shipListSC.onUpdateItem(arg_22_0, arg_22_1)
		local var_22_0 = arg_21_1[arg_22_0 + 1]

		arg_22_1 = tf(arg_22_1)

		local var_22_1 = arg_22_1:Find("BG/Icon")

		GetImageSpriteFromAtlasAsync("SquareIcon/" .. Ship.getPaintingName(var_22_0), "", var_22_1)

		local var_22_2 = arg_22_1:Find("BG/GroupLocked")
		local var_22_3 = pg.ship_data_template[var_22_0].group_type

		if var_22_3 and var_22_3 > 0 then
			setActive(var_22_2, not getProxy(CollectionProxy):getShipGroup(var_22_3))
		else
			setActive(var_22_2, false)
		end

		local var_22_4 = arg_22_1:Find("BG/icon_bg/frame")
		local var_22_5 = pg.ship_data_statistics[var_22_0].rarity
		local var_22_6 = ShipRarity.Rarity2Print(var_22_5)

		setFrame(var_22_4, var_22_6)
		setIconColorful(arg_22_1:Find("BG"), var_22_5 - 1, {})

		local var_22_7 = arg_22_1:Find("BG")

		setImageSprite(var_22_7, GetSpriteFromAtlas("weaponframes", "bg" .. var_22_6))

		local var_22_8 = pg.ship_data_statistics[var_22_0].name
		local var_22_9 = arg_22_1:Find("NameBG/NameText")

		setText(var_22_9, shortenString(var_22_8, 6))

		local var_22_10 = arg_22_1:Find("BG/SelectedImg")

		if table.indexof(var_21_0, var_22_0, 1) then
			SetActive(var_22_10, true)
		else
			SetActive(var_22_10, false)
		end

		setBlackMask(tf(arg_22_1), var_22_5 == ShipRarity.SSR and arg_21_0:isSelectedSSR() and not isActive(var_22_10), {
			recursive = true,
			color = Color(0, 0, 0, 0.6)
		})
		onButton(arg_21_0, arg_22_1, function()
			if arg_21_0.selectedCount < arg_21_0.pickUpNum then
				if isActive(var_22_10) then
					arg_21_0.prayProxy:removeSelectedShipIDList(var_22_0)

					arg_21_0.selectedCount = arg_21_0.selectedCount - 1

					SetActive(var_22_10, false)
					arg_21_0:updateSelectedShipList()
					arg_21_0:updateShipList(arg_21_0.fliteList)
				elseif var_22_5 == ShipRarity.SSR and arg_21_0:isSelectedSSR() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("pray_build_UR_warning"))
				else
					arg_21_0.prayProxy:insertSelectedShipIDList(var_22_0)

					arg_21_0.selectedCount = arg_21_0.selectedCount + 1

					SetActive(var_22_10, true)
					arg_21_0:updateSelectedShipList()
					arg_21_0:updateShipList(arg_21_0.fliteList)
				end
			elseif arg_21_0.selectedCount == arg_21_0.pickUpNum then
				if isActive(var_22_10) then
					arg_21_0.prayProxy:removeSelectedShipIDList(var_22_0)

					arg_21_0.selectedCount = arg_21_0.selectedCount - 1

					SetActive(var_22_10, false)
					arg_21_0:updateSelectedShipList()
					arg_21_0:updateShipList(arg_21_0.fliteList)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("error_pray_select_ship_max"))
				end
			end
		end, SFX_PANEL)
	end

	function arg_21_0.shipListSC.onReturnItem(arg_24_0, arg_24_1)
		return
	end

	arg_21_0.shipListSC:SetTotalCount(#arg_21_1)
end

function var_0_0.orderIDListByRarity(arg_25_0, arg_25_1)
	local var_25_0 = getProxy(CollectionProxy)

	local function var_25_1(arg_26_0, arg_26_1)
		local var_26_0 = pg.ship_data_statistics[arg_26_0].rarity
		local var_26_1 = pg.ship_data_statistics[arg_26_1].rarity
		local var_26_2 = var_25_0:getShipGroup(pg.ship_data_template[arg_26_0].group_type) and 1 or 0
		local var_26_3 = var_25_0:getShipGroup(pg.ship_data_template[arg_26_1].group_type) and 1 or 0

		if var_26_2 == var_26_3 then
			return var_26_1 < var_26_0
		else
			return var_26_2 < var_26_3
		end
	end

	table.sort(arg_25_1, var_25_1)
end

function var_0_0.fliteShipIDList(arg_27_0)
	local var_27_0 = {}
	local var_27_1 = arg_27_0.prayProxy:getSelectedShipIDList()

	if var_27_1 and #var_27_1 > 0 then
		for iter_27_0, iter_27_1 in ipairs(var_27_1) do
			table.insert(var_27_0, 1, iter_27_1)
		end
	end

	for iter_27_2, iter_27_3 in ipairs(arg_27_0.orderFullList) do
		if not table.indexof(var_27_1, iter_27_3, 1) then
			local var_27_2 = math.modf(iter_27_3 / 10)
			local var_27_3 = ShipGroup.New({
				id = var_27_2
			})

			if ShipIndexConst.filterByType(var_27_3, var_0_0.ShipIndex.typeIndex) and ShipIndexConst.filterByRarity(var_27_3, var_0_0.ShipIndex.rarityIndex) and ShipIndexConst.filterByCamp(var_27_3, var_0_0.ShipIndex.campIndex) then
				var_27_0[#var_27_0 + 1] = iter_27_3
			end
		end
	end

	arg_27_0.fliteList = var_27_0
end

function var_0_0.isMinPrefs(arg_28_0)
	return GroupHelper.GetGroupPrefsByName("PAINTING") == DMFileChecker.Prefs.Min
end

function var_0_0.isSelectedSSR(arg_29_0)
	local var_29_0 = false
	local var_29_1 = arg_29_0.prayProxy:getSelectedShipIDList()

	if var_29_1 and #var_29_1 > 0 then
		for iter_29_0, iter_29_1 in ipairs(var_29_1) do
			if pg.ship_data_statistics[iter_29_1].rarity == ShipRarity.SSR then
				var_29_0 = true

				break
			end
		end
	end

	return var_29_0
end

return var_0_0
