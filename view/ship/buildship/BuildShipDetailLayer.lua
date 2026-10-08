local var_0_0 = class("BuildShipDetailLayer", import("...base.BaseUI"))
local var_0_1 = 10
local var_0_2 = 2
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = {
	"resources/1",
	"resources/2",
	"resources/3",
	"resources/1"
}

function var_0_0.getResource(arg_1_0)
	local var_1_0 = {
		"ui/building"
	}

	for iter_1_0, iter_1_1 in ipairs(pg.ship_data_create_material.all) do
		local var_1_1 = pg.ship_data_create_material[iter_1_1]

		if var_1_1 then
			if noEmptyStr(var_1_1.ship_icon) then
				table.insert(var_1_0, ResPathSupport.ConstPath.UI.ShipModelBuliding .. var_1_1.ship_icon)
			end

			if noEmptyStr(var_1_1.build_anim) then
				table.insert(var_1_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Base, var_1_1.build_anim))
			end
		end
	end

	return table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))
end

function var_0_0.getUIName(arg_2_0)
	return "BuildShipDetailUI1"
end

function var_0_0.setItems(arg_3_0, arg_3_1)
	arg_3_0.itemVO = arg_3_1[ITEM_ID_EQUIP_QUICK_FINISH] or {
		count = 0,
		id = ITEM_ID_EQUIP_QUICK_FINISH
	}
end

function var_0_0.setWorkCount(arg_4_0, arg_4_1)
	arg_4_0.workCount = arg_4_1
end

function var_0_0.setBuildSpeedUpRemind(arg_5_0, arg_5_1)
	arg_5_0.isStopSpeedUpRemind = arg_5_1
end

var_0_0.MODEL_INDEX = 2

function var_0_0.setProjectList(arg_6_0, arg_6_1)
	arg_6_0.projectList = arg_6_1
	arg_6_0.MODEL = #arg_6_0.projectList > var_0_0.MODEL_INDEX and var_0_2 or var_0_3
end

function var_0_0.init(arg_7_0)
	arg_7_0.multLineTF = arg_7_0._tf:Find("list_mult_line")
	arg_7_0.multLineContain = arg_7_0._tf:Find("list_mult_line/content")
	arg_7_0.multLineTpl = arg_7_0.multLineContain:Find("project_tpl")
	arg_7_0.multList = UIItemList.New(arg_7_0.multLineContain, arg_7_0.multLineTpl)
	arg_7_0.singleLineTF = arg_7_0._tf:Find("list_single_line")
	arg_7_0.singleLineContain = arg_7_0._tf:Find("list_single_line/content")
	arg_7_0.singleLineTpl = arg_7_0.singleLineContain:Find("project_tpl")
	arg_7_0.singleList = UIItemList.New(arg_7_0.singleLineContain, arg_7_0.singleLineTpl)
	arg_7_0.listCountTF = arg_7_0._tf:Find("title/value")
	arg_7_0.quickCount = arg_7_0._tf:Find("quick_count")
	arg_7_0.quickCountTF = arg_7_0._tf:Find("quick_count/value")
	arg_7_0.noneBg = arg_7_0._tf:Find("none_bg")
	arg_7_0.allLaunch = arg_7_0._tf:Find("all_launch")
	arg_7_0.aniBgTF = arg_7_0._tf:Find("aniBg")
	arg_7_0.autoLockShipToggle = arg_7_0._tf:Find("autolockship/Toggle"):GetComponent(typeof(Toggle))
	arg_7_0.canvasgroup = GetOrAddComponent(arg_7_0._tf, typeof(CanvasGroup))

	setText(arg_7_0._tf:Find("title/text"), i18n("build_detail_intro"))
	setText(arg_7_0._tf:Find("autolockship/Text"), i18n("lock_new_ship"))
end

