local var_0_0 = class("ShipRemouldLayer", import("..base.BaseUI"))
local var_0_1 = 5
local var_0_2 = 6
local var_0_3 = 1
local var_0_4 = 9
local var_0_5 = 55
local var_0_6 = Vector2(-5, 25)

function var_0_0.getUIName(arg_1_0)
	return "ShipRemouldUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "ShipMainScene"
end

function var_0_0.getResource(arg_3_0, arg_3_1)
	local var_3_0 = {
		"modicon"
	}

	table.insertto(var_3_0, var_0_0.super.getResource(arg_3_0, arg_3_1))

	return var_3_0
end

function var_0_0.init(arg_4_0)
	arg_4_0.container = arg_4_0._tf:Find("main/bg/container")
	arg_4_0.gridContainer = arg_4_0.container:Find("grids")
	arg_4_0.gridTF = arg_4_0.gridContainer:Find("grid_tpl")
	arg_4_0.height = arg_4_0.gridTF.sizeDelta.y + var_0_5
	arg_4_0.width = arg_4_0.gridTF.sizeDelta.x + var_0_4
	arg_4_0.startPos = Vector2(-1 * ((var_0_2 / 2 - 0.5) * arg_4_0.width) + var_0_6.x, (var_0_1 / 2 - 0.5) * arg_4_0.height + var_0_6.y)
	arg_4_0.containerWidth = var_0_2 * arg_4_0.gridTF.sizeDelta.x + (var_0_2 - 1) * var_0_4
	arg_4_0.containerHeight = var_0_1 * arg_4_0.gridTF.sizeDelta.y + (var_0_1 - 1) * var_0_5
	arg_4_0.container.sizeDelta = Vector2(arg_4_0.containerWidth, arg_4_0.containerHeight)

	setActive(arg_4_0.gridTF, false)

	arg_4_0.infoPanel = arg_4_0._tf:Find("main/info_panel")
	arg_4_0.itemContainer = arg_4_0.infoPanel:Find("usages/items")
	arg_4_0.itemTF = arg_4_0.itemContainer:Find("itemTF")
	arg_4_0.infoName = arg_4_0.infoPanel:Find("name_container/Text"):GetComponent(typeof(Text))
	arg_4_0.attrContainer = arg_4_0.infoPanel:Find("align/attrs")
	arg_4_0.attrTpl = arg_4_0:getTpl("attr", arg_4_0.attrContainer)
	arg_4_0.attrTplD = arg_4_0:getTpl("attrd", arg_4_0.attrContainer)
	arg_4_0.confirmBtn = arg_4_0.infoPanel:Find("confirm_btn/activity")
	arg_4_0.inactiveBtn = arg_4_0.infoPanel:Find("confirm_btn/inactivity")
	arg_4_0.completedteBtn = arg_4_0.infoPanel:Find("confirm_btn/complete")
	arg_4_0.shipTF = arg_4_0._tf:Find("main/info_panel/usages/shipTF")
	arg_4_0.skillDesc = arg_4_0.infoPanel:Find("align/skill_desc/text")
	arg_4_0.shipContainer = arg_4_0.infoPanel:Find("char_container")
	arg_4_0.lineTpl = arg_4_0._tf:Find("resources/line")
	arg_4_0.lineContainer = arg_4_0.container:Find("grids/lines")
	arg_4_0.helpBtn = GameObject.Find("/OverlayCamera/Overlay/UIMain/common/help_btn")

	if not IsNil(arg_4_0.helpBtn) then
		setActive(arg_4_0.helpBtn, false)
	end

	arg_4_0.tooltip = arg_4_0._tf:Find("tooltip")

	setActive(arg_4_0.tooltip, false)
end

function var_0_0.setPlayer(arg_5_0, arg_5_1)
	arg_5_0.playerVO = arg_5_1

	if arg_5_0.curtransformId then
		arg_5_0:updateInfo(arg_5_0.curtransformId)
	end
end

function var_0_0.setItems(arg_6_0, arg_6_1)
	arg_6_0.itemsVO = arg_6_1
end

function var_0_0.getItemCount(arg_7_0, arg_7_1)
	return (arg_7_0.itemsVO[arg_7_1] or Item.New({
		count = 0,
		id = arg_7_1
	})).count
end

function var_0_0.setShipVO(arg_8_0, arg_8_1)
	arg_8_0.shipVO = arg_8_1
	arg_8_0.shipGroupId = math.floor(arg_8_0.shipVO:getGroupId())
end

function var_0_0.getShipTranformData(arg_9_0)
	local var_9_0 = pg.ship_data_trans[arg_9_0.shipGroupId]

	assert(var_9_0, "config missed [pg.ship_data_trans] shipGroup>>>." .. arg_9_0.shipGroupId)

	local var_9_1 = {}

	for iter_9_0, iter_9_1 in ipairs(var_9_0.transform_list) do
		for iter_9_2, iter_9_3 in ipairs(iter_9_1) do
			var_9_1[iter_9_3[2]] = Vector2(iter_9_0, iter_9_3[1])
		end
	end

	return var_9_1
end

