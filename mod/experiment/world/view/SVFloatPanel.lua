local var_0_0 = class("SVFloatPanel", import("view.base.BaseSubView"))

var_0_0.ShowView = "SVFloatPanel.ShowView"
var_0_0.HideView = "SVFloatPanel.HideView"
var_0_0.ReturnCall = "SVFloatPanel.ReturnCall"
var_0_0.DelegateCall = "SVFloatPanel.DelegateCall"

function var_0_0.getUIName(arg_1_0)
	return "SVFloatPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	return
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.rtBasePoint = arg_3_0._tf:Find("point")
	arg_3_0.rtInfoPanel = arg_3_0.rtBasePoint:Find("line/bg")
	arg_3_0.rtMarking = arg_3_0.rtInfoPanel:Find("icon/marking")
	arg_3_0.rtRes = arg_3_0._tf:Find("res")
	arg_3_0.awardItemList = UIItemList.New(arg_3_0.rtInfoPanel:Find("pressing_award"), arg_3_0.rtInfoPanel:Find("pressing_award/award_tpl"))

	arg_3_0.awardItemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = arg_3_0.awardConfig[arg_4_1 + 1]
			local var_4_1 = {
				type = var_4_0[1],
				id = var_4_0[2],
				count = var_4_0[3]
			}

			updateDrop(arg_4_2:Find("IconTpl"), var_4_1)
			onButton(arg_3_0, arg_4_2:Find("IconTpl"), function()
				arg_3_0:emit(BaseUI.ON_DROP, var_4_1)
			end, SFX_PANEL)

			local var_4_2 = arg_3_0.mapList[arg_3_0.destIndex]

			setActive(arg_4_2:Find("is_pressing"), var_4_2.isPressing)
			setActive(arg_4_2:Find("IconTpl"), not var_4_2.isPressing)
		end
	end)

	arg_3_0.btnBack = arg_3_0.rtInfoPanel:Find("back")

	onButton(arg_3_0, arg_3_0.btnBack, function()
		arg_3_0:emit(WorldScene.SceneOp, "OpSetInMap", true)
	end, SFX_CONFIRM)

	arg_3_0.btnEnter = arg_3_0.rtInfoPanel:Find("enter")

	onButton(arg_3_0, arg_3_0.btnEnter, function()
		local var_7_0 = {}
		local var_7_1 = arg_3_0.mapList[arg_3_0.destIndex]

		if WorldConst.HasDangerConfirm(var_7_1.config.entrance_ui) then
			table.insert(var_7_0, function(arg_8_0)
				arg_3_0:emit(WorldScene.SceneOp, "OpCall", function(arg_9_0)
					arg_9_0()
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("world_map_dangerous_confirm"),
						onYes = arg_8_0
					})
				end)
			end)
		end

		seriesAsync(var_7_0, function()
			local var_10_0 = nowWorld().staminaMgr

			if not var_7_1.isCost and var_7_1.config.enter_cost > var_10_0:GetTotalStamina() then
				var_10_0:Show()
			else
				arg_3_0:emit(WorldScene.SceneOp, "OpTransport", arg_3_0.entrance, var_7_1)
			end
		end)
	end, SFX_CONFIRM)

	arg_3_0.btnDelegate = arg_3_0.btnEnter:Find("delegate")

	onButton(arg_3_0, arg_3_0.btnDelegate, function()
		local var_11_0 = arg_3_0.mapList[arg_3_0.destIndex]

		arg_3_0:emit(var_0_0.DelegateCall, var_11_0.id)
	end, SFX_PANEL)
	setText(arg_3_0.btnDelegate:Find("lock/Text"), i18n("world_auto_buy_unlock"))

	arg_3_0.btnLock = arg_3_0.rtInfoPanel:Find("lock")
	arg_3_0.btnReturn = arg_3_0.rtInfoPanel:Find("return")

	onButton(arg_3_0, arg_3_0.btnReturn, function()
		arg_3_0:emit(var_0_0.ReturnCall, arg_3_0.entrance)
	end, SFX_CONFIRM)

	arg_3_0.btnSwitch = arg_3_0.rtInfoPanel:Find("switch")

	onButton(arg_3_0, arg_3_0.btnSwitch, function()
		if arg_3_0.isTweening then
			return
		end

		arg_3_0:ShowToggleMask()
	end, SFX_PANEL)

	arg_3_0.rtSelectMask = arg_3_0._tf:Find("select_mask")

	onButton(arg_3_0, arg_3_0.rtSelectMask:Find("bg"), function()
		if arg_3_0.isTweening then
			return
		end

		arg_3_0:HideToggleMask()
	end, SFX_PANEL)

	arg_3_0.rtMaskMarking = arg_3_0.rtSelectMask:Find("marking")
	arg_3_0.rtToggles = arg_3_0.rtMaskMarking:Find("toggles")
	arg_3_0.toggleItemList = UIItemList.New(arg_3_0.rtToggles, arg_3_0.rtToggles:Find("toggle"))

	arg_3_0.toggleItemList:make(function(arg_15_0, arg_15_1, arg_15_2)
		arg_15_1 = arg_15_1 + 1

		if arg_15_0 == UIItemList.EventUpdate then
			local var_15_0 = arg_3_0.mapList[arg_15_1]
			local var_15_1, var_15_2 = World.ReplacementMapType(arg_3_0.entrance, var_15_0)

			setText(arg_15_2:Find("Text"), var_15_2)
			onToggle(arg_3_0, arg_15_2, function(arg_16_0)
				if arg_16_0 then
					arg_3_0:HideToggleMask()

					arg_3_0.destIndex = arg_15_1

					arg_3_0:UpdatePanel()
				end
			end, SFX_PANEL)
			triggerToggle(arg_15_2, false)
		end
	end)
