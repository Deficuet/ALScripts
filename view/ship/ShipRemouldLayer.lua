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

function var_0_0.init(arg_2_0)
	arg_2_0.container = arg_2_0:findTF("main/bg/container")
	arg_2_0.gridContainer = arg_2_0:findTF("grids", arg_2_0.container)
	arg_2_0.gridTF = arg_2_0:findTF("grid_tpl", arg_2_0.gridContainer)
	arg_2_0.height = arg_2_0.gridTF.sizeDelta.y + var_0_5
	arg_2_0.width = arg_2_0.gridTF.sizeDelta.x + var_0_4
	arg_2_0.startPos = Vector2(-1 * ((var_0_2 / 2 - 0.5) * arg_2_0.width) + var_0_6.x, (var_0_1 / 2 - 0.5) * arg_2_0.height + var_0_6.y)
	arg_2_0.containerWidth = var_0_2 * arg_2_0.gridTF.sizeDelta.x + (var_0_2 - 1) * var_0_4
	arg_2_0.containerHeight = var_0_1 * arg_2_0.gridTF.sizeDelta.y + (var_0_1 - 1) * var_0_5
	arg_2_0.container.sizeDelta = Vector2(arg_2_0.containerWidth, arg_2_0.containerHeight)

	setActive(arg_2_0.gridTF, false)

	arg_2_0.infoPanel = arg_2_0:findTF("main/info_panel")
	arg_2_0.itemContainer = arg_2_0:findTF("usages/items", arg_2_0.infoPanel)
	arg_2_0.itemTF = arg_2_0:findTF("itemTF", arg_2_0.itemContainer)
	arg_2_0.infoName = arg_2_0:findTF("name_container/Text", arg_2_0.infoPanel):GetComponent(typeof(Text))
	arg_2_0.attrContainer = arg_2_0:findTF("align/attrs", arg_2_0.infoPanel)
	arg_2_0.attrTpl = arg_2_0:getTpl("attr", arg_2_0.attrContainer)
	arg_2_0.attrTplD = arg_2_0:getTpl("attrd", arg_2_0.attrContainer)
	arg_2_0.confirmBtn = arg_2_0:findTF("confirm_btn/activity", arg_2_0.infoPanel)
	arg_2_0.inactiveBtn = arg_2_0:findTF("confirm_btn/inactivity", arg_2_0.infoPanel)
	arg_2_0.completedteBtn = arg_2_0:findTF("confirm_btn/complete", arg_2_0.infoPanel)
	arg_2_0.shipTF = arg_2_0:findTF("main/info_panel/usages/shipTF")
	arg_2_0.skillDesc = arg_2_0:findTF("align/skill_desc/text", arg_2_0.infoPanel)
	arg_2_0.shipContainer = arg_2_0:findTF("char_container", arg_2_0.infoPanel)
	arg_2_0.lineTpl = arg_2_0:findTF("resources/line")
	arg_2_0.lineContainer = arg_2_0:findTF("grids/lines", arg_2_0.container)
	arg_2_0.helpBtn = GameObject.Find("/OverlayCamera/Overlay/UIMain/common/help_btn")

	if not IsNil(arg_2_0.helpBtn) then
		setActive(arg_2_0.helpBtn, false)
	end

	arg_2_0.tooltip = arg_2_0:findTF("tooltip")

	setActive(arg_2_0.tooltip, false)
end

function var_0_0.setPlayer(arg_3_0, arg_3_1)
	arg_3_0.playerVO = arg_3_1

	if arg_3_0.curtransformId then
		arg_3_0:updateInfo(arg_3_0.curtransformId)
	end
end

function var_0_0.setItems(arg_4_0, arg_4_1)
	arg_4_0.itemsVO = arg_4_1
end

function var_0_0.getItemCount(arg_5_0, arg_5_1)
	return (arg_5_0.itemsVO[arg_5_1] or Item.New({
		count = 0,
		id = arg_5_1
	})).count
end

function var_0_0.setShipVO(arg_6_0, arg_6_1)
	arg_6_0.shipVO = arg_6_1
	arg_6_0.shipGroupId = math.floor(arg_6_0.shipVO:getGroupId())
end

function var_0_0.getShipTranformData(arg_7_0)
	local var_7_0 = pg.ship_data_trans[arg_7_0.shipGroupId]

	assert(var_7_0, "config missed [pg.ship_data_trans] shipGroup>>>." .. arg_7_0.shipGroupId)

	local var_7_1 = {}

	for iter_7_0, iter_7_1 in ipairs(var_7_0.transform_list) do
		for iter_7_2, iter_7_3 in ipairs(iter_7_1) do
			var_7_1[iter_7_3[2]] = Vector2(iter_7_0, iter_7_3[1])
		end
	end

	return var_7_1
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0:initTranformInfo()
	arg_8_0:initShipModel()
end