function var_0_0.updatePlayer(arg_8_0, arg_8_1)
	arg_8_0._player = arg_8_1
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0.projectTFs = {}

	arg_9_0.multList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			arg_10_2.gameObject.name = "project_" .. arg_10_1 + 1
			arg_9_0.projectTFs[arg_10_1 + 1] = arg_10_2

			arg_9_0:updateProject(arg_10_1 + 1, arg_9_0.projectList[arg_10_1 + 1])
		end
	end)
	arg_9_0.singleList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			arg_11_2.gameObject.name = "project_" .. arg_11_1 + 1
			arg_9_0.projectTFs[arg_11_1 + 1] = arg_11_2

			arg_9_0:updateProject(arg_11_1 + 1, arg_9_0.projectList[arg_11_1 + 1])
		end
	end)
	arg_9_0:initProjectList()
	arg_9_0:updateItem()
	arg_9_0:updateListCount()

	local var_9_0 = GameObject.Find("Overlay/UIOverlay")

	arg_9_0.aniBgTF.transform:SetParent(var_9_0.transform, false)
	onButton(arg_9_0, arg_9_0.allLaunch, function()
		local var_12_0 = arg_9_0:getNeedCount()

		if var_12_0 > 0 and not arg_9_0.isStopSpeedUpRemind then
			local var_12_1 = pg.MsgboxMgr.GetInstance()

			var_12_1:ShowMsgBox({
				showStopRemind = true,
				content = i18n("ship_buildShipScene_quest_quickFinish", var_12_0, arg_9_0.itemVO.count == 0 and COLOR_RED or COLOR_GREEN, arg_9_0.itemVO.count),
				stopRamindContent = i18n("common_dont_remind_dur_login"),
				onYes = function()
					arg_9_0:emit(BuildShipDetailMediator.LAUNCH_ALL, var_12_1.stopRemindToggle.isOn)
				end
			})
		elseif #arg_9_0.projectList > 0 then
			arg_9_0:emit(BuildShipDetailMediator.LAUNCH_ALL)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_getShip_error_noShip"))
		end
	end, SFX_UI_BUILDING_FASTBUILDING)
	onButton(arg_9_0, arg_9_0.quickCount, function()
		local var_14_0 = 61009
		local var_14_1 = ShopConst.GetShopConfig(var_14_0)

		shoppingBatch(var_14_0, {
			id = var_14_1.effect_args[1]
		}, 9, "build_ship_quickly_buy_tool")
	end)

	local var_9_1 = pg.settings_other_template[22]
	local var_9_2 = getProxy(PlayerProxy):getRawData():GetCommonFlag(_G[var_9_1.name])

	if var_9_1.default == 1 then
		var_9_2 = not var_9_2
	end

	arg_9_0.autoLockShipToggle.isOn = var_9_2 or false

	onToggle(arg_9_0, go(arg_9_0.autoLockShipToggle), function(arg_15_0)
		arg_9_0:ChangeAutoLockShip(var_9_1, arg_15_0)
	end, SFX_PANEL)
end

function var_0_0.onBackPressed(arg_16_0)
	if arg_16_0.isPlayAnim then
		return
	end

	arg_16_0:emit(var_0_0.ON_BACK_PRESSED, true)
end

function var_0_0.getNeedCount(arg_17_0)
	local var_17_0 = 0

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.projectList) do
		if iter_17_1.state ~= BuildShip.FINISH then
			var_17_0 = var_17_0 + 1
		end
	end

	return var_17_0
end

function var_0_0.updateListCount(arg_18_0)
	setText(arg_18_0.listCountTF, arg_18_0.workCount)
end

function var_0_0.updateItem(arg_19_0)
	setText(arg_19_0.quickCountTF, arg_19_0.itemVO.count)
end

