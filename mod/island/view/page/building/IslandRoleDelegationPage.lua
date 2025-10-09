local var_0_0 = class("IslandRoleDelegationPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandRoleDelegationUI"
end

local var_0_1 = 0.6

function var_0_0.AddListeners(arg_2_0)
	arg_2_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_2_0.OnGetDelegationAwardDone)
	arg_2_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_2_0.OnFinishDelegationDone)
	arg_2_0:AddListener(GAME.ISLAND_START_DELEGATION_DONE, arg_2_0.OnDelegationStartDone)
	arg_2_0:AddListener(GAME.ISLAND_USE_TICKET_DONE, arg_2_0.OnUseTicketDone)
end

function var_0_0.RemoveListeners(arg_3_0)
	arg_3_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_3_0.OnGetDelegationAwardDone)
	arg_3_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_3_0.OnFinishDelegationDone)
	arg_3_0:RemoveListener(GAME.ISLAND_START_DELEGATION_DONE, arg_3_0.OnDelegationStartDone)
	arg_3_0:RemoveListener(GAME.ISLAND_USE_TICKET_DONE, arg_3_0.OnUseTicketDone)
end

local var_0_2 = Vector3(0, 0, 0)

function var_0_0.OnLoaded(arg_4_0)
	arg_4_0.backBtn = arg_4_0:findTF("top/back")
	arg_4_0.title = arg_4_0:findTF("top/title")
	arg_4_0.content = arg_4_0._tf:Find("content")
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

	arg_4_0.selectPanel = IslandDelegationSelectPanel.New(arg_4_0._tf, arg_4_0.event, {
		isPermanent = true,
		alignRight = true
	})
	arg_4_0.awardDisplayPanel = IslandAwardDisplayInMainPanel.New(arg_4_0._tf, arg_4_0.event)
end

function var_0_0.OnInit(arg_7_0)
	arg_7_0:InitPlaceCfg()
	onButton(arg_7_0, arg_7_0.backBtn, function()
		arg_7_0:Hide()
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf:Find("top/title/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_help_commission.tip
		})
	end, SFX_PANEL)
end

function var_0_0.InitPlaceCfg(arg_10_0)
	arg_10_0.npcToPlaceCfg = {}

	for iter_10_0, iter_10_1 in ipairs(pg.island_production_place.all) do
		local var_10_0 = pg.island_production_place[iter_10_1]

		if not arg_10_0.npcToPlaceCfg[var_10_0.npc_birthplace] then
			arg_10_0.npcToPlaceCfg[var_10_0.npc_birthplace] = {}
		end

		table.insert(arg_10_0.npcToPlaceCfg[var_10_0.npc_birthplace], iter_10_1)
	end
end

function var_0_0.InitDelegationTabItem(arg_11_0, arg_11_1, arg_11_2)
	onButton(arg_11_0, arg_11_2, function()
		arg_11_0:OnSelectTargetIndexCommission(arg_11_1)
	end, SFX_PANEL)
end

function var_0_0.InitDelegationItem(arg_13_0, arg_13_1, arg_13_2)
	onButton(arg_13_0, arg_13_2, function()
		arg_13_0:OnSelectTargetIndexCommission(arg_13_1)
	end, SFX_PANEL)
end

function var_0_0.UpdateDelegationItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.placeCommissionList[arg_15_1 + 1]
	local var_15_1 = pg.island_production_commission[var_15_0]
	local var_15_2 = pg.island_world_objects[var_15_1.birthplace].param.position
	local var_15_3 = Vector3(var_15_2[1], var_15_2[2], var_15_2[3])
	local var_15_4 = pg.island_world_objects[var_15_1.birthplace].param.rotation
	local var_15_5 = Vector3(var_15_4[1], var_15_4[2], var_15_4[3])
	local var_15_6 = IslandCalcUtil.WorldPosition2LocalPosition(arg_15_0.content, var_15_3)

	arg_15_2.transform.localPosition = var_15_6 + var_0_2

	setActive(arg_15_0:findTF("select", arg_15_2), false)
	setActive(arg_15_0:findTF("unselect", arg_15_2), false)

	local var_15_7 = arg_15_1 + 1
	local var_15_8 = arg_15_0.placeCommissionList[var_15_7]
	local var_15_9 = pg.island_production_commission[var_15_8].slot
	local var_15_10 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_15_0.placeId):GetDelegationSlotData(var_15_9)

	setButtonEnabled(arg_15_2, var_15_10 ~= nil)

	local var_15_11 = arg_15_1 + 1

	arg_15_0:emitCore(ISLAND_EVT.SELECTDELEEFFECT_SHOW, var_15_11, arg_15_0.selectedIdx, var_15_3, var_15_5)
