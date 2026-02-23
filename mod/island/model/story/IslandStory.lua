local var_0_0 = class("IslandStory")

var_0_0.MODE_BUBBLE = 9
var_0_0.MODE_DIALOGUE = 10

function var_0_0.GetStoryStepCls(arg_1_0)
	return ({
		[var_0_0.MODE_BUBBLE] = BubbleStep,
		[var_0_0.MODE_DIALOGUE] = Dialogue3DStep
	})[arg_1_0]
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.id = arg_2_1.id
	arg_2_0.unitList = arg_2_2 or {}
	arg_2_0.lockOp = defaultValue(arg_2_1.lockOp, false)
	arg_2_0.unitMap = arg_2_1.map or {}
	arg_2_0.lookWeight = arg_2_1.look_weight or {}

	assert(arg_2_1.map, "请确保配置文件存在map字段" .. arg_2_1.id)

	arg_2_0.useUISpace = defaultValue(arg_2_1.useUISpace, true)
	arg_2_0.steps = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.scripts or {}) do
		local var_2_0 = var_0_0.GetStoryStepCls(arg_2_3).New(iter_2_1, arg_2_0)

		table.insert(arg_2_0.steps, var_2_0)
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_0.steps) do
		local var_2_1, var_2_2 = arg_2_0:GetUnitIdFromCharaId(iter_2_3.characterId)

		iter_2_3.unitId = var_2_1
		iter_2_3.unitType = var_2_2
	end

	arg_2_0.speedData = arg_2_1.speed or getProxy(SettingsProxy):GetStorySpeed() or 0
	arg_2_0.fadeIn = arg_2_1.fadeIn or 0
	arg_2_0.fadeOut = arg_2_1.fadeOut or 0
	arg_2_0.branchCode = nil
	arg_2_0.isAuto = false
	arg_2_0.speed = 0
	arg_2_0.skipFlag = false
	arg_2_0.followOffset = arg_2_1.followOffset
	arg_2_0.defultFollowOffset = Vector3(0, 1, 5)
	arg_2_0.soloCamDir = defaultValue(arg_2_1.cam_dir, 0) == 0
end

function var_0_0.ContainerPlayer(arg_3_0)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.steps) do
		if not iter_3_1.characterId or iter_3_1.characterId == 0 then
			return true
		end
	end

	return false
end

function var_0_0.IsFacingWhenSolo(arg_4_0)
	return arg_4_0.soloCamDir
end

