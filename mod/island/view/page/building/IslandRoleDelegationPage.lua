local var_0_0 = class("IslandRoleDelegationPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandRoleDelegationUI"
end

local var_0_1 = 0.5

function var_0_0.AddListeners(arg_2_0)
	arg_2_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_2_0.OnGetDelegationAwardDone)
	arg_2_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_2_0.OnFinishDelegationDone)
	arg_2_0:AddListener(GAME.ISLAND_USESPEEDUPCARD_DONE, arg_2_0.OnUseSpeedupCardDone)
	arg_2_0:AddListener(GAME.ISLAND_START_DELEGATION_DONE, arg_2_0.OnDelegationStartDone)
end

function var_0_0.RemoveListeners(arg_3_0)
	arg_3_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_3_0.OnGetDelegationAwardDone)
	arg_3_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_3_0.OnFinishDelegationDone)
	arg_3_0:RemoveListener(GAME.ISLAND_USESPEEDUPCARD_DONE, arg_3_0.OnUseSpeedupCardDone)
	arg_3_0:RemoveListener(GAME.ISLAND_START_DELEGATION_DONE, arg_3_0.OnDelegationStartDone)
end

local var_0_2 = Vector3(0, 0, 0)

function var_0_0.OnLoaded(arg_4_0)
	arg_4_0.backBtn = arg_4_0:findTF("top/back")
	arg_4_0.title = arg_4_0:findTF("top/title")
	arg_4_0.content = arg_4_0._tf:Find("content")
	arg_4_0.selectInfo = arg_4_0._tf:Find("selectInfo")
	arg_4_0.slotName = arg_4_0.selectInfo:Find("slotName")
	arg_4_0.normalTitle = arg_4_0.selectInfo:Find("title")
	arg_4_0.finishTitle = arg_4_0.selectInfo:Find("finishTitle")
	arg_4_0.unlockSlot = arg_4_0.selectInfo:Find("unlock")
	arg_4_0.lockSlot = arg_4_0.selectInfo:Find("lock")
	arg_4_0.emptyShip = arg_4_0.unlockSlot:Find("unselctShip")
	arg_4_0.process = arg_4_0.unlockSlot:Find("process")
	arg_4_0.finish = arg_4_0.unlockSlot:Find("finish")
	arg_4_0.finishFurmalaIcon = arg_4_0.finish:Find("formula/curformula")
	arg_4_0.selectFormula = arg_4_0.process:Find("selectFormula")
	arg_4_0.inprocess = arg_4_0.process:Find("inprocess")
	arg_4_0.currentFormula = arg_4_0.inprocess:Find("formula")
	arg_4_0.currentFormulaIcon = arg_4_0.currentFormula:Find("curformula")
	arg_4_0.formulaProcess = arg_4_0.currentFormula:Find("process"):GetComponent(typeof(Image))
	arg_4_0.inproduction = arg_4_0.inprocess:Find("inproduction")
	arg_4_0.stopBtn = arg_4_0.unlockSlot:Find("btns/stop")
	arg_4_0.getBtn = arg_4_0.unlockSlot:Find("btns/get")
	arg_4_0.emptyBtn = arg_4_0.unlockSlot:Find("btns/empty")
	arg_4_0.speedupBtn = arg_4_0.inproduction:Find("quick")

	setActive(arg_4_0.speedupBtn, false)

	arg_4_0.canRewardIcon = arg_4_0.getBtn:Find("hasicon")
	arg_4_0.canRewardNum = arg_4_0.getBtn:Find("hasicon/num")
	arg_4_0.timeTF = arg_4_0.inproduction:Find("time/Text")
	arg_4_0.roleDelegationSliderTF = arg_4_0.inproduction:Find("time/time_bar")
	arg_4_0.delegationList = UIItemList.New(arg_4_0.content, arg_4_0.content:Find("tpl"))

	arg_4_0.delegationList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventInit then
			arg_4_0:InitDelegationItem(arg_5_1, arg_5_2)
		elseif arg_5_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateDelegationItem(arg_5_1, arg_5_2)
		end
	end)

	arg_4_0.leftcontent = arg_4_0._tf:Find("left/left_content")
	arg_4_0.delegationTabList = UIItemList.New(arg_4_0.leftcontent, arg_4_0.leftcontent:Find("tpl"))

	arg_4_0.delegationTabList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventInit then
			arg_4_0:InitDelegationTabItem(arg_6_1, arg_6_2)
		elseif arg_6_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateDelegationTabItem(arg_6_1, arg_6_2)
		end
	end)

	arg_4_0.selectShip = arg_4_0.process:Find("ship/selectShip")
	arg_4_0.energySliderTF = arg_4_0.selectShip:Find("energy/energy_bar")
	arg_4_0.energyTFText = arg_4_0.selectShip:Find("energy/Text")
	arg_4_0.seletShipName = arg_4_0.selectShip:Find("name")
	arg_4_0.shipDetailsBtn = arg_4_0.process:Find("ship/details")
	arg_4_0.shipDetails = arg_4_0:findTF("shipDetails")
	arg_4_0.shipSkillDetails = arg_4_0.shipDetails:Find("skill")
	arg_4_0.shipSkillEmp = arg_4_0.shipDetails:Find("skillEmp")
	arg_4_0.shipSkillEmpDes = arg_4_0.shipDetails:Find("skillEmp/Text")
	arg_4_0.shipDetailsIcon = arg_4_0.shipSkillDetails:Find("icon")
	arg_4_0.shipDetailsName = arg_4_0.shipSkillDetails:Find("name"):GetComponent(typeof(Text))
	arg_4_0.shipDetailsDes = arg_4_0.shipSkillDetails:Find("desc/Text"):GetComponent(typeof(Text))
	arg_4_0.selectShipButton = arg_4_0.selectShip:Find("selectShipButton")
	arg_4_0.shipDetailBack = arg_4_0.shipDetails:Find("back")
	arg_4_0.shipIconTF = arg_4_0.selectShip:Find("icon_mask/icon")
	arg_4_0.exp_getTf = arg_4_0.selectShip:Find("exp_get")

	setActive(arg_4_0.exp_getTf, false)