function var_0_0.initTranformInfo(arg_9_0)
	arg_9_0.transformIds = arg_9_0:getShipTranformData()
	arg_9_0.grids = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0.transformIds) do
		local var_9_0 = cloneTplTo(arg_9_0.gridTF, arg_9_0.gridContainer)

		go(var_9_0).name = iter_9_0
		var_9_0.localPosition = Vector2(arg_9_0.startPos.x + arg_9_0.width * (iter_9_1.x - 1), arg_9_0.startPos.y - arg_9_0.height * (iter_9_1.y - 1))

		onToggle(arg_9_0, var_9_0, function(arg_10_0)
			if arg_10_0 and arg_9_0.curtransformId ~= iter_9_0 then
				arg_9_0:updateInfo(iter_9_0)
			end
		end, SFX_PANEL)

		arg_9_0.grids[iter_9_0] = var_9_0
	end

	arg_9_0.lineTFs = {}

	for iter_9_2, iter_9_3 in pairs(arg_9_0.transformIds) do
		arg_9_0:initLines(iter_9_2)
	end

	arg_9_0.posTransId = {}

	arg_9_0:updateLines()

	if arg_9_0.contextData.transformId then
		assert(arg_9_0.grids[arg_9_0.contextData.transformId], "without this transform id:" .. arg_9_0.contextData.transformId)
		triggerToggle(arg_9_0.grids[arg_9_0.contextData.transformId], true)
	end
end

function var_0_0.initLines(arg_11_0, arg_11_1)
	local var_11_0 = 270
	local var_11_1 = 75

	arg_11_0.lineTFs[arg_11_1] = {}

	local var_11_2 = arg_11_0.transformIds[arg_11_1].x
	local var_11_3 = arg_11_0.transformIds[arg_11_1].y
	local var_11_4 = arg_11_0.grids[arg_11_1]
	local var_11_5 = var_11_4.sizeDelta
	local var_11_6 = var_11_4.localPosition
	local var_11_7 = arg_11_0.lineTpl
	local var_11_8 = pg.transform_data_template[arg_11_1].condition_id

	for iter_11_0, iter_11_1 in pairs(var_11_8) do
		local var_11_9 = arg_11_0.transformIds[iter_11_1].x
		local var_11_10 = arg_11_0.transformIds[iter_11_1].y
		local var_11_11 = Vector2(var_11_9 - var_11_2, var_11_10 - var_11_3)

		if var_11_11 ~= Vector2.zero then
			local var_11_12 = cloneTplTo(var_11_7, arg_11_0.lineContainer, var_11_2 .. "-" .. var_11_3 .. "-v")
			local var_11_13 = cloneTplTo(var_11_7, arg_11_0.lineContainer, var_11_2 .. "-" .. var_11_3 .. "-h")
			local var_11_14 = var_11_11.y < 0 and 90 or -90

			var_11_12.eulerAngles = Vector3(0, 0, var_11_14)

			local var_11_15 = var_11_11.x < 0 and 180 or 0

			var_11_13.eulerAngles = Vector3(0, 0, var_11_15)

			local var_11_16 = math.abs(var_11_11.y) > 0 and math.abs(var_11_11.x) > 0

			if var_11_16 then
				local var_11_17 = var_11_6.y + (var_11_3 - var_11_10) * var_11_0

				var_11_13.localPosition = Vector2(var_11_6.x, var_11_17, 0)

				local var_11_18 = var_11_11.y < 0 and var_11_6.y + var_11_5.y / 2 or var_11_6.y - var_11_5.y / 2

				var_11_12.localPosition = Vector2(var_11_6.x, var_11_18)
				var_11_13.sizeDelta = Vector2(math.abs(var_11_11.x) * var_11_0, var_11_13.sizeDelta.y)
				var_11_12.sizeDelta = Vector2(math.abs(var_11_11.y) * var_11_0 - var_11_5.y / 2, var_11_12.sizeDelta.y)

				local var_11_19 = var_11_11.x < 0 and var_11_14 < 0 and -1 or 1

				var_11_12:Find("corner").localScale = Vector3(1, var_11_19, 1)
			else
				var_11_13.sizeDelta = Vector2(math.abs(var_11_11.x) * var_11_0, var_11_13.sizeDelta.y)
				var_11_12.sizeDelta = Vector2(math.abs(var_11_11.y) * var_11_1, var_11_12.sizeDelta.y)
				var_11_13.localPosition = var_11_6

				local var_11_20 = var_11_11.y < 0 and var_11_6.y + var_11_5.y / 2 or var_11_6.y - var_11_5.y / 2

				var_11_12.localPosition = Vector3(var_11_6.x, var_11_20, 0)
			end

			setActive(var_11_12:Find("arr"), var_11_16 or math.abs(var_11_11.y) > 0)
			setActive(var_11_12:Find("corner"), var_11_16)
			setActive(var_11_13:Find("arr"), false)
			setActive(var_11_13:Find("corner"), false)
			table.insert(arg_11_0.lineTFs[arg_11_1], {
				id = iter_11_1,
				hrz = var_11_13,
				vec = var_11_12
			})
		end
	end
end

