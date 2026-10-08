local var_0_0 = {}

SplitPackConst = var_0_0

function var_0_0.DownloadByLuaArr(arg_1_0, arg_1_1, arg_1_2)
	arg_1_2 = arg_1_2 or {}

	local var_1_0 = AssetBundleHelper.GetTotalRefList(arg_1_0) or {}

	if EDITOR_TOOL then
		local var_1_1 = {}

		for iter_1_0, iter_1_1 in ipairs(var_1_0) do
			if not checkABExist(iter_1_1) then
				table.insert(var_1_1, iter_1_1)
			end
		end

		if #var_1_1 > 0 then
			warning(string.format("Split pack resource missing: %s", table.concat(var_1_1, ", ")))
		end

		local var_1_2 = #var_1_0
		local var_1_3 = System.Array.CreateInstance(typeof(System.String), var_1_2)

		for iter_1_2 = 0, var_1_2 - 1 do
			var_1_3[iter_1_2] = var_1_0[iter_1_2 + 1]
		end

		ReflectionHelp.RefCallMethod(typeof(ResourceMgr), "UpdateMarkedShortPathList", ResourceMgr.Inst, {
			typeof("System.String[]")
		}, {
			var_1_3
		})
		existCall(arg_1_1)
	elseif #var_1_0 > 0 then
		local var_1_4 = {}

		var_1_4.isShowBox = false
		var_1_4.fileList = var_1_0
		var_1_4.finishFunc = arg_1_1
		var_1_4.showMask = arg_1_2.showMask == true

		function var_1_4.onNo()
			return
		end

		function var_1_4.onClose()
			return
		end

		DownloadConst.Download(var_1_4)
	else
		existCall(arg_1_1)
	end
end

return var_0_0
