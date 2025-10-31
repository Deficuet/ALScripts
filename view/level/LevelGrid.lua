local var_0_0 = class("LevelGrid", import("..base.BasePanel"))
local var_0_1 = require("Mgr/Pool/PoolPlural")

var_0_0.MapDefaultPos = Vector3(420, -1000, -1000)

function var_0_0.init(arg_1_0)
	var_0_0.super.init(arg_1_0)

	arg_1_0.levelCam = GameObject.Find("LevelCamera"):GetComponent(typeof(Camera))
	GameObject.Find("LevelCamera/Canvas"):GetComponent(typeof(Canvas)).sortingOrder = ChapterConst.PriorityMin - 1
	arg_1_0.quadTws = {}
	arg_1_0.presentTws = {}
	arg_1_0.markTws = {}
	arg_1_0.tweens = {}
	arg_1_0.markQuads = {}
	arg_1_0.pools = {}
	arg_1_0.edgePools = {}
	arg_1_0.poolParent = GameObject.Find("__Pool__")
	arg_1_0.opBtns = {}
	arg_1_0.itemCells = {}
	arg_1_0.attachmentCells = {}
	arg_1_0.extraAttachmentCells = {}
	arg_1_0.weatherCells = {}
	arg_1_0.onShipStepChange = nil
	arg_1_0.onShipArrived = nil
	arg_1_0.lastSelectedId = -1
	arg_1_0.quadState = -1
	arg_1_0.subTeleportTargetLine = nil
	arg_1_0.missileStrikeTargetLine = nil
	arg_1_0.cellEdges = {}
	arg_1_0.walls = {}
	arg_1_0.material_Add = LoadAny("artresource/effect/common/material/add", "", typeof(Material))
	arg_1_0.loader = AutoLoader.New()
end

function var_0_0.ExtendItem(arg_2_0, arg_2_1, arg_2_2)
	if IsNil(arg_2_0[arg_2_1]) then
		arg_2_0[arg_2_1] = arg_2_2
	end
end

function var_0_0.getFleetPool(arg_3_0, arg_3_1)
	local var_3_0 = "fleet_" .. arg_3_1
	local var_3_1 = arg_3_0.pools[var_3_0]

	if not var_3_1 then
		local var_3_2 = arg_3_0.shipTpl

		if arg_3_1 == FleetType.Submarine then
			var_3_2 = arg_3_0.subTpl
		elseif arg_3_1 == FleetType.Transport then
			var_3_2 = arg_3_0.transportTpl
		end

		var_3_1 = var_0_1.New(var_3_2.gameObject, 2)
		arg_3_0.pools[var_3_0] = var_3_1
	end

	return var_3_1
end

function var_0_0.getChampionPool(arg_4_0, arg_4_1)
	local var_4_0 = "champion_" .. arg_4_1
	local var_4_1 = arg_4_0.pools[var_4_0]

	if not var_4_1 then
		local var_4_2 = arg_4_0.championTpl

		if arg_4_1 == ChapterConst.TemplateOni then
			var_4_2 = arg_4_0.oniTpl
		elseif arg_4_1 == ChapterConst.TemplateEnemy then
			var_4_2 = arg_4_0.enemyTpl
		end

		var_4_1 = var_0_1.New(var_4_2.gameObject, 3)
		arg_4_0.pools[var_4_0] = var_4_1
	end

	return var_4_1
end

