local var_0_0 = class("ShipUpgradeLayer2", import("..base.BaseUI"))
local var_0_1 = 3

function var_0_0.getUIName(arg_1_0)
	return "ShipBreakOutUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "ShipMainScene"
end

function var_0_0.getResource(arg_3_0)
	local var_3_0 = getProxy(BayProxy):getShipById(arg_3_0.contextData.shipId)
	local var_3_1 = ys.Battle.BattleResourceManager.GetInstance()
	local var_3_2 = var_3_1.GetMapResource(40000)

	table.insertto(var_3_2, var_3_1.GetDisplayCommonResource())
	table.insertto(var_3_2, var_3_1.GetShipResource(var_3_0.configId, var_3_0.skinId))

	local var_3_3 = {}
	local var_3_4 = math.floor(var_3_0.configId / 10)

	for iter_3_0 = 1, 4 do
		table.insert(var_3_3, tonumber(var_3_4 .. iter_3_0))
	end

	for iter_3_1, iter_3_2 in ipairs(var_3_3) do
		for iter_3_3, iter_3_4 in ipairs(pg.ship_data_breakout[iter_3_2].weapon_ids) do
			if iter_3_4 ~= 0 then
				local var_3_5 = ys.Battle.BattleDataFunction.GetWeaponDataFromID(iter_3_4)

				for iter_3_5, iter_3_6 in ipairs(var_3_5.weapon_id) do
					table.insertto(var_3_2, var_3_1.GetWeaponResource(iter_3_6))
				end
			end
		end
	end

	return table.insertto(var_3_2, var_0_0.super.getResource(arg_3_0))
end

function var_0_0.setItems(arg_4_0, arg_4_1)
	arg_4_0.items = arg_4_1
end

function var_0_0.setPlayer(arg_5_0, arg_5_1)
	arg_5_0.player = arg_5_1
end

function var_0_0.init(arg_6_0)
	arg_6_0.leftPanel = arg_6_0._tf:Find("blur_panel/left_panel")
	arg_6_0.stages = arg_6_0.leftPanel:Find("stageScrollRect/stages")

	setText(arg_6_0.leftPanel:Find("bg/title/Image"), i18n("word_preview"))

	arg_6_0.stagesSnap = arg_6_0.leftPanel:Find("stageScrollRect"):GetComponent("HorizontalScrollSnap")
	arg_6_0.breakView = arg_6_0.leftPanel:Find("content/Text")
	arg_6_0.rightPanel = arg_6_0._tf:Find("blur_panel/right_panel")
	arg_6_0.attrs = arg_6_0.rightPanel:Find("top/attrs")
	arg_6_0.starTpl = arg_6_0.rightPanel:Find("top/rare/startpl")

	setActive(arg_6_0.starTpl, false)

	arg_6_0.starsFrom = arg_6_0.rightPanel:Find("top/rare/stars_from")
	arg_6_0.starsTo = arg_6_0.rightPanel:Find("top/rare/stars_to")
	arg_6_0.starOpera = arg_6_0.rightPanel:Find("top/rare/opera")
	arg_6_0.materials = arg_6_0.rightPanel:Find("bottom/materials")
	arg_6_0.breakOutBtn = arg_6_0.rightPanel:Find("bottom/break_btn/tip_active/image")
	arg_6_0.appendStarTips = arg_6_0.rightPanel:Find("bottom/panel_title/tip")
	arg_6_0.tipActive = arg_6_0.rightPanel:Find("bottom/break_btn/tip_active")
	arg_6_0.tipDeactive = arg_6_0.rightPanel:Find("bottom/break_btn/tip_deactive")

	setText(arg_6_0.rightPanel:Find("bottom/panel_title/tip"), i18n("breakout_tip"))
	setText(arg_6_0.rightPanel:Find("bottom/break_btn/tip_deactive/values/ok"), i18n("text_confirm"))
	setText(arg_6_0.rightPanel:Find("bottom/break_btn/tip_active/image/ok"), i18n("text_confirm"))

	arg_6_0.recommandBtn = arg_6_0.rightPanel:Find("bottom/auto_btn")
	arg_6_0.isEnoughItems = true
	arg_6_0.sea = arg_6_0.leftPanel:Find("sea")
	arg_6_0.rawImage = arg_6_0.sea:GetComponent("RawImage")

	setActive(arg_6_0.rawImage, false)

	arg_6_0.healTF = arg_6_0._tf:Find("resources/heal")
	arg_6_0.healTF.transform.localPosition = Vector3(-360, 50, 40)

	setActive(arg_6_0.healTF, false)

	arg_6_0.qCharaContain = arg_6_0.rightPanel:Find("top/panel_bg/q_chara")
	arg_6_0.seaLoading = arg_6_0.leftPanel:Find("bg/loading")

	arg_6_0:playLoadingAni()

	arg_6_0.destroyConfirmWindow = ShipDestoryConfirmWindow.New(arg_6_0._tf, arg_6_0.event)