end

function var_0_0.OnInit(arg_7_0)
	arg_7_0:InitPlaceCfg()
	onButton(arg_7_0, arg_7_0.backBtn, function()
		arg_7_0:Hide()
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
	end, SFX_PANEL)

	local function var_7_0()
		local var_9_0 = arg_7_0.placeCommissionList[arg_7_0.selectedIdx]
		local var_9_1 = pg.island_production_commission[var_9_0].slot
		local var_9_2 = pg.island_production_slot[var_9_1].attribute

		arg_7_0:Disable()
		arg_7_0:OpenPage(IslandShipSelectPage, 1, {}, var_9_2, function(arg_10_0)
			arg_7_0:AfterShipSelect(arg_10_0[1])
		end, function()
			arg_7_0:Enable()
		end, {
			place_Id = arg_7_0.place_Id
		})
	end

	onButton(arg_7_0, arg_7_0.emptyShip, function()
		var_7_0()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.selectFormula, function()
		local var_13_0 = arg_7_0.placeCommissionList[arg_7_0.selectedIdx]

		arg_7_0:Disable()
		arg_7_0:OpenPage(IslandFormulaSelectPage, var_13_0, arg_7_0.place_Id, arg_7_0.selectedShip, function()
			arg_7_0:Enable()
		end)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.stopBtn, function()
		local var_15_0 = arg_7_0.placeCommissionList[arg_7_0.selectedIdx]
		local var_15_1 = pg.island_production_commission[var_15_0].slot

		arg_7_0:emit(IslandMediator.STOP_DELEGATION, arg_7_0.place_Id, var_15_1)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.speedupBtn, function()
		local var_16_0 = arg_7_0.placeCommissionList[arg_7_0.selectedIdx]
		local var_16_1 = pg.island_production_commission[var_16_0].slot

		arg_7_0:emit(IslandMediator.USE_SPEEDUPCARD, arg_7_0.place_Id, var_16_1, 0, 1)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.selectShipButton, function()
		var_7_0()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.shipDetailsBtn, function()
		setActive(arg_7_0.shipDetails, true)

		local var_18_0 = arg_7_0.selectedShipInfo:GetSkill()
		local var_18_1 = var_18_0:IsUnlock()

		setActive(arg_7_0.shipSkillDetails, var_18_1)
		setActive(arg_7_0.shipSkillEmp, not var_18_1)
		setText(arg_7_0.shipSkillEmpDes, i18n("island_need_star", arg_7_0.selectedShipInfo:GetSkillUnlockLevel()))
		GetImageSpriteFromAtlasAsync("island/IslandSkillIcon/" .. var_18_0:GetIcon(), "", arg_7_0.shipDetailsIcon)

		arg_7_0.shipDetailsName.text = string.format("%s - %s", var_18_0:GetName(), "[Lv." .. var_18_0:GetLevel() .. "]")
		arg_7_0.shipDetailsDes.text = var_18_0:GetEffectDesc()
	end)
	onButton(arg_7_0, arg_7_0.shipDetailBack, function()
		setActive(arg_7_0.shipDetails, false)
	end)
