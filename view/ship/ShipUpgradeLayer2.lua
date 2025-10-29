local var_0_0 = class("ShipUpgradeLayer2", import("..base.BaseUI"))
local var_0_1 = 3

function var_0_0.getUIName(arg_1_0)
	return "ShipBreakOutUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "ShipMainScene"
end

function var_0_0.setItems(arg_3_0, arg_3_1)
	arg_3_0.items = arg_3_1
end

function var_0_0.setPlayer(arg_4_0, arg_4_1)
	arg_4_0.player = arg_4_1
end

function var_0_0.init(arg_5_0)
	arg_5_0.leftPanel = arg_5_0._tf:Find("blur_panel/left_panel")
	arg_5_0.stages = arg_5_0.leftPanel:Find("stageScrollRect/stages")

	setText(arg_5_0.leftPanel:Find("bg/title/Image"), i18n("word_preview"))

	arg_5_0.stagesSnap = arg_5_0.leftPanel:Find("stageScrollRect"):GetComponent("HorizontalScrollSnap")
	arg_5_0.breakView = arg_5_0.leftPanel:Find("content/Text")
	arg_5_0.rightPanel = arg_5_0._tf:Find("blur_panel/right_panel")
	arg_5_0.attrs = arg_5_0.rightPanel:Find("top/attrs")
	arg_5_0.starTpl = arg_5_0.rightPanel:Find("top/rare/startpl")

	setActive(arg_5_0.starTpl, false)

	arg_5_0.starsFrom = arg_5_0.rightPanel:Find("top/rare/stars_from")
	arg_5_0.starsTo = arg_5_0.rightPanel:Find("top/rare/stars_to")
	arg_5_0.starOpera = arg_5_0.rightPanel:Find("top/rare/opera")
	arg_5_0.materials = arg_5_0.rightPanel:Find("bottom/materials")
	arg_5_0.breakOutBtn = arg_5_0.rightPanel:Find("bottom/break_btn/tip_active/image")
	arg_5_0.appendStarTips = arg_5_0.rightPanel:Find("bottom/panel_title/tip")
	arg_5_0.tipActive = arg_5_0.rightPanel:Find("bottom/break_btn/tip_active")
	arg_5_0.tipDeactive = arg_5_0.rightPanel:Find("bottom/break_btn/tip_deactive")

	setText(arg_5_0.rightPanel:Find("bottom/panel_title/tip"), i18n("breakout_tip"))
	setText(arg_5_0.rightPanel:Find("bottom/break_btn/tip_deactive/values/ok"), i18n("text_confirm"))
	setText(arg_5_0.rightPanel:Find("bottom/break_btn/tip_active/image/ok"), i18n("text_confirm"))

	arg_5_0.recommandBtn = arg_5_0.rightPanel:Find("bottom/auto_btn")
	arg_5_0.isEnoughItems = true
	arg_5_0.sea = arg_5_0.leftPanel:Find("sea")
	arg_5_0.rawImage = arg_5_0.sea:GetComponent("RawImage")

	setActive(arg_5_0.rawImage, false)

	arg_5_0.healTF = arg_5_0._tf:Find("resources/heal")
	arg_5_0.healTF.transform.localPosition = Vector3(-360, 50, 40)

	setActive(arg_5_0.healTF, false)

	arg_5_0.qCharaContain = arg_5_0.rightPanel:Find("top/panel_bg/q_chara")
	arg_5_0.seaLoading = arg_5_0.leftPanel:Find("bg/loading")

	arg_5_0:playLoadingAni()

	arg_5_0.destroyConfirmWindow = ShipDestoryConfirmWindow.New(arg_5_0._tf, arg_5_0.event)
end

function var_0_0.loadChar(arg_6_0)
	if not arg_6_0.shipPrefab then
		local var_6_0 = arg_6_0.shipVO:getPrefab()

		pg.UIMgr.GetInstance():LoadingOn()
		PoolMgr.GetInstance():GetSpineChar(var_6_0, true, function(arg_7_0)
			pg.UIMgr.GetInstance():LoadingOff()

			arg_6_0.shipPrefab = var_6_0
			arg_6_0.shipModel = arg_7_0
			tf(arg_7_0).localScale = Vector3(0.8, 0.8, 1)

			arg_7_0:GetComponent("SpineAnimUI"):SetAction("stand", 0)
			setParent(arg_7_0, arg_6_0.qCharaContain)
		end)
	end
end

