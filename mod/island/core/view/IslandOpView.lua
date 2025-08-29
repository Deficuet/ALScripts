local var_0_0 = class("IslandOpView", import(".IslandBaseOpView"))

var_0_0.OperationType = {
	Interaction = 1,
	MiningCollect = 3,
	None = 0,
	Harvest = 4,
	FellCollect = 6,
	WildGather = 5,
	Plant = 2
}

function var_0_0.GetUIName(arg_1_0)
	return "IslandOpUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	arg_2_0.showBalance = 1
	arg_2_0.timers = {}
	arg_2_0.inputController = IslandCameraMgr.instance.gameObject:GetComponent(typeof(InputController))
	arg_2_0._go = arg_2_1
	arg_2_0._tf = arg_2_1.transform
	arg_2_0.timeMgr = pg.TimeMgr.GetInstance()
	arg_2_0.interactionPanel = arg_2_0._tf:Find("interaction_btns")
	arg_2_0.interactionUIItemList = UIItemList.New(arg_2_0.interactionPanel, arg_2_0.interactionPanel:Find("interaction"))
	arg_2_0.opPanel = arg_2_0._tf:Find("op_btns")
	arg_2_0.opBtn = arg_2_0.opPanel:Find("op_btn")
	arg_2_0.opBtnList = {
		arg_2_0.opBtn:Find("interaction"),
		arg_2_0.opBtn:Find("plant"),
		arg_2_0.opBtn:Find("miningCollect"),
		arg_2_0.opBtn:Find("harvest"),
		arg_2_0.opBtn:Find("wildgather"),
		arg_2_0.opBtn:Find("fellCollect")
	}
	arg_2_0.seedBtn = arg_2_0.opPanel:Find("seed")
	arg_2_0.seedEmpty = arg_2_0.seedBtn:Find("seedEmpty")
	arg_2_0.seedSelectPlane = arg_2_0._tf:Find("seed_select")
	arg_2_0.seedSelectPlaneCloseBg = arg_2_0._tf:Find("seed_select_closeBg")
	arg_2_0.seed_detals = arg_2_0._tf:Find("seed_detals")
	arg_2_0.animationOpBtn = arg_2_0.opPanel:Find("aniamtionop")

	setActive(arg_2_0.seed_detals, false)
	arg_2_0:ActiveSeedSelect(false)
	onButton(arg_2_0, arg_2_0.seedSelectPlaneCloseBg, function()
		setActive(arg_2_0.seed_detals, false)
		arg_2_0:ActiveSeedSelect(false)
	end, SFX_PANEL)

	arg_2_0.uiSeedItemList = UIItemList.New(arg_2_0.seedSelectPlane:Find("content"), arg_2_0.seedSelectPlane:Find("content/itemSeed"))
	arg_2_0.isSelectSeedPlane = false
	arg_2_0.areaChangeBtn = arg_2_0.opPanel:Find("scope")
	arg_2_0.interactionBtnOther = arg_2_0.opPanel:Find("interaction")
	arg_2_0.run = arg_2_0.opPanel:Find("run")
	arg_2_0.moveBtn = arg_2_0._tf:Find("move")

	setActive(arg_2_0.opPanel, true)

	arg_2_0.targetTracker = IslandTargetTracker.New(arg_2_0._tf)

	arg_2_0:ShowInterActionPanel({
		type = -1
	})
	onButton(arg_2_0, arg_2_0.areaChangeBtn, function()
		arg_2_0:Emit(ISLAND_EVT.AREACHANGE)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.animationOpBtn, function()
		arg_2_0:Emit(ISLAND_EVT.OPEN_ANIMATION_OP)
	end, SFX_PANEL)

	arg_2_0.operationType = var_0_0.OperationType.None

	arg_2_0:UpdateOperationButtonDisplay()

	arg_2_0.playerInputManager = arg_2_0.view:GetController().playerInputManager
end

