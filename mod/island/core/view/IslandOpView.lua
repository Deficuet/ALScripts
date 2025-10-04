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
	arg_2_0.followerBtn = arg_2_0.opPanel:Find("follower")

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

function var_0_0.UpdateAnimationOpBtn(arg_6_0)
	local var_6_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	setActive(arg_6_0.animationOpBtn, var_6_0:HasAbility(IslandAblityAgency.ANIMATION_OP_ID))
end

function var_0_0.UpdateFollowBtn(arg_7_0)
	if #getProxy(IslandProxy):GetIsland():GetFollowerAgency():GetFollowers() <= 0 or not arg_7_0:IsSelfIsland() then
		setActive(arg_7_0.followerBtn, false)

		return
	end

	setActive(arg_7_0.followerBtn, true)
end

function var_0_0.ShowFollowerList(arg_8_0)
	local var_8_0 = getProxy(IslandProxy):GetIsland()
	local var_8_1 = var_8_0:GetFollowerAgency():GetFollowers()
	local var_8_2 = var_8_0:GetCharacterAgency()

	if #var_8_1 <= 0 then
		return
	end

	arg_8_0.uiFollowerList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = var_8_1[arg_9_1 + 1]
			local var_9_1 = var_8_2:GetShipById(var_9_0)
			local var_9_2 = IslandShip.StaticGetPrefab(var_9_1.configId)

			GetImageSpriteFromAtlasAsync("island/IslandShipIcon/" .. var_9_2, "", arg_9_2:Find("icon"))
			onButton(arg_8_0, arg_9_2, function()
				arg_8_0:NotifiyMeditor(IslandMediator.DEL_FOLLOWER, var_9_1.id)
			end, SFX_PANEL)
		end
	end)
	arg_8_0.uiFollowerList:align(#var_8_1)
	setActive(arg_8_0.uiFollowerPanel, true)
	arg_8_0:AddDisableFollowerListTimer()
end

function var_0_0.AddDisableFollowerListTimer(arg_11_0)
	arg_11_0:RemoveFollowerListTimer()

	arg_11_0.followerTimer = Timer.New(function()
		arg_11_0:RemoveFollowerListTimer()
		setActive(arg_11_0.uiFollowerPanel, false)
	end, 5, 1)

	arg_11_0.followerTimer:Start()
end

function var_0_0.RemoveFollowerListTimer(arg_13_0)
	if arg_13_0.followerTimer then
		arg_13_0.followerTimer:Stop()

		arg_13_0.followerTimer = nil
	end
end

function var_0_0.FlushFollowerList(arg_14_0)
	arg_14_0:UpdateFollowBtn()

	if not arg_14_0.followerTimer then
		return
	end

	arg_14_0:ShowFollowerList()
end

function var_0_0.InitOpCustumPositon(arg_15_0)
	local var_15_0 = tf(GameObject.Find("UICamera/Canvas")).sizeDelta
	local var_15_1 = var_15_0.x / IslandSettingsConst.settingRectSize.x
	local var_15_2 = var_15_0.y / IslandSettingsConst.settingRectSize.y
	local var_15_3 = IslandSettingsConst.ISLAND_JOY_STICK_DEFAULT_PREFERENCE
	local var_15_4 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_JOYSTICK_ANCHORX, var_15_3.x)
	local var_15_5 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_JOYSTICK_ANCHORY, var_15_3.y)

	arg_15_0.moveBtn.anchoredPosition = Vector2(var_15_4 * var_15_1, var_15_5 * var_15_2)

	local var_15_6 = {
		arg_15_0.opBtn,
		arg_15_0.opPanel:Find("jump"),
		arg_15_0.areaChangeBtn,
		arg_15_0.seedBtn
	}

	for iter_15_0, iter_15_1 in ipairs(var_15_6) do
		local var_15_7 = IslandSettingsConst.OPERATION_DEFAULT_PREFERENCE[iter_15_0]
		local var_15_8 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_OPERATION_ANCHORX[iter_15_0], var_15_7.x)
		local var_15_9 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_OPERATION_ANCHORY[iter_15_0], var_15_7.y)

		iter_15_1.anchoredPosition = Vector2(var_15_8 * var_15_1, var_15_9 * var_15_2)
	end
