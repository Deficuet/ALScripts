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
	return "IslandEmptyUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	arg_2_0.opUI = arg_2_0:GetPoolMgr():GetOpUI().transform

	setParent(arg_2_0.opUI, arg_2_1)

	arg_2_0.showBalance = arg_2_0:GetView():GetCacheOpCount() or 1
	arg_2_0.inputController = IslandCameraMgr.instance.gameObject:GetComponent(typeof(InputController))
	arg_2_0._go = arg_2_1
	arg_2_0._tf = arg_2_1.transform
	arg_2_0.opPanel = arg_2_0.opUI:Find("op_btns")
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
	arg_2_0.areaChangeBtn = arg_2_0.opPanel:Find("scope")
	arg_2_0.run = arg_2_0.opPanel:Find("run")
	arg_2_0.moveBtn = arg_2_0.opUI:Find("move")
	arg_2_0.animationOpBtn = arg_2_0.opPanel:Find("aniamtionop")
	arg_2_0.animationOpEffect = arg_2_0.animationOpBtn:Find("effect")
	arg_2_0.followerBtn = arg_2_0.opPanel:Find("follower")
	arg_2_0.animationOpEffectCounter = {}

	local var_2_0 = arg_2_0.followerBtn:GetComponent(typeof(ItemList))

	arg_2_0.uiFollowerPanel = arg_2_0.followerBtn:Find("list")
	arg_2_0.uiFollowerList = UIItemList.New(arg_2_0.uiFollowerPanel, var_2_0.prefabItem[0])

	setActive(arg_2_0.opPanel, true)
	onButton(arg_2_0, arg_2_0.areaChangeBtn, function()
		arg_2_0:NotifiyCore(ISLAND_EVT.AREACHANGE)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.animationOpBtn, function()
		arg_2_0:NotifiyCore(ISLAND_EVT.OPEN_ANIMATION_OP)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.followerBtn, function()
		if isActive(arg_2_0.uiFollowerPanel) then
			arg_2_0:RemoveFollowerListTimer()
			setActive(arg_2_0.uiFollowerPanel, false)
		else
			arg_2_0:ShowFollowerList()
		end
	end, SFX_PANEL)

	arg_2_0.operationType = var_0_0.OperationType.None

	arg_2_0:UpdateOperationButtonDisplay()

	arg_2_0.playerInputManager = arg_2_0.view:GetController().playerInputManager

	arg_2_0:InitOpCustumPositon()
	arg_2_0:UpdateFollowBtn()
	arg_2_0:UpdateAnimationOpBtn()
end

function var_0_0.LaterInit(arg_6_0)
	if arg_6_0.showBalance < 1 then
		arg_6_0:DisablePlayerOp()
	end
end

function var_0_0.UpdateAnimationOpBtn(arg_7_0)
	local var_7_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	setActive(arg_7_0.animationOpBtn, var_7_0:HasAbility(IslandAblityAgency.ANIMATION_OP_ID))
end

