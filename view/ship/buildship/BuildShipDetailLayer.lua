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

function var_0_0.getUIName(arg_1_0)
	return "BuildShipDetailUI1"
end

function var_0_0.setItems(arg_2_0, arg_2_1)
	arg_2_0.itemVO = arg_2_1[ITEM_ID_EQUIP_QUICK_FINISH] or {
		count = 0,
		id = ITEM_ID_EQUIP_QUICK_FINISH
	}
end

function var_0_0.setWorkCount(arg_3_0, arg_3_1)
	arg_3_0.workCount = arg_3_1
end

function var_0_0.setBuildSpeedUpRemind(arg_4_0, arg_4_1)
	arg_4_0.isStopSpeedUpRemind = arg_4_1
end

var_0_0.MODEL_INDEX = 2

function var_0_0.setProjectList(arg_5_0, arg_5_1)
	arg_5_0.projectList = arg_5_1
	arg_5_0.MODEL = #arg_5_0.projectList > var_0_0.MODEL_INDEX and var_0_2 or var_0_3
end

function var_0_0.init(arg_6_0)
	arg_6_0.multLineTF = arg_6_0:findTF("list_mult_line")
	arg_6_0.multLineContain = arg_6_0:findTF("list_mult_line/content")
	arg_6_0.multLineTpl = arg_6_0:findTF("project_tpl", arg_6_0.multLineContain)
	arg_6_0.multList = UIItemList.New(arg_6_0.multLineContain, arg_6_0.multLineTpl)
	arg_6_0.singleLineTF = arg_6_0:findTF("list_single_line")
	arg_6_0.singleLineContain = arg_6_0:findTF("list_single_line/content")
	arg_6_0.singleLineTpl = arg_6_0:findTF("project_tpl", arg_6_0.singleLineContain)
	arg_6_0.singleList = UIItemList.New(arg_6_0.singleLineContain, arg_6_0.singleLineTpl)
	arg_6_0.listCountTF = arg_6_0:findTF("title/value")
	arg_6_0.quickCount = arg_6_0:findTF("quick_count")
	arg_6_0.quickCountTF = arg_6_0:findTF("quick_count/value")
	arg_6_0.noneBg = arg_6_0:findTF("none_bg")
	arg_6_0.allLaunch = arg_6_0:findTF("all_launch")
	arg_6_0.aniBgTF = arg_6_0:findTF("aniBg")
	arg_6_0.autoLockShipToggle = arg_6_0:findTF("autolockship/Toggle"):GetComponent(typeof(Toggle))
	arg_6_0.canvasgroup = GetOrAddComponent(arg_6_0._tf, typeof(CanvasGroup))

	setText(arg_6_0:findTF("title/text"), i18n("build_detail_intro"))
	setText(arg_6_0:findTF("autolockship/Text"), i18n("lock_new_ship"))
end

