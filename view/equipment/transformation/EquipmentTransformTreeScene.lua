local var_0_0 = class("EquipmentTransformTreeScene", import("view.base.BaseUI"))
local var_0_1 = require("Mgr/Pool/PoolPlural")
local var_0_2 = "ui/EquipmentTransformTreeUI_atlas"

function var_0_0.getUIName(arg_1_0)
	return "EquipmentTransformTreeUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		var_0_2,
		"weaponframes",
		"ui/iconcolorful"
	}

	table.insertto(var_2_0, arg_2_0:getEquipmentResList())

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.getEquipmentResList(arg_3_0)
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in pairs(EquipmentProxy.EquipmentTransformTreeTemplate or {}) do
		for iter_3_2, iter_3_3 in pairs(iter_3_1) do
			for iter_3_4, iter_3_5 in ipairs(iter_3_3.equipments or {}) do
				local var_3_1 = Equipment.getConfigData(iter_3_5[3])

				if var_3_1 and noEmptyStr(var_3_1.icon) then
					table.insert(var_3_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.Equipment.Equip, var_3_1.icon))
				end
			end
		end
	end

	return var_3_0
end

var_0_0.optionsPath = {
	"blur_panel/adapt/top/option"
}
var_0_0.MODE_NORMAL = 1
var_0_0.MODE_HIDESIDE = 2

function var_0_0.init(arg_4_0)
	arg_4_0.leftPanel = arg_4_0._tf:Find("Adapt/Left")
	arg_4_0.rightPanel = arg_4_0._tf:Find("Adapt/Right")
	arg_4_0.nationToggleGroup = arg_4_0.leftPanel:Find("Nations"):Find("ViewPort/Content")

	setActive(arg_4_0.nationToggleGroup:GetChild(0), false)
	arg_4_0.nationToggleGroup:GetChild(0):Find("selectedCursor").gameObject:SetActive(false)

	arg_4_0.equipmentTypeToggleGroup = arg_4_0.leftPanel:Find("EquipmentTypes"):Find("ViewPort/Content")

	setActive(arg_4_0.equipmentTypeToggleGroup:GetChild(0), false)
	arg_4_0.equipmentTypeToggleGroup:GetChild(0):Find("selectedframe").gameObject:SetActive(false)

	arg_4_0.TreeCanvas = arg_4_0.rightPanel:Find("ViewPort/Content")

	setActive(arg_4_0.rightPanel:Find("EquipNode"), false)
	setActive(arg_4_0.rightPanel:Find("Link"), false)

	arg_4_0.nodes = {}
	arg_4_0.links = {}
	arg_4_0.plurals = {
		EquipNode = var_0_1.New(arg_4_0.rightPanel:Find("EquipNode").gameObject, 5),
		Link = var_0_1.New(arg_4_0.rightPanel:Find("Link").gameObject, 8)
	}
	arg_4_0.pluralRoot = pg.PoolMgr.GetInstance().root
	arg_4_0.top = arg_4_0._tf:Find("blur_panel")
	arg_4_0.loader = AutoLoader.New()
end

function var_0_0.GetEnv(arg_5_0)
	arg_5_0.env = arg_5_0.env or {}

	return arg_5_0.env
end

function var_0_0.SetEnv(arg_6_0, arg_6_1)
	arg_6_0.env = arg_6_1
end

function var_0_0.didEnter(arg_7_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_7_0.top)
	onButton(arg_7_0, arg_7_0.top:Find("adapt/top/back"), function()
		arg_7_0:closeView()
	end, SFX_CANCEL)

	if arg_7_0.contextData.targetEquipId then
		local var_7_0
		local var_7_1
		local var_7_2 = false

		for iter_7_0, iter_7_1 in pairs(arg_7_0.env.nationsTree) do
			for iter_7_2, iter_7_3 in pairs(iter_7_1) do
				for iter_7_4, iter_7_5 in ipairs(iter_7_3.equipments) do
					if iter_7_5[3] == arg_7_0.contextData.targetEquipId then
						var_7_0, var_7_1 = iter_7_0, iter_7_2
						var_7_2 = true

						break
					end
				end
			end

			if var_7_2 then
				break
			end
		end

		if var_7_2 then
			arg_7_0.contextData.nation = var_7_0
			arg_7_0.contextData.equipmentTypeIndex = var_7_1
		end

		arg_7_0.contextData.targetEquipId = nil
	end

	arg_7_0:InitPage()

	if arg_7_0.contextData.mode == var_0_0.MODE_HIDESIDE then
		setActive(arg_7_0.leftPanel, false)

		local var_7_3 = arg_7_0.rightPanel.sizeDelta

		var_7_3.x = 0
		arg_7_0.rightPanel.sizeDelta = var_7_3

		setAnchoredPosition(arg_7_0.rightPanel, {
			x = 0
		})
	end