function var_0_0.recycleSpineChar(arg_8_0)
	if arg_8_0.shipPrefab and arg_8_0.shipModel then
		PoolMgr.GetInstance():ReturnSpineChar(arg_8_0.shipPrefab, arg_8_0.shipModel)

		arg_8_0.shipPrefab = nil
		arg_8_0.shipModel = nil
	end
end

function var_0_0.enabledToggles(arg_9_0, arg_9_1)
	eachChild(arg_9_0.toggles, function(arg_10_0)
		arg_10_0:GetComponent("Toggle").enabled = arg_9_1
	end)
end

function var_0_0.addDragListenter(arg_11_0)
	local var_11_0 = GetOrAddComponent(arg_11_0._tf, "EventTriggerListener")

	arg_11_0.dragTrigger = var_11_0

	local var_11_1
	local var_11_2 = 0

	var_11_0:AddBeginDragFunc(function()
		var_11_1 = nil
		var_11_2 = 0
	end)
	var_11_0:AddDragFunc(function(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_1.position

		if not var_11_1 then
			var_11_1 = var_13_0
		end

		var_11_2 = var_13_0.x - var_11_1.x
	end)
	var_11_0:AddDragEndFunc(function(arg_14_0, arg_14_1)
		if var_11_2 < -50 then
			arg_11_0:emit(ShipUpgradeMediator2.NEXTSHIP, -1)
		elseif var_11_2 > 50 then
			arg_11_0:emit(ShipUpgradeMediator2.NEXTSHIP)
		end
	end)
end

function var_0_0.didEnter(arg_15_0)
	arg_15_0:BlurPanel(arg_15_0._tf, {
		groupDelta = -1
	})
	arg_15_0:addDragListenter()
	onButton(arg_15_0, arg_15_0.seaLoading, function()
		if not arg_15_0.previewer then
			arg_15_0:showBarrage()
		end
	end)
	onButton(arg_15_0, arg_15_0.breakOutBtn, function()
		local var_17_0 = {}

		if arg_15_0.shipVO:isActivityNpc() then
			table.insert(var_17_0, function(arg_18_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("npc_breakout_tip"),
					onYes = arg_18_0
				})
			end)
		end

		seriesAsync(var_17_0, function()
			local var_19_0, var_19_1 = ShipStatus.ShipStatusCheck("onModify", arg_15_0.shipVO)

			if not var_19_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_19_1)

				return
			end

			if arg_15_0.breakCfg.breakout_id == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_maxLevel"))

				return
			end

			if arg_15_0.shipVO.level < arg_15_0.breakCfg.level then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_error_lvLimit"))

				return
			end

			if not arg_15_0.isEnoughItems then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_error_noEnoughMatrail"))

				return
			end

			if arg_15_0.player.gold < arg_15_0.breakCfg.use_gold then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
					{
						59001,
						arg_15_0.breakCfg.use_gold - arg_15_0.player.gold,
						arg_15_0.breakCfg.use_gold
					}
				})

				return
			end

			if not arg_15_0.contextData.materialShipIds or #arg_15_0.contextData.materialShipIds < arg_15_0.breakCfg.use_char_num then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_upgradeStar_select_material_tip"))

				return
			end

			arg_15_0:emit(ShipUpgradeMediator2.UPGRADE_SHIP, arg_15_0.contextData.materialShipIds)
		end)
	end, SFX_CONFIRM)
	onButton(arg_15_0, arg_15_0.recommandBtn, function()
		local var_20_0 = getProxy(BayProxy)

		if arg_15_0.contextData.materialShipIds and #arg_15_0.contextData.materialShipIds == arg_15_0.breakCfg.use_char_num then
			return
		end

		local var_20_1 = var_20_0:getUpgradeRecommendShip(arg_15_0.shipVO, arg_15_0.contextData.materialShipIds or {}, arg_15_0.breakCfg.use_char_num)

		if #var_20_1 > 0 then
			local var_20_2 = {}

			table.insert(var_20_2, function(arg_21_0)
				local var_21_0, var_21_1 = ShipCalcHelper.GetEliteAndHightLevelShips(underscore.map(var_20_1, function(arg_22_0)
					return var_20_0:getShipById(arg_22_0)
				end))

				if #var_21_0 > 0 or #var_21_1 > 0 then
					arg_15_0.destroyConfirmWindow:ExecuteAction("Show", var_21_0, var_21_1, false, arg_21_0)
				else
					arg_21_0()
				end
			end)
			seriesAsync(var_20_2, function()
				arg_15_0.contextData.materialShipIds = var_20_1

				arg_15_0:updateBreakOutView(arg_15_0.shipVO)
			end)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("without_selected_ship"))
		end
	end, SFX_CONFIRM)
	arg_15_0:initMaterialShips()
