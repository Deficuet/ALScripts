local var_0_0 = class("IslandOpView", import(".IslandBaseOpView"))

var_0_0.OperationType = {
	Harvest = 4,
	MiningCollect = 3,
	Interaction = 1,
	None = 0,
	Fishing = 7,
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
		arg_2_0.opBtn:Find("fellCollect"),
		arg_2_0.opBtn:Find("fishing")
	}
	arg_2_0.seedBtn = arg_2_0.opPanel:Find("seed")
	arg_2_0.seedEmpty = arg_2_0.seedBtn:Find("seedEmpty")
	arg_2_0.areaChangeBtn = arg_2_0.opPanel:Find("scope")
	arg_2_0.run = arg_2_0.opPanel:Find("run")
	arg_2_0.moveBtn = arg_2_0.opUI:Find("move")
	arg_2_0.animationOpBtn = arg_2_0.opPanel:Find("aniamtionop")
	arg_2_0.animationOpEffect = arg_2_0.animationOpBtn:Find("effect")
	arg_2_0.followerBtn = arg_2_0.opPanel:Find("follower")
	arg_2_0.lureBtn = arg_2_0.opPanel:Find("lure")
	arg_2_0.lureEmptyTr = arg_2_0.lureBtn:Find("empty")
	arg_2_0.lureIconTr = arg_2_0.lureBtn:Find("icon")
	arg_2_0.lureIconTxt = arg_2_0.lureBtn:Find("icon/count"):GetComponent(typeof(Text))
	arg_2_0.animationOpEffectCounter = {}
	arg_2_0.uiFollowerPanel = arg_2_0.followerBtn:Find("list")

	local var_2_0 = arg_2_0.uiFollowerPanel:Find("tpl")

	arg_2_0.uiFollowerList = UIItemList.New(arg_2_0.uiFollowerPanel, var_2_0)

	setActive(arg_2_0.opPanel, true)
	setActive(arg_2_0.lureBtn, false)
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
	arg_2_0:UpdateLureBtn()
end

function var_0_0.UpdateLureBtn(arg_6_0)
	local var_6_0 = arg_6_0:GetSelfIsland()
	local var_6_1 = var_6_0:GetFishingAgency():GetBaitId()
	local var_6_2 = var_6_0:GetInventoryAgency()
	local var_6_3 = var_6_2:GetOwnCount(var_6_1)

	setActive(arg_6_0.lureEmptyTr, var_6_3 <= 0)
	setActive(arg_6_0.lureIconTr, var_6_3 > 0)

	if var_6_3 > 0 then
		local var_6_4 = var_6_2:GetItemById(var_6_1)

		GetImageSpriteFromAtlasAsync("island/" .. var_6_4:GetIcon(), "", arg_6_0.lureIconTr)

		arg_6_0.lureIconTxt.text = ""
	end

	onButton(arg_6_0, arg_6_0.lureBtn, function()
		if #var_6_2:GetFishingItems() <= 0 then
			return
		end

		arg_6_0:CreateSubView(IslandSelectLureOpView):Execute("Show")
	end, SFX_PANEL)
end

function var_0_0.LaterInit(arg_8_0)
	if arg_8_0.showBalance < 1 then
		arg_8_0:DisablePlayerOp()
	end
end

function var_0_0.UpdateAnimationOpBtn(arg_9_0)
	local var_9_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	setActive(arg_9_0.animationOpBtn, var_9_0:HasAbility(IslandAblityAgency.ANIMATION_OP_ID))
end