end

function var_0_0.InitPlaceCfg(arg_20_0)
	arg_20_0.npcToPlaceCfg = {}

	for iter_20_0, iter_20_1 in ipairs(pg.island_production_place.all) do
		local var_20_0 = pg.island_production_place[iter_20_1]

		if not arg_20_0.npcToPlaceCfg[var_20_0.npc_birthplace] then
			arg_20_0.npcToPlaceCfg[var_20_0.npc_birthplace] = {}
		end

		table.insert(arg_20_0.npcToPlaceCfg[var_20_0.npc_birthplace], iter_20_1)
	end
end

function var_0_0.RefreshRightUI(arg_21_0, arg_21_1)
	arg_21_0:StopTimer()

	local var_21_0 = arg_21_0.placeCommissionList[arg_21_0.selectedIdx]
	local var_21_1 = pg.island_production_commission[var_21_0]

	setText(arg_21_0.slotName, arg_21_0.placeCfg.name .. "-" .. var_21_1.name)

	if not arg_21_1 then
		setActive(arg_21_0.lockSlot, true)
		setActive(arg_21_0.unlockSlot, false)

		return
	end

	setActive(arg_21_0.unlockSlot, true)
	setActive(arg_21_0.lockSlot, false)
	setActive(arg_21_0.selectShipButton, false)

	local var_21_2 = arg_21_1:CanStartDelegation()

	setActive(arg_21_0.normalTitle, true)
	setActive(arg_21_0.finishTitle, false)
	setActive(arg_21_0.emptyBtn, false)
	setActive(arg_21_0.getBtn, false)
	setActive(arg_21_0.stopBtn, false)

	if var_21_2 then
		setActive(arg_21_0.finish, false)

		local var_21_3 = arg_21_0.selectedShip ~= nil

		setActive(arg_21_0.emptyBtn, true)

		if not var_21_3 then
			setActive(arg_21_0.emptyShip, true)
			setActive(arg_21_0.process, false)

			return
		end

		setActive(arg_21_0.emptyShip, false)
		setActive(arg_21_0.process, true)
		setActive(arg_21_0.inprocess, false)
		setActive(arg_21_0.selectFormula, true)

		arg_21_0.selectedShipInfo = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_21_0.selectedShip)

		local var_21_4 = arg_21_0.selectedShipInfo:GetCurrentEnergy()
		local var_21_5 = arg_21_0.selectedShipInfo:GetMaxEnergy()

		setText(arg_21_0.energyTFText, var_21_4 .. "/" .. var_21_5)
		setSlider(arg_21_0.energySliderTF, 0, 1, var_21_4 / var_21_5)
		setText(arg_21_0.seletShipName, arg_21_0.selectedShipInfo:GetName())

		local var_21_6 = IslandShip.StaticGetPrefab(arg_21_0.selectedShip)

		GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_21_6, "", arg_21_0.shipIconTF)
		setActive(arg_21_0.selectShipButton, true)

		return
	end

	local var_21_7 = arg_21_1:GetSlotRoleData()
	local var_21_8 = arg_21_1:GetSlotRewardData()

	if var_21_7 == nil and var_21_8 ~= nil then
		setActive(arg_21_0.normalTitle, false)
		setActive(arg_21_0.finishTitle, true)
		setActive(arg_21_0.finish, true)
		setActive(arg_21_0.process, false)
		setActive(arg_21_0.emptyShip, false)
		setActive(arg_21_0.getBtn, true)
		onButton(arg_21_0, arg_21_0.getBtn, function()
			local var_22_0 = arg_21_0.placeCommissionList[arg_21_0.selectedIdx]
			local var_22_1 = pg.island_production_commission[var_22_0].slot
			local var_22_2 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_21_0.place_Id):GetDelegationSlotData(var_22_1)
			local var_22_3 = var_22_2:GetSlotRoleData()
			local var_22_4 = var_22_2:GetSlotRewardData()
			local var_22_5 = var_22_3 == nil and var_22_4 ~= nil and 2 or 1

			arg_21_0:emit(IslandMediator.GET_DELEGATION_AWARD, arg_21_0.place_Id, var_22_1, var_22_5)
		end, SFX_PANEL)

		local var_21_9 = var_21_8.formula_id
		local var_21_10 = pg.island_formula[var_21_9].commission_product
		local var_21_11 = var_21_10[1][1]
		local var_21_12 = var_21_8.formula_drop_list[1].num * var_21_10[1][2]
		local var_21_13 = Drop.New({
			count = 0,
			type = DROP_TYPE_ISLAND_ITEM,
			id = var_21_11
		}):getConfigTable().icon

		GetImageSpriteFromAtlasAsync("island/" .. var_21_13, "", arg_21_0.canRewardIcon)
		setText(arg_21_0.canRewardNum, "×" .. var_21_12)

		local var_21_14 = pg.island_formula[var_21_9].item_id
		local var_21_15 = pg.island_item_data_template[var_21_14]

		GetImageSpriteFromAtlasAsync("island/" .. var_21_15.icon, "", arg_21_0.finishFurmalaIcon)

		return
	end

	setActive(arg_21_0.getBtn, true)
	setActive(arg_21_0.stopBtn, true)
	setActive(arg_21_0.process, true)
	setActive(arg_21_0.inprocess, true)
	setActive(arg_21_0.emptyShip, false)
	setActive(arg_21_0.selectFormula, false)
	setActive(arg_21_0.finish, false)

	if var_21_7 ~= nil then
		arg_21_0:StopTimer()
		arg_21_0:StartRoleTimer(var_21_7)

		local var_21_16 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(var_21_7.ship_id)
		local var_21_17 = var_21_16:GetCurrentEnergy()
		local var_21_18 = var_21_16:GetMaxEnergy()

		setText(arg_21_0.energyTFText, var_21_17 .. "/" .. var_21_18)
		setSlider(arg_21_0.energySliderTF, 0, 1, var_21_17 / var_21_18)
		setText(arg_21_0.seletShipName, var_21_16:GetName())

		local var_21_19 = IslandShip.StaticGetPrefab(var_21_7.ship_id)

		GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_21_19, "", arg_21_0.shipIconTF)

		local var_21_20 = pg.island_formula[var_21_7.formula_id].item_id
		local var_21_21 = pg.island_item_data_template[var_21_20]

		GetImageSpriteFromAtlasAsync("island/" .. var_21_21.icon, "", arg_21_0.currentFormulaIcon)
	end