function var_0_0.AddEdgePool(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
	if arg_5_0.edgePools[arg_5_1] then
		return
	end

	local var_5_0 = GameObject.New(arg_5_1)

	var_5_0:AddComponent(typeof(Image)).enabled = false
	arg_5_0.edgePools[arg_5_1] = var_0_1.New(var_5_0, 32)

	local var_5_1

	parallelAsync({
		function(arg_6_0)
			if not arg_5_3 then
				arg_6_0()

				return
			end

			arg_5_0.loader:LoadReference(arg_5_2, arg_5_3, typeof(Sprite), function(arg_7_0)
				var_5_1 = arg_7_0

				arg_6_0()
			end)
		end
	}, function()
		local function var_8_0(arg_9_0)
			local var_9_0 = go(arg_9_0):GetComponent(typeof(Image))

			var_9_0.enabled = true
			var_9_0.color = type(arg_5_4) == "table" and Color.New(unpack(arg_5_4)) or Color.white
			var_9_0.sprite = arg_5_3 and var_5_1 or nil
			var_9_0.material = arg_5_5 or nil
		end

		local var_8_1 = arg_5_0.edgePools[arg_5_1]

		if var_8_1.prefab then
			var_8_0(var_8_1.prefab)
		end

		if var_8_1.items then
			for iter_8_0, iter_8_1 in pairs(var_8_1.items) do
				var_8_0(iter_8_1)
			end
		end

		if arg_5_0.cellEdges[arg_5_1] and next(arg_5_0.cellEdges[arg_5_1]) then
			for iter_8_2, iter_8_3 in pairs(arg_5_0.cellEdges[arg_5_1]) do
				var_8_0(iter_8_3)
			end
		end
	end)
end

function var_0_0.GetEdgePool(arg_10_0, arg_10_1)
	assert(arg_10_1, "Missing Key")

	local var_10_0 = arg_10_0.edgePools[arg_10_1]

	assert(var_10_0, "Must Create Pool before Using")

	return var_10_0
end

function var_0_0.initAll(arg_11_0, arg_11_1)
	seriesAsync({
		function(arg_12_0)
			arg_11_0:initPlane()
			arg_11_0:initDrag()
			onNextTick(arg_12_0)
		end,
		function(arg_13_0)
			if arg_11_0.exited then
				return
			end

			arg_11_0:initTargetArrow()
			arg_11_0:InitDestinationMark()
			onNextTick(arg_13_0)
		end,
		function(arg_14_0)
			if arg_11_0.exited then
				return
			end

			for iter_14_0 = 0, ChapterConst.MaxRow - 1 do
				for iter_14_1 = 0, ChapterConst.MaxColumn - 1 do
					arg_11_0:initCell(iter_14_0, iter_14_1)
				end
			end

			arg_11_0:UpdateItemCells()
			arg_11_0:updateQuadCells(ChapterConst.QuadStateFrozen)
			onNextTick(arg_14_0)
		end,
		function(arg_15_0)
			if arg_11_0.exited then
				return
			end

			arg_11_0:AddEdgePool("SubmarineHunting", "ui/commonUI_atlas", "white_dot", {
				1,
				0,
				0
			}, arg_11_0.material_Add)
			arg_11_0:UpdateFloor()
			arg_11_0:updateAttachments()
			arg_11_0:InitWalls()
			arg_11_0:InitIdolsAnim()
			onNextTick(arg_15_0)
		end,
		function(arg_16_0)
			if arg_11_0.exited then
				return
			end

			parallelAsync({
				function(arg_17_0)
					arg_11_0:initFleets(arg_17_0)
				end,
				function(arg_18_0)
					arg_11_0:initChampions(arg_18_0)
				end
			}, arg_16_0)
		end,
		function()
			arg_11_0:OnChangeSubAutoAttack()
			arg_11_0:updateQuadCells(ChapterConst.QuadStateNormal)
			existCall(arg_11_1)
		end
	})
end

function var_0_0.clearAll(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.tweens) do
		LeanTween.cancel(iter_20_0)
	end

	table.clear(arg_20_0.tweens)
	arg_20_0.loader:Clear()

	if not IsNil(arg_20_0.cellRoot) then
		arg_20_0:clearFleets()
		arg_20_0:clearChampions()
		arg_20_0:clearTargetArrow()
		arg_20_0:ClearDestinationMark()
		arg_20_0:ClearIdolsAnim()

		for iter_20_2, iter_20_3 in pairs(arg_20_0.itemCells) do
			iter_20_3:Clear()
		end

		table.clear(arg_20_0.itemCells)

		for iter_20_4, iter_20_5 in pairs(arg_20_0.attachmentCells) do
			iter_20_5:Clear()
		end

		table.clear(arg_20_0.attachmentCells)

		for iter_20_6, iter_20_7 in pairs(arg_20_0.extraAttachmentCells) do
			iter_20_7:Clear()
		end

		table.clear(arg_20_0.extraAttachmentCells)

		for iter_20_8, iter_20_9 in pairs(arg_20_0.weatherCells) do
			iter_20_9:Clear()
		end

		table.clear(arg_20_0.weatherCells)

		for iter_20_10 = 0, ChapterConst.MaxRow - 1 do
			for iter_20_11 = 0, ChapterConst.MaxColumn - 1 do
				arg_20_0:clearCell(iter_20_10, iter_20_11)
			end
		end

		for iter_20_12, iter_20_13 in pairs(arg_20_0.walls) do
			iter_20_13:Clear()
		end

		table.clear(arg_20_0.walls)
		arg_20_0:clearPlane()
	end

	arg_20_0.material_Add = nil

	for iter_20_14, iter_20_15 in pairs(arg_20_0.edgePools) do
		iter_20_15:Clear()
	end

	arg_20_0.edgePools = nil

	for iter_20_16, iter_20_17 in pairs(arg_20_0.pools) do
		iter_20_17:ClearItems()
	end

	arg_20_0.pools = nil
	GetOrAddComponent(arg_20_0._tf, "EventTriggerListener").enabled = false

	if arg_20_0.dragTrigger then
		ClearEventTrigger(arg_20_0.dragTrigger)

		arg_20_0.dragTrigger = nil
	end

	LeanTween.cancel(arg_20_0._tf)
end

local var_0_2 = 640

function var_0_0.initDrag(arg_21_0)
	local var_21_0, var_21_1, var_21_2 = getSizeRate()
	local var_21_3 = arg_21_0.contextData.chapterVO
	local var_21_4 = var_21_3.theme
	local var_21_5 = var_21_2 * 0.5 / math.tan(math.deg2Rad * var_21_4.fov * 0.5)
	local var_21_6 = math.deg2Rad * var_21_4.angle
	local var_21_7 = Vector3(0, -math.sin(var_21_6), -math.cos(var_21_6))
	local var_21_8 = Vector3(var_21_4.offsetx, var_21_4.offsety, var_21_4.offsetz) + var_0_0.MapDefaultPos
	local var_21_9 = Vector3.Dot(var_21_7, var_21_8)
	local var_21_10 = var_21_0 * math.clamp((var_21_5 - var_21_9) / var_21_5, 0, 1)
	local var_21_11 = arg_21_0.plane:Find("display").anchoredPosition
	local var_21_12 = var_0_2 - var_21_8.x - var_21_11.x
	local var_21_13 = var_0_0.MapDefaultPos.y - var_21_8.y - var_21_11.y
	local var_21_14, var_21_15, var_21_16, var_21_17 = var_21_3:getDragExtend()

	arg_21_0.leftBound = var_21_12 - var_21_15
	arg_21_0.rightBound = var_21_12 + var_21_14
	arg_21_0.topBound = var_21_13 + var_21_17
	arg_21_0.bottomBound = var_21_13 - var_21_16
	arg_21_0._tf.sizeDelta = Vector2(var_21_1 * 2, var_21_2 * 2)
	arg_21_0.dragTrigger = GetOrAddComponent(arg_21_0._tf, "EventTriggerListener")
	arg_21_0.dragTrigger.enabled = true

	arg_21_0.dragTrigger:AddDragFunc(function(arg_22_0, arg_22_1)
		local var_22_0 = arg_21_0._tf.anchoredPosition

		var_22_0.x = math.clamp(var_22_0.x + arg_22_1.delta.x * var_21_10.x, arg_21_0.leftBound, arg_21_0.rightBound)
		var_22_0.y = math.clamp(var_22_0.y + arg_22_1.delta.y * var_21_10.y / math.cos(var_21_6), arg_21_0.bottomBound, arg_21_0.topBound)
		arg_21_0._tf.anchoredPosition = var_22_0
	end)
end

function var_0_0.initPlane(arg_23_0)
	local var_23_0 = arg_23_0.contextData.chapterVO
	local var_23_1 = var_23_0.theme

	arg_23_0.levelCam.fieldOfView = var_23_1.fov

	local var_23_2

	PoolMgr.GetInstance():GetPrefab("chapter/plane", "", false, function(arg_24_0)
		var_23_2 = arg_24_0.transform
	end)

	arg_23_0.plane = var_23_2
	var_23_2.name = ChapterConst.PlaneName

	var_23_2:SetParent(arg_23_0._tf, false)

	var_23_2.anchoredPosition3D = Vector3(var_23_1.offsetx, var_23_1.offsety, var_23_1.offsetz) + var_0_0.MapDefaultPos
	arg_23_0.cellRoot = var_23_2:Find("cells")
	arg_23_0.quadRoot = var_23_2:Find("quads")
	arg_23_0.bottomMarkRoot = var_23_2:Find("buttomMarks")
	arg_23_0.topMarkRoot = var_23_2:Find("topMarks")
	arg_23_0.restrictMap = var_23_2:Find("restrictMap")
	arg_23_0.UIFXList = var_23_2:Find("UI_FX_list")

	for iter_23_0 = 1, arg_23_0.UIFXList.childCount do
		local var_23_3 = arg_23_0.UIFXList:GetChild(iter_23_0 - 1)

		setActive(var_23_3, false)
	end

	local var_23_4 = arg_23_0.UIFXList:Find(var_23_0:getConfig("uifx"))

	if var_23_4 then
		setActive(var_23_4, true)
	end

	local var_23_5 = var_23_0:getConfig("chapter_fx")

	if type(var_23_5) == "table" then
		for iter_23_1, iter_23_2 in pairs(var_23_5) do
			if #iter_23_1 <= 0 then
				return
			end

			arg_23_0.loader:GetPrefab("effect/" .. iter_23_1, iter_23_1, function(arg_25_0)
				setParent(arg_25_0, arg_23_0.UIFXList)

				if iter_23_2.offset then
					tf(arg_25_0).localPosition = Vector3(unpack(iter_23_2.offset))
				end

				if iter_23_2.rotation then
					tf(arg_25_0).localRotation = Quaternion.Euler(unpack(iter_23_2.rotation))
				end
			end)
		end
	end

	local var_23_6 = var_23_2:Find("display")
	local var_23_7 = var_23_6:Find("mask/sea")

	GetImageSpriteFromAtlasAsync("chapter/pic/" .. var_23_1.assetSea, var_23_1.assetSea, var_23_7)

	arg_23_0.indexMin, arg_23_0.indexMax = var_23_0.indexMin, var_23_0.indexMax

	local var_23_8 = Vector2(arg_23_0.indexMin.y, ChapterConst.MaxRow * 0.5 - arg_23_0.indexMax.x - 1)
	local var_23_9 = Vector2(arg_23_0.indexMax.y - arg_23_0.indexMin.y + 1, arg_23_0.indexMax.x - arg_23_0.indexMin.x + 1)
	local var_23_10 = var_23_1.cellSize + var_23_1.cellSpace
	local var_23_11 = Vector2.Scale(var_23_8, var_23_10)
	local var_23_12 = Vector2.Scale(var_23_9, var_23_10)

	var_23_6.anchoredPosition = var_23_11 + var_23_12 * 0.5
	var_23_6.sizeDelta = var_23_12
	arg_23_0.restrictMap.anchoredPosition = var_23_11 + var_23_12 * 0.5
	arg_23_0.restrictMap.sizeDelta = var_23_12

	local var_23_13 = Vector2(math.floor(var_23_6.sizeDelta.x / var_23_10.x), math.floor(var_23_6.sizeDelta.y / var_23_10.y))
	local var_23_14 = var_23_6:Find("ABC")
	local var_23_15 = var_23_14:GetChild(0)
	local var_23_16 = var_23_14:GetComponent(typeof(GridLayoutGroup))

	var_23_16.cellSize = Vector2(var_23_1.cellSize.x, var_23_1.cellSize.y)
	var_23_16.spacing = Vector2(var_23_1.cellSpace.x, var_23_1.cellSpace.y)
	var_23_16.padding.left = var_23_1.cellSpace.x

	for iter_23_3 = var_23_14.childCount - 1, var_23_13.x, -1 do
		Destroy(var_23_14:GetChild(iter_23_3))
	end

	for iter_23_4 = var_23_14.childCount, var_23_13.x - 1 do
		Instantiate(var_23_15).transform:SetParent(var_23_14, false)
	end

	for iter_23_5 = 0, var_23_13.x - 1 do
		setText(var_23_14:GetChild(iter_23_5), string.char(string.byte("A") + iter_23_5))
	end

	local var_23_17 = var_23_6:Find("123")
	local var_23_18 = var_23_17:GetChild(0)
	local var_23_19 = var_23_17:GetComponent(typeof(GridLayoutGroup))

	var_23_19.cellSize = Vector2(var_23_1.cellSize.x, var_23_1.cellSize.y)
	var_23_19.spacing = Vector2(var_23_1.cellSpace.x, var_23_1.cellSpace.y)
	var_23_19.padding.top = var_23_1.cellSpace.y

	for iter_23_6 = var_23_17.childCount - 1, var_23_13.y, -1 do
		Destroy(var_23_17:GetChild(iter_23_6))
	end

	for iter_23_7 = var_23_17.childCount, var_23_13.y - 1 do
		Instantiate(var_23_18).transform:SetParent(var_23_17, false)
	end

	for iter_23_8 = 0, var_23_13.y - 1 do
		setText(var_23_17:GetChild(iter_23_8), 1 + iter_23_8)
	end

	local var_23_20 = var_23_6:Find("linev")
	local var_23_21 = var_23_20:GetChild(0)
	local var_23_22 = var_23_20:GetComponent(typeof(GridLayoutGroup))

	var_23_22.cellSize = Vector2(ChapterConst.LineCross, var_23_6.sizeDelta.y)
	var_23_22.spacing = Vector2(var_23_10.x - ChapterConst.LineCross, 0)
	var_23_22.padding.left = math.floor(var_23_22.spacing.x)

	for iter_23_9 = var_23_20.childCount - 1, math.max(var_23_13.x - 1, 0), -1 do
		if iter_23_9 > 0 then
			Destroy(var_23_20:GetChild(iter_23_9))
		end
	end

	for iter_23_10 = var_23_20.childCount, var_23_13.x - 2 do
		Instantiate(var_23_21).transform:SetParent(var_23_20, false)
	end

	local var_23_23 = var_23_6:Find("lineh")
	local var_23_24 = var_23_23:GetChild(0)
	local var_23_25 = var_23_23:GetComponent(typeof(GridLayoutGroup))

	var_23_25.cellSize = Vector2(var_23_6.sizeDelta.x, ChapterConst.LineCross)
	var_23_25.spacing = Vector2(0, var_23_10.y - ChapterConst.LineCross)
	var_23_25.padding.top = math.floor(var_23_25.spacing.y)

	for iter_23_11 = var_23_23.childCount - 1, math.max(var_23_13.y - 1, 0), -1 do
		if iter_23_11 > 0 then
			Destroy(var_23_23:GetChild(iter_23_11))
		end
	end

	for iter_23_12 = var_23_23.childCount, var_23_13.y - 2 do
		Instantiate(var_23_24).transform:SetParent(var_23_23, false)
	end

	local var_23_26 = GetOrAddComponent(var_23_6:Find("mask"), "RawImage")
	local var_23_27 = var_23_6:Find("seaBase/sea")

	if var_23_1.seaBase and var_23_1.seaBase ~= "" then
		setActive(var_23_27, true)
		GetImageSpriteFromAtlasAsync("chapter/pic/" .. var_23_1.seaBase, var_23_1.seaBase, var_23_27)

		var_23_26.enabled = true
		var_23_26.uvRect = UnityEngine.Rect.New(0, 0, 1, -1)
	else
		setActive(var_23_27, false)

		var_23_26.enabled = false
	end
end

function var_0_0.updatePoisonArea(arg_26_0)
	local var_26_0 = arg_26_0._tf:Find("plane/display/mask")
	local var_26_1 = GetOrAddComponent(var_26_0, "RawImage")

	if not var_26_1.enabled then
		return
	end

	var_26_1.texture = arg_26_0:getPoisonTex()
end

function var_0_0.getPoisonTex(arg_27_0)
	local var_27_0 = arg_27_0.contextData.chapterVO
	local var_27_1 = arg_27_0._tf:Find("plane/display")
	local var_27_2 = var_27_1.sizeDelta.x / var_27_1.sizeDelta.y
	local var_27_3 = 256
	local var_27_4 = math.floor(var_27_3 / var_27_2)
	local var_27_5

	if arg_27_0.preChapterId ~= var_27_0.id then
		var_27_5 = UnityEngine.Texture2D.New(var_27_3, var_27_4)
		arg_27_0.maskTexture = var_27_5
		arg_27_0.preChapterId = var_27_0.id
	else
		var_27_5 = arg_27_0.maskTexture
	end

	local var_27_6 = {}
	local var_27_7 = var_27_0:getPoisonArea(var_27_3 / var_27_1.sizeDelta.x)

	if arg_27_0.poisonRectDir == nil then
		var_27_6 = var_27_7
	else
		for iter_27_0, iter_27_1 in pairs(var_27_7) do
			if arg_27_0.poisonRectDir[iter_27_0] == nil then
				var_27_6[iter_27_0] = iter_27_1
			end
		end
	end

	local function var_27_8(arg_28_0)
		for iter_28_0 = arg_28_0.x, arg_28_0.w + arg_28_0.x do
			for iter_28_1 = arg_28_0.y, arg_28_0.h + arg_28_0.y do
				var_27_5:SetPixel(iter_28_0, iter_28_1, Color.New(1, 1, 1, 0))
			end
		end
	end

	for iter_27_2, iter_27_3 in pairs(var_27_6) do
		var_27_8(iter_27_3)
	end

	var_27_5:Apply()

	arg_27_0.poisonRectDir = var_27_7

	return var_27_5
end

function var_0_0.showFleetPoisonDamage(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_0.contextData.chapterVO.fleets[arg_29_1].id
	local var_29_1 = arg_29_0.cellFleets[var_29_0]

	if var_29_1 then
		var_29_1:showPoisonDamage(arg_29_2)
	end
end

function var_0_0.clearPlane(arg_30_0)
	arg_30_0:killQuadTws()
	arg_30_0:killPresentTws()
	arg_30_0:ClearEdges()
	arg_30_0:hideQuadMark()
	removeAllChildren(arg_30_0.cellRoot)
	removeAllChildren(arg_30_0.quadRoot)
	removeAllChildren(arg_30_0.bottomMarkRoot)
	removeAllChildren(arg_30_0.topMarkRoot)
	removeAllChildren(arg_30_0.restrictMap)

	arg_30_0.cellRoot = nil
	arg_30_0.quadRoot = nil
	arg_30_0.bottomMarkRoot = nil
	arg_30_0.topMarkRoot = nil
	arg_30_0.restrictMap = nil

	local var_30_0 = arg_30_0._tf:Find(ChapterConst.PlaneName)
	local var_30_1 = var_30_0:Find("display/seaBase/sea")

	clearImageSprite(var_30_1)
	pg.PoolMgr.GetInstance():ReturnPrefab("chapter/plane", "", var_30_0.gameObject)
end

function var_0_0.initFleets(arg_31_0, arg_31_1)
	if arg_31_0.cellFleets then
		existCall(arg_31_1)

		return
	end

	local var_31_0 = arg_31_0.contextData.chapterVO

	arg_31_0.cellFleets = {}

	table.ParallelIpairsAsync(var_31_0.fleets, function(arg_32_0, arg_32_1, arg_32_2)
		if arg_32_1:getFleetType() == FleetType.Support then
			return arg_32_2()
		end

		arg_31_0:InitFleetCell(arg_32_1.id, arg_32_2)
	end, arg_31_1)
end

function var_0_0.InitFleetCell(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = arg_33_0.contextData.chapterVO
	local var_33_1 = var_33_0:getFleetById(arg_33_1)

	if not var_33_1:isValid() then
		existCall(arg_33_2)

		return
	end

	local var_33_2
	local var_33_3 = arg_33_0:getFleetPool(var_33_1:getFleetType()):Dequeue()

	var_33_3.transform.localEulerAngles = Vector3(-var_33_0.theme.angle, 0, 0)

	setParent(var_33_3, arg_33_0.cellRoot, false)
	setActive(var_33_3, true)

	local var_33_4 = var_33_1:getFleetType()
	local var_33_5

	if var_33_4 == FleetType.Transport then
		var_33_5 = TransportCellView
	elseif var_33_4 == FleetType.Submarine then
		var_33_5 = SubCellView
	else
		var_33_5 = FleetCellView
	end

	local var_33_6 = var_33_5.New(var_33_3)

	var_33_6.fleetType = var_33_4

	if var_33_4 == FleetType.Normal or var_33_4 == FleetType.Submarine then
		var_33_6:SetAction(ChapterConst.ShipIdleAction)
	end

	var_33_6.tf.localPosition = var_33_0.theme:GetLinePosition(var_33_1.line.row, var_33_1.line.column)
	arg_33_0.cellFleets[arg_33_1] = var_33_6

	arg_33_0:RefreshFleetCell(arg_33_1, arg_33_2)
end

function var_0_0.RefreshFleetCells(arg_34_0, arg_34_1)
	if not arg_34_0.cellFleets then
		arg_34_0:initFleets(arg_34_1)

		return
	end

	local var_34_0 = arg_34_0.contextData.chapterVO
	local var_34_1 = {}

	for iter_34_0, iter_34_1 in pairs(arg_34_0.cellFleets) do
		if not var_34_0:getFleetById(iter_34_0) then
			table.insert(var_34_1, iter_34_0)
		end
	end

	for iter_34_2, iter_34_3 in pairs(var_34_1) do
		arg_34_0:ClearFleetCell(iter_34_3)
	end

	table.ParallelIpairsAsync(var_34_0.fleets, function(arg_35_0, arg_35_1, arg_35_2)
		if arg_35_1:getFleetType() == FleetType.Support then
			return arg_35_2()
		end

		if not arg_34_0.cellFleets[arg_35_1.id] then
			arg_34_0:InitFleetCell(arg_35_1.id, arg_35_2)
		else
			arg_34_0:RefreshFleetCell(arg_35_1.id, arg_35_2)
		end
	end, arg_34_1)
end

function var_0_0.RefreshFleetCell(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = arg_36_0.contextData.chapterVO
	local var_36_1 = var_36_0:getFleetById(arg_36_1)
	local var_36_2 = arg_36_0.cellFleets[arg_36_1]
	local var_36_3
	local var_36_4

	if var_36_1:isValid() then
		if var_36_1:getFleetType() == FleetType.Transport then
			var_36_3 = var_36_1:getPrefab()
		else
			local var_36_5 = var_36_0:getMapShip(var_36_1)

			if var_36_5 then
				var_36_3 = var_36_5:getPrefab()
				var_36_4 = var_36_5:getAttachmentPrefab()
			end
		end
	end

	if not var_36_3 then
		arg_36_0:ClearFleetCell(arg_36_1)
		existCall(arg_36_2)

		return
	end

	var_36_2.go.name = "cell_fleet_" .. var_36_3

	var_36_2:SetLine(var_36_1.line)

	if var_36_2.fleetType == FleetType.Transport then
		var_36_2:LoadIcon(var_36_3, function()
			var_36_2:GetRotatePivot().transform.localRotation = var_36_1.rotation

			arg_36_0:updateFleet(arg_36_1, arg_36_2)
		end)
	else
		var_36_2:LoadSpine(var_36_3, nil, var_36_4, function()
			var_36_2:GetRotatePivot().transform.localRotation = var_36_1.rotation

			arg_36_0:updateFleet(arg_36_1, arg_36_2)
		end)
	end
end

function var_0_0.clearFleets(arg_39_0)
	if arg_39_0.cellFleets then
		for iter_39_0, iter_39_1 in pairs(arg_39_0.cellFleets) do
			arg_39_0:ClearFleetCell(iter_39_0)
		end

		arg_39_0.cellFleets = nil
	end
end

function var_0_0.ClearFleetCell(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_0.cellFleets[arg_40_1]

	if not var_40_0 then
		return
	end

	var_40_0:Clear()
	LeanTween.cancel(var_40_0.go)
	setActive(var_40_0.go, false)
	setParent(var_40_0.go, arg_40_0.poolParent, false)
	arg_40_0:getFleetPool(var_40_0.fleetType):Enqueue(var_40_0.go, false)

	if arg_40_0.opBtns[arg_40_1] then
		Destroy(arg_40_0.opBtns[arg_40_1].gameObject)

		arg_40_0.opBtns[arg_40_1] = nil
	end

	arg_40_0.cellFleets[arg_40_1] = nil
end

function var_0_0.UpdateFleets(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0.contextData.chapterVO

	table.ParallelIpairsAsync(var_41_0.fleets, function(arg_42_0, arg_42_1, arg_42_2)
		if arg_42_1:getFleetType() == FleetType.Support then
			return arg_42_2()
		end

		arg_41_0:updateFleet(arg_42_1.id, arg_42_2)
	end, arg_41_1)
end

function var_0_0.updateFleet(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_0.contextData.chapterVO
	local var_43_1 = arg_43_0.cellFleets[arg_43_1]
	local var_43_2 = var_43_0:getFleetById(arg_43_1)

	if var_43_1 then
		local var_43_3 = var_43_2.line
		local var_43_4 = var_43_2:isValid()

		setActive(var_43_1.go, var_43_4)
		var_43_1:RefreshLinePosition(var_43_0, var_43_3)

		local var_43_5 = var_43_2:getFleetType()

		if var_43_5 == FleetType.Normal then
			local var_43_6 = var_43_0:GetEnemy(var_43_3.row, var_43_3.column)
			local var_43_7 = tobool(var_43_6)
			local var_43_8 = var_43_6 and var_43_6.attachment or nil
			local var_43_9 = var_43_0:existFleet(FleetType.Transport, var_43_3.row, var_43_3.column)

			var_43_1:SetSpineVisible(not var_43_7 and not var_43_9)

			local var_43_10 = table.indexof(var_43_0.fleets, var_43_2) == var_43_0.findex

			setActive(var_43_1.tfArrow, var_43_10)
			setActive(var_43_1.tfOp, false)

			local var_43_11 = arg_43_0.opBtns[arg_43_1]

			if not var_43_11 then
				var_43_11 = tf(Instantiate(var_43_1.tfOp))
				var_43_11.name = "op" .. arg_43_1

				var_43_11:SetParent(arg_43_0._tf, false)

				var_43_11.localEulerAngles = Vector3(-var_43_0.theme.angle, 0, 0)

				local var_43_12 = GetOrAddComponent(var_43_11, typeof(Canvas))

				GetOrAddComponent(go(var_43_11), typeof(GraphicRaycaster))

				var_43_12.overrideSorting = true
				var_43_12.sortingOrder = ChapterConst.PriorityMax
				arg_43_0.opBtns[arg_43_1] = var_43_11

				arg_43_0:UpdateOpBtns()
			end

			var_43_11.position = var_43_1.tfOp.position

			local var_43_13 = var_43_6 and ChapterConst.IsBossCell(var_43_6)
			local var_43_14 = false

			if var_43_7 and var_43_8 == ChapterConst.AttachChampion then
				local var_43_15 = var_43_0:getChampion(var_43_3.row, var_43_3.column):GetLastID()
				local var_43_16 = pg.expedition_data_template[var_43_15]

				if var_43_16 then
					var_43_14 = var_43_16.ai == ChapterConst.ExpeditionAILair
				end
			end

			var_43_13 = var_43_13 or var_43_14

			local var_43_17 = _.any(var_43_0.fleets, function(arg_44_0)
				return arg_44_0.id ~= var_43_2.id and arg_44_0:getFleetType() == FleetType.Normal and arg_44_0:isValid()
			end)
			local var_43_18 = var_43_10 and var_43_4 and var_43_7
			local var_43_19 = var_43_11:Find("retreat")

			setActive(var_43_19:Find("retreat"), var_43_18 and not var_43_13 and var_43_17)
			setActive(var_43_19:Find("escape"), var_43_18 and var_43_13)
			setActive(var_43_19, var_43_19:Find("retreat").gameObject.activeSelf or var_43_19:Find("escape").gameObject.activeSelf)

			if var_43_19.gameObject.activeSelf then
				onButton(arg_43_0, var_43_19, function()
					if arg_43_0.parent:isfrozen() then
						return
					end

					if var_43_13 then
						(function()
							local var_46_0 = {
								{
									1,
									0
								},
								{
									-1,
									0
								},
								{
									0,
									1
								},
								{
									0,
									-1
								}
							}

							for iter_46_0, iter_46_1 in ipairs(var_46_0) do
								if var_43_0:considerAsStayPoint(ChapterConst.SubjectPlayer, var_43_3.row + iter_46_1[1], var_43_3.column + iter_46_1[2]) and not var_43_0:existEnemy(ChapterConst.SubjectPlayer, var_43_3.row + iter_46_1[1], var_43_3.column + iter_46_1[2]) then
									arg_43_0:emit(LevelMediator2.ON_OP, {
										type = ChapterConst.OpMove,
										id = var_43_2.id,
										arg1 = var_43_3.row + iter_46_1[1],
										arg2 = var_43_3.column + iter_46_1[2],
										ordLine = var_43_2.line
									})

									return false
								end
							end

							pg.TipsMgr.GetInstance():ShowTips(i18n("no_way_to_escape"))

							return true
						end)()
					else
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n("levelScene_who_to_retreat", var_43_2.name),
							onYes = function()
								arg_43_0:emit(LevelMediator2.ON_OP, {
									type = ChapterConst.OpRetreat,
									id = var_43_2.id
								})
							end
						})
					end
				end, SFX_UI_WEIGHANCHOR_WITHDRAW)
			end

			local var_43_20 = var_43_11:Find("exchange")

			setActive(var_43_20, false)
			setActive(var_43_1.tfAmmo, not var_43_9)

			local var_43_21, var_43_22 = var_43_0:getFleetAmmo(var_43_2)
			local var_43_23 = var_43_22 .. "/" .. var_43_21

			if var_43_22 == 0 then
				var_43_23 = setColorStr(var_43_23, COLOR_RED)
			end

			setText(var_43_1.tfAmmoText, var_43_23)

			if var_43_7 or var_43_9 then
				local var_43_24 = var_43_0:getChampion(var_43_3.row, var_43_3.column)

				if var_43_7 and var_43_8 == ChapterConst.AttachChampion and var_43_24:getPoolType() == ChapterConst.TemplateChampion then
					var_43_1.tfArrow.anchoredPosition = Vector2(0, 180)
					var_43_1.tfAmmo.anchoredPosition = Vector2(60, 100)
				else
					var_43_1.tfArrow.anchoredPosition = Vector2(0, 100)
					var_43_1.tfAmmo.anchoredPosition = Vector2(22, 56)
				end

				var_43_1.tfAmmo:SetAsLastSibling()
			else
				var_43_1.tfArrow.anchoredPosition = Vector2(0, 175)
				var_43_1.tfAmmo.anchoredPosition = Vector2(-60, 85)
			end

			if var_43_1:GetSpineRole() and var_43_10 and arg_43_0.lastSelectedId ~= var_43_2.id then
				if not var_43_7 and not var_43_9 and arg_43_0.lastSelectedId ~= -1 then
					var_43_1:TweenShining()
				end

				arg_43_0.lastSelectedId = var_43_2.id
			end

			local var_43_25 = var_43_0:existBarrier(var_43_3.row, var_43_3.column)

			var_43_1:SetActiveNoPassIcon(var_43_25)

			local var_43_26 = table.contains(var_43_2:GetStatusStrategy(), ChapterConst.StrategyIntelligenceRecorded)

			var_43_1:UpdateIconRecordedFlag(var_43_26)
		elseif var_43_5 == FleetType.Submarine then
			local var_43_27 = var_43_0:existEnemy(ChapterConst.SubjectPlayer, var_43_3.row, var_43_3.column) or var_43_0:existAlly(var_43_2)
			local var_43_28 = var_43_0.subAutoAttack == 1

			var_43_1:SetActiveModel(not var_43_27 and var_43_28)
			setActive(var_43_1.tfAmmo, not var_43_27)

			local var_43_29, var_43_30 = var_43_0:getFleetAmmo(var_43_2)
			local var_43_31 = var_43_30 .. "/" .. var_43_29

			if var_43_30 == 0 then
				var_43_31 = setColorStr(var_43_31, COLOR_RED)
			end

			setText(var_43_1.tfAmmoText, var_43_31)
		elseif var_43_5 == FleetType.Transport then
			setText(var_43_1.tfHpText, var_43_2:getRestHp() .. "/" .. var_43_2:getTotalHp())

			local var_43_32 = var_43_0:existEnemy(ChapterConst.SubjectPlayer, var_43_3.row, var_43_3.column)

			GetImageSpriteFromAtlasAsync("enemies/" .. var_43_2:getPrefab(), "", var_43_1.tfIcon, true)
			setActive(var_43_1.tfFighting, var_43_32)
		end
	end

	existCall(arg_43_2)
end

function var_0_0.UpdateOpBtns(arg_48_0)
	table.Foreach(arg_48_0.opBtns, function(arg_49_0, arg_49_1)
		setActive(arg_49_1, arg_48_0.quadState == ChapterConst.QuadStateNormal)
	end)
end

function var_0_0.GetCellFleet(arg_50_0, arg_50_1)
	return arg_50_0.cellFleets[arg_50_1]
end

function var_0_0.initTargetArrow(arg_51_0)
	local var_51_0 = arg_51_0.contextData.chapterVO

	arg_51_0.arrowTarget = cloneTplTo(arg_51_0.arrowTpl, arg_51_0._tf)

	local var_51_1 = arg_51_0.arrowTarget

	pg.ViewUtils.SetLayer(tf(var_51_1), Layer.UI)

	GetOrAddComponent(var_51_1, typeof(Canvas)).overrideSorting = true
	arg_51_0.arrowTarget.localEulerAngles = Vector3(-var_51_0.theme.angle, 0, 0)

	setActive(arg_51_0.arrowTarget, false)
end

function var_0_0.updateTargetArrow(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_0.contextData.chapterVO
	local var_52_1 = ChapterCell.Line2Name(arg_52_1.row, arg_52_1.column)
	local var_52_2 = arg_52_0.cellRoot:Find(var_52_1)

	arg_52_0.arrowTarget:SetParent(var_52_2)

	local var_52_3, var_52_4 = (function()
		local var_53_0, var_53_1 = var_52_0:existEnemy(ChapterConst.SubjectPlayer, arg_52_1.row, arg_52_1.column)

		if not var_53_0 then
			return false
		end

		if var_53_1 == ChapterConst.AttachChampion then
			local var_53_2 = var_52_0:getChampion(arg_52_1.row, arg_52_1.column)

			if not var_53_2 then
				return false
			end

			return var_53_2:getPoolType() == "common", var_53_2:getScale() / 100
		elseif ChapterConst.IsEnemyAttach(var_53_1) then
			local var_53_3 = var_52_0:getChapterCell(arg_52_1.row, arg_52_1.column)

			if not var_53_3 or var_53_3.flag ~= ChapterConst.CellFlagActive then
				return false
			end

			local var_53_4 = pg.expedition_data_template[var_53_3.attachmentId]

			return var_53_4.icon_type == 2, var_53_4.scale / 100
		end
	end)()

	if var_52_3 then
		arg_52_0.arrowTarget.localPosition = Vector3(0, 20 + 80 * var_52_4, -80 * var_52_4)
	else
		arg_52_0.arrowTarget.localPosition = Vector3(0, 20, 0)
	end

	local var_52_5 = arg_52_0.arrowTarget:GetComponent(typeof(Canvas))

	if var_52_5 then
		var_52_5.sortingOrder = arg_52_1.row * ChapterConst.PriorityPerRow + ChapterConst.CellPriorityTopMark
	end
end

function var_0_0.clearTargetArrow(arg_54_0)
	if not IsNil(arg_54_0.arrowTarget) then
		Destroy(arg_54_0.arrowTarget)

		arg_54_0.arrowTarget = nil
	end
end

function var_0_0.InitDestinationMark(arg_55_0)
	local var_55_0 = cloneTplTo(arg_55_0.destinationMarkTpl, arg_55_0._tf)

	pg.ViewUtils.SetLayer(tf(var_55_0), Layer.UI)

	GetOrAddComponent(var_55_0, typeof(Canvas)).overrideSorting = true

	setActive(var_55_0, false)

	local var_55_1 = arg_55_0.contextData.chapterVO

	tf(var_55_0).localEulerAngles = Vector3(-var_55_1.theme.angle, 0, 0)
	arg_55_0.destinationMark = tf(var_55_0)
end

function var_0_0.UpdateDestinationMark(arg_56_0, arg_56_1)
	if not arg_56_1 then
		arg_56_0.destinationMark:SetParent(arg_56_0._tf)
		setActive(go(arg_56_0.destinationMark), false)

		return
	end

	setActive(go(arg_56_0.destinationMark), true)

	local var_56_0 = ChapterCell.Line2Name(arg_56_1.row, arg_56_1.column)
	local var_56_1 = arg_56_0.cellRoot:Find(var_56_0)

	arg_56_0.destinationMark:SetParent(var_56_1)

	arg_56_0.destinationMark.localPosition = Vector3(0, 40, -40)

	local var_56_2 = arg_56_0.destinationMark:GetComponent(typeof(Canvas))

	if var_56_2 then
		var_56_2.sortingOrder = arg_56_1.row * ChapterConst.PriorityPerRow + ChapterConst.CellPriorityTopMark
	end
end

function var_0_0.ClearDestinationMark(arg_57_0)
	if not IsNil(arg_57_0.destinationMark) then
		Destroy(arg_57_0.destinationMark)

		arg_57_0.destinationMark = nil
	end
end

function var_0_0.initChampions(arg_58_0, arg_58_1)
	if arg_58_0.cellChampions then
		existCall(arg_58_1)

		return
	end

	arg_58_0.cellChampions = {}

	local var_58_0 = arg_58_0.contextData.chapterVO

	table.ParallelIpairsAsync(var_58_0.champions, function(arg_59_0, arg_59_1, arg_59_2)
		arg_58_0.cellChampions[arg_59_0] = false

		if arg_59_1.flag ~= ChapterConst.CellFlagDisabled then
			arg_58_0:InitChampion(arg_59_0, arg_59_2)
		else
			arg_59_2()
		end
	end, arg_58_1)
end

function var_0_0.InitChampion(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = arg_60_0.contextData.chapterVO
	local var_60_1 = var_60_0.champions[arg_60_1]
	local var_60_2 = var_60_1:getPoolType()
	local var_60_3 = arg_60_0:getChampionPool(var_60_2):Dequeue()

	var_60_3.name = "cell_champion_" .. var_60_1:getPrefab()
	var_60_3.transform.localEulerAngles = Vector3(-var_60_0.theme.angle, 0, 0)

	setParent(var_60_3, arg_60_0.cellRoot, false)
	setActive(var_60_3, true)

	local var_60_4

	if var_60_2 == ChapterConst.TemplateChampion then
		var_60_4 = DynamicChampionCellView
	elseif var_60_2 == ChapterConst.TemplateEnemy then
		var_60_4 = DynamicEggCellView
	elseif var_60_2 == ChapterConst.TemplateOni then
		var_60_4 = OniCellView
	end

	local var_60_5 = var_60_4.New(var_60_3)

	arg_60_0.cellChampions[arg_60_1] = var_60_5

	var_60_5:SetLine({
		row = var_60_1.row,
		column = var_60_1.column
	})
	var_60_5:SetPoolType(var_60_2)

	if var_60_5.GetRotatePivot then
		tf(var_60_5:GetRotatePivot()).localRotation = var_60_1.rotation
	end

	if var_60_2 == ChapterConst.TemplateChampion then
		var_60_5:SetAction(ChapterConst.ShipIdleAction)

		if var_60_1.flag == ChapterConst.CellFlagDiving then
			var_60_5:SetAction(ChapterConst.ShipSwimAction)
		end

		var_60_5:LoadSpine(var_60_1:getPrefab(), var_60_1:getScale(), var_60_1:getConfig("effect_prefab"), function()
			arg_60_0:updateChampion(arg_60_1, arg_60_2)
		end)
	elseif var_60_2 == ChapterConst.TemplateEnemy then
		var_60_5:LoadIcon(var_60_1:getPrefab(), var_60_1:getConfigTable(), function()
			arg_60_0:updateChampion(arg_60_1, arg_60_2)
		end)
	elseif var_60_2 == ChapterConst.TemplateOni then
		arg_60_0:updateChampion(arg_60_1, arg_60_2)
	end
end

function var_0_0.updateChampions(arg_63_0, arg_63_1)
	table.ParallelIpairsAsync(arg_63_0.cellChampions, function(arg_64_0, arg_64_1, arg_64_2)
		arg_63_0:updateChampion(arg_64_0, arg_64_2)
	end, arg_63_1)
end

function var_0_0.updateChampion(arg_65_0, arg_65_1, arg_65_2)
	local var_65_0 = arg_65_0.contextData.chapterVO
	local var_65_1 = arg_65_0.cellChampions[arg_65_1]
	local var_65_2 = var_65_0.champions[arg_65_1]

	if var_65_1 and var_65_2 then
		var_65_1:UpdateChampionCell(var_65_0, var_65_2, arg_65_2)
	end
end

function var_0_0.updateOni(arg_66_0)
	local var_66_0 = arg_66_0.contextData.chapterVO
	local var_66_1

	for iter_66_0, iter_66_1 in ipairs(var_66_0.champions) do
		if iter_66_1.attachment == ChapterConst.AttachOni then
			var_66_1 = iter_66_0

			break
		end
	end

	if var_66_1 then
		arg_66_0:updateChampion(var_66_1)
	end
end

function var_0_0.clearChampions(arg_67_0)
	if arg_67_0.cellChampions then
		for iter_67_0, iter_67_1 in ipairs(arg_67_0.cellChampions) do
			if iter_67_1 then
				iter_67_1:Clear()
				LeanTween.cancel(iter_67_1.go)
				setActive(iter_67_1.go, false)
				setParent(iter_67_1.go, arg_67_0.poolParent, false)
				arg_67_0:getChampionPool(iter_67_1:GetPoolType()):Enqueue(iter_67_1.go, false)
			end
		end

		arg_67_0.cellChampions = nil
	end
end

function var_0_0.initCell(arg_68_0, arg_68_1, arg_68_2)
	local var_68_0 = arg_68_0.contextData.chapterVO
	local var_68_1 = var_68_0:getChapterCell(arg_68_1, arg_68_2)

	if var_68_1 then
		local var_68_2 = var_68_0.theme.cellSize
		local var_68_3 = ChapterCell.Line2QuadName(arg_68_1, arg_68_2)
		local var_68_4

		if var_68_1:IsWalkable() then
			PoolMgr.GetInstance():GetPrefab("chapter/cell_quad", "", false, function(arg_69_0)
				var_68_4 = arg_69_0.transform
			end)

			var_68_4.name = var_68_3

			var_68_4:SetParent(arg_68_0.quadRoot, false)

			var_68_4.sizeDelta = var_68_2
			var_68_4.anchoredPosition = var_68_0.theme:GetLinePosition(arg_68_1, arg_68_2)

			var_68_4:SetAsLastSibling()
			onButton(arg_68_0, var_68_4, function()
				if arg_68_0:isfrozen() then
					return
				end

				arg_68_0:ClickGridCell(var_68_1)
			end, SFX_CONFIRM)
		end

		local var_68_5 = ChapterCell.Line2Name(arg_68_1, arg_68_2)
		local var_68_6

		PoolMgr.GetInstance():GetPrefab("chapter/cell", "", false, function(arg_71_0)
			var_68_6 = arg_71_0.transform
		end)

		var_68_6.name = var_68_5

		var_68_6:SetParent(arg_68_0.cellRoot, false)

		var_68_6.sizeDelta = var_68_2
		var_68_6.anchoredPosition = var_68_0.theme:GetLinePosition(arg_68_1, arg_68_2)

		var_68_6:SetAsLastSibling()

		local var_68_7 = var_68_6:Find(ChapterConst.ChildItem)

		var_68_7.localEulerAngles = Vector3(-var_68_0.theme.angle, 0, 0)

		setActive(var_68_7, var_68_1.item)

		local var_68_8 = ItemCell.New(var_68_7, arg_68_1, arg_68_2)

		arg_68_0.itemCells[ChapterCell.Line2Name(arg_68_1, arg_68_2)] = var_68_8
		var_68_8.loader = arg_68_0.loader

		var_68_8:Init(var_68_1)

		var_68_6:Find(ChapterConst.ChildAttachment).localEulerAngles = Vector3(-var_68_0.theme.angle, 0, 0)
	end
end

function var_0_0.clearCell(arg_72_0, arg_72_1, arg_72_2)
	local var_72_0 = ChapterCell.Line2Name(arg_72_1, arg_72_2)
	local var_72_1 = ChapterCell.Line2QuadName(arg_72_1, arg_72_2)
	local var_72_2 = arg_72_0.cellRoot:Find(var_72_0)
	local var_72_3 = arg_72_0.quadRoot:Find(var_72_1)

	if not IsNil(var_72_2) then
		PoolMgr.GetInstance():ReturnPrefab("chapter/cell", "", var_72_2.gameObject)
	end

	if not IsNil(var_72_3) then
		if arg_72_0.quadTws[var_72_1] then
			LeanTween.cancel(arg_72_0.quadTws[var_72_1].uniqueId)

			arg_72_0.quadTws[var_72_1] = nil
		end

		local var_72_4 = var_72_3:Find("grid"):GetComponent(typeof(Image))

		var_72_4.sprite = GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_grid")
		var_72_4.material = nil

		PoolMgr.GetInstance():ReturnPrefab("chapter/cell_quad", "", var_72_3.gameObject)
	end
end

function var_0_0.UpdateItemCells(arg_73_0)
	local var_73_0 = arg_73_0.contextData.chapterVO

	if not var_73_0 then
		return
	end

	for iter_73_0, iter_73_1 in pairs(arg_73_0.itemCells) do
		local var_73_1 = iter_73_1:GetOriginalInfo()
		local var_73_2 = var_73_1 and var_73_1.item
		local var_73_3 = ItemCell.TransformItemAsset(var_73_0, var_73_2)

		iter_73_1:UpdateAsset(var_73_3)
	end
end

function var_0_0.updateAttachments(arg_74_0)
	for iter_74_0 = 0, ChapterConst.MaxRow - 1 do
		for iter_74_1 = 0, ChapterConst.MaxColumn - 1 do
			arg_74_0:updateAttachment(iter_74_0, iter_74_1)
		end
	end

	arg_74_0:updateExtraAttachments()
	arg_74_0:updateCoastalGunAttachArea()
	arg_74_0:displayEscapeGrid()
end

function var_0_0.UpdateFloor(arg_75_0)
	local var_75_0 = arg_75_0.contextData.chapterVO
	local var_75_1 = var_75_0.cells
	local var_75_2 = {}

	for iter_75_0, iter_75_1 in pairs(var_75_1) do
		local var_75_3 = iter_75_1:GetFlagList()

		for iter_75_2, iter_75_3 in pairs(var_75_3) do
			var_75_2[iter_75_3] = var_75_2[iter_75_3] or {}

			table.insert(var_75_2[iter_75_3], iter_75_1)
		end
	end

	if var_75_2[ChapterConst.FlagBanaiAirStrike] and next(var_75_2[ChapterConst.FlagBanaiAirStrike]) then
		arg_75_0:hideQuadMark(ChapterConst.MarkBanaiAirStrike)
		arg_75_0:showQuadMark(var_75_2[ChapterConst.FlagBanaiAirStrike], ChapterConst.MarkBanaiAirStrike, "cell_coastal_gun", Vector2(110, 110), nil, true)
	end

	arg_75_0:updatePoisonArea()

	if var_75_2[ChapterConst.FlagLava] and next(var_75_2[ChapterConst.FlagLava]) then
		arg_75_0:hideQuadMark(ChapterConst.MarkLava)
		arg_75_0:showQuadMark(var_75_2[ChapterConst.FlagLava], ChapterConst.MarkLava, "cell_lava", Vector2(110, 110), nil, true)
	end

	if var_75_2[ChapterConst.FlagNightmare] and next(var_75_2[ChapterConst.FlagNightmare]) then
		arg_75_0:hideQuadMark(ChapterConst.MarkNightMare)
		arg_75_0:hideQuadMark(ChapterConst.MarkHideNight)

		local var_75_4 = var_75_0:getExtraFlags()[1]

		if var_75_4 == ChapterConst.StatusDay then
			arg_75_0:showQuadMark(var_75_2[ChapterConst.FlagNightmare], ChapterConst.MarkHideNight, "cell_hidden_nightmare", Vector2(110, 110), nil, true)
		elseif var_75_4 == ChapterConst.StatusNight then
			arg_75_0:showQuadMark(var_75_2[ChapterConst.FlagNightmare], ChapterConst.MarkNightMare, "cell_nightmare", Vector2(110, 110), nil, true)
		end
	end

	local var_75_5 = {}

	for iter_75_4, iter_75_5 in pairs(var_75_0:GetChapterCellAttachemnts()) do
		if iter_75_5.data == ChapterConst.StoryTrigger then
			local var_75_6 = pg.map_event_template[iter_75_5.attachmentId]

			assert(var_75_6, "map_event_template not exists " .. iter_75_5.attachmentId)

			if var_75_6 and var_75_6.c_type == ChapterConst.EvtType_AdditionalFloor then
				var_75_5[var_75_6.icon] = var_75_5[var_75_6.icon] or {}

				table.insert(var_75_5[var_75_6.icon], iter_75_5)
			end
		end
	end

	for iter_75_6, iter_75_7 in pairs(var_75_5) do
		arg_75_0:hideQuadMark(iter_75_6)
		arg_75_0:showQuadMark(iter_75_7, iter_75_6, iter_75_6, Vector2(110, 110), nil, true)
	end

	local var_75_7 = var_75_0:getConfig("alarm_cell")

	if var_75_7 and #var_75_7 > 0 then
		local var_75_8 = var_75_7[3]

		arg_75_0:ClearEdges(var_75_8)
		arg_75_0:ClearEdges(var_75_8 .. "corner")
		arg_75_0:AddEdgePool(var_75_8, "chapter/celltexture/" .. var_75_8, "")
		arg_75_0:AddEdgePool(var_75_8 .. "_corner", "chapter/celltexture/" .. var_75_8 .. "_corner", "")

		local var_75_9 = _.map(var_75_7[1], function(arg_76_0)
			return {
				row = arg_76_0[1],
				column = arg_76_0[2]
			}
		end)

		arg_75_0:AddOutlines(var_75_9, nil, var_75_7[5], var_75_7[4], var_75_8)

		local var_75_10 = var_75_7[2]

		arg_75_0:hideQuadMark(var_75_10)
		arg_75_0:showQuadMark(var_75_9, var_75_10, var_75_10, Vector2(104, 104), nil, true)
	end

	arg_75_0:HideMissileAimingMarks()

	if var_75_2[ChapterConst.FlagMissleAiming] and next(var_75_2[ChapterConst.FlagMissleAiming]) then
		arg_75_0:ShowMissileAimingMarks(var_75_2[ChapterConst.FlagMissleAiming])
	end

	arg_75_0:UpdateWeatherCells()

	local var_75_11 = var_75_0.fleet

	if var_75_0:isPlayingWithBombEnemy() then
		local var_75_12 = _.map({
			{
				-1,
				0
			},
			{
				1,
				0
			},
			{
				0,
				-1
			},
			{
				0,
				1
			}
		}, function(arg_77_0)
			return {
				row = arg_77_0[1] + var_75_11.line.row,
				column = arg_77_0[2] + var_75_11.line.column
			}
		end)

		arg_75_0:showQuadMark(var_75_12, ChapterConst.MarkBomb, "cell_bomb", Vector2(100, 100), nil, true)
	end
end

function var_0_0.updateExtraAttachments(arg_78_0)
	local var_78_0 = arg_78_0.contextData.chapterVO
	local var_78_1 = var_78_0:GetChapterCellAttachemnts()

	for iter_78_0, iter_78_1 in pairs(var_78_1) do
		local var_78_2 = iter_78_1.row
		local var_78_3 = iter_78_1.column
		local var_78_4 = arg_78_0.cellRoot:Find(iter_78_0):Find(ChapterConst.ChildAttachment)
		local var_78_5 = pg.map_event_template[iter_78_1.attachmentId]
		local var_78_6 = iter_78_1.data
		local var_78_7

		if var_78_6 == ChapterConst.StoryTrigger and var_78_5.c_type ~= ChapterConst.EvtType_AdditionalFloor then
			var_78_7 = MapEventStoryTriggerCellView
		end

		local var_78_8 = arg_78_0.extraAttachmentCells[iter_78_0]

		if var_78_8 and var_78_8.class ~= var_78_7 then
			var_78_8:Clear()

			var_78_8 = nil
			arg_78_0.extraAttachmentCells[iter_78_0] = nil
		end

		if var_78_7 then
			if not var_78_8 then
				var_78_8 = var_78_7.New(var_78_4)
				arg_78_0.extraAttachmentCells[iter_78_0] = var_78_8
			end

			var_78_8.info = iter_78_1
			var_78_8.chapter = var_78_0

			var_78_8:SetLine({
				row = var_78_2,
				column = var_78_3
			})
			var_78_8:Update()
		end
	end
end

function var_0_0.updateAttachment(arg_79_0, arg_79_1, arg_79_2)
	local var_79_0 = arg_79_0.contextData.chapterVO
	local var_79_1 = var_79_0:getChapterCell(arg_79_1, arg_79_2)

	if not var_79_1 then
		return
	end

	local var_79_2 = ChapterCell.Line2Name(arg_79_1, arg_79_2)
	local var_79_3 = arg_79_0.cellRoot:Find(var_79_2):Find(ChapterConst.ChildAttachment)
	local var_79_4
	local var_79_5 = {}

	if ChapterConst.IsEnemyAttach(var_79_1.attachment) then
		local var_79_6 = pg.expedition_data_template[var_79_1.attachmentId]

		assert(var_79_6, "expedition_data_template not exist: " .. var_79_1.attachmentId)

		if var_79_1.flag == ChapterConst.CellFlagDisabled then
			if var_79_1.attachment ~= ChapterConst.AttachAmbush then
				var_79_4 = EnemyDeadCellView
				var_79_5.chapter = var_79_0
				var_79_5.config = var_79_6
			end
		elseif var_79_1.flag == ChapterConst.CellFlagActive then
			var_79_4 = var_79_6.icon_type == 1 and StaticEggCellView or StaticChampionCellView
			var_79_5.config = var_79_6
			var_79_5.chapter = var_79_0
			var_79_5.viewParent = arg_79_0
		end
	elseif var_79_1.attachment == ChapterConst.AttachBox then
		var_79_4 = AttachmentBoxCell
	elseif var_79_1.attachment == ChapterConst.AttachSupply then
		var_79_4 = AttachmentSupplyCell
	elseif var_79_1.attachment == ChapterConst.AttachTransport_Target then
		var_79_4 = AttachmentTransportTargetCell
	elseif var_79_1.attachment == ChapterConst.AttachStory then
		if var_79_1.data == ChapterConst.Story then
			var_79_4 = MapEventStoryCellView
		elseif var_79_1.data == ChapterConst.StoryObstacle then
			var_79_4 = MapEventStoryObstacleCellView
			var_79_5.chapter = var_79_0
		end
	elseif var_79_1.attachment == ChapterConst.AttachBomb_Enemy then
		var_79_4 = AttachmentBombEnemyCell
	elseif var_79_1.attachment == ChapterConst.AttachLandbase then
		local var_79_7 = pg.land_based_template[var_79_1.attachmentId]

		assert(var_79_7, "land_based_template not exist: " .. var_79_1.attachmentId)

		if var_79_7.type == ChapterConst.LBCoastalGun then
			var_79_4 = AttachmentLBCoastalGunCell
		elseif var_79_7.type == ChapterConst.LBHarbor then
			var_79_4 = AttachmentLBHarborCell
		elseif var_79_7.type == ChapterConst.LBDock then
			var_79_4 = AttachmentLBDockCell
			var_79_5.chapter = var_79_0
		elseif var_79_7.type == ChapterConst.LBAntiAir then
			var_79_4 = AttachmentLBAntiAirCell
			var_79_5.info = var_79_1
			var_79_5.chapter = var_79_0
			var_79_5.grid = arg_79_0
		elseif var_79_7.type == ChapterConst.LBIdle and var_79_1.attachmentId == ChapterConst.LBIDAirport then
			var_79_4 = AttachmentLBAirport
			var_79_5.extraFlagList = var_79_0:getExtraFlags()
		end
	elseif var_79_1.attachment == ChapterConst.AttachBarrier then
		var_79_4 = AttachmentBarrierCell
	elseif var_79_1.attachment == ChapterConst.AttachNone then
		var_79_5.fadeAnim = (function()
			local var_80_0 = arg_79_0.attachmentCells[var_79_2]

			if not var_80_0 then
				return
			end

			if var_80_0.class ~= StaticEggCellView and var_80_0.class ~= StaticChampionCellView then
				return
			end

			local var_80_1 = var_80_0.info

			if not var_80_1 then
				return
			end

			return pg.expedition_data_template[var_80_1.attachmentId].dungeon_id == 0
		end)()
	end

	if var_79_5.fadeAnim then
		arg_79_0:PlayAttachmentEffect(arg_79_1, arg_79_2, "miwuxiaosan")
	end

	local var_79_8 = arg_79_0.attachmentCells[var_79_2]

	if var_79_8 and var_79_8.class ~= var_79_4 then
		var_79_8:Clear()

		var_79_8 = nil
		arg_79_0.attachmentCells[var_79_2] = nil
	end

	if var_79_4 then
		if not var_79_8 then
			var_79_8 = var_79_4.New(var_79_3)

			var_79_8:SetLine({
				row = arg_79_1,
				column = arg_79_2
			})

			arg_79_0.attachmentCells[var_79_2] = var_79_8
		end

		var_79_8.info = var_79_1

		for iter_79_0, iter_79_1 in pairs(var_79_5) do
			var_79_8[iter_79_0] = iter_79_1
		end

		var_79_8:Update()
	end
end

function var_0_0.InitWalls(arg_81_0)
	local var_81_0 = arg_81_0.contextData.chapterVO

	for iter_81_0 = arg_81_0.indexMin.x, arg_81_0.indexMax.x do
		for iter_81_1 = arg_81_0.indexMin.y, arg_81_0.indexMax.y do
			local var_81_1 = var_81_0:GetRawChapterCell(iter_81_0, iter_81_1)

			if var_81_1 then
				local var_81_2 = ChapterConst.ForbiddenUp

				while var_81_2 > 0 do
					arg_81_0:InitWallDirection(var_81_1, var_81_2)

					var_81_2 = var_81_2 / 2
				end
			end
		end
	end

	for iter_81_2, iter_81_3 in pairs(arg_81_0.walls) do
		if iter_81_3.WallPrefabs then
			iter_81_3:SetAsset(iter_81_3.WallPrefabs[5 - iter_81_3.BanCount])
		end
	end
end

local var_0_3 = {
	[ChapterConst.ForbiddenUp] = {
		-1,
		0
	},
	[ChapterConst.ForbiddenDown] = {
		1,
		0
	},
	[ChapterConst.ForbiddenLeft] = {
		0,
		-1
	},
	[ChapterConst.ForbiddenRight] = {
		0,
		1
	}
}

function var_0_0.InitWallDirection(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0 = arg_82_0.contextData.chapterVO

	if bit.band(arg_82_1.forbiddenDirections, arg_82_2) == 0 then
		return
	end

	if arg_82_1.walkable == false then
		return
	end

	local var_82_1 = var_0_3[arg_82_2]
	local var_82_2 = 2 * arg_82_1.row + var_82_1[1]
	local var_82_3 = 2 * arg_82_1.column + var_82_1[2]
	local var_82_4 = var_82_0:GetRawChapterCell(arg_82_1.row + var_82_1[1], arg_82_1.column + var_82_1[2])
	local var_82_5 = not var_82_4 or var_82_4.walkable == false
	local var_82_6 = var_82_2 .. "_" .. var_82_3
	local var_82_7 = arg_82_0.walls[var_82_6]

	if not var_82_7 then
		local var_82_8 = var_82_0.theme:GetLinePosition(arg_82_1.row, arg_82_1.column)

		var_82_8.x = var_82_8.x + var_82_1[2] * (var_82_0.theme.cellSize.x + var_82_0.theme.cellSpace.x) * 0.5
		var_82_8.y = var_82_8.y - var_82_1[1] * (var_82_0.theme.cellSize.y + var_82_0.theme.cellSpace.y) * 0.5

		local var_82_9 = WallCell.New(var_82_2, var_82_3, bit.band(arg_82_2, ChapterConst.ForbiddenRow) > 0, var_82_8)

		var_82_9.girdParent = arg_82_0
		arg_82_0.walls[var_82_6] = var_82_9
		var_82_7 = var_82_9

		local var_82_10 = var_82_0.wallAssets[arg_82_1.row .. "_" .. arg_82_1.column]

		if var_82_10 then
			var_82_7.WallPrefabs = var_82_10
		end
	end

	var_82_7.BanCount = var_82_7.BanCount + (var_82_5 and 2 or 1)
end

function var_0_0.UpdateWeatherCells(arg_83_0)
	local var_83_0 = arg_83_0.contextData.chapterVO

	for iter_83_0, iter_83_1 in pairs(var_83_0.cells) do
		local var_83_1
		local var_83_2 = iter_83_1:GetWeatherFlagList()

		if #var_83_2 > 0 then
			var_83_1 = MapWeatherCellView
		end

		local var_83_3 = arg_83_0.weatherCells[iter_83_0]

		if var_83_3 and var_83_3.class ~= var_83_1 then
			var_83_3:Clear()

			var_83_3 = nil
			arg_83_0.weatherCells[iter_83_0] = nil
		end

		if var_83_1 then
			if not var_83_3 then
				local var_83_4 = arg_83_0.cellRoot:Find(iter_83_0):Find(ChapterConst.ChildAttachment)

				var_83_3 = var_83_1.New(var_83_4)

				var_83_3:SetLine({
					row = iter_83_1.row,
					column = iter_83_1.column
				})

				arg_83_0.weatherCells[iter_83_0] = var_83_3
			end

			var_83_3.info = iter_83_1

			var_83_3:Update(var_83_2)
		end
	end
end

function var_0_0.updateQuadCells(arg_84_0, arg_84_1)
	arg_84_1 = arg_84_1 or ChapterConst.QuadStateNormal
	arg_84_0.quadState = arg_84_1

	arg_84_0:updateQuadBase()

	if arg_84_1 == ChapterConst.QuadStateNormal then
		arg_84_0:UpdateQuadStateNormal()
	elseif arg_84_1 == ChapterConst.QuadStateBarrierSetting then
		arg_84_0:UpdateQuadStateBarrierSetting()
	elseif arg_84_1 == ChapterConst.QuadStateTeleportSub then
		arg_84_0:UpdateQuadStateTeleportSub()
	elseif arg_84_1 == ChapterConst.QuadStateMissileStrike or arg_84_1 == ChapterConst.QuadStateAirSuport then
		arg_84_0:UpdateQuadStateMissileStrike()
	elseif arg_84_1 == ChapterConst.QuadStateExpel then
		arg_84_0:UpdateQuadStateAirExpel()
	end

	arg_84_0:UpdateOpBtns()
end

function var_0_0.PlayQuadsParallelAnim(arg_85_0, arg_85_1)
	arg_85_0:frozen()
	table.ParallelIpairsAsync(arg_85_1, function(arg_86_0, arg_86_1, arg_86_2)
		local var_86_0 = ChapterCell.Line2QuadName(arg_86_1.row, arg_86_1.column)
		local var_86_1 = arg_85_0.quadRoot:Find(var_86_0)

		arg_85_0:cancelQuadTween(var_86_0, var_86_1)
		setImageAlpha(var_86_1, 0.4)

		local var_86_2 = LeanTween.scale(var_86_1, Vector3.one, 0.2):setFrom(Vector3.zero):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(arg_86_2))

		arg_85_0.presentTws[var_86_0] = {
			uniqueId = var_86_2.uniqueId
		}
	end, function()
		arg_85_0:unfrozen()
	end)
end

function var_0_0.updateQuadBase(arg_88_0)
	local var_88_0 = arg_88_0.contextData.chapterVO

	if var_88_0.fleet == nil then
		return
	end

	arg_88_0:killPresentTws()

	local function var_88_1(arg_89_0)
		if not arg_89_0 or not arg_89_0:IsWalkable() then
			return
		end

		local var_89_0 = arg_89_0.row
		local var_89_1 = arg_89_0.column
		local var_89_2 = ChapterCell.Line2QuadName(var_89_0, var_89_1)
		local var_89_3 = arg_88_0.quadRoot:Find(var_89_2)

		var_89_3.localScale = Vector3.one

		local var_89_4 = var_89_3:Find("grid"):GetComponent(typeof(Image))
		local var_89_5 = var_88_0:getChampion(var_89_0, var_89_1)

		if var_89_5 and var_89_5.flag == ChapterConst.CellFlagActive and var_89_5.trait ~= ChapterConst.TraitLurk and var_88_0:getChampionVisibility(var_89_5) and not var_88_0:existFleet(FleetType.Transport, var_89_0, var_89_1) then
			arg_88_0:startQuadTween(var_89_2, var_89_3)
			setImageSprite(var_89_3, GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_enemy"))
			setImageSprite(var_89_3:Find("grid"), GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_enemy_grid"))

			var_89_4.material = arg_88_0.material_Add

			return
		end

		local var_89_6 = var_88_0:GetRawChapterAttachemnt(var_89_0, var_89_1)

		if var_89_6 then
			local var_89_7 = var_88_0:getQuadCellPic(var_89_6)

			if var_89_7 then
				arg_88_0:startQuadTween(var_89_2, var_89_3)
				setImageSprite(var_89_3, GetSpriteFromAtlas("chapter/pic/cellgrid", var_89_7))

				return
			end
		end

		if var_88_0:getChapterCell(var_89_0, var_89_1) then
			local var_89_8 = var_88_0:getQuadCellPic(arg_89_0)

			if var_89_8 then
				arg_88_0:startQuadTween(var_89_2, var_89_3)

				if var_89_8 == "cell_enemy" then
					setImageSprite(var_89_3:Find("grid"), GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_enemy_grid"))

					var_89_4.material = arg_88_0.material_Add
				else
					setImageSprite(var_89_3:Find("grid"), GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_grid"))

					var_89_4.material = nil
				end

				setImageSprite(var_89_3, GetSpriteFromAtlas("chapter/pic/cellgrid", var_89_8))

				return
			end
		end

		arg_88_0:cancelQuadTween(var_89_2, var_89_3)
		setImageAlpha(var_89_3, ChapterConst.CellEaseOutAlpha)
		setImageSprite(var_89_3, GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_normal"))
		setImageSprite(var_89_3:Find("grid"), GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_grid"))

		var_89_4.material = nil
	end

	for iter_88_0, iter_88_1 in pairs(var_88_0.cells) do
		var_88_1(iter_88_1)
	end

	if var_88_0:isPlayingWithBombEnemy() then
		arg_88_0:hideQuadMark(ChapterConst.MarkBomb)
	end
end

function var_0_0.UpdateQuadStateNormal(arg_90_0)
	local var_90_0 = arg_90_0.contextData.chapterVO
	local var_90_1 = var_90_0.fleet
	local var_90_2

	if var_90_0:existMoveLimit() and not var_90_0:checkAnyInteractive() then
		var_90_2 = var_90_0:calcWalkableCells(ChapterConst.SubjectPlayer, var_90_1.line.row, var_90_1.line.column, var_90_1:getSpeed())
	end

	if not var_90_2 or #var_90_2 == 0 then
		return
	end

	local var_90_3 = _.min(var_90_2, function(arg_91_0)
		return ManhattonDist(arg_91_0, var_90_1.line)
	end)
	local var_90_4 = ManhattonDist(var_90_3, var_90_1.line)

	_.each(var_90_2, function(arg_92_0)
		local var_92_0 = ChapterCell.Line2QuadName(arg_92_0.row, arg_92_0.column)
		local var_92_1 = arg_90_0.quadRoot:Find(var_92_0)

		arg_90_0:cancelQuadTween(var_92_0, var_92_1)
		setImageSprite(var_92_1, GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_normal"))

		local var_92_2 = var_92_1:Find("grid"):GetComponent(typeof(Image))

		var_92_2.sprite = GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_grid")
		var_92_2.material = nil

		local var_92_3 = var_90_0:getRound() == ChapterConst.RoundPlayer

		setImageAlpha(var_92_1, var_92_3 and 1 or ChapterConst.CellEaseOutAlpha)

		var_92_1.localScale = Vector3.zero

		local var_92_4 = LeanTween.scale(var_92_1, Vector3.one, 0.2):setFrom(Vector3.zero):setEase(LeanTweenType.easeInOutSine):setDelay((ManhattonDist(arg_92_0, var_90_1.line) - var_90_4) * 0.1)

		arg_90_0.presentTws[var_92_0] = {
			uniqueId = var_92_4.uniqueId
		}
	end)
end

function var_0_0.UpdateQuadStateBarrierSetting(arg_93_0)
	local var_93_0 = 1
	local var_93_1 = arg_93_0.contextData.chapterVO
	local var_93_2 = var_93_1.fleet
	local var_93_3 = var_93_2.line
	local var_93_4 = var_93_1:calcSquareBarrierCells(var_93_3.row, var_93_3.column, var_93_0)

	if not var_93_4 or #var_93_4 == 0 then
		return
	end

	local var_93_5 = _.min(var_93_4, function(arg_94_0)
		return ManhattonDist(arg_94_0, var_93_2.line)
	end)
	local var_93_6 = ManhattonDist(var_93_5, var_93_2.line)

	_.each(var_93_4, function(arg_95_0)
		local var_95_0 = ChapterCell.Line2QuadName(arg_95_0.row, arg_95_0.column)
		local var_95_1 = arg_93_0.quadRoot:Find(var_95_0)

		arg_93_0:cancelQuadTween(var_95_0, var_95_1)
		setImageSprite(var_95_1, GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_barrier_select"))

		local var_95_2 = var_95_1:Find("grid"):GetComponent(typeof(Image))

		var_95_2.sprite = GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_grid")
		var_95_2.material = nil

		setImageAlpha(var_95_1, 1)

		var_95_1.localScale = Vector3.zero

		local var_95_3 = LeanTween.scale(var_95_1, Vector3.one, 0.2):setFrom(Vector3.zero):setEase(LeanTweenType.easeInOutSine):setDelay((ManhattonDist(arg_95_0, var_93_2.line) - var_93_6) * 0.1)

		arg_93_0.presentTws[var_95_0] = {
			uniqueId = var_95_3.uniqueId
		}
	end)
end

function var_0_0.UpdateQuadStateTeleportSub(arg_96_0)
	local var_96_0 = arg_96_0.contextData.chapterVO
	local var_96_1 = _.detect(var_96_0.fleets, function(arg_97_0)
		return arg_97_0:getFleetType() == FleetType.Submarine
	end)

	if not var_96_1 then
		return
	end

	local var_96_2 = var_96_0:calcWalkableCells(nil, var_96_1.line.row, var_96_1.line.column, ChapterConst.MaxStep)
	local var_96_3 = _.filter(var_96_2, function(arg_98_0)
		return not var_96_0:getQuadCellPic(var_96_0:getChapterCell(arg_98_0.row, arg_98_0.column))
	end)

	arg_96_0:PlayQuadsParallelAnim(var_96_3)
end

function var_0_0.UpdateQuadStateMissileStrike(arg_99_0)
	local var_99_0 = arg_99_0.contextData.chapterVO
	local var_99_1 = _.filter(_.values(var_99_0.cells), function(arg_100_0)
		return arg_100_0:IsWalkable() and not var_99_0:getQuadCellPic(arg_100_0)
	end)

	arg_99_0:PlayQuadsParallelAnim(var_99_1)
end

function var_0_0.UpdateQuadStateAirExpel(arg_101_0)
	local var_101_0 = arg_101_0.contextData.chapterVO
	local var_101_1 = arg_101_0.airSupportTarget

	if not var_101_1 or not var_101_1.source then
		local var_101_2 = _.filter(_.values(var_101_0.cells), function(arg_102_0)
			return arg_102_0:IsWalkable() and not var_101_0:getQuadCellPic(arg_102_0)
		end)

		arg_101_0:PlayQuadsParallelAnim(var_101_2)

		return
	end

	local var_101_3 = var_101_1.source
	local var_101_4 = var_101_0:calcWalkableCells(ChapterConst.SubjectChampion, var_101_3.row, var_101_3.column, 1)

	arg_101_0:PlayQuadsParallelAnim(var_101_4)
end

function var_0_0.ClickGridCell(arg_103_0, arg_103_1)
	if arg_103_0.quadState == ChapterConst.QuadStateBarrierSetting then
		arg_103_0:OnBarrierSetting(arg_103_1)
	elseif arg_103_0.quadState == ChapterConst.QuadStateTeleportSub then
		arg_103_0:OnTeleportConfirm(arg_103_1)
	elseif arg_103_0.quadState == ChapterConst.QuadStateMissileStrike then
		arg_103_0:OnMissileAiming(arg_103_1)
	elseif arg_103_0.quadState == ChapterConst.QuadStateAirSuport then
		arg_103_0:OnAirSupportAiming(arg_103_1)
	elseif arg_103_0.quadState == ChapterConst.QuadStateExpel then
		arg_103_0:OnAirExpelSelect(arg_103_1)
	else
		arg_103_0:emit(LevelUIConst.ON_CLICK_GRID_QUAD, arg_103_1)
	end
end

function var_0_0.OnBarrierSetting(arg_104_0, arg_104_1)
	local var_104_0 = 1
	local var_104_1 = arg_104_0.contextData.chapterVO
	local var_104_2 = var_104_1.fleet.line
	local var_104_3 = var_104_1:calcSquareBarrierCells(var_104_2.row, var_104_2.column, var_104_0)

	if not _.any(var_104_3, function(arg_105_0)
		return arg_105_0.row == arg_104_1.row and arg_105_0.column == arg_104_1.column
	end) then
		return
	end

	;(function(arg_106_0, arg_106_1)
		newChapterVO = arg_104_0.contextData.chapterVO

		if not newChapterVO:existBarrier(arg_106_0, arg_106_1) and newChapterVO.modelCount <= 0 then
			return
		end

		arg_104_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpBarrier,
			id = newChapterVO.fleet.id,
			arg1 = arg_106_0,
			arg2 = arg_106_1
		})
	end)(arg_104_1.row, arg_104_1.column)
end

function var_0_0.PrepareSubTeleport(arg_107_0)
	local var_107_0 = arg_107_0.contextData.chapterVO
	local var_107_1 = var_107_0:GetSubmarineFleet()
	local var_107_2 = arg_107_0.cellFleets[var_107_1.id]
	local var_107_3 = var_107_1.startPos

	for iter_107_0, iter_107_1 in pairs(var_107_0.fleets) do
		if iter_107_1:getFleetType() == FleetType.Normal then
			arg_107_0:updateFleet(iter_107_1.id)
		end
	end

	local var_107_4 = var_107_0:existEnemy(ChapterConst.SubjectPlayer, var_107_3.row, var_107_3.column) or var_107_0:existFleet(FleetType.Normal, var_107_3.row, var_107_3.column)

	setActive(var_107_2.tfAmmo, not var_107_4)
	var_107_2:SetActiveModel(true)

	if not (var_107_0.subAutoAttack == 1) then
		arg_107_0:PlaySubAnimation(var_107_2, false, function()
			var_107_2:SetActiveModel(not var_107_4)
		end)
	else
		var_107_2:SetActiveModel(not var_107_4)
	end

	var_107_2.tf.localPosition = var_107_0.theme:GetLinePosition(var_107_3.row, var_107_3.column)

	var_107_2:ResetCanvasOrder()
end

function var_0_0.TurnOffSubTeleport(arg_109_0)
	arg_109_0.subTeleportTargetLine = nil

	local var_109_0 = arg_109_0.contextData.chapterVO

	arg_109_0:hideQuadMark(ChapterConst.MarkMovePathArrow)
	arg_109_0:hideQuadMark(ChapterConst.MarkHuntingRange)
	arg_109_0:ClearEdges("SubmarineHunting")
	arg_109_0:UpdateDestinationMark()

	local var_109_1 = var_109_0:GetSubmarineFleet()
	local var_109_2 = arg_109_0.cellFleets[var_109_1.id]
	local var_109_3 = var_109_0.subAutoAttack == 1

	var_109_2:SetActiveModel(var_109_3)

	if not var_109_3 then
		arg_109_0:PlaySubAnimation(var_109_2, true, function()
			arg_109_0:updateFleet(var_109_1.id)
		end)
	else
		arg_109_0:updateFleet(var_109_1.id)
	end

	arg_109_0:ShowHuntingRange()
end

function var_0_0.OnTeleportConfirm(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_0.contextData.chapterVO
	local var_111_1 = var_111_0:getChapterCell(arg_111_1.row, arg_111_1.column)

	if var_111_1 and var_111_1:IsWalkable() and not var_111_0:existBarrier(arg_111_1.row, arg_111_1.column) then
		local var_111_2 = var_111_0:GetSubmarineFleet()

		if var_111_2.startPos.row == arg_111_1.row and var_111_2.startPos.column == arg_111_1.column then
			return
		end

		local var_111_3, var_111_4 = var_111_0:findPath(nil, var_111_2.startPos, arg_111_1)

		if var_111_3 >= PathFinding.PrioObstacle or arg_111_1.row ~= var_111_4[#var_111_4].row or arg_111_1.column ~= var_111_4[#var_111_4].column then
			return
		end

		arg_111_0:ShowTargetHuntingRange(arg_111_1)
		arg_111_0:UpdateDestinationMark(arg_111_1)

		if var_111_3 > 0 then
			arg_111_0:ShowPathInArrows(var_111_4)

			arg_111_0.subTeleportTargetLine = arg_111_1
		end
	end
end

function var_0_0.ShowPathInArrows(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_0.contextData.chapterVO
	local var_112_1 = Clone(arg_112_1)

	table.remove(var_112_1, #var_112_1)

	for iter_112_0 = #var_112_1, 1, -1 do
		local var_112_2 = var_112_1[iter_112_0]

		if var_112_0:existEnemy(ChapterConst.SubjectPlayer, var_112_2.row, var_112_2.column) or var_112_0:getFleet(FleetType.Normal, var_112_2.row, var_112_2.column) then
			table.remove(var_112_1, iter_112_0)
		end
	end

	arg_112_0:hideQuadMark(ChapterConst.MarkMovePathArrow)
	arg_112_0:showQuadMark(var_112_1, ChapterConst.MarkMovePathArrow, "cell_path_arrow", Vector2(100, 100), nil, true)

	local var_112_3 = arg_112_0.markQuads[ChapterConst.MarkMovePathArrow]

	for iter_112_1 = #arg_112_1, 1, -1 do
		local var_112_4 = arg_112_1[iter_112_1]
		local var_112_5 = ChapterCell.Line2MarkName(var_112_4.row, var_112_4.column, ChapterConst.MarkMovePathArrow)
		local var_112_6 = var_112_3 and var_112_3[var_112_5]

		if var_112_6 then
			local var_112_7 = arg_112_1[iter_112_1 + 1]
			local var_112_8 = Vector3.Normalize(Vector3(var_112_7.column - var_112_4.column, var_112_4.row - var_112_7.row, 0))
			local var_112_9 = Vector3.Dot(var_112_8, Vector3.up)
			local var_112_10 = Mathf.Acos(var_112_9) * Mathf.Rad2Deg
			local var_112_11 = Vector3.Cross(Vector3.up, var_112_8).z > 0 and 1 or -1

			var_112_6.localEulerAngles = Vector3(0, 0, var_112_10 * var_112_11)
		end
	end
end

function var_0_0.ShowMissileAimingMarks(arg_113_0, arg_113_1)
	_.each(arg_113_1, function(arg_114_0)
		arg_113_0.loader:GetPrefabBYGroup("ui/miaozhun02", "miaozhun02", function(arg_115_0)
			setParent(arg_115_0, arg_113_0.restrictMap)

			local var_115_0 = arg_113_0.contextData.chapterVO.theme:GetLinePosition(arg_114_0.row, arg_114_0.column)
			local var_115_1 = arg_113_0.restrictMap.anchoredPosition

			tf(arg_115_0).anchoredPosition = Vector2(var_115_0.x - var_115_1.x, var_115_0.y - var_115_1.y)
		end, "MissileAimingMarks")
	end)
end

function var_0_0.HideMissileAimingMarks(arg_116_0)
	arg_116_0.loader:ReturnGroup("MissileAimingMarks")
end

function var_0_0.ShowMissileAimingMark(arg_117_0, arg_117_1)
	arg_117_0.loader:GetPrefab("ui/miaozhun02", "miaozhun02", function(arg_118_0)
		setParent(arg_118_0, arg_117_0.restrictMap)

		local var_118_0 = arg_117_0.contextData.chapterVO.theme:GetLinePosition(arg_117_1.row, arg_117_1.column)
		local var_118_1 = arg_117_0.restrictMap.anchoredPosition

		tf(arg_118_0).anchoredPosition = Vector2(var_118_0.x - var_118_1.x, var_118_0.y - var_118_1.y)
	end, "MissileAimingMark")
end

function var_0_0.HideMissileAimingMark(arg_119_0)
	arg_119_0.loader:ClearRequest("MissileAimingMark")
end

function var_0_0.OnMissileAiming(arg_120_0, arg_120_1)
	arg_120_0:HideMissileAimingMark()
	arg_120_0:ShowMissileAimingMark(arg_120_1)

	arg_120_0.missileStrikeTargetLine = arg_120_1
end

function var_0_0.ShowAirSupportAimingMark(arg_121_0, arg_121_1)
	arg_121_0.loader:GetPrefab("ui/miaozhun03", "miaozhun03", function(arg_122_0)
		setParent(arg_122_0, arg_121_0.restrictMap)

		local var_122_0 = arg_121_0.contextData.chapterVO.theme:GetLinePosition(arg_121_1.row - 0.5, arg_121_1.column)
		local var_122_1 = arg_121_0.restrictMap.anchoredPosition

		tf(arg_122_0).anchoredPosition = Vector2(var_122_0.x - var_122_1.x, var_122_0.y - var_122_1.y)
	end, "AirSupportAimingMark")
end

function var_0_0.HideAirSupportAimingMark(arg_123_0)
	arg_123_0.loader:ClearRequest("AirSupportAimingMark")
end

function var_0_0.OnAirSupportAiming(arg_124_0, arg_124_1)
	arg_124_0:HideAirSupportAimingMark()
	arg_124_0:ShowAirSupportAimingMark(arg_124_1)

	arg_124_0.missileStrikeTargetLine = arg_124_1
end

function var_0_0.ShowAirExpelAimingMark(arg_125_0)
	local var_125_0 = arg_125_0.airSupportTarget

	if not var_125_0 or not var_125_0.source then
		return
	end

	local var_125_1 = var_125_0.source
	local var_125_2 = ChapterCell.Line2Name(var_125_1.row, var_125_1.column)
	local var_125_3 = arg_125_0.cellRoot:Find(var_125_2)

	local function var_125_4(arg_126_0, arg_126_1)
		setParent(arg_126_0, var_125_3)

		GetOrAddComponent(arg_126_0, typeof(Canvas)).overrideSorting = true

		if not arg_126_1 then
			return
		end

		local var_126_0 = arg_125_0.contextData.chapterVO

		tf(arg_126_0).localEulerAngles = Vector3(-var_126_0.theme.angle, 0, 0)
	end

	arg_125_0.loader:GetPrefabBYGroup("leveluiview/tpl_airsupportmark", "tpl_airsupportmark", function(arg_127_0)
		var_125_4(arg_127_0, true)
	end, "AirExpelAimingMark")
	arg_125_0.loader:GetPrefabBYGroup("leveluiview/tpl_airsupportdirection", "tpl_airsupportdirection", function(arg_128_0)
		var_125_4(arg_128_0)

		local var_128_0 = arg_125_0.contextData.chapterVO
		local var_128_1 = {
			{
				-1,
				0
			},
			{
				0,
				1
			},
			{
				1,
				0
			},
			{
				0,
				-1
			}
		}

		for iter_128_0 = 1, 4 do
			local var_128_2 = tf(arg_128_0):Find(iter_128_0)
			local var_128_3 = var_125_0 and var_128_0:considerAsStayPoint(ChapterConst.SubjectChampion, var_125_1.row + var_128_1[iter_128_0][1], var_125_1.column + var_128_1[iter_128_0][2])

			setActive(var_128_2, var_128_3)
		end
	end, "AirExpelAimingMark")
end

function var_0_0.HideAirExpelAimingMark(arg_129_0)
	arg_129_0.loader:ReturnGroup("AirExpelAimingMark")
end

function var_0_0.OnAirExpelSelect(arg_130_0, arg_130_1)
	local var_130_0 = arg_130_0.contextData.chapterVO

	local function var_130_1()
		arg_130_0:HideAirExpelAimingMark()
		arg_130_0:ShowAirExpelAimingMark()
		arg_130_0:updateQuadBase()
		arg_130_0:UpdateQuadStateAirExpel()
	end

	arg_130_0.airSupportTarget = arg_130_0.airSupportTarget or {}

	local var_130_2 = arg_130_0.airSupportTarget
	local var_130_3 = var_130_0:GetEnemy(arg_130_1.row, arg_130_1.column)

	if var_130_3 then
		if ChapterConst.IsBossCell(var_130_3) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelscene_airexpel_select_boss"))

			return
		end

		if var_130_0:existFleet(FleetType.Normal, arg_130_1.row, arg_130_1.column) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelscene_airexpel_select_battle"))

			return
		end

		if var_130_2.source and table.equal(var_130_2.source:GetLine(), var_130_3:GetLine()) then
			var_130_3 = nil
		end

		var_130_2.source = var_130_3

		var_130_1()
	elseif not var_130_2.source then
		pg.TipsMgr.GetInstance():ShowTips(i18n("levelscene_airexpel_select_enemy"))
	elseif ManhattonDist(var_130_2.source, arg_130_1) > 1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("levelscene_airexpel_outrange"))
	elseif not var_130_0:considerAsStayPoint(ChapterConst.SubjectChampion, arg_130_1.row, arg_130_1.column) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("levelscene_airexpel_outrange"))
	else
		local var_130_4 = arg_130_0.airSupportTarget.source
		local var_130_5 = arg_130_1

		if not var_130_4 or not var_130_5 then
			return
		end

		local var_130_6 = {
			arg_130_1.row - var_130_4.row,
			arg_130_1.column - var_130_4.column
		}
		local var_130_7 = {
			"up",
			"right",
			"down",
			"left"
		}
		local var_130_8

		if var_130_6[1] ~= 0 then
			var_130_8 = var_130_6[1] + 2
		else
			var_130_8 = 3 - var_130_6[2]
		end

		local var_130_9 = var_130_7[var_130_8]
		local var_130_10 = var_130_0:getChapterSupportFleet()

		local function var_130_11()
			arg_130_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_130_10.id,
				arg1 = ChapterConst.StrategyExpel,
				arg2 = var_130_4.row,
				arg3 = var_130_4.column,
				arg4 = var_130_5.row,
				arg5 = var_130_5.column
			})
		end

		local var_130_12 = var_130_4.attachmentId
		local var_130_13 = pg.expedition_data_template[var_130_12].name

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("levelscene_airexpel_select_confirm_" .. var_130_9, var_130_13),
			onYes = var_130_11
		})
	end
end

function var_0_0.CleanAirSupport(arg_133_0)
	arg_133_0.airSupportTarget = nil
end

function var_0_0.startQuadTween(arg_134_0, arg_134_1, arg_134_2, arg_134_3, arg_134_4)
	if arg_134_0.presentTws[arg_134_1] then
		LeanTween.cancel(arg_134_0.presentTws[arg_134_1].uniqueId)

		arg_134_0.presentTws[arg_134_1] = nil
	end

	if not arg_134_0.quadTws[arg_134_1] then
		arg_134_3 = arg_134_3 or 1
		arg_134_4 = arg_134_4 or ChapterConst.CellEaseOutAlpha

		setImageAlpha(arg_134_2, arg_134_3)

		local var_134_0 = LeanTween.alpha(arg_134_2, arg_134_4, 1):setLoopPingPong()

		arg_134_0.quadTws[arg_134_1] = {
			tw = var_134_0,
			uniqueId = var_134_0.uniqueId
		}
	end
end

function var_0_0.cancelQuadTween(arg_135_0, arg_135_1, arg_135_2)
	if arg_135_0.quadTws[arg_135_1] then
		LeanTween.cancel(arg_135_0.quadTws[arg_135_1].uniqueId)

		arg_135_0.quadTws[arg_135_1] = nil
	end

	setImageAlpha(arg_135_2, ChapterConst.CellEaseOutAlpha)
end

function var_0_0.killQuadTws(arg_136_0)
	for iter_136_0, iter_136_1 in pairs(arg_136_0.quadTws) do
		LeanTween.cancel(iter_136_1.uniqueId)
	end

	arg_136_0.quadTws = {}
end

function var_0_0.killPresentTws(arg_137_0)
	for iter_137_0, iter_137_1 in pairs(arg_137_0.presentTws) do
		LeanTween.cancel(iter_137_1.uniqueId)
	end

	arg_137_0.presentTws = {}
end

function var_0_0.startMarkTween(arg_138_0, arg_138_1, arg_138_2, arg_138_3, arg_138_4)
	if not arg_138_0.markTws[arg_138_1] then
		arg_138_3 = arg_138_3 or 1
		arg_138_4 = arg_138_4 or 0.2

		setImageAlpha(arg_138_2, arg_138_3)

		local var_138_0 = LeanTween.alpha(arg_138_2, arg_138_4, 0.7):setLoopPingPong():setEase(LeanTweenType.easeInOutSine):setDelay(1)

		arg_138_0.markTws[arg_138_1] = {
			tw = var_138_0,
			uniqueId = var_138_0.uniqueId
		}
	end
end

function var_0_0.cancelMarkTween(arg_139_0, arg_139_1, arg_139_2, arg_139_3)
	if arg_139_0.markTws[arg_139_1] then
		LeanTween.cancel(arg_139_0.markTws[arg_139_1].uniqueId)

		arg_139_0.markTws[arg_139_1] = nil
	end

	setImageAlpha(arg_139_2, arg_139_3 or ChapterConst.CellEaseOutAlpha)
end

function var_0_0.moveFleet(arg_140_0, arg_140_1, arg_140_2, arg_140_3, arg_140_4)
	local var_140_0 = arg_140_0.contextData.chapterVO
	local var_140_1 = var_140_0.fleet
	local var_140_2 = var_140_1.id
	local var_140_3 = arg_140_0.cellFleets[var_140_2]

	var_140_3:SetSpineVisible(true)
	setActive(var_140_3.tfShadow, true)
	setActive(arg_140_0.arrowTarget, true)
	arg_140_0:updateTargetArrow(arg_140_2[#arg_140_2])

	if arg_140_3 then
		arg_140_0:updateAttachment(arg_140_3.row, arg_140_3.column)
	end

	local function var_140_4(arg_141_0)
		var_140_1.step = var_140_1.step + 1

		if arg_140_0.onShipStepChange then
			arg_140_0.onShipStepChange(arg_141_0)
		end
	end

	local function var_140_5(arg_142_0)
		return
	end

	local function var_140_6()
		setActive(arg_140_0.arrowTarget, false)

		local var_143_0 = var_140_0.fleet.line
		local var_143_1 = var_140_0:getChapterCell(var_143_0.row, var_143_0.column)

		if ChapterConst.NeedClearStep(var_143_1) then
			var_140_1.step = 0
		end

		var_140_1.rotation = var_140_3:GetRotatePivot().transform.localRotation

		arg_140_0:updateAttachment(var_143_0.row, var_143_0.column)
		arg_140_0:updateFleet(var_140_2)
		arg_140_0:updateOni()

		local var_143_2 = var_140_0:getChampionIndex(var_143_0.row, var_143_0.column)

		if var_143_2 then
			arg_140_0:updateChampion(var_143_2)
		end

		if arg_140_0.onShipArrived then
			arg_140_0.onShipArrived()
		end

		if arg_140_4 then
			arg_140_4()
		end
	end

	arg_140_0:updateQuadCells(ChapterConst.QuadStateFrozen)
	arg_140_0:moveCellView(var_140_3, arg_140_1, arg_140_2, var_140_4, var_140_5, var_140_6)
end

function var_0_0.moveSub(arg_144_0, arg_144_1, arg_144_2, arg_144_3, arg_144_4)
	local var_144_0 = arg_144_0.contextData.chapterVO
	local var_144_1 = var_144_0.fleets[arg_144_1]
	local var_144_2 = arg_144_0.cellFleets[var_144_1.id]
	local var_144_3 = arg_144_2[#arg_144_2]

	local function var_144_4(arg_145_0)
		return
	end

	local function var_144_5(arg_146_0)
		return
	end

	local function var_144_6()
		local var_147_0 = var_144_0:existEnemy(ChapterConst.SubjectPlayer, var_144_3.row, var_144_3.column) or var_144_0:existAlly(var_144_1)
		local var_147_1 = var_144_0.subAutoAttack == 1

		var_144_2:SetActiveModel(not var_147_0 and var_147_1)

		var_144_1.rotation = var_144_2:GetRotatePivot().transform.localRotation

		if arg_144_4 then
			arg_144_4()
		end
	end

	arg_144_0:updateQuadCells(ChapterConst.QuadStateFrozen)
	arg_144_0:teleportSubView(var_144_2, var_144_2:GetLine(), var_144_3, var_144_4, var_144_5, var_144_6)
end

function var_0_0.moveChampion(arg_148_0, arg_148_1, arg_148_2, arg_148_3, arg_148_4)
	local var_148_0 = arg_148_0.contextData.chapterVO
	local var_148_1 = var_148_0.champions[arg_148_1]
	local var_148_2 = arg_148_0.cellChampions[arg_148_1]

	local function var_148_3(arg_149_0)
		return
	end

	local function var_148_4(arg_150_0)
		return
	end

	local function var_148_5()
		if var_148_2.GetRotatePivot then
			var_148_1.rotation = var_148_2:GetRotatePivot().transform.localRotation
		end

		if arg_148_4 then
			arg_148_4()
		end
	end

	if var_148_0:getChampionVisibility(var_148_1) then
		arg_148_0:moveCellView(var_148_2, arg_148_2, arg_148_3, var_148_3, var_148_4, var_148_5)
	else
		local var_148_6 = arg_148_2[#arg_148_2]

		var_148_2:RefreshLinePosition(var_148_0, var_148_6)
		var_148_5()
	end
end

function var_0_0.moveTransport(arg_152_0, arg_152_1, arg_152_2, arg_152_3, arg_152_4)
	local var_152_0 = arg_152_0.contextData.chapterVO.fleets[arg_152_1]
	local var_152_1 = arg_152_0.cellFleets[var_152_0.id]

	local function var_152_2(arg_153_0)
		return
	end

	local function var_152_3(arg_154_0)
		return
	end

	local function var_152_4()
		var_152_0.rotation = var_152_1:GetRotatePivot().transform.localRotation

		arg_152_0:updateFleet(var_152_0.id)
		existCall(arg_152_4)
	end

	arg_152_0:updateQuadCells(ChapterConst.QuadStateFrozen)
	arg_152_0:moveCellView(var_152_1, arg_152_2, arg_152_3, var_152_2, var_152_3, var_152_4)
end

function var_0_0.moveCellView(arg_156_0, arg_156_1, arg_156_2, arg_156_3, arg_156_4, arg_156_5, arg_156_6)
	local var_156_0 = arg_156_0.contextData.chapterVO
	local var_156_1

	local function var_156_2()
		if var_156_1 and coroutine.status(var_156_1) == "suspended" then
			local var_157_0, var_157_1 = coroutine.resume(var_156_1)

			assert(var_157_0, debug.traceback(var_156_1, var_157_1))
		end
	end

	var_156_1 = coroutine.create(function()
		arg_156_0:frozen()

		local var_158_0 = var_156_0:GetQuickPlayFlag() and ChapterConst.ShipStepQuickPlayScale or 1
		local var_158_1 = 0.3 * var_158_0
		local var_158_2 = ChapterConst.ShipStepDuration * ChapterConst.ShipMoveTailLength * var_158_0
		local var_158_3 = 0.1 * var_158_0
		local var_158_4 = 0

		table.insert(arg_156_3, 1, arg_156_1:GetLine())
		_.each(arg_156_3, function(arg_159_0)
			local var_159_0 = var_156_0:getChapterCell(arg_159_0.row, arg_159_0.column)

			if ChapterConst.NeedEasePathCell(var_159_0) then
				local var_159_1 = ChapterCell.Line2QuadName(var_159_0.row, var_159_0.column)
				local var_159_2 = arg_156_0.quadRoot:Find(var_159_1)

				arg_156_0:cancelQuadTween(var_159_1, var_159_2)
				LeanTween.alpha(var_159_2, 1, var_158_1):setDelay(var_158_4)

				var_158_4 = var_158_4 + var_158_3
			end
		end)
		_.each(arg_156_2, function(arg_160_0)
			arg_156_0:moveStep(arg_156_1, arg_160_0, arg_156_3[#arg_156_3], function()
				local var_161_0 = arg_156_1:GetLine()
				local var_161_1 = var_156_0:getChapterCell(var_161_0.row, var_161_0.column)

				if ChapterConst.NeedEasePathCell(var_161_1) then
					local var_161_2 = ChapterCell.Line2QuadName(var_161_1.row, var_161_1.column)
					local var_161_3 = arg_156_0.quadRoot:Find(var_161_2)

					LeanTween.scale(var_161_3, Vector3.zero, var_158_2)
				end

				arg_156_4(arg_160_0)
				arg_156_1:SetLine(arg_160_0)
				arg_156_1:ResetCanvasOrder()
			end, function()
				arg_156_5(arg_160_0)
				var_156_2()
			end)
			coroutine.yield()
		end)
		_.each(arg_156_3, function(arg_163_0)
			local var_163_0 = var_156_0:getChapterCell(arg_163_0.row, arg_163_0.column)

			if ChapterConst.NeedEasePathCell(var_163_0) then
				local var_163_1 = ChapterCell.Line2QuadName(var_163_0.row, var_163_0.column)
				local var_163_2 = arg_156_0.quadRoot:Find(var_163_1)

				LeanTween.cancel(var_163_2.gameObject)
				setImageAlpha(var_163_2, ChapterConst.CellEaseOutAlpha)

				var_163_2.localScale = Vector3.one
			end
		end)

		if arg_156_0.exited then
			return
		end

		if arg_156_1.GetAction then
			arg_156_1:SetAction(ChapterConst.ShipIdleAction)
		end

		arg_156_6()
		arg_156_0:unfrozen()
	end)

	var_156_2()
end

function var_0_0.moveStep(arg_164_0, arg_164_1, arg_164_2, arg_164_3, arg_164_4, arg_164_5)
	local var_164_0 = arg_164_0.contextData.chapterVO
	local var_164_1 = var_164_0:GetQuickPlayFlag() and ChapterConst.ShipStepQuickPlayScale or 1
	local var_164_2

	if arg_164_1.GetRotatePivot then
		var_164_2 = arg_164_1:GetRotatePivot()
	end

	local var_164_3 = arg_164_1:GetLine()

	if arg_164_1.GetAction then
		arg_164_1:SetAction(ChapterConst.ShipMoveAction)
	end

	if not IsNil(var_164_2) and (arg_164_2.column ~= var_164_3.column or arg_164_3.column ~= var_164_3.column) then
		tf(var_164_2).localRotation = Quaternion.identity

		if arg_164_2.column < var_164_3.column or arg_164_2.column == var_164_3.column and arg_164_3.column < var_164_3.column then
			tf(var_164_2).localRotation = Quaternion.Euler(0, 180, 0)
		end
	end

	local var_164_4 = arg_164_1.tf.localPosition
	local var_164_5 = var_164_0.theme:GetLinePosition(arg_164_2.row, arg_164_2.column)
	local var_164_6 = 0

	LeanTween.value(arg_164_1.go, 0, 1, ChapterConst.ShipStepDuration * var_164_1):setOnComplete(System.Action(arg_164_5)):setOnUpdate(System.Action_float(function(arg_165_0)
		arg_164_1.tf.localPosition = Vector3.Lerp(var_164_4, var_164_5, arg_165_0)

		if var_164_6 <= 0.5 and arg_165_0 > 0.5 then
			arg_164_4()
		end

		var_164_6 = arg_165_0
	end))
end

function var_0_0.teleportSubView(arg_166_0, arg_166_1, arg_166_2, arg_166_3, arg_166_4, arg_166_5, arg_166_6)
	local var_166_0 = arg_166_0.contextData.chapterVO

	local function var_166_1()
		arg_166_4(arg_166_3)
		arg_166_1:RefreshLinePosition(var_166_0, arg_166_3)
		arg_166_5(arg_166_3)
		arg_166_0:PlaySubAnimation(arg_166_1, false, arg_166_6)
	end

	arg_166_0:PlaySubAnimation(arg_166_1, true, var_166_1)
end

function var_0_0.CellToScreen(arg_168_0, arg_168_1, arg_168_2)
	local var_168_0 = arg_168_0._tf:Find(ChapterConst.PlaneName .. "/cells")

	assert(var_168_0, "plane not exist.")

	local var_168_1 = arg_168_0.contextData.chapterVO.theme
	local var_168_2 = var_168_1:GetLinePosition(arg_168_1, arg_168_2)
	local var_168_3 = var_168_2.y

	var_168_2.y = var_168_3 * math.cos(math.pi / 180 * var_168_1.angle)
	var_168_2.z = var_168_3 * math.sin(math.pi / 180 * var_168_1.angle)

	local var_168_4 = arg_168_0.levelCam.transform:GetChild(0)
	local var_168_5 = var_168_0.transform.lossyScale.x
	local var_168_6 = var_168_0.position + var_168_2 * var_168_5
	local var_168_7 = arg_168_0.levelCam:WorldToViewportPoint(var_168_6)

	return Vector3(var_168_4.rect.width * (var_168_7.x - 0.5), var_168_4.rect.height * (var_168_7.y - 0.5))
end

local var_0_4 = {
	{
		1,
		0
	},
	{
		0,
		-1
	},
	{
		-1,
		0
	},
	{
		0,
		1
	}
}
local var_0_5 = {
	{
		1,
		1
	},
	{
		1,
		-1
	},
	{
		-1,
		-1
	},
	{
		-1,
		1
	}
}

function var_0_0.AddCellEdge(arg_169_0, arg_169_1, arg_169_2, ...)
	local var_169_0 = 0
	local var_169_1 = 1

	for iter_169_0 = 1, 4 do
		if not _.any(arg_169_1, function(arg_170_0)
			return arg_170_0.row == arg_169_2.row + var_0_4[iter_169_0][1] and arg_170_0.column == arg_169_2.column + var_0_4[iter_169_0][2]
		end) then
			var_169_0 = bit.bor(var_169_0, var_169_1)
		end

		var_169_1 = var_169_1 * 2
	end

	if var_169_0 == 0 then
		return
	end

	arg_169_0:CreateEdge(var_169_0, arg_169_2, ...)
end

function var_0_0.AddOutlines(arg_171_0, arg_171_1, arg_171_2, arg_171_3, arg_171_4, arg_171_5)
	local var_171_0 = {}
	local var_171_1 = {}

	for iter_171_0, iter_171_1 in ipairs(arg_171_1) do
		for iter_171_2 = 1, 4 do
			if not underscore.any(arg_171_1, function(arg_172_0)
				return arg_172_0.row == iter_171_1.row + var_0_4[iter_171_2][1] and arg_172_0.column == iter_171_1.column + var_0_4[iter_171_2][2]
			end) then
				local var_171_2 = 2 * iter_171_1.row + var_0_4[iter_171_2][1]
				local var_171_3 = 2 * iter_171_1.column + var_0_4[iter_171_2][2]

				assert(not var_171_0[var_171_2 .. "_" .. var_171_3], "Multiple outline")

				var_171_0[var_171_2 .. "_" .. var_171_3] = {
					row = var_171_2,
					column = var_171_3,
					normal = iter_171_2
				}
			end

			if not underscore.any(arg_171_1, function(arg_173_0)
				return arg_173_0.row == iter_171_1.row + var_0_5[iter_171_2][1] and arg_173_0.column == iter_171_1.column + var_0_5[iter_171_2][2]
			end) and underscore.any(arg_171_1, function(arg_174_0)
				return arg_174_0.row == iter_171_1.row and arg_174_0.column == iter_171_1.column + var_0_5[iter_171_2][2]
			end) and underscore.any(arg_171_1, function(arg_175_0)
				return arg_175_0.row == iter_171_1.row + var_0_5[iter_171_2][1] and arg_175_0.column == iter_171_1.column
			end) then
				var_171_1[iter_171_1.row .. "_" .. iter_171_1.column .. "_" .. iter_171_2] = {
					row = iter_171_1.row,
					column = iter_171_1.column,
					corner = iter_171_2
				}
			end
		end
	end

	arg_171_0:CreateOutlines(var_171_0, arg_171_2, arg_171_3, arg_171_4, arg_171_5)
	arg_171_0:CreateOutlineCorners(var_171_1, arg_171_2, arg_171_3, arg_171_4, arg_171_5 .. "_corner")
end

function var_0_0.isHuntingRangeVisible(arg_176_0)
	return arg_176_0.contextData.huntingRangeVisibility % 2 == 0
end

function var_0_0.toggleHuntingRange(arg_177_0)
	arg_177_0:hideQuadMark(ChapterConst.MarkHuntingRange)
	arg_177_0:ClearEdges("SubmarineHunting")

	if not arg_177_0:isHuntingRangeVisible() then
		arg_177_0:ShowHuntingRange()
	end

	arg_177_0.contextData.huntingRangeVisibility = 1 - arg_177_0.contextData.huntingRangeVisibility

	arg_177_0:updateAttachments()
	arg_177_0:updateChampions()
end

function var_0_0.ShowHuntingRange(arg_178_0)
	local var_178_0 = arg_178_0.contextData.chapterVO
	local var_178_1 = var_178_0:GetSubmarineFleet()

	if not var_178_1 then
		return
	end

	local var_178_2 = var_178_1:getHuntingRange()
	local var_178_3 = _.filter(var_178_2, function(arg_179_0)
		local var_179_0 = var_178_0:getChapterCell(arg_179_0.row, arg_179_0.column)

		return var_179_0 and var_179_0:IsWalkable()
	end)

	arg_178_0:RefreshHuntingRange(var_178_3, false)
end

function var_0_0.RefreshHuntingRange(arg_180_0, arg_180_1, arg_180_2)
	arg_180_0:showQuadMark(arg_180_1, ChapterConst.MarkHuntingRange, "cell_hunting_range", Vector2(100, 100), arg_180_0.material_Add, arg_180_2)
	_.each(arg_180_1, function(arg_181_0)
		arg_180_0:AddCellEdge(arg_180_1, arg_181_0, not arg_180_2, nil, nil, "SubmarineHunting")
	end)
end

function var_0_0.ShowStaticHuntingRange(arg_182_0)
	arg_182_0:hideQuadMark(ChapterConst.MarkHuntingRange)
	arg_182_0:ClearEdges("SubmarineHunting")

	local var_182_0 = arg_182_0.contextData.chapterVO
	local var_182_1 = var_182_0:GetSubmarineFleet()

	if not arg_182_0:isHuntingRangeVisible() then
		arg_182_0.contextData.huntingRangeVisibility = arg_182_0.contextData.huntingRangeVisibility + 1
	end

	local var_182_2 = var_182_1:getHuntingRange()
	local var_182_3 = _.filter(var_182_2, function(arg_183_0)
		local var_183_0 = var_182_0:getChapterCell(arg_183_0.row, arg_183_0.column)

		return var_183_0 and var_183_0:IsWalkable()
	end)

	arg_182_0:RefreshHuntingRange(var_182_3, true)
end

function var_0_0.ShowTargetHuntingRange(arg_184_0, arg_184_1)
	arg_184_0:hideQuadMark(ChapterConst.MarkHuntingRange)
	arg_184_0:ClearEdges("SubmarineHunting")

	local var_184_0 = arg_184_0.contextData.chapterVO
	local var_184_1 = var_184_0:GetSubmarineFleet()
	local var_184_2 = var_184_1:getHuntingRange(arg_184_1)
	local var_184_3 = _.filter(var_184_2, function(arg_185_0)
		local var_185_0 = var_184_0:getChapterCell(arg_185_0.row, arg_185_0.column)

		return var_185_0 and var_185_0:IsWalkable()
	end)
	local var_184_4 = var_184_1:getHuntingRange()
	local var_184_5 = _.filter(var_184_4, function(arg_186_0)
		local var_186_0 = var_184_0:getChapterCell(arg_186_0.row, arg_186_0.column)

		return var_186_0 and var_186_0:IsWalkable()
	end)
	local var_184_6 = {}

	for iter_184_0, iter_184_1 in pairs(var_184_5) do
		if not table.containsData(var_184_3, iter_184_1) then
			table.insert(var_184_6, iter_184_1)
		end
	end

	arg_184_0:RefreshHuntingRange(var_184_6, true)
	arg_184_0:RefreshHuntingRange(var_184_3, false)
	arg_184_0:updateAttachments()
	arg_184_0:updateChampions()
end

function var_0_0.OnChangeSubAutoAttack(arg_187_0)
	local var_187_0 = arg_187_0.contextData.chapterVO
	local var_187_1 = var_187_0:GetSubmarineFleet()

	if not var_187_1 then
		return
	end

	local var_187_2 = arg_187_0.cellFleets[var_187_1.id]

	if not var_187_2 then
		return
	end

	local var_187_3 = var_187_0.subAutoAttack == 1

	var_187_2:SetActiveModel(not var_187_3)
	arg_187_0:PlaySubAnimation(var_187_2, not var_187_3, function()
		arg_187_0:updateFleet(var_187_1.id)
	end)
end

function var_0_0.displayEscapeGrid(arg_189_0)
	local var_189_0 = arg_189_0.contextData.chapterVO

	if not var_189_0:existOni() then
		return
	end

	local var_189_1 = var_189_0:getOniChapterInfo()

	arg_189_0:hideQuadMark(ChapterConst.MarkEscapeGrid)
	arg_189_0:showQuadMark(_.map(var_189_1.escape_grids, function(arg_190_0)
		return {
			row = arg_190_0[1],
			column = arg_190_0[2]
		}
	end), ChapterConst.MarkEscapeGrid, "cell_escape_grid", Vector2(105, 105))
end

function var_0_0.showQuadMark(arg_191_0, arg_191_1, arg_191_2, arg_191_3, arg_191_4, arg_191_5, arg_191_6)
	arg_191_0:ShowAnyQuadMark(arg_191_1, arg_191_2, arg_191_3, arg_191_4, arg_191_5, false, arg_191_6)
end

function var_0_0.ShowTopQuadMark(arg_192_0, arg_192_1, arg_192_2, arg_192_3, arg_192_4, arg_192_5, arg_192_6)
	arg_192_0:ShowAnyQuadMark(arg_192_1, arg_192_2, arg_192_3, arg_192_4, arg_192_5, true, arg_192_6)
end

function var_0_0.ShowAnyQuadMark(arg_193_0, arg_193_1, arg_193_2, arg_193_3, arg_193_4, arg_193_5, arg_193_6, arg_193_7)
	local var_193_0 = arg_193_0.contextData.chapterVO

	for iter_193_0, iter_193_1 in pairs(arg_193_1) do
		local var_193_1 = var_193_0:getChapterCell(iter_193_1.row, iter_193_1.column)

		if var_193_1 and var_193_1:IsWalkable() then
			local var_193_2 = ChapterCell.Line2MarkName(iter_193_1.row, iter_193_1.column, arg_193_2)

			arg_193_0.markQuads[arg_193_2] = arg_193_0.markQuads[arg_193_2] or {}

			local var_193_3 = arg_193_0.markQuads[arg_193_2][var_193_2]

			if not var_193_3 then
				PoolMgr.GetInstance():GetPrefab("chapter/cell_quad_mark", "", false, function(arg_194_0)
					var_193_3 = arg_194_0.transform
					arg_193_0.markQuads[arg_193_2][var_193_2] = var_193_3
				end)
			else
				arg_193_0:cancelMarkTween(var_193_2, var_193_3, 1)
			end

			var_193_3.name = var_193_2

			var_193_3:SetParent(arg_193_6 and arg_193_0.topMarkRoot or arg_193_0.bottomMarkRoot, false)

			var_193_3.sizeDelta = var_193_0.theme.cellSize
			var_193_3.anchoredPosition = var_193_0.theme:GetLinePosition(iter_193_1.row, iter_193_1.column)
			var_193_3.localScale = Vector3.one

			var_193_3:SetAsLastSibling()

			local var_193_4 = var_193_3:GetComponent(typeof(Image))

			var_193_4.sprite = GetSpriteFromAtlas("chapter/pic/cellgrid", arg_193_3)
			var_193_4.material = arg_193_5
			var_193_3.sizeDelta = arg_193_4

			if not arg_193_7 then
				arg_193_0:startMarkTween(var_193_2, var_193_3)
			else
				arg_193_0:cancelMarkTween(var_193_2, var_193_3, 1)
			end
		end
	end
end

function var_0_0.hideQuadMark(arg_195_0, arg_195_1)
	if arg_195_1 and not arg_195_0.markQuads[arg_195_1] then
		return
	end

	for iter_195_0, iter_195_1 in pairs(arg_195_0.markQuads) do
		if not arg_195_1 or iter_195_0 == arg_195_1 then
			for iter_195_2, iter_195_3 in pairs(iter_195_1) do
				arg_195_0:cancelMarkTween(iter_195_2, iter_195_3)

				iter_195_1[iter_195_2]:GetComponent(typeof(Image)).material = nil
				iter_195_1[iter_195_2] = nil

				PoolMgr.GetInstance():ReturnPrefab("chapter/cell_quad_mark", "", iter_195_3.gameObject)
			end

			table.clear(arg_195_0.markQuads[iter_195_0])
		end
	end
end

function var_0_0.CreateEdgeIndex(arg_196_0, arg_196_1, arg_196_2, arg_196_3)
	return ChapterCell.Line2Name(arg_196_0, arg_196_1) .. (arg_196_3 and "_" .. arg_196_3 or "") .. "_" .. arg_196_2
end

function var_0_0.CreateEdge(arg_197_0, arg_197_1, arg_197_2, arg_197_3, arg_197_4, arg_197_5, arg_197_6)
	if arg_197_1 <= 0 or arg_197_1 >= 16 then
		return
	end

	local var_197_0 = arg_197_0:GetEdgePool(arg_197_6)
	local var_197_1 = arg_197_0.contextData.chapterVO
	local var_197_2 = var_197_1.theme:GetLinePosition(arg_197_2.row, arg_197_2.column)
	local var_197_3 = var_197_1.theme.cellSize

	assert(arg_197_6, "Missing key, Please PM Programmer")

	local var_197_4 = 1
	local var_197_5 = 0

	while var_197_5 < 4 do
		var_197_5 = var_197_5 + 1

		if bit.band(arg_197_1, var_197_4) > 0 then
			local var_197_6 = arg_197_0.CreateEdgeIndex(arg_197_2.row, arg_197_2.column, var_197_5, arg_197_6)

			arg_197_0.cellEdges[arg_197_6] = arg_197_0.cellEdges[arg_197_6] or {}
			arg_197_0.cellEdges[arg_197_6][var_197_6] = arg_197_0.cellEdges[arg_197_6][var_197_6] or tf(var_197_0:Dequeue())

			local var_197_7 = arg_197_0.cellEdges[arg_197_6][var_197_6]

			var_197_7.name = var_197_6

			var_197_7:SetParent(arg_197_0.bottomMarkRoot, false)

			arg_197_4 = arg_197_4 or 0
			arg_197_5 = arg_197_5 or 3

			local var_197_8 = bit.band(var_197_5, 1) == 1 and var_197_3.x - arg_197_4 * 2 or var_197_3.y - arg_197_4 * 2
			local var_197_9 = arg_197_5

			var_197_7.sizeDelta = Vector2.New(var_197_8, var_197_9)
			var_197_7.pivot = Vector2.New(0.5, 0)

			local var_197_10 = math.pi * 0.5 * -var_197_5
			local var_197_11 = math.cos(var_197_10) * (var_197_3.x * 0.5 - arg_197_4)
			local var_197_12 = math.sin(var_197_10) * (var_197_3.y * 0.5 - arg_197_4)

			var_197_7.anchoredPosition = Vector2.New(var_197_11 + var_197_2.x, var_197_12 + var_197_2.y)
			var_197_7.localRotation = Quaternion.Euler(0, 0, (5 - var_197_5) * 90)

			if arg_197_3 then
				arg_197_0:startMarkTween(var_197_6, var_197_7)
			else
				arg_197_0:cancelMarkTween(var_197_6, var_197_7, 1)
			end
		end

		var_197_4 = var_197_4 * 2
	end
end

function var_0_0.ClearEdge(arg_198_0, arg_198_1)
	for iter_198_0, iter_198_1 in pairs(arg_198_0.cellEdges) do
		for iter_198_2 = 1, 4 do
			local var_198_0 = arg_198_0.CreateEdgeIndex(arg_198_1.row, arg_198_1.column, iter_198_2, iter_198_0)

			if iter_198_1[var_198_0] then
				local var_198_1 = arg_198_0:GetEdgePool(iter_198_0)
				local var_198_2 = tf(iter_198_1[var_198_0])

				arg_198_0:cancelMarkTween(var_198_0, var_198_2)
				var_198_1:Enqueue(var_198_2, false)

				iter_198_1[var_198_0] = nil
			end
		end
	end
end

function var_0_0.ClearEdges(arg_199_0, arg_199_1)
	if not next(arg_199_0.cellEdges) then
		return
	end

	for iter_199_0, iter_199_1 in pairs(arg_199_0.cellEdges) do
		if not arg_199_1 or arg_199_1 == iter_199_0 then
			local var_199_0 = arg_199_0:GetEdgePool(iter_199_0)

			for iter_199_2, iter_199_3 in pairs(iter_199_1) do
				arg_199_0:cancelMarkTween(iter_199_2, iter_199_3)
				var_199_0:Enqueue(go(iter_199_3), false)
			end

			arg_199_0.cellEdges[iter_199_0] = nil
		end
	end
end

function var_0_0.CreateOutlines(arg_200_0, arg_200_1, arg_200_2, arg_200_3, arg_200_4, arg_200_5)
	local var_200_0 = arg_200_0.contextData.chapterVO
	local var_200_1 = var_200_0.theme.cellSize + var_200_0.theme.cellSpace

	for iter_200_0, iter_200_1 in pairs(arg_200_1) do
		local var_200_2 = arg_200_0:GetEdgePool(arg_200_5)
		local var_200_3 = var_200_0.theme:GetLinePosition(iter_200_1.row / 2, iter_200_1.column / 2)

		assert(arg_200_5, "Missing key, Please PM Programmer")

		local var_200_4 = arg_200_0.CreateEdgeIndex(iter_200_1.row, iter_200_1.column, 0, arg_200_5)

		arg_200_0.cellEdges[arg_200_5] = arg_200_0.cellEdges[arg_200_5] or {}
		arg_200_0.cellEdges[arg_200_5][var_200_4] = arg_200_0.cellEdges[arg_200_5][var_200_4] or tf(var_200_2:Dequeue())

		local var_200_5 = arg_200_0.cellEdges[arg_200_5][var_200_4]

		var_200_5.name = var_200_4

		var_200_5:SetParent(arg_200_0.bottomMarkRoot, false)

		arg_200_3 = arg_200_3 or 0
		arg_200_4 = arg_200_4 or 3

		local var_200_6 = var_0_4[iter_200_1.normal][1] ~= 0 and var_200_1.x or var_200_1.y
		local var_200_7 = arg_200_4
		local var_200_8 = var_200_6 * 0.5
		local var_200_9 = iter_200_1.normal % 4 + 1
		local var_200_10 = (iter_200_1.normal + 2) % 4 + 1
		local var_200_11 = {
			iter_200_1.row + var_0_4[var_200_9][1],
			iter_200_1.column + var_0_4[var_200_9][2]
		}
		local var_200_12 = arg_200_1[var_200_11[1] + var_0_4[iter_200_1.normal][1] .. "_" .. var_200_11[2] + var_0_4[iter_200_1.normal][2]] or arg_200_1[var_200_11[1] - var_0_4[iter_200_1.normal][1] .. "_" .. var_200_11[2] - var_0_4[iter_200_1.normal][2]]
		local var_200_13 = {
			iter_200_1.row + var_0_4[var_200_10][1],
			iter_200_1.column + var_0_4[var_200_10][2]
		}
		local var_200_14 = arg_200_1[var_200_13[1] + var_0_4[iter_200_1.normal][1] .. "_" .. var_200_13[2] + var_0_4[iter_200_1.normal][2]] or arg_200_1[var_200_13[1] - var_0_4[iter_200_1.normal][1] .. "_" .. var_200_13[2] - var_0_4[iter_200_1.normal][2]]

		if var_200_12 then
			local var_200_15 = iter_200_1.row + var_0_4[iter_200_1.normal][1] == var_200_12.row + var_0_4[var_200_12.normal][1] or iter_200_1.column + var_0_4[iter_200_1.normal][2] == var_200_12.column + var_0_4[var_200_12.normal][2]

			var_200_6 = var_200_15 and var_200_6 + arg_200_3 or var_200_6 - arg_200_3
			var_200_8 = var_200_15 and var_200_8 + arg_200_3 or var_200_8 - arg_200_3
		end

		if var_200_14 then
			var_200_6 = (iter_200_1.row + var_0_4[iter_200_1.normal][1] == var_200_14.row + var_0_4[var_200_14.normal][1] or iter_200_1.column + var_0_4[iter_200_1.normal][2] == var_200_14.column + var_0_4[var_200_14.normal][2]) and var_200_6 + arg_200_3 or var_200_6 - arg_200_3
		end

		var_200_5.sizeDelta = Vector2.New(var_200_6, var_200_7)
		var_200_5.pivot = Vector2.New(var_200_8 / var_200_6, 0)

		local var_200_16 = var_0_4[iter_200_1.normal][2] * -arg_200_3
		local var_200_17 = var_0_4[iter_200_1.normal][1] * arg_200_3

		var_200_5.anchoredPosition = Vector2.New(var_200_16 + var_200_3.x, var_200_17 + var_200_3.y)
		var_200_5.localRotation = Quaternion.Euler(0, 0, (5 - iter_200_1.normal) * 90)

		if arg_200_2 then
			arg_200_0:startMarkTween(var_200_4, var_200_5)
		else
			arg_200_0:cancelMarkTween(var_200_4, var_200_5, 1)
		end
	end
end

function var_0_0.CreateOutlineCorners(arg_201_0, arg_201_1, arg_201_2, arg_201_3, arg_201_4, arg_201_5)
	local var_201_0 = arg_201_0.contextData.chapterVO

	for iter_201_0, iter_201_1 in pairs(arg_201_1) do
		local var_201_1 = arg_201_0:GetEdgePool(arg_201_5)
		local var_201_2 = var_201_0.theme:GetLinePosition(iter_201_1.row + var_0_5[iter_201_1.corner][1] * 0.5, iter_201_1.column + var_0_5[iter_201_1.corner][2] * 0.5)

		assert(arg_201_5, "Missing key, Please PM Programmer")

		local var_201_3 = arg_201_0.CreateEdgeIndex(iter_201_1.row, iter_201_1.column, iter_201_1.corner, arg_201_5)

		arg_201_0.cellEdges[arg_201_5] = arg_201_0.cellEdges[arg_201_5] or {}
		arg_201_0.cellEdges[arg_201_5][var_201_3] = arg_201_0.cellEdges[arg_201_5][var_201_3] or tf(var_201_1:Dequeue())

		local var_201_4 = arg_201_0.cellEdges[arg_201_5][var_201_3]

		var_201_4.name = var_201_3

		var_201_4:SetParent(arg_201_0.bottomMarkRoot, false)

		arg_201_3 = arg_201_3 or 0
		arg_201_4 = arg_201_4 or 3

		local var_201_5 = arg_201_4
		local var_201_6 = arg_201_4

		var_201_4.sizeDelta = Vector2.New(var_201_5, var_201_6)
		var_201_4.pivot = Vector2.New(1, 0)

		local var_201_7 = var_0_5[iter_201_1.corner][2] * -arg_201_3
		local var_201_8 = var_0_5[iter_201_1.corner][1] * arg_201_3

		var_201_4.anchoredPosition = Vector2.New(var_201_7 + var_201_2.x, var_201_8 + var_201_2.y)
		var_201_4.localRotation = Quaternion.Euler(0, 0, (5 - iter_201_1.corner) * 90)

		if arg_201_2 then
			arg_201_0:startMarkTween(var_201_3, var_201_4)
		else
			arg_201_0:cancelMarkTween(var_201_3, var_201_4, 1)
		end
	end
end

function var_0_0.updateCoastalGunAttachArea(arg_202_0)
	local var_202_0 = arg_202_0.contextData.chapterVO:getCoastalGunArea()

	arg_202_0:hideQuadMark(ChapterConst.MarkCoastalGun)
	arg_202_0:showQuadMark(var_202_0, ChapterConst.MarkCoastalGun, "cell_coastal_gun", Vector2(110, 110), nil, false)
end

function var_0_0.InitIdolsAnim(arg_203_0)
	local var_203_0 = arg_203_0.contextData.chapterVO
	local var_203_1 = pg.chapter_pop_template[var_203_0.id]

	if not var_203_1 then
		return
	end

	local var_203_2 = var_203_1.sd_location

	for iter_203_0, iter_203_1 in ipairs(var_203_2) do
		arg_203_0.idols = arg_203_0.idols or {}

		local var_203_3 = ChapterCell.Line2Name(iter_203_1[1][1], iter_203_1[1][2])
		local var_203_4 = arg_203_0.cellRoot:Find(var_203_3 .. "/" .. ChapterConst.ChildAttachment)

		assert(var_203_4, "cant find attachment")

		local var_203_5 = AttachmentSpineAnimationCell.New(var_203_4)

		var_203_5:SetLine({
			row = iter_203_1[1][1],
			column = iter_203_1[1][2]
		})
		table.insert(arg_203_0.idols, var_203_5)
		var_203_5:Set(iter_203_1[2])
		var_203_5:SetRoutine(var_203_1.sd_act[iter_203_0])
	end
end

function var_0_0.ClearIdolsAnim(arg_204_0)
	if arg_204_0.idols then
		for iter_204_0, iter_204_1 in ipairs(arg_204_0.idols) do
			iter_204_1:Clear()
		end

		table.clear(arg_204_0.idols)

		arg_204_0.idols = nil
	end
end

function var_0_0.GetEnemyCellView(arg_205_0, arg_205_1)
	local var_205_0 = _.detect(arg_205_0.cellChampions, function(arg_206_0)
		local var_206_0 = arg_206_0:GetLine()

		return var_206_0.row == arg_205_1.row and var_206_0.column == arg_205_1.column
	end)

	if not var_205_0 then
		local var_205_1 = ChapterCell.Line2Name(arg_205_1.row, arg_205_1.column)

		var_205_0 = arg_205_0.attachmentCells[var_205_1]
	end

	return var_205_0
end

function var_0_0.TransformLine2PlanePos(arg_207_0, arg_207_1)
	local var_207_0 = string.char(string.byte("A") + arg_207_1.column - arg_207_0.indexMin.y)
	local var_207_1 = string.char(string.byte("1") + arg_207_1.row - arg_207_0.indexMin.x)

	return var_207_0 .. var_207_1
end

function var_0_0.AlignListContainer(arg_208_0, arg_208_1)
	local var_208_0 = arg_208_0.childCount

	for iter_208_0 = arg_208_1, var_208_0 - 1 do
		local var_208_1 = arg_208_0:GetChild(iter_208_0)

		setActive(var_208_1, false)
	end

	for iter_208_1 = var_208_0, arg_208_1 - 1 do
		cloneTplTo(arg_208_0:GetChild(0), arg_208_0)
	end

	for iter_208_2 = 0, arg_208_1 - 1 do
		local var_208_2 = arg_208_0:GetChild(iter_208_2)

		setActive(var_208_2, true)
	end
end

function var_0_0.frozen(arg_209_0)
	arg_209_0.forzenCount = (arg_209_0.forzenCount or 0) + 1

	arg_209_0.parent:frozen()
end

function var_0_0.unfrozen(arg_210_0)
	if arg_210_0.exited then
		return
	end

	arg_210_0.forzenCount = (arg_210_0.forzenCount or 0) - 1

	arg_210_0.parent:unfrozen()
end

function var_0_0.isfrozen(arg_211_0)
	return arg_211_0.parent.frozenCount > 0
end

function var_0_0.clear(arg_212_0)
	arg_212_0:clearAll()

	if (arg_212_0.forzenCount or 0) > 0 then
		arg_212_0.parent:unfrozen(arg_212_0.forzenCount)
	end
end

return var_0_0