end

function var_0_0.OnSelectTargetIndexCommission(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_0.selectedIdx == arg_16_1 + 1 and not arg_16_2 then
		return
	end

	if not arg_16_2 then
		arg_16_0.selectedShip = nil

		arg_16_0:UnloadPreconcenCharacter()
	end

	arg_16_0.selectedIdx = arg_16_1 + 1
	arg_16_0.contextData.selectedIdx = arg_16_0.selectedIdx

	local var_16_0 = arg_16_0.placeCommissionList[arg_16_0.selectedIdx]

	arg_16_0.selectPanel:ExecuteAction("Show", var_16_0, arg_16_0.selectedShip, function(arg_17_0)
		arg_16_0.contextData.selectedShip = arg_17_0
		arg_16_0.selectedShip = arg_17_0

		arg_16_0:LoadPreconcenCharacter(arg_17_0)
	end, function()
		arg_16_0.contextData.selectedShip = nil
		arg_16_0.selectedShip = nil

		arg_16_0:UnloadPreconcenCharacter()
	end)
	arg_16_0.delegationTabList:align(#arg_16_0.placeCommissionList)
	arg_16_0.delegationList:align(#arg_16_0.placeCommissionList)
end

function var_0_0.UpdateDelegationTabItem(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_1 + 1

	setActive(arg_19_0:findTF("select", arg_19_2), arg_19_0.selectedIdx == var_19_0)
	setActive(arg_19_0:findTF("unselect", arg_19_2), arg_19_0.selectedIdx ~= var_19_0)

	local var_19_1 = arg_19_0.placeCommissionList[var_19_0]
	local var_19_2 = pg.island_production_commission[var_19_1].slot
	local var_19_3 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_19_0.placeId):GetDelegationSlotData(var_19_2)

	setActive(arg_19_0:findTF("lock", arg_19_2), not var_19_3)
	setButtonEnabled(arg_19_2, var_19_3 ~= nil)

	if arg_19_0.selectedIdx == var_19_0 then
		arg_19_0.selectPanel:ExecuteAction("Flush")
	end

	if not var_19_3 then
		setActive(arg_19_0:findTF("complete ", arg_19_2), false)
		setActive(arg_19_0:findTF("product_icon", arg_19_2), false)

		return
	end

	local var_19_4 = var_19_3:GetSlotRoleData()
	local var_19_5 = var_19_3:GetSlotRewardData()
	local var_19_6 = var_19_4 == nil and var_19_5 ~= nil

	setActive(arg_19_0:findTF("complete ", arg_19_2), var_19_6)

	local var_19_7 = var_19_4 and var_19_4.formula_id or nil

	var_19_7 = var_19_7 or var_19_5 and var_19_5.formula_id or nil

	if var_19_7 then
		setActive(arg_19_0:findTF("product_icon", arg_19_2), true)

		local var_19_8 = pg.island_formula[var_19_7]
		local var_19_9 = pg.island_item_data_template[var_19_8.item_id]

		GetImageSpriteFromAtlasAsync("island/" .. var_19_9.icon, "", arg_19_0:findTF("product_icon", arg_19_2))
	else
		setActive(arg_19_0:findTF("product_icon", arg_19_2), false)
	end
end

function var_0_0.Flush(arg_20_0)
	arg_20_0.delegationList:align(#arg_20_0.placeCommissionList)
	arg_20_0.delegationTabList:align(#arg_20_0.placeCommissionList)
end

function var_0_0.OnShow(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_1 then
		arg_21_0.placeId = arg_21_1
	else
		arg_21_0.placeId = arg_21_0.npcToPlaceCfg[arg_21_2][1]
	end

	arg_21_0.placeCfg = pg.island_production_place[arg_21_0.placeId]
	arg_21_0.placeCommissionList = arg_21_0.placeCfg.commission_slot

	if arg_21_0.placeCfg.delegationCamera then
		IslandCameraMgr.instance:ActiveVirtualCamera(arg_21_0.placeCfg.delegationCamera)
	end

	arg_21_0.timeMgr = pg.TimeMgr.GetInstance()
	arg_21_0.selectedShip = arg_21_0.contextData.selectedShip

	arg_21_0:DefaultTargetTabIndex()

	if arg_21_0.selectedShip then
		arg_21_0:LoadPreconcenCharacter(arg_21_0.selectedShip)
	end

	arg_21_0:StopTimer()
	arg_21_0:StartTimer()
	setText(arg_21_0:findTF("top/title/Text"), arg_21_0.placeCfg.name)
	setText(arg_21_0:findTF("top/title/Text/en"), "PRODUCTING")
end

function var_0_0.DefaultTargetTabIndex(arg_22_0)
	local var_22_0 = arg_22_0.contextData.selectedIdx or 1

	arg_22_0:OnSelectTargetIndexCommission(var_22_0 - 1, true)
end

function var_0_0.OnHide(arg_23_0)
	arg_23_0:StopTimer()
	arg_23_0:emitCore(ISLAND_EVT.RECYCLE_ALL_SLOTDELEEFFECT)
	arg_23_0:UnloadPreconcenCharacter()

	if arg_23_0.awardDisplayPanel then
		arg_23_0.awardDisplayPanel:Hide()
	end
end

function var_0_0.OnExit(arg_24_0)
	arg_24_0.contextData.selectedIdx = nil
	arg_24_0.contextData.selectedShip = nil
end

function var_0_0.StartTimer(arg_25_0)
	setActive(arg_25_0.content, false)

	arg_25_0.timer = Timer.New(function()
		setActive(arg_25_0.content, true)
		arg_25_0:Flush()
	end, var_0_1, 0)

	arg_25_0.timer:Start()
end

function var_0_0.StopTimer(arg_27_0)
	if arg_27_0.timer ~= nil then
		arg_27_0.timer:Stop()

		arg_27_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_28_0)
	arg_28_0:StopTimer()

	if arg_28_0.selectPanel then
		arg_28_0.selectPanel:Destroy()

		arg_28_0.selectPanel = nil
	end

	if arg_28_0.awardDisplayPanel then
		arg_28_0.awardDisplayPanel:Destroy()

		arg_28_0.awardDisplayPanel = nil
	end
end

function var_0_0.OnGetDelegationAwardDone(arg_29_0, arg_29_1)
	if arg_29_1.addShipExpData then
		local var_29_0 = {}
		local var_29_1 = arg_29_1.addShipExpData.addShipId
		local var_29_2 = arg_29_1.addShipExpData.addExp
		local var_29_3 = IslandShip.StaticGetPrefab(var_29_1)
		local var_29_4 = "island/IslandShipIcon/" .. var_29_3

		arg_29_0:UpdateMainAwardReward({
			shipExp = true,
			icon = var_29_4,
			num = var_29_2
		})
	end

	arg_29_0.delegationTabList:align(#arg_29_0.placeCommissionList)
end

function var_0_0.OnFinishDelegationDone(arg_30_0, arg_30_1)
	if arg_30_1.addShipExpData then
		local var_30_0 = {}
		local var_30_1 = arg_30_1.addShipExpData.addShipId
		local var_30_2 = arg_30_1.addShipExpData.addExp
		local var_30_3 = IslandShip.StaticGetPrefab(var_30_1)
		local var_30_4 = "island/IslandShipIcon/" .. var_30_3

		arg_30_0:UpdateMainAwardReward({
			shipExp = true,
			icon = var_30_4,
			num = var_30_2
		})
	end

	arg_30_0.delegationTabList:align(#arg_30_0.placeCommissionList)
end

function var_0_0.OnUseTicketDone(arg_31_0, arg_31_1)
	if arg_31_1.type == IslandUseTicketCommand.TYPES.APPOINT then
		arg_31_0.delegationTabList:align(#arg_31_0.placeCommissionList)
	end
end

function var_0_0.OnDelegationStartDone(arg_32_0)
	arg_32_0.delegationTabList:align(#arg_32_0.placeCommissionList)
end

function var_0_0.LoadPreconcenCharacter(arg_33_0, arg_33_1)
	arg_33_0:UnloadPreconcenCharacter()

	local var_33_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_33_1)
	local var_33_1 = arg_33_0.placeCommissionList[arg_33_0.selectedIdx]
	local var_33_2 = pg.island_production_commission[var_33_1].birthplace

	arg_33_0:emitCore(ISLAND_EVT.LOAD_DELEGATE_PREVIEW_ROLE, var_33_0:GetModel(), var_33_2)
end

function var_0_0.UnloadPreconcenCharacter(arg_34_0)
	arg_34_0:emitCore(ISLAND_EVT.UN_LOAD_DELEGATE_PREVIEW_ROLE)
end

function var_0_0.UpdateMainAwardReward(arg_35_0, arg_35_1)
	arg_35_0.awardDisplayPanel:ExecuteAction("ShowAwards", arg_35_1)
end

return var_0_0