function var_0_0.UpdateAnimationOpEffect(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_2 then
		table.insert(arg_8_0.animationOpEffectCounter, arg_8_1)
	else
		table.removebyvalue(arg_8_0.animationOpEffectCounter, arg_8_1)
	end

	local var_8_0 = _.map(arg_8_0.animationOpEffectCounter, function(arg_9_0)
		local var_9_0, var_9_1 = IslandCalcUtil.GetTypeAndIdByUniqueId(arg_9_0)

		return arg_8_0:GetView():GetUnitModuleWithType(var_9_0, var_9_1)
	end)
	local var_8_1 = _.detect(var_8_0, function(arg_10_0)
		return arg_10_0 and isa(arg_10_0, IslandStrollNpcUnit) and arg_10_0:ExistActionFeedbackBubble()
	end)

	setActive(arg_8_0.animationOpEffect, var_8_1)
end

function var_0_0.UpdateFollowBtn(arg_11_0)
	if #getProxy(IslandProxy):GetIsland():GetFollowerAgency():GetFollowers() <= 0 or not arg_11_0:IsSelfIsland() then
		setActive(arg_11_0.followerBtn, false)

		return
	end

	setActive(arg_11_0.followerBtn, true)
end

function var_0_0.ShowFollowerList(arg_12_0)
	local var_12_0 = getProxy(IslandProxy):GetIsland()
	local var_12_1 = var_12_0:GetFollowerAgency():GetFollowers()
	local var_12_2 = var_12_0:GetCharacterAgency()

	if #var_12_1 <= 0 then
		return
	end

	arg_12_0.uiFollowerList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = var_12_1[arg_13_1 + 1]
			local var_13_1 = var_12_2:GetShipById(var_13_0)
			local var_13_2 = IslandShip.StaticGetPrefab(var_13_1.configId)

			GetImageSpriteFromAtlasAsync("island/IslandShipIcon/" .. var_13_2, "", arg_13_2:Find("icon"))
			onButton(arg_12_0, arg_13_2, function()
				arg_12_0:NotifiyMeditor(IslandMediator.DEL_FOLLOWER, var_13_1.id)
			end, SFX_PANEL)
		end
	end)
	arg_12_0.uiFollowerList:align(#var_12_1)
	setActive(arg_12_0.uiFollowerPanel, true)
	arg_12_0:AddDisableFollowerListTimer()
end

function var_0_0.AddDisableFollowerListTimer(arg_15_0)
	arg_15_0:RemoveFollowerListTimer()

	arg_15_0.followerTimer = Timer.New(function()
		arg_15_0:RemoveFollowerListTimer()
		setActive(arg_15_0.uiFollowerPanel, false)
	end, 5, 1)

	arg_15_0.followerTimer:Start()
end

function var_0_0.RemoveFollowerListTimer(arg_17_0)
	if arg_17_0.followerTimer then
		arg_17_0.followerTimer:Stop()

		arg_17_0.followerTimer = nil
	end
end

function var_0_0.FlushFollowerList(arg_18_0)
	arg_18_0:UpdateFollowBtn()

	if not arg_18_0.followerTimer then
		return
	end

	arg_18_0:ShowFollowerList()
end

function var_0_0.InitOpCustumPositon(arg_19_0)
	local var_19_0 = tf(GameObject.Find("UICamera/Canvas")).sizeDelta
	local var_19_1 = var_19_0.x / IslandSettingsConst.settingRectSize.x
	local var_19_2 = var_19_0.y / IslandSettingsConst.settingRectSize.y
	local var_19_3 = IslandSettingsConst.ISLAND_JOY_STICK_DEFAULT_PREFERENCE
	local var_19_4 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_JOYSTICK_ANCHORX, var_19_3.x)
	local var_19_5 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_JOYSTICK_ANCHORY, var_19_3.y)

	arg_19_0.moveBtn.anchoredPosition = Vector2(var_19_4 * var_19_1, var_19_5 * var_19_2)

	local var_19_6 = {
		arg_19_0.opBtn,
		arg_19_0.opPanel:Find("jump"),
		arg_19_0.areaChangeBtn,
		arg_19_0.seedBtn
	}

	for iter_19_0, iter_19_1 in ipairs(var_19_6) do
		local var_19_7 = IslandSettingsConst.OPERATION_DEFAULT_PREFERENCE[iter_19_0]
		local var_19_8 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_OPERATION_ANCHORX[iter_19_0], var_19_7.x)
		local var_19_9 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_OPERATION_ANCHORY[iter_19_0], var_19_7.y)

		iter_19_1.anchoredPosition = Vector2(var_19_8 * var_19_1, var_19_9 * var_19_2)
	end
end