end

function var_0_0.loadChar(arg_7_0)
	if not arg_7_0.shipPrefab then
		local var_7_0 = arg_7_0.shipVO:getPrefab()

		pg.UIMgr.GetInstance():LoadingOn()

		local var_7_1 = SpineAnimChar.New()

		var_7_1:SetPaint(var_7_0)
		var_7_1:Load(true, function(arg_8_0)
			pg.UIMgr.GetInstance():LoadingOff()

			arg_7_0.shipPrefab = var_7_0
			arg_7_0.shipModel = arg_8_0

			arg_8_0:SetLocalScale(Vector3(0.8, 0.8, 1))
			arg_8_0:SetParent(arg_7_0.qCharaContain)
			arg_8_0:SetAction("stand", 0)
		end)
	end
end

function var_0_0.recycleSpineChar(arg_9_0)
	if arg_9_0.shipPrefab and arg_9_0.shipModel then
		arg_9_0.shipModel:Dispose()

		arg_9_0.shipPrefab = nil
		arg_9_0.shipModel = nil
	end
end

function var_0_0.enabledToggles(arg_10_0, arg_10_1)
	eachChild(arg_10_0.toggles, function(arg_11_0)
		arg_11_0:GetComponent("Toggle").enabled = arg_10_1
	end)
end

function var_0_0.addDragListenter(arg_12_0)
	local var_12_0 = GetOrAddComponent(arg_12_0._tf, "EventTriggerListener")

	arg_12_0.dragTrigger = var_12_0

	local var_12_1
	local var_12_2 = 0

	var_12_0:AddBeginDragFunc(function()
		var_12_1 = nil
		var_12_2 = 0
	end)
	var_12_0:AddDragFunc(function(arg_14_0, arg_14_1)
		local var_14_0 = arg_14_1.position

		if not var_12_1 then
			var_12_1 = var_14_0
		end

		var_12_2 = var_14_0.x - var_12_1.x
	end)
	var_12_0:AddDragEndFunc(function(arg_15_0, arg_15_1)
		if var_12_2 < -50 then
			arg_12_0:emit(ShipUpgradeMediator2.NEXTSHIP, -1)
		elseif var_12_2 > 50 then
			arg_12_0:emit(ShipUpgradeMediator2.NEXTSHIP)
		end
	end)
end

