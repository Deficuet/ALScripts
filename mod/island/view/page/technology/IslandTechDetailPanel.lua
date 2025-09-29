local var_0_0 = class("IslandTechDetailPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTechDetailPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.selectedTF = arg_2_0._tf:Find("selected")
	arg_2_0.panel = arg_2_0._tf:Find("panel")
	arg_2_0.iconTF = arg_2_0.panel:Find("icon_bg/icon")
	arg_2_0.nameTF = arg_2_0.panel:Find("title/Text")
	arg_2_0.descPanel = arg_2_0.panel:Find("desc")
	arg_2_0.descTF = arg_2_0.descPanel:Find("Text")
	arg_2_0.unlockTF = arg_2_0.panel:Find("unlock")

	setText(arg_2_0.unlockTF:Find("title"), i18n("island_tech_unlock_need"))

	arg_2_0.unlockUIList = UIItemList.New(arg_2_0.unlockTF:Find("list"), arg_2_0.unlockTF:Find("list/tpl"))
	arg_2_0.normalTimeTextTF = arg_2_0.panel:Find("status/normal/content/time/Text")
	arg_2_0.timeTextTF = arg_2_0.panel:Find("status/studying/time/Text")

	local var_2_0 = arg_2_0.panel:Find("status")

	setText(var_2_0:Find("lock/content/Text"), i18n("island_tech_unlock_dev"))
	setText(var_2_0:Find("unlock/Text"), i18n("island_tech_unlock_dev"))
	setText(var_2_0:Find("normal/content/Text"), i18n("island_tech_dev_start"))
	setText(var_2_0:Find("normal/cost/title"), i18n("island_tech_dev_cost"))
	setText(var_2_0:Find("studying/Text"), i18n("island_tech_dev_starting"))
	setText(var_2_0:Find("receive/Text"), i18n("island_tech_dev_success"))
	setText(var_2_0:Find("finished/Text"), i18n("island_tech_dev_finish"))

	arg_2_0.statusTFs = {
		[IslandTechnology.STATUS.LOCK] = var_2_0:Find("lock"),
		[IslandTechnology.STATUS.UNLOCK] = var_2_0:Find("unlock"),
		[IslandTechnology.STATUS.NORMAL] = var_2_0:Find("normal"),
		[IslandTechnology.STATUS.STUDYING] = var_2_0:Find("studying"),
		[IslandTechnology.STATUS.RECEIVE] = var_2_0:Find("receive"),
		[IslandTechnology.STATUS.FINISHED] = var_2_0:Find("finished")
	}
	arg_2_0.costTF = arg_2_0.panel:Find("status/normal/cost")
	arg_2_0.costUIList = UIItemList.New(arg_2_0.costTF:Find("list"), arg_2_0.costTF:Find("list/tpl"))

	setText(arg_2_0._tf:Find("panel/desc/name"), i18n("island_tech_detail_desctitle"))
	setText(arg_2_0._tf:Find("panel/unlock/title"), i18n("island_tech_detail_unlocktitle"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("close"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0.unlockUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = arg_3_0.unlockCondList[arg_5_1 + 1]

			setText(arg_5_2:Find("Text"), IslandTechnology.GetUnlockText(var_5_0))

			local var_5_1 = arg_3_0.showTechVO:MatchCondition(var_5_0) and "1E90FF" or "F5F5F5"

			setTextColor(arg_5_2:Find("Text"), Color.NewHex(var_5_1))
			setImageColor(arg_5_2:Find("dot"), Color.NewHex(var_5_1))
		end
	end)
	arg_3_0.costUIList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = arg_3_0.costList[arg_6_1 + 1]
			local var_6_1 = arg_3_0.inventoryAgency:GetOwnCount(var_6_0.id)

			updateCustomDrop(arg_6_2, var_6_0)

			local var_6_2 = arg_6_2:Find("icon_bg/count_bg/count")

			if var_6_0.id == IslandItem.GOLD_ID then
				setText(var_6_2, var_6_1 < var_6_0.count and setColorStr(var_6_0.count, "#FF6767"))
			else
				setText(var_6_2, (var_6_1 < var_6_0.count and setColorStr(var_6_1, "#FF6767") or var_6_1) .. "/" .. var_6_0.count)
			end
		end
	end)

	arg_3_0.placeId = IslandTechnologyAgency.PLACE_ID
	arg_3_0.baseEffectSpeed = pg.island_set.base_efficiency.key_value_int
end

function var_0_0.Flush(arg_7_0)
	arg_7_0:StopTimer()

	local var_7_0 = getProxy(IslandProxy):GetIsland()

	arg_7_0.buildingAgency = var_7_0:GetBuildingAgency()
	arg_7_0.techAgency = var_7_0:GetTechnologyAgency()
	arg_7_0.inventoryAgency = var_7_0:GetInventoryAgency()
	arg_7_0.showTechVO = arg_7_0.techAgency:GetTechnology(arg_7_0.configId)

	LoadImageSpriteAsync("island/IslandTechnology/" .. arg_7_0.showTechVO:getConfig("tech_icon"), arg_7_0.iconTF, true)
	setText(arg_7_0.nameTF, arg_7_0.showTechVO:getConfig("tech_name"))
	setText(arg_7_0.descTF, arg_7_0.showTechVO:getConfig("tech_desc"))

	local var_7_1 = arg_7_0.showTechVO:GetFormulaId()
	local var_7_2 = math.floor(pg.island_formula[var_7_1].workload / arg_7_0.baseEffectSpeed)

	setText(arg_7_0.normalTimeTextTF, arg_7_0.timeMgr:DescCDTime(var_7_2))

	arg_7_0.unlockCondList = Clone(arg_7_0.showTechVO:getConfig("sys_unlock"))

	local var_7_3 = arg_7_0.showTechVO:getConfig("island_level")

	if var_7_3 ~= 0 then
		table.insert(arg_7_0.unlockCondList, 1, {
			0,
			var_7_3
		})
	end

	arg_7_0.unlockUIList:align(#arg_7_0.unlockCondList)

	local var_7_4 = arg_7_0.showTechVO:GetStatus()

	for iter_7_0, iter_7_1 in pairs(arg_7_0.statusTFs) do
		setActive(iter_7_1, iter_7_0 == var_7_4)
	end

	local var_7_5 = var_7_4 == IslandTechnology.STATUS.LOCK or var_7_4 == IslandTechnology.STATUS.UNLOCK

	setActive(arg_7_0.unlockTF, var_7_5)
	setActive(arg_7_0.descPanel, not var_7_5)

	arg_7_0.costList = arg_7_0.showTechVO:GetCostItems()

	arg_7_0.costUIList:align(#arg_7_0.costList)
	switch(var_7_4, {
		[IslandTechnology.STATUS.LOCK] = function()
			onButton(arg_7_0, arg_7_0.statusTFs[var_7_4], function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("island_tech_unlock_tip"))
			end, SFX_PANEL)
		end,
		[IslandTechnology.STATUS.UNLOCK] = function()
			onButton(arg_7_0, arg_7_0.statusTFs[var_7_4], function()
				arg_7_0:emit(IslandMediator.ON_UNLOCK_TECH, arg_7_0.showTechVO.id)
			end, SFX_PANEL)
		end,
		[IslandTechnology.STATUS.NORMAL] = function()
			setGray(arg_7_0.statusTFs[var_7_4], not arg_7_0:CheckCost(), false)
			onButton(arg_7_0, arg_7_0.statusTFs[var_7_4], function()
				if not arg_7_0:CheckCost() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_cost_notenough"))

					return
				end

				if not arg_7_0.techAgency:GetEmptySlotId() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_tech_no_slot"))

					return
				end

				if arg_7_0.showTechVO:IsAutoType() then
					existCall(arg_7_0.contextData.onFinishImmd, arg_7_0.showTechVO.id)
				else
					existCall(arg_7_0.contextData.onSelecteShip)
				end
			end, SFX_PANEL)
		end,
		[IslandTechnology.STATUS.STUDYING] = function()
			onButton(arg_7_0, arg_7_0.statusTFs[var_7_4]:Find("ticket"), function()
				existCall(arg_7_0.contextData.openTicketPage, arg_7_0.showTechVO:GetSlotId())
			end, SFX_PANEL)
		end,
		[IslandTechnology.STATUS.RECEIVE] = function()
			onButton(arg_7_0, arg_7_0.statusTFs[var_7_4], function()
				arg_7_0:emit(IslandMediator.GET_DELEGATION_AWARD, arg_7_0.placeId, arg_7_0.showTechVO:GetSlotId(), 2, function()
					existCall(arg_7_0.contextData.onGetAwardDone, arg_7_0.showTechVO.id)
				end)
			end, SFX_PANEL)
		end
	}, function()
		return
	end)
	arg_7_0:StartTimer()
	arg_7_0:UpdateTime()
	setActive(arg_7_0.selectedTF, arg_7_0.selectedItemPos)

	if arg_7_0.selectedItemPos then
		arg_7_0:FlushSelectedItem()
	end
end

function var_0_0.CheckCost(arg_20_0)
	return underscore.all(arg_20_0.costList or {}, function(arg_21_0)
		return arg_20_0.inventoryAgency:GetOwnCount(arg_21_0.id) >= arg_21_0.count
	end)
end

function var_0_0.FlushSelectedItem(arg_22_0)
	setAnchoredPosition(arg_22_0.selectedTF, arg_22_0.selectedItemPos)
	setActive(arg_22_0.selectedTF:Find("selected"), true)

	arg_22_0.selectedTF.name = arg_22_0.configId

	local var_22_0 = arg_22_0.techAgency:GetTechnology(arg_22_0.configId)

	IslandTechTreePanel.SetTechName(arg_22_0.selectedTF:Find("name"), var_22_0:getConfig("tech_name"))

	local var_22_1 = var_22_0:GetStatus()
	local var_22_2 = var_22_1 == IslandTechnology.STATUS.FINISHED

	setTextColor(arg_22_0.selectedTF:Find("name/Text"), Color.NewHex(var_22_2 and "1b3650" or "ffffff"))
	setTextColor(arg_22_0.selectedTF:Find("name/ScrollText"), Color.NewHex(var_22_2 and "1b3650" or "ffffff"))
	LoadImageSpriteAsync("island/IslandTechnology/" .. var_22_0:getConfig("tech_icon"), arg_22_0.selectedTF:Find("icon"), true)
	setActive(arg_22_0.selectedTF:Find("icon"), var_22_1 ~= IslandTechnology.STATUS.STUDYING and var_22_1 ~= IslandTechnology.STATUS.RECEIVE)
	setImageColor(arg_22_0.selectedTF:Find("icon"), Color.NewHex(var_22_2 and "455a81" or "ffffff"))
	eachChild(arg_22_0.selectedTF:Find("back"), function(arg_23_0)
		setActive(arg_23_0, arg_23_0.name == var_22_1)
	end)
	setActive(arg_22_0.selectedTF:Find("back/normal"), not var_22_2 and var_22_1 ~= IslandTechnology.STATUS.STUDYING)
	eachChild(arg_22_0.selectedTF:Find("front"), function(arg_24_0)
		setActive(arg_24_0, arg_24_0.name == var_22_1)
	end)
end

function var_0_0.Show(arg_25_0, arg_25_1, arg_25_2)
	var_0_0.super.Show(arg_25_0)

	arg_25_0.configId = arg_25_1
	arg_25_0.timeMgr = pg.TimeMgr.GetInstance()
	arg_25_0.selectedItemPos = arg_25_2

	arg_25_0:Flush()
	arg_25_0:OverlayPanel(arg_25_0._tf)
end

function var_0_0.OnShipSelected(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.techAgency:GetEmptySlotId()
	local var_26_1 = arg_26_0.showTechVO:GetFormulaId()

	arg_26_0:emit(IslandMediator.START_DELEGATION, arg_26_0.placeId, var_26_0, arg_26_1, var_26_1, 1)
end

function var_0_0.UpdateTime(arg_27_0)
	local var_27_0 = arg_27_0.showTechVO:GetStatus()
	local var_27_1 = arg_27_0.buildingAgency:GetDelegationSlotDataByTechId(arg_27_0.showTechVO.id)

	if var_27_1 then
		if var_27_1:GetSlotRewardData() then
			setText(arg_27_0.timeTextTF, "00:00:00")
		else
			local var_27_2 = var_27_1:GetSlotRoleData():GetFinishTime() - arg_27_0.timeMgr:GetServerTime()

			setText(arg_27_0.timeTextTF, var_27_2 > 0 and arg_27_0.timeMgr:DescCDTime(var_27_2) or "00:00:00")
		end
	else
		setText(arg_27_0.timeTextTF, "??:??:??")
	end
end

function var_0_0.StartTimer(arg_28_0)
	arg_28_0.timer = Timer.New(function()
		arg_28_0:UpdateTime()
	end, 1, -1)

	arg_28_0.timer:Start()
end

function var_0_0.StopTimer(arg_30_0)
	if arg_30_0.timer ~= nil then
		arg_30_0.timer:Stop()

		arg_30_0.timer = nil
	end
end

function var_0_0.OnHide(arg_31_0)
	arg_31_0:StopTimer()
	arg_31_0:UnOverlayPanel(arg_31_0._tf, arg_31_0._parentTf)
end

function var_0_0.OnDestroy(arg_32_0)
	arg_32_0:StopTimer()
	arg_32_0:UnOverlayPanel(arg_32_0._tf, arg_32_0._parentTf)
end

return var_0_0