function var_0_0.UpdateOperationButton(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_1 == var_0_0.OperationType.None then
		if arg_20_0.unitId == arg_20_2 then
			arg_20_0.unitId = nil
			arg_20_0.operationType = arg_20_1
		end
	else
		arg_20_0.unitId = arg_20_2
		arg_20_0.operationType = arg_20_1
	end

	arg_20_0:UpdateOperationButtonDisplay()
end

function var_0_0.UpdateOperationButtonDisplay(arg_21_0)
	if arg_21_0.operationType == var_0_0.OperationType.None then
		setActive(arg_21_0.opBtn, false)
		setActive(arg_21_0.areaChangeBtn, false)
		setActive(arg_21_0.seedBtn, false)
		arg_21_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedSelect(false)
		arg_21_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedDetals(false)

		return
	end

	function OptionBtnDisplay(arg_22_0)
		for iter_22_0, iter_22_1 in ipairs(arg_21_0.opBtnList) do
			local var_22_0 = iter_22_0 == arg_22_0

			setActive(iter_22_1, var_22_0)
		end
	end

	if not arg_21_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_21_0.unitId) then
		setActive(arg_21_0.opBtn, false)
		setActive(arg_21_0.areaChangeBtn, false)
		setActive(arg_21_0.seedBtn, false)
		arg_21_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedSelect(false)
		arg_21_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedDetals(false)

		return
	end

	setActive(arg_21_0.opBtn, true)

	local function var_21_0()
		OptionBtnDisplay(arg_21_0.operationType)
		onButton(arg_21_0, arg_21_0.opBtn, function()
			local var_24_0 = arg_21_0.view:GetCore()
			local var_24_1 = arg_21_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_21_0.unitId)
			local var_24_2 = var_24_1:GetAnimatorTrigger()

			if var_24_1:CheckCanStartColloct() then
				var_24_0.controller.playerInputManager:UpdataWorkStateFunc(var_24_2, var_24_1)
			end
		end, SFX_PANEL)
		setActive(arg_21_0.areaChangeBtn, false)
		setActive(arg_21_0.seedBtn, false)
	end

	switch(arg_21_0.operationType, {
		[var_0_0.OperationType.Plant] = function()
			local var_25_0 = arg_21_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_21_0.unitId)

			if var_25_0:CanHarvest() then
				OptionBtnDisplay(var_0_0.OperationType.Harvest)
				onButton(arg_21_0, arg_21_0.opBtn, function()
					arg_21_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.GAHTER_FLAG, var_25_0)

					local var_26_0 = {}

					for iter_26_0, iter_26_1 in ipairs(arg_21_0.view.detectionSystem:GetAreaList()) do
						local var_26_1 = arg_21_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, iter_26_1)

						table.insert(var_26_0, var_26_1.handDate.configId)
					end

					pg.m02:sendNotification(GAME.ISLAND_START_HANDLE_HARVEST, {
						slot_list = var_26_0
					})
				end, SFX_PANEL)
				setActive(arg_21_0.seedBtn, false)
			elseif var_25_0:CanPlant() then
				IslandGuideChecker.CheckGuide("ISLAND_GUIDE_22")
				OptionBtnDisplay(var_0_0.OperationType.Plant)
				onButton(arg_21_0, arg_21_0.opBtn, function()
					if not arg_21_0:GetView():GetSubView(IslandSeedOpView).selectseedItemId then
						pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_seeds_empty"))

						return
					end

					local var_27_0 = pg.island_farm_seed[arg_21_0:GetView():GetSubView(IslandSeedOpView).selectseedItemId]
					local var_27_1 = pg.island_formula[var_27_0.formulaid]
					local var_27_2 = #arg_21_0.view.detectionSystem:GetAreaList()

					if not (function(arg_28_0)
						local var_28_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

						for iter_28_0, iter_28_1 in ipairs(arg_28_0) do
							local var_28_1 = iter_28_1[1]
							local var_28_2 = iter_28_1[2]

							if var_28_0:GetItemById(var_28_1):GetCount() < var_28_2 * var_27_2 then
								return false
							end

							return true
						end
					end)(var_27_1.cost) then
						pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_seeds_notenough"))

						return
					end

					local var_27_3 = {}

					for iter_27_0, iter_27_1 in ipairs(arg_21_0.view.detectionSystem:GetAreaList()) do
						local var_27_4 = arg_21_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, iter_27_1)

						table.insert(var_27_3, var_27_4.handDate.configId)
					end

					pg.m02:sendNotification(GAME.ISLAND_START_HANDLE_PLANT, {
						slot_list = var_27_3,
						formula_id = var_27_0.formulaid
					})
					arg_21_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.SOW_FLAG, var_25_0)
				end, SFX_PANEL)

				local var_25_1 = arg_21_0:GetView():GetSubView(IslandSeedOpView):CheckSeedEmpty(var_25_0)

				setActive(arg_21_0.seedEmpty, var_25_1)
				setActive(arg_21_0.seedBtn, true)
				setActive(arg_21_0.seedBtn:Find("seedItem"), not var_25_1)

				if not var_25_1 then
					onButton(arg_21_0, arg_21_0.seedBtn, function()
						arg_21_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedSelect(true)
						arg_21_0:GetView():GetSubView(IslandSeedOpView):RefreshSeedPlane(var_25_0)
					end, SFX_PANEL)
					arg_21_0:RefreshCurrentSlectSeed()
				end
			else
				OptionBtnDisplay(var_0_0.OperationType.Interaction)
				onButton(arg_21_0, arg_21_0.opBtn, function()
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_being_planted"))
				end, SFX_PANEL)
				setActive(arg_21_0.seedBtn, false)
			end

			local var_25_2 = var_25_0:GetDataVO().slotData.configId
			local var_25_3 = pg.island_production_slot[var_25_2].place == IslandProductConst.FarmlandPlaceId

			setActive(arg_21_0.areaChangeBtn, var_25_3 and getProxy(IslandProxy):GetIsland():GetAblityAgency():IsUnlockAreaPlant())
		end,
		[var_0_0.OperationType.MiningCollect] = function()
			var_21_0()
		end,
		[var_0_0.OperationType.WildGather] = function()
			local var_32_0 = arg_21_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_21_0.unitId)
			local var_32_1 = arg_21_0.view:GetIsland()

			if var_32_1.id == getProxy(IslandProxy):GetIsland().id then
				OptionBtnDisplay(var_0_0.OperationType.WildGather)
				onButton(arg_21_0, arg_21_0.opBtn, function()
					arg_21_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.GAHTERD_FLAG, var_32_0)
					var_32_0:StartGather(var_32_1.id)
				end, SFX_PANEL)
			elseif var_32_0:CheckGatherCanSign() then
				OptionBtnDisplay(var_0_0.OperationType.WildGather)
				onButton(arg_21_0, arg_21_0.opBtn, function()
					var_32_0:StartGaherSign(var_32_1.id)
				end, SFX_PANEL)
			else
				setActive(arg_21_0.opBtn, false)
			end
		end,
		[var_0_0.OperationType.FellCollect] = function()
			var_21_0()
		end
	})
