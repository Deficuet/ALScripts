local var_0_0 = class("ShipUpgradeLayer2", import("..base.BaseUI"))
local var_0_1 = 3

function var_0_0.getUIName(arg_1_0)
	return "ShipBreakOutUI"
end

function var_0_0.setItems(arg_2_0, arg_2_1)
	arg_2_0.items = arg_2_1
end

function var_0_0.setPlayer(arg_3_0, arg_3_1)
	arg_3_0.player = arg_3_1
end

function var_0_0.init(arg_4_0)
	arg_4_0.leftPanel = arg_4_0:findTF("blur_panel/left_panel")
	arg_4_0.stages = arg_4_0:findTF("stageScrollRect/stages", arg_4_0.leftPanel)

	setText(arg_4_0.leftPanel:Find("bg/title/Image"), i18n("word_preview"))

	arg_4_0.stagesSnap = arg_4_0:findTF("stageScrollRect", arg_4_0.leftPanel):GetComponent("HorizontalScrollSnap")
	arg_4_0.breakView = arg_4_0:findTF("content/Text", arg_4_0.leftPanel)
	arg_4_0.rightPanel = arg_4_0:findTF("blur_panel/right_panel")
	arg_4_0.attrs = arg_4_0:findTF("top/attrs", arg_4_0.rightPanel)
	arg_4_0.starTpl = arg_4_0:findTF("top/rare/startpl", arg_4_0.rightPanel)

	setActive(arg_4_0.starTpl, false)

	arg_4_0.starsFrom = arg_4_0:findTF("top/rare/stars_from", arg_4_0.rightPanel)
	arg_4_0.starsTo = arg_4_0:findTF("top/rare/stars_to", arg_4_0.rightPanel)
	arg_4_0.starOpera = arg_4_0:findTF("top/rare/opera", arg_4_0.rightPanel)
	arg_4_0.materials = arg_4_0:findTF("bottom/materials", arg_4_0.rightPanel)
	arg_4_0.breakOutBtn = arg_4_0:findTF("bottom/break_btn/tip_active/image", arg_4_0.rightPanel)
	arg_4_0.appendStarTips = arg_4_0:findTF("bottom/panel_title/tip", arg_4_0.rightPanel)
	arg_4_0.tipActive = arg_4_0:findTF("bottom/break_btn/tip_active", arg_4_0.rightPanel)
	arg_4_0.tipDeactive = arg_4_0:findTF("bottom/break_btn/tip_deactive", arg_4_0.rightPanel)

	setText(arg_4_0.rightPanel:Find("bottom/panel_title/tip"), i18n("breakout_tip"))
	setText(arg_4_0.rightPanel:Find("bottom/break_btn/tip_deactive/values/ok"), i18n("text_confirm"))
	setText(arg_4_0.rightPanel:Find("bottom/break_btn/tip_active/image/ok"), i18n("text_confirm"))

	arg_4_0.recommandBtn = arg_4_0.rightPanel:Find("bottom/auto_btn")
	arg_4_0.isEnoughItems = true
	arg_4_0.sea = arg_4_0:findTF("sea", arg_4_0.leftPanel)
	arg_4_0.rawImage = arg_4_0.sea:GetComponent("RawImage")

	setActive(arg_4_0.rawImage, false)

	arg_4_0.healTF = arg_4_0:findTF("resources/heal")
	arg_4_0.healTF.transform.localPosition = Vector3(-360, 50, 40)

	setActive(arg_4_0.healTF, false)

	arg_4_0.qCharaContain = arg_4_0:findTF("top/panel_bg/q_chara", arg_4_0.rightPanel)
	arg_4_0.seaLoading = arg_4_0:findTF("bg/loading", arg_4_0.leftPanel)

	arg_4_0:playLoadingAni()

	arg_4_0.destroyConfirmWindow = ShipDestoryConfirmWindow.New(arg_4_0._tf, arg_4_0.event)
end

function var_0_0.loadChar(arg_5_0)
	if not arg_5_0.shipPrefab then
		local var_5_0 = arg_5_0.shipVO:getPrefab()

		pg.UIMgr.GetInstance():LoadingOn()
		PoolMgr.GetInstance():GetSpineChar(var_5_0, true, function(arg_6_0)
			pg.UIMgr.GetInstance():LoadingOff()

			arg_5_0.shipPrefab = var_5_0
			arg_5_0.shipModel = arg_6_0
			tf(arg_6_0).localScale = Vector3(0.8, 0.8, 1)

			arg_6_0:GetComponent("SpineAnimUI"):SetAction("stand", 0)
			setParent(arg_6_0, arg_5_0.qCharaContain)
		end)
	end
