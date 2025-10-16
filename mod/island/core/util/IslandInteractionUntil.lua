local var_0_0 = class("IslandInteractionUntil")

var_0_0.TYPE_STORY = 1
var_0_0.TYPE_BUBBLE = 2
var_0_0.TYPE_ACTION = 3
var_0_0.TYPE_AGORA = 4
var_0_0.TYPE_AGORA_CANCEL = 5
var_0_0.TYPE_OPEN_PAGE = 6
var_0_0.TYPE_TRANSFER = 7
var_0_0.TYPE_BT_VALUE = 8
var_0_0.TYPE_ITEM_INTERACT = 9
var_0_0.TYPE_ITEM_INTERACT_CANCEL = 10
var_0_0.TYPE_ACCEPT_TASK = 11
var_0_0.TYPE_SUBMIT_TASK = 12
var_0_0.TYPE_SIGNIN = 13
var_0_0.TYPE_SELECT_GIFT = 14
var_0_0.TYPE_NOTHING = 15
var_0_0.TYPE_DECORATION = 18
var_0_0.TYPE_EXTEND_AGORA = 19
var_0_0.TYPE_ECHANGE_AGORA_BASE = 20
var_0_0.TYPE_PERFORMANCE = 21
var_0_0.TYPE_NEXT_INTERACTION = 22
var_0_0.TYPE_FOLLOW_PLAYER = 23
var_0_0.TYPE_SP_TRANSFER = 24
var_0_0.SIGNIN_TIME_ID = 4002

