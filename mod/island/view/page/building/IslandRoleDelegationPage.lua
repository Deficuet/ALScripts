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
end

function var_0_0.OnInit(arg_7_0)
	arg_7_0:InitPlaceCfg()
	onButton(arg_7_0, arg_7_0.backBtn, function()
		arg_7_0:Hide()
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
	end, SFX_PANEL)
end

function var_0_0.InitPlaceCfg(arg_9_0)
	arg_9_0.npcToPlaceCfg = {}

	for iter_9_0, iter_9_1 in ipairs(pg.island_production_place.all) do
		local var_9_0 = pg.island_production_place[iter_9_1]

		if not arg_9_0.npcToPlaceCfg[var_9_0.npc_birthplace] then
			arg_9_0.npcToPlaceCfg[var_9_0.npc_birthplace] = {}
		end

		table.insert(arg_9_0.npcToPlaceCfg[var_9_0.npc_birthplace], iter_9_1)
	end
end

function var_0_0.InitDelegationTabItem(arg_10_0, arg_10_1, arg_10_2)
	onButton(arg_10_0, arg_10_2, function()
		arg_10_0:OnSelectTargetIndexCommission(arg_10_1)
	end, SFX_PANEL)
end

function var_0_0.InitDelegationItem(arg_12_0, arg_12_1, arg_12_2)
	onButton(arg_12_0, arg_12_2, function()
		arg_12_0:OnSelectTargetIndexCommission(arg_12_1)
	end, SFX_PANEL)
end

function var_0_0.UpdateDelegationItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.placeCommissionList[arg_14_1 + 1]
	local var_14_1 = pg.island_production_commission[var_14_0]
	local var_14_2 = pg.island_world_objects[var_14_1.birthplace].param.position
	local var_14_3 = Vector3(var_14_2[1], var_14_2[2], var_14_2[3])
	local var_14_4 = pg.island_world_objects[var_14_1.birthplace].param.rotation
	local var_14_5 = Vector3(var_14_4[1], var_14_4[2], var_14_4[3])
	local var_14_6 = IslandCalcUtil.WorldPosition2LocalPosition(arg_14_0.content, var_14_3)

	arg_14_2.transform.localPosition = var_14_6 + var_0_2

	setActive(arg_14_0:findTF("select", arg_14_2), false)
	setActive(arg_14_0:findTF("unselect", arg_14_2), false)

	local var_14_7 = arg_14_1 + 1
	local var_14_8 = arg_14_0.placeCommissionList[var_14_7]
	local var_14_9 = pg.island_production_commission[var_14_8].slot
	local var_14_10 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_14_0.placeId):GetDelegationSlotData(var_14_9)

	setButtonEnabled(arg_14_2, var_14_10 ~= nil)

	local var_14_11 = arg_14_1 + 1

	arg_14_0:emitCore(ISLAND_EVT.SELECTDELEEFFECT_SHOW, var_14_11, arg_14_0.selectedIdx, var_14_3, var_14_5)
end