function var_0_0.updatePlayer(arg_7_0, arg_7_1)
	arg_7_0._player = arg_7_1
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0.projectTFs = {}

	arg_8_0.multList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			arg_9_2.gameObject.name = "project_" .. arg_9_1 + 1
			arg_8_0.projectTFs[arg_9_1 + 1] = arg_9_2

			arg_8_0:updateProject(arg_9_1 + 1, arg_8_0.projectList[arg_9_1 + 1])
		end
	end)
	arg_8_0.singleList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			arg_10_2.gameObject.name = "project_" .. arg_10_1 + 1
			arg_8_0.projectTFs[arg_10_1 + 1] = arg_10_2

			arg_8_0:updateProject(arg_10_1 + 1, arg_8_0.projectList[arg_10_1 + 1])
		end
	end)
	arg_8_0:initProjectList()
	arg_8_0:updateItem()
	arg_8_0:updateListCount()

	local var_8_0 = GameObject.Find("Overlay/UIOverlay")

	arg_8_0.aniBgTF.transform:SetParent(var_8_0.transform, false)
	onButton(arg_8_0, arg_8_0.allLaunch, function()
		local var_11_0 = arg_8_0:getNeedCount()

		if var_11_0 > 0 and not arg_8_0.isStopSpeedUpRemind then
			local var_11_1 = pg.MsgboxMgr.GetInstance()

			var_11_1:ShowMsgBox({
				showStopRemind = true,
				content = i18n("ship_buildShipScene_quest_quickFinish", var_11_0, arg_8_0.itemVO.count == 0 and COLOR_RED or COLOR_GREEN, arg_8_0.itemVO.count),
				stopRamindContent = i18n("common_dont_remind_dur_login"),
				onYes = function()
					arg_8_0:emit(BuildShipDetailMediator.LAUNCH_ALL, var_11_1.stopRemindToggle.isOn)
				end
			})
		elseif #arg_8_0.projectList > 0 then
			arg_8_0:emit(BuildShipDetailMediator.LAUNCH_ALL)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_getShip_error_noShip"))
		end
	end, SFX_UI_BUILDING_FASTBUILDING)
	onButton(arg_8_0, arg_8_0.quickCount, function()
		local var_13_0 = pg.shop_template[61009]

		shoppingBatch(61009, {
			id = var_13_0.effect_args[1]
		}, 9, "build_ship_quickly_buy_tool")
	end)

	local var_8_1 = pg.settings_other_template[22]
	local var_8_2 = getProxy(PlayerProxy):getRawData():GetCommonFlag(_G[var_8_1.name])

	if var_8_1.default == 1 then
		var_8_2 = not var_8_2
	end

	arg_8_0.autoLockShipToggle.isOn = var_8_2 or false

	onToggle(arg_8_0, go(arg_8_0.autoLockShipToggle), function(arg_14_0)
		arg_8_0:ChangeAutoLockShip(var_8_1, arg_14_0)
	end, SFX_PANEL)
end

function var_0_0.onBackPressed(arg_15_0)
	if arg_15_0.isPlayAnim then
		return
	end

	arg_15_0:emit(var_0_0.ON_BACK_PRESSED, true)
end

function var_0_0.getNeedCount(arg_16_0)
	local var_16_0 = 0

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.projectList) do
		if iter_16_1.state ~= BuildShip.FINISH then
			var_16_0 = var_16_0 + 1
		end
	end

	return var_16_0
end

function var_0_0.updateListCount(arg_17_0)
	setText(arg_17_0.listCountTF, arg_17_0.workCount)
end

function var_0_0.updateItem(arg_18_0)
	setText(arg_18_0.quickCountTF, arg_18_0.itemVO.count)
end