end

function var_0_0.RefreshCurrentSlectSeed(arg_36_0)
	local var_36_0 = arg_36_0.seedBtn:Find("seedItem")
	local var_36_1 = arg_36_0:GetView():GetSubView(IslandSeedOpView).selectseedItemId

	if not var_36_1 then
		setActive(var_36_0, false)

		return
	end

	setActive(var_36_0, true)

	local var_36_2 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_36_3 = pg.island_farm_seed[var_36_1]
	local var_36_4 = var_36_2:GetItemById(var_36_3.itemid)

	if not var_36_4 then
		local var_36_5

		setActive(var_36_0, false)

		return
	end

	setText(var_36_0:Find("count"), var_36_4:GetCount())

	local var_36_6 = "island/" .. var_36_4:GetIcon()

	GetImageSpriteFromAtlasAsync(var_36_6, "", var_36_0:Find("icon"))
end

function var_0_0.GetSeedBtnWorldPos(arg_37_0)
	return arg_37_0.seedBtn.position
end

function var_0_0.TryDisablePlayerOp(arg_38_0)
	arg_38_0.showBalance = arg_38_0.showBalance - 1

	if arg_38_0.showBalance == 0 then
		arg_38_0:DisablePlayerOp()
	end
end

function var_0_0.TryEnablePlayerOp(arg_39_0)
	arg_39_0.showBalance = arg_39_0.showBalance + 1

	if arg_39_0.showBalance == 1 then
		arg_39_0:EnablePlayerOp()
	end