end

function var_0_0.recycleSpineChar(arg_7_0)
	if arg_7_0.shipPrefab and arg_7_0.shipModel then
		PoolMgr.GetInstance():ReturnSpineChar(arg_7_0.shipPrefab, arg_7_0.shipModel)

		arg_7_0.shipPrefab = nil
		arg_7_0.shipModel = nil
	end
end

function var_0_0.enabledToggles(arg_8_0, arg_8_1)
	eachChild(arg_8_0.toggles, function(arg_9_0)
		arg_9_0:GetComponent("Toggle").enabled = arg_8_1
	end)
end

function var_0_0.addDragListenter(arg_10_0)
	local var_10_0 = GetOrAddComponent(arg_10_0._tf, "EventTriggerListener")

	arg_10_0.dragTrigger = var_10_0

	local var_10_1
	local var_10_2 = 0

	var_10_0:AddBeginDragFunc(function()
		var_10_1 = nil
		var_10_2 = 0
	end)
	var_10_0:AddDragFunc(function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.position

		if not var_10_1 then
			var_10_1 = var_12_0
		end

		var_10_2 = var_12_0.x - var_10_1.x
	end)
	var_10_0:AddDragEndFunc(function(arg_13_0, arg_13_1)
		if var_10_2 < -50 then
			arg_10_0:emit(ShipUpgradeMediator2.NEXTSHIP, -1)
		elseif var_10_2 > 50 then
			arg_10_0:emit(ShipUpgradeMediator2.NEXTSHIP)
		end
	end)
end

function var_0_0.didEnter(arg_14_0)
	arg_14_0.UIMgr = pg.UIMgr.GetInstance()

	arg_14_0.UIMgr:BlurPanel(arg_14_0._tf, false, {
		groupName = arg_14_0:getGroupNameFromData(),
		weight = LayerWeightConst.LOWER_LAYER
	})
	arg_14_0:addDragListenter()
	checkFirstHelpShow("help_shipinfo_upgrate")
	onButton(arg_14_0, arg_14_0.seaLoading, function()
		if not arg_14_0.previewer then
			arg_14_0:showBarrage()
		end
	end)
	onButton(arg_14_0, arg_14_0.breakOutBtn, function()
		local var_16_0 = {}

		if arg_14_0.shipVO:isActivityNpc() then
			table.insert(var_16_0, function(arg_17_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("npc_breakout_tip"),
					onYes = arg_17_0
				})
			end)
		end

		seriesAsync(var_16_0, function()
			local var_18_0, var_18_1 = ShipStatus.ShipStatusCheck("onModify", arg_14_0.shipVO)

			if not var_18_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_18_1)

				return
			end

			if arg_14_0.breakCfg.breakout_id == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_maxLevel"))

				return
			end

			if arg_14_0.shipVO.level < arg_14_0.breakCfg.level then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_error_lvLimit"))

				return
			end

			if not arg_14_0.isEnoughItems then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_error_noEnoughMatrail"))

				return
			end

			if arg_14_0.player.gold < arg_14_0.breakCfg.use_gold then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
					{
						59001,
						arg_14_0.breakCfg.use_gold - arg_14_0.player.gold,
						arg_14_0.breakCfg.use_gold
					}
				})

				return
			end

			if not arg_14_0.contextData.materialShipIds or #arg_14_0.contextData.materialShipIds < arg_14_0.breakCfg.use_char_num then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_select_material_tip"))

				return
			end

			arg_14_0:emit(ShipUpgradeMediator2.UPGRADE_SHIP, arg_14_0.contextData.materialShipIds)
		end)
	end, SFX_CONFIRM)
	onButton(arg_14_0, arg_14_0.recommandBtn, function()
		local var_19_0 = getProxy(BayProxy)

		if arg_14_0.contextData.materialShipIds and #arg_14_0.contextData.materialShipIds == arg_14_0.breakCfg.use_char_num then
			return
		end

		local var_19_1 = var_19_0:getUpgradeRecommendShip(arg_14_0.shipVO, arg_14_0.contextData.materialShipIds or {}, arg_14_0.breakCfg.use_char_num)

		if #var_19_1 > 0 then
			local var_19_2 = {}

			table.insert(var_19_2, function(arg_20_0)
				local var_20_0, var_20_1 = ShipCalcHelper.GetEliteAndHightLevelShips(underscore.map(var_19_1, function(arg_21_0)
					return var_19_0:getShipById(arg_21_0)
				end))

				if #var_20_0 > 0 or #var_20_1 > 0 then
					arg_14_0.destroyConfirmWindow:ExecuteAction("Show", var_20_0, var_20_1, false, arg_20_0)
				else
					arg_20_0()
				end
			end)
			seriesAsync(var_19_2, function()
				arg_14_0.contextData.materialShipIds = var_19_1

				arg_14_0:updateBreakOutView(arg_14_0.shipVO)
			end)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("without_selected_ship"))
		end
	end, SFX_CONFIRM)
	arg_14_0:initMaterialShips()