function var_0_0.OnSelectTargetIndexCommission(arg_15_0, arg_15_1, arg_15_2)
	if arg_15_0.selectedIdx == arg_15_1 + 1 and not arg_15_2 then
		return
	end

	if not arg_15_2 then
		arg_15_0.selectedShip = nil

		arg_15_0:UnloadPreconcenCharacter()
	end

	arg_15_0.selectedIdx = arg_15_1 + 1
	arg_15_0.contextData.selectedIdx = arg_15_0.selectedIdx

	local var_15_0 = arg_15_0.placeCommissionList[arg_15_0.selectedIdx]

	arg_15_0.selectPanel:ExecuteAction("Show", var_15_0, arg_15_0.selectedShip, function(arg_16_0)
		arg_15_0.contextData.selectedShip = arg_16_0
		arg_15_0.selectedShip = arg_16_0

		arg_15_0:LoadPreconcenCharacter(arg_16_0)
	end, function()
		arg_15_0.contextData.selectedShip = nil
		arg_15_0.selectedShip = nil

		arg_15_0:UnloadPreconcenCharacter()
	end)
	arg_15_0.delegationTabList:align(#arg_15_0.placeCommissionList)
	arg_15_0.delegationList:align(#arg_15_0.placeCommissionList)
end

function var_0_0.UpdateDelegationTabItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_1 + 1

	setActive(arg_18_0:findTF("select", arg_18_2), arg_18_0.selectedIdx == var_18_0)
	setActive(arg_18_0:findTF("unselect", arg_18_2), arg_18_0.selectedIdx ~= var_18_0)

	local var_18_1 = arg_18_0.placeCommissionList[var_18_0]
	local var_18_2 = pg.island_production_commission[var_18_1].slot
	local var_18_3 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_18_0.placeId):GetDelegationSlotData(var_18_2)

	setActive(arg_18_0:findTF("lock", arg_18_2), not var_18_3)
	setButtonEnabled(arg_18_2, var_18_3 ~= nil)

	if arg_18_0.selectedIdx == var_18_0 then
		arg_18_0.selectPanel:ExecuteAction("Flush")
	end

	if not var_18_3 then
		setActive(arg_18_0:findTF("complete ", arg_18_2), false)
		setActive(arg_18_0:findTF("product_icon", arg_18_2), false)

		return
	end

	local var_18_4 = var_18_3:GetSlotRoleData()
	local var_18_5 = var_18_3:GetSlotRewardData()
	local var_18_6 = var_18_4 == nil and var_18_5 ~= nil

	setActive(arg_18_0:findTF("complete ", arg_18_2), var_18_6)

	local var_18_7 = var_18_4 and var_18_4.formula_id or nil

	var_18_7 = var_18_7 or var_18_5 and var_18_5.formula_id or nil

	if var_18_7 then
		setActive(arg_18_0:findTF("product_icon", arg_18_2), true)

		local var_18_8 = pg.island_formula[var_18_7]
		local var_18_9 = pg.island_item_data_template[var_18_8.item_id]

		GetImageSpriteFromAtlasAsync("island/" .. var_18_9.icon, "", arg_18_0:findTF("product_icon", arg_18_2))
	else
		setActive(arg_18_0:findTF("product_icon", arg_18_2), false)
	end
end

function var_0_0.Flush(arg_19_0)
	arg_19_0.delegationList:align(#arg_19_0.placeCommissionList)
	arg_19_0.delegationTabList:align(#arg_19_0.placeCommissionList)
end

function var_0_0.OnShow(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_1 then
		arg_20_0.placeId = arg_20_1
	else
		arg_20_0.placeId = arg_20_0.npcToPlaceCfg[arg_20_2][1]
	end

	arg_20_0.placeCfg = pg.island_production_place[arg_20_0.placeId]
	arg_20_0.placeCommissionList = arg_20_0.placeCfg.commission_slot

	if arg_20_0.placeCfg.delegationCamera then
		IslandCameraMgr.instance:ActiveVirtualCamera(arg_20_0.placeCfg.delegationCamera)
	end

	arg_20_0.timeMgr = pg.TimeMgr.GetInstance()
	arg_20_0.selectedShip = arg_20_0.contextData.selectedShip

	arg_20_0:DefaultTargetTabIndex()

	if arg_20_0.selectedShip then
		arg_20_0:LoadPreconcenCharacter(arg_20_0.selectedShip)
	end

	arg_20_0:StopTimer()
	arg_20_0:StartTimer()
	setText(arg_20_0:findTF("top/title/Text"), arg_20_0.placeCfg.name)
	setText(arg_20_0:findTF("top/title/Text/en"), "PRODUCTING")
end

function var_0_0.DefaultTargetTabIndex(arg_21_0)
	local var_21_0 = arg_21_0.contextData.selectedIdx or 1

	arg_21_0:OnSelectTargetIndexCommission(var_21_0 - 1, true)
end

function var_0_0.OnHide(arg_22_0)
	arg_22_0:StopTimer()
	arg_22_0:emitCore(ISLAND_EVT.RECYCLE_ALL_SLOTDELEEFFECT)
	arg_22_0:UnloadPreconcenCharacter()
end

function var_0_0.OnExit(arg_23_0)
	arg_23_0.contextData.selectedIdx = nil
	arg_23_0.contextData.selectedShip = nil
end

function var_0_0.StartTimer(arg_24_0)
	setActive(arg_24_0.content, false)

	arg_24_0.timer = Timer.New(function()
		setActive(arg_24_0.content, true)
		arg_24_0:Flush()
	end, var_0_1, 0)

	arg_24_0.timer:Start()
end

function var_0_0.StopTimer(arg_26_0)
	if arg_26_0.timer ~= nil then
		arg_26_0.timer:Stop()

		arg_26_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_27_0)
	arg_27_0:StopTimer()

	if arg_27_0.selectPanel then
		arg_27_0.selectPanel:Destroy()

		arg_27_0.selectPanel = nil
	end
end

function var_0_0.OnGetDelegationAwardDone(arg_28_0)
	arg_28_0.delegationTabList:align(#arg_28_0.placeCommissionList)
end

function var_0_0.OnFinishDelegationDone(arg_29_0)
	arg_29_0.delegationTabList:align(#arg_29_0.placeCommissionList)
end

function var_0_0.OnUseTicketDone(arg_30_0, arg_30_1)
	if arg_30_1.type == IslandUseTicketCommand.TYPES.APPOINT then
		arg_30_0.delegationTabList:align(#arg_30_0.placeCommissionList)
	end
end

function var_0_0.OnDelegationStartDone(arg_31_0)
	arg_31_0.delegationTabList:align(#arg_31_0.placeCommissionList)
end

function var_0_0.LoadPreconcenCharacter(arg_32_0, arg_32_1)
	arg_32_0:UnloadPreconcenCharacter()

	local var_32_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_32_1)
	local var_32_1 = arg_32_0.placeCommissionList[arg_32_0.selectedIdx]
	local var_32_2 = pg.island_production_commission[var_32_1].birthplace

	arg_32_0:emitCore(ISLAND_EVT.LOAD_DELEGATE_PREVIEW_ROLE, var_32_0:GetModel(), var_32_2)
end

function var_0_0.UnloadPreconcenCharacter(arg_33_0)
	arg_33_0:emitCore(ISLAND_EVT.UN_LOAD_DELEGATE_PREVIEW_ROLE)
end

return var_0_0
