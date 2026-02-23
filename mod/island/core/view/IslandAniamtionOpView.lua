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
end

function var_0_0.OnEnable(arg_20_0)
	if not arg_20_0.isInitList then
		arg_20_0:InitList()
	end

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

	return var_21_0, var_21_1
end

local function var_0_4(arg_22_0)
	local var_22_0 = {}

	for iter_22_0 = 1, #arg_22_0, 2 do
		local var_22_1 = arg_22_0[iter_22_0]
		local var_22_2 = arg_22_0[iter_22_0 + 1]

		table.insert(var_22_0, {
			var_22_1,
			var_22_2
		})
	end

	return var_22_0
end

function var_0_0.InitList(arg_23_0)
	local var_23_0, var_23_1 = arg_23_0:GetData()
	local var_23_2 = {}

	if arg_23_0.page == var_0_1 then
		local var_23_3 = var_0_4(var_23_0)

		for iter_23_0, iter_23_1 in ipairs(var_23_3) do
			table.insert(var_23_2, iter_23_1)
		end
	end

	if arg_23_0.page == var_0_2 then
		local var_23_4 = var_0_4(var_23_1)

		for iter_23_2, iter_23_3 in ipairs(var_23_4) do
			table.insert(var_23_2, iter_23_3)
		end
	end

	arg_23_0.displays = var_23_2
	arg_23_0.scrollrect.enabled = true

	arg_23_0.scrollrect:SetTotalCount(#var_23_2, 0)

	arg_23_0.isInitList = true
end

function var_0_0.OnInitItem(arg_24_0, arg_24_1)
	local var_24_0 = IslandAniamtionOpCard.New(arg_24_1)

	onButton(arg_24_0, var_24_0.item1, function()
		arg_24_0.selectedId = var_24_0.firstId

		arg_24_0:UpdateCardsSelected()
		arg_24_0:PlayAniamtion(var_24_0.firstId)
	end, SFX_PANEL)
	onButton(arg_24_0, var_24_0.item2, function()
		arg_24_0.selectedId = var_24_0.secondId

		arg_24_0:UpdateCardsSelected()
		arg_24_0:PlayAniamtion(var_24_0.secondId)
	end, SFX_PANEL)

	arg_24_0.cards[arg_24_1] = var_24_0
end

function var_0_0.CanPlayCoupleAction(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0:GetPlayerUnit()
	local var_27_1 = BuildVector3(arg_27_1.respond_point).magnitude

	return IslandCalcUtil.IsCircleInsideNavMesh(var_27_0.agent, var_27_0._tf.position, var_27_1, 12)
end

function var_0_0.PlayAniamtion(arg_28_0, arg_28_1)
	if not arg_28_1 then
		return
	end

	local var_28_0 = pg.island_action[arg_28_1]

	if var_28_0.type == IslandConst.ANIMATION_OP_DOUBLE then
		if arg_28_0.startCoupleActionId == arg_28_1 then
			return
		end

		if not arg_28_0:CanPlayCoupleAction(var_28_0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_position_cant_play_cp_action"))

			return
		end

		arg_28_0:NotifiyCore(ISLAND_EVT.LOCK_PLAYER_INPUT)

		arg_28_0.startSingleActionId = nil

		arg_28_0:AddWaitTimer(arg_28_1)
		arg_28_0:GetPlayerUnit():PlayAnimation(var_28_0.resource, 0.25, function()
			if not arg_28_0.startCoupleActionId then
				return
			end

			if arg_28_0:HasFollowerAndNoVisitorAround() then
				arg_28_0:NotifiyCore(ISLAND_EVT.COUPLE_ACTION_WITH_FOLLOWER, arg_28_0.startCoupleActionId)
			else
				arg_28_0.isWaitingCoupleAction = true

				arg_28_0:NotifiyMeditor(IslandBaseMediator.ANIMATION_OP, 0, arg_28_0.startCoupleActionId)
			end
		end)
		arg_28_0:ApplyEffect(arg_28_1)
	elseif var_28_0.type == IslandConst.ANIMATION_OP_SIGNLE then
		if arg_28_0.startSingleActionId == arg_28_1 then
			return
		end

		arg_28_0:NotifiyCore(ISLAND_EVT.LOCK_PLAYER_INPUT)

		arg_28_0.startSingleActionId = arg_28_1

		arg_28_0:RemoveWaitTimer()
		arg_28_0:GetPlayerUnit():PlayAnimation(var_28_0.resource, 0.25, function()
			arg_28_0.startSingleActionId = nil

			IslandTaskHelper.OnActionEnd(var_28_0.id)
			arg_28_0:NotifiyCore(ISLAND_EVT.PLAY_SIGNLE_ANIMATION_END, var_28_0.id)
		end)
	end
end

function var_0_0.HasFollowerAndNoVisitorAround(arg_31_0)
	local var_31_0 = pg.island_set.action_bubble_range.key_value_int
	local var_31_1 = arg_31_0:GetView()
	local var_31_2 = var_31_1:GetPlayerPosition()
	local var_31_3 = var_31_1:GetUnitListByKey(IslandConst.UNIT_LIST_PLAYER)
	local var_31_4 = _.any(var_31_3, function(arg_32_0)
		return arg_32_0 ~= var_31_1.player and Vector3.Distance(arg_32_0:GetPosition(), var_31_2) <= var_31_0
	end)
	local var_31_5 = var_31_1:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_31_6 = _.any(var_31_3, function(arg_33_0)
		return Vector3.Distance(arg_33_0:GetPosition(), var_31_2) <= var_31_0
	end)

	return not var_31_4 and var_31_6
end

function var_0_0.ApplyEffect(arg_34_0, arg_34_1)
	arg_34_0:CancelEffect()

	local var_34_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_34_1 = pg.TimeMgr.GetInstance():GetServerTime() + arg_34_0.waitTime

	arg_34_0.loadingData = {
		id = arg_34_1,
		startTime = var_34_0,
		endTime = var_34_1
	}

	for iter_34_0, iter_34_1 in pairs(arg_34_0.cards) do
		if iter_34_1:Contains(arg_34_1) then
			iter_34_1:LoadingEffect(arg_34_0.loadingData)

			break
		end
	end
end

function var_0_0.CancelEffect(arg_35_0)
	if arg_35_0.loadingData then
		local var_35_0 = arg_35_0.loadingData.id

		arg_35_0.loadingData = nil

		for iter_35_0, iter_35_1 in pairs(arg_35_0.cards) do
			if iter_35_1:Contains(var_35_0) then
				iter_35_1:ClearLoadingEffect()

				break
			end
		end
	end
end

function var_0_0.AddWaitTimer(arg_36_0, arg_36_1)
	arg_36_0:RemoveWaitTimer()

	arg_36_0.startCoupleActionId = arg_36_1
	arg_36_0.timer = Timer.New(function()
		arg_36_0:RemoveWaitTimer()
	end, arg_36_0.waitTime, 1)

	arg_36_0.timer:Start()
end

function var_0_0.RemoveWaitTimer(arg_38_0, arg_38_1)
	arg_38_1 = defaultValue(arg_38_1, true)

	arg_38_0:CancelEffect()

	if arg_38_0.timer then
		arg_38_0.timer:Stop()

		arg_38_0.timer = nil
	end

	if arg_38_0.startCoupleActionId then
		if arg_38_1 then
			arg_38_0:GetPlayerUnit():CheckMovement()
		end

		arg_38_0.startCoupleActionId = nil
	end

	if arg_38_0.isWaitingCoupleAction then
		arg_38_0.isWaitingCoupleAction = false

		arg_38_0:NotifiyMeditor(IslandBaseMediator.ANIMATION_OP, 0, 0)
	end
end

function var_0_0.UpdateCardsSelected(arg_39_0)
	for iter_39_0, iter_39_1 in pairs(arg_39_0.cards) do
		iter_39_1:UpdateSelected(arg_39_0.selectedId)
	end
end

function var_0_0.OnUpdateItem(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_0.cards[arg_40_2]

	if not var_40_0 then
		arg_40_0:OnInitItem(arg_40_2)

		var_40_0 = arg_40_0.cards[arg_40_2]
	end

	local var_40_1 = arg_40_0.displays[arg_40_1 + 1]

	var_40_0:Update(var_40_1, arg_40_0.selectedId, arg_40_0.loadingData)
end

function var_0_0.OnDisable(arg_41_0)
	if arg_41_0.isShowing then
		arg_41_0:NotifiyCore(ISLAND_EVT.CLOSE_ANIMATION_OP)

		arg_41_0.isShowing = false

		for iter_41_0, iter_41_1 in pairs(arg_41_0.cards) do
			iter_41_1:Clear()
		end

		setParent(arg_41_0.opPanel, arg_41_0.lookParent)
	end
end

function var_0_0.OnDispose(arg_42_0)
	var_0_0.super.OnDispose(arg_42_0)
	ClearLScrollrect(arg_42_0.scrollrect)
	arg_42_0.chatView:Dispose()

	arg_42_0.chatView = nil

	arg_42_0:RemoveWaitTimer()

	for iter_42_0, iter_42_1 in pairs(arg_42_0.cards) do
		iter_42_1:Dispose()
	end

	arg_42_0.cards = nil
	arg_42_0.isShowing = false
end

return var_0_0
