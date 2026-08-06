local var_0_0 = class("IslandAniamtionOpView", import(".IslandBaseOpView"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3

function var_0_0.GetUIName(arg_1_0)
	return "IslandActionOpUI"
end

function var_0_0.GetEnterAnimationName(arg_2_0)
	return "Anim_IslandActionOpUI_In"
end

function var_0_0.GetExitAnimationName(arg_3_0)
	return "Anim_IslandActionOpUI_Out"
end

function var_0_0.GetUIParent(arg_4_0, arg_4_1)
	return arg_4_0:GetView().topContainer
end

function var_0_0.FirstFlush(arg_5_0)
	arg_5_0.waitTime = pg.island_set.action_waiting_time.key_value_int
	arg_5_0.scrollrect = arg_5_0._tf:Find("adapt/frame/scrollrect"):GetComponent("LScrollRect")
	arg_5_0.opPanel = arg_5_0._tf:Find("adapt/opPanel")
	arg_5_0.lookParent = arg_5_0.opPanel.parent
	arg_5_0.moveBtn = arg_5_0.opPanel:Find("move")
	arg_5_0.lookBtn = arg_5_0.opPanel:Find("look")
	arg_5_0.moveBtnCg = GetOrAddComponent(arg_5_0.moveBtn, typeof(CanvasGroup))

	function arg_5_0.scrollrect.onInitItem(arg_6_0)
		arg_5_0:OnInitItem(arg_6_0)
	end

	function arg_5_0.scrollrect.onUpdateItem(arg_7_0, arg_7_1)
		arg_5_0:OnUpdateItem(arg_7_0, arg_7_1)
	end

	onNextTick(function()
		arg_5_0:TryDisable(false)
	end)

	arg_5_0.chatView = IslandChatView.New(arg_5_0:GetView(), arg_5_0._tf:Find("adapt/chat"))

	onButton(arg_5_0, arg_5_0._go, function()
		arg_5_0:TryDisable()
	end, SFX_PANEL)
	onToggle(arg_5_0, arg_5_0._tf:Find("adapt/tags/1"), function(arg_10_0)
		if arg_10_0 then
			arg_5_0:SwitchPage(var_0_1)
		end
	end, SFX_PANEL)
	onToggle(arg_5_0, arg_5_0._tf:Find("adapt/tags/2"), function(arg_11_0)
		if arg_11_0 then
			arg_5_0:SwitchPage(var_0_2)
		end
	end, SFX_PANEL)
	onToggle(arg_5_0, arg_5_0._tf:Find("adapt/tags/3"), function(arg_12_0)
		if arg_12_0 then
			arg_5_0:SwitchPage(var_0_3)
		end
	end, SFX_PANEL)

	arg_5_0.cards = {}
	arg_5_0.isShowing = false
	arg_5_0.isInitList = false
	arg_5_0.page = var_0_1
end

function var_0_0.SwitchPage(arg_13_0, arg_13_1)
	arg_13_0.page = arg_13_1

	if arg_13_1 == var_0_1 then
		arg_13_0:InitList()

		arg_13_0.lookBtn.offsetMax = Vector2(-594, arg_13_0.lookBtn.offsetMax.y)
	elseif arg_13_1 == var_0_2 then
		arg_13_0:InitList()

		arg_13_0.lookBtn.offsetMax = Vector2(-594, arg_13_0.lookBtn.offsetMax.y)
	elseif arg_13_1 == var_0_3 then
		arg_13_0.chatView:Execute("Show", true)

		arg_13_0.lookBtn.offsetMax = Vector2(-985, arg_13_0.lookBtn.offsetMax.y)
	end
end

function var_0_0.UpdateMoveBtn(arg_14_0)
	local var_14_0 = tf(GameObject.Find("UICamera/Canvas")).sizeDelta
	local var_14_1 = var_14_0.x / IslandSettingsConst.settingRectSize.x
	local var_14_2 = var_14_0.y / IslandSettingsConst.settingRectSize.y
	local var_14_3 = IslandSettingsConst.ISLAND_JOY_STICK_DEFAULT_PREFERENCE
	local var_14_4 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_JOYSTICK_ANCHORX, var_14_3.x)
	local var_14_5 = PlayerPrefs.GetFloat(IslandSettingsConst.ISLAND_KEY_JOYSTICK_ANCHORY, var_14_3.y)

	arg_14_0.moveBtn.anchoredPosition = Vector2(var_14_4 * var_14_1, var_14_5 * var_14_2)
end

function var_0_0.OnStartCoupleAction(arg_15_0)
	arg_15_0.moveBtnCg.alpha = 0
	arg_15_0.moveBtnCg.blocksRaycasts = false
end

function var_0_0.OnEndCoupleAction(arg_16_0)
	arg_16_0.moveBtnCg.alpha = 1
	arg_16_0.moveBtnCg.blocksRaycasts = true
end

function var_0_0.UpdateChatRoom(arg_17_0)
	if not arg_17_0.isShowing then
		return
	end

	if not arg_17_0.chatView:IsLoaded() then
		return
	end

	arg_17_0.chatView:Execute("Flush")
end

function var_0_0.UpdateMsgList(arg_18_0)
	if not arg_18_0.isShowing then
		return
	end

	if not arg_18_0.chatView:IsLoaded() then
		return
	end

	arg_18_0.chatView:Execute("Flush", true)
end

function var_0_0.OnMovePlayerBefore(arg_19_0)
	if not arg_19_0.isShowing then
		return
	end

	arg_19_0:RemoveWaitTimer()

	arg_19_0.startSingleActionId = nil

	arg_19_0:ClearSelected()
end

function var_0_0.OnEnable(arg_20_0)
	arg_20_0:InitList()
	arg_20_0:UpdateMoveBtn()

	arg_20_0.isShowing = true

	setParent(arg_20_0.opPanel, arg_20_0:GetView().layer2UIContianer)
end

function var_0_0.GetData(arg_21_0)
	local var_21_0 = {}
	local var_21_1 = {}
	local var_21_2 = getProxy(IslandProxy):GetIsland():GetActionAgency():GetActionList()

	for iter_21_0, iter_21_1 in ipairs(var_21_2) do
		local var_21_3 = pg.island_action[iter_21_1]

		if var_21_3.type == IslandConst.ANIMATION_OP_SIGNLE then
			table.insert(var_21_0, iter_21_1)
		elseif var_21_3.type == IslandConst.ANIMATION_OP_DOUBLE then
			table.insert(var_21_1, iter_21_1)
		end
	end

	if arg_21_0.markActionId then
		table.sort(var_21_0, function(arg_22_0, arg_22_1)
			local var_22_0 = arg_22_0 == arg_21_0.markActionId and 1 or 0
			local var_22_1 = arg_22_1 == arg_21_0.markActionId and 1 or 0

			if var_22_0 == var_22_1 then
				return arg_22_0 < arg_22_1
			else
				return var_22_1 < var_22_0
			end
		end)
	end

	return var_21_0, var_21_1
end

local function var_0_4(arg_23_0)
	local var_23_0 = {}

	for iter_23_0 = 1, #arg_23_0, 2 do
		local var_23_1 = arg_23_0[iter_23_0]
		local var_23_2 = arg_23_0[iter_23_0 + 1]

		table.insert(var_23_0, {
			var_23_1,
			var_23_2
		})
	end

	return var_23_0
end

function var_0_0.InitList(arg_24_0)
	local var_24_0, var_24_1 = arg_24_0:GetData()
	local var_24_2 = {}

	if arg_24_0.page == var_0_1 then
		local var_24_3 = var_0_4(var_24_0)

		for iter_24_0, iter_24_1 in ipairs(var_24_3) do
			table.insert(var_24_2, iter_24_1)
		end
	end

	if arg_24_0.page == var_0_2 then
		local var_24_4 = var_0_4(var_24_1)

		for iter_24_2, iter_24_3 in ipairs(var_24_4) do
			table.insert(var_24_2, iter_24_3)
		end
	end

	arg_24_0.displays = var_24_2
	arg_24_0.scrollrect.enabled = true

	arg_24_0.scrollrect:SetTotalCount(#var_24_2, 0)

	arg_24_0.isInitList = true
end

function var_0_0.SortForNpcAction(arg_25_0, arg_25_1)
	if not arg_25_1 then
		arg_25_0.markActionId = nil

		arg_25_0:InitList()

		return
	end

	local var_25_0, var_25_1 = IslandCalcUtil.GetTypeAndIdByUniqueId(arg_25_1)
	local var_25_2 = arg_25_0:GetView():GetUnitModuleWithType(var_25_0, var_25_1)

	if not var_25_2 then
		return
	end

	if not var_25_2.data or not isa(var_25_2.data, IslandStrollUnitVO) then
		return
	end

	local var_25_3 = var_25_2.data:GetGreetingFeedback()

	if not var_25_3 then
		return
	end

	arg_25_0.markActionId = var_25_3

	arg_25_0:InitList()
end

function var_0_0.OnInitItem(arg_26_0, arg_26_1)
	local var_26_0 = IslandAniamtionOpCard.New(arg_26_1)

	onButton(arg_26_0, var_26_0.item1, function()
		arg_26_0.selectedId = var_26_0.firstId

		arg_26_0:UpdateCardsSelected()
		arg_26_0:PlayAniamtion(var_26_0.firstId)
	end, SFX_PANEL)
	onButton(arg_26_0, var_26_0.item2, function()
		arg_26_0.selectedId = var_26_0.secondId

		arg_26_0:UpdateCardsSelected()
		arg_26_0:PlayAniamtion(var_26_0.secondId)
	end, SFX_PANEL)

	arg_26_0.cards[arg_26_1] = var_26_0
end

function var_0_0.CanPlayCoupleAction(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0:GetPlayerUnit()
	local var_29_1 = BuildVector3(arg_29_1.respond_point).magnitude

	return IslandCalcUtil.IsCircleInsideNavMesh(var_29_0.agent, var_29_0._tf.position, var_29_1, 12)
end

function var_0_0.PlayAniamtion(arg_30_0, arg_30_1)
	if not arg_30_1 then
		return
	end

	local var_30_0 = pg.island_action[arg_30_1]

	if var_30_0.type == IslandConst.ANIMATION_OP_DOUBLE then
		if arg_30_0.startCoupleActionId == arg_30_1 then
			return
		end

		if not arg_30_0:CanPlayCoupleAction(var_30_0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_position_cant_play_cp_action"))

			return
		end

		arg_30_0:NotifiyCore(ISLAND_EVT.LOCK_PLAYER_INPUT)

		arg_30_0.startSingleActionId = nil

		arg_30_0:AddWaitTimer(arg_30_1)
		arg_30_0:GetPlayerUnit():PlayAnimation(var_30_0.resource, 0.25, function()
			if not arg_30_0.startCoupleActionId then
				return
			end

			if arg_30_0:HasFollowerAndNoVisitorAround() then
				arg_30_0:NotifiyCore(ISLAND_EVT.COUPLE_ACTION_WITH_FOLLOWER, arg_30_0.startCoupleActionId)
			else
				arg_30_0.isWaitingCoupleAction = true

				arg_30_0:NotifiyMeditor(IslandBaseMediator.ANIMATION_OP, 0, arg_30_0.startCoupleActionId)
			end
		end)
		arg_30_0:ApplyEffect(arg_30_1)
	elseif var_30_0.type == IslandConst.ANIMATION_OP_SIGNLE then
		if arg_30_0.startSingleActionId == arg_30_1 then
			return
		end

		arg_30_0:NotifiyCore(ISLAND_EVT.LOCK_PLAYER_INPUT)

		arg_30_0.startSingleActionId = arg_30_1

		arg_30_0:RemoveWaitTimer()
		arg_30_0:GetPlayerUnit():PlayAnimation(var_30_0.resource, 0.25, function()
			arg_30_0.startSingleActionId = nil

			IslandTaskHelper.OnActionEnd(var_30_0.id)
			arg_30_0:NotifiyCore(ISLAND_EVT.PLAY_SIGNLE_ANIMATION_END, var_30_0.id)
			arg_30_0:ClearSelected()
		end)
	end
end

function var_0_0.ClearSelected(arg_33_0, ...)
	arg_33_0.selectedId = nil

	arg_33_0:UpdateCardsSelected()
end

function var_0_0.HasFollowerAndNoVisitorAround(arg_34_0)
	local var_34_0 = pg.island_set.action_bubble_range.key_value_int
	local var_34_1 = arg_34_0:GetView()
	local var_34_2 = var_34_1:GetPlayerPosition()
	local var_34_3 = var_34_1:GetUnitListByKey(IslandConst.UNIT_LIST_PLAYER)
	local var_34_4 = _.any(var_34_3, function(arg_35_0)
		return arg_35_0 ~= var_34_1.player and Vector3.Distance(arg_35_0:GetPosition(), var_34_2) <= var_34_0
	end)
	local var_34_5 = var_34_1:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_34_6 = _.any(var_34_3, function(arg_36_0)
		return Vector3.Distance(arg_36_0:GetPosition(), var_34_2) <= var_34_0
	end)

	return not var_34_4 and var_34_6
end

function var_0_0.ApplyEffect(arg_37_0, arg_37_1)
	arg_37_0:CancelEffect()

	local var_37_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_37_1 = pg.TimeMgr.GetInstance():GetServerTime() + arg_37_0.waitTime

	arg_37_0.loadingData = {
		id = arg_37_1,
		startTime = var_37_0,
		endTime = var_37_1
	}

	for iter_37_0, iter_37_1 in pairs(arg_37_0.cards) do
		if iter_37_1:Contains(arg_37_1) then
			iter_37_1:LoadingEffect(arg_37_0.loadingData)

			break
		end
	end
end

function var_0_0.CancelEffect(arg_38_0)
	if arg_38_0.loadingData then
		local var_38_0 = arg_38_0.loadingData.id

		arg_38_0.loadingData = nil

		for iter_38_0, iter_38_1 in pairs(arg_38_0.cards) do
			if iter_38_1:Contains(var_38_0) then
				iter_38_1:ClearLoadingEffect()

				break
			end
		end
	end
end

function var_0_0.AddWaitTimer(arg_39_0, arg_39_1)
	arg_39_0:RemoveWaitTimer()

	arg_39_0.startCoupleActionId = arg_39_1
	arg_39_0.timer = Timer.New(function()
		arg_39_0:RemoveWaitTimer()
		arg_39_0:ClearSelected()
	end, arg_39_0.waitTime, 1)

	arg_39_0.timer:Start()
end

function var_0_0.RemoveWaitTimer(arg_41_0, arg_41_1)
	arg_41_1 = defaultValue(arg_41_1, true)

	if not arg_41_1 then
		arg_41_0:ClearSelected()
	end

	arg_41_0:CancelEffect()

	if arg_41_0.timer then
		arg_41_0.timer:Stop()

		arg_41_0.timer = nil
	end

	if arg_41_0.startCoupleActionId then
		if arg_41_1 then
			arg_41_0:GetPlayerUnit():CheckMovement()
		end

		arg_41_0.startCoupleActionId = nil
	end

	if arg_41_0.isWaitingCoupleAction then
		arg_41_0.isWaitingCoupleAction = false

		arg_41_0:NotifiyMeditor(IslandBaseMediator.ANIMATION_OP, 0, 0)
	end
end

function var_0_0.UpdateCardsSelected(arg_42_0)
	for iter_42_0, iter_42_1 in pairs(arg_42_0.cards) do
		iter_42_1:UpdateSelected(arg_42_0.selectedId)
	end
end

function var_0_0.OnUpdateItem(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_0.cards[arg_43_2]

	if not var_43_0 then
		arg_43_0:OnInitItem(arg_43_2)

		var_43_0 = arg_43_0.cards[arg_43_2]
	end

	local var_43_1 = arg_43_0.displays[arg_43_1 + 1]

	var_43_0:Update(var_43_1, arg_43_0.selectedId, arg_43_0.loadingData, arg_43_0.markActionId)
end

function var_0_0.OnDisable(arg_44_0)
	if arg_44_0.isShowing then
		arg_44_0:NotifiyCore(ISLAND_EVT.CLOSE_ANIMATION_OP)

		arg_44_0.isShowing = false

		for iter_44_0, iter_44_1 in pairs(arg_44_0.cards) do
			iter_44_1:Clear()
		end

		setParent(arg_44_0.opPanel, arg_44_0.lookParent)
	end
end

function var_0_0.OnDispose(arg_45_0)
	var_0_0.super.OnDispose(arg_45_0)
	ClearLScrollrect(arg_45_0.scrollrect)
	arg_45_0.chatView:Dispose()

	arg_45_0.chatView = nil

	arg_45_0:RemoveWaitTimer()

	for iter_45_0, iter_45_1 in pairs(arg_45_0.cards) do
		iter_45_1:Dispose()
	end

	arg_45_0.cards = nil
	arg_45_0.isShowing = false
	arg_45_0.markActionId = nil
end

return var_0_0