end

function var_0_0.getMaterialShip(arg_23_0, arg_23_1)
	local var_23_0

	for iter_23_0 = #arg_23_1, 1, -1 do
		if not arg_23_1[iter_23_0]:isTestShip() then
			var_23_0 = iter_23_0

			break
		end
	end

	var_23_0 = var_23_0 or #arg_23_1

	return var_23_0
end

function var_0_0.setShip(arg_24_0, arg_24_1)
	arg_24_0.shipVO = arg_24_1
	arg_24_0.shipTempCfg = pg.ship_data_template
	arg_24_0.shipBreakOutCfg = pg.ship_data_breakout
	arg_24_0.breakIds = arg_24_0:getStages()
	arg_24_0.itemTFs = {}

	for iter_24_0 = 1, 3 do
		arg_24_0.itemTFs[iter_24_0] = arg_24_0:findTF("item_" .. iter_24_0, arg_24_0.materials)
	end

	arg_24_0:updateBattleView()
	arg_24_0:updateBreakOutView(arg_24_0.shipVO)

	local var_24_0 = arg_24_0.shipVO.level < arg_24_0.breakCfg.level or arg_24_0.breakCfg.breakout_id == 0

	setActive(arg_24_0.tipActive, not var_24_0)
	setActive(arg_24_0.tipDeactive, var_24_0)
	setButtonEnabled(arg_24_0.breakOutBtn, not var_24_0)
	setActive(arg_24_0.recommandBtn, arg_24_0.breakCfg.breakout_id ~= 0)
	arg_24_0:loadChar()
end

function var_0_0.getStages(arg_25_0)
	local var_25_0 = {}
	local var_25_1 = math.floor(arg_25_0.shipVO.configId / 10)

	for iter_25_0 = 1, 4 do
		local var_25_2 = tonumber(var_25_1 .. iter_25_0)

		assert(arg_25_0.shipBreakOutCfg[var_25_2], "必须存在配置" .. var_25_2)
		table.insert(var_25_0, var_25_2)
	end

	return var_25_0
end

function var_0_0.updateStagesScrollView(arg_26_0)
	local var_26_0 = table.indexof(arg_26_0.breakIds, arg_26_0.shipVO.configId)

	if var_26_0 and var_26_0 >= 1 and var_26_0 <= var_0_1 then
		arg_26_0:findTF("stage" .. var_26_0, arg_26_0.stages):GetComponent(typeof(Toggle)).isOn = true
	end
end

function var_0_0.updateBattleView(arg_27_0)
	if #arg_27_0.breakIds < var_0_1 then
		return
	end

	for iter_27_0 = 1, var_0_1 do
		local var_27_0 = arg_27_0.breakIds[iter_27_0]
		local var_27_1 = arg_27_0.shipBreakOutCfg[var_27_0]

		assert(var_27_1, "不存在配置" .. var_27_0)

		local var_27_2 = arg_27_0:findTF("stage" .. iter_27_0, arg_27_0.stages)

		onToggle(arg_27_0, var_27_2, function(arg_28_0)
			if arg_28_0 then
				local var_28_0 = var_27_1.breakout_view
				local var_28_1 = checkExist(pg.ship_data_template[var_27_1.breakout_id], {
					"specific_type"
				}) or {}

				for iter_28_0, iter_28_1 in ipairs(var_28_1) do
					var_28_0 = var_28_0 .. "/" .. i18n(ShipType.SpecificTableTips[iter_28_1])
				end

				changeToScrollText(arg_27_0.breakView, var_28_0)
				arg_27_0:switchStage(var_27_0)
			end
		end, SFX_PANEL)
	end

	arg_27_0:findTF("stage1", arg_27_0.stages):GetComponent(typeof(Toggle)).group:SetAllTogglesOff()

	local var_27_3 = table.indexof(arg_27_0.breakIds, arg_27_0.shipVO.configId)
	local var_27_4 = math.clamp(var_27_3, 1, var_0_1)

	if var_27_4 and var_27_4 >= 1 and var_27_4 <= var_0_1 then
		local var_27_5 = arg_27_0:findTF("stage" .. var_27_4, arg_27_0.stages)

		triggerToggle(var_27_5, true)
	end
