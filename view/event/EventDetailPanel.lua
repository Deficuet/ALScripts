EventConst = require("view/event/EventConst")

local var_0_0 = class("EventDetailPanel")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.go = arg_1_1
	arg_1_0.tr = arg_1_1.transform
	arg_1_0.dispatch = arg_1_2
	arg_1_0.btn = arg_1_0:findTF("btn").gameObject

	setText(findTF(arg_1_0.tr, "btn_recommend/text"), pg.gametip.event_ui_recommend.tip)
	setText(findTF(arg_1_0.tr, "btn_recommend_disable/text"), pg.gametip.event_ui_recommend.tip)
	setText(findTF(arg_1_0.tr, "consume/label"), pg.gametip.event_ui_consume.tip)
	setText(findTF(arg_1_0.tr, "btn/start/text"), pg.gametip.event_ui_start.tip)
	setText(findTF(arg_1_0.tr, "btn_disable/text"), pg.gametip.event_ui_start.tip)
	setText(findTF(arg_1_0.tr, "btn/giveup/text"), pg.gametip.event_ui_giveup.tip)
	setText(findTF(arg_1_0.tr, "btn/finish/text"), pg.gametip.event_ui_finish.tip)

	arg_1_0.conditions = findTF(arg_1_0.tr, "conditions")
	arg_1_0.condition1 = findTF(arg_1_0.conditions, "condition_1/mask/Text")
	arg_1_0.condition2 = findTF(arg_1_0.conditions, "condition_2/mask/Text")
	arg_1_0.condition3 = findTF(arg_1_0.conditions, "condition_3/mask/Text")
	arg_1_0.consume = arg_1_0:findTF("consume/Text")
	arg_1_0.leftShips = arg_1_0:findTF("frame/ship_contain_left")
	arg_1_0.rightShips = arg_1_0:findTF("frame/ship_contain_right")
	arg_1_0.disabeleBtn = arg_1_0:findTF("btn_disable").gameObject
	arg_1_0.recommentBtn = arg_1_0:findTF("btn_recommend")
	arg_1_0.recommentDisable = arg_1_0:findTF("btn_recommend_disable")
	arg_1_0.usePrevFormationBtn = arg_1_0:findTF("use_prev_formation")
	arg_1_0.shipItems = {}

	eachChild(arg_1_0.leftShips, function(arg_2_0)
		table.insert(arg_1_0.shipItems, 1, arg_2_0)
	end)
	eachChild(arg_1_0.rightShips, function(arg_3_0)
		table.insert(arg_1_0.shipItems, 4, arg_3_0)
	end)
	onButton(arg_1_0, arg_1_0.btn, function()
		arg_1_0:onFuncClick()
	end, SFX_PANEL)
	onButton(arg_1_0, arg_1_0.recommentBtn, function()
		local var_5_0 = getProxy(BayProxy)
		local var_5_1 = var_5_0:getDelegationRecommendShips(arg_1_0.event)

		if #var_5_1 > 0 then
			table.insertto(arg_1_0.event.shipIds, var_5_1)
			arg_1_0:Flush()
		else
			local var_5_2 = var_5_0:getDelegationRecommendShipsLV1(arg_1_0.event)

			if #var_5_2 > 0 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("event_recommend_level1"),
					onYes = function()
						table.insertto(arg_1_0.event.shipIds, var_5_2)
						arg_1_0:Flush()
					end
				})
			elseif not arg_1_0.event:reachNum() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("event_recommend_fail"))
			end
		end
	end)
	onButton(arg_1_0, arg_1_0.usePrevFormationBtn, function()
		arg_1_0:UsePrevFormation()
	end, SFX_PANEL)
end

function var_0_0.Update(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.index = arg_8_1
	arg_8_0.event = arg_8_2

	arg_8_0:Flush()
end

function var_0_0.UsePrevFormation(arg_9_0)
	if arg_9_0.event and arg_9_0.event:ExistPrevFormation() then
		local var_9_0 = arg_9_0.event:GetPrevFormation()
		local var_9_1 = {}
		local var_9_2 = false
		local var_9_3 = false

		for iter_9_0, iter_9_1 in ipairs(getProxy(BayProxy):getShipList(var_9_0)) do
			if iter_9_1 then
				local var_9_4, var_9_5 = ShipStatus.ShipStatusConflict("inEvent", iter_9_1)

				if var_9_4 == ShipStatus.STATE_CHANGE_FAIL then
					var_9_2 = true
				elseif var_9_4 == ShipStatus.STATE_CHANGE_CHECK then
					var_9_3 = true
				else
					table.insert(var_9_1, iter_9_1.id)
				end
			end
		end

		if var_9_2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("collect_tip"))
		end

		if var_9_3 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("collect_tip2"))
		end

		arg_9_0.event:setShipIds(var_9_1)
		arg_9_0:Flush()
	end
end