end

function var_0_0.StartRoleTimer(arg_23_0, arg_23_1)
	arg_23_0:UpdateTime(arg_23_1)

	arg_23_0.roleTimer = Timer.New(function()
		arg_23_0:UpdateTime(arg_23_1)
	end, 1, -1)

	arg_23_0.roleTimer:Start()
end

function var_0_0.StopTimer(arg_25_0)
	if arg_25_0.roleTimer ~= nil then
		arg_25_0.roleTimer:Stop()

		arg_25_0.roleTimer = nil
	end
end

function var_0_0.UpdateTime(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1:GetFinishTime() - arg_26_0.timeMgr:GetServerTime()

	setText(arg_26_0.timeTF, arg_26_0.timeMgr:DescCDTime(var_26_0))
	setSlider(arg_26_0.roleDelegationSliderTF, 0, 1, 1 - var_26_0 / arg_26_1:GetAllTime())

	local var_26_1 = arg_26_1:CanRewardTimes()
	local var_26_2 = arg_26_1.formula_id
	local var_26_3 = pg.island_formula[var_26_2]
	local var_26_4 = var_26_3.item_id
	local var_26_5 = Drop.New({
		count = 0,
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_26_4
	}):getConfigTable().icon

	GetImageSpriteFromAtlasAsync("island/" .. var_26_5, "", arg_26_0.canRewardIcon)
	setText(arg_26_0.canRewardNum, "×" .. tostring(var_26_3.commission_product[1][2] * var_26_1))

	local var_26_6 = arg_26_1:InCurrentTime()

	if var_26_1 > 0 then
		onButton(arg_26_0, arg_26_0.getBtn, function()
			local var_27_0 = arg_26_0.placeCommissionList[arg_26_0.selectedIdx]
			local var_27_1 = pg.island_production_commission[var_27_0].slot
			local var_27_2 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_26_0.place_Id):GetDelegationSlotData(var_27_1)
			local var_27_3 = var_27_2:GetSlotRoleData()
			local var_27_4 = var_27_2:GetSlotRewardData()
			local var_27_5 = var_27_3 == nil and var_27_4 ~= nil and 2 or 1

			arg_26_0:emit(IslandMediator.GET_DELEGATION_AWARD, arg_26_0.place_Id, var_27_1, var_27_5)
		end, SFX_PANEL)
	else
		removeOnButton(arg_26_0.getBtn)
	end

	local var_26_7 = arg_26_0.timeMgr:GetServerTime() - arg_26_1:InCurrentTimeStart(var_26_6)

	arg_26_0.formulaProcess.fillAmount = var_26_7 / arg_26_1:CurrentTimeNeed(var_26_6)

	if var_26_0 <= 0 then
		arg_26_0:StopTimer()
	end