end

function var_0_0.GetSortKeys(arg_9_0)
	local var_9_0 = _.keys(arg_9_0)

	table.sort(var_9_0, function(arg_10_0, arg_10_1)
		return arg_10_0 < arg_10_1
	end)

	return var_9_0
end

function var_0_0.GetSortTypes(arg_11_0)
	local var_11_0 = _.values(arg_11_0)

	table.sort(var_11_0, function(arg_12_0, arg_12_1)
		return arg_12_0.id < arg_12_1.id
	end)

	return _.map(var_11_0, function(arg_13_0)
		return arg_13_0.category2
	end)
end

function var_0_0.InitPage(arg_14_0)
	arg_14_0.firstInit = true

	local var_14_0 = arg_14_0.contextData
	local var_14_1 = arg_14_0.env

	var_14_0.mode = var_14_0.mode or var_0_0.MODE_NORMAL

	local var_14_2 = var_14_0.nation
	local var_14_3 = var_0_0.GetSortKeys(var_14_1.nationsTree)

	if not var_14_2 or not table.contains(var_14_3, var_14_2) then
		var_14_2 = var_14_3[1]
	end

	if next(var_14_1.nationsTree[var_14_2]) == nil then
		for iter_14_0 = 2, #var_14_3 do
			if next(var_14_1.nationsTree[var_14_3[iter_14_0]]) ~= nil then
				var_14_2 = var_14_3[iter_14_0]

				break
			end
		end
	end

	var_14_0.nation = nil

	arg_14_0:UpdateNations()

	local var_14_4 = table.indexof(var_14_3, var_14_2) or 1

	triggerButton(arg_14_0.nationToggles[var_14_4])

	arg_14_0.firstInit = nil
end