end

function var_0_0.getMaterialShip(arg_24_0, arg_24_1)
	local var_24_0

	for iter_24_0 = #arg_24_1, 1, -1 do
		if not arg_24_1[iter_24_0]:isTestShip() then
			var_24_0 = iter_24_0

			break
		end
	end

	var_24_0 = var_24_0 or #arg_24_1

	return var_24_0
end

function var_0_0.setShip(arg_25_0, arg_25_1)
	arg_25_0.shipVO = arg_25_1
	arg_25_0.shipTempCfg = pg.ship_data_template
	arg_25_0.shipBreakOutCfg = pg.ship_data_breakout
	arg_25_0.breakIds = arg_25_0:getStages()
	arg_25_0.itemTFs = {}

	for iter_25_0 = 1, 3 do
		arg_25_0.itemTFs[iter_25_0] = arg_25_0.materials:Find("item_" .. iter_25_0)
	end

	arg_25_0:updateBattleView()
	arg_25_0:updateBreakOutView(arg_25_0.shipVO)

	local var_25_0 = arg_25_0.shipVO.level < arg_25_0.breakCfg.level or arg_25_0.breakCfg.breakout_id == 0

	setActive(arg_25_0.tipActive, not var_25_0)
	setActive(arg_25_0.tipDeactive, var_25_0)
	setButtonEnabled(arg_25_0.breakOutBtn, not var_25_0)
	setActive(arg_25_0.recommandBtn, arg_25_0.breakCfg.breakout_id ~= 0)
	arg_25_0:loadChar()
end

function var_0_0.getStages(arg_26_0)
	local var_26_0 = {}
	local var_26_1 = math.floor(arg_26_0.shipVO.configId / 10)

	for iter_26_0 = 1, 4 do
		local var_26_2 = tonumber(var_26_1 .. iter_26_0)

		assert(arg_26_0.shipBreakOutCfg[var_26_2], "必须存在配置" .. var_26_2)
		table.insert(var_26_0, var_26_2)
	end

	return var_26_0
end

function var_0_0.updateStagesScrollView(arg_27_0)
	local var_27_0 = table.indexof(arg_27_0.breakIds, arg_27_0.shipVO.configId)

	if var_27_0 and var_27_0 >= 1 and var_27_0 <= var_0_1 then
		arg_27_0.stages:Find("stage" .. var_27_0):GetComponent(typeof(Toggle)).isOn = true
	end
end

function var_0_0.updateBattleView(arg_28_0)
	if #arg_28_0.breakIds < var_0_1 then
		return
	end

	for iter_28_0 = 1, var_0_1 do
		local var_28_0 = arg_28_0.breakIds[iter_28_0]
		local var_28_1 = arg_28_0.shipBreakOutCfg[var_28_0]

		assert(var_28_1, "不存在配置" .. var_28_0)

		local var_28_2 = arg_28_0.stages:Find("stage" .. iter_28_0)

		onToggle(arg_28_0, var_28_2, function(arg_29_0)
			if arg_29_0 then
				local var_29_0 = var_28_1.breakout_view
				local var_29_1 = checkExist(pg.ship_data_template[var_28_1.breakout_id], {
					"specific_type"
				}) or {}

				for iter_29_0, iter_29_1 in ipairs(var_29_1) do
					var_29_0 = var_29_0 .. "/" .. i18n(ShipType.SpecificTableTips[iter_29_1])
				end

				changeToScrollText(arg_28_0.breakView, var_29_0)
				arg_28_0:switchStage(var_28_0)
			end
		end, SFX_PANEL)
	end

	arg_28_0.stages:Find("stage1"):GetComponent(typeof(Toggle)).group:SetAllTogglesOff()

	local var_28_3 = table.indexof(arg_28_0.breakIds, arg_28_0.shipVO.configId)
	local var_28_4 = math.clamp(var_28_3, 1, var_0_1)

	if var_28_4 and var_28_4 >= 1 and var_28_4 <= var_0_1 then
		local var_28_5 = arg_28_0.stages:Find("stage" .. var_28_4)

		triggerToggle(var_28_5, true)
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