function var_0_0.UpdateOperationButton(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_1 == var_0_0.OperationType.None then
		if arg_6_0.unitId == arg_6_2 then
			arg_6_0.unitId = nil
			arg_6_0.operationType = arg_6_1
		end
	else
		arg_6_0.unitId = arg_6_2
		arg_6_0.operationType = arg_6_1
	end

	arg_6_0:UpdateOperationButtonDisplay()
end

function var_0_0.UpdateOperationButtonDisplay(arg_7_0)
	if arg_7_0.operationType == var_0_0.OperationType.None then
		setActive(arg_7_0.opBtn, false)
		setActive(arg_7_0.areaChangeBtn, false)
		setActive(arg_7_0.seedBtn, false)
		setActive(arg_7_0.seed_detals, false)
		arg_7_0:ActiveSeedSelect(false)

		return
	end

	function OptionBtnDisplay(arg_8_0)
		for iter_8_0, iter_8_1 in ipairs(arg_7_0.opBtnList) do
			local var_8_0 = iter_8_0 == arg_8_0

			setActive(iter_8_1, var_8_0)
		end
	end

	setActive(arg_7_0.opBtn, true)

	local function var_7_0()
		OptionBtnDisplay(arg_7_0.operationType)
		onButton(arg_7_0, arg_7_0.opBtn, function()
			local var_10_0 = arg_7_0.view:GetCore()
			local var_10_1 = arg_7_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_7_0.unitId)
			local var_10_2 = var_10_1:GetToolId()
			local var_10_3 = var_10_1:GetAnimatorTrigger()
			local var_10_4 = var_10_1:StartColloct(var_10_2)

			if var_10_4 == 3 then
				var_10_0.controller.playerInputManager:UpdataWorkStateFunc(var_10_3, var_10_1.position, var_10_2)
			elseif var_10_4 == 2 then
				var_10_0.controller.playerInputManager:UpdataWorkStateFunc(var_10_3, var_10_1.position, var_10_2)
				arg_7_0.view:OnUpdateHud(arg_7_0.unitId)
			end
		end, SFX_PANEL)
		setActive(arg_7_0.areaChangeBtn, false)
		setActive(arg_7_0.seedBtn, false)
	end

	switch(arg_7_0.operationType, {
		[var_0_0.OperationType.Plant] = function()
			local var_11_0 = arg_7_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_7_0.unitId)

			if var_11_0:CanHarvest() then
				OptionBtnDisplay(var_0_0.OperationType.Harvest)
				onButton(arg_7_0, arg_7_0.opBtn, function()
					arg_7_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.GAHTER_FLAG, var_11_0.position)

					local var_12_0 = {}

					for iter_12_0, iter_12_1 in ipairs(arg_7_0.view.detectionSystem:GetAreaList()) do
						local var_12_1 = arg_7_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, iter_12_1)

						table.insert(var_12_0, var_12_1.handDate.configId)
					end

					pg.m02:sendNotification(GAME.ISLAND_START_HANDLE_HARVEST, {
						slot_list = var_12_0
					})
				end, SFX_PANEL)
				setActive(arg_7_0.seedBtn, false)
			elseif var_11_0:CanPlant() then
				IslandGuideChecker.CheckGuide("ISLAND_GUIDE_22")
				OptionBtnDisplay(var_0_0.OperationType.Plant)
				onButton(arg_7_0, arg_7_0.opBtn, function()
					if not arg_7_0.selectseedItemId then
						pg.TipsMgr.GetInstance():ShowTips("点左下角空白按钮选个种子再种地")

						return
					end

					local var_13_0 = pg.island_farm_seed[arg_7_0.selectseedItemId]
					local var_13_1 = pg.island_formula[var_13_0.formulaid]
					local var_13_2 = #arg_7_0.view.detectionSystem:GetAreaList()

					if not (function(arg_14_0)
						local var_14_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

						for iter_14_0, iter_14_1 in ipairs(arg_14_0) do
							local var_14_1 = iter_14_1[1]
							local var_14_2 = iter_14_1[2]

							if var_14_0:GetItemById(var_14_1):GetCount() < var_14_2 * var_13_2 then
								return false
							end

							return true
						end
					end)(var_13_1.cost) then
						pg.TipsMgr.GetInstance():ShowTips("种子数量不够")

						return
					end

					local var_13_3 = {}

					for iter_13_0, iter_13_1 in ipairs(arg_7_0.view.detectionSystem:GetAreaList()) do
						local var_13_4 = arg_7_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, iter_13_1)

						table.insert(var_13_3, var_13_4.handDate.configId)
					end

					pg.m02:sendNotification(GAME.ISLAND_START_HANDLE_PLANT, {
						slot_list = var_13_3,
						formula_id = var_13_0.formulaid
					})
					arg_7_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.SOW_FLAG, var_11_0.position)
				end, SFX_PANEL)

				local var_11_1 = arg_7_0:CheckSeedEmpty(var_11_0)

				setActive(arg_7_0.seedEmpty, var_11_1)
				setActive(arg_7_0.seedBtn, true)
				setActive(arg_7_0.seedBtn:Find("seedItem"), not var_11_1)

				if not var_11_1 then
					onButton(arg_7_0, arg_7_0.seedBtn, function()
						arg_7_0:ActiveSeedSelect(true)
						arg_7_0:RefreshSeedPlane(var_11_0)
					end, SFX_PANEL)
					arg_7_0:RefreshCurrentSlectSeed()
				end
			else
				OptionBtnDisplay(var_0_0.OperationType.Interaction)
				onButton(arg_7_0, arg_7_0.opBtn, function()
					pg.TipsMgr.GetInstance():ShowTips("正在种植中,等等吧")
				end, SFX_PANEL)
				setActive(arg_7_0.seedBtn, false)
			end

			setActive(arg_7_0.areaChangeBtn, getProxy(IslandProxy):GetIsland():GetAblityAgency():IsUnlockAreaPlant())
		end,
		[var_0_0.OperationType.MiningCollect] = function()
			var_7_0()
		end,
		[var_0_0.OperationType.WildGather] = function()
			local var_18_0 = arg_7_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_7_0.unitId)
			local var_18_1 = arg_7_0.view:GetIsland()

			if var_18_1.id == getProxy(IslandProxy):GetIsland().id then
				OptionBtnDisplay(var_0_0.OperationType.WildGather)
				onButton(arg_7_0, arg_7_0.opBtn, function()
					arg_7_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.GAHTERD_FLAG, var_18_0.position)
					var_18_0:StartGather(var_18_1.id)
				end, SFX_PANEL)
			elseif var_18_0:CheckGatherCanSign() then
				OptionBtnDisplay(var_0_0.OperationType.WildGather)
				onButton(arg_7_0, arg_7_0.opBtn, function()
					var_18_0:StartGaherSign(var_18_1.id)
				end, SFX_PANEL)
			else
				setActive(arg_7_0.opBtn, false)
			end
		end,
		[var_0_0.OperationType.FellCollect] = function()
			var_7_0()
		end
	})
