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
	arg_4_0.backBtn = arg_4_0._tf:Find("top/back")
	arg_4_0.title = arg_4_0._tf:Find("top/title")
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

	arg_4_0.selectPanel = IslandDelegationSelectPanel.New(arg_4_0._tf, arg_4_0.event, setmetatable({
		alignRight = true,
		isPermanent = true,
		ShowMsgBox = function(arg_7_0, arg_7_1)
			arg_4_0:ShowMsgBox(arg_7_1)
		end
	}, {
		__index = arg_4_0.contextData
	}))
	arg_4_0.awardDisplayPanel = IslandAwardDisplayInMainPanel.New(arg_4_0._tf, arg_4_0.event)
end

function var_0_0.OnInit(arg_8_0)
	arg_8_0:InitPlaceCfg()
	onButton(arg_8_0, arg_8_0.backBtn, function()
		arg_8_0:Hide()
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0._tf:Find("top/title/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_help_commission.tip
		})
	end, SFX_PANEL)
end

function var_0_0.InitPlaceCfg(arg_11_0)
	arg_11_0.npcToPlaceCfg = {}

	for iter_11_0, iter_11_1 in ipairs(pg.island_production_place.all) do
		local var_11_0 = pg.island_production_place[iter_11_1]

		if not arg_11_0.npcToPlaceCfg[var_11_0.npc_birthplace] then
			arg_11_0.npcToPlaceCfg[var_11_0.npc_birthplace] = {}
		end

		table.insert(arg_11_0.npcToPlaceCfg[var_11_0.npc_birthplace], iter_11_1)
	end
end

function var_0_0.InitDelegationTabItem(arg_12_0, arg_12_1, arg_12_2)
	onButton(arg_12_0, arg_12_2, function()
		arg_12_0:OnSelectTargetIndexCommission(arg_12_1)
	end, SFX_PANEL)
end

function var_0_0.InitDelegationItem(arg_14_0, arg_14_1, arg_14_2)
	onButton(arg_14_0, arg_14_2, function()
		arg_14_0:OnSelectTargetIndexCommission(arg_14_1)
	end, SFX_PANEL)
end

function var_0_0.UpdateDelegationItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.placeCommissionList[arg_16_1 + 1]
	local var_16_1 = pg.island_production_commission[var_16_0]
	local var_16_2 = pg.island_world_objects[var_16_1.birthplace].param.position
	local var_16_3 = Vector3(var_16_2[1], var_16_2[2], var_16_2[3])
	local var_16_4 = pg.island_world_objects[var_16_1.birthplace].param.rotation
	local var_16_5 = Vector3(var_16_4[1], var_16_4[2], var_16_4[3])
	local var_16_6 = IslandCalcUtil.WorldPosition2LocalPosition(arg_16_0.content, var_16_3)

	arg_16_2.transform.localPosition = var_16_6 + var_0_2

	setActive(arg_16_2:Find("select"), false)
	setActive(arg_16_2:Find("unselect"), false)

	local var_16_7 = arg_16_1 + 1
	local var_16_8 = arg_16_0.placeCommissionList[var_16_7]
	local var_16_9 = pg.island_production_commission[var_16_8].slot
	local var_16_10 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_16_0.placeId):GetDelegationSlotData(var_16_9)

	setButtonEnabled(arg_16_2, var_16_10 ~= nil)

	local var_16_11 = arg_16_1 + 1

	arg_16_0:emitCore(ISLAND_EVT.SELECTDELEEFFECT_SHOW, var_16_11, arg_16_0.selectedIdx, var_16_3, var_16_5)
end