function var_0_0.UpdateAnimationOpEffect(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_2 then
		table.insert(arg_10_0.animationOpEffectCounter, arg_10_1)
	else
		table.removebyvalue(arg_10_0.animationOpEffectCounter, arg_10_1)
	end

	local var_10_0 = _.map(arg_10_0.animationOpEffectCounter, function(arg_11_0)
		local var_11_0, var_11_1 = IslandCalcUtil.GetTypeAndIdByUniqueId(arg_11_0)

		return arg_10_0:GetView():GetUnitModuleWithType(var_11_0, var_11_1)
	end)
	local var_10_1 = _.detect(var_10_0, function(arg_12_0)
		return arg_12_0 and isa(arg_12_0, IslandStrollNpcUnit) and arg_12_0:ExistActionFeedbackBubble()
	end)

	setActive(arg_10_0.animationOpEffect, var_10_1)
end

function var_0_0.UpdateFollowBtn(arg_13_0)
	if #getProxy(IslandProxy):GetIsland():GetFollowerAgency():GetFollowers() <= 0 or not arg_13_0:IsSelfIsland() then
		setActive(arg_13_0.followerBtn, false)

		return
	end

	setActive(arg_13_0.followerBtn, true)
end

function var_0_0.ShowFollowerList(arg_14_0)
	local var_14_0 = getProxy(IslandProxy):GetIsland()
	local var_14_1 = var_14_0:GetFollowerAgency():GetFollowers()
	local var_14_2 = var_14_0:GetCharacterAgency()

	if #var_14_1 <= 0 then
		return
	end

	arg_14_0.uiFollowerList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			local var_15_0 = var_14_1[arg_15_1 + 1]
			local var_15_1 = var_14_2:GetShipById(var_15_0)
			local var_15_2 = IslandShip.StaticGetPrefab(var_15_1.configId)

			GetImageSpriteFromAtlasAsync("island/IslandShipIcon/" .. var_15_2, "", arg_15_2:Find("icon"))
			onButton(arg_14_0, arg_15_2, function()
				arg_14_0:NotifiyCore(ISLAND_EVT.WILL_DEL_FOLLOWER, var_15_1.id)
			end, SFX_PANEL)
		end
	end)
	arg_14_0.uiFollowerList:align(#var_14_1)
	setActive(arg_14_0.uiFollowerPanel, true)
	arg_14_0:AddDisableFollowerListTimer()
end

function var_0_0.AddDisableFollowerListTimer(arg_17_0)
	arg_17_0:RemoveFollowerListTimer()

	arg_17_0.followerTimer = Timer.New(function()
		arg_17_0:RemoveFollowerListTimer()
		setActive(arg_17_0.uiFollowerPanel, false)
	end, 5, 1)

	arg_17_0.followerTimer:Start()
end

function var_0_0.RemoveFollowerListTimer(arg_19_0)
	if arg_19_0.followerTimer then
		arg_19_0.followerTimer:Stop()

		arg_19_0.followerTimer = nil
	end
end

function var_0_0.FlushFollowerList(arg_20_0)
	arg_20_0:UpdateFollowBtn()

	if not arg_20_0.followerTimer then
		return
	end

	arg_20_0:ShowFollowerList()
end

function var_0_0.InitOpCustumPositon(arg_21_0)
	local var_21_0 = tf(GameObject.Find("UICamera/Canvas")).sizeDelta
	local var_21_1 = var_21_0.x / IslandSettingsConst.settingRectSize.x
	local var_21_2 = var_21_0.y / IslandSettingsConst.settingRectSize.y
	local var_21_3 = IslandSettingsConst.ISLAND_JOY_STICK_DEFAULT_PREFERENCE
	local var_21_4 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_JOYSTICK_ANCHORX, var_21_3.x)
	local var_21_5 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_JOYSTICK_ANCHORY, var_21_3.y)

	arg_21_0.moveBtn.anchoredPosition = Vector2(var_21_4 * var_21_1, var_21_5 * var_21_2)

	local var_21_6 = {
		arg_21_0.opBtn,
		arg_21_0.opPanel:Find("jump"),
		arg_21_0.areaChangeBtn,
		arg_21_0.seedBtn
	}

	for iter_21_0, iter_21_1 in ipairs(var_21_6) do
		local var_21_7 = IslandSettingsConst.OPERATION_DEFAULT_PREFERENCE[iter_21_0]
		local var_21_8 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_OPERATION_ANCHORX[iter_21_0], var_21_7.x)
		local var_21_9 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_OPERATION_ANCHORY[iter_21_0], var_21_7.y)

		iter_21_1.anchoredPosition = Vector2(var_21_8 * var_21_1, var_21_9 * var_21_2)
	end

	arg_21_0.lureBtn.anchoredPosition = arg_21_0.seedBtn.anchoredPosition
end