function var_0_0.showBarrage(arg_30_0)
	arg_30_0.previewer = WeaponPreviewer.New(arg_30_0.rawImage)

	arg_30_0.previewer:configUI(arg_30_0.healTF)
	arg_30_0.previewer:setDisplayWeapon(arg_30_0:getWaponIdsById(arg_30_0.breakOutId))
	arg_30_0.previewer:load(40000, arg_30_0.shipVO, arg_30_0:getAllWeaponIds(), function()
		arg_30_0:stopLoadingAni()
	end)
end

function var_0_0.getWaponIdsById(arg_32_0, arg_32_1)
	return arg_32_0.shipBreakOutCfg[arg_32_1].weapon_ids
end

function var_0_0.switchStage(arg_33_0, arg_33_1)
	if arg_33_0.breakOutId == arg_33_1 then
		return
	end

	arg_33_0.breakOutId = arg_33_1

	if arg_33_0.previewer then
		arg_33_0.previewer:setDisplayWeapon(arg_33_0:getWaponIdsById(arg_33_0.breakOutId))
	end
end

function var_0_0.getAllWeaponIds(arg_34_0)
	local var_34_0 = {}

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.breakIds) do
		local var_34_1 = Clone(arg_34_0.shipBreakOutCfg[iter_34_1].weapon_ids)
		local var_34_2 = {
			__add = function(arg_35_0, arg_35_1)
				for iter_35_0, iter_35_1 in ipairs(arg_35_0) do
					if not table.contains(arg_35_1, iter_35_1) then
						table.insert(arg_35_1, iter_35_1)
					end
				end

				return arg_35_1
			end
		}

		setmetatable(var_34_0, var_34_2)

		var_34_0 = var_34_0 + var_34_1
	end

	return var_34_0
end

function var_0_0.updateBreakOutView(arg_36_0, arg_36_1)
	arg_36_0.breakCfg = arg_36_0.shipBreakOutCfg[arg_36_1.configId]

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.itemTFs) do
		setActive(iter_36_1, false)
	end

	local var_36_0 = arg_36_1:getShipProperties()
	local var_36_1 = Clone(arg_36_1)

	var_36_1.configId = arg_36_0.breakCfg.breakout_id

	local var_36_2 = {}
	local var_36_3 = arg_36_0.breakCfg.breakout_id == 0
	local var_36_4 = arg_36_1:getBattleTotalExpend()
	local var_36_5
	local var_36_6
	local var_36_7 = arg_36_0.tipDeactive:Find("values/label")
	local var_36_8 = arg_36_0.tipDeactive:Find("values/value")

	setText(var_36_7, "")
	setText(var_36_8, "")

	if var_36_3 then
		var_36_2 = var_36_0
		var_36_5 = var_36_4

		setText(var_36_7, i18n("word_level_upperLimit"))
	else
		var_36_6 = arg_36_0.shipTempCfg[arg_36_0.breakCfg.breakout_id].max_level
		var_36_2 = var_36_1:getShipProperties()
		var_36_2.level = var_36_6 >= arg_36_1:getMaxLevel() and var_36_6 or arg_36_1:getMaxLevel()
		var_36_5 = var_36_1:getBattleTotalExpend()

		setColorCount(var_36_8, arg_36_0.shipVO.level, arg_36_0.breakCfg.level)
		setText(var_36_7, i18n("word_level_require"))
	end

	local function var_36_9(arg_37_0, arg_37_1)
		setText(arg_37_0:Find("name"), arg_37_1.name)
		setText(arg_37_0:Find("value"), arg_37_1.preAttr)

		local var_37_0 = arg_37_0:Find("value1")
		local var_37_1 = arg_37_0:Find("addition")
		local var_37_2

		if arg_37_1.afterAttr == 0 then
			var_37_2 = setColorStr(arg_37_1.afterAttr, "#FFFFFFFF")
		else
			var_37_2 = setColorStr(arg_37_1.afterAttr, COLOR_GREEN)
		end

		setText(var_37_0, var_37_2)
		setActive(var_37_1, arg_37_1.afterAttr - arg_37_1.preAttr ~= 0)
		setText(var_37_1, "(+" .. arg_37_1.afterAttr - arg_37_1.preAttr .. ")")
	end

	local var_36_10 = 0

	if var_36_6 and var_36_6 ~= arg_36_0.shipTempCfg[arg_36_1.configId].max_level then
		local var_36_11 = arg_36_0.attrs:Find("attr_1")

		var_36_9(var_36_11, {
			preAttr = arg_36_0.shipTempCfg[arg_36_1.configId].max_level,
			afterAttr = var_36_6,
			name = i18n("word_level_upperLimit")
		})

		var_36_10 = 1
	end

	for iter_36_2 = 1, #var_0_2 do
		local var_36_12 = arg_36_0.attrs:Find("attr_" .. var_36_10 + iter_36_2)

		setActive(var_36_12, true)

		local var_36_13 = math.floor(var_36_0[var_0_2[iter_36_2]])
		local var_36_14 = math.floor(var_36_2[var_0_2[iter_36_2]])

		var_36_9(var_36_12, {
			preAttr = var_36_13,
			afterAttr = var_36_14,
			name = i18n("word_attr_" .. var_0_2[iter_36_2])
		})
	end

	local var_36_15 = var_36_10 + #var_0_2 + 1
	local var_36_16 = arg_36_0.attrs:Find("attr_" .. var_36_15)

	setActive(var_36_16, true)
	var_36_9(var_36_16, {
		preAttr = var_36_4,
		afterAttr = var_36_5,
		name = i18n("word_attr_luck")
	})

	for iter_36_3 = var_36_15 + 1, 8 do
		local var_36_17 = arg_36_0.attrs:Find("attr_" .. iter_36_3)

		setActive(var_36_17, false)
	end

	removeAllChildren(arg_36_0.starsFrom)

	for iter_36_4 = 1, arg_36_1:getStar() do
		cloneTplTo(arg_36_0.starTpl, arg_36_0.starsFrom)
	end

	if var_36_3 then
		return
	end

	removeAllChildren(arg_36_0.starsTo)

	if var_36_1:getStar() > arg_36_1:getStar() and not var_36_3 then
		for iter_36_5 = 1, var_36_1:getStar() do
			cloneTplTo(arg_36_0.starTpl, arg_36_0.starsTo)
		end
	end

	setActive(arg_36_0.appendStarTips, var_36_1:getStar() ~= arg_36_1:getStar())
	setActive(arg_36_0.starOpera, var_36_1:getStar() ~= arg_36_1:getStar())

	local var_36_18 = arg_36_0.breakCfg.use_gold

	if var_36_18 > arg_36_0.player.gold then
		var_36_18 = "<color=#FB4A2C>" .. var_36_18 .. "</color>"
	end

	setText(arg_36_0.tipActive:Find("text"), var_36_18)
	arg_36_0:initMaterialShips()