function var_0_0.OnSelectTargetIndexCommission(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0.selectedIdx == arg_17_1 + 1 and not arg_17_2 then
		return
	end

	if not arg_17_2 then
		arg_17_0.selectedShip = nil

		arg_17_0:UnloadPreconcenCharacter()
	end

	arg_17_0.selectedIdx = arg_17_1 + 1
	arg_17_0.contextData.selectedIdx = arg_17_0.selectedIdx

	local var_17_0 = arg_17_0.placeCommissionList[arg_17_0.selectedIdx]

	arg_17_0.selectPanel:ExecuteAction("Show", var_17_0, arg_17_0.selectedShip, function(arg_18_0)
		arg_17_0.contextData.selectedShip = arg_18_0
		arg_17_0.selectedShip = arg_18_0

		arg_17_0:LoadPreconcenCharacter(arg_18_0)
	end, function()
		arg_17_0.contextData.selectedShip = nil
		arg_17_0.selectedShip = nil

		arg_17_0:UnloadPreconcenCharacter()
	end)
	arg_17_0.delegationTabList:align(#arg_17_0.placeCommissionList)
	arg_17_0.delegationList:align(#arg_17_0.placeCommissionList)
end

function var_0_0.UpdateDelegationTabItem(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_1 + 1

	setActive(arg_20_2:Find("select"), arg_20_0.selectedIdx == var_20_0)
	setActive(arg_20_2:Find("unselect"), arg_20_0.selectedIdx ~= var_20_0)

	local var_20_1 = arg_20_0.placeCommissionList[var_20_0]
	local var_20_2 = pg.island_production_commission[var_20_1].slot
	local var_20_3 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_20_0.placeId):GetDelegationSlotData(var_20_2)

	setActive(arg_20_2:Find("lock"), not var_20_3)
	setActive(arg_20_2:Find("slotName"), var_20_3)
	setButtonEnabled(arg_20_2, var_20_3 ~= nil)

	if arg_20_0.selectedIdx == var_20_0 then
		arg_20_0.selectPanel:ExecuteAction("Flush")
	end

	if not var_20_3 then
		setActive(arg_20_2:Find("complete "), false)
		setActive(arg_20_2:Find("product_icon"), false)

		return
	end

	local var_20_4 = var_20_3:GetSlotRoleData()
	local var_20_5 = var_20_3:GetSlotRewardData()
	local var_20_6 = var_20_4 == nil and var_20_5 ~= nil

	setActive(arg_20_2:Find("complete "), var_20_6)

	local var_20_7 = var_20_4 and var_20_4.formula_id or nil

	var_20_7 = var_20_7 or var_20_5 and var_20_5.formula_id or nil

	if var_20_7 then
		setActive(arg_20_2:Find("product_icon"), true)

		local var_20_8 = pg.island_formula[var_20_7]
		local var_20_9 = pg.island_item_data_template[var_20_8.item_id]

		GetImageSpriteFromAtlasAsync("island/" .. var_20_9.icon, "", arg_20_2:Find("product_icon"))
	else
		setActive(arg_20_2:Find("product_icon"), false)
	end
end

function var_0_0.Flush(arg_21_0)
	arg_21_0.delegationList:align(#arg_21_0.placeCommissionList)
	arg_21_0.delegationTabList:align(#arg_21_0.placeCommissionList)
end

function var_0_0.OnShow(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_1 then
		arg_22_0.placeId = arg_22_1
	else
		arg_22_0.placeId = arg_22_0.npcToPlaceCfg[arg_22_2][1]
	end

	arg_22_0.placeCfg = pg.island_production_place[arg_22_0.placeId]
	arg_22_0.placeCommissionList = arg_22_0.placeCfg.commission_slot

	if arg_22_0.placeCfg.delegationCamera then
		IslandCameraMgr.instance:ActiveVirtualCamera(arg_22_0.placeCfg.delegationCamera)
	end

	arg_22_0.timeMgr = pg.TimeMgr.GetInstance()
	arg_22_0.selectedShip = arg_22_0.contextData.selectedShip

	arg_22_0:DefaultTargetTabIndex()

	if arg_22_0.selectedShip then
		arg_22_0:LoadPreconcenCharacter(arg_22_0.selectedShip)
	end

	arg_22_0:StopTimer()
	arg_22_0:StartTimer()
	setText(arg_22_0._tf:Find("top/title/Text"), arg_22_0.placeCfg.name)
	setText(arg_22_0._tf:Find("top/title/Text/en"), "PRODUCTING")
end

function var_0_0.DefaultTargetTabIndex(arg_23_0)
	local var_23_0 = arg_23_0.contextData.selectedIdx or 1

	arg_23_0:OnSelectTargetIndexCommission(var_23_0 - 1, true)
end

function var_0_0.OnHide(arg_24_0)
	arg_24_0:StopTimer()
	arg_24_0:emitCore(ISLAND_EVT.RECYCLE_ALL_SLOTDELEEFFECT)
	arg_24_0:UnloadPreconcenCharacter()

	if arg_24_0.awardDisplayPanel then
		arg_24_0.awardDisplayPanel:Hide()
	end
end

function var_0_0.OnExit(arg_25_0)
	arg_25_0.contextData.selectedIdx = nil
	arg_25_0.contextData.selectedShip = nil

	IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
end

function var_0_0.StartTimer(arg_26_0)
	setActive(arg_26_0.content, false)

	arg_26_0.timer = Timer.New(function()
		setActive(arg_26_0.content, true)
		arg_26_0:Flush()
	end, var_0_1, 0)

	arg_26_0.timer:Start()
end

function var_0_0.StopTimer(arg_28_0)
	if arg_28_0.timer ~= nil then
		arg_28_0.timer:Stop()

		arg_28_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_29_0)
	arg_29_0:StopTimer()

	if arg_29_0.selectPanel then
		arg_29_0.selectPanel:Destroy()

		arg_29_0.selectPanel = nil
	end

	if arg_29_0.awardDisplayPanel then
		arg_29_0.awardDisplayPanel:Destroy()

		arg_29_0.awardDisplayPanel = nil
	end
end

function var_0_0.OnGetDelegationAwardDone(arg_30_0, arg_30_1)
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

function var_0_0.OnFinishDelegationDone(arg_31_0, arg_31_1)
	if arg_31_1.addShipExpData then
		local var_31_0 = {}
		local var_31_1 = arg_31_1.addShipExpData.addShipId
		local var_31_2 = arg_31_1.addShipExpData.addExp
		local var_31_3 = IslandShip.StaticGetPrefab(var_31_1)
		local var_31_4 = "island/IslandShipIcon/" .. var_31_3

		arg_31_0:UpdateMainAwardReward({
			shipExp = true,
			icon = var_31_4,
			num = var_31_2
		})
	end

	arg_31_0.delegationTabList:align(#arg_31_0.placeCommissionList)
end

function var_0_0.OnUseTicketDone(arg_32_0, arg_32_1)
	if arg_32_1.type == IslandUseTicketCommand.TYPES.APPOINT then
		arg_32_0.delegationTabList:align(#arg_32_0.placeCommissionList)
	end
end

function var_0_0.OnDelegationStartDone(arg_33_0)
	arg_33_0.delegationTabList:align(#arg_33_0.placeCommissionList)
end

function var_0_0.LoadPreconcenCharacter(arg_34_0, arg_34_1)
	arg_34_0:UnloadPreconcenCharacter()

	local var_34_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_34_1)
	local var_34_1 = arg_34_0.placeCommissionList[arg_34_0.selectedIdx]
	local var_34_2 = pg.island_production_commission[var_34_1].birthplace

	arg_34_0:emitCore(ISLAND_EVT.LOAD_DELEGATE_PREVIEW_ROLE, var_34_0:GetModel(), var_34_2)
end

function var_0_0.UnloadPreconcenCharacter(arg_35_0)
	arg_35_0:emitCore(ISLAND_EVT.UN_LOAD_DELEGATE_PREVIEW_ROLE)
end

function var_0_0.UpdateMainAwardReward(arg_36_0, arg_36_1)
	arg_36_0.awardDisplayPanel:ExecuteAction("ShowAwards", arg_36_1)
end

return var_0_0