function var_0_0.didEnter(arg_10_0)
	arg_10_0:initTranformInfo()
	arg_10_0:initShipModel()
end

function var_0_0.initTranformInfo(arg_11_0)
	arg_11_0.transformIds = arg_11_0:getShipTranformData()
	arg_11_0.grids = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0.transformIds) do
		local var_11_0 = cloneTplTo(arg_11_0.gridTF, arg_11_0.gridContainer)

		go(var_11_0).name = iter_11_0
		var_11_0.localPosition = Vector2(arg_11_0.startPos.x + arg_11_0.width * (iter_11_1.x - 1), arg_11_0.startPos.y - arg_11_0.height * (iter_11_1.y - 1))

		onToggle(arg_11_0, var_11_0, function(arg_12_0)
			if arg_12_0 and arg_11_0.curtransformId ~= iter_11_0 then
				arg_11_0:updateInfo(iter_11_0)
			end
		end, SFX_PANEL)

		arg_11_0.grids[iter_11_0] = var_11_0
	end

	arg_11_0.lineTFs = {}

	for iter_11_2, iter_11_3 in pairs(arg_11_0.transformIds) do
		arg_11_0:initLines(iter_11_2)
	end

	arg_11_0.posTransId = {}

	arg_11_0:updateLines()

	if arg_11_0.contextData.transformId then
		assert(arg_11_0.grids[arg_11_0.contextData.transformId], "without this transform id:" .. arg_11_0.contextData.transformId)
		triggerToggle(arg_11_0.grids[arg_11_0.contextData.transformId], true)
	end
end

function var_0_0.initLines(arg_13_0, arg_13_1)
	local var_13_0 = 270
	local var_13_1 = 75

	arg_13_0.lineTFs[arg_13_1] = {}

	local var_13_2 = arg_13_0.transformIds[arg_13_1].x
	local var_13_3 = arg_13_0.transformIds[arg_13_1].y
	local var_13_4 = arg_13_0.grids[arg_13_1]
	local var_13_5 = var_13_4.sizeDelta
	local var_13_6 = var_13_4.localPosition
	local var_13_7 = arg_13_0.lineTpl
	local var_13_8 = pg.transform_data_template[arg_13_1].condition_id

	for iter_13_0, iter_13_1 in pairs(var_13_8) do
		local var_13_9 = arg_13_0.transformIds[iter_13_1].x
		local var_13_10 = arg_13_0.transformIds[iter_13_1].y
		local var_13_11 = Vector2(var_13_9 - var_13_2, var_13_10 - var_13_3)

		if var_13_11 ~= Vector2.zero then
			local var_13_12 = cloneTplTo(var_13_7, arg_13_0.lineContainer, var_13_2 .. "-" .. var_13_3 .. "-v")
			local var_13_13 = cloneTplTo(var_13_7, arg_13_0.lineContainer, var_13_2 .. "-" .. var_13_3 .. "-h")
			local var_13_14 = var_13_11.y < 0 and 90 or -90

			var_13_12.eulerAngles = Vector3(0, 0, var_13_14)

			local var_13_15 = var_13_11.x < 0 and 180 or 0

			var_13_13.eulerAngles = Vector3(0, 0, var_13_15)

			local var_13_16 = math.abs(var_13_11.y) > 0 and math.abs(var_13_11.x) > 0

			if var_13_16 then
				local var_13_17 = var_13_6.y + (var_13_3 - var_13_10) * var_13_0

				var_13_13.localPosition = Vector2(var_13_6.x, var_13_17, 0)

				local var_13_18 = var_13_11.y < 0 and var_13_6.y + var_13_5.y / 2 or var_13_6.y - var_13_5.y / 2

				var_13_12.localPosition = Vector2(var_13_6.x, var_13_18)
				var_13_13.sizeDelta = Vector2(math.abs(var_13_11.x) * var_13_0, var_13_13.sizeDelta.y)
				var_13_12.sizeDelta = Vector2(math.abs(var_13_11.y) * var_13_0 - var_13_5.y / 2, var_13_12.sizeDelta.y)

				local var_13_19 = var_13_11.x < 0 and var_13_14 < 0 and -1 or 1

				var_13_12:Find("corner").localScale = Vector3(1, var_13_19, 1)
			else
				var_13_13.sizeDelta = Vector2(math.abs(var_13_11.x) * var_13_0, var_13_13.sizeDelta.y)
				var_13_12.sizeDelta = Vector2(math.abs(var_13_11.y) * var_13_1, var_13_12.sizeDelta.y)
				var_13_13.localPosition = var_13_6

				local var_13_20 = var_13_11.y < 0 and var_13_6.y + var_13_5.y / 2 or var_13_6.y - var_13_5.y / 2

				var_13_12.localPosition = Vector3(var_13_6.x, var_13_20, 0)
			end

			setActive(var_13_12:Find("arr"), var_13_16 or math.abs(var_13_11.y) > 0)
			setActive(var_13_12:Find("corner"), var_13_16)
			setActive(var_13_13:Find("arr"), false)
			setActive(var_13_13:Find("corner"), false)
			table.insert(arg_13_0.lineTFs[arg_13_1], {
				id = iter_13_1,
				hrz = var_13_13,
				vec = var_13_12
			})
		end
	end
