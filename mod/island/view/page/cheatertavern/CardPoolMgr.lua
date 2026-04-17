local var_0_0 = class("CardPoolMgr")
local var_0_1 = 5
local var_0_2 = 3

function var_0_0.Ctor(arg_1_0)
	arg_1_0.poolRoot = GameObject.New("CardPoolRoot")
	arg_1_0.poolDic = {}
end

function var_0_0.GetCardGameObjectById(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.poolDic[arg_2_1] = arg_2_0.poolDic[arg_2_1] or {}

	if #arg_2_0.poolDic[arg_2_1] == 0 then
		local var_2_0 = pg.bar_card[arg_2_1].unit_res
		local var_2_1 = pg.island_unit_item[var_2_0].model

		if arg_2_3 then
			local var_2_2 = LoadAny(var_2_1, nil)
			local var_2_3 = Object.Instantiate(var_2_2)

			arg_2_2(var_2_3)
		else
			LoadAnyAsync(var_2_1, "", nil, function(arg_3_0)
				local var_3_0 = Object.Instantiate(arg_3_0)

				arg_2_2(var_3_0)
			end)
		end
	else
		local var_2_4 = arg_2_0.poolDic[arg_2_1][1]

		if IsNil(var_2_4) then
			table.remove(arg_2_0.poolDic[arg_2_1], 1)
			arg_2_0:GetCardGameObjectById(arg_2_1, arg_2_2, arg_2_3)
		else
			setActive(var_2_4.transform, true)
			table.remove(arg_2_0.poolDic[arg_2_1], 1)
			arg_2_2(var_2_4)
		end
	end
end

function var_0_0.ReturnGameObjectById(arg_4_0, arg_4_1, arg_4_2)
	if IsNil(arg_4_2) then
		return
	end

	if (arg_4_1 == 0 and var_0_1 or var_0_2) <= #arg_4_0.poolDic[arg_4_1] then
		GameObject.Destroy(arg_4_2.gameObject)
	else
		table.insert(arg_4_0.poolDic[arg_4_1], arg_4_2)
		setActive(arg_4_2.transform, false)
		setParent(arg_4_2.transform, arg_4_0.poolRoot.transform, false)
	end
end

function var_0_0.Destroy(arg_5_0)
	for iter_5_0, iter_5_1 in pairs(arg_5_0.poolDic) do
		for iter_5_2 = #iter_5_1, 1, -1 do
			local var_5_0 = iter_5_1[iter_5_2]

			GameObject.Destroy(var_5_0.gameObject)
		end
	end

	arg_5_0.poolDic = {}

	if arg_5_0.poolRoot then
		GameObject.Destroy(arg_5_0.poolRoot)

		arg_5_0.poolRoot = nil
	end
end

return var_0_0