function var_0_0.initProjectList(arg_19_0)
	for iter_19_0, iter_19_1 in pairs(arg_19_0.buildTimers or {}) do
		pg.TimeMgr.GetInstance():RemoveTimer(iter_19_1)
	end

	arg_19_0.buildTimers = {}

	local var_19_0 = arg_19_0.MODEL == var_0_2 and #arg_19_0.projectList or 0
	local var_19_1 = arg_19_0.MODEL == var_0_3 and #arg_19_0.projectList or 0

	setActive(arg_19_0.multLineTF, var_19_0 > 0)
	setActive(arg_19_0.singleLineTF, var_19_1 > 0)
	arg_19_0.multList:align(var_19_0)
	arg_19_0.singleList:align(var_19_1)
	setActive(arg_19_0.noneBg, #arg_19_0.projectList <= 0)
end

function var_0_0.initMultLine(arg_20_0)
	arg_20_0.multList:align(#arg_20_0.projectList)
end

function var_0_0.initSingleLine(arg_21_0)
	arg_21_0.singleList:align(#arg_21_0.projectList)
end

function var_0_0.updateProject(arg_22_0, arg_22_1, arg_22_2)
	assert(isa(arg_22_2, BuildShip), "必须是实例BuildShip")

	local var_22_0 = arg_22_0.projectTFs[arg_22_1]

	if IsNil(var_22_0) then
		return
	end

	local var_22_1 = arg_22_0:findTF("frame/buiding", var_22_0)
	local var_22_2 = arg_22_0:findTF("frame/finished", var_22_0)
	local var_22_3 = arg_22_0:findTF("frame/waiting", var_22_0)

	setActive(var_22_3, false)
	setActive(var_22_1, arg_22_2.state == BuildShip.ACTIVE)
	setActive(var_22_2, arg_22_2.state == BuildShip.FINISH)

	var_22_0:GetComponent("CanvasGroup").alpha = arg_22_2.state == BuildShip.INACTIVE and 0.6 or 1

	local var_22_4 = pg.ship_data_create_material[arg_22_2.type]
	local var_22_5 = tonumber(var_22_4.ship_icon)
	local var_22_6 = arg_22_0:findTF("ship_modal", var_22_1)

	for iter_22_0 = 0, var_22_6.childCount - 1 do
		local var_22_7 = var_22_6:GetChild(iter_22_0)

		setActive(var_22_7, false)
	end

	if arg_22_2.state == BuildShip.ACTIVE then
		local var_22_8 = GetComponent(var_22_1, typeof(CanvasGroup))

		if var_22_8 then
			var_22_8.alpha = 1
		end

		local var_22_9 = arg_22_0:findTF("shipModelBuliding" .. var_22_5, var_22_6)

		if not var_22_9 then
			PoolMgr.GetInstance():GetUI("shipModelBuliding" .. var_22_5, true, function(arg_23_0)
				arg_23_0.transform:SetParent(var_22_6, false)

				arg_23_0.transform.localPosition = Vector3(1, 1, 1)
				arg_23_0.transform.localScale = Vector3(1, 1, 1)

				arg_23_0.transform:SetAsFirstSibling()

				arg_23_0.name = "shipModelBuliding" .. var_22_5

				setActive(arg_23_0, true)
			end)
		else
			setActive(var_22_9, true)
		end

		local var_22_10 = arg_22_0:findTF("timer/Text", var_22_1)

		onButton(arg_22_0, arg_22_0:findTF("quick_btn", var_22_1), function()
			local var_24_0, var_24_1, var_24_2 = BuildShip.canQuickBuildShip(arg_22_1)

			if not var_24_0 then
				if var_24_2 then
					GoShoppingMsgBox(i18n("switch_to_shop_tip_1"), ChargeScene.TYPE_ITEM, var_24_2)
				else
					pg.TipsMgr.GetInstance():ShowTips(var_24_1)
				end

				return
			end

			if arg_22_0.isStopSpeedUpRemind then
				arg_22_0:emit(BuildShipDetailMediator.ON_QUICK, arg_22_1)
			else
				local var_24_3 = pg.MsgboxMgr.GetInstance()

				var_24_3:ShowMsgBox({
					showStopRemind = true,
					content = i18n("ship_buildShipScene_quest_quickFinish", 1, arg_22_0.itemVO.count == 0 and COLOR_RED or COLOR_GREEN, arg_22_0.itemVO.count),
					stopRamindContent = i18n("dont_remind_session"),
					onYes = function()
						arg_22_0:emit(BuildShipDetailMediator.ON_QUICK, arg_22_1, var_24_3.stopRemindToggle.isOn)
					end
				})
			end
		end, SFX_UI_BUILDING_FASTBUILDING)

		local function var_22_11()
			pg.TimeMgr.GetInstance():RemoveTimer(arg_22_0.buildTimers[arg_22_1])

			arg_22_0.buildTimers[arg_22_1] = nil

			setActive(var_22_1, false)
			setActive(var_22_2, true)
		end

		local function var_22_12(arg_27_0)
			local var_27_0 = pg.TimeMgr.GetInstance():DescCDTime(arg_27_0)

			setText(var_22_10, var_27_0)
		end

		if arg_22_0.buildTimers[arg_22_1] then
			pg.TimeMgr.GetInstance():RemoveTimer(arg_22_0.buildTimers[arg_22_1])

			arg_22_0.buildTimers[arg_22_1] = nil
		end

		arg_22_0.buildTimers[arg_22_1] = pg.TimeMgr.GetInstance():AddTimer("timer" .. arg_22_1, 0, 1, function()
			local var_28_0 = arg_22_2:getLeftTime()

			if var_28_0 <= 0 then
				var_22_11()
			else
				var_22_12(var_28_0)
			end
		end)
	elseif arg_22_2.state == BuildShip.FINISH then
		GetOrAddComponent(var_22_1, typeof(CanvasGroup)).alpha = 0

		setActive(var_22_1, true)

		local var_22_13 = arg_22_0:findTF("shipModelBuliding" .. var_22_5, var_22_6)

		if var_22_13 then
			setActive(var_22_13, true)
		end

		arg_22_0:setSpriteTo(var_0_5[tonumber(var_22_4.ship_icon)], arg_22_0:findTF("ship_modal", var_22_2), false)

		local var_22_14 = findTF(var_22_2, "launched_btn")

		onButton(arg_22_0, var_22_14, function()
			arg_22_0:emit(BuildShipDetailMediator.ON_LAUNCHED, arg_22_1)
		end, SFX_PANEL)
		onButton(arg_22_0, var_22_0, function()
			triggerButton(var_22_14)
		end, SFX_PANEL)
	elseif arg_22_2.state == BuildShip.INACTIVE then
		setActive(var_22_3, true)
		setActive(var_22_1, false)
		setActive(var_22_2, false)
	end
end

function var_0_0.playGetShipAnimate(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.canvasgroup.blocksRaycasts = false

	local var_31_0 = pg.ship_data_create_material[arg_31_2]

	arg_31_0.isPlayAnim = true
	arg_31_0.onLoading = true

	pg.CpkPlayMgr.GetInstance():PlayCpkMovie(function()
		arg_31_0.onLoading = false

		if var_31_0 and var_31_0.build_voice ~= "" then
			arg_31_0:playCV(var_31_0.build_voice)
		end

		warning("BuildingCPK PlayCallBack", pg.CpkPlayMgr.GetInstance()._ratioFitter.enabled)
	end, function()
		arg_31_0.isPlayAnim = false
		arg_31_0.canvasgroup.blocksRaycasts = true

		arg_31_1()
	end, "ui", var_31_0.build_anim or "Building", true, false, 4.5, true)
end

function var_0_0.willExit(arg_34_0)
	pg.CpkPlayMgr.GetInstance():DisposeCpkMovie()

	for iter_34_0, iter_34_1 in pairs(arg_34_0.buildTimers) do
		pg.TimeMgr.GetInstance():RemoveTimer(iter_34_1)
	end

	if arg_34_0.aniBgTF then
		SetParent(arg_34_0.aniBgTF, arg_34_0._tf)
	end

	arg_34_0.buildTimers = nil

	arg_34_0:stopCV()

	arg_34_0.onLoading = false

	arg_34_0.multList:each(function(arg_35_0, arg_35_1)
		local var_35_0 = arg_34_0:findTF("frame/buiding/ship_modal", arg_35_1)

		eachChild(var_35_0, function(arg_36_0)
			PoolMgr.GetInstance():ReturnUI(arg_36_0.name, arg_36_0)
		end)
	end)
	arg_34_0.singleList:each(function(arg_37_0, arg_37_1)
		local var_37_0 = arg_34_0:findTF("frame/buiding/ship_modal", arg_37_1)

		eachChild(var_37_0, function(arg_38_0)
			PoolMgr.GetInstance():ReturnUI(arg_38_0.name, arg_38_0)
		end)
	end)
end

function var_0_0.playCV(arg_39_0, arg_39_1)
	arg_39_0:stopCV()

	local var_39_0 = "event:/cv/build/" .. arg_39_1

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_39_0)

	arg_39_0.voiceContent = var_39_0
end

function var_0_0.stopCV(arg_40_0)
	if arg_40_0.voiceContent then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_40_0.voiceContent)
	end

	arg_40_0.voiceContent = nil
end

function var_0_0.ChangeAutoLockShip(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = _G[arg_41_1.name]
	local var_41_1 = getProxy(PlayerProxy):getRawData():GetCommonFlag(var_41_0)
	local var_41_2 = not arg_41_2

	if arg_41_1.default == 1 then
		var_41_2 = arg_41_2
	end

	if var_41_2 then
		pg.m02:sendNotification(GAME.CANCEL_COMMON_FLAG, {
			flagID = var_41_0
		})
	else
		pg.m02:sendNotification(GAME.COMMON_FLAG, {
			flagID = var_41_0
		})
	end
end

return var_0_0
