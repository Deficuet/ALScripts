pg = pg or {}
pg.Live2DMgr = singletonClass("Live2DMgr")

local var_0_0 = pg.Live2DMgr

function var_0_0.Ctor(arg_1_0)
	arg_1_0.loadingDic = {}
	arg_1_0.nameList = {}
end

function var_0_0.GetLive2DModelAsync(arg_2_0, arg_2_1, arg_2_2)
	table.insert(arg_2_0.nameList, arg_2_1)

	local var_2_0 = #arg_2_0.nameList

	arg_2_0.loadingDic[arg_2_1] = var_2_0

	PoolMgr.GetInstance():GetLive2D(arg_2_1, true, function(arg_3_0)
		if arg_2_0.loadingDic[arg_2_1] ~= var_2_0 then
			PoolMgr.GetInstance():ReturnLive2D(arg_2_1, arg_3_0)
		end

		arg_2_0.loadingDic[arg_2_1] = nil

		existCall(arg_2_2, arg_3_0)
	end)
end

function var_0_0.ReturnLive2DModel(arg_4_0, arg_4_1, arg_4_2)
	PoolMgr.GetInstance():ReturnLive2D(arg_4_1, arg_4_2)
end

function var_0_0.StopLoadingLive2d(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.nameList[arg_5_1]

	if arg_5_0.loadingDic[var_5_0] == arg_5_1 then
		arg_5_0.loadingDic[var_5_0] = nil
	end
end