end

function var_0_0.updateLines(arg_14_0)
	for iter_14_0, iter_14_1 in pairs(arg_14_0.transformIds) do
		arg_14_0:updateGridTF(iter_14_0)

		if arg_14_0:canRemould(iter_14_0) or arg_14_0:isFinished(iter_14_0) then
			for iter_14_2, iter_14_3 in ipairs(arg_14_0.lineTFs[iter_14_0] or {}) do
				iter_14_3.hrz:GetComponent("UIGrayScale").enabled = false
				iter_14_3.vec:GetComponent("UIGrayScale").enabled = false
			end
		end
	end
end

function var_0_0.getLevelById(arg_15_0, arg_15_1)
	return pg.transform_data_template[arg_15_1].level_limit
end

function var_0_0.getTransformLevel(arg_16_0, arg_16_1)
	if not arg_16_0.shipVO.transforms[arg_16_1] then
		return 0
	else
		return arg_16_0.shipVO.transforms[arg_16_1].level
	end
end

var_0_0.STATE_FINISHED = 1
var_0_0.STATE_ACTIVE = 2
var_0_0.STATE_LOCK = 3

function var_0_0.getTransformState(arg_17_0, arg_17_1)
	if arg_17_0:getTransformLevel(arg_17_1) == pg.transform_data_template[arg_17_1].max_level then
		return var_0_0.STATE_FINISHED
	elseif arg_17_0:canRemould(arg_17_1) then
		return var_0_0.STATE_ACTIVE
	else
		return var_0_0.STATE_LOCK
	end
end