function var_0_0.didEnter(arg_16_0)
	arg_16_0:BlurPanel(arg_16_0._tf, {
		groupDelta = -1
	})
	arg_16_0:addDragListenter()
	onButton(arg_16_0, arg_16_0.seaLoading, function()
		if not arg_16_0.previewer then
			arg_16_0:showBarrage()
		end
	end)
	onButton(arg_16_0, arg_16_0.breakOutBtn, function()
		local var_18_0 = {}

		if arg_16_0.shipVO:isActivityNpc() then
			table.insert(var_18_0, function(arg_19_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("npc_breakout_tip"),
					onYes = arg_19_0
				})
			end)
		end

		seriesAsync(var_18_0, function()
			local var_20_0, var_20_1 = ShipStatus.ShipStatusCheck("onModify", arg_16_0.shipVO)

			if not var_20_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_20_1)

				return
			end

			if arg_16_0.breakCfg.breakout_id == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_maxLevel"))

				return
			end

			if arg_16_0.shipVO.level < arg_16_0.breakCfg.level then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_error_lvLimit"))

				return
			end

			if not arg_16_0.isEnoughItems then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_error_noEnoughMatrail"))

				return
			end

			if arg_16_0.player.gold < arg_16_0.breakCfg.use_gold then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
					{
						59001,
						arg_16_0.breakCfg.use_gold - arg_16_0.player.gold,
						arg_16_0.breakCfg.use_gold
					}
				})

				return
			end

			if not arg_16_0.contextData.materialShipIds or #arg_16_0.contextData.materialShipIds < arg_16_0.breakCfg.use_char_num then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_select_material_tip"))

				return
			end

			arg_16_0:emit(ShipUpgradeMediator2.UPGRADE_SHIP, arg_16_0.contextData.materialShipIds)
		end)
	end, SFX_CONFIRM)
	onButton(arg_16_0, arg_16_0.recommandBtn, function()
		local var_21_0 = getProxy(BayProxy)

		if arg_16_0.contextData.materialShipIds and #arg_16_0.contextData.materialShipIds == arg_16_0.breakCfg.use_char_num then
			return
		end

		local var_21_1 = var_21_0:getUpgradeRecommendShip(arg_16_0.shipVO, arg_16_0.contextData.materialShipIds or {}, arg_16_0.breakCfg.use_char_num)

		if #var_21_1 > 0 then
			local var_21_2 = {}

			table.insert(var_21_2, function(arg_22_0)
				local var_22_0, var_22_1 = ShipCalcHelper.GetEliteAndHightLevelShips(underscore.map(var_21_1, function(arg_23_0)
					return var_21_0:getShipById(arg_23_0)
				end))

				if #var_22_0 > 0 or #var_22_1 > 0 then
					arg_16_0.destroyConfirmWindow:ExecuteAction("Show", var_22_0, var_22_1, false, arg_22_0)
				else
					arg_22_0()
				end
			end)
			seriesAsync(var_21_2, function()
				arg_16_0.contextData.materialShipIds = var_21_1

				arg_16_0:updateBreakOutView(arg_16_0.shipVO)
			end)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("without_selected_ship"))
		end
	end, SFX_CONFIRM)
	arg_16_0:initMaterialShips()
end

function var_0_0.getMaterialShip(arg_25_0, arg_25_1)
	local var_25_0

	for iter_25_0 = #arg_25_1, 1, -1 do
		if not arg_25_1[iter_25_0]:isTestShip() then
			var_25_0 = iter_25_0

			break
		end
	end

	var_25_0 = var_25_0 or #arg_25_1

	return var_25_0
end

function var_0_0.setShip(arg_26_0, arg_26_1)
	arg_26_0.shipVO = arg_26_1
	arg_26_0.shipTempCfg = pg.ship_data_template
	arg_26_0.shipBreakOutCfg = pg.ship_data_breakout
	arg_26_0.breakIds = arg_26_0:getStages()
	arg_26_0.itemTFs = {}

	for iter_26_0 = 1, 3 do
		arg_26_0.itemTFs[iter_26_0] = arg_26_0.materials:Find("item_" .. iter_26_0)
	end

	arg_26_0:updateBattleView()
	arg_26_0:updateBreakOutView(arg_26_0.shipVO)

	local var_26_0 = arg_26_0.shipVO.level < arg_26_0.breakCfg.level or arg_26_0.breakCfg.breakout_id == 0

	setActive(arg_26_0.tipActive, not var_26_0)
	setActive(arg_26_0.tipDeactive, var_26_0)
	setButtonEnabled(arg_26_0.breakOutBtn, not var_26_0)
	setActive(arg_26_0.recommandBtn, arg_26_0.breakCfg.breakout_id ~= 0)
	arg_26_0:loadChar()
