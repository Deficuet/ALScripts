local var_0_0 = class("IslandGiftAllocator", import(".IslandComparableAllocator"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.controller = arg_1_1
	arg_1_0.signInAgency = arg_1_1:GetIsland():GetSignInAgency()

	var_0_0.super.Ctor(arg_1_0, arg_1_1)
	arg_1_0:AddTimer()
end

function var_0_0.AddTimer(arg_2_0)
	arg_2_0:RemoveTimer()

	local var_2_0 = GetZeroTime() - pg.TimeMgr.GetInstance():GetServerTime()

	if var_2_0 > 0 then
		arg_2_0.timer = Timer.New(function()
			arg_2_0:Flush()
		end, var_2_0, 1)

		arg_2_0.timer:Start()
	end
end

function var_0_0.RemoveTimer(arg_4_0)
	if arg_4_0.timer then
		arg_4_0.timer:Stop()

		arg_4_0.timer = nil
	end
end

function var_0_0.OnInitFlags(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.controller.sceneData.giftUnits) do
		arg_5_0.flags[iter_5_0] = arg_5_0:IsVisible(iter_5_0)
	end
end

function var_0_0.OnCompareSample(arg_6_0, arg_6_1, arg_6_2)
	for iter_6_0, iter_6_1 in pairs(arg_6_1) do
		local var_6_0 = iter_6_1
		local var_6_1 = arg_6_2[iter_6_0]

		if var_6_0 ~= nil and var_6_1 ~= nil and var_6_0 ~= var_6_1 then
			if var_6_0 == true and var_6_1 == false then
				local var_6_2 = arg_6_0:GetUnitData(iter_6_0)

				if var_6_2 then
					arg_6_0:RemoveUnit(IslandConst.UNIT_LIST_OBJ, var_6_2.id)
				end
			elseif var_6_0 == false and var_6_1 == true then
				local var_6_3 = arg_6_0:GetUnitData(iter_6_0)

				if var_6_3 then
					arg_6_0:GenUnit(var_6_3)
				end
			end
		end
	end
end

function var_0_0.IsVisible(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.signInAgency:Visible(arg_7_1)

	if arg_7_0.signInAgency:IsOutRange(arg_7_1) then
		return false
	end

	if arg_7_0.controller:IsSelfIsland() then
		if arg_7_0.signInAgency.signInCnt <= 0 then
			return false
		end

		local var_7_1 = arg_7_0.signInAgency.signInCnt > 0 and arg_7_0.signInAgency.fetchCnt == 0

		return var_7_0 or var_7_1
	else
		local var_7_2 = arg_7_0.controller:GetIsland()
		local var_7_3 = var_7_2:GetAccessAgency():HasOpenFlag(IslandConst.OPEN_SIGNIN)
		local var_7_4 = var_7_2:GetSignInAgency():InInInviteList(getProxy(PlayerProxy):getRawData().id)
		local var_7_5 = var_7_2:GetSignInAgency():IsExpiration()

		return var_7_0 and (var_7_3 or var_7_4) and not var_7_5
	end
end

function var_0_0.GetUnitData(arg_8_0, arg_8_1)
	assert(arg_8_0.controller.sceneData.giftUnits[arg_8_1], "unit data is nil ." .. arg_8_1)

	return arg_8_0.controller.sceneData.giftUnits[arg_8_1]
end

function var_0_0.OnDispose(arg_9_0)
	arg_9_0.signInAgency = nil

	arg_9_0:RemoveTimer()
end

return var_0_0
