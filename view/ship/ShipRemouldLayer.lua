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

function var_0_0.init(arg_3_0)
	arg_3_0.container = arg_3_0:findTF("main/bg/container")
	arg_3_0.gridContainer = arg_3_0:findTF("grids", arg_3_0.container)
	arg_3_0.gridTF = arg_3_0:findTF("grid_tpl", arg_3_0.gridContainer)
	arg_3_0.height = arg_3_0.gridTF.sizeDelta.y + var_0_5
	arg_3_0.width = arg_3_0.gridTF.sizeDelta.x + var_0_4
	arg_3_0.startPos = Vector2(-1 * ((var_0_2 / 2 - 0.5) * arg_3_0.width) + var_0_6.x, (var_0_1 / 2 - 0.5) * arg_3_0.height + var_0_6.y)
	arg_3_0.containerWidth = var_0_2 * arg_3_0.gridTF.sizeDelta.x + (var_0_2 - 1) * var_0_4
	arg_3_0.containerHeight = var_0_1 * arg_3_0.gridTF.sizeDelta.y + (var_0_1 - 1) * var_0_5
	arg_3_0.container.sizeDelta = Vector2(arg_3_0.containerWidth, arg_3_0.containerHeight)

	setActive(arg_3_0.gridTF, false)

	arg_3_0.infoPanel = arg_3_0:findTF("main/info_panel")
	arg_3_0.itemContainer = arg_3_0:findTF("usages/items", arg_3_0.infoPanel)
	arg_3_0.itemTF = arg_3_0:findTF("itemTF", arg_3_0.itemContainer)
	arg_3_0.infoName = arg_3_0:findTF("name_container/Text", arg_3_0.infoPanel):GetComponent(typeof(Text))
	arg_3_0.attrContainer = arg_3_0:findTF("align/attrs", arg_3_0.infoPanel)
	arg_3_0.attrTpl = arg_3_0:getTpl("attr", arg_3_0.attrContainer)
	arg_3_0.attrTplD = arg_3_0:getTpl("attrd", arg_3_0.attrContainer)
	arg_3_0.confirmBtn = arg_3_0:findTF("confirm_btn/activity", arg_3_0.infoPanel)
	arg_3_0.inactiveBtn = arg_3_0:findTF("confirm_btn/inactivity", arg_3_0.infoPanel)
	arg_3_0.completedteBtn = arg_3_0:findTF("confirm_btn/complete", arg_3_0.infoPanel)
	arg_3_0.shipTF = arg_3_0:findTF("main/info_panel/usages/shipTF")
	arg_3_0.skillDesc = arg_3_0:findTF("align/skill_desc/text", arg_3_0.infoPanel)
	arg_3_0.shipContainer = arg_3_0:findTF("char_container", arg_3_0.infoPanel)
	arg_3_0.lineTpl = arg_3_0:findTF("resources/line")
	arg_3_0.lineContainer = arg_3_0:findTF("grids/lines", arg_3_0.container)
	arg_3_0.helpBtn = GameObject.Find("/OverlayCamera/Overlay/UIMain/common/help_btn")

	if not IsNil(arg_3_0.helpBtn) then
		setActive(arg_3_0.helpBtn, false)
	end

	arg_3_0.tooltip = arg_3_0:findTF("tooltip")

	setActive(arg_3_0.tooltip, false)
end

function var_0_0.setPlayer(arg_4_0, arg_4_1)
	arg_4_0.playerVO = arg_4_1

	if arg_4_0.curtransformId then
		arg_4_0:updateInfo(arg_4_0.curtransformId)
	end
end

function var_0_0.setItems(arg_5_0, arg_5_1)
	arg_5_0.itemsVO = arg_5_1
end

function var_0_0.getItemCount(arg_6_0, arg_6_1)
	return (arg_6_0.itemsVO[arg_6_1] or Item.New({
		count = 0,
		id = arg_6_1
	})).count
end

function var_0_0.setShipVO(arg_7_0, arg_7_1)
	arg_7_0.shipVO = arg_7_1
	arg_7_0.shipGroupId = math.floor(arg_7_0.shipVO:getGroupId())
end

function var_0_0.getShipTranformData(arg_8_0)
	local var_8_0 = pg.ship_data_trans[arg_8_0.shipGroupId]

	assert(var_8_0, "config missed [pg.ship_data_trans] shipGroup>>>." .. arg_8_0.shipGroupId)

	local var_8_1 = {}

	for iter_8_0, iter_8_1 in ipairs(var_8_0.transform_list) do
		for iter_8_2, iter_8_3 in ipairs(iter_8_1) do
			var_8_1[iter_8_3[2]] = Vector2(iter_8_0, iter_8_3[1])
		end
	end

	return var_8_1
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0:initTranformInfo()
	arg_9_0:initShipModel()
end

