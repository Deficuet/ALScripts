pg = pg or {}
pg.Live2DMgr = singletonClass("Live2DMgr")

local var_0_0 = pg.Live2DMgr

function var_0_0.Ctor(arg_1_0)
	arg_1_0.loadingDic = {}
	arg_1_0.nameList = {}
end

function var_0_0.preloadL2dModelAsync(arg_2_0, arg_2_1, arg_2_2)
	table.insert(arg_2_0.nameList, arg_2_1)

	local var_2_0 = #arg_2_0.nameList

	arg_2_0.loadingDic[arg_2_1] = var_2_0

	PoolMgr.GetInstance():GetLive2D(arg_2_1, true, function(arg_3_0)
		arg_2_0.loadingDic[arg_2_1] = nil

		PoolMgr.GetInstance():ReturnLive2D(arg_2_1, arg_3_0)
		existCall(arg_2_2, {})
	end)
end

function var_0_0.GetLive2DModelAsync(arg_4_0, arg_4_1, arg_4_2)
	table.insert(arg_4_0.nameList, arg_4_1)

	local var_4_0 = #arg_4_0.nameList

	arg_4_0.loadingDic[arg_4_1] = var_4_0

	PoolMgr.GetInstance():GetLive2D(arg_4_1, true, function(arg_5_0)
		if arg_4_0.loadingDic[arg_4_1] ~= var_4_0 then
			warning("l2d loaded dispose return  " .. arg_4_1)
			PoolMgr.GetInstance():ReturnLive2D(arg_4_1, arg_5_0)
		end

		arg_4_0.loadingDic[arg_4_1] = nil

		existCall(arg_4_2, arg_5_0)
	end)
end

function var_0_0.ReturnLive2DModel(arg_6_0, arg_6_1, arg_6_2)
	PoolMgr.GetInstance():ReturnLive2D(arg_6_1, arg_6_2)
end

function var_0_0.StopLoadingLive2d(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.nameList[arg_7_1]

	if arg_7_0.loadingDic[var_7_0] == arg_7_1 then
		arg_7_0.loadingDic[var_7_0] = nil
	end
end