function var_0_0.initProjectList(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.buildTimers or {}) do
		pg.TimeMgr.GetInstance():RemoveTimer(iter_20_1)
	end

	arg_20_0.buildTimers = {}

	local var_20_0 = arg_20_0.MODEL == var_0_2 and #arg_20_0.projectList or 0
	local var_20_1 = arg_20_0.MODEL == var_0_3 and #arg_20_0.projectList or 0

	setActive(arg_20_0.multLineTF, var_20_0 > 0)
	setActive(arg_20_0.singleLineTF, var_20_1 > 0)
	arg_20_0.multList:align(var_20_0)
	arg_20_0.singleList:align(var_20_1)
	setActive(arg_20_0.noneBg, #arg_20_0.projectList <= 0)
end

function var_0_0.initMultLine(arg_21_0)
	arg_21_0.multList:align(#arg_21_0.projectList)
end

function var_0_0.initSingleLine(arg_22_0)
	arg_22_0.singleList:align(#arg_22_0.projectList)
end

function var_0_0.updateProject(arg_23_0, arg_23_1, arg_23_2)
	assert(isa(arg_23_2, BuildShip), "必须是实例BuildShip")

	local var_23_0 = arg_23_0.projectTFs[arg_23_1]

	if IsNil(var_23_0) then
		return
	end

	local var_23_1 = var_23_0:Find("frame/buiding")
	local var_23_2 = var_23_0:Find("frame/finished")
	local var_23_3 = var_23_0:Find("frame/waiting")

	setActive(var_23_3, false)
	setActive(var_23_1, arg_23_2.state == BuildShip.ACTIVE)
	setActive(var_23_2, arg_23_2.state == BuildShip.FINISH)

	var_23_0:GetComponent("CanvasGroup").alpha = arg_23_2.state == BuildShip.INACTIVE and 0.6 or 1

	local var_23_4 = pg.ship_data_create_material[arg_23_2.type]
	local var_23_5 = tonumber(var_23_4.ship_icon)
	local var_23_6 = var_23_1:Find("ship_modal")

	for iter_23_0 = 0, var_23_6.childCount - 1 do
		local var_23_7 = var_23_6:GetChild(iter_23_0)

		setActive(var_23_7, false)
	end

	if arg_23_2.state == BuildShip.ACTIVE then
		local var_23_8 = GetComponent(var_23_1, typeof(CanvasGroup))

		if var_23_8 then
			var_23_8.alpha = 1
		end

		local var_23_9 = var_23_6:Find("shipModelBuliding" .. var_23_5)

		if not var_23_9 then
			PoolMgr.GetInstance():GetUI("shipModelBuliding" .. var_23_5, true, function(arg_24_0)
				arg_24_0.transform:SetParent(var_23_6, false)

				arg_24_0.transform.localPosition = Vector3(1, 1, 1)
				arg_24_0.transform.localScale = Vector3(1, 1, 1)

				arg_24_0.transform:SetAsFirstSibling()
				setActive(arg_24_0, true)
			end)
		else
			setActive(var_23_9, true)
		end

		local var_23_10 = var_23_1:Find("timer/Text")

		onButton(arg_23_0, var_23_1:Find("quick_btn"), function()
			local var_25_0, var_25_1, var_25_2 = BuildShip.canQuickBuildShip(arg_23_1)

			if not var_25_0 then
				if var_25_2 then
					GoShoppingMsgBox(i18n("switch_to_shop_tip_1"), ChargeScene.TYPE_ITEM, var_25_2)
				else
					pg.TipsMgr.GetInstance():ShowTips(var_25_1)
				end

				return
			end

			if arg_23_0.isStopSpeedUpRemind then
				arg_23_0:emit(BuildShipDetailMediator.ON_QUICK, arg_23_1)
			else
				local var_25_3 = pg.MsgboxMgr.GetInstance()

				var_25_3:ShowMsgBox({
					showStopRemind = true,
					content = i18n("ship_buildShipScene_quest_quickFinish", 1, arg_23_0.itemVO.count == 0 and COLOR_RED or COLOR_GREEN, arg_23_0.itemVO.count),
					stopRamindContent = i18n("dont_remind_session"),
					onYes = function()
						arg_23_0:emit(BuildShipDetailMediator.ON_QUICK, arg_23_1, var_25_3.stopRemindToggle.isOn)
					end
				})
			end
		end, SFX_UI_BUILDING_FASTBUILDING)

		local function var_23_11()
			pg.TimeMgr.GetInstance():RemoveTimer(arg_23_0.buildTimers[arg_23_1])

			arg_23_0.buildTimers[arg_23_1] = nil

			setActive(var_23_1, false)
			setActive(var_23_2, true)
		end

		local function var_23_12(arg_28_0)
			local var_28_0 = pg.TimeMgr.GetInstance():DescCDTime(arg_28_0)

			setText(var_23_10, var_28_0)
		end

		if arg_23_0.buildTimers[arg_23_1] then
			pg.TimeMgr.GetInstance():RemoveTimer(arg_23_0.buildTimers[arg_23_1])

			arg_23_0.buildTimers[arg_23_1] = nil
		end

		arg_23_0.buildTimers[arg_23_1] = pg.TimeMgr.GetInstance():AddTimer("timer" .. arg_23_1, 0, 1, function()
			local var_29_0 = arg_23_2:getLeftTime()

			if var_29_0 <= 0 then
				var_23_11()
			else
				var_23_12(var_29_0)
			end
		end)
	elseif arg_23_2.state == BuildShip.FINISH then
		GetOrAddComponent(var_23_1, typeof(CanvasGroup)).alpha = 0

		setActive(var_23_1, true)

		local var_23_13 = var_23_6:Find("shipModelBuliding" .. var_23_5)

		if var_23_13 then
			setActive(var_23_13, true)
		end

		arg_23_0:setSpriteTo(var_0_5[tonumber(var_23_4.ship_icon)], var_23_2:Find("ship_modal"), false)

		local var_23_14 = findTF(var_23_2, "launched_btn")

		onButton(arg_23_0, var_23_14, function()
			arg_23_0:emit(BuildShipDetailMediator.ON_LAUNCHED, arg_23_1)
		end, SFX_PANEL)
		onButton(arg_23_0, var_23_0, function()
			triggerButton(var_23_14)
		end, SFX_PANEL)
	elseif arg_23_2.state == BuildShip.INACTIVE then
		setActive(var_23_3, true)
		setActive(var_23_1, false)
		setActive(var_23_2, false)
	end
end

function var_0_0.playGetShipAnimate(arg_32_0, arg_32_1, arg_32_2)
	arg_32_0.canvasgroup.blocksRaycasts = false

	local var_32_0 = pg.ship_data_create_material[arg_32_2]

	arg_32_0.isPlayAnim = true
	arg_32_0.onLoading = true

	pg.CpkPlayMgr.GetInstance():PlayCpkMovie(function()
		arg_32_0.onLoading = false

		if var_32_0 and var_32_0.build_voice ~= "" then
			arg_32_0:playCV(var_32_0.build_voice)
		end

		warning("BuildingCPK PlayCallBack", pg.CpkPlayMgr.GetInstance()._ratioFitter.enabled)
	end, function()
		arg_32_0.isPlayAnim = false
		arg_32_0.canvasgroup.blocksRaycasts = true

		arg_32_1()
	end, "ui", var_32_0.build_anim or "Building", true, false, 4.5, true)
end

function var_0_0.willExit(arg_35_0)
	pg.CpkPlayMgr.GetInstance():DisposeCpkMovie()

	for iter_35_0, iter_35_1 in pairs(arg_35_0.buildTimers) do
		pg.TimeMgr.GetInstance():RemoveTimer(iter_35_1)
	end

	if arg_35_0.aniBgTF then
		SetParent(arg_35_0.aniBgTF, arg_35_0._tf)
	end

	arg_35_0.buildTimers = nil

	arg_35_0:stopCV()

	arg_35_0.onLoading = false

	arg_35_0.multList:each(function(arg_36_0, arg_36_1)
		local var_36_0 = arg_36_1:Find("frame/buiding/ship_modal")

		eachChild(var_36_0, function(arg_37_0)
			PoolMgr.GetInstance():ReturnUI(arg_37_0.name, arg_37_0)
		end)
	end)
	arg_35_0.singleList:each(function(arg_38_0, arg_38_1)
		local var_38_0 = arg_38_1:Find("frame/buiding/ship_modal")

		eachChild(var_38_0, function(arg_39_0)
			PoolMgr.GetInstance():ReturnUI(arg_39_0.name, arg_39_0)
		end)
	end)
end

function var_0_0.playCV(arg_40_0, arg_40_1)
	arg_40_0:stopCV()

	local var_40_0 = "event:/cv/build/" .. arg_40_1

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_40_0)

	arg_40_0.voiceContent = var_40_0
end

function var_0_0.stopCV(arg_41_0)
	if arg_41_0.voiceContent then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_41_0.voiceContent)
	end

	arg_41_0.voiceContent = nil
end

function var_0_0.ChangeAutoLockShip(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = _G[arg_42_1.name]
	local var_42_1 = getProxy(PlayerProxy):getRawData():GetCommonFlag(var_42_0)
	local var_42_2 = not arg_42_2

	if arg_42_1.default == 1 then
		var_42_2 = arg_42_2
	end

	if var_42_2 then
		pg.m02:sendNotification(GAME.CANCEL_COMMON_FLAG, {
			flagID = var_42_0
		})
	else
		pg.m02:sendNotification(GAME.COMMON_FLAG, {
			flagID = var_42_0
		})
	end
end

return var_0_0