function var_0_0.Flush(arg_10_0)
	setActive(arg_10_0.usePrevFormationBtn, arg_10_0.event:ExistPrevFormation() and arg_10_0.event:GetState() == EventInfo.StateNone and arg_10_0.event:CanRecordPrevFormation())
	eachChild(arg_10_0.btn, function(arg_11_0)
		local var_11_0 = arg_10_0.event:GetState()

		if var_11_0 == EventInfo.StateNone and arg_11_0.name == "start" then
			SetActive(arg_11_0, true)
		elseif var_11_0 == EventInfo.StateActive and arg_11_0.name == "giveup" then
			SetActive(arg_11_0, true)
		elseif var_11_0 == EventInfo.StateFinish and arg_11_0.name == "finish" then
			SetActive(arg_11_0, true)
		else
			SetActive(arg_11_0, false)
		end
	end)

	local var_10_0 = arg_10_0.event:reachLevel()
	local var_10_1 = arg_10_0.event:reachNum()
	local var_10_2 = arg_10_0.event:reachTypes()

	SetActive(arg_10_0.disabeleBtn, not var_10_0 or not var_10_1 or not var_10_2)

	local var_10_3 = arg_10_0.event:getShipList()
	local var_10_4 = arg_10_0.event.template
	local var_10_5 = arg_10_0:setConditionStr(i18n("event_condition_ship_level", var_10_4.ship_lv), var_10_0)

	setScrollText(arg_10_0.condition1, var_10_5)
	setActive(findTF(arg_10_0.conditions, "condition_1/mark"), var_10_0)
	setActive(findTF(arg_10_0.conditions, "condition_1/mark1"), not var_10_0)

	local var_10_6 = arg_10_0:setConditionStr(i18n("event_condition_ship_count", var_10_4.ship_num), var_10_1)

	setScrollText(arg_10_0.condition2, var_10_6)
	setActive(findTF(arg_10_0.conditions, "condition_2/mark"), var_10_1)
	setActive(findTF(arg_10_0.conditions, "condition_2/mark1"), not var_10_1)

	local var_10_7 = arg_10_0.event:getTypesStr()
	local var_10_8 = arg_10_0:setConditionStr(var_10_7, var_10_2)

	setScrollText(arg_10_0.condition3, var_10_8)
	setActive(findTF(arg_10_0.conditions, "condition_3/mark"), var_10_2)
	setActive(findTF(arg_10_0.conditions, "condition_3/mark1"), not var_10_2)
	setText(arg_10_0.consume, arg_10_0.event:getOilConsume())

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.shipItems) do
		local var_10_9 = iter_10_1:Find("shiptpl")
		local var_10_10 = iter_10_1:Find("emptytpl")
		local var_10_11 = iter_10_0 <= #var_10_3

		SetActive(var_10_9, var_10_11)
		SetActive(var_10_10, not var_10_11)

		if var_10_11 then
			updateShip(var_10_9, var_10_3[iter_10_0], {
				initStar = true
			})
			setText(findTF(var_10_9, "icon_bg/lv/Text"), var_10_3[iter_10_0].level)
			onButton(arg_10_0, var_10_9:Find("icon_bg"), function()
				arg_10_0:onRemoveClick(iter_10_0)
			end, SFX_PANEL)
		else
			onButton(arg_10_0, var_10_10, function()
				arg_10_0:onChangeClick()
			end)
		end
	end

	if arg_10_0.event:GetState() == EventInfo.StateNone then
		SetActive(arg_10_0.recommentBtn, true)
		SetActive(arg_10_0.recommentDisable, false)
	else
		SetActive(arg_10_0.recommentBtn, false)
		SetActive(arg_10_0.recommentDisable, true)
	end
end

function var_0_0.setConditionStr(arg_14_0, arg_14_1, arg_14_2)
	return arg_14_2 and setColorStr(arg_14_1, COLOR_YELLOW) or setColorStr(arg_14_1, "#F35842FF")
end

function var_0_0.Clear(arg_15_0)
	pg.DelegateInfo.Dispose(arg_15_0)
end

function var_0_0.onChangeClick(arg_16_0)
	if arg_16_0.event:GetState() == EventInfo.StateNone then
		arg_16_0.dispatch(EventConst.EVENT_OPEN_DOCK, arg_16_0.event)
	end
end

function var_0_0.onRemoveClick(arg_17_0, arg_17_1)
	if arg_17_0.event:GetState() == EventInfo.StateNone then
		table.remove(arg_17_0.event.shipIds, arg_17_1)
		arg_17_0:Flush()
	end
end

function var_0_0.onFuncClick(arg_18_0)
	local var_18_0 = arg_18_0.event:GetState()

	if var_18_0 == EventInfo.StateNone then
		arg_18_0.dispatch(EventConst.EVENT_START, arg_18_0.event)
	elseif var_18_0 == EventInfo.StateActive then
		arg_18_0.dispatch(EventConst.EVENT_GIVEUP, arg_18_0.event)
	elseif var_18_0 == EventInfo.StateFinish then
		arg_18_0.dispatch(EventConst.EVENT_FINISH, arg_18_0.event)
	end
end

function var_0_0.findTF(arg_19_0, arg_19_1)
	return findTF(arg_19_0.tr, arg_19_1)
end

return var_0_0