function var_0_0.LastStepIsTimeline(arg_5_0)
	local var_5_0 = arg_5_0.steps[#arg_5_0.steps]

	if isa(var_5_0, Dialogue3DStep) then
		return var_5_0:IsTimeline()
	else
		return false
	end
end

function var_0_0.GetFadeInTime(arg_6_0)
	return arg_6_0.fadeIn
end

function var_0_0.GetFadeOutTime(arg_7_0)
	return arg_7_0.fadeOut
end

function var_0_0.GetDefultFollowOffset(arg_8_0)
	return arg_8_0.defultFollowOffset
end

function var_0_0.ShouldSetCamOffset(arg_9_0)
	return arg_9_0.followOffset ~= nil
end

function var_0_0.GetFollowOffset(arg_10_0)
	if not arg_10_0:ShouldSetCamOffset() then
		return nil
	end

	return BuildVector3(arg_10_0.followOffset)
end

function var_0_0.SetAutoPlay(arg_11_0)
	arg_11_0.isAuto = true

	arg_11_0:SetPlaySpeed(arg_11_0.speedData)
end

function var_0_0.StopAutoPlay(arg_12_0)
	arg_12_0.isAuto = false

	arg_12_0:ResetSpeed()
end

function var_0_0.GetAutoPlayFlag(arg_13_0)
	return arg_13_0.isAuto
end

function var_0_0.UpdatePlaySpeed(arg_14_0)
	local var_14_0 = getProxy(SettingsProxy):GetStorySpeed() or 0

	arg_14_0:SetPlaySpeed(var_14_0)
end

function var_0_0.GetPlaySpeed(arg_15_0)
	return arg_15_0.speed
end

function var_0_0.SetPlaySpeed(arg_16_0, arg_16_1)
	arg_16_0.speed = arg_16_1
end

function var_0_0.ResetSpeed(arg_17_0)
	arg_17_0.speed = 0
end

function var_0_0.GetTriggerDelayTime(arg_18_0)
	local var_18_0 = table.indexof(Story.STORY_AUTO_SPEED, arg_18_0.speed)

	if var_18_0 then
		return Story.TRIGGER_DELAY_TIME[var_18_0] or 0
	end

	return 0
end

function var_0_0.IsSkipAll(arg_19_0)
	return arg_19_0.skipFlag == true
end

function var_0_0.MarkSkipAll(arg_20_0)
	arg_20_0.skipFlag = true
end

function var_0_0.UnMarkSkipAll(arg_21_0)
	arg_21_0.skipFlag = false
end

function var_0_0.GetStepByIndex(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.steps[arg_22_1]

	if not var_22_0 or arg_22_0.branchCode and not var_22_0:IsSameBranch(arg_22_0.branchCode) then
		return nil
	end

	return var_22_0
end

function var_0_0.SetBranchCode(arg_23_0, arg_23_1)
	arg_23_0.branchCode = arg_23_1
end

function var_0_0.IsUseUISpace(arg_24_0)
	return arg_24_0.useUISpace
end

function var_0_0.GetUnitIdFromCharaId(arg_25_0, arg_25_1)
	if not arg_25_1 or arg_25_1 == 0 then
		return 0, IslandConst.UNIT_LIST_PLAYER
	end

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.unitMap) do
		local var_25_0 = iter_25_1[1]
		local var_25_1 = iter_25_1[2]
		local var_25_2 = iter_25_1[3] or IslandConst.UNIT_LIST_OBJ

		if var_25_0 == arg_25_1 then
			return var_25_1, var_25_2
		end
	end

	return 0, IslandConst.UNIT_LIST_PLAYER
end

function var_0_0.GetLookGroup(arg_26_0)
	local var_26_0 = {}
	local var_26_1 = {}
	local var_26_2 = {}

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.unitMap) do
		local var_26_3 = arg_26_0.lookWeight[iter_26_0] or {}
		local var_26_4 = arg_26_0:GetRole({
			id = iter_26_1[2],
			type = iter_26_1[3] or IslandConst.UNIT_LIST_OBJ
		})

		if var_26_4 then
			table.insert(var_26_0, var_26_4)
			table.insert(var_26_1, var_26_3[1] or 1)
			table.insert(var_26_2, var_26_3[2] or 0)
		end
	end

	local var_26_5 = arg_26_0:GetPlayerRole()

	if not table.contains(var_26_0, var_26_5) then
		table.insert(var_26_0, var_26_5)

		local var_26_6 = arg_26_0.lookWeight[#arg_26_0.lookWeight] or {}

		table.insert(var_26_1, var_26_6[1] or 1)
		table.insert(var_26_2, var_26_6[2] or 0)
	end

	return var_26_0, var_26_1, var_26_2
end

function var_0_0.GetPlayerRole(arg_27_0)
	for iter_27_0, iter_27_1 in ipairs(arg_27_0.unitList) do
		if isa(iter_27_1, IslandPlayerUnit) then
			return iter_27_1._go
		end
	end

	return nil
end

function var_0_0.GetRole(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1.id
	local var_28_1 = arg_28_1.type

	if not var_28_0 or var_28_0 == 0 then
		return arg_28_0:GetPlayerRole()
	end

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.unitList) do
		if var_28_0 and iter_28_1.id == var_28_0 and iter_28_1.unitType == var_28_1 then
			return iter_28_1._go
		end
	end

	return nil
end

function var_0_0.GetUnitList(arg_29_0)
	return arg_29_0.unitList
end

function var_0_0.IsFreeOp(arg_30_0)
	return not arg_30_0.lockOp
end

return var_0_0