function var_0_0.UpdateNations(arg_15_0)
	local var_15_0 = var_0_0.GetSortKeys(arg_15_0.env.nationsTree)

	arg_15_0.nationToggles = CustomIndexLayer.Clone2Full(arg_15_0.nationToggleGroup, #var_15_0)

	for iter_15_0 = 1, #arg_15_0.nationToggles do
		local var_15_1 = arg_15_0.nationToggles[iter_15_0]
		local var_15_2 = var_15_0[iter_15_0]

		arg_15_0.loader:GetSprite(var_0_2, "nation" .. var_15_2 .. "_disable", var_15_1:Find("selectedIcon"))
		setActive(var_15_1:Find("selectedCursor"), false)
		onButton(arg_15_0, var_15_1, function()
			if arg_15_0.contextData.nation ~= var_15_2 then
				if next(arg_15_0.env.nationsTree[var_15_2]) == nil then
					pg.TipsMgr.GetInstance():ShowTips(i18n("word_comingSoon"))

					return
				end

				arg_15_0.loader:GetSprite(var_0_2, "nation" .. var_15_2, var_15_1:Find("selectedIcon"))

				if arg_15_0.contextData.nation then
					local var_16_0 = table.indexof(var_15_0, arg_15_0.contextData.nation)

					setActive(arg_15_0.nationToggles[var_16_0]:Find("selectedCursor"), false)
					arg_15_0.loader:GetSprite(var_0_2, "nation" .. arg_15_0.contextData.nation .. "_disable", arg_15_0.nationToggles[var_16_0]:Find("selectedIcon"))
				end

				arg_15_0.contextData.nation = var_15_2

				arg_15_0:UpdateEquipmentTypes()

				local var_16_1 = var_0_0.GetSortTypes(arg_15_0.env.nationsTree[var_15_2])
				local var_16_2 = var_16_1[1]

				if arg_15_0.firstInit then
					local var_16_3 = arg_15_0.contextData.equipmentTypeIndex

					if var_16_3 and table.contains(var_16_1, var_16_3) then
						var_16_2 = var_16_3
					end
				end

				arg_15_0.contextData.equipmentTypeIndex = nil

				local var_16_4 = table.indexof(var_16_1, var_16_2) or 1

				triggerToggle(arg_15_0.equipmentTypeToggles[var_16_4], true)
			end
		end, SFX_UI_TAG)
	end
end

function var_0_0.UpdateEquipmentTypes(arg_17_0)
	local var_17_0 = var_0_0.GetSortTypes(arg_17_0.env.nationsTree[arg_17_0.contextData.nation])

	arg_17_0.equipmentTypeToggles = CustomIndexLayer.Clone2Full(arg_17_0.equipmentTypeToggleGroup, #var_17_0)

	for iter_17_0 = 1, #arg_17_0.equipmentTypeToggles do
		local var_17_1 = arg_17_0.equipmentTypeToggles[iter_17_0]

		var_17_1:GetComponent(typeof(Toggle)).isOn = false

		local var_17_2 = var_17_0[iter_17_0]

		arg_17_0.loader:GetSprite(var_0_2, "equipmentType" .. var_17_2, var_17_1:Find("itemName"), true)
		setActive(var_17_1:Find("selectedframe"), false)
		onToggle(arg_17_0, var_17_1, function(arg_18_0)
			if arg_18_0 and arg_17_0.contextData.equipmentTypeIndex ~= var_17_2 then
				arg_17_0.contextData.equipmentTypeIndex = var_17_2

				arg_17_0:ResetCanvas()
			end

			setActive(var_17_1:Find("selectedframe"), arg_18_0)
		end, SFX_UI_TAG)
	end

	arg_17_0.equipmentTypeToggleGroup.anchoredPosition = Vector2.zero
	arg_17_0.leftPanel:Find("EquipmentTypes"):GetComponent(typeof(ScrollRect)).velocity = Vector2.zero
end

local var_0_3 = {
	15,
	-4,
	15,
	6
}

function var_0_0.ResetCanvas(arg_19_0)
	local var_19_0 = EquipmentProxy.EquipmentTransformTreeTemplate[arg_19_0.contextData.nation][arg_19_0.contextData.equipmentTypeIndex]

	assert(var_19_0, "can't find Equip_upgrade_template Nation: " .. arg_19_0.contextData.nation .. " Type: " .. arg_19_0.contextData.equipmentTypeIndex)

	arg_19_0.TreeCanvas.sizeDelta = Vector2(unpack(var_19_0.canvasSize))
	arg_19_0.TreeCanvas.anchoredPosition = Vector2.zero
	arg_19_0.rightPanel:GetComponent(typeof(ScrollRect)).velocity = Vector2.zero

	arg_19_0:ReturnCanvasItems()

	for iter_19_0, iter_19_1 in ipairs(var_19_0.equipments) do
		local var_19_1 = arg_19_0.plurals.EquipNode:Dequeue()

		setActive(var_19_1, true)
		setParent(var_19_1, arg_19_0.TreeCanvas)
		table.insert(arg_19_0.nodes, {
			id = iter_19_1[3],
			cfg = iter_19_1,
			go = var_19_1
		})

		var_19_1.name = iter_19_1[3]

		arg_19_0:UpdateItemNode(tf(var_19_1), iter_19_1)
	end

	for iter_19_2, iter_19_3 in ipairs(var_19_0.links) do
		for iter_19_4 = 1, #iter_19_3 - 1 do
			local var_19_2 = iter_19_3[iter_19_4]
			local var_19_3 = iter_19_3[iter_19_4 + 1]
			local var_19_4 = {
				var_19_3[1] - var_19_2[1],
				var_19_2[2] - var_19_3[2]
			}
			local var_19_5 = math.abs(var_19_4[1]) > math.abs(var_19_4[2])
			local var_19_6 = var_19_5 and math.abs(var_19_4[1]) or math.abs(var_19_4[2])

			if var_19_5 then
				var_19_4[2] = 0
			else
				var_19_4[1] = 0
			end

			local var_19_7 = 1 - math.sign(var_19_4[1])

			var_19_7 = var_19_7 ~= 1 and var_19_7 or 2 - math.sign(var_19_4[2])

			local var_19_8 = math.deg2Rad * 90 * var_19_7

			if #iter_19_3 == 2 then
				local var_19_9 = arg_19_0.plurals.Link:Dequeue()

				table.insert(arg_19_0.links, go(var_19_9))
				setActive(var_19_9, true)
				setParent(var_19_9, arg_19_0.TreeCanvas)
				arg_19_0.loader:GetSprite(var_0_2, var_19_4[2] == 0 and "wirehead" or "wireline", var_19_9)

				tf(var_19_9).sizeDelta = Vector2(28, 26)
				tf(var_19_9).pivot = Vector2(0.5, 0.5)
				tf(var_19_9).localRotation = Quaternion.Euler(0, 0, var_19_7 * 90)

				local var_19_10 = Vector2(math.cos(var_19_8), math.sin(var_19_8)) * var_0_3[(var_19_7 - 1) % 4 + 1]

				tf(var_19_9).anchoredPosition = Vector2(var_19_2[1] + var_19_10.x, -var_19_2[2] + var_19_10.y)

				local var_19_11 = arg_19_0.plurals.Link:Dequeue()

				table.insert(arg_19_0.links, go(var_19_11))
				setActive(var_19_11, true)
				setParent(var_19_11, arg_19_0.TreeCanvas)
				arg_19_0.loader:GetSprite(var_0_2, "wiretail", var_19_11)

				tf(var_19_11).sizeDelta = Vector2(28, 26)
				tf(var_19_11).pivot = Vector2(0.5, 0.5)
				tf(var_19_11).localRotation = Quaternion.Euler(0, 0, var_19_7 * 90)

				local var_19_12 = Vector2(math.cos(var_19_8), math.sin(var_19_8)) * -var_0_3[(var_19_7 + 1) % 4 + 1]

				tf(var_19_11).anchoredPosition = Vector2(var_19_3[1] + var_19_12.x, -var_19_3[2] + var_19_12.y)

				local var_19_13 = arg_19_0.plurals.Link:Dequeue()

				table.insert(arg_19_0.links, go(var_19_13))
				setActive(var_19_13, true)
				setParent(var_19_13, arg_19_0.TreeCanvas)
				arg_19_0.loader:GetSprite(var_0_2, "wireline", var_19_13)

				tf(var_19_13).sizeDelta = Vector2(math.max(0, var_19_6 - var_0_3[(var_19_7 - 1) % 4 + 1] - var_0_3[(var_19_7 + 1) % 4 + 1] - 28), 16)
				tf(var_19_13).pivot = Vector2(0, 0.5)
				tf(var_19_13).localRotation = Quaternion.Euler(0, 0, var_19_7 * 90)

				local var_19_14 = Vector2(math.cos(var_19_8), math.sin(var_19_8)) * 14

				tf(var_19_13).anchoredPosition = Vector2(var_19_2[1] + var_19_10.x, -var_19_2[2] + var_19_10.y) + var_19_14

				break
			end

			local var_19_15 = arg_19_0.plurals.Link:Dequeue()

			table.insert(arg_19_0.links, go(var_19_15))
			setActive(var_19_15, true)
			setParent(var_19_15, arg_19_0.TreeCanvas)

			local var_19_16 = 1

			if iter_19_4 == 1 then
				arg_19_0.loader:GetSprite(var_0_2, var_19_4[2] == 0 and "wirehead" or "wireline", var_19_15)

				local var_19_17 = var_19_6 + 14 + var_19_16 - var_0_3[(var_19_7 - 1) % 4 + 1]

				tf(var_19_15).sizeDelta = Vector2(var_19_17, 26)
				tf(var_19_15).pivot = Vector2((var_19_17 - var_19_16) / var_19_17, 0.5)
				tf(var_19_15).localRotation = Quaternion.Euler(0, 0, var_19_7 * 90)
				tf(var_19_15).anchoredPosition = Vector2(var_19_3[1], -var_19_3[2])
			elseif iter_19_4 + 1 == #iter_19_3 then
				arg_19_0.loader:GetSprite(var_0_2, "wiretail", var_19_15)

				tf(var_19_15).sizeDelta = Vector2(var_19_6 + 14 + var_19_16 - var_0_3[(var_19_7 + 1) % 4 + 1], 26)
				tf(var_19_15).pivot = Vector2(var_19_16 / (var_19_6 + 14 + var_19_16 - var_0_3[(var_19_7 + 1) % 4 + 1]), 0.5)
				tf(var_19_15).localRotation = Quaternion.Euler(0, 0, var_19_7 * 90)
				tf(var_19_15).anchoredPosition = Vector2(var_19_2[1], -var_19_2[2])
			else
				arg_19_0.loader:GetSprite(var_0_2, "wireline", var_19_15)

				tf(var_19_15).sizeDelta = Vector2(var_19_6 + var_19_16 * 2, 16)
				tf(var_19_15).pivot = Vector2(var_19_16 / (var_19_6 + var_19_16 * 2), 0.5)
				tf(var_19_15).localRotation = Quaternion.Euler(0, 0, var_19_7 * 90)
				tf(var_19_15).anchoredPosition = Vector2(var_19_2[1], -var_19_2[2])
			end
		end
	end
end

function var_0_0.UpdateItemNode(arg_20_0, arg_20_1, arg_20_2)
	arg_20_1 = tf(arg_20_1)
	arg_20_1.anchoredPosition = Vector2(arg_20_2[1], -arg_20_2[2])

	updateDrop(arg_20_1:Find("Item"), {
		id = arg_20_2[3],
		type = DROP_TYPE_EQUIP
	})
	onButton(arg_20_0, arg_20_1:Find("Item"), function()
		local var_21_0 = EquipmentProxy.GetTransformSources(arg_20_2[3])[1]

		if not var_21_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_upgrade_initial_node"))

			return
		end

		arg_20_0:emit(EquipmentTransformTreeMediator.OPEN_LAYER, Context.New({
			mediator = EquipmentTransformMediator,
			viewComponent = EquipmentTransformLayer,
			data = {
				formulaId = var_21_0
			}
		}))
	end, SFX_PANEL)
	arg_20_1:Find("Mask/NameText"):GetComponent("ScrollText"):SetText(Equipment.getConfigData(arg_20_2[3]).name)

	local var_20_0 = arg_20_0.env.tracebackHelper:GetSortedEquipTraceBack(arg_20_2[3])
	local var_20_1 = _.any(var_20_0, function(arg_22_0)
		local var_22_0 = arg_22_0.candicates

		return var_22_0 and #var_22_0 > 0 and EquipmentTransformUtil.CheckTransformFormulasSucceed(arg_22_0.formulas, var_22_0[#var_22_0])
	end)

	setActive(arg_20_1:Find("cratfable"), var_20_1)
	onButton(arg_20_0, arg_20_1:Find("cratfable"), function()
		arg_20_0:emit(EquipmentTransformTreeMediator.OPEN_LAYER, Context.New({
			mediator = EquipmentTraceBackMediator,
			viewComponent = EquipmentTraceBackLayer,
			data = {
				TargetEquipmentId = arg_20_2[3]
			}
		}))
	end)

	local var_20_2 = arg_20_2[4] and PlayerPrefs.GetInt("ShowTransformTip_" .. arg_20_2[3], 0) == 0

	setActive(arg_20_1:Find("Item/new"), var_20_2)
end

function var_0_0.UpdateItemNodes(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.nodes) do
		arg_24_0:UpdateItemNode(iter_24_1.go, iter_24_1.cfg)
	end
end

function var_0_0.UpdateItemNodeByID(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.nodes) do
		if arg_25_1 == iter_25_1.id then
			arg_25_0:UpdateItemNode(iter_25_1.go, iter_25_1.cfg)

			break
		end
	end
end

function var_0_0.ReturnCanvasItems(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in ipairs(arg_26_0.nodes) do
		if not arg_26_0.plurals.EquipNode:Enqueue(iter_26_1.go, arg_26_1) then
			setParent(iter_26_1.go, arg_26_0.pluralRoot)
		end
	end

	table.clean(arg_26_0.nodes)

	for iter_26_2, iter_26_3 in ipairs(arg_26_0.links) do
		if not arg_26_0.plurals.Link:Enqueue(iter_26_3, arg_26_1) then
			setParent(iter_26_3, arg_26_0.pluralRoot)
		end
	end

	table.clean(arg_26_0.links)
end

function var_0_0.willExit(arg_27_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_27_0.top, arg_27_0._tf)
	arg_27_0:ReturnCanvasItems(true)

	for iter_27_0, iter_27_1 in pairs(arg_27_0.plurals) do
		iter_27_1:Clear()
	end

	arg_27_0.loader:Clear()
end

return var_0_0