function var_0_0.updateLines(arg_12_0)
	for iter_12_0, iter_12_1 in pairs(arg_12_0.transformIds) do
		arg_12_0:updateGridTF(iter_12_0)

		if arg_12_0:canRemould(iter_12_0) or arg_12_0:isFinished(iter_12_0) then
			for iter_12_2, iter_12_3 in ipairs(arg_12_0.lineTFs[iter_12_0] or {}) do
				iter_12_3.hrz:GetComponent("UIGrayScale").enabled = false
				iter_12_3.vec:GetComponent("UIGrayScale").enabled = false
			end
		end
	end
end

function var_0_0.getLevelById(arg_13_0, arg_13_1)
	return pg.transform_data_template[arg_13_1].level_limit
end

function var_0_0.getTransformLevel(arg_14_0, arg_14_1)
	if not arg_14_0.shipVO.transforms[arg_14_1] then
		return 0
	else
		return arg_14_0.shipVO.transforms[arg_14_1].level
	end
end

var_0_0.STATE_FINISHED = 1
var_0_0.STATE_ACTIVE = 2
var_0_0.STATE_LOCK = 3

function var_0_0.getTransformState(arg_15_0, arg_15_1)
	if arg_15_0:getTransformLevel(arg_15_1) == pg.transform_data_template[arg_15_1].max_level then
		return var_0_0.STATE_FINISHED
	elseif arg_15_0:canRemould(arg_15_1) then
		return var_0_0.STATE_ACTIVE
	else
		return var_0_0.STATE_LOCK
	end
end