end

function var_0_0.InitDelegationTabItem(arg_28_0, arg_28_1, arg_28_2)
	onButton(arg_28_0, arg_28_2, function()
		arg_28_0:OnSelectTargetIndexCommission(arg_28_1)
	end, SFX_PANEL)
end

function var_0_0.InitDelegationItem(arg_30_0, arg_30_1, arg_30_2)
	onButton(arg_30_0, arg_30_2, function()
		arg_30_0:OnSelectTargetIndexCommission(arg_30_1)
	end, SFX_PANEL)

	local var_30_0 = arg_30_1 + 1
	local var_30_1 = arg_30_0.placeCommissionList[arg_30_1 + 1]
	local var_30_2 = pg.island_production_commission[var_30_1]
	local var_30_3 = pg.island_world_objects[var_30_2.birthplace].param.position
	local var_30_4 = Vector3(var_30_3[1], var_30_3[2], var_30_3[3])
	local var_30_5 = pg.island_world_objects[var_30_2.birthplace].param.rotation
	local var_30_6 = Vector3(var_30_5[1], var_30_5[2], var_30_5[3])

	arg_30_0:emitCore(ISLAND_EVT.LOAD_DELEGATE_SLOT_EFFECCT, var_30_0, var_30_4, var_30_6)
end