end

function var_0_0.ActiveSeedSelect(arg_22_0, arg_22_1)
	setActive(arg_22_0.seedSelectPlane, arg_22_1)
	setActive(arg_22_0.seedSelectPlaneCloseBg, arg_22_1)
end

function var_0_0.RefreshSeedPlane(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1:GetDataVO().slotData.configId
	local var_23_1 = pg.island_production_slot[var_23_0].place
	local var_23_2 = pg.island_production_place[var_23_1].seed_list
	local var_23_3 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_23_4 = {}

	for iter_23_0, iter_23_1 in ipairs(var_23_2) do
		local var_23_5 = var_23_3:GetItemById(iter_23_1)

		table.insert(var_23_4, var_23_5)
	end

	local var_23_6 = #var_23_4
	local var_23_7 = 30
	local var_23_8 = 40
	local var_23_9 = arg_23_0.seedSelectPlane:Find("content"):GetComponent(typeof(GridLayoutGroup))
	local var_23_10 = var_23_9.cellSize.x
	local var_23_11 = var_23_9.cellSize.y
	local var_23_12 = math.min(var_23_6, 7)
	local var_23_13 = math.ceil(var_23_6 / 7)
	local var_23_14 = var_23_10 * var_23_12 + var_23_9.spacing.x * (var_23_12 - 1) + var_23_9.padding.right + var_23_8
	local var_23_15 = var_23_11 * var_23_13 + var_23_9.spacing.y * (var_23_13 - 1) + var_23_9.padding.bottom + var_23_7

	arg_23_0.seedSelectPlane:Find("content").sizeDelta = Vector2(var_23_14, var_23_15)

	arg_23_0.uiSeedItemList:make(function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 == UIItemList.EventUpdate then
			local var_24_0 = var_23_4[arg_24_1 + 1]

			setActive(arg_24_2:Find("select"), arg_23_0.selectseedItemId == var_24_0.id)
			updateCustomDrop(arg_24_2, Drop.New({
				type = DROP_TYPE_ISLAND_ITEM,
				id = var_24_0.id,
				count = var_24_0:GetCount()
			}))

			local var_24_1

			onButton(arg_23_0, arg_24_2, function()
				if var_24_1 then
					var_24_1 = false

					return
				end

				arg_23_0.selectseedItemId = var_24_0.id

				PlayerPrefs.SetInt("island_last_selectItemId", arg_23_0.selectseedItemId)
				arg_23_0.uiSeedItemList:align(var_23_6)
				arg_23_0:RefreshCurrentSlectSeed()
				arg_23_0:ActiveSeedSelect(false)
				setActive(arg_23_0.seed_detals, false)
			end, SFX_PANEL)
			GetOrAddComponent(arg_24_2, typeof(UILongPressTrigger)).onLongPressed:AddListener(function()
				var_24_1 = true

				setActive(arg_23_0.seed_detals, true)

				arg_23_0.seed_detals.position = arg_24_2.position

				setText(arg_23_0.seed_detals:Find("bg/itemSeed/icon_bg/count_bg/count"), var_24_0:GetCount())

				local var_26_0 = var_24_0:GetIcon()

				GetImageSpriteFromAtlasAsync(var_26_0, "", arg_23_0.seed_detals:Find("bg/itemSeed/icon_bg/icon"))

				local var_26_1 = arg_23_0.seed_detals:Find("bg/detaiView/Viewport/detaiViewText")

				setText(var_26_1, var_24_0:GetDesc())
				setText(arg_23_0.seed_detals:Find("bg/seedName"), var_24_0:GetName())
			end)
		end
	end)
	arg_23_0.uiSeedItemList:align(var_23_6)
end

function var_0_0.GetOriginSelectItem(arg_27_0)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in ipairs(seedList) do
		local var_27_1 = inventory:GetItemById(iter_27_1)

		table.insert(var_27_0, var_27_1)
	end

	local var_27_2 = PlayerPrefs.GetInt("island_last_selectItemId", 0)

	if var_27_2 ~= 0 and inventory:GetOwnCount(var_27_2) > 0 then
		arg_27_0.selectseedItemId = var_27_2
	elseif #var_27_0 > 0 then
		arg_27_0.selectseedItemId = var_27_0[1].id
	end
end

function var_0_0.RefreshCurrentSlectSeed(arg_28_0)
	local var_28_0 = arg_28_0.seedBtn:Find("seedItem")

	if not arg_28_0.selectseedItemId then
		setActive(var_28_0, false)

		return
	end

	setActive(var_28_0, true)

	local var_28_1 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetItemById(arg_28_0.selectseedItemId)

	if not var_28_1 then
		arg_28_0.selectseedItemId = nil

		setActive(var_28_0, false)

		return
	end

	setText(var_28_0:Find("count"), var_28_1:GetCount())

	local var_28_2 = "island/" .. var_28_1:GetIcon()

	GetImageSpriteFromAtlasAsync(var_28_2, "", var_28_0:Find("icon"))
end

function var_0_0.CheckSeedEmpty(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1:GetDataVO().slotData.configId
	local var_29_1 = pg.island_production_slot[var_29_0].place
	local var_29_2 = pg.island_production_place[var_29_1].seed_list
	local var_29_3 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	arg_29_0.selectseedItemId = nil

	local var_29_4 = PlayerPrefs.GetInt("island_last_selectItemId", 0)

	if var_29_4 ~= 0 and var_29_3:GetOwnCount(var_29_4) > 0 then
		arg_29_0.selectseedItemId = var_29_4
	end

	for iter_29_0, iter_29_1 in ipairs(var_29_2) do
		local var_29_5 = var_29_3:GetItemById(iter_29_1)

		if var_29_5 and var_29_5:GetCount() ~= 0 then
			if not arg_29_0.selectseedItemId then
				arg_29_0.selectseedItemId = iter_29_1
			end

			return false
		end
	end

	return true
end

function var_0_0.OnUpdate(arg_30_0)
	arg_30_0.targetTracker:Update()
end

function var_0_0.ShowInterActionPanel(arg_31_0, arg_31_1)
	arg_31_0:UpdateInteractionBtns(arg_31_1)
end

function var_0_0.UpdateInteractionBtns(arg_32_0, arg_32_1)
	arg_32_0.interactionData = arg_32_1

	local var_32_0 = arg_32_0.interactionData.id
	local var_32_1 = IslandInteractionUntil.GetInteractionOptions(arg_32_0:GetView():GetIsland(), arg_32_0.interactionData.type, var_32_0)

	arg_32_0:RemoveTimers()
	arg_32_0.interactionUIItemList:make(function(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_0 == UIItemList.EventUpdate then
			local var_33_0 = var_32_1[arg_33_1 + 1]

			arg_33_2.name = var_33_0.id

			onButton(arg_32_0, arg_33_2, function()
				if arg_32_0.interactionData.callback then
					arg_32_0.interactionData.callback()
				end

				IslandInteractionUntil.Response(arg_32_0, var_32_0, var_33_0.id)
			end, SFX_PANEL)
			arg_32_0:SetInteractionText(arg_33_2, var_33_0)
		end
	end)
	arg_32_0.interactionUIItemList:align(#var_32_1)
end

function var_0_0.CloseInterActionPanelByUnitIdRemove(arg_35_0, arg_35_1)
	if not arg_35_0.interactionData then
		return
	end

	if arg_35_0.interactionData.id == arg_35_1 then
		arg_35_0:HideInterActionPanel()
	end
end

function var_0_0.ShowNextInteractionBtns(arg_36_0, arg_36_1)
	arg_36_0.interactionData.type = tonumber(arg_36_1)

	arg_36_0:UpdateInteractionBtns(arg_36_0.interactionData)
end

function var_0_0.SetInteractionText(arg_37_0, arg_37_1, arg_37_2)
	if arg_37_2.id == IslandInteractionUntil.SIGNIN_TIME_ID then
		setActive(arg_37_1:Find("time"), true)
		arg_37_0:AddTimer(arg_37_1, arg_37_2)
	else
		setActive(arg_37_1:Find("time"), false)
	end

	setText(arg_37_1:Find("bg/Text"), HXSet.hxLan(arg_37_2.text))

	local var_37_0 = GetSpriteFromAtlas("island/IslandInteractionBtns", tostring(arg_37_2.icon))

	setImageSprite(arg_37_1:Find("icon_type"), var_37_0, true)
end

function var_0_0.AddTimer(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = arg_38_0:GetView():GetIsland():GetSignInAgency():GetNextCanSignInTime()
	local var_38_1 = Timer.New(function()
		local var_39_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_39_1 = var_38_0 - var_39_0

		if var_39_1 <= 0 then
			setActive(arg_38_1:Find("time"), false)
			arg_38_0:RemoveTimers()
			arg_38_0:RefreshInteractionBtns()
		else
			setText(arg_38_1:Find("time/Text"), pg.TimeMgr.GetInstance():DescCDTime(var_39_1))
		end
	end, 1, -1)

	arg_38_0.timers[arg_38_2.id] = var_38_1

	arg_38_0.timers[arg_38_2.id].func()
	var_38_1:Start()
end

function var_0_0.RemoveTimers(arg_40_0)
	for iter_40_0, iter_40_1 in pairs(arg_40_0.timers) do
		iter_40_1:Stop()
	end

	arg_40_0.timers = {}
end

function var_0_0.RefreshInteractionBtns(arg_41_0)
	if not arg_41_0.interactionData then
		return
	end

	arg_41_0:UpdateInteractionBtns(arg_41_0.interactionData)
end

function var_0_0.HideInterActionPanel(arg_42_0)
	arg_42_0:RemoveTimers()

	arg_42_0.interactionData = nil

	arg_42_0.interactionUIItemList:align(0)
	removeOnButton(arg_42_0.opBtn)
end

function var_0_0.TryDisablePlayerOp(arg_43_0)
	arg_43_0.showBalance = arg_43_0.showBalance - 1

	if arg_43_0.showBalance == 0 then
		arg_43_0:DisablePlayerOp()
	end
end

function var_0_0.TryEnablePlayerOp(arg_44_0)
	arg_44_0.showBalance = arg_44_0.showBalance + 1

	if arg_44_0.showBalance == 1 then
		arg_44_0:EnablePlayerOp()
	end
end

function var_0_0.ResetShowBalance(arg_45_0)
	if arg_45_0.showBalance ~= 1 then
		arg_45_0.showBalance = 1
	end
end

function var_0_0.DisablePlayerOp(arg_46_0)
	setActive(arg_46_0.opPanel, false)
	setActive(arg_46_0.moveBtn, false)
	arg_46_0:DisableInteraction()
	arg_46_0.playerInputManager:DisableInput()
	arg_46_0.targetTracker:Disable()
	arg_46_0:GetView().player:ActiveOrDisactive(false)
end

function var_0_0.EnablePlayerOp(arg_47_0)
	setActive(arg_47_0.opPanel, true)
	setActive(arg_47_0.moveBtn, true)
	arg_47_0:EnableInteraction()
	arg_47_0.playerInputManager:EnableInput()
	arg_47_0.targetTracker:Enable()
	arg_47_0:GetView().player:ActiveOrDisactive(true)
end

function var_0_0.StartInteraction(arg_48_0)
	setActive(arg_48_0.moveBtn, false)
	setActive(arg_48_0.opPanel, false)
	arg_48_0.playerInputManager:DisablePlayerHandle()
end

function var_0_0.EndInteraction(arg_49_0)
	setActive(arg_49_0.moveBtn, true)
	setActive(arg_49_0.opPanel, true)
	arg_49_0.playerInputManager:EnablePlayerHandle()
end

function var_0_0.DisableInput(arg_50_0)
	arg_50_0.playerInputManager:DisableInput()
end

function var_0_0.EnableInput(arg_51_0)
	arg_51_0.playerInputManager:EnableInput()
end

function var_0_0.EnableInteraction(arg_52_0)
	setActive(arg_52_0.interactionPanel, true)
end

function var_0_0.DisableInteraction(arg_53_0)
	setActive(arg_53_0.interactionPanel, false)
end

function var_0_0.SetTrackingTarget(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
	arg_54_0.targetTracker:Tracking(arg_54_1._go, arg_54_2._go, arg_54_3)
end

function var_0_0.CancelTracking(arg_55_0)
	arg_55_0.targetTracker:UnTracking()
end

function var_0_0.OnShowHud(arg_56_0, arg_56_1)
	arg_56_0.targetTracker:OnShowHud(arg_56_1)
end

function var_0_0.OnHideHud(arg_57_0, arg_57_1)
	arg_57_0.targetTracker:OnHideHud(arg_57_1)
end

function var_0_0.OnDestroy(arg_58_0)
	pg.DelegateInfo.Dispose(arg_58_0)
	arg_58_0:RemoveTimers()

	if arg_58_0.targetTracker then
		arg_58_0.targetTracker:Dispose()

		arg_58_0.targetTracker = nil
	end
end

return var_0_0