function var_0_0.UpdateOperationButton(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_1 == var_0_0.OperationType.None then
		if arg_22_0.unitId == arg_22_2 then
			arg_22_0.unitId = nil
			arg_22_0.operationType = arg_22_1
		end
	else
		arg_22_0.unitId = arg_22_2
		arg_22_0.operationType = arg_22_1
	end

	arg_22_0:UpdateOperationButtonDisplay()
end

function var_0_0.UpdateOperationButtonDisplay(arg_23_0)
	setActive(arg_23_0.lureBtn, false)

	function OptionBtnDisplay(arg_24_0)
		for iter_24_0, iter_24_1 in ipairs(arg_23_0.opBtnList) do
			local var_24_0 = iter_24_0 == arg_24_0

			setActive(iter_24_1, var_24_0)
		end
	end

	if arg_23_0.operationType == var_0_0.OperationType.None then
		setActive(arg_23_0.opBtn, false)
		setActive(arg_23_0.areaChangeBtn, false)
		setActive(arg_23_0.seedBtn, false)
		arg_23_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedSelect(false)
		arg_23_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedDetals(false)
		OptionBtnDisplay(arg_23_0.operationType)

		return
	end

	local var_23_0 = arg_23_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_23_0.unitId)

	if arg_23_0.operationType ~= var_0_0.OperationType.Fishing and not var_23_0 then
		setActive(arg_23_0.opBtn, false)
		setActive(arg_23_0.areaChangeBtn, false)
		setActive(arg_23_0.seedBtn, false)
		arg_23_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedSelect(false)
		arg_23_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedDetals(false)

		return
	end

	setActive(arg_23_0.opBtn, true)

	local function var_23_1()
		OptionBtnDisplay(arg_23_0.operationType)
		onButton(arg_23_0, arg_23_0.opBtn, function()
			local var_26_0 = arg_23_0.view:GetCore()
			local var_26_1 = arg_23_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_23_0.unitId)
			local var_26_2 = var_26_1:GetAnimatorTrigger()

			if var_26_1:CheckCanStartColloct() then
				var_26_0.controller.playerInputManager:UpdataWorkStateFunc(var_26_2, var_26_1)
			end
		end, SFX_PANEL)
		setActive(arg_23_0.areaChangeBtn, false)
		setActive(arg_23_0.seedBtn, false)
	end

	switch(arg_23_0.operationType, {
		[var_0_0.OperationType.Plant] = function()
			local var_27_0 = arg_23_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_23_0.unitId)

			if var_27_0:CanHarvest() then
				OptionBtnDisplay(var_0_0.OperationType.Harvest)
				onButton(arg_23_0, arg_23_0.opBtn, function()
					arg_23_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.GAHTER_FLAG, var_27_0)

					local var_28_0 = {}

					for iter_28_0, iter_28_1 in ipairs(arg_23_0.view.detectionSystem:GetAreaList()) do
						local var_28_1 = arg_23_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, iter_28_1)

						table.insert(var_28_0, var_28_1.handDate.configId)
					end

					pg.m02:sendNotification(GAME.ISLAND_START_HANDLE_HARVEST, {
						slot_list = var_28_0
					})
				end, SFX_PANEL)
				setActive(arg_23_0.seedBtn, false)
			elseif var_27_0:CanPlant() then
				IslandGuideChecker.CheckGuide("ISLAND_GUIDE_22")
				OptionBtnDisplay(var_0_0.OperationType.Plant)
				onButton(arg_23_0, arg_23_0.opBtn, function()
					if not arg_23_0:GetView():GetSubView(IslandSeedOpView).selectseedItemId then
						pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_seeds_empty"))

						return
					end

					local var_29_0 = pg.island_farm_seed[arg_23_0:GetView():GetSubView(IslandSeedOpView).selectseedItemId]
					local var_29_1 = pg.island_formula[var_29_0.formulaid]
					local var_29_2 = #arg_23_0.view.detectionSystem:GetAreaList()

					if not (function(arg_30_0)
						local var_30_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

						for iter_30_0, iter_30_1 in ipairs(arg_30_0) do
							local var_30_1 = iter_30_1[1]
							local var_30_2 = iter_30_1[2]

							if var_30_0:GetItemById(var_30_1):GetCount() < var_30_2 * var_29_2 then
								return false
							end

							return true
						end
					end)(var_29_1.cost) then
						pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_seeds_notenough"))

						return
					end

					local var_29_3 = {}

					for iter_29_0, iter_29_1 in ipairs(arg_23_0.view.detectionSystem:GetAreaList()) do
						local var_29_4 = arg_23_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, iter_29_1)

						table.insert(var_29_3, var_29_4.handDate.configId)
					end

					pg.m02:sendNotification(GAME.ISLAND_START_HANDLE_PLANT, {
						slot_list = var_29_3,
						formula_id = var_29_0.formulaid
					})
					arg_23_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.SOW_FLAG, var_27_0)
				end, SFX_PANEL)

				local var_27_1 = arg_23_0:GetView():GetSubView(IslandSeedOpView):CheckSeedEmpty(var_27_0)

				setActive(arg_23_0.seedEmpty, var_27_1)
				setActive(arg_23_0.seedBtn, true)
				setActive(arg_23_0.seedBtn:Find("seedItem"), not var_27_1)

				if not var_27_1 then
					onButton(arg_23_0, arg_23_0.seedBtn, function()
						arg_23_0:GetView():GetSubView(IslandSeedOpView):ActiveSeedSelect(true)
						arg_23_0:GetView():GetSubView(IslandSeedOpView):RefreshSeedPlane(var_27_0)
					end, SFX_PANEL)
					arg_23_0:RefreshCurrentSlectSeed()
				end
			else
				OptionBtnDisplay(var_0_0.OperationType.Interaction)
				onButton(arg_23_0, arg_23_0.opBtn, function()
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_being_planted"))
				end, SFX_PANEL)
				setActive(arg_23_0.seedBtn, false)
			end

			local var_27_2 = var_27_0:GetDataVO().slotData.configId
			local var_27_3 = pg.island_production_slot[var_27_2].place == IslandProductConst.FarmlandPlaceId

			setActive(arg_23_0.areaChangeBtn, var_27_3 and getProxy(IslandProxy):GetIsland():GetAblityAgency():IsUnlockAreaPlant())
		end,
		[var_0_0.OperationType.MiningCollect] = function()
			var_23_1()
		end,
		[var_0_0.OperationType.WildGather] = function()
			local var_34_0 = arg_23_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_23_0.unitId)
			local var_34_1 = arg_23_0.view:GetIsland()

			if var_34_1.id == getProxy(IslandProxy):GetIsland().id then
				OptionBtnDisplay(var_0_0.OperationType.WildGather)
				onButton(arg_23_0, arg_23_0.opBtn, function()
					arg_23_0.view:GetCore().controller.playerInputManager:UpdataWorkStateFunc(IslandConst.GAHTERD_FLAG, var_34_0)
					var_34_0:StartGather(var_34_1.id)
				end, SFX_PANEL)
			elseif var_34_0:CheckGatherCanSign() then
				OptionBtnDisplay(var_0_0.OperationType.WildGather)
				onButton(arg_23_0, arg_23_0.opBtn, function()
					var_34_0:StartGaherSign(var_34_1.id)
				end, SFX_PANEL)
			else
				setActive(arg_23_0.opBtn, false)
			end
		end,
		[var_0_0.OperationType.FellCollect] = function()
			var_23_1()
		end,
		[var_0_0.OperationType.Fishing] = function()
			IslandGuideChecker.CheckGuide("ISLAND_GUIDE_33")
			arg_23_0:UpdateLureBtn()
			OptionBtnDisplay(arg_23_0.operationType)
			setActive(arg_23_0.lureBtn, true)
			onButton(arg_23_0, arg_23_0.opBtn, function()
				local var_39_0 = arg_23_0:GetSelfIsland():GetFishingAgency():GetBaitId()

				if arg_23_0:GetSelfIsland():GetInventoryAgency():GetOwnCount(var_39_0) <= 0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_fishing_lure_empty"))
				elseif arg_23_0:GetView().player:OnGrouded() then
					arg_23_0:CreateSubView(IslandFishingOPView):Execute("Show", arg_23_0.unitId, arg_23_0.opBtn.localPosition)
				end
			end, SFX_PANEL)
		end
	})
