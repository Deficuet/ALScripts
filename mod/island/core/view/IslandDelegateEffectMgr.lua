local var_0_0 = class("IslandDelegateEffectMgr", import(".IslandBaseUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.effectPath = pg.island_unit_item[1018].model
	arg_1_0.selEffectPath = pg.island_unit_item[1019].model
	arg_1_0.delegateEffectDic = {}
	arg_1_0.delegateSelectEffectDic = {}
	arg_1_0.delegateSelect = {}
end

function var_0_0.GenEffect(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.delegateSelect[arg_2_1] = false

	local var_2_0 = arg_2_0.delegateEffectDic[arg_2_1]

	if var_2_0 then
		arg_2_0:UpdatePositionAndRotation(arg_2_0.delegateEffectDic[arg_2_1], arg_2_2, arg_2_3)
		setActive(var_2_0, true)
	else
		arg_2_0:GetPoolMgr():GetDelegateEffect(arg_2_0.effectPath, function(arg_3_0)
			setParent(arg_3_0, arg_2_0:GetView().root)

			arg_2_0.delegateEffectDic[arg_2_1] = arg_3_0

			arg_2_0:UpdatePositionAndRotation(arg_3_0, arg_2_2, arg_2_3)

			if arg_2_0.delegateSelect[arg_2_1] then
				setActive(arg_3_0, false)
			end
		end)
	end

	if arg_2_0.delegateSelectEffectDic[arg_2_1] then
		arg_2_0:UpdatePositionAndRotation(arg_2_0.delegateSelectEffectDic[arg_2_1], arg_2_2, arg_2_3)
		setActive(var_2_0, false)
	else
		arg_2_0:GetPoolMgr():GetDelegateEffect(arg_2_0.selEffectPath, function(arg_4_0)
			setParent(arg_4_0, arg_2_0:GetView().root)

			arg_2_0.delegateSelectEffectDic[arg_2_1] = arg_4_0

			arg_2_0:UpdatePositionAndRotation(arg_4_0, arg_2_2, arg_2_3)

			if arg_2_0.delegateSelect[arg_2_1] then
				setActive(arg_4_0, true)
			end
		end)
	end
end

function var_0_0.UpdatePositionAndRotation(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	arg_5_1.transform.rotation = arg_5_3
	arg_5_1.transform.position = arg_5_2
end

function var_0_0.UpdateEffect(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if arg_6_0.delegateEffectDic[arg_6_1] then
		arg_6_0:UpdatePositionAndRotation(arg_6_0.delegateEffectDic[arg_6_1], arg_6_2, arg_6_3)
	end

	if arg_6_0.delegateSelectEffectDic[arg_6_1] then
		arg_6_0:UpdatePositionAndRotation(arg_6_0.delegateSelectEffectDic[arg_6_1], arg_6_2, arg_6_3)
	end
end

function var_0_0.OnDefaultSlotEffectShow(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0.delegateEffectDic[arg_7_1] then
		setActive(arg_7_0.delegateEffectDic[arg_7_1], arg_7_2)
	else
		arg_7_0.delegateSelect[arg_7_1] = arg_7_2
	end
end

function var_0_0.OnSelectSlotEffectShow(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_0.delegateSelectEffectDic[arg_8_1] then
		setActive(arg_8_0.delegateSelectEffectDic[arg_8_1], arg_8_2)
	else
		arg_8_0.delegateSelect[arg_8_1] = arg_8_2
	end
end

function var_0_0.OnDestroy(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.delegateSelectEffectDic) do
		arg_9_0:GetPoolMgr():ReturnDelegateEffect(arg_9_0.selEffectPath, iter_9_1)
	end

	for iter_9_2, iter_9_3 in ipairs(arg_9_0.delegateEffectDic) do
		arg_9_0:GetPoolMgr():ReturnDelegateEffect(arg_9_0.effectPath, iter_9_3)
	end

	arg_9_0:GetPoolMgr():ClearDelegateEffect()

	arg_9_0.delegateSelectEffectDic = nil
	arg_9_0.delegateEffectDic = nil
	arg_9_0.delegateSelect = nil
end

return var_0_0
