local var_0_0 = class("IslandTechQuickPanel", import("view.base.BaseSubView"))

var_0_0.TOGGLE_STATUS = {
	FINISHED = "finished",
	STUDYING = "studying",
	NORMAL = "normal"
}

function var_0_0.getUIName(arg_1_0)
	return "IslandTechQuickPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.toggle = arg_2_0._tf:Find("toggle")
	arg_2_0.panel = arg_2_0._tf:Find("panel")

	local var_2_0 = arg_2_0.panel:Find("content")

	arg_2_0.uiList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	setText(var_2_0:Find("tpl/content/get/Image/Text"), i18n("island_tech_can_get"))
	setText(arg_2_0.toggle:Find("normal/Text"), i18n("island_tech_nodev"))
	setText(arg_2_0.toggle:Find("studying/Text"), i18n("island_tech_dev_starting"))
	setText(arg_2_0.toggle:Find("finished/Text"), i18n("island_tech_dev_finish_1"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.slotIds = IslandTechnologyAgency.GetSlotIds()

	arg_3_0.uiList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateItem(arg_4_1, arg_4_2)
		end
	end)

	arg_3_0.timeMgr = pg.TimeMgr.GetInstance()

	onButton(arg_3_0, arg_3_0._tf:Find("off"), function()
		triggerToggle(arg_3_0.toggle, false)
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0.toggle, function(arg_6_0)
		if arg_6_0 then
			pg.UIMgr.GetInstance():OverlayPanelPB(arg_3_0._tf, {
				pbList = {
					arg_3_0.panel
				},
				groupName = LayerWeightConst.GROUP_ISLAND
			})
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_3_0._tf, arg_3_0._parentTf)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.slotIds[arg_7_1 + 1]
	local var_7_1 = arg_7_0.buildingData:GetDelegationSlotData(var_7_0)
	local var_7_2 = var_7_1 and var_7_1:GetFormulaId()

	setActive(arg_7_2:Find("lock"), not var_7_1)
	setActive(arg_7_2:Find("empty"), var_7_1 and not var_7_2)
	setActive(arg_7_2:Find("content"), var_7_2)

	if var_7_2 then
		local var_7_3 = arg_7_2:Find("content")
		local var_7_4 = arg_7_0.technologyAgency:GetTechnologyByFormulaId(var_7_2)

		setText(var_7_3:Find("title"), var_7_4:getConfig("tech_name"))

		local var_7_5 = var_7_1:GetSlotRoleData()

		setActive(var_7_3:Find("icon_bg"), var_7_5)

		if var_7_5 then
			local var_7_6 = IslandShip.StaticGetPrefab(var_7_5.ship_id)

			GetImageSpriteFromAtlasAsync("squareicon/" .. var_7_6, "", var_7_3:Find("icon_bg/mask/icon"))

			local var_7_7 = var_7_5:GetFinishTime() - arg_7_0.timeMgr:GetServerTime()

			setSlider(var_7_3:Find("silder"), 0, 1, 1 - var_7_7 / var_7_5:GetAllTime())
			setText(var_7_3:Find("silder/Text"), arg_7_0.timeMgr:DescCDTime(var_7_7))
		end

		local var_7_8 = var_7_1:GetSlotRewardData()

		setActive(var_7_3:Find("get"), var_7_8)
		setActive(var_7_3:Find("silder"), not var_7_8)
	end
end

function var_0_0.Flush(arg_8_0)
	arg_8_0:StopTimer()

	local var_8_0 = getProxy(IslandProxy):GetIsland()

	arg_8_0.technologyAgency = var_8_0:GetTechnologyAgency()
	arg_8_0.buildingData = var_8_0:GetBuildingAgency():GetBuilding(IslandTechnologyAgency.PLACE_ID)

	arg_8_0.uiList:align(#arg_8_0.slotIds)
	arg_8_0:StartTimer()
	arg_8_0:UpdateTime()
end

function var_0_0.GetToggleStatus(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.slotIds) do
		local var_9_0 = arg_9_0.buildingData:GetDelegationSlotData(iter_9_1)

		if var_9_0 and var_9_0:GetSlotRewardData() then
			return var_0_0.TOGGLE_STATUS.FINISHED
		end

		if var_9_0 and var_9_0:GetSlotRoleData() then
			return var_0_0.TOGGLE_STATUS.STUDYING
		end
	end

	return var_0_0.TOGGLE_STATUS.NORMAL
end

function var_0_0.UpdateToggleStatus(arg_10_0)
	eachChild(arg_10_0.toggle, function(arg_11_0)
		setActive(arg_11_0, arg_11_0.name == arg_10_0.status)
	end)
end

function var_0_0.QuickGetAward(arg_12_0)
	local var_12_0 = underscore.detect(arg_12_0.slotIds, function(arg_13_0)
		local var_13_0 = arg_12_0.buildingData:GetDelegationSlotData(arg_13_0)

		return var_13_0 and var_13_0:GetSlotRewardData()
	end)
	local var_12_1 = arg_12_0.buildingData:GetDelegationSlotData(var_12_0):GetSlotRewardData().formula_id
	local var_12_2 = arg_12_0.technologyAgency:GetTechnologyByFormulaId(var_12_1).id

	arg_12_0:emit(IslandMediator.GET_DELEGATION_AWARD, IslandTechnologyAgency.PLACE_ID, var_12_0, 2, function()
		existCall(arg_12_0.contextData.onGetAwardDone, var_12_2)
	end)
end

function var_0_0.UpdateTime(arg_15_0)
	arg_15_0.status = arg_15_0:GetToggleStatus()

	arg_15_0.uiList:eachActive(function(arg_16_0, arg_16_1)
		local var_16_0 = arg_15_0.slotIds[arg_16_0 + 1]
		local var_16_1 = arg_15_0.buildingData:GetDelegationSlotData(var_16_0)

		if var_16_1 and var_16_1:GetFormulaId() then
			local var_16_2 = arg_16_1:Find("content")
			local var_16_3 = var_16_1:GetSlotRoleData()

			setActive(var_16_2:Find("icon_bg"), var_16_3)

			if var_16_3 then
				local var_16_4 = var_16_3:GetFinishTime() - arg_15_0.timeMgr:GetServerTime()

				setSlider(var_16_2:Find("silder"), 0, 1, 1 - var_16_4 / var_16_3:GetAllTime())
				setText(var_16_2:Find("silder/Text"), arg_15_0.timeMgr:DescCDTime(var_16_4))
			end

			local var_16_5 = var_16_1:GetSlotRewardData()

			setActive(var_16_2:Find("get"), var_16_5)
			setActive(var_16_2:Find("silder"), not var_16_5)
			onButton(arg_15_0, arg_16_1, function()
				if not var_16_5 then
					return
				end

				arg_15_0:QuickGetAward()
			end, SFX_PANEL)
		else
			removeOnButton(arg_16_1)
		end
	end)
	arg_15_0:UpdateToggleStatus()
end

function var_0_0.StartTimer(arg_18_0)
	arg_18_0.timer = Timer.New(function()
		arg_18_0:UpdateTime()
	end, 1, -1)

	arg_18_0.timer:Start()
end

function var_0_0.StopTimer(arg_20_0)
	if arg_20_0.timer ~= nil then
		arg_20_0.timer:Stop()

		arg_20_0.timer = nil
	end
end

function var_0_0.OffToggle(arg_21_0)
	triggerToggle(arg_21_0.toggle, false)
end

function var_0_0.Hide(arg_22_0)
	arg_22_0:OffToggle()
	var_0_0.super.Hide(arg_22_0)
end

function var_0_0.OnDestroy(arg_23_0)
	arg_23_0:StopTimer()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_23_0._tf, arg_23_0._parentTf)
end

return var_0_0