end

function var_0_0.getStages(arg_27_0)
	local var_27_0 = {}
	local var_27_1 = math.floor(arg_27_0.shipVO.configId / 10)

	for iter_27_0 = 1, 4 do
		local var_27_2 = tonumber(var_27_1 .. iter_27_0)

		assert(arg_27_0.shipBreakOutCfg[var_27_2], "必须存在配置" .. var_27_2)
		table.insert(var_27_0, var_27_2)
	end

	return var_27_0
end

function var_0_0.updateStagesScrollView(arg_28_0)
	local var_28_0 = table.indexof(arg_28_0.breakIds, arg_28_0.shipVO.configId)

	if var_28_0 and var_28_0 >= 1 and var_28_0 <= var_0_1 then
		arg_28_0.stages:Find("stage" .. var_28_0):GetComponent(typeof(Toggle)).isOn = true
	end
end

function var_0_0.updateBattleView(arg_29_0)
	if #arg_29_0.breakIds < var_0_1 then
		return
	end

	for iter_29_0 = 1, var_0_1 do
		local var_29_0 = arg_29_0.breakIds[iter_29_0]
		local var_29_1 = arg_29_0.shipBreakOutCfg[var_29_0]

		assert(var_29_1, "不存在配置" .. var_29_0)

		local var_29_2 = arg_29_0.stages:Find("stage" .. iter_29_0)

		onToggle(arg_29_0, var_29_2, function(arg_30_0)
			if arg_30_0 then
				local var_30_0 = var_29_1.breakout_view
				local var_30_1 = checkExist(pg.ship_data_template[var_29_1.breakout_id], {
					"specific_type"
				}) or {}

				for iter_30_0, iter_30_1 in ipairs(var_30_1) do
					var_30_0 = var_30_0 .. "/" .. i18n(ShipType.SpecificTableTips[iter_30_1])
				end

				changeToScrollText(arg_29_0.breakView, var_30_0)
				arg_29_0:switchStage(var_29_0)
			end
		end, SFX_PANEL)
	end

	arg_29_0.stages:Find("stage1"):GetComponent(typeof(Toggle)).group:SetAllTogglesOff()

	local var_29_3 = table.indexof(arg_29_0.breakIds, arg_29_0.shipVO.configId)
	local var_29_4 = math.clamp(var_29_3, 1, var_0_1)

	if var_29_4 and var_29_4 >= 1 and var_29_4 <= var_0_1 then
		local var_29_5 = arg_29_0.stages:Find("stage" .. var_29_4)

		triggerToggle(var_29_5, true)
	end
end

local var_0_2 = {
	"durability",
	"cannon",
	"torpedo",
	"antiaircraft",
	"air",
	"antisub"
}

function var_0_0.showBarrage(arg_31_0)
	arg_31_0.previewer = WeaponPreviewer.New(arg_31_0.rawImage)

	arg_31_0.previewer:configUI(arg_31_0.healTF)
	arg_31_0.previewer:setDisplayWeapon(arg_31_0:getWaponIdsById(arg_31_0.breakOutId))
	arg_31_0.previewer:load(40000, arg_31_0.shipVO, arg_31_0:getAllWeaponIds(), function()
		arg_31_0:stopLoadingAni()
	end)
end

function var_0_0.getWaponIdsById(arg_33_0, arg_33_1)
	return arg_33_0.shipBreakOutCfg[arg_33_1].weapon_ids
end

function var_0_0.switchStage(arg_34_0, arg_34_1)
	if arg_34_0.breakOutId == arg_34_1 then
		return
	end

	arg_34_0.breakOutId = arg_34_1

	if arg_34_0.previewer then
		arg_34_0.previewer:setDisplayWeapon(arg_34_0:getWaponIdsById(arg_34_0.breakOutId))
	end
end