function var_0_0.GetInteractionOptions(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = pg.island_interaction.get_id_list_by_groupId[arg_1_1] or {}

	return _(var_1_0):chain():map(function(arg_2_0)
		return pg.island_interaction[arg_2_0]
	end):select(function(arg_3_0)
		if arg_3_0.only_self == 0 and arg_1_0.id ~= getProxy(IslandProxy):GetIsland().id then
			return false
		end

		return _.all(arg_3_0.show_condition, function(arg_4_0)
			return IslandInteractionConditionUntil.Check(arg_1_0, arg_4_0, arg_1_2)
		end)
	end):value()
end

local function var_0_1(arg_5_0, arg_5_1, arg_5_2)
	require("nodecanvas.Task.NcPlayStory").New(nil, {}):DoAction(arg_5_0, true, function()
		var_0_0.AddInteractionTaskProgress(arg_5_1, arg_5_2)
	end)
end

local function var_0_2(arg_7_0, arg_7_1, arg_7_2)
	require("nodecanvas.Task.NcPlayChatBubble").New(nil, {}):DoAction(arg_7_0, function()
		var_0_0.AddInteractionTaskProgress(arg_7_1, arg_7_2)
	end)
end

local function var_0_3(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = (not arg_9_0 or arg_9_0 == 0) and arg_9_2.view.player or arg_9_2.view:GetUnitModule(arg_9_0)

	if not var_9_0 then
		return
	end

	if var_9_0._tf.childCount <= 0 then
		return
	end

	local var_9_1 = var_9_0._tf:GetChild(0):GetComponent(typeof(Animator))

	if not var_9_1 then
		return
	end

	local var_9_2 = Animator.StringToHash(arg_9_1)

	for iter_9_0 = 1, var_9_1.layerCount do
		var_9_1:CrossFadeInFixedTime(var_9_2, 0.2, iter_9_0 - 1)
	end
end

local function var_0_4(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1.view.player.id

	arg_10_1:Op("InterAction", arg_10_0, var_10_0)
end

local function var_0_5(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1.view.player.id

	arg_11_1:Op("InterActionEnd", arg_11_0, var_11_0)
end

local function var_0_6(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = Clone(arg_12_0)
	local var_12_1 = var_12_0[1]

	table.remove(var_12_0, 1)
	table.insert(var_12_0, arg_12_2)
	arg_12_1:NotifiyIsland(ISLAND_EX_EVT.OPEN_PAGE, _G[var_12_1], unpack(var_12_0))
end

local function var_0_7(arg_13_0, arg_13_1)
	arg_13_1:NotifiyIsland(ISLAND_EX_EVT.SWITCH_MAP, tonumber(arg_13_0))
end

local function var_0_8(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_2:GetView():GetUnitModule(arg_14_1)

	if var_14_0.behaviourTreeOwner then
		if tonumber(arg_14_0[2]) then
			LuaHelper.NodeCanvasSetIntVariableValue(var_14_0.behaviourTreeOwner, arg_14_0[1], arg_14_0[2])
		else
			var_14_0.behaviourTreeOwner.graph.blackboard:SetVariableValue(arg_14_0[1], arg_14_0[2])
		end
	end
end

local function var_0_9(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_1.view.player.id

	arg_15_1:Op("WorldObjectInterAction", arg_15_0, var_15_0, tonumber(arg_15_2))
end

local function var_0_10(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1.view.player.id

	arg_16_1:Op("WorldObjectInterActionEnd", arg_16_0, var_16_0)
end

local function var_0_11(arg_17_0, arg_17_1)
	arg_17_1:NotifiyIsland(ISLAND_EX_EVT.TRIGGER_TASK, tonumber(arg_17_0))
end

local function var_0_12(arg_18_0, arg_18_1)
	arg_18_1:NotifiyIsland(ISLAND_EX_EVT.SUBMIT_TASK, tonumber(arg_18_0))
end

local function var_0_13(arg_19_0)
	arg_19_0:NotifiyIsland(ISLAND_EX_EVT.EMIT, IslandMediator.SIGNIN)
end

local function var_0_14(arg_20_0)
	local var_20_0 = arg_20_0:GetView()
	local var_20_1 = var_20_0:GetUnitModule(var_20_0.selectedUnitId)

	if not var_20_1 then
		return
	end

	local var_20_2 = var_20_0:GetIsland().id

	arg_20_0:NotifiyIsland(ISLAND_EX_EVT.EMIT, IslandMediator.SELECT_GIFT, var_20_2, var_20_1.data.index)
end

local function var_0_15(arg_21_0)
	arg_21_0:NotifiyIsland(ISLAND_EX_EVT.OPEN_PAGE)
end

function var_0_0.AddInteractionTaskProgress(arg_22_0, arg_22_1)
	arg_22_0:Op("NotifiyIsland", ISLAND_EX_EVT.ADD_TASK_PROGRESS, IslandTaskTargetType.INTERACTION, arg_22_1)
end

local function var_0_16(arg_23_0)
	arg_23_0:NotifiyIsland(ISLAND_EX_EVT.EMIT, IslandMediator.GET_THEMES, function()
		arg_23_0:Op("EnterEditMode")
	end)
end

local function var_0_17(arg_25_0)
	local var_25_0 = arg_25_0:GetView()
	local var_25_1 = var_25_0:GetIsland()

	if not var_25_1:GetAgoraAgency():CanUpgrade() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_max_level"))

		return
	end

	var_25_0:ShowMsgbox({
		type = IslandMsgBox.TYPE_AGORA_UPGRADE,
		island = var_25_1,
		onYes = function()
			arg_25_0:Op("Upgrade")
		end
	})
end

local function var_0_18(arg_27_0, arg_27_1)
	arg_27_0:NotifiyIsland(ISLAND_EX_EVT.PLAY_PERFORMANCE, {
		name = arg_27_1
	})
end

local function var_0_19(arg_28_0, arg_28_1)
	arg_28_0:GetView():GetSubView(IslandInteractionView):ShowNextInteractionBtns(arg_28_1)
end

local function var_0_20(arg_29_0, arg_29_1)
	local var_29_0 = pg.island_strollnpc[arg_29_1]
	local var_29_1

	for iter_29_0, iter_29_1 in ipairs(pg.island_chara_template.all) do
		if pg.island_chara_template[iter_29_1].unit_id == var_29_0.unit_id then
			var_29_1 = iter_29_1

			break
		end
	end

	if var_29_1 then
		arg_29_0:NotifiyMeditor(IslandMediator.ADD_FOLLOWER, var_29_1)
	end
end

function var_0_0.Response(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = pg.island_interaction[arg_30_2]

	if var_30_0.type == var_0_0.TYPE_STORY then
		var_0_1(var_30_0.param, arg_30_0, arg_30_2)
	elseif var_30_0.type == var_0_0.TYPE_BUBBLE then
		var_0_2(var_30_0.param, arg_30_0, arg_30_2)
	elseif var_30_0.type == var_0_0.TYPE_ACTION then
		var_0_3(var_30_0.param[1], var_30_0.param[2], arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_AGORA then
		var_0_4(arg_30_1, arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_AGORA_CANCEL then
		var_0_5(arg_30_1, arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_OPEN_PAGE then
		var_0_6(var_30_0.param, arg_30_0, arg_30_1)
	elseif var_30_0.type == var_0_0.TYPE_TRANSFER or var_30_0.type == var_0_0.TYPE_SP_TRANSFER then
		var_0_7(var_30_0.param, arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_BT_VALUE then
		var_0_8(var_30_0.param, arg_30_1, arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_ITEM_INTERACT then
		var_0_9(arg_30_1, arg_30_0, var_30_0.param)
	elseif var_30_0.type == var_0_0.TYPE_ITEM_INTERACT_CANCEL then
		var_0_10(arg_30_1, arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_ACCEPT_TASK then
		var_0_11(var_30_0.param, arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_SUBMIT_TASK then
		var_0_12(var_30_0.param, arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_SIGNIN then
		var_0_13(arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_SELECT_GIFT then
		var_0_14(arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_NOTHING then
		-- block empty
	elseif var_30_0.type == var_0_0.TYPE_DECORATION then
		var_0_16(arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_EXTEND_AGORA then
		var_0_17(arg_30_0)
	elseif var_30_0.type == var_0_0.TYPE_ECHANGE_AGORA_BASE then
		-- block empty
	elseif var_30_0.type == var_0_0.TYPE_PERFORMANCE then
		var_0_18(arg_30_0, var_30_0.param)
	elseif var_30_0.type == var_0_0.TYPE_NEXT_INTERACTION then
		var_0_19(arg_30_0, var_30_0.param)
	elseif var_30_0.type == var_0_0.TYPE_FOLLOW_PLAYER then
		var_0_20(arg_30_0, arg_30_1)
	else
		assert(false, "未处理类型:" .. var_30_0.type)
	end

	if var_30_0.type ~= var_0_0.TYPE_STORY and var_30_0.type ~= var_0_0.TYPE_BUBBLE then
		var_0_0.AddInteractionTaskProgress(arg_30_0, arg_30_2)
	end

	if var_30_0.type == var_0_0.TYPE_STORY or var_30_0.type == var_0_0.TYPE_BUBBLE then
		local var_30_1 = pg.island_world_objects[arg_30_1].unitId

		IslandBookHelper.OnNpcInteract(var_30_1)
	end
end

return var_0_0