end

function var_0_0.RefreshCurrentSlectSeed(arg_40_0)
	local var_40_0 = arg_40_0.seedBtn:Find("seedItem")
	local var_40_1 = arg_40_0:GetView():GetSubView(IslandSeedOpView).selectseedItemId

	if not var_40_1 then
		setActive(var_40_0, false)

		return
	end

	setActive(var_40_0, true)

	local var_40_2 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_40_3 = pg.island_farm_seed[var_40_1]
	local var_40_4 = var_40_2:GetItemById(var_40_3.itemid)

	if not var_40_4 then
		local var_40_5

		setActive(var_40_0, false)

		return
	end

	setText(var_40_0:Find("count"), var_40_4:GetCount())

	local var_40_6 = "island/" .. var_40_4:GetIcon()

	GetImageSpriteFromAtlasAsync(var_40_6, "", var_40_0:Find("icon"))
end

function var_0_0.GetSeedBtnWorldPos(arg_41_0)
	return arg_41_0.seedBtn.position
end

function var_0_0.TryDisablePlayerOp(arg_42_0)
	arg_42_0.showBalance = arg_42_0.showBalance - 1

	if arg_42_0.showBalance == 0 then
		arg_42_0:DisablePlayerOp()
	end
end

function var_0_0.TryEnablePlayerOp(arg_43_0)
	arg_43_0.showBalance = arg_43_0.showBalance + 1

	if arg_43_0.showBalance == 1 then
		arg_43_0:EnablePlayerOp()
	end
