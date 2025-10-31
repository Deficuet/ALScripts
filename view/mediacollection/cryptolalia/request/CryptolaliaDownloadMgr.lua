local var_0_0 = class("CryptolaliaDownloadMgr")

var_0_0.PROGRESS_FINISH = -99
var_0_0.PROGRESS_ERROR = -100

function var_0_0.Ctor(arg_1_0)
	arg_1_0.callbacks = {}
	arg_1_0.mgr = pg.CipherGroupMgr.GetInstance()

	local var_1_0 = {
		progressCB = function(arg_2_0, arg_2_1)
			if arg_1_0.callbacks[arg_2_0] then
				arg_1_0.callbacks[arg_2_0](arg_2_0, arg_2_1)
			end
		end,
		allFinishCB = function(arg_3_0, arg_3_1)
			warning("全部完成")
		end,
		singleFinshCB = function(arg_4_0, arg_4_1, arg_4_2)
			if arg_1_0.callbacks[arg_4_0] then
				arg_1_0.callbacks[arg_4_0](arg_4_0, var_0_0.PROGRESS_FINISH)

				arg_1_0.callbacks[arg_4_0] = nil
			end
		end,
		errorCB = function(arg_5_0)
			local var_5_0 = string.format("出错文件:%s", arg_5_0)

			warning(var_5_0)

			if arg_1_0.callbacks[arg_5_0] then
				arg_1_0.callbacks[arg_5_0](arg_5_0, var_0_0.PROGRESS_ERROR)

				arg_1_0.callbacks[arg_5_0] = nil
			end
		end
	}

	arg_1_0.mgr:SetCallBack(var_1_0)
end

function var_0_0.Request(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = string.lower(arg_6_1[#arg_6_1])

	arg_6_0.callbacks[var_6_0] = arg_6_2

	local var_6_1 = GroupHelper.GetGroupMgrByName("CIPHER")
	local var_6_2 = arg_6_0.mgr:IsAnyFileInProgress()
	local var_6_3 = table.concat(arg_6_1, ",")

	if var_6_2 then
		arg_6_0.mgr:AddFileList(arg_6_1)
	else
		arg_6_0.mgr:StartWithFileList(arg_6_1)
	end
end

function var_0_0.ReConnection(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1[#arg_7_1]

	if arg_7_0:IsDownloadState(var_7_0) then
		local var_7_1 = string.lower(var_7_0)

		arg_7_0.callbacks[var_7_1] = arg_7_2
	end
end

function var_0_0.IsDownloadState(arg_8_0, arg_8_1)
	arg_8_1 = string.lower(arg_8_1)

	local var_8_0 = arg_8_0.mgr.downloadList

	for iter_8_0 = arg_8_0.mgr.curIndex, #var_8_0 do
		if var_8_0[iter_8_0] == arg_8_1 then
			return true
		end
	end

	return false
end

function var_0_0.Dispose(arg_9_0)
	arg_9_0.callbacks = {}

	local var_9_0 = {}

	arg_9_0.mgr:SetCallBack(var_9_0)
end

return var_0_0