function var_0_0.initTranformInfo(arg_10_0)
	arg_10_0.transformIds = arg_10_0:getShipTranformData()
	arg_10_0.grids = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.transformIds) do
		local var_10_0 = cloneTplTo(arg_10_0.gridTF, arg_10_0.gridContainer)

		go(var_10_0).name = iter_10_0
		var_10_0.localPosition = Vector2(arg_10_0.startPos.x + arg_10_0.width * (iter_10_1.x - 1), arg_10_0.startPos.y - arg_10_0.height * (iter_10_1.y - 1))

		onToggle(arg_10_0, var_10_0, function(arg_11_0)
			if arg_11_0 and arg_10_0.curtransformId ~= iter_10_0 then
				arg_10_0:updateInfo(iter_10_0)
			end
		end, SFX_PANEL)

		arg_10_0.grids[iter_10_0] = var_10_0
	end

	arg_10_0.lineTFs = {}

	for iter_10_2, iter_10_3 in pairs(arg_10_0.transformIds) do
		arg_10_0:initLines(iter_10_2)
	end

	arg_10_0.posTransId = {}

	arg_10_0:updateLines()

	if arg_10_0.contextData.transformId then
		assert(arg_10_0.grids[arg_10_0.contextData.transformId], "without this transform id:" .. arg_10_0.contextData.transformId)
		triggerToggle(arg_10_0.grids[arg_10_0.contextData.transformId], true)
	end
end

function var_0_0.initLines(arg_12_0, arg_12_1)
	local var_12_0 = 270
	local var_12_1 = 75

	arg_12_0.lineTFs[arg_12_1] = {}

	local var_12_2 = arg_12_0.transformIds[arg_12_1].x
	local var_12_3 = arg_12_0.transformIds[arg_12_1].y
	local var_12_4 = arg_12_0.grids[arg_12_1]
	local var_12_5 = var_12_4.sizeDelta
	local var_12_6 = var_12_4.localPosition
	local var_12_7 = arg_12_0.lineTpl
	local var_12_8 = pg.transform_data_template[arg_12_1].condition_id

	for iter_12_0, iter_12_1 in pairs(var_12_8) do
		local var_12_9 = arg_12_0.transformIds[iter_12_1].x
		local var_12_10 = arg_12_0.transformIds[iter_12_1].y
		local var_12_11 = Vector2(var_12_9 - var_12_2, var_12_10 - var_12_3)

		if var_12_11 ~= Vector2.zero then
			local var_12_12 = cloneTplTo(var_12_7, arg_12_0.lineContainer, var_12_2 .. "-" .. var_12_3 .. "-v")
			local var_12_13 = cloneTplTo(var_12_7, arg_12_0.lineContainer, var_12_2 .. "-" .. var_12_3 .. "-h")
			local var_12_14 = var_12_11.y < 0 and 90 or -90

			var_12_12.eulerAngles = Vector3(0, 0, var_12_14)

			local var_12_15 = var_12_11.x < 0 and 180 or 0

			var_12_13.eulerAngles = Vector3(0, 0, var_12_15)

			local var_12_16 = math.abs(var_12_11.y) > 0 and math.abs(var_12_11.x) > 0

			if var_12_16 then
				local var_12_17 = var_12_6.y + (var_12_3 - var_12_10) * var_12_0

				var_12_13.localPosition = Vector2(var_12_6.x, var_12_17, 0)

				local var_12_18 = var_12_11.y < 0 and var_12_6.y + var_12_5.y / 2 or var_12_6.y - var_12_5.y / 2

				var_12_12.localPosition = Vector2(var_12_6.x, var_12_18)
				var_12_13.sizeDelta = Vector2(math.abs(var_12_11.x) * var_12_0, var_12_13.sizeDelta.y)
				var_12_12.sizeDelta = Vector2(math.abs(var_12_11.y) * var_12_0 - var_12_5.y / 2, var_12_12.sizeDelta.y)

				local var_12_19 = var_12_11.x < 0 and var_12_14 < 0 and -1 or 1

				var_12_12:Find("corner").localScale = Vector3(1, var_12_19, 1)
			else
				var_12_13.sizeDelta = Vector2(math.abs(var_12_11.x) * var_12_0, var_12_13.sizeDelta.y)
				var_12_12.sizeDelta = Vector2(math.abs(var_12_11.y) * var_12_1, var_12_12.sizeDelta.y)
				var_12_13.localPosition = var_12_6

				local var_12_20 = var_12_11.y < 0 and var_12_6.y + var_12_5.y / 2 or var_12_6.y - var_12_5.y / 2

				var_12_12.localPosition = Vector3(var_12_6.x, var_12_20, 0)
			end

			setActive(var_12_12:Find("arr"), var_12_16 or math.abs(var_12_11.y) > 0)
			setActive(var_12_12:Find("corner"), var_12_16)
			setActive(var_12_13:Find("arr"), false)
			setActive(var_12_13:Find("corner"), false)
			table.insert(arg_12_0.lineTFs[arg_12_1], {
				id = iter_12_1,
				hrz = var_12_13,
				vec = var_12_12
			})
		end
	end
end