end

function var_0_0.ResetShowBalance(arg_44_0)
	if arg_44_0.showBalance ~= 1 then
		arg_44_0.showBalance = 1

		arg_44_0:EnablePlayerOp()
	end
end

function var_0_0.DisablePlayerOp(arg_45_0)
	arg_45_0:ShowOrHideGameObject(arg_45_0.opPanel, false)
	arg_45_0:ShowOrHideGameObject(arg_45_0.moveBtn, false)
	arg_45_0:GetView():GetSubView(IslandInteractionView):DisableInteraction()
	arg_45_0.playerInputManager:DisableInput()
	arg_45_0:GetView():GetSubView(IslandDistanceView):TryDisable()
	arg_45_0:GetView().player:ActiveOrDisactive(false)
end

function var_0_0.EnablePlayerOp(arg_46_0)
	arg_46_0:ShowOrHideGameObject(arg_46_0.opPanel, true)
	arg_46_0:ShowOrHideGameObject(arg_46_0.moveBtn, true)
	arg_46_0:GetView():GetSubView(IslandInteractionView):EnableInteraction()
	arg_46_0.playerInputManager:EnableInput()
	arg_46_0:GetView():GetSubView(IslandDistanceView):TryEnable()
	arg_46_0:GetView().player:ActiveOrDisactive(true)

	if arg_46_0.inInteraction then
		arg_46_0:StartInteraction()
	end
end

function var_0_0.StartInteraction(arg_47_0)
	arg_47_0.inInteraction = true

	arg_47_0:ShowOrHideGameObject(arg_47_0.moveBtn, false)
	arg_47_0:ShowOrHideGameObject(arg_47_0.opPanel, false)
	arg_47_0.playerInputManager:DisablePlayerHandle()
	arg_47_0:GetView().player:StopMoveHandle()
end

function var_0_0.EndInteraction(arg_48_0)
	arg_48_0.inInteraction = false

	arg_48_0:ShowOrHideGameObject(arg_48_0.moveBtn, true)
	arg_48_0:ShowOrHideGameObject(arg_48_0.opPanel, true)
	arg_48_0.playerInputManager:EnablePlayerHandle()
end

function var_0_0.DisableInput(arg_49_0)
	arg_49_0.playerInputManager:DisableInput()
end

function var_0_0.EnableInput(arg_50_0)
	arg_50_0.playerInputManager:EnableInput()
end

function var_0_0.ChangeTakePhotoModel(arg_51_0, arg_51_1, arg_51_2)
	if arg_51_1 == IslandConst.TakePhotoModel.None then
		if not arg_51_2 then
			arg_51_0:ShowOrHideMoveBtn(false)
			arg_51_0.playerInputManager:DisableInput()
			arg_51_0:GetView().player:ActiveOrDisactive(false)
		end
	elseif arg_51_1 == IslandConst.TakePhotoModel.First then
		arg_51_0:ShowOrHideMoveBtn(true)
		arg_51_0.playerInputManager:EnableInput()
		arg_51_0:GetView().player:ActiveOrDisactive(true)
	else
		arg_51_0:ShowOrHideMoveBtn(true)
		arg_51_0.playerInputManager:EnableInput()
		arg_51_0:GetView().player:ActiveOrDisactive(true)
	end
end

function var_0_0.ShowOrHideMoveBtn(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = GetOrAddComponent(arg_52_0.moveBtn, typeof(CanvasGroup))

	var_52_0.alpha = arg_52_1 and 1 or 0
	var_52_0.blocksRaycasts = arg_52_1 or arg_52_2
end

function var_0_0.OnDestroy(arg_53_0)
	if arg_53_0.opUI then
		arg_53_0:GetPoolMgr():ReturnOpUI(arg_53_0.opUI.gameObject)

		arg_53_0.opUI = nil
	end

	arg_53_0:RemoveFollowerListTimer()

	arg_53_0.animationOpEffectCounter = {}
end

return var_0_0