end

local var_0_2 = {
	"level",
	"durability",
	"cannon",
	"torpedo",
	"antiaircraft",
	"air",
	"antisub"
}

function var_0_0.showBarrage(arg_29_0)
	arg_29_0.previewer = WeaponPreviewer.New(arg_29_0.rawImage)

	arg_29_0.previewer:configUI(arg_29_0.healTF)
	arg_29_0.previewer:setDisplayWeapon(arg_29_0:getWaponIdsById(arg_29_0.breakOutId))
	arg_29_0.previewer:load(40000, arg_29_0.shipVO, arg_29_0:getAllWeaponIds(), function()
		arg_29_0:stopLoadingAni()
	end)
end

function var_0_0.getWaponIdsById(arg_31_0, arg_31_1)
	return arg_31_0.shipBreakOutCfg[arg_31_1].weapon_ids
end

function var_0_0.switchStage(arg_32_0, arg_32_1)
	if arg_32_0.breakOutId == arg_32_1 then
		return
	end

	arg_32_0.breakOutId = arg_32_1

	if arg_32_0.previewer then
		arg_32_0.previewer:setDisplayWeapon(arg_32_0:getWaponIdsById(arg_32_0.breakOutId))
	end
end

function var_0_0.getAllWeaponIds(arg_33_0)
	local var_33_0 = {}

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.breakIds) do
		local var_33_1 = Clone(arg_33_0.shipBreakOutCfg[iter_33_1].weapon_ids)
		local var_33_2 = {
			__add = function(arg_34_0, arg_34_1)
				for iter_34_0, iter_34_1 in ipairs(arg_34_0) do
					if not table.contains(arg_34_1, iter_34_1) then
						table.insert(arg_34_1, iter_34_1)
					end
				end

				return arg_34_1
			end
		}

		setmetatable(var_33_0, var_33_2)

		var_33_0 = var_33_0 + var_33_1
	end

	return var_33_0
end

function var_0_0.updateBreakOutView(arg_35_0, arg_35_1)
	arg_35_0.breakCfg = arg_35_0.shipBreakOutCfg[arg_35_1.configId]

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.itemTFs) do
		setActive(iter_35_1, false)
	end

	local var_35_0 = arg_35_1:getShipProperties()

	var_35_0.level = arg_35_1:getMaxLevel()

	local var_35_1 = Clone(arg_35_1)

	var_35_1.configId = arg_35_0.breakCfg.breakout_id

	local var_35_2 = {}
	local var_35_3 = arg_35_0.breakCfg.breakout_id == 0
	local var_35_4 = arg_35_1:getBattleTotalExpend()
	local var_35_5
	local var_35_6
	local var_35_7 = arg_35_0.tipDeactive:Find("values/label")
	local var_35_8 = arg_35_0.tipDeactive:Find("values/value")

	setText(var_35_7, "")
	setText(var_35_8, "")

	if var_35_3 then
		var_35_2 = var_35_0
		var_35_5 = var_35_4

		setText(var_35_7, i18n("word_level_upperLimit"))
	else
		local var_35_9 = arg_35_0.shipTempCfg[arg_35_0.breakCfg.breakout_id].max_level

		var_35_2 = var_35_1:getShipProperties()
		var_35_2.level = var_35_9 >= arg_35_1:getMaxLevel() and var_35_9 or arg_35_1:getMaxLevel()
		var_35_5 = var_35_1:getBattleTotalExpend()

		setColorCount(var_35_8, arg_35_0.shipVO.level, arg_35_0.breakCfg.level)
		setText(var_35_7, i18n("word_level_require"))
	end

	local function var_35_10(arg_36_0, arg_36_1)
		setText(arg_36_0:Find("name"), arg_36_1.name)
		setText(arg_36_0:Find("value"), arg_36_1.preAttr)

		local var_36_0 = arg_36_0:Find("value1")
		local var_36_1 = arg_36_0:Find("addition")
		local var_36_2

		if arg_36_1.afterAttr == 0 then
			var_36_2 = setColorStr(arg_36_1.afterAttr, "#FFFFFFFF")
		else
			var_36_2 = setColorStr(arg_36_1.afterAttr, COLOR_GREEN)
		end

		setText(var_36_0, var_36_2)
		setActive(var_36_1, arg_36_1.afterAttr - arg_36_1.preAttr ~= 0)
		setText(var_36_1, "(+" .. arg_36_1.afterAttr - arg_36_1.preAttr .. ")")
	end

	local var_35_11 = 0

	for iter_35_2 = 1, #var_0_2 do
		local var_35_12 = arg_35_0:findTF("attr_" .. var_35_11 + iter_35_2, arg_35_0.attrs)

		setActive(var_35_12, true)

		local var_35_13 = math.floor(var_35_0[var_0_2[iter_35_2]])
		local var_35_14 = math.floor(var_35_2[var_0_2[iter_35_2]])

		var_35_10(var_35_12, {
			preAttr = var_35_13,
			afterAttr = var_35_14,
			name = i18n("word_attr_" .. var_0_2[iter_35_2])
		})
	end

	local var_35_15 = var_35_11 + #var_0_2 + 1
	local var_35_16 = arg_35_0:findTF("attr_" .. var_35_15, arg_35_0.attrs)

	setActive(var_35_16, true)
	var_35_10(var_35_16, {
		preAttr = var_35_4,
		afterAttr = var_35_5,
		name = i18n("word_attr_luck")
	})

	for iter_35_3 = var_35_15 + 1, 8 do
		local var_35_17 = arg_35_0:findTF("attr_" .. iter_35_3, arg_35_0.attrs)

		setActive(var_35_17, false)
	end

	removeAllChildren(arg_35_0.starsFrom)

	for iter_35_4 = 1, arg_35_1:getStar() do
		cloneTplTo(arg_35_0.starTpl, arg_35_0.starsFrom)
	end

	if var_35_3 then
		return
	end

	removeAllChildren(arg_35_0.starsTo)

	if var_35_1:getStar() > arg_35_1:getStar() and not var_35_3 then
		for iter_35_5 = 1, var_35_1:getStar() do
			cloneTplTo(arg_35_0.starTpl, arg_35_0.starsTo)
		end
	end

	setActive(arg_35_0.appendStarTips, var_35_1:getStar() ~= arg_35_1:getStar())
	setActive(arg_35_0.starOpera, var_35_1:getStar() ~= arg_35_1:getStar())

	local var_35_18 = arg_35_0.breakCfg.use_gold

	if var_35_18 > arg_35_0.player.gold then
		var_35_18 = "<color=#FB4A2C>" .. var_35_18 .. "</color>"
	end

	setText(arg_35_0.tipActive:Find("text"), var_35_18)
	arg_35_0:initMaterialShips()