function var_0_0.updateLines(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.transformIds) do
		arg_13_0:updateGridTF(iter_13_0)

		if arg_13_0:canRemould(iter_13_0) or arg_13_0:isFinished(iter_13_0) then
			for iter_13_2, iter_13_3 in ipairs(arg_13_0.lineTFs[iter_13_0] or {}) do
				iter_13_3.hrz:GetComponent("UIGrayScale").enabled = false
				iter_13_3.vec:GetComponent("UIGrayScale").enabled = false
			end
		end
	end
end

function var_0_0.getLevelById(arg_14_0, arg_14_1)
	return pg.transform_data_template[arg_14_1].level_limit
end

function var_0_0.getTransformLevel(arg_15_0, arg_15_1)
	if not arg_15_0.shipVO.transforms[arg_15_1] then
		return 0
	else
		return arg_15_0.shipVO.transforms[arg_15_1].level
	end
end

var_0_0.STATE_FINISHED = 1
var_0_0.STATE_ACTIVE = 2
var_0_0.STATE_LOCK = 3

function var_0_0.getTransformState(arg_16_0, arg_16_1)
	if arg_16_0:getTransformLevel(arg_16_1) == pg.transform_data_template[arg_16_1].max_level then
		return var_0_0.STATE_FINISHED
	elseif arg_16_0:canRemould(arg_16_1) then
		return var_0_0.STATE_ACTIVE
	else
		return var_0_0.STATE_LOCK
	end
end