function var_0_0.getAllWeaponIds(arg_35_0)
	local var_35_0 = {}

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.breakIds) do
		local var_35_1 = Clone(arg_35_0.shipBreakOutCfg[iter_35_1].weapon_ids)
		local var_35_2 = {
			__add = function(arg_36_0, arg_36_1)
				for iter_36_0, iter_36_1 in ipairs(arg_36_0) do
					if not table.contains(arg_36_1, iter_36_1) then
						table.insert(arg_36_1, iter_36_1)
					end
				end

				return arg_36_1
			end
		}

		setmetatable(var_35_0, var_35_2)

		var_35_0 = var_35_0 + var_35_1
	end

	return var_35_0
end

function var_0_0.updateBreakOutView(arg_37_0, arg_37_1)
	arg_37_0.breakCfg = arg_37_0.shipBreakOutCfg[arg_37_1.configId]

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.itemTFs) do
		setActive(iter_37_1, false)
	end

	local var_37_0 = arg_37_1:getShipProperties()
	local var_37_1 = Clone(arg_37_1)

	var_37_1.configId = arg_37_0.breakCfg.breakout_id

	local var_37_2 = {}
	local var_37_3 = arg_37_0.breakCfg.breakout_id == 0
	local var_37_4 = arg_37_1:getBattleTotalExpend()
	local var_37_5
	local var_37_6
	local var_37_7 = arg_37_0.tipDeactive:Find("values/label")
	local var_37_8 = arg_37_0.tipDeactive:Find("values/value")

	setText(var_37_7, "")
	setText(var_37_8, "")

	if var_37_3 then
		var_37_2 = var_37_0
		var_37_5 = var_37_4

		setText(var_37_7, i18n("word_level_upperLimit"))
	else
		var_37_6 = arg_37_0.shipTempCfg[arg_37_0.breakCfg.breakout_id].max_level
		var_37_2 = var_37_1:getShipProperties()
		var_37_2.level = var_37_6 >= arg_37_1:getMaxLevel() and var_37_6 or arg_37_1:getMaxLevel()
		var_37_5 = var_37_1:getBattleTotalExpend()

		setColorCount(var_37_8, arg_37_0.shipVO.level, arg_37_0.breakCfg.level)
		setText(var_37_7, i18n("word_level_require"))
	end

	local function var_37_9(arg_38_0, arg_38_1)
		setText(arg_38_0:Find("name"), arg_38_1.name)
		setText(arg_38_0:Find("value"), arg_38_1.preAttr)

		local var_38_0 = arg_38_0:Find("value1")
		local var_38_1 = arg_38_0:Find("addition")
		local var_38_2

		if arg_38_1.afterAttr == 0 then
			var_38_2 = setColorStr(arg_38_1.afterAttr, "#FFFFFFFF")
		else
			var_38_2 = setColorStr(arg_38_1.afterAttr, COLOR_GREEN)
		end

		setText(var_38_0, var_38_2)
		setActive(var_38_1, arg_38_1.afterAttr - arg_38_1.preAttr ~= 0)
		setText(var_38_1, "(+" .. arg_38_1.afterAttr - arg_38_1.preAttr .. ")")
	end

	local var_37_10 = 0

	if var_37_6 and var_37_6 ~= arg_37_0.shipTempCfg[arg_37_1.configId].max_level then
		local var_37_11 = arg_37_0.attrs:Find("attr_1")

		var_37_9(var_37_11, {
			preAttr = arg_37_0.shipTempCfg[arg_37_1.configId].max_level,
			afterAttr = var_37_6,
			name = i18n("word_level_upperLimit")
		})

		var_37_10 = 1
	end

	for iter_37_2 = 1, #var_0_2 do
		local var_37_12 = arg_37_0.attrs:Find("attr_" .. var_37_10 + iter_37_2)

		setActive(var_37_12, true)

		local var_37_13 = math.floor(var_37_0[var_0_2[iter_37_2]])
		local var_37_14 = math.floor(var_37_2[var_0_2[iter_37_2]])

		var_37_9(var_37_12, {
			preAttr = var_37_13,
			afterAttr = var_37_14,
			name = i18n("word_attr_" .. var_0_2[iter_37_2])
		})
	end

	local var_37_15 = var_37_10 + #var_0_2 + 1
	local var_37_16 = arg_37_0.attrs:Find("attr_" .. var_37_15)

	setActive(var_37_16, true)
	var_37_9(var_37_16, {
		preAttr = var_37_4,
		afterAttr = var_37_5,
		name = i18n("word_attr_luck")
	})

	for iter_37_3 = var_37_15 + 1, 8 do
		local var_37_17 = arg_37_0.attrs:Find("attr_" .. iter_37_3)

		setActive(var_37_17, false)
	end

	removeAllChildren(arg_37_0.starsFrom)

	for iter_37_4 = 1, arg_37_1:getStar() do
		cloneTplTo(arg_37_0.starTpl, arg_37_0.starsFrom)
	end

	if var_37_3 then
		return
	end

	removeAllChildren(arg_37_0.starsTo)

	if var_37_1:getStar() > arg_37_1:getStar() and not var_37_3 then
		for iter_37_5 = 1, var_37_1:getStar() do
			cloneTplTo(arg_37_0.starTpl, arg_37_0.starsTo)
		end
	end

	setActive(arg_37_0.appendStarTips, var_37_1:getStar() ~= arg_37_1:getStar())
	setActive(arg_37_0.starOpera, var_37_1:getStar() ~= arg_37_1:getStar())

	local var_37_18 = arg_37_0.breakCfg.use_gold

	if var_37_18 > arg_37_0.player.gold then
		var_37_18 = "<color=#FB4A2C>" .. var_37_18 .. "</color>"
	end

	setText(arg_37_0.tipActive:Find("text"), var_37_18)
	arg_37_0:initMaterialShips()