function var_0_0.updateGridTF(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.grids[arg_16_1]
	local var_16_1 = pg.transform_data_template[arg_16_1]

	setText(var_16_0:Find("name"), var_16_1.name)

	local var_16_2 = var_16_0:Find("icon"):GetComponent(typeof(Image))

	GetSpriteFromAtlasAsync("modicon", var_16_1.icon, function(arg_17_0)
		if not IsNil(var_16_2) then
			var_16_2.sprite = arg_17_0
		end
	end)

	local var_16_3 = arg_16_0:getTransformState(arg_16_1)

	setActive(var_16_0:Find("bgs/finished"), var_16_3 == var_0_0.STATE_FINISHED)
	setActive(var_16_0:Find("bgs/ongoing"), var_16_3 == var_0_0.STATE_ACTIVE)
	setActive(var_16_0:Find("bgs/lock"), var_16_3 == var_0_0.STATE_LOCK)
	setActive(var_16_0:Find("tags/finished"), var_16_3 == var_0_0.STATE_FINISHED)
	setActive(var_16_0:Find("tags/ongoing"), var_16_3 == var_0_0.STATE_ACTIVE)
	setActive(var_16_0:Find("tags/lock"), var_16_3 == var_0_0.STATE_LOCK)

	local var_16_4 = arg_16_0:getTransformLevel(arg_16_1)
	local var_16_5 = var_16_0:Find("icon/progress")

	if var_16_3 == var_0_0.STATE_FINISHED then
		setText(var_16_5, var_16_4 .. "/" .. var_16_1.max_level)
	elseif var_16_3 == var_0_0.STATE_ACTIVE then
		setText(var_16_5, var_16_4 .. "/" .. var_16_1.max_level)
	elseif var_16_3 == var_0_0.STATE_LOCK then
		local var_16_6, var_16_7, var_16_8 = arg_16_0:canRemould(arg_16_1)

		setText(var_16_5, "")
		setActive(var_16_0:Find("tags/lock/lock_prev"), var_16_8 and var_16_8[1] == 1)
		setActive(var_16_0:Find("tags/lock/lock_level"), var_16_8 and var_16_8[1] == 2)
		setActive(var_16_0:Find("tags/lock/lock_star"), var_16_8 and var_16_8[1] == 3)

		if var_16_8 and var_16_8[1] == 2 then
			setText(var_16_0:Find("tags/lock/lock_level/Text"), var_16_8[2])
		elseif var_16_8 and var_16_8[1] == 3 then
			setText(var_16_0:Find("tags/lock/lock_star/Text"), var_16_8[2])
		end
	end

	local var_16_9 = arg_16_0.transformIds[arg_16_1].x .. "_" .. arg_16_0.transformIds[arg_16_1].y

	if not arg_16_0.posTransId[var_16_9] then
		arg_16_0.posTransId[var_16_9] = arg_16_1
	elseif arg_16_0.posTransId[var_16_9] == arg_16_1 then
		-- block empty
	elseif var_16_3 == var_0_0.STATE_ACTIVE or arg_16_0:getTransformState(arg_16_0.posTransId[var_16_9]) ~= var_0_0.STATE_ACTIVE and arg_16_1 < arg_16_0.posTransId[var_16_9] then
		if arg_16_0.posTransId[var_16_9] == arg_16_0.curtransformId then
			arg_16_0.curtransformId = arg_16_1
		end

		setActive(arg_16_0.grids[arg_16_0.posTransId[var_16_9]], false)

		arg_16_0.posTransId[var_16_9] = arg_16_1
	end

	setActive(var_16_0, arg_16_1 == arg_16_0.posTransId[var_16_9])

	if arg_16_0.curtransformId == arg_16_1 then
		arg_16_0:updateInfo(arg_16_1)
	end
end

function var_0_0.initShipModel(arg_18_0)
	local var_18_0 = arg_18_0.shipVO:getPrefab()

	if arg_18_0.shipContainer.childCount ~= 0 then
		PoolMgr.GetInstance():ReturnSpineChar(var_18_0, go(arg_18_0.shipModel))
	end

	local function var_18_1(arg_19_0)
		if not IsNil(arg_18_0._tf) then
			local var_19_0 = tf(arg_19_0)

			arg_18_0.shipModel = var_19_0
			arg_18_0.spineAnimUI = var_19_0:GetComponent("SpineAnimUI")

			pg.ViewUtils.SetLayer(var_19_0, Layer.UI)

			var_19_0.localScale = Vector3(var_0_3, var_0_3, 1)

			setParent(var_19_0, arg_18_0.shipContainer)

			var_19_0.localPosition = Vector2(0, 10)

			arg_18_0.spineAnimUI:SetAction("stand2", 0)
		end
	end

	PoolMgr.GetInstance():GetSpineChar(var_18_0, true, function(arg_20_0)
		var_18_1(arg_20_0)
	end)
end

function var_0_0.updateInfo(arg_21_0, arg_21_1)
	if arg_21_0:isFinished(arg_21_1) then
		arg_21_0:updateFinished(arg_21_1)
	else
		arg_21_0:updateProgress(arg_21_1)
	end
end

function var_0_0.updateFinished(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.shipVO.transforms[arg_22_1].level

	arg_22_0.curtransformId = arg_22_1

	local var_22_1 = pg.transform_data_template[arg_22_1]

	arg_22_0.infoName.text = var_22_1.name

	local var_22_2 = {}

	for iter_22_0 = 1, var_22_0 do
		_.each(var_22_1.use_item[iter_22_0], function(arg_23_0)
			local var_23_0 = _.detect(var_22_2, function(arg_24_0)
				return arg_24_0.type == DROP_TYPE_ITEM and arg_24_0.id == arg_23_0[1]
			end)

			if not var_23_0 then
				table.insert(var_22_2, {
					type = DROP_TYPE_ITEM,
					id = arg_23_0[1],
					count = arg_23_0[2]
				})
			else
				var_23_0.count = var_23_0.count + arg_23_0[2]
			end
		end)
	end

	table.insert(var_22_2, {
		type = DROP_TYPE_ITEM,
		id = id2ItemId(PlayerConst.ResGold),
		count = var_22_1.use_gold * var_22_0
	})

	for iter_22_1 = arg_22_0.itemContainer.childCount, #var_22_2 - 1 do
		cloneTplTo(arg_22_0.itemTF, arg_22_0.itemContainer)
	end

	local var_22_3 = arg_22_0.itemContainer.childCount

	for iter_22_2 = 1, var_22_3 do
		local var_22_4 = arg_22_0.itemContainer:GetChild(iter_22_2 - 1)

		setActive(var_22_4, iter_22_2 <= #var_22_2)

		if iter_22_2 <= #var_22_2 then
			updateDrop(arg_22_0:findTF("IconTpl", var_22_4), var_22_2[iter_22_2])
			RemoveComponent(var_22_4, typeof(Button))
		end
	end

	setActive(arg_22_0.shipTF, var_22_1.use_ship > 0)

	if var_22_1.use_ship > 0 then
		setActive(arg_22_0.shipTF:Find("addTF"), false)
		setActive(arg_22_0.shipTF:Find("IconTpl"), true)
		updateDrop(arg_22_0:findTF("IconTpl", arg_22_0.shipTF), {
			type = DROP_TYPE_SHIP,
			id = arg_22_0.shipVO.configId
		})
		removeOnButton(arg_22_0.shipTF)
	end

	setActive(arg_22_0.skillDesc.parent, var_22_1.skill_id ~= 0)

	if var_22_1.skill_id ~= 0 then
		local var_22_5 = pg.skill_data_template[var_22_1.skill_id].name

		setText(arg_22_0.skillDesc, i18n("ship_remould_material_unlock_skill", var_22_5))
	end

	removeAllChildren(arg_22_0.attrContainer)

	local var_22_6
	local var_22_7

	_.each(var_22_1.ship_id, function(arg_25_0)
		if arg_25_0[1] == arg_22_0.shipVO.configId then
			var_22_6 = arg_25_0[2]
		end

		if pg.ship_data_template[arg_25_0[1]].group_type == arg_22_0.shipVO.groupId then
			var_22_7 = pg.ship_data_statistics[arg_25_0[2]].type
		end
	end)

	if var_22_7 then
		local var_22_8 = cloneTplTo(arg_22_0.attrTplD, arg_22_0.attrContainer)

		setText(var_22_8:Find("name"), i18n("common_ship_type"))
		setText(var_22_8:Find("value"), ShipType.Type2Name(var_22_7))

		local var_22_9 = var_22_8:Find("quest")

		setActive(var_22_9, true)
		onButton(arg_22_0, var_22_8, function()
			arg_22_0:showToolTip(arg_22_1)
		end)
	else
		local var_22_10 = _.reduce(var_22_1.effect, {}, function(arg_27_0, arg_27_1)
			for iter_27_0, iter_27_1 in pairs(arg_27_1) do
				arg_27_0[iter_27_0] = (arg_27_0[iter_27_0] or 0) + iter_27_1
			end

			return arg_27_0
		end)
		local var_22_11 = arg_22_0.shipVO:getShipProperties()

		for iter_22_3, iter_22_4 in pairs(var_22_11) do
			if var_22_10[iter_22_3] then
				local var_22_12 = cloneTplTo(arg_22_0.attrTplD, arg_22_0.attrContainer)

				arg_22_0:updateAttrTF_D(var_22_12, {
					attrName = AttributeType.Type2Name(iter_22_3),
					value = math.floor(iter_22_4),
					addition = var_22_10[iter_22_3]
				})
			end
		end

		local var_22_13 = pg.ship_data_template[arg_22_0.shipVO.configId]

		for iter_22_5 = 1, 3 do
			if var_22_10["equipment_proficiency_" .. iter_22_5] then
				local var_22_14 = EquipType.Types2Title(iter_22_5, arg_22_0.shipVO.configId)
				local var_22_15 = EquipType.LabelToName(var_22_14) .. i18n("common_proficiency")
				local var_22_16 = cloneTplTo(arg_22_0.attrTplD, arg_22_0.attrContainer)

				arg_22_0:updateAttrTF_D(var_22_16, {
					attrName = var_22_15,
					value = arg_22_0.shipVO:getEquipProficiencyByPos(iter_22_5) * 100,
					addition = var_22_10["equipment_proficiency_" .. iter_22_5] * 100
				}, true)
			end
		end
	end

	setActive(arg_22_0.confirmBtn, false)
	setActive(arg_22_0.inactiveBtn, false)
	setActive(arg_22_0.completedteBtn, arg_22_0:isFinished(arg_22_1))

	arg_22_0.contextData.transformId = arg_22_1
end

function var_0_0.updateProgress(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0:getTransformLevel(arg_28_1) + 1

	arg_28_0.curtransformId = arg_28_1

	local var_28_1 = pg.transform_data_template[arg_28_1]

	arg_28_0.infoName.text = var_28_1.name

	local var_28_2, var_28_3 = arg_28_0:canRemould(arg_28_1)
	local var_28_4 = var_28_1.effect[var_28_0] or {}

	setActive(arg_28_0.shipTF, false)
	setText(arg_28_0.skillDesc, "")

	local var_28_5

	if var_28_1.use_item[var_28_0] then
		var_28_5 = Clone(var_28_1.use_item[var_28_0])
	else
		var_28_5 = {}
	end

	if var_28_1.use_gold > 0 then
		table.insert(var_28_5, {
			id2ItemId(PlayerConst.ResGold),
			var_28_1.use_gold
		})
	end

	setActive(arg_28_0.shipTF, var_28_1.use_ship ~= 0)

	if var_28_1.use_ship ~= 0 then
		local var_28_6 = arg_28_0.contextData.materialShipIds
		local var_28_7 = var_28_6 and table.getCount(var_28_6) ~= 0

		setActive(arg_28_0.shipTF:Find("IconTpl"), var_28_7)
		setActive(arg_28_0.shipTF:Find("addTF"), not var_28_7)

		if var_28_7 then
			updateDrop(arg_28_0:findTF("IconTpl", arg_28_0.shipTF), {
				id = getProxy(BayProxy):getShipById(var_28_6[1]).configId,
				type = DROP_TYPE_SHIP
			})
		end

		onButton(arg_28_0, arg_28_0.shipTF, function()
			if var_28_2 then
				arg_28_0:emit(ShipRemouldMediator.ON_SELECTE_SHIP, arg_28_0.shipVO)
			else
				pg.TipsMgr.GetInstance():ShowTips(var_28_3)
			end
		end, SFX_PANEL)
	else
		arg_28_0.contextData.materialShipIds = nil
	end

	setActive(arg_28_0.skillDesc.parent, var_28_1.skill_id ~= 0)

	if var_28_1.skill_id ~= 0 then
		local var_28_8 = pg.skill_data_template[var_28_1.skill_id].name

		setText(arg_28_0.skillDesc, i18n("ship_remould_material_unlock_skill", var_28_8))
	end

	for iter_28_0 = arg_28_0.itemContainer.childCount, #var_28_5 - 1 do
		cloneTplTo(arg_28_0.itemTF, arg_28_0.itemContainer)
	end

	local var_28_9 = arg_28_0.itemContainer.childCount

	for iter_28_1 = 1, var_28_9 do
		local var_28_10 = arg_28_0.itemContainer:GetChild(iter_28_1 - 1)

		setActive(var_28_10, iter_28_1 <= #var_28_5)

		if iter_28_1 <= #var_28_5 then
			local var_28_11 = var_28_5[iter_28_1]
			local var_28_12 = ""

			if var_28_11[1] == id2ItemId(PlayerConst.ResGold) then
				local var_28_13 = arg_28_0.playerVO.gold >= var_28_11[2]

				var_28_12 = setColorStr(var_28_11[2], var_28_13 and COLOR_WHITE or COLOR_RED)

				if var_28_13 then
					RemoveComponent(var_28_10, typeof(Button))
				else
					onButton(arg_28_0, var_28_10, function()
						ItemTipPanel.ShowGoldBuyTip(var_28_11[2])
					end)

					var_28_10:GetComponent(typeof(Button)).targetGraphic = var_28_10:Find("IconTpl/icon_bg/icon"):GetComponent(typeof(Image))
				end
			else
				local var_28_14 = arg_28_0:getItemCount(var_28_11[1]) >= var_28_11[2]

				var_28_12 = setColorStr(arg_28_0:getItemCount(var_28_11[1]), var_28_14 and COLOR_WHITE or COLOR_RED)
				var_28_12 = var_28_12 .. "/" .. var_28_11[2]

				if var_28_14 or not ItemTipPanel.CanShowTip(var_28_11[1]) then
					RemoveComponent(var_28_10, typeof(Button))
				else
					onButton(arg_28_0, var_28_10, function()
						ItemTipPanel.ShowItemTipbyID(var_28_11[1])
					end)

					var_28_10:GetComponent(typeof(Button)).targetGraphic = var_28_10:Find("IconTpl/icon_bg/icon"):GetComponent(typeof(Image))
				end
			end

			updateDrop(arg_28_0:findTF("IconTpl", var_28_10), {
				id = var_28_11[1],
				type = DROP_TYPE_ITEM,
				count = var_28_12
			})
		end
	end

	removeAllChildren(arg_28_0.attrContainer)

	local var_28_15
	local var_28_16

	_.each(var_28_1.ship_id, function(arg_32_0)
		if arg_32_0[1] == arg_28_0.shipVO.configId then
			var_28_15 = arg_32_0[2]
		end

		if pg.ship_data_template[arg_32_0[1]].group_type == arg_28_0.shipVO.groupId then
			var_28_16 = pg.ship_data_statistics[arg_32_0[2]].type
		end
	end)

	if var_28_16 then
		local var_28_17 = cloneTplTo(arg_28_0.attrTpl, arg_28_0.attrContainer)

		setText(var_28_17:Find("name"), i18n("common_ship_type"))
		setText(var_28_17:Find("pre_value"), ShipType.Type2Name(arg_28_0.shipVO:getShipType()))
		setText(var_28_17:Find("value"), ShipType.Type2Name(var_28_16))
		setActive(var_28_17:Find("addtion"), false)

		local var_28_18 = var_28_17:Find("quest")

		if var_28_15 then
			setActive(var_28_18, true)
			onButton(arg_28_0, var_28_17, function()
				arg_28_0:showToolTip(arg_28_1)
			end)
		else
			setActive(var_28_18, false)
		end
	else
		local var_28_19 = arg_28_0.shipVO:getShipProperties()

		for iter_28_2, iter_28_3 in pairs(var_28_19) do
			if var_28_4[iter_28_2] then
				local var_28_20 = cloneTplTo(arg_28_0.attrTpl, arg_28_0.attrContainer)

				arg_28_0:updateAttrTF(var_28_20, {
					attrName = AttributeType.Type2Name(iter_28_2),
					value = math.floor(iter_28_3),
					addition = var_28_4[iter_28_2]
				})
			end
		end

		local var_28_21 = pg.ship_data_template[arg_28_0.shipVO.configId]

		for iter_28_4 = 1, 3 do
			if var_28_4["equipment_proficiency_" .. iter_28_4] then
				local var_28_22 = EquipType.Types2Title(iter_28_4, arg_28_0.shipVO.configId)
				local var_28_23 = EquipType.LabelToName(var_28_22) .. i18n("common_proficiency")
				local var_28_24 = cloneTplTo(arg_28_0.attrTpl, arg_28_0.attrContainer)

				arg_28_0:updateAttrTF(var_28_24, {
					attrName = var_28_23,
					value = arg_28_0.shipVO:getEquipProficiencyByPos(iter_28_4) * 100,
					addition = var_28_4["equipment_proficiency_" .. iter_28_4] * 100
				}, true)
			end
		end
	end

	local var_28_25 = arg_28_0:isEnoughResource(arg_28_1)

	setActive(arg_28_0.confirmBtn, var_28_2 and var_28_25)
	setActive(arg_28_0.inactiveBtn, not var_28_2 or not var_28_25)
	setActive(arg_28_0.completedteBtn, false)
	onButton(arg_28_0, arg_28_0.confirmBtn, function()
		local var_34_0, var_34_1 = ShipStatus.ShipStatusCheck("onModify", arg_28_0.shipVO)

		if not var_34_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_34_1)

			return
		end

		local var_34_2, var_34_3 = arg_28_0:canRemould(arg_28_1)

		if not var_34_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_34_3)

			return
		end

		local var_34_4, var_34_5 = arg_28_0:isEnoughResource(arg_28_1)

		if not var_34_4 then
			pg.TipsMgr.GetInstance():ShowTips(var_34_5)

			return
		end

		if var_28_15 then
			local var_34_6 = pg.MsgboxMgr.GetInstance()

			var_34_6:ShowMsgBox({
				modal = true,
				content = i18n("ship_remould_warning_" .. var_28_15, arg_28_0.shipVO:getName()),
				onYes = function()
					arg_28_0:emit(ShipRemouldMediator.REMOULD_SHIP, arg_28_0.shipVO.id, arg_28_1)
				end
			})
			var_34_6.contentText:AddListener(function(arg_36_0, arg_36_1)
				if arg_36_0 == "clickDetail" then
					arg_28_0:showToolTip(arg_28_1)
				end
			end)
		else
			arg_28_0:emit(ShipRemouldMediator.REMOULD_SHIP, arg_28_0.shipVO.id, arg_28_1)
		end
	end, SFX_CONFIRM)

	arg_28_0.contextData.transformId = arg_28_1
end

function var_0_0.isUnlock(arg_37_0, arg_37_1)
	if not arg_37_0:isUnLockPrev(arg_37_1) then
		return false
	end

	if arg_37_0:getLevelById(arg_37_1) > arg_37_0.shipVO.level then
		return false
	end

	if not arg_37_0:isReachStar(arg_37_1) then
		return false
	end

	return true
end

function var_0_0.isFinished(arg_38_0, arg_38_1)
	local var_38_0 = pg.transform_data_template[arg_38_1]
	local var_38_1 = arg_38_0:getTransformLevel(arg_38_1)

	if var_38_0.max_level == var_38_1 then
		return true
	end

	return false
end

function var_0_0.isReachStar(arg_39_0, arg_39_1)
	local var_39_0 = pg.transform_data_template[arg_39_1]

	return arg_39_0.shipVO:getStar() >= var_39_0.star_limit
end

function var_0_0.canRemould(arg_40_0, arg_40_1)
	if not arg_40_0:isUnLockPrev(arg_40_1) then
		return false, i18n("ship_remould_prev_lock"), {
			1
		}
	end

	local var_40_0 = pg.transform_data_template[arg_40_1]

	if arg_40_0:getLevelById(arg_40_1) > arg_40_0.shipVO.level then
		return false, i18n("ship_remould_need_level", var_40_0.level_limit), {
			2,
			var_40_0.level_limit
		}
	end

	if not arg_40_0:isReachStar(arg_40_1) then
		return false, i18n("ship_remould_need_star", var_40_0.star_limit), {
			3,
			var_40_0.star_limit
		}
	end

	if arg_40_0:isFinished(arg_40_1) then
		return false, i18n("ship_remould_finished"), {
			4
		}
	end

	return true
end

function var_0_0.isUnLockPrev(arg_41_0, arg_41_1)
	local var_41_0 = pg.transform_data_template[arg_41_1]

	for iter_41_0, iter_41_1 in pairs(var_41_0.condition_id) do
		local var_41_1 = pg.transform_data_template[iter_41_1]

		if not arg_41_0.shipVO.transforms[iter_41_1] or arg_41_0.shipVO.transforms[iter_41_1].level ~= var_41_1.max_level then
			return false
		end
	end

	return true
end

function var_0_0.isEnoughResource(arg_42_0, arg_42_1)
	local var_42_0 = pg.transform_data_template[arg_42_1]
	local var_42_1 = arg_42_0:getTransformLevel(arg_42_1) + 1

	for iter_42_0, iter_42_1 in ipairs(var_42_0.use_item[var_42_1] or {}) do
		if not arg_42_0.itemsVO[iter_42_1[1]] or arg_42_0.itemsVO[iter_42_1[1]].count < iter_42_1[2] then
			return false, i18n("ship_remould_no_item")
		end
	end

	if arg_42_0.playerVO.gold < var_42_0.use_gold then
		return false, i18n("ship_remould_no_gold")
	end

	if var_42_0.use_ship ~= 0 and (not arg_42_0.contextData.materialShipIds or #arg_42_0.contextData.materialShipIds ~= var_42_0.use_ship) then
		return false, i18n("ship_remould_no_material")
	end

	return true
end

function var_0_0.updateAttrTF(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = arg_43_3 and "%" or ""

	setText(arg_43_1:Find("name"), arg_43_2.attrName)
	setText(arg_43_1:Find("pre_value"), arg_43_2.value .. var_43_0)
	setText(arg_43_1:Find("value"), arg_43_2.addition + arg_43_2.value .. var_43_0)
	setText(arg_43_1:Find("addtion"), (arg_43_2.addition > 0 and "+" .. arg_43_2.addition or arg_43_2.addition) .. var_43_0)
end

function var_0_0.updateAttrTF_D(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0 = arg_44_3 and "%" or ""

	setText(arg_44_1:Find("name"), arg_44_2.attrName)
	setText(arg_44_1:Find("value"), (arg_44_2.addition > 0 and "+" .. arg_44_2.addition or arg_44_2.addition) .. var_44_0)
end

function var_0_0.showToolTip(arg_45_0, arg_45_1)
	if not arg_45_0.shipVO then
		return
	end

	local var_45_0 = pg.transform_data_template[arg_45_1]
	local var_45_1 = arg_45_0:isFinished(arg_45_1)

	setActive(findTF(arg_45_0.tooltip, "window/scrollview/list/attrs"), not var_45_1)

	if not var_45_1 then
		local var_45_2 = Clone(arg_45_0.shipVO)

		_.each(var_45_0.ship_id, function(arg_46_0)
			if arg_46_0[1] == arg_45_0.shipVO.configId then
				var_45_2.configId = arg_46_0[2]
			end
		end)

		var_45_2.transforms[arg_45_1] = {
			level = 1,
			id = arg_45_1
		}

		local var_45_3 = {}

		table.insert(var_45_3, {
			name = i18n("common_ship_type"),
			from = ShipType.Type2Name(arg_45_0.shipVO:getShipType()),
			to = ShipType.Type2Name(var_45_2:getShipType())
		})
		table.insert(var_45_3, {
			name = i18n("attribute_armor_type"),
			from = arg_45_0.shipVO:getShipArmorName(),
			to = var_45_2:getShipArmorName()
		})

		local var_45_4 = {
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
		local var_45_5 = arg_45_0.shipVO:getShipProperties()
		local var_45_6 = var_45_2:getShipProperties()

		for iter_45_0, iter_45_1 in ipairs(var_45_4) do
			local var_45_7 = {}

			if iter_45_1 == AttributeType.Expend then
				var_45_7.name = AttributeType.Type2Name(iter_45_1)
				var_45_7.from = arg_45_0.shipVO:getBattleTotalExpend()
				var_45_7.to = var_45_2:getBattleTotalExpend()
			else
				var_45_7.name = AttributeType.Type2Name(iter_45_1)
				var_45_7.from = math.floor(var_45_5[iter_45_1])
				var_45_7.to = math.floor(var_45_6[iter_45_1])
			end

			var_45_7.add = var_45_7.to - var_45_7.from

			table.insert(var_45_3, var_45_7)
		end

		local var_45_8 = UIItemList.New(findTF(arg_45_0.tooltip, "window/scrollview/list/attrs"), findTF(arg_45_0.tooltip, "window/scrollview/list/attrs/attr"))

		var_45_8:make(function(arg_47_0, arg_47_1, arg_47_2)
			if arg_47_0 == UIItemList.EventUpdate then
				local var_47_0 = var_45_3[arg_47_1 + 1]

				setText(arg_47_2:Find("name"), var_47_0.name)
				setText(arg_47_2:Find("pre_value"), var_47_0.from)

				local var_47_1 = arg_47_2:Find("addtion")
				local var_47_2 = "#A9F548"

				if var_47_0.add and var_47_0.from ~= var_47_0.to then
					setActive(var_47_1, true)

					if var_47_0.from > var_47_0.to then
						var_47_2 = "#FF3333"
					end

					local var_47_3 = var_47_0.from < var_47_0.to and "+" or ""

					setText(var_47_1, string.format("<color=%s>[%s%s]</color>", var_47_2, var_47_3, var_47_0.add))
					setText(arg_47_2:Find("value"), string.format("<color=%s>%s</color>", var_47_2, var_47_0.to))
				else
					setActive(var_47_1, false)
					setText(arg_47_2:Find("value"), string.format("<color=%s>%s</color>", var_47_2, var_47_0.to))
				end
			end
		end)
		var_45_8:align(#var_45_3)
	end

	setText(findTF(arg_45_0.tooltip, "window/scrollview/list/content/"), var_45_0.descrip)
	onButton(arg_45_0, findTF(arg_45_0.tooltip, "window/top/btnBack"), function()
		arg_45_0:closeTip()
	end, SFX_CANCEL)
	onButton(arg_45_0, arg_45_0.tooltip, function()
		arg_45_0:closeTip()
	end, SFX_CANCEL)
	setActive(arg_45_0.tooltip, true)
	pg.UIMgr.GetInstance():OverlayPanel(arg_45_0.tooltip, {
		groupName = LayerWeightConst.GROUP_SHIPINFOUI,
		weight = LayerWeightConst.THIRD_LAYER
	})
end

function var_0_0.closeTip(arg_50_0)
	setActive(arg_50_0.tooltip, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_50_0.tooltip, arg_50_0._tf)
end

function var_0_0.willExit(arg_51_0)
	if arg_51_0.helpBtn then
		setActive(arg_51_0.helpBtn, true)
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_51_0.tooltip, arg_51_0._tf)
end

function var_0_0.onBackPressed(arg_52_0)
	if isActive(arg_52_0.tooltip) then
		arg_52_0:closeTip()

		return
	end

	arg_52_0:emit(BaseUI.ON_BACK_PRESSED, true)
end

return var_0_0