end

function var_0_0.OnDestroy(arg_17_0)
	return
end

function var_0_0.Show(arg_18_0)
	setActive(arg_18_0._tf, true)
end

function var_0_0.Hide(arg_19_0)
	setActive(arg_19_0._tf, false)
end

function var_0_0.Setup(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	arg_20_0.entrance = arg_20_1

	local var_20_0 = arg_20_4:GetMapScreenPos(Vector2(arg_20_1.config.area_pos[1], arg_20_1.config.area_pos[2]))

	setAnchoredPosition(arg_20_0.rtBasePoint, arg_20_0._tf:InverseTransformPoint(GameObject.Find("OverlayCamera"):GetComponent(typeof(Camera)):ScreenToWorldPoint(var_20_0)))

	arg_20_0.mapList = nowWorld():EntranceToReplacementMapList(arg_20_1)

	local function var_20_1()
		if arg_20_2 then
			for iter_21_0, iter_21_1 in ipairs(arg_20_0.mapList) do
				if iter_21_1.id == arg_20_2 then
					return iter_21_0
				end
			end
		end

		if arg_20_3 then
			for iter_21_2, iter_21_3 in ipairs(arg_20_3) do
				for iter_21_4, iter_21_5 in ipairs(arg_20_0.mapList) do
					if iter_21_3 == World.ReplacementMapType(arg_20_1, iter_21_5) then
						return iter_21_4
					end
				end
			end
		end

		if arg_20_1.active then
			for iter_21_6, iter_21_7 in ipairs(arg_20_0.mapList) do
				if iter_21_7.active then
					return iter_21_6
				end
			end
		end

		return 1
	end

	arg_20_0.toggleItemList:align(#arg_20_0.mapList)
	triggerToggle(arg_20_0.rtToggles:GetChild(var_20_1() - 1), true)
end

function var_0_0.setColorfulImage(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	arg_22_3 = defaultValue(arg_22_3, true)

	setImageSprite(arg_22_1, getImageSprite(arg_22_0.rtRes:Find(arg_22_1.name .. "/" .. arg_22_2)), arg_22_3)
end

function var_0_0.UpdatePanel(arg_23_0)
	local var_23_0 = nowWorld()
	local var_23_1 = arg_23_0.mapList[arg_23_0.destIndex]
	local var_23_2, var_23_3 = World.ReplacementMapType(arg_23_0.entrance, var_23_1)
	local var_23_4 = var_23_2 == "complete_chapter" and "safe" or WorldConst.GetMapIconState(var_23_1.config.entrance_ui)
	local var_23_5 = var_23_1:IsMapOpen()

	arg_23_0:setColorfulImage(arg_23_0.rtBasePoint, var_23_4)
	arg_23_0:setColorfulImage(arg_23_0.rtInfoPanel, var_23_4, false)

	local var_23_6 = GetSpriteFromAtlas("world/mapicon/" .. var_23_1.config.entrance_mapicon, "")

	setImageSprite(arg_23_0.rtInfoPanel:Find("icon"), var_23_6)
	arg_23_0:setColorfulImage(arg_23_0.btnBack, var_23_4)
	arg_23_0:setColorfulImage(arg_23_0.btnEnter, var_23_4)
	arg_23_0:setColorfulImage(arg_23_0.rtMarking, var_23_4)
	arg_23_0:setColorfulImage(arg_23_0.rtMarking:Find("mark_bg"), var_23_4)
	arg_23_0:setColorfulImage(arg_23_0.rtMaskMarking, var_23_4)
	arg_23_0:setColorfulImage(arg_23_0.rtMaskMarking:Find("mark_bg"), var_23_4)
	setText(arg_23_0.rtMarking:Find("Text"), var_23_3)
	setText(arg_23_0.rtMaskMarking:Find("Text"), var_23_3)
	setActive(arg_23_0.rtInfoPanel:Find("sairen"), var_23_2 == "sairen_chapter")
	setText(arg_23_0.rtInfoPanel:Find("sairen/Text"), i18n("area_yaosai_2"))
	setText(arg_23_0.rtInfoPanel:Find("danger_text"), var_23_5 and var_23_1:GetDanger() or "?")
	changeToScrollText(arg_23_0.rtInfoPanel:Find("title/name"), var_23_1:GetName(arg_23_0.entrance))

	local var_23_7, var_23_8, var_23_9 = var_23_0:CountAchievements(arg_23_0.entrance)

	setText(arg_23_0.rtInfoPanel:Find("title/achievement/number"), var_23_7 + var_23_8 .. "/" .. var_23_9)

	local var_23_10 = var_23_0:GetPressingAward(var_23_1.id)

	setActive(arg_23_0.rtInfoPanel:Find("pressing_award"), var_23_10 and var_23_10.flag)

	if var_23_10 and var_23_10.flag then
		arg_23_0.awardConfig = pg.world_event_complete[var_23_10.id].tips_icon

		arg_23_0.awardItemList:align(#arg_23_0.awardConfig)
	end

	arg_23_0:UpdateCost()
	arg_23_0:UpdateDelegate()

	local var_23_11 = nowWorld():GetAtlas()
	local var_23_12 = var_23_11:GetActiveMap()
	local var_23_13, var_23_14 = var_23_12:CkeckTransport()
	local var_23_15 = false
	local var_23_16 = getProxy(ChapterAutoProxy):HasTypeCommission(ChapterAutoProxy.TYPE.WORLD)

	setActive(arg_23_0.btnLock, var_23_16)

	if var_23_16 then
		setText(arg_23_0.btnLock:Find("Text"), i18n("world_auto_plan_in_progress"))
	end

	var_23_15 = var_23_15 or isActive(arg_23_0.btnLock)

	setActive(arg_23_0.btnBack, not var_23_15 and var_23_11:GetActiveEntrance() == arg_23_0.entrance and var_23_12 == var_23_1)

	var_23_15 = var_23_15 or isActive(arg_23_0.btnBack)

	setActive(arg_23_0.btnEnter, not var_23_15 and var_23_13 and var_23_5 and var_23_11.transportDic[arg_23_0.entrance.id])

	var_23_15 = var_23_15 or isActive(arg_23_0.btnEnter)

	if not var_23_16 then
		setText(arg_23_0.btnLock:Find("Text"), var_23_5 and i18n("world_map_locked_border") or i18n("world_map_locked_stage"))
		setActive(arg_23_0.btnLock, not var_23_15 and var_23_13)
	end

	var_23_15 = var_23_15 or isActive(arg_23_0.btnLock)

	setActive(arg_23_0.btnReturn, not var_23_15)

	local var_23_17

	var_23_17 = var_23_15 or isActive(arg_23_0.btnReturn)
end

function var_0_0.UpdateCost(arg_24_0)
	local var_24_0 = arg_24_0.mapList[arg_24_0.destIndex]
	local var_24_1 = arg_24_0.btnEnter:Find("cost")

	setActive(var_24_1, not var_24_0.isCost)

	local var_24_2 = nowWorld().staminaMgr:GetTotalStamina()
	local var_24_3 = var_24_0.config.enter_cost

	setText(var_24_1:Find("Text"), setColorStr(var_24_2, var_24_2 < var_24_3 and COLOR_RED or COLOR_GREEN) .. "/" .. var_24_3)
end

function var_0_0.UpdateDelegate(arg_25_0)
	local var_25_0 = nowWorld()

	if not var_25_0:IsSystemOpen(WorldConst.SystemAutoSwitch) then
		setActive(arg_25_0.btnDelegate, false)

		return
	end

	local var_25_1 = arg_25_0.mapList[arg_25_0.destIndex]
	local var_25_2 = pg.world_auto_statistics[var_25_1.id]

	setActive(arg_25_0.btnDelegate, var_25_2 and not var_25_1.isCost)
	setActive(arg_25_0.btnDelegate:Find("lock"), not var_25_0:GetGobalFlag("treasure_flag"))
end

function var_0_0.ShowToggleMask(arg_26_0)
	arg_26_0.isTweening = true

	setActive(arg_26_0.rtMarking, false)
	setActive(arg_26_0.rtSelectMask, true)
	setActive(arg_26_0.rtToggles, false)

	arg_26_0.rtMaskMarking.position = arg_26_0.rtMarking.position

	LeanTween.moveY(arg_26_0.rtMaskMarking, arg_26_0.rtMaskMarking.anchoredPosition.y + 150, 0.2):setOnComplete(System.Action(function()
		setActive(arg_26_0.rtToggles, true)

		arg_26_0.isTweening = false
	end))
	setActive(arg_26_0.btnSwitch, false)
end

function var_0_0.HideToggleMask(arg_28_0)
	arg_28_0.isTweening = true

	setActive(arg_28_0.rtToggles, false)

	arg_28_0.rtMaskMarking.position = arg_28_0.rtMarking.position

	setAnchoredPosition(arg_28_0.rtMaskMarking, {
		y = arg_28_0.rtMaskMarking.anchoredPosition.y + 150
	})
	LeanTween.moveY(arg_28_0.rtMaskMarking, arg_28_0.rtMaskMarking.anchoredPosition.y - 150, 0.2):setOnComplete(System.Action(function()
		setActive(arg_28_0.rtSelectMask, false)
		setActive(arg_28_0.rtMarking, true)

		arg_28_0.isTweening = false

		setActive(arg_28_0.btnSwitch, #arg_28_0.mapList > 1)
	end))
end

return var_0_0
