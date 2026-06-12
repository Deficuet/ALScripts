local var_0_0 = class("WSPool", import("...BaseEntity"))

var_0_0.Fields = {
	tplDic = "table",
	pooltf = "userdata",
	pools = "table"
}

function var_0_0.Setup(arg_1_0, arg_1_1)
	arg_1_0.pools = {}
	arg_1_0.pooltf = GameObject.Find("__Pool__").transform

	local var_1_0 = GetComponent(arg_1_1, "ItemList").prefabItem:ToTable()

	arg_1_0.tplDic = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		arg_1_0.tplDic[iter_1_1.name] = iter_1_1
	end

	setActive(arg_1_1, false)
end

function var_0_0.Dispose(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(arg_2_0.pools) do
		_.each(iter_2_1, function(arg_3_0)
			Destroy(arg_3_0)
		end)
	end

	for iter_2_2, iter_2_3 in pairs(arg_2_0.tplDic) do
		arg_2_0.tplDic[iter_2_2] = nil
	end

	arg_2_0.tplDic = nil

	arg_2_0:Clear()
end

function var_0_0.Get(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0.pools
	local var_4_1 = var_4_0[arg_4_1]

	if not var_4_1 then
		var_4_1 = {}
		var_4_0[arg_4_1] = var_4_1
	end

	local var_4_2

	if #var_4_1 > 0 then
		var_4_2 = table.remove(var_4_1, #var_4_1)
	else
		var_4_2 = Instantiate(arg_4_0.tplDic[arg_4_1])
	end

	setActive(var_4_2, true)
	tf(var_4_2):SetParent(arg_4_0.pooltf, false)

	return var_4_2
end

function var_0_0.Return(arg_5_0, arg_5_1, arg_5_2)
	setActive(arg_5_2, false)
	arg_5_2.transform:SetParent(arg_5_0.pooltf, false)

	local var_5_0 = arg_5_0.pools[arg_5_1]

	table.insert(var_5_0, arg_5_2)
end

return var_0_0