end

function var_0_0.initMaterialShips(arg_38_0)
	local var_38_0 = arg_38_0.breakCfg.use_char_num
	local var_38_1 = getProxy(BayProxy)

	for iter_38_0 = 1, 3 do
		SetActive(arg_38_0.itemTFs[iter_38_0], iter_38_0 <= var_38_0)

		local var_38_2 = arg_38_0.itemTFs[iter_38_0]:Find("IconTpl")
		local var_38_3 = arg_38_0.contextData.materialShipIds

		if iter_38_0 <= var_38_0 and var_38_3 and var_38_3[iter_38_0] then
			local var_38_4 = var_38_1:getShipById(var_38_3[iter_38_0])

			updateShip(var_38_2, var_38_4, {
				initStar = true
			})
			SetActive(var_38_2, true)
		else
			SetActive(var_38_2, false)
		end

		onButton(arg_38_0, arg_38_0.itemTFs[iter_38_0], function()
			arg_38_0:emit(ShipUpgradeMediator2.ON_SELECT_SHIP, arg_38_0.shipVO, var_38_0)
		end)
	end
end

function var_0_0.willExit(arg_40_0)
	arg_40_0:UnOverlayPanel(arg_40_0._tf)
	arg_40_0:recycleSpineChar()

	if arg_40_0.previewer then
		arg_40_0.previewer:clear()

		arg_40_0.previewer = nil
	end

	if arg_40_0.dragTrigger then
		ClearEventTrigger(arg_40_0.dragTrigger)

		arg_40_0.dragTrigger = nil
	end

	arg_40_0.destroyConfirmWindow:Destroy()
end

function var_0_0.playLoadingAni(arg_41_0)
	setActive(arg_41_0.seaLoading, true)
end

function var_0_0.stopLoadingAni(arg_42_0)
	setActive(arg_42_0.seaLoading, false)
end

function var_0_0.onBackPressed(arg_43_0)
	if arg_43_0.destroyConfirmWindow:isShowing() then
		arg_43_0.destroyConfirmWindow:ActionInvoke("Hide")

		return
	end

	arg_43_0:emit(BaseUI.ON_BACK_PRESSED, true)
end

return var_0_0