end

function var_0_0.UpdateOperationButton(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_1 == var_0_0.OperationType.None then
		if arg_16_0.unitId == arg_16_2 then
			arg_16_0.unitId = nil
			arg_16_0.operationType = arg_16_1
		end
	else
		arg_16_0.unitId = arg_16_2
		arg_16_0.operationType = arg_16_1
	end

	arg_16_0:UpdateOperationButtonDisplay()
end

function var_0_0.UpdateOperationButtonDisplay(arg_17_0)
	if arg_17_0.operationType == var_0_0.OperationType.None then
		setActive(arg_17_0.opBtn, false)
		setActive(arg_17_0.areaChangeBtn, false)
		setActive(arg_17_0.seedBtn, false)
		arg_17_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedSelect(false)
		arg_17_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedDetals(false)

		return
	end

	function OptionBtnDisplay(arg_18_0)
		for iter_18_0, iter_18_1 in ipairs(arg_17_0.opBtnList) do
			local var_18_0 = iter_18_0 == arg_18_0

			setActive(iter_18_1, var_18_0)
		end
	end

	if not arg_17_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_17_0.unitId) then
		setActive(arg_17_0.opBtn, false)
		setActive(arg_17_0.areaChangeBtn, false)
		setActive(arg_17_0.seedBtn, false)
		arg_17_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedSelect(false)
		arg_17_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedDetals(false)

		return
	end

	setActive(arg_17_0.opBtn, true)

	local function var_17_0()
		OptionBtnDisplay(arg_17_0.operationType)
		onButton(arg_17_0, arg_17_0.opBtn, function()
			local var_20_0 = arg_17_0.view:GetCore()
			local var_20_1 = arg_17_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_17_0.unitId)
			local var_20_2 = var_20_1:GetAnimatorTrigger()

			if var_20_1:CheckCanStartColloct() then
				var_20_0.controller.playerInputManager:UpdataWorkStateFunc(var_20_2, var_20_1)
			end
		end, SFX_PANEL)
		setActive(arg_17_0.areaChangeBtn, false)
		setActive(arg_17_0.seedBtn, false)
	end

	switch(arg_17_0.operationType, {
		[var_0_0.OperationType.Plant] = function()
			local var_21_0 = arg_17_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_17_0.unitId)

			if var_21_0:CanHarvest() then
				OptionBtnDisplay(var_0_0.OperationType.Harvest)
				onButton(arg_17_0, arg_17_0.opBtn, function()
					arg_17_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.GAHTER_FLAG, var_21_0)

					local var_22_0 = {}

					for iter_22_0, iter_22_1 in ipairs(arg_17_0.view.detectionSystem:GetAreaList()) do
						local var_22_1 = arg_17_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, iter_22_1)

						table.insert(var_22_0, var_22_1.handDate.configId)
					end

					pg.m02:sendNotification(GAME.ISLAND_START_HANDLE_HARVEST, {
						slot_list = var_22_0
					})
				end, SFX_PANEL)
				setActive(arg_17_0.seedBtn, false)
			elseif var_21_0:CanPlant() then
				IslandGuideChecker.CheckGuide("ISLAND_GUIDE_22")
				OptionBtnDisplay(var_0_0.OperationType.Plant)
				onButton(arg_17_0, arg_17_0.opBtn, function()
					if not arg_17_0:GetView():GetSubView(IslandSeedOpView).selectseedItemId then
						pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_seeds_empty"))

						return
					end

					local var_23_0 = pg.island_farm_seed[arg_17_0:GetView():GetSubView(IslandSeedOpView).selectseedItemId]
					local var_23_1 = pg.island_formula[var_23_0.formulaid]
					local var_23_2 = #arg_17_0.view.detectionSystem:GetAreaList()

					if not (function(arg_24_0)
						local var_24_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

						for iter_24_0, iter_24_1 in ipairs(arg_24_0) do
							local var_24_1 = iter_24_1[1]
							local var_24_2 = iter_24_1[2]

							if var_24_0:GetItemById(var_24_1):GetCount() < var_24_2 * var_23_2 then
								return false
							end

							return true
						end
					end)(var_23_1.cost) then
						pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_seeds_notenough"))

						return
					end

					local var_23_3 = {}

					for iter_23_0, iter_23_1 in ipairs(arg_17_0.view.detectionSystem:GetAreaList()) do
						local var_23_4 = arg_17_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, iter_23_1)

						table.insert(var_23_3, var_23_4.handDate.configId)
					end

					pg.m02:sendNotification(GAME.ISLAND_START_HANDLE_PLANT, {
						slot_list = var_23_3,
						formula_id = var_23_0.formulaid
					})
					arg_17_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.SOW_FLAG, var_21_0)
				end, SFX_PANEL)

				local var_21_1 = arg_17_0:GetView():GetSubView(IslandSeedOpView):CheckSeedEmpty(var_21_0)

				setActive(arg_17_0.seedEmpty, var_21_1)
				setActive(arg_17_0.seedBtn, true)
				setActive(arg_17_0.seedBtn:Find("seedItem"), not var_21_1)

				if not var_21_1 then
					onButton(arg_17_0, arg_17_0.seedBtn, function()
						arg_17_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedSelect(true)
						arg_17_0:GetView():GetSubView(IslandSeedOpView):RefreshSeedPlane(var_21_0)
					end, SFX_PANEL)
					arg_17_0:RefreshCurrentSlectSeed()
				end
			else
				OptionBtnDisplay(var_0_0.OperationType.Interaction)
				onButton(arg_17_0, arg_17_0.opBtn, function()
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_being_planted"))
				end, SFX_PANEL)
				setActive(arg_17_0.seedBtn, false)
			end

			local var_21_2 = var_21_0:GetDataVO().slotData.configId
			local var_21_3 = pg.island_production_slot[var_21_2].place == IslandProductConst.FarmlandPlaceId

			setActive(arg_17_0.areaChangeBtn, var_21_3 and getProxy(IslandProxy):GetIsland():GetAblityAgency():IsUnlockAreaPlant())
		end,
		[var_0_0.OperationType.MiningCollect] = function()
			var_17_0()
		end,
		[var_0_0.OperationType.WildGather] = function()
			local var_28_0 = arg_17_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_17_0.unitId)
			local var_28_1 = arg_17_0.view:GetIsland()

			if var_28_1.id == getProxy(IslandProxy):GetIsland().id then
				OptionBtnDisplay(var_0_0.OperationType.WildGather)
				onButton(arg_17_0, arg_17_0.opBtn, function()
					arg_17_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.GAHTERD_FLAG, var_28_0)
					var_28_0:StartGather(var_28_1.id)
				end, SFX_PANEL)
			elseif var_28_0:CheckGatherCanSign() then
				OptionBtnDisplay(var_0_0.OperationType.WildGather)
				onButton(arg_17_0, arg_17_0.opBtn, function()
					var_28_0:StartGaherSign(var_28_1.id)
				end, SFX_PANEL)
			else
				setActive(arg_17_0.opBtn, false)
			end
		end,
		[var_0_0.OperationType.FellCollect] = function()
			var_17_0()
		end
	})
