local var_0_0 = class("IslandInteractionConditionUntil")

var_0_0.SHOW_TYPE_CAN_ACCEPT_TASK = 1
var_0_0.SHOW_TYPE_EXIST_TASK = 2
var_0_0.SHOW_TYPE_CAN_SUBMIT_TASK = 3
var_0_0.SHOW_TYPE_FINISHED_TASK = 4
var_0_0.SHOW_TYPE_CAN_SIGNIN = 5
var_0_0.SHOW_TYPE_CAN_SELECT_GIFT = 6
var_0_0.SHOW_TYPE_CAN_INVITE_PLAYER = 7
var_0_0.SHOW_TYPE_CANT_SIGNIN = 8
var_0_0.SHOW_TYPE_CAN_WILD_GATHER = 9
var_0_0.SHOW_TYPE_CAN_WILD_SIGNIN = 10
var_0_0.SHOW_TYPE_ABILITY = 11
var_0_0.SHOW_TYPE_TASK_TARGET = 12

function var_0_0.Check(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1[1]
	local var_1_1 = arg_1_1[2]
	local var_1_2 = arg_1_1[3]

	return switch(var_1_0, {
		[var_0_0.SHOW_TYPE_CAN_ACCEPT_TASK] = function()
			local var_2_0 = arg_1_0:GetTaskAgency():GetFutureTask(var_1_1)

			return var_2_0 and var_2_0:IsUnlock()
		end,
		[var_0_0.SHOW_TYPE_EXIST_TASK] = function()
			local var_3_0 = arg_1_0:GetTaskAgency():GetTask(var_1_1)

			return var_3_0 and not var_3_0:IsFinish()
		end,
		[var_0_0.SHOW_TYPE_CAN_SUBMIT_TASK] = function()
			local var_4_0 = arg_1_0:GetTaskAgency():GetTask(var_1_1)

			return var_4_0 and var_4_0:IsFinish()
		end,
		[var_0_0.SHOW_TYPE_FINISHED_TASK] = function()
			return (arg_1_0:GetTaskAgency():IsFinishTask(var_1_1))
		end,
		[var_0_0.SHOW_TYPE_CAN_SIGNIN] = function()
			return getProxy(IslandProxy):GetIsland().id == arg_1_0.id and arg_1_0:GetSignInAgency():CanSignIn()
		end,
		[var_0_0.SHOW_TYPE_CAN_SELECT_GIFT] = function()
			local var_7_0 = getProxy(IslandProxy):GetIsland().id == arg_1_0.id

			return var_7_0 and arg_1_0:GetSignInAgency():CanSelectGift() or not var_7_0
		end,
		[var_0_0.SHOW_TYPE_CAN_INVITE_PLAYER] = function()
			return getProxy(IslandProxy):GetIsland().id == arg_1_0.id and arg_1_0:GetSignInAgency():CanInvite()
		end,
		[var_0_0.SHOW_TYPE_CANT_SIGNIN] = function()
			return getProxy(IslandProxy):GetIsland().id == arg_1_0.id and not arg_1_0:GetSignInAgency():CanSignIn()
		end,
		[var_0_0.SHOW_TYPE_ABILITY] = function()
			return arg_1_0:GetAblityAgency():HasAbility(var_1_1)
		end,
		[var_0_0.SHOW_TYPE_TASK_TARGET] = function()
			local var_11_0 = arg_1_0:GetTaskAgency():GetTask(var_1_1)

			return var_11_0 and var_11_0:GetTargetById(var_1_2) and not var_11_0:GetTargetById(var_1_2):IsFinish()
		end
	}, function()
		assert(false, "非法显示条件类型:" .. var_1_0)
	end)
end

return var_0_0
