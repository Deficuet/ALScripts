local var_0_0 = {}

SplitPackConst = var_0_0

function var_0_0.DownloadByLuaArr(arg_1_0, arg_1_1)
	local var_1_0 = AssetBundleHelper.GetTotalRefList(arg_1_0)

	if var_1_0 and #var_1_0 > 0 then
		local var_1_1 = {}

		var_1_1.isShowBox = false
		var_1_1.fileList = var_1_0
		var_1_1.finishFunc = arg_1_1

		function var_1_1.onNo()
			return
		end

		function var_1_1.onClose()
			return
		end

		DownloadConst.Download(var_1_1)
	elseif arg_1_1 then
		arg_1_1()
	end
end

function var_0_0.StartMainDownload()
	local var_4_0 = {
		GroupMainHelper.DefaultGroupName
	}

	local function var_4_1(arg_5_0, arg_5_1, arg_5_2)
		return
	end

	local function var_4_2(arg_6_0, arg_6_1)
		return
	end

	local function var_4_3(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5)
		local var_7_0 = string.format("成功: %d, 失败: %d, 总文件数: %d, 下载速度: %s", arg_7_0, arg_7_1, arg_7_2, arg_7_5)

		print(var_7_0)
	end

	local var_4_4 = BundleWizardUpdater.Inst:GetFileList(var_4_0)
	local var_4_5 = BundleWizardUpdater.Inst:CreateListInfo(GroupMainHelper.DefaultGroupName, var_4_4, var_4_1, var_4_2, var_4_3)

	BundleWizardUpdater.Inst:StartUpdate(var_4_5)
end

return var_0_0