function var_0_0.updateGridTF(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.grids[arg_17_1]
	local var_17_1 = pg.transform_data_template[arg_17_1]

	setText(var_17_0:Find("name"), var_17_1.name)

	local var_17_2 = var_17_0:Find("icon"):GetComponent(typeof(Image))

	GetSpriteFromAtlasAsync("modicon", var_17_1.icon, function(arg_18_0)
		if not IsNil(var_17_2) then
			var_17_2.sprite = arg_18_0
		end
	end)

	local var_17_3 = arg_17_0:getTransformState(arg_17_1)

	setActive(var_17_0:Find("bgs/finished"), var_17_3 == var_0_0.STATE_FINISHED)
	setActive(var_17_0:Find("bgs/ongoing"), var_17_3 == var_0_0.STATE_ACTIVE)
	setActive(var_17_0:Find("bgs/lock"), var_17_3 == var_0_0.STATE_LOCK)
	setActive(var_17_0:Find("tags/finished"), var_17_3 == var_0_0.STATE_FINISHED)
	setActive(var_17_0:Find("tags/ongoing"), var_17_3 == var_0_0.STATE_ACTIVE)
	setActive(var_17_0:Find("tags/lock"), var_17_3 == var_0_0.STATE_LOCK)

	local var_17_4 = arg_17_0:getTransformLevel(arg_17_1)
	local var_17_5 = var_17_0:Find("icon/progress")

	if var_17_3 == var_0_0.STATE_FINISHED then
		setText(var_17_5, var_17_4 .. "/" .. var_17_1.max_level)
	elseif var_17_3 == var_0_0.STATE_ACTIVE then
		setText(var_17_5, var_17_4 .. "/" .. var_17_1.max_level)
	elseif var_17_3 == var_0_0.STATE_LOCK then
		local var_17_6, var_17_7, var_17_8 = arg_17_0:canRemould(arg_17_1)

		setText(var_17_5, "")
		setActive(var_17_0:Find("tags/lock/lock_prev"), var_17_8 and var_17_8[1] == 1)
		setActive(var_17_0:Find("tags/lock/lock_level"), var_17_8 and var_17_8[1] == 2)
		setActive(var_17_0:Find("tags/lock/lock_star"), var_17_8 and var_17_8[1] == 3)

		if var_17_8 and var_17_8[1] == 2 then
			setText(var_17_0:Find("tags/lock/lock_level/Text"), var_17_8[2])
		elseif var_17_8 and var_17_8[1] == 3 then
			setText(var_17_0:Find("tags/lock/lock_star/Text"), var_17_8[2])
		end
	end

	local var_17_9 = arg_17_0.transformIds[arg_17_1].x .. "_" .. arg_17_0.transformIds[arg_17_1].y

	if not arg_17_0.posTransId[var_17_9] then
		arg_17_0.posTransId[var_17_9] = arg_17_1
	elseif arg_17_0.posTransId[var_17_9] == arg_17_1 then
		-- block empty
	elseif var_17_3 == var_0_0.STATE_ACTIVE or arg_17_0:getTransformState(arg_17_0.posTransId[var_17_9]) ~= var_0_0.STATE_ACTIVE and arg_17_1 < arg_17_0.posTransId[var_17_9] then
		if arg_17_0.posTransId[var_17_9] == arg_17_0.curtransformId then
			arg_17_0.curtransformId = arg_17_1
		end

		setActive(arg_17_0.grids[arg_17_0.posTransId[var_17_9]], false)

		arg_17_0.posTransId[var_17_9] = arg_17_1
	end

	setActive(var_17_0, arg_17_1 == arg_17_0.posTransId[var_17_9])

	if arg_17_0.curtransformId == arg_17_1 then
		arg_17_0:updateInfo(arg_17_1)
	end
end

function var_0_0.initShipModel(arg_19_0)
	local var_19_0 = arg_19_0.shipVO:getPrefab()

	if arg_19_0.shipContainer.childCount ~= 0 then
		PoolMgr.GetInstance():ReturnSpineChar(var_19_0, go(arg_19_0.shipModel))
	end

	local function var_19_1(arg_20_0)
		if not IsNil(arg_19_0._tf) then
			local var_20_0 = tf(arg_20_0)

			arg_19_0.shipModel = var_20_0
			arg_19_0.spineAnimUI = var_20_0:GetComponent("SpineAnimUI")

			pg.ViewUtils.SetLayer(var_20_0, Layer.UI)

			var_20_0.localScale = Vector3(var_0_3, var_0_3, 1)

			setParent(var_20_0, arg_19_0.shipContainer)

			var_20_0.localPosition = Vector2(0, 10)

			arg_19_0.spineAnimUI:SetAction("stand2", 0)
		end
	end

	PoolMgr.GetInstance():GetSpineChar(var_19_0, true, function(arg_21_0)
		var_19_1(arg_21_0)
	end)
end

function var_0_0.updateInfo(arg_22_0, arg_22_1)
	if arg_22_0:isFinished(arg_22_1) then
		arg_22_0:updateFinished(arg_22_1)
	else
		arg_22_0:updateProgress(arg_22_1)
	end
end

function var_0_0.updateFinished(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.shipVO.transforms[arg_23_1].level

	arg_23_0.curtransformId = arg_23_1

	local var_23_1 = pg.transform_data_template[arg_23_1]

	arg_23_0.infoName.text = var_23_1.name

	local var_23_2 = {}

	for iter_23_0 = 1, var_23_0 do
		_.each(var_23_1.use_item[iter_23_0], function(arg_24_0)
			local var_24_0 = _.detect(var_23_2, function(arg_25_0)
				return arg_25_0.type == DROP_TYPE_ITEM and arg_25_0.id == arg_24_0[1]
			end)

			if not var_24_0 then
				table.insert(var_23_2, {
					type = DROP_TYPE_ITEM,
					id = arg_24_0[1],
					count = arg_24_0[2]
				})
			else
				var_24_0.count = var_24_0.count + arg_24_0[2]
			end
		end)
	end

	table.insert(var_23_2, {
		type = DROP_TYPE_ITEM,
		id = id2ItemId(PlayerConst.ResGold),
		count = var_23_1.use_gold * var_23_0
	})

	for iter_23_1 = arg_23_0.itemContainer.childCount, #var_23_2 - 1 do
		cloneTplTo(arg_23_0.itemTF, arg_23_0.itemContainer)
	end

	local var_23_3 = arg_23_0.itemContainer.childCount

	for iter_23_2 = 1, var_23_3 do
		local var_23_4 = arg_23_0.itemContainer:GetChild(iter_23_2 - 1)

		setActive(var_23_4, iter_23_2 <= #var_23_2)

		if iter_23_2 <= #var_23_2 then
			updateDrop(arg_23_0:findTF("IconTpl", var_23_4), var_23_2[iter_23_2])
			RemoveComponent(var_23_4, typeof(Button))
		end
	end

	setActive(arg_23_0.shipTF, var_23_1.use_ship > 0)

	if var_23_1.use_ship > 0 then
		setActive(arg_23_0.shipTF:Find("addTF"), false)
		setActive(arg_23_0.shipTF:Find("IconTpl"), true)
		updateDrop(arg_23_0:findTF("IconTpl", arg_23_0.shipTF), {
			type = DROP_TYPE_SHIP,
			id = arg_23_0.shipVO.configId
		})
		removeOnButton(arg_23_0.shipTF)
	end

	setActive(arg_23_0.skillDesc.parent, var_23_1.skill_id ~= 0)

	if var_23_1.skill_id ~= 0 then
		local var_23_5 = pg.skill_data_template[var_23_1.skill_id].name

		setText(arg_23_0.skillDesc, i18n("ship_remould_material_unlock_skill", var_23_5))
	end

	removeAllChildren(arg_23_0.attrContainer)

	local var_23_6
	local var_23_7

	_.each(var_23_1.ship_id, function(arg_26_0)
		if arg_26_0[1] == arg_23_0.shipVO.configId then
			var_23_6 = arg_26_0[2]
		end

		if pg.ship_data_template[arg_26_0[1]].group_type == arg_23_0.shipVO.groupId then
			var_23_7 = pg.ship_data_statistics[arg_26_0[2]].type
		end
	end)

	if var_23_7 then
		local var_23_8 = cloneTplTo(arg_23_0.attrTplD, arg_23_0.attrContainer)

		setText(var_23_8:Find("name"), i18n("common_ship_type"))
		setText(var_23_8:Find("value"), ShipType.Type2Name(var_23_7))

		local var_23_9 = var_23_8:Find("quest")

		setActive(var_23_9, true)
		onButton(arg_23_0, var_23_8, function()
			arg_23_0:showToolTip(arg_23_1)
		end)
	else
		local var_23_10 = _.reduce(var_23_1.effect, {}, function(arg_28_0, arg_28_1)
			for iter_28_0, iter_28_1 in pairs(arg_28_1) do
				arg_28_0[iter_28_0] = (arg_28_0[iter_28_0] or 0) + iter_28_1
			end

			return arg_28_0
		end)
		local var_23_11 = arg_23_0.shipVO:getShipProperties()

		for iter_23_3, iter_23_4 in pairs(var_23_11) do
			if var_23_10[iter_23_3] then
				local var_23_12 = cloneTplTo(arg_23_0.attrTplD, arg_23_0.attrContainer)

				arg_23_0:updateAttrTF_D(var_23_12, {
					attrName = AttributeType.Type2Name(iter_23_3),
					value = math.floor(iter_23_4),
					addition = var_23_10[iter_23_3]
				})
			end
		end

		local var_23_13 = pg.ship_data_template[arg_23_0.shipVO.configId]

		for iter_23_5 = 1, 3 do
			if var_23_10["equipment_proficiency_" .. iter_23_5] then
				local var_23_14 = EquipType.Types2Title(iter_23_5, arg_23_0.shipVO.configId)
				local var_23_15 = EquipType.LabelToName(var_23_14) .. i18n("common_proficiency")
				local var_23_16 = cloneTplTo(arg_23_0.attrTplD, arg_23_0.attrContainer)

				arg_23_0:updateAttrTF_D(var_23_16, {
					attrName = var_23_15,
					value = arg_23_0.shipVO:getEquipProficiencyByPos(iter_23_5) * 100,
					addition = var_23_10["equipment_proficiency_" .. iter_23_5] * 100
				}, true)
			end
		end
	end

	setActive(arg_23_0.confirmBtn, false)
	setActive(arg_23_0.inactiveBtn, false)
	setActive(arg_23_0.completedteBtn, arg_23_0:isFinished(arg_23_1))

	arg_23_0.contextData.transformId = arg_23_1
end

function var_0_0.updateProgress(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0:getTransformLevel(arg_29_1) + 1

	arg_29_0.curtransformId = arg_29_1

	local var_29_1 = pg.transform_data_template[arg_29_1]

	arg_29_0.infoName.text = var_29_1.name

	local var_29_2, var_29_3 = arg_29_0:canRemould(arg_29_1)
	local var_29_4 = var_29_1.effect[var_29_0] or {}

	setActive(arg_29_0.shipTF, false)
	setText(arg_29_0.skillDesc, "")

	local var_29_5

	if var_29_1.use_item[var_29_0] then
		var_29_5 = Clone(var_29_1.use_item[var_29_0])
	else
		var_29_5 = {}
	end

	if var_29_1.use_gold > 0 then
		table.insert(var_29_5, {
			id2ItemId(PlayerConst.ResGold),
			var_29_1.use_gold
		})
	end

	setActive(arg_29_0.shipTF, var_29_1.use_ship ~= 0)

	if var_29_1.use_ship ~= 0 then
		local var_29_6 = arg_29_0.contextData.materialShipIds
		local var_29_7 = var_29_6 and table.getCount(var_29_6) ~= 0

		setActive(arg_29_0.shipTF:Find("IconTpl"), var_29_7)
		setActive(arg_29_0.shipTF:Find("addTF"), not var_29_7)

		if var_29_7 then
			updateDrop(arg_29_0:findTF("IconTpl", arg_29_0.shipTF), {
				id = getProxy(BayProxy):getShipById(var_29_6[1]).configId,
				type = DROP_TYPE_SHIP
			})
		end

		onButton(arg_29_0, arg_29_0.shipTF, function()
			if var_29_2 then
				arg_29_0:emit(ShipRemouldMediator.ON_SELECTE_SHIP, arg_29_0.shipVO)
			else
				pg.TipsMgr.GetInstance():ShowTips(var_29_3)
			end
		end, SFX_PANEL)
	else
		arg_29_0.contextData.materialShipIds = nil
	end

	setActive(arg_29_0.skillDesc.parent, var_29_1.skill_id ~= 0)

	if var_29_1.skill_id ~= 0 then
		local var_29_8 = pg.skill_data_template[var_29_1.skill_id].name

		setText(arg_29_0.skillDesc, i18n("ship_remould_material_unlock_skill", var_29_8))
	end

	for iter_29_0 = arg_29_0.itemContainer.childCount, #var_29_5 - 1 do
		cloneTplTo(arg_29_0.itemTF, arg_29_0.itemContainer)
	end

	local var_29_9 = arg_29_0.itemContainer.childCount

	for iter_29_1 = 1, var_29_9 do
		local var_29_10 = arg_29_0.itemContainer:GetChild(iter_29_1 - 1)

		setActive(var_29_10, iter_29_1 <= #var_29_5)

		if iter_29_1 <= #var_29_5 then
			local var_29_11 = var_29_5[iter_29_1]
			local var_29_12 = ""

			if var_29_11[1] == id2ItemId(PlayerConst.ResGold) then
				local var_29_13 = arg_29_0.playerVO.gold >= var_29_11[2]

				var_29_12 = setColorStr(var_29_11[2], var_29_13 and COLOR_WHITE or COLOR_RED)

				if var_29_13 then
					RemoveComponent(var_29_10, typeof(Button))
				else
					onButton(arg_29_0, var_29_10, function()
						ItemTipPanel.ShowGoldBuyTip(var_29_11[2])
					end)

					var_29_10:GetComponent(typeof(Button)).targetGraphic = var_29_10:Find("IconTpl/icon_bg/icon"):GetComponent(typeof(Image))
				end
			else
				local var_29_14 = arg_29_0:getItemCount(var_29_11[1]) >= var_29_11[2]

				var_29_12 = setColorStr(arg_29_0:getItemCount(var_29_11[1]), var_29_14 and COLOR_WHITE or COLOR_RED)
				var_29_12 = var_29_12 .. "/" .. var_29_11[2]

				if var_29_14 or not ItemTipPanel.CanShowTip(var_29_11[1]) then
					RemoveComponent(var_29_10, typeof(Button))
				else
					onButton(arg_29_0, var_29_10, function()
						ItemTipPanel.ShowItemTipbyID(var_29_11[1])
					end)

					var_29_10:GetComponent(typeof(Button)).targetGraphic = var_29_10:Find("IconTpl/icon_bg/icon"):GetComponent(typeof(Image))
				end
			end

			updateDrop(arg_29_0:findTF("IconTpl", var_29_10), {
				id = var_29_11[1],
				type = DROP_TYPE_ITEM,
				count = var_29_12
			})
		end
	end

	removeAllChildren(arg_29_0.attrContainer)

	local var_29_15
	local var_29_16

	_.each(var_29_1.ship_id, function(arg_33_0)
		if arg_33_0[1] == arg_29_0.shipVO.configId then
			var_29_15 = arg_33_0[2]
		end

		if pg.ship_data_template[arg_33_0[1]].group_type == arg_29_0.shipVO.groupId then
			var_29_16 = pg.ship_data_statistics[arg_33_0[2]].type
		end
	end)

	if var_29_16 then
		local var_29_17 = cloneTplTo(arg_29_0.attrTpl, arg_29_0.attrContainer)

		setText(var_29_17:Find("name"), i18n("common_ship_type"))
		setText(var_29_17:Find("pre_value"), ShipType.Type2Name(arg_29_0.shipVO:getShipType()))
		setText(var_29_17:Find("value"), ShipType.Type2Name(var_29_16))
		setActive(var_29_17:Find("addtion"), false)

		local var_29_18 = var_29_17:Find("quest")

		if var_29_15 then
			setActive(var_29_18, true)
			onButton(arg_29_0, var_29_17, function()
				arg_29_0:showToolTip(arg_29_1)
			end)
		else
			setActive(var_29_18, false)
		end
	else
		local var_29_19 = arg_29_0.shipVO:getShipProperties()

		for iter_29_2, iter_29_3 in pairs(var_29_19) do
			if var_29_4[iter_29_2] then
				local var_29_20 = cloneTplTo(arg_29_0.attrTpl, arg_29_0.attrContainer)

				arg_29_0:updateAttrTF(var_29_20, {
					attrName = AttributeType.Type2Name(iter_29_2),
					value = math.floor(iter_29_3),
					addition = var_29_4[iter_29_2]
				})
			end
		end

		local var_29_21 = pg.ship_data_template[arg_29_0.shipVO.configId]

		for iter_29_4 = 1, 3 do
			if var_29_4["equipment_proficiency_" .. iter_29_4] then
				local var_29_22 = EquipType.Types2Title(iter_29_4, arg_29_0.shipVO.configId)
				local var_29_23 = EquipType.LabelToName(var_29_22) .. i18n("common_proficiency")
				local var_29_24 = cloneTplTo(arg_29_0.attrTpl, arg_29_0.attrContainer)

				arg_29_0:updateAttrTF(var_29_24, {
					attrName = var_29_23,
					value = arg_29_0.shipVO:getEquipProficiencyByPos(iter_29_4) * 100,
					addition = var_29_4["equipment_proficiency_" .. iter_29_4] * 100
				}, true)
			end
		end
	end

	local var_29_25 = arg_29_0:isEnoughResource(arg_29_1)

	setActive(arg_29_0.confirmBtn, var_29_2 and var_29_25)
	setActive(arg_29_0.inactiveBtn, not var_29_2 or not var_29_25)
	setActive(arg_29_0.completedteBtn, false)
	onButton(arg_29_0, arg_29_0.confirmBtn, function()
		local var_35_0, var_35_1 = ShipStatus.ShipStatusCheck("onModify", arg_29_0.shipVO)

		if not var_35_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_35_1)

			return
		end

		local var_35_2, var_35_3 = arg_29_0:canRemould(arg_29_1)

		if not var_35_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_35_3)

			return
		end

		local var_35_4, var_35_5 = arg_29_0:isEnoughResource(arg_29_1)

		if not var_35_4 then
			pg.TipsMgr.GetInstance():ShowTips(var_35_5)

			return
		end

		if var_29_15 then
			local var_35_6 = pg.MsgboxMgr.GetInstance()

			var_35_6:ShowMsgBox({
				modal = true,
				content = i18n("ship_remould_warning_" .. var_29_15, arg_29_0.shipVO:getName()),
				onYes = function()
					arg_29_0:emit(ShipRemouldMediator.REMOULD_SHIP, arg_29_0.shipVO.id, arg_29_1)
				end
			})
			var_35_6.contentText:AddListener(function(arg_37_0, arg_37_1)
				if arg_37_0 == "clickDetail" then
					arg_29_0:showToolTip(arg_29_1)
				end
			end)
		else
			arg_29_0:emit(ShipRemouldMediator.REMOULD_SHIP, arg_29_0.shipVO.id, arg_29_1)
		end
	end, SFX_CONFIRM)

	arg_29_0.contextData.transformId = arg_29_1
end

function var_0_0.isUnlock(arg_38_0, arg_38_1)
	if not arg_38_0:isUnLockPrev(arg_38_1) then
		return false
	end

	if arg_38_0:getLevelById(arg_38_1) > arg_38_0.shipVO.level then
		return false
	end

	if not arg_38_0:isReachStar(arg_38_1) then
		return false
	end

	return true
end

function var_0_0.isFinished(arg_39_0, arg_39_1)
	local var_39_0 = pg.transform_data_template[arg_39_1]
	local var_39_1 = arg_39_0:getTransformLevel(arg_39_1)

	if var_39_0.max_level == var_39_1 then
		return true
	end

	return false
end

function var_0_0.isReachStar(arg_40_0, arg_40_1)
	local var_40_0 = pg.transform_data_template[arg_40_1]

	return arg_40_0.shipVO:getStar() >= var_40_0.star_limit
end

function var_0_0.canRemould(arg_41_0, arg_41_1)
	if not arg_41_0:isUnLockPrev(arg_41_1) then
		return false, i18n("ship_remould_prev_lock"), {
			1
		}
	end

	local var_41_0 = pg.transform_data_template[arg_41_1]

	if arg_41_0:getLevelById(arg_41_1) > arg_41_0.shipVO.level then
		return false, i18n("ship_remould_need_level", var_41_0.level_limit), {
			2,
			var_41_0.level_limit
		}
	end

	if not arg_41_0:isReachStar(arg_41_1) then
		return false, i18n("ship_remould_need_star", var_41_0.star_limit), {
			3,
			var_41_0.star_limit
		}
	end

	if arg_41_0:isFinished(arg_41_1) then
		return false, i18n("ship_remould_finished"), {
			4
		}
	end

	return true
end

function var_0_0.isUnLockPrev(arg_42_0, arg_42_1)
	local var_42_0 = pg.transform_data_template[arg_42_1]

	for iter_42_0, iter_42_1 in pairs(var_42_0.condition_id) do
		local var_42_1 = pg.transform_data_template[iter_42_1]

		if not arg_42_0.shipVO.transforms[iter_42_1] or arg_42_0.shipVO.transforms[iter_42_1].level ~= var_42_1.max_level then
			return false
		end
	end

	return true
end

function var_0_0.isEnoughResource(arg_43_0, arg_43_1)
	local var_43_0 = pg.transform_data_template[arg_43_1]
	local var_43_1 = arg_43_0:getTransformLevel(arg_43_1) + 1

	for iter_43_0, iter_43_1 in ipairs(var_43_0.use_item[var_43_1] or {}) do
		if not arg_43_0.itemsVO[iter_43_1[1]] or arg_43_0.itemsVO[iter_43_1[1]].count < iter_43_1[2] then
			return false, i18n("ship_remould_no_item")
		end
	end

	if arg_43_0.playerVO.gold < var_43_0.use_gold then
		return false, i18n("ship_remould_no_gold")
	end

	if var_43_0.use_ship ~= 0 and (not arg_43_0.contextData.materialShipIds or #arg_43_0.contextData.materialShipIds ~= var_43_0.use_ship) then
		return false, i18n("ship_remould_no_material")
	end

	return true
end

function var_0_0.updateAttrTF(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0 = arg_44_3 and "%" or ""

	setText(arg_44_1:Find("name"), arg_44_2.attrName)
	setText(arg_44_1:Find("pre_value"), arg_44_2.value .. var_44_0)
	setText(arg_44_1:Find("value"), arg_44_2.addition + arg_44_2.value .. var_44_0)
	setText(arg_44_1:Find("addtion"), (arg_44_2.addition > 0 and "+" .. arg_44_2.addition or arg_44_2.addition) .. var_44_0)
end

function var_0_0.updateAttrTF_D(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	local var_45_0 = arg_45_3 and "%" or ""

	setText(arg_45_1:Find("name"), arg_45_2.attrName)
	setText(arg_45_1:Find("value"), (arg_45_2.addition > 0 and "+" .. arg_45_2.addition or arg_45_2.addition) .. var_45_0)
end

function var_0_0.showToolTip(arg_46_0, arg_46_1)
	if not arg_46_0.shipVO then
		return
	end

	local var_46_0 = pg.transform_data_template[arg_46_1]
	local var_46_1 = arg_46_0:isFinished(arg_46_1)

	setActive(findTF(arg_46_0.tooltip, "window/scrollview/list/attrs"), not var_46_1)

	if not var_46_1 then
		local var_46_2 = Clone(arg_46_0.shipVO)

		_.each(var_46_0.ship_id, function(arg_47_0)
			if arg_47_0[1] == arg_46_0.shipVO.configId then
				var_46_2.configId = arg_47_0[2]
			end
		end)

		var_46_2.transforms[arg_46_1] = {
			level = 1,
			id = arg_46_1
		}

		local var_46_3 = {}

		table.insert(var_46_3, {
			name = i18n("common_ship_type"),
			from = ShipType.Type2Name(arg_46_0.shipVO:getShipType()),
			to = ShipType.Type2Name(var_46_2:getShipType())
		})
		table.insert(var_46_3, {
			name = i18n("attribute_armor_type"),
			from = arg_46_0.shipVO:getShipArmorName(),
			to = var_46_2:getShipArmorName()
		})

		local var_46_4 = {
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
		local var_46_5 = arg_46_0.shipVO:getShipProperties()
		local var_46_6 = var_46_2:getShipProperties()

		for iter_46_0, iter_46_1 in ipairs(var_46_4) do
			local var_46_7 = {}

			if iter_46_1 == AttributeType.Expend then
				var_46_7.name = AttributeType.Type2Name(iter_46_1)
				var_46_7.from = arg_46_0.shipVO:getBattleTotalExpend()
				var_46_7.to = var_46_2:getBattleTotalExpend()
			else
				var_46_7.name = AttributeType.Type2Name(iter_46_1)
				var_46_7.from = math.floor(var_46_5[iter_46_1])
				var_46_7.to = math.floor(var_46_6[iter_46_1])
			end

			var_46_7.add = var_46_7.to - var_46_7.from

			table.insert(var_46_3, var_46_7)
		end

		local var_46_8 = UIItemList.New(findTF(arg_46_0.tooltip, "window/scrollview/list/attrs"), findTF(arg_46_0.tooltip, "window/scrollview/list/attrs/attr"))

		var_46_8:make(function(arg_48_0, arg_48_1, arg_48_2)
			if arg_48_0 == UIItemList.EventUpdate then
				local var_48_0 = var_46_3[arg_48_1 + 1]

				setText(arg_48_2:Find("name"), var_48_0.name)
				setText(arg_48_2:Find("pre_value"), var_48_0.from)

				local var_48_1 = arg_48_2:Find("addtion")
				local var_48_2 = "#A9F548"

				if var_48_0.add and var_48_0.from ~= var_48_0.to then
					setActive(var_48_1, true)

					if var_48_0.from > var_48_0.to then
						var_48_2 = "#FF3333"
					end

					local var_48_3 = var_48_0.from < var_48_0.to and "+" or ""

					setText(var_48_1, string.format("<color=%s>[%s%s]</color>", var_48_2, var_48_3, var_48_0.add))
					setText(arg_48_2:Find("value"), string.format("<color=%s>%s</color>", var_48_2, var_48_0.to))
				else
					setActive(var_48_1, false)
					setText(arg_48_2:Find("value"), string.format("<color=%s>%s</color>", var_48_2, var_48_0.to))
				end
			end
		end)
		var_46_8:align(#var_46_3)
	end

	setText(findTF(arg_46_0.tooltip, "window/scrollview/list/content/"), var_46_0.descrip)
	onButton(arg_46_0, findTF(arg_46_0.tooltip, "window/top/btnBack"), function()
		arg_46_0:closeTip()
	end, SFX_CANCEL)
	onButton(arg_46_0, arg_46_0.tooltip, function()
		arg_46_0:closeTip()
	end, SFX_CANCEL)
	setActive(arg_46_0.tooltip, true)
	arg_46_0:OverlayPanel(arg_46_0.tooltip)
end

function var_0_0.closeTip(arg_51_0)
	setActive(arg_51_0.tooltip, false)
	arg_51_0:UnOverlayPanel(arg_51_0.tooltip, arg_51_0._tf)
end

function var_0_0.willExit(arg_52_0)
	if arg_52_0.helpBtn then
		setActive(arg_52_0.helpBtn, true)
	end

	arg_52_0:UnOverlayPanel(arg_52_0.tooltip, arg_52_0._tf)
end

function var_0_0.onBackPressed(arg_53_0)
	if isActive(arg_53_0.tooltip) then
		arg_53_0:closeTip()

		return
	end

	arg_53_0:emit(BaseUI.ON_BACK_PRESSED, true)
end

return var_0_0