end

function var_0_0.initMaterialShips(arg_39_0)
	local var_39_0 = arg_39_0.breakCfg.use_char_num
	local var_39_1 = getProxy(BayProxy)

	for iter_39_0 = 1, 3 do
		SetActive(arg_39_0.itemTFs[iter_39_0], iter_39_0 <= var_39_0)

		local var_39_2 = arg_39_0.itemTFs[iter_39_0]:Find("IconTpl")
		local var_39_3 = arg_39_0.contextData.materialShipIds

		if iter_39_0 <= var_39_0 and var_39_3 and var_39_3[iter_39_0] then
			local var_39_4 = var_39_1:getShipById(var_39_3[iter_39_0])

			updateShip(var_39_2, var_39_4, {
				initStar = true
			})
			SetActive(var_39_2, true)
		else
			SetActive(var_39_2, false)
		end

		onButton(arg_39_0, arg_39_0.itemTFs[iter_39_0], function()
			arg_39_0:emit(ShipUpgradeMediator2.ON_SELECT_SHIP, arg_39_0.shipVO, var_39_0)
		end)
	end
end

function var_0_0.willExit(arg_41_0)
	arg_41_0:UnOverlayPanel(arg_41_0._tf)
	arg_41_0:recycleSpineChar()

	if arg_41_0.previewer then
		arg_41_0.previewer:clear()

		arg_41_0.previewer = nil
	end

	if arg_41_0.dragTrigger then
		ClearEventTrigger(arg_41_0.dragTrigger)

		arg_41_0.dragTrigger = nil
	end

	arg_41_0.destroyConfirmWindow:Destroy()
end

function var_0_0.playLoadingAni(arg_42_0)
	setActive(arg_42_0.seaLoading, true)
end

function var_0_0.stopLoadingAni(arg_43_0)
	setActive(arg_43_0.seaLoading, false)
end

function var_0_0.onBackPressed(arg_44_0)
	if arg_44_0.destroyConfirmWindow:isShowing() then
		arg_44_0.destroyConfirmWindow:ActionInvoke("Hide")

		return
	end

	arg_44_0:emit(BaseUI.ON_BACK_PRESSED, true)
end

return var_0_0