end

function var_0_0.RefreshCurrentSlectSeed(arg_32_0)
	local var_32_0 = arg_32_0.seedBtn:Find("seedItem")
	local var_32_1 = arg_32_0:GetView():GetSubView(IslandSeedOpView).selectseedItemId

	if not var_32_1 then
		setActive(var_32_0, false)

		return
	end

	setActive(var_32_0, true)

	local var_32_2 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_32_3 = pg.island_farm_seed[var_32_1]
	local var_32_4 = var_32_2:GetItemById(var_32_3.itemid)

	if not var_32_4 then
		local var_32_5

		setActive(var_32_0, false)

		return
	end

	setText(var_32_0:Find("count"), var_32_4:GetCount())

	local var_32_6 = "island/" .. var_32_4:GetIcon()

	GetImageSpriteFromAtlasAsync(var_32_6, "", var_32_0:Find("icon"))
end

function var_0_0.GetSeedBtnWorldPos(arg_33_0)
	return arg_33_0.seedBtn.position
end

function var_0_0.TryDisablePlayerOp(arg_34_0)
	arg_34_0.showBalance = arg_34_0.showBalance - 1

	if arg_34_0.showBalance == 0 then
		arg_34_0:DisablePlayerOp()
	end
end

function var_0_0.TryEnablePlayerOp(arg_35_0)
	arg_35_0.showBalance = arg_35_0.showBalance + 1

	if arg_35_0.showBalance == 1 then
		arg_35_0:EnablePlayerOp()
	end