end

function var_0_0.ResetShowBalance(arg_40_0)
	if arg_40_0.showBalance ~= 1 then
		arg_40_0.showBalance = 1

		arg_40_0:EnablePlayerOp()
	end
end

function var_0_0.DisablePlayerOp(arg_41_0)
	arg_41_0:ShowOrHideGameObject(arg_41_0.opPanel, false)
	arg_41_0:ShowOrHideGameObject(arg_41_0.moveBtn, false)
	arg_41_0:GetView():GetSubView(IslandInteractionView):DisableInteraction()
	arg_41_0.playerInputManager:DisableInput()
	arg_41_0:GetView():GetSubView(IslandDistanceView):TryDisable()
	arg_41_0:GetView().player:ActiveOrDisactive(false)
end

function var_0_0.EnablePlayerOp(arg_42_0)
	arg_42_0:ShowOrHideGameObject(arg_42_0.opPanel, true)
	arg_42_0:ShowOrHideGameObject(arg_42_0.moveBtn, true)
	arg_42_0:GetView():GetSubView(IslandInteractionView):EnableInteraction()
	arg_42_0.playerInputManager:EnableInput()
	arg_42_0:GetView():GetSubView(IslandDistanceView):TryEnable()
	arg_42_0:GetView().player:ActiveOrDisactive(true)

	if arg_42_0.inInteraction then
		arg_42_0:StartInteraction()
	end
end

function var_0_0.StartInteraction(arg_43_0)
	arg_43_0.inInteraction = true

	arg_43_0:ShowOrHideGameObject(arg_43_0.moveBtn, false)
	arg_43_0:ShowOrHideGameObject(arg_43_0.opPanel, false)
	arg_43_0.playerInputManager:DisablePlayerHandle()
	arg_43_0:GetView().player:StopMoveHandle()
end

function var_0_0.EndInteraction(arg_44_0)
	arg_44_0.inInteraction = false

	arg_44_0:ShowOrHideGameObject(arg_44_0.moveBtn, true)
	arg_44_0:ShowOrHideGameObject(arg_44_0.opPanel, true)
	arg_44_0.playerInputManager:EnablePlayerHandle()
end

function var_0_0.DisableInput(arg_45_0)
	arg_45_0.playerInputManager:DisableInput()
end

function var_0_0.EnableInput(arg_46_0)
	arg_46_0.playerInputManager:EnableInput()
end

function var_0_0.ChangeTakePhotoModel(arg_47_0, arg_47_1)
	if arg_47_1 == IslandConst.TakePhotoModel.None then
		arg_47_0:ShowOrHideMoveBtn(false)
		arg_47_0.playerInputManager:DisableInput()
		arg_47_0:GetView().player:ActiveOrDisactive(false)
	elseif arg_47_1 == IslandConst.TakePhotoModel.First then
		arg_47_0:ShowOrHideMoveBtn(true)
		arg_47_0.playerInputManager:EnableInput()
		arg_47_0:GetView().player:ActiveOrDisactive(true)
	else
		arg_47_0:ShowOrHideMoveBtn(true)
		arg_47_0.playerInputManager:EnableInput()
		arg_47_0:GetView().player:ActiveOrDisactive(true)
	end
end

function var_0_0.ShowOrHideMoveBtn(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = GetOrAddComponent(arg_48_0.moveBtn, typeof(CanvasGroup))

	var_48_0.alpha = arg_48_1 and 1 or 0
	var_48_0.blocksRaycasts = arg_48_1 or arg_48_2
end

function var_0_0.OnDestroy(arg_49_0)
	if arg_49_0.opUI then
		arg_49_0:GetPoolMgr():ReturnOpUI(arg_49_0.opUI.gameObject)

		arg_49_0.opUI = nil
	end

	arg_49_0:RemoveFollowerListTimer()

	arg_49_0.animationOpEffectCounter = {}
end

return var_0_0