function var_0_0.UpdateDelegationItem(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_0.placeCommissionList[arg_32_1 + 1]
	local var_32_1 = pg.island_production_commission[var_32_0]
	local var_32_2 = pg.island_world_objects[var_32_1.birthplace].param.position
	local var_32_3 = Vector3(var_32_2[1], var_32_2[2], var_32_2[3])
	local var_32_4 = pg.island_world_objects[var_32_1.birthplace].param.rotation
	local var_32_5 = Vector3(var_32_4[1], var_32_4[2], var_32_4[3])
	local var_32_6 = IslandCalcUtil.WorldPosition2LocalPosition(arg_32_0.content, var_32_3)

	arg_32_2.transform.localPosition = var_32_6 + var_0_2

	setActive(arg_32_0:findTF("select", arg_32_2), false)
	setActive(arg_32_0:findTF("unselect", arg_32_2), false)

	local var_32_7 = arg_32_1 + 1
	local var_32_8 = arg_32_0.placeCommissionList[var_32_7]
	local var_32_9 = pg.island_production_commission[var_32_8].slot
	local var_32_10 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_32_0.place_Id):GetDelegationSlotData(var_32_9)

	setButtonEnabled(arg_32_2, var_32_10 ~= nil)

	local var_32_11 = arg_32_1 + 1

	arg_32_0:emitCore(ISLAND_EVT.UPDATE_DELEGATION_EFFECT_POSITION, var_32_11, var_32_3, var_32_5)
	arg_32_0:emitCore(ISLAND_EVT.DEFAULTDELEFFECT_SHOW, var_32_11, arg_32_0.selectedIdx ~= var_32_11)
	arg_32_0:emitCore(ISLAND_EVT.SELECTDELEFFECT_SHOW, var_32_11, arg_32_0.selectedIdx == var_32_11)
end