end

function var_0_0.initMaterialShips(arg_37_0)
	local var_37_0 = arg_37_0.breakCfg.use_char_num
	local var_37_1 = getProxy(BayProxy)

	for iter_37_0 = 1, 3 do
		SetActive(arg_37_0.itemTFs[iter_37_0], iter_37_0 <= var_37_0)

		local var_37_2 = arg_37_0.itemTFs[iter_37_0]:Find("IconTpl")
		local var_37_3 = arg_37_0.contextData.materialShipIds

		if iter_37_0 <= var_37_0 and var_37_3 and var_37_3[iter_37_0] then
			local var_37_4 = var_37_1:getShipById(var_37_3[iter_37_0])

			updateShip(var_37_2, var_37_4, {
				initStar = true
			})
			SetActive(var_37_2, true)
		else
			SetActive(var_37_2, false)
		end

		onButton(arg_37_0, arg_37_0.itemTFs[iter_37_0], function()
			arg_37_0:emit(ShipUpgradeMediator2.ON_SELECT_SHIP, arg_37_0.shipVO, var_37_0)
		end)
	end
end

function var_0_0.willExit(arg_39_0)
	arg_39_0.UIMgr:UnblurPanel(arg_39_0._tf, arg_39_0.UIMain)
	arg_39_0:recycleSpineChar()

	if arg_39_0.previewer then
		arg_39_0.previewer:clear()

		arg_39_0.previewer = nil
	end

	if arg_39_0.dragTrigger then
		ClearEventTrigger(arg_39_0.dragTrigger)

		arg_39_0.dragTrigger = nil
	end

	arg_39_0.destroyConfirmWindow:Destroy()
end

function var_0_0.playLoadingAni(arg_40_0)
	setActive(arg_40_0.seaLoading, true)
end

function var_0_0.stopLoadingAni(arg_41_0)
	setActive(arg_41_0.seaLoading, false)
end

function var_0_0.onBackPressed(arg_42_0)
	if arg_42_0.destroyConfirmWindow:isShowing() then
		arg_42_0.destroyConfirmWindow:ActionInvoke("Hide")

		return
	end

	arg_42_0:emit(BaseUI.ON_BACK_PRESSED, true)
end

return var_0_0