end

function var_0_0.ResetShowBalance(arg_36_0)
	if arg_36_0.showBalance ~= 1 then
		arg_36_0.showBalance = 1

		arg_36_0:EnablePlayerOp()
	end
end

function var_0_0.DisablePlayerOp(arg_37_0)
	arg_37_0:ShowOrHideGameObject(arg_37_0.opPanel, false)
	arg_37_0:ShowOrHideGameObject(arg_37_0.moveBtn, false)
	arg_37_0:GetView():GetSubView(IslandInteractionView):DisableInteraction()
	arg_37_0.playerInputManager:DisableInput()
	arg_37_0:GetView():GetSubView(IslandDistanceView):TryDisable()
	arg_37_0:GetView().player:ActiveOrDisactive(false)
end

function var_0_0.EnablePlayerOp(arg_38_0)
	arg_38_0:ShowOrHideGameObject(arg_38_0.opPanel, true)
	arg_38_0:ShowOrHideGameObject(arg_38_0.moveBtn, true)
	arg_38_0:GetView():GetSubView(IslandInteractionView):EnableInteraction()
	arg_38_0.playerInputManager:EnableInput()
	arg_38_0:GetView():GetSubView(IslandDistanceView):TryEnable()
	arg_38_0:GetView().player:ActiveOrDisactive(true)

	if arg_38_0.inInteraction then
		arg_38_0:StartInteraction()
	end
end

function var_0_0.StartInteraction(arg_39_0)
	arg_39_0.inInteraction = true

	arg_39_0:ShowOrHideGameObject(arg_39_0.moveBtn, false)
	arg_39_0:ShowOrHideGameObject(arg_39_0.opPanel, false)
	arg_39_0.playerInputManager:DisablePlayerHandle()
end

function var_0_0.EndInteraction(arg_40_0)
	arg_40_0.inInteraction = false

	arg_40_0:ShowOrHideGameObject(arg_40_0.moveBtn, true)
	arg_40_0:ShowOrHideGameObject(arg_40_0.opPanel, true)
	arg_40_0.playerInputManager:EnablePlayerHandle()
end

function var_0_0.DisableInput(arg_41_0)
	arg_41_0.playerInputManager:DisableInput()
end

function var_0_0.EnableInput(arg_42_0)
	arg_42_0.playerInputManager:EnableInput()
end

function var_0_0.ChangeTakePhotoModel(arg_43_0, arg_43_1)
	if arg_43_1 == IslandConst.TakePhotoModel.None then
		arg_43_0:ShowOrHideMoveBtn(false)
		arg_43_0.playerInputManager:DisableInput()
		arg_43_0:GetView().player:ActiveOrDisactive(false)
	elseif arg_43_1 == IslandConst.TakePhotoModel.First then
		arg_43_0:ShowOrHideMoveBtn(true)
		arg_43_0.playerInputManager:EnableInput()
		arg_43_0:GetView().player:ActiveOrDisactive(true)
	else
		arg_43_0:ShowOrHideMoveBtn(true)
		arg_43_0.playerInputManager:EnableInput()
		arg_43_0:GetView().player:ActiveOrDisactive(true)
	end
end

function var_0_0.ShowOrHideMoveBtn(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = GetOrAddComponent(arg_44_0.moveBtn, typeof(CanvasGroup))

	var_44_0.alpha = arg_44_1 and 1 or 0
	var_44_0.blocksRaycasts = arg_44_1 or arg_44_2
end

function var_0_0.OnDestroy(arg_45_0)
	if arg_45_0.opUI then
		arg_45_0:GetPoolMgr():ReturnOpUI(arg_45_0.opUI.gameObject)

		arg_45_0.opUI = nil
	end

	arg_45_0:RemoveFollowerListTimer()
end

return var_0_0