function var_0_0.OnSelectTargetIndexCommission(arg_33_0, arg_33_1)
	if arg_33_0.selectedIdx == arg_33_1 + 1 then
		return
	end

	arg_33_0.selectedShip = nil
	arg_33_0.selectedIdx = arg_33_1 + 1

	arg_33_0.delegationTabList:align(#arg_33_0.placeCommissionList)
	arg_33_0.delegationList:align(#arg_33_0.placeCommissionList)
end

function var_0_0.UpdateDelegationTabItem(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_1 + 1

	setActive(arg_34_0:findTF("select", arg_34_2), arg_34_0.selectedIdx == var_34_0)
	setActive(arg_34_0:findTF("unselect", arg_34_2), arg_34_0.selectedIdx ~= var_34_0)

	local var_34_1 = arg_34_0.placeCommissionList[var_34_0]
	local var_34_2 = pg.island_production_commission[var_34_1].slot
	local var_34_3 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_34_0.place_Id):GetDelegationSlotData(var_34_2)

	setActive(arg_34_0:findTF("lock", arg_34_2), not var_34_3)
	setButtonEnabled(arg_34_2, var_34_3 ~= nil)

	if arg_34_0.selectedIdx == var_34_0 then
		arg_34_0:RefreshRightUI(var_34_3)
	end

	if not var_34_3 then
		setActive(arg_34_0:findTF("complete ", arg_34_2), false)
		setActive(arg_34_0:findTF("product_icon", arg_34_2), false)

		return
	end

	local var_34_4 = var_34_3:GetSlotRoleData()
	local var_34_5 = var_34_3:GetSlotRewardData()
	local var_34_6 = var_34_4 == nil and var_34_5 ~= nil

	setActive(arg_34_0:findTF("complete ", arg_34_2), var_34_6)

	local var_34_7 = var_34_4 and var_34_4.formula_id or nil

	var_34_7 = var_34_7 or var_34_5 and var_34_5.formula_id or nil

	if var_34_7 then
		setActive(arg_34_0:findTF("product_icon", arg_34_2), true)

		local var_34_8 = pg.island_formula[var_34_7]
		local var_34_9 = pg.island_item_data_template[var_34_8.item_id]

		GetImageSpriteFromAtlasAsync("island/" .. var_34_9.icon, "", arg_34_0:findTF("product_icon", arg_34_2))
	else
		setActive(arg_34_0:findTF("product_icon", arg_34_2), false)
	end
end

function var_0_0.Flush(arg_35_0)
	arg_35_0.selectedIdx = 1

	arg_35_0.delegationList:align(#arg_35_0.placeCommissionList)
	arg_35_0.delegationTabList:align(#arg_35_0.placeCommissionList)
end

function var_0_0.OnShow(arg_36_0, arg_36_1, arg_36_2)
	if arg_36_1 then
		arg_36_0.place_Id = arg_36_1
	else
		arg_36_0.place_Id = arg_36_0.npcToPlaceCfg[arg_36_2][1]
	end

	if arg_36_0.place_Id == IslandProductSystemVO.PasturePlaceId then
		IslandGuideChecker.CheckGuide("ISLAND_GUIDE_26")
	elseif arg_36_0.place_Id == IslandProductSystemVO.MinePlaceId then
		IslandGuideChecker.CheckGuide("ISLAND_GUIDE_23")
	end

	arg_36_0.placeCfg = pg.island_production_place[arg_36_0.place_Id]
	arg_36_0.placeCommissionList = arg_36_0.placeCfg.commission_slot

	if arg_36_0.placeCfg.delegationCamera then
		IslandCameraMgr.instance:ActiveVirtualCamera(arg_36_0.placeCfg.delegationCamera)
	end

	arg_36_0.timeMgr = pg.TimeMgr.GetInstance()
	arg_36_0.selectedShip = nil

	arg_36_0:Flush()
	setActive(arg_36_0.content, false)

	arg_36_0.timer = Timer.New(function()
		setActive(arg_36_0.content, true)
		arg_36_0:Flush()
	end, var_0_1, 0)

	arg_36_0.timer:Start()
	setActive(arg_36_0.shipDetails, false)
	setText(arg_36_0:findTF("top/title/Text"), arg_36_0.placeCfg.name)
	setText(arg_36_0:findTF("top/title/Text/en"), "PRODUCTING")
end

function var_0_0.OnHide(arg_38_0)
	if arg_38_0.timer ~= nil then
		arg_38_0.timer:Stop()

		arg_38_0.timer = nil
	end

	arg_38_0:StopTimer()

	for iter_38_0, iter_38_1 in ipairs(arg_38_0.placeCommissionList) do
		arg_38_0:emitCore(ISLAND_EVT.DEFAULTDELEFFECT_SHOW, iter_38_0, false)
		arg_38_0:emitCore(ISLAND_EVT.SELECTDELEFFECT_SHOW, iter_38_0, false)
	end
end

function var_0_0.OnDestroy(arg_39_0)
	if arg_39_0.timer ~= nil then
		arg_39_0.timer:Stop()

		arg_39_0.timer = nil
	end

	arg_39_0:StopTimer()
end

function var_0_0.AfterShipSelect(arg_40_0, arg_40_1)
	arg_40_0.selectedShip = arg_40_1

	arg_40_0.delegationTabList:align(#arg_40_0.placeCommissionList)

	local var_40_0 = arg_40_0.placeCommissionList[arg_40_0.selectedIdx]

	arg_40_0:OpenPage(IslandFormulaSelectPage, var_40_0, arg_40_0.place_Id, arg_40_0.selectedShip, function()
		arg_40_0:Enable()
	end)
	setActive(arg_40_0.shipDetails, false)
end

function var_0_0.OnGetDelegationAwardDone(arg_42_0)
	arg_42_0.delegationTabList:align(#arg_42_0.placeCommissionList)
end

function var_0_0.OnFinishDelegationDone(arg_43_0)
	arg_43_0.delegationTabList:align(#arg_43_0.placeCommissionList)
end

function var_0_0.OnUseSpeedupCardDone(arg_44_0)
	arg_44_0.delegationTabList:align(#arg_44_0.placeCommissionList)
end

function var_0_0.OnDelegationStartDone(arg_45_0)
	arg_45_0:Enable()
	arg_45_0.delegationTabList:align(#arg_45_0.placeCommissionList)
end

return var_0_0