function var_0_0.updateGridTF(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.grids[arg_18_1]
	local var_18_1 = pg.transform_data_template[arg_18_1]

	setText(var_18_0:Find("name"), var_18_1.name)

	local var_18_2 = var_18_0:Find("icon"):GetComponent(typeof(Image))

	GetSpriteFromAtlasAsync("modicon", var_18_1.icon, function(arg_19_0)
		if not IsNil(var_18_2) then
			var_18_2.sprite = arg_19_0
		end
	end)

	local var_18_3 = arg_18_0:getTransformState(arg_18_1)

	setActive(var_18_0:Find("bgs/finished"), var_18_3 == var_0_0.STATE_FINISHED)
	setActive(var_18_0:Find("bgs/ongoing"), var_18_3 == var_0_0.STATE_ACTIVE)
	setActive(var_18_0:Find("bgs/lock"), var_18_3 == var_0_0.STATE_LOCK)
	setActive(var_18_0:Find("tags/finished"), var_18_3 == var_0_0.STATE_FINISHED)
	setActive(var_18_0:Find("tags/ongoing"), var_18_3 == var_0_0.STATE_ACTIVE)
	setActive(var_18_0:Find("tags/lock"), var_18_3 == var_0_0.STATE_LOCK)

	local var_18_4 = arg_18_0:getTransformLevel(arg_18_1)
	local var_18_5 = var_18_0:Find("icon/progress")

	if var_18_3 == var_0_0.STATE_FINISHED then
		setText(var_18_5, var_18_4 .. "/" .. var_18_1.max_level)
	elseif var_18_3 == var_0_0.STATE_ACTIVE then
		setText(var_18_5, var_18_4 .. "/" .. var_18_1.max_level)
	elseif var_18_3 == var_0_0.STATE_LOCK then
		local var_18_6, var_18_7, var_18_8 = arg_18_0:canRemould(arg_18_1)

		setText(var_18_5, "")
		setActive(var_18_0:Find("tags/lock/lock_prev"), var_18_8 and var_18_8[1] == 1)
		setActive(var_18_0:Find("tags/lock/lock_level"), var_18_8 and var_18_8[1] == 2)
		setActive(var_18_0:Find("tags/lock/lock_star"), var_18_8 and var_18_8[1] == 3)

		if var_18_8 and var_18_8[1] == 2 then
			setText(var_18_0:Find("tags/lock/lock_level/Text"), var_18_8[2])
		elseif var_18_8 and var_18_8[1] == 3 then
			setText(var_18_0:Find("tags/lock/lock_star/Text"), var_18_8[2])
		end
	end

	local var_18_9 = arg_18_0.transformIds[arg_18_1].x .. "_" .. arg_18_0.transformIds[arg_18_1].y

	if not arg_18_0.posTransId[var_18_9] then
		arg_18_0.posTransId[var_18_9] = arg_18_1
	elseif arg_18_0.posTransId[var_18_9] == arg_18_1 then
		-- block empty
	elseif var_18_3 == var_0_0.STATE_ACTIVE or arg_18_0:getTransformState(arg_18_0.posTransId[var_18_9]) ~= var_0_0.STATE_ACTIVE and arg_18_1 < arg_18_0.posTransId[var_18_9] then
		if arg_18_0.posTransId[var_18_9] == arg_18_0.curtransformId then
			arg_18_0.curtransformId = arg_18_1
		end

		setActive(arg_18_0.grids[arg_18_0.posTransId[var_18_9]], false)

		arg_18_0.posTransId[var_18_9] = arg_18_1
	end

	setActive(var_18_0, arg_18_1 == arg_18_0.posTransId[var_18_9])

	if arg_18_0.curtransformId == arg_18_1 then
		arg_18_0:updateInfo(arg_18_1)
	end
end

function var_0_0.initShipModel(arg_20_0)
	local var_20_0 = arg_20_0.shipVO:getPrefab()

	if arg_20_0.shipContainer.childCount ~= 0 then
		arg_20_0.shipModel:Dispose()
	end

	local function var_20_1(arg_21_0)
		if not IsNil(arg_20_0._tf) then
			arg_20_0.shipModel = arg_21_0

			arg_21_0:SetLayer(Layer.UI)
			arg_21_0:SetLocalScale(Vector3(var_0_3, var_0_3, 1))
			arg_21_0:SetParent(arg_20_0.shipContainer)
			arg_21_0:SetLocalPosition(Vector2(0, 10))
			arg_21_0:SetAction("stand2", 0)
		end
	end

	local var_20_2 = SpineAnimChar.New()

	var_20_2:SetPaint(var_20_0)
	var_20_2:Load(true, function(arg_22_0)
		var_20_1(arg_22_0)
	end)
end

function var_0_0.updateInfo(arg_23_0, arg_23_1)
	if arg_23_0:isFinished(arg_23_1) then
		arg_23_0:updateFinished(arg_23_1)
	else
		arg_23_0:updateProgress(arg_23_1)
	end
end

function var_0_0.updateFinished(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.shipVO.transforms[arg_24_1].level

	arg_24_0.curtransformId = arg_24_1

	local var_24_1 = pg.transform_data_template[arg_24_1]

	arg_24_0.infoName.text = var_24_1.name

	local var_24_2 = {}

	for iter_24_0 = 1, var_24_0 do
		_.each(var_24_1.use_item[iter_24_0], function(arg_25_0)
			local var_25_0 = _.detect(var_24_2, function(arg_26_0)
				return arg_26_0.type == DROP_TYPE_ITEM and arg_26_0.id == arg_25_0[1]
			end)

			if not var_25_0 then
				table.insert(var_24_2, {
					type = DROP_TYPE_ITEM,
					id = arg_25_0[1],
					count = arg_25_0[2]
				})
			else
				var_25_0.count = var_25_0.count + arg_25_0[2]
			end
		end)
	end

	table.insert(var_24_2, {
		type = DROP_TYPE_ITEM,
		id = id2ItemId(PlayerConst.ResGold),
		count = var_24_1.use_gold * var_24_0
	})

	for iter_24_1 = arg_24_0.itemContainer.childCount, #var_24_2 - 1 do
		cloneTplTo(arg_24_0.itemTF, arg_24_0.itemContainer)
	end

	local var_24_3 = arg_24_0.itemContainer.childCount

	for iter_24_2 = 1, var_24_3 do
		local var_24_4 = arg_24_0.itemContainer:GetChild(iter_24_2 - 1)

		setActive(var_24_4, iter_24_2 <= #var_24_2)

		if iter_24_2 <= #var_24_2 then
			updateDrop(var_24_4:Find("IconTpl"), var_24_2[iter_24_2])
			RemoveComponent(var_24_4, typeof(Button))
		end
	end

	setActive(arg_24_0.shipTF, var_24_1.use_ship > 0)

	if var_24_1.use_ship > 0 then
		setActive(arg_24_0.shipTF:Find("addTF"), false)
		setActive(arg_24_0.shipTF:Find("IconTpl"), true)
		updateDrop(arg_24_0.shipTF:Find("IconTpl"), {
			type = DROP_TYPE_SHIP,
			id = arg_24_0.shipVO.configId
		})
		removeOnButton(arg_24_0.shipTF)
	end

	setActive(arg_24_0.skillDesc.parent, var_24_1.skill_id ~= 0)

	if var_24_1.skill_id ~= 0 then
		local var_24_5 = pg.skill_data_template[var_24_1.skill_id].name

		setText(arg_24_0.skillDesc, i18n("ship_remould_material_unlock_skill", var_24_5))
	end

	removeAllChildren(arg_24_0.attrContainer)

	local var_24_6
	local var_24_7

	_.each(var_24_1.ship_id, function(arg_27_0)
		if arg_27_0[1] == arg_24_0.shipVO.configId then
			var_24_6 = arg_27_0[2]
		end

		if pg.ship_data_template[arg_27_0[1]].group_type == arg_24_0.shipVO.groupId then
			var_24_7 = pg.ship_data_statistics[arg_27_0[2]].type
		end
	end)

	if var_24_7 then
		local var_24_8 = cloneTplTo(arg_24_0.attrTplD, arg_24_0.attrContainer)

		setText(var_24_8:Find("name"), i18n("common_ship_type"))
		setText(var_24_8:Find("value"), ShipType.Type2Name(var_24_7))

		local var_24_9 = var_24_8:Find("quest")

		setActive(var_24_9, true)
		onButton(arg_24_0, var_24_8, function()
			arg_24_0:showToolTip(arg_24_1)
		end)
	else
		local var_24_10 = _.reduce(var_24_1.effect, {}, function(arg_29_0, arg_29_1)
			for iter_29_0, iter_29_1 in pairs(arg_29_1) do
				arg_29_0[iter_29_0] = (arg_29_0[iter_29_0] or 0) + iter_29_1
			end

			return arg_29_0
		end)
		local var_24_11 = arg_24_0.shipVO:getShipProperties()

		for iter_24_3, iter_24_4 in pairs(var_24_11) do
			if var_24_10[iter_24_3] then
				local var_24_12 = cloneTplTo(arg_24_0.attrTplD, arg_24_0.attrContainer)

				arg_24_0:updateAttrTF_D(var_24_12, {
					attrName = AttributeType.Type2Name(iter_24_3),
					value = math.floor(iter_24_4),
					addition = var_24_10[iter_24_3]
				})
			end
		end

		local var_24_13 = pg.ship_data_template[arg_24_0.shipVO.configId]

		for iter_24_5 = 1, 3 do
			if var_24_10["equipment_proficiency_" .. iter_24_5] then
				local var_24_14 = EquipType.Types2Title(iter_24_5, arg_24_0.shipVO.configId)
				local var_24_15 = EquipType.LabelToName(var_24_14) .. i18n("common_proficiency")
				local var_24_16 = cloneTplTo(arg_24_0.attrTplD, arg_24_0.attrContainer)

				arg_24_0:updateAttrTF_D(var_24_16, {
					attrName = var_24_15,
					value = arg_24_0.shipVO:getEquipProficiencyByPos(iter_24_5) * 100,
					addition = var_24_10["equipment_proficiency_" .. iter_24_5] * 100
				}, true)
			end
		end
	end

	setActive(arg_24_0.confirmBtn, false)
	setActive(arg_24_0.inactiveBtn, false)
	setActive(arg_24_0.completedteBtn, arg_24_0:isFinished(arg_24_1))

	arg_24_0.contextData.transformId = arg_24_1
end

function var_0_0.updateProgress(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:getTransformLevel(arg_30_1) + 1

	arg_30_0.curtransformId = arg_30_1

	local var_30_1 = pg.transform_data_template[arg_30_1]

	arg_30_0.infoName.text = var_30_1.name

	local var_30_2, var_30_3 = arg_30_0:canRemould(arg_30_1)
	local var_30_4 = var_30_1.effect[var_30_0] or {}

	setActive(arg_30_0.shipTF, false)
	setText(arg_30_0.skillDesc, "")

	local var_30_5

	if var_30_1.use_item[var_30_0] then
		var_30_5 = Clone(var_30_1.use_item[var_30_0])
	else
		var_30_5 = {}
	end

	if var_30_1.use_gold > 0 then
		table.insert(var_30_5, {
			id2ItemId(PlayerConst.ResGold),
			var_30_1.use_gold
		})
	end

	setActive(arg_30_0.shipTF, var_30_1.use_ship ~= 0)

	if var_30_1.use_ship ~= 0 then
		local var_30_6 = arg_30_0.contextData.materialShipIds
		local var_30_7 = var_30_6 and table.getCount(var_30_6) ~= 0

		setActive(arg_30_0.shipTF:Find("IconTpl"), var_30_7)
		setActive(arg_30_0.shipTF:Find("addTF"), not var_30_7)

		if var_30_7 then
			updateDrop(arg_30_0.shipTF:Find("IconTpl"), {
				id = getProxy(BayProxy):getShipById(var_30_6[1]).configId,
				type = DROP_TYPE_SHIP
			})
		end

		onButton(arg_30_0, arg_30_0.shipTF, function()
			if var_30_2 then
				arg_30_0:emit(ShipRemouldMediator.ON_SELECTE_SHIP, arg_30_0.shipVO)
			else
				pg.TipsMgr.GetInstance():ShowTips(var_30_3)
			end
		end, SFX_PANEL)
	else
		arg_30_0.contextData.materialShipIds = nil
	end

	setActive(arg_30_0.skillDesc.parent, var_30_1.skill_id ~= 0)

	if var_30_1.skill_id ~= 0 then
		local var_30_8 = pg.skill_data_template[var_30_1.skill_id].name

		setText(arg_30_0.skillDesc, i18n("ship_remould_material_unlock_skill", var_30_8))
	end

	for iter_30_0 = arg_30_0.itemContainer.childCount, #var_30_5 - 1 do
		cloneTplTo(arg_30_0.itemTF, arg_30_0.itemContainer)
	end

	local var_30_9 = arg_30_0.itemContainer.childCount

	for iter_30_1 = 1, var_30_9 do
		local var_30_10 = arg_30_0.itemContainer:GetChild(iter_30_1 - 1)

		setActive(var_30_10, iter_30_1 <= #var_30_5)

		if iter_30_1 <= #var_30_5 then
			local var_30_11 = var_30_5[iter_30_1]
			local var_30_12 = ""

			if var_30_11[1] == id2ItemId(PlayerConst.ResGold) then
				local var_30_13 = arg_30_0.playerVO.gold >= var_30_11[2]

				var_30_12 = setColorStr(var_30_11[2], var_30_13 and COLOR_WHITE or COLOR_RED)

				if var_30_13 then
					RemoveComponent(var_30_10, typeof(Button))
				else
					onButton(arg_30_0, var_30_10, function()
						ItemTipPanel.ShowGoldBuyTip(var_30_11[2])
					end)

					var_30_10:GetComponent(typeof(Button)).targetGraphic = var_30_10:Find("IconTpl/icon_bg/icon"):GetComponent(typeof(Image))
				end
			else
				local var_30_14 = arg_30_0:getItemCount(var_30_11[1]) >= var_30_11[2]

				var_30_12 = setColorStr(arg_30_0:getItemCount(var_30_11[1]), var_30_14 and COLOR_WHITE or COLOR_RED)
				var_30_12 = var_30_12 .. "/" .. var_30_11[2]

				if var_30_14 or not ItemTipPanel.CanShowTip(var_30_11[1]) then
					RemoveComponent(var_30_10, typeof(Button))
				else
					onButton(arg_30_0, var_30_10, function()
						ItemTipPanel.ShowItemTipbyID(var_30_11[1])
					end)

					var_30_10:GetComponent(typeof(Button)).targetGraphic = var_30_10:Find("IconTpl/icon_bg/icon"):GetComponent(typeof(Image))
				end
			end

			updateDrop(var_30_10:Find("IconTpl"), {
				id = var_30_11[1],
				type = DROP_TYPE_ITEM,
				count = var_30_12
			})
		end
	end

	removeAllChildren(arg_30_0.attrContainer)

	local var_30_15
	local var_30_16

	_.each(var_30_1.ship_id, function(arg_34_0)
		if arg_34_0[1] == arg_30_0.shipVO.configId then
			var_30_15 = arg_34_0[2]
		end

		if pg.ship_data_template[arg_34_0[1]].group_type == arg_30_0.shipVO.groupId then
			var_30_16 = pg.ship_data_statistics[arg_34_0[2]].type
		end
	end)

	if var_30_16 then
		local var_30_17 = cloneTplTo(arg_30_0.attrTpl, arg_30_0.attrContainer)

		setText(var_30_17:Find("name"), i18n("common_ship_type"))
		setText(var_30_17:Find("pre_value"), ShipType.Type2Name(arg_30_0.shipVO:getShipType()))
		setText(var_30_17:Find("value"), ShipType.Type2Name(var_30_16))
		setActive(var_30_17:Find("addtion"), false)

		local var_30_18 = var_30_17:Find("quest")

		if var_30_15 then
			setActive(var_30_18, true)
			onButton(arg_30_0, var_30_17, function()
				arg_30_0:showToolTip(arg_30_1)
			end)
		else
			setActive(var_30_18, false)
		end
	else
		local var_30_19 = arg_30_0.shipVO:getShipProperties()

		for iter_30_2, iter_30_3 in pairs(var_30_19) do
			if var_30_4[iter_30_2] then
				local var_30_20 = cloneTplTo(arg_30_0.attrTpl, arg_30_0.attrContainer)

				arg_30_0:updateAttrTF(var_30_20, {
					attrName = AttributeType.Type2Name(iter_30_2),
					value = math.floor(iter_30_3),
					addition = var_30_4[iter_30_2]
				})
			end
		end

		local var_30_21 = pg.ship_data_template[arg_30_0.shipVO.configId]

		for iter_30_4 = 1, 3 do
			if var_30_4["equipment_proficiency_" .. iter_30_4] then
				local var_30_22 = EquipType.Types2Title(iter_30_4, arg_30_0.shipVO.configId)
				local var_30_23 = EquipType.LabelToName(var_30_22) .. i18n("common_proficiency")
				local var_30_24 = cloneTplTo(arg_30_0.attrTpl, arg_30_0.attrContainer)

				arg_30_0:updateAttrTF(var_30_24, {
					attrName = var_30_23,
					value = arg_30_0.shipVO:getEquipProficiencyByPos(iter_30_4) * 100,
					addition = var_30_4["equipment_proficiency_" .. iter_30_4] * 100
				}, true)
			end
		end
	end

	local var_30_25 = arg_30_0:isEnoughResource(arg_30_1)

	setActive(arg_30_0.confirmBtn, var_30_2 and var_30_25)
	setActive(arg_30_0.inactiveBtn, not var_30_2 or not var_30_25)
	setActive(arg_30_0.completedteBtn, false)
	onButton(arg_30_0, arg_30_0.confirmBtn, function()
		local var_36_0, var_36_1 = ShipStatus.ShipStatusCheck("onModify", arg_30_0.shipVO)

		if not var_36_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_36_1)

			return
		end

		local var_36_2, var_36_3 = arg_30_0:canRemould(arg_30_1)

		if not var_36_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_36_3)

			return
		end

		local var_36_4, var_36_5 = arg_30_0:isEnoughResource(arg_30_1)

		if not var_36_4 then
			pg.TipsMgr.GetInstance():ShowTips(var_36_5)

			return
		end

		if var_30_15 then
			local var_36_6 = pg.MsgboxMgr.GetInstance()

			var_36_6:ShowMsgBox({
				modal = true,
				content = i18n("ship_remould_warning_" .. var_30_15, arg_30_0.shipVO:getName()),
				onYes = function()
					arg_30_0:emit(ShipRemouldMediator.REMOULD_SHIP, arg_30_0.shipVO.id, arg_30_1)
				end
			})
			var_36_6.contentText:AddListener(function(arg_38_0, arg_38_1)
				if arg_38_0 == "clickDetail" then
					arg_30_0:showToolTip(arg_30_1)
				end
			end)
		else
			arg_30_0:emit(ShipRemouldMediator.REMOULD_SHIP, arg_30_0.shipVO.id, arg_30_1)
		end
	end, SFX_CONFIRM)

	arg_30_0.contextData.transformId = arg_30_1
end

function var_0_0.isUnlock(arg_39_0, arg_39_1)
	if not arg_39_0:isUnLockPrev(arg_39_1) then
		return false
	end

	if arg_39_0:getLevelById(arg_39_1) > arg_39_0.shipVO.level then
		return false
	end

	if not arg_39_0:isReachStar(arg_39_1) then
		return false
	end

	return true
end

function var_0_0.isFinished(arg_40_0, arg_40_1)
	local var_40_0 = pg.transform_data_template[arg_40_1]
	local var_40_1 = arg_40_0:getTransformLevel(arg_40_1)

	if var_40_0.max_level == var_40_1 then
		return true
	end

	return false
end

function var_0_0.isReachStar(arg_41_0, arg_41_1)
	local var_41_0 = pg.transform_data_template[arg_41_1]

	return arg_41_0.shipVO:getStar() >= var_41_0.star_limit
end

function var_0_0.canRemould(arg_42_0, arg_42_1)
	if not arg_42_0:isUnLockPrev(arg_42_1) then
		return false, i18n("ship_remould_prev_lock"), {
			1
		}
	end

	local var_42_0 = pg.transform_data_template[arg_42_1]

	if arg_42_0:getLevelById(arg_42_1) > arg_42_0.shipVO.level then
		return false, i18n("ship_remould_need_level", var_42_0.level_limit), {
			2,
			var_42_0.level_limit
		}
	end

	if not arg_42_0:isReachStar(arg_42_1) then
		return false, i18n("ship_remould_need_star", var_42_0.star_limit), {
			3,
			var_42_0.star_limit
		}
	end

	if arg_42_0:isFinished(arg_42_1) then
		return false, i18n("ship_remould_finished"), {
			4
		}
	end

	return true
end

function var_0_0.isUnLockPrev(arg_43_0, arg_43_1)
	local var_43_0 = pg.transform_data_template[arg_43_1]

	for iter_43_0, iter_43_1 in pairs(var_43_0.condition_id) do
		local var_43_1 = pg.transform_data_template[iter_43_1]

		if not arg_43_0.shipVO.transforms[iter_43_1] or arg_43_0.shipVO.transforms[iter_43_1].level ~= var_43_1.max_level then
			return false
		end
	end

	return true
end

function var_0_0.isEnoughResource(arg_44_0, arg_44_1)
	local var_44_0 = pg.transform_data_template[arg_44_1]
	local var_44_1 = arg_44_0:getTransformLevel(arg_44_1) + 1

	for iter_44_0, iter_44_1 in ipairs(var_44_0.use_item[var_44_1] or {}) do
		if not arg_44_0.itemsVO[iter_44_1[1]] or arg_44_0.itemsVO[iter_44_1[1]].count < iter_44_1[2] then
			return false, i18n("ship_remould_no_item")
		end
	end

	if arg_44_0.playerVO.gold < var_44_0.use_gold then
		return false, i18n("ship_remould_no_gold")
	end

	if var_44_0.use_ship ~= 0 and (not arg_44_0.contextData.materialShipIds or #arg_44_0.contextData.materialShipIds ~= var_44_0.use_ship) then
		return false, i18n("ship_remould_no_material")
	end

	return true
end

function var_0_0.updateAttrTF(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	local var_45_0 = arg_45_3 and "%" or ""

	setText(arg_45_1:Find("name"), arg_45_2.attrName)
	setText(arg_45_1:Find("pre_value"), arg_45_2.value .. var_45_0)
	setText(arg_45_1:Find("value"), arg_45_2.addition + arg_45_2.value .. var_45_0)
	setText(arg_45_1:Find("addtion"), (arg_45_2.addition > 0 and "+" .. arg_45_2.addition or arg_45_2.addition) .. var_45_0)
end

function var_0_0.updateAttrTF_D(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	local var_46_0 = arg_46_3 and "%" or ""

	setText(arg_46_1:Find("name"), arg_46_2.attrName)
	setText(arg_46_1:Find("value"), (arg_46_2.addition > 0 and "+" .. arg_46_2.addition or arg_46_2.addition) .. var_46_0)
end

function var_0_0.showToolTip(arg_47_0, arg_47_1)
	if not arg_47_0.shipVO then
		return
	end

	local var_47_0 = pg.transform_data_template[arg_47_1]
	local var_47_1 = arg_47_0:isFinished(arg_47_1)

	setActive(findTF(arg_47_0.tooltip, "window/scrollview/list/attrs"), not var_47_1)

	if not var_47_1 then
		local var_47_2 = Clone(arg_47_0.shipVO)

		_.each(var_47_0.ship_id, function(arg_48_0)
			if arg_48_0[1] == arg_47_0.shipVO.configId then
				var_47_2.configId = arg_48_0[2]
			end
		end)

		var_47_2.transforms[arg_47_1] = {
			level = 1,
			id = arg_47_1
		}

		local var_47_3 = {}

		table.insert(var_47_3, {
			name = i18n("common_ship_type"),
			from = ShipType.Type2Name(arg_47_0.shipVO:getShipType()),
			to = ShipType.Type2Name(var_47_2:getShipType())
		})
		table.insert(var_47_3, {
			name = i18n("attribute_armor_type"),
			from = arg_47_0.shipVO:getShipArmorName(),
			to = var_47_2:getShipArmorName()
		})

		local var_47_4 = {
			AttributeType.Durability,
			AttributeType.Cannon,
			AttributeType.Torpedo,
			AttributeType.AntiAircraft,
			AttributeType.Air,
			AttributeType.Reload,
			AttributeType.Hit,
			AttributeType.Expend,
			AttributeType.Dodge,
			AttributeType.AntiSub
		}
		local var_47_5 = arg_47_0.shipVO:getShipProperties()
		local var_47_6 = var_47_2:getShipProperties()

		for iter_47_0, iter_47_1 in ipairs(var_47_4) do
			local var_47_7 = {}

			if iter_47_1 == AttributeType.Expend then
				var_47_7.name = AttributeType.Type2Name(iter_47_1)
				var_47_7.from = arg_47_0.shipVO:getBattleTotalExpend()
				var_47_7.to = var_47_2:getBattleTotalExpend()
			else
				var_47_7.name = AttributeType.Type2Name(iter_47_1)
				var_47_7.from = math.floor(var_47_5[iter_47_1])
				var_47_7.to = math.floor(var_47_6[iter_47_1])
			end

			var_47_7.add = var_47_7.to - var_47_7.from

			table.insert(var_47_3, var_47_7)
		end

		local var_47_8 = UIItemList.New(findTF(arg_47_0.tooltip, "window/scrollview/list/attrs"), findTF(arg_47_0.tooltip, "window/scrollview/list/attrs/attr"))

		var_47_8:make(function(arg_49_0, arg_49_1, arg_49_2)
			if arg_49_0 == UIItemList.EventUpdate then
				local var_49_0 = var_47_3[arg_49_1 + 1]

				setText(arg_49_2:Find("name"), var_49_0.name)
				setText(arg_49_2:Find("pre_value"), var_49_0.from)

				local var_49_1 = arg_49_2:Find("addtion")
				local var_49_2 = "#A9F548"

				if var_49_0.add and var_49_0.from ~= var_49_0.to then
					setActive(var_49_1, true)

					if var_49_0.from > var_49_0.to then
						var_49_2 = "#FF3333"
					end

					local var_49_3 = var_49_0.from < var_49_0.to and "+" or ""

					setText(var_49_1, string.format("<color=%s>[%s%s]</color>", var_49_2, var_49_3, var_49_0.add))
					setText(arg_49_2:Find("value"), string.format("<color=%s>%s</color>", var_49_2, var_49_0.to))
				else
					setActive(var_49_1, false)
					setText(arg_49_2:Find("value"), string.format("<color=%s>%s</color>", var_49_2, var_49_0.to))
				end
			end
		end)
		var_47_8:align(#var_47_3)
	end

	setText(findTF(arg_47_0.tooltip, "window/scrollview/list/content/"), var_47_0.descrip)
	onButton(arg_47_0, findTF(arg_47_0.tooltip, "window/top/btnBack"), function()
		arg_47_0:closeTip()
	end, SFX_CANCEL)
	onButton(arg_47_0, arg_47_0.tooltip, function()
		arg_47_0:closeTip()
	end, SFX_CANCEL)
	setActive(arg_47_0.tooltip, true)
	arg_47_0:OverlayPanel(arg_47_0.tooltip)
end

function var_0_0.closeTip(arg_52_0)
	setActive(arg_52_0.tooltip, false)
	arg_52_0:UnOverlayPanel(arg_52_0.tooltip, arg_52_0._tf)
end

function var_0_0.willExit(arg_53_0)
	if arg_53_0.helpBtn then
		setActive(arg_53_0.helpBtn, true)
	end

	arg_53_0:UnOverlayPanel(arg_53_0.tooltip, arg_53_0._tf)
end

function var_0_0.onBackPressed(arg_54_0)
	if isActive(arg_54_0.tooltip) then
		arg_54_0:closeTip()

		return
	end

	arg_54_0:emit(BaseUI.ON_BACK_PRESSED, true)
end

return var_0_0
