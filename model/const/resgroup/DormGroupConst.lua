local var_0_0 = {}

var_0_0.DormGroupName = "DORM"
var_0_0.DormMgr = nil

function var_0_0.GetDormMgr()
	if not var_0_0.DormMgr then
		var_0_0.DormMgr = BundleWizard.Inst:GetGroupMgr(var_0_0.DormGroupName)
	end

	return var_0_0.DormMgr
end

var_0_0.NotifyDormDownloadStart = "DormGroupConst.NotifyDormDownloadStart"
var_0_0.NotifyDormDownloadProgress = "DormGroupConst.NotifyDormDownloadProgress"
var_0_0.NotifyDormDownloadFinish = "DormGroupConst.NotifyDormDownloadFinish"

function var_0_0.VerifyDormFileName(arg_2_0)
	return GroupHelper.VerifyFile(var_0_0.DormGroupName, arg_2_0)
end

function var_0_0.CalcDormListSize(arg_3_0)
	local var_3_0 = GroupHelper.CreateArrByLuaFileList(var_0_0.DormGroupName, arg_3_0)
	local var_3_1 = GroupHelper.CalcSizeWithFileArr(var_0_0.DormGroupName, var_3_0)
	local var_3_2 = HashUtil.BytesToString(var_3_1)

	return var_3_1, var_3_2
end

function var_0_0.IsDormNeedCheck()
	if Application.isEditor then
		return false
	end

	if GroupHelper.IsGroupVerLastest(var_0_0.DormGroupName) then
		return false
	end

	if not GroupHelper.IsGroupWaitToUpdate(var_0_0.DormGroupName) then
		return false
	end

	return true
end

function var_0_0.DormDownload(arg_5_0)
	local var_5_0 = {}

	if var_0_0.IsDormNeedCheck() then
		local var_5_1 = arg_5_0.isShowBox
		local var_5_2 = pg.FileDownloadMgr.GetInstance():IsNeedRemind()
		local var_5_3 = IsUsingWifi()
		local var_5_4 = var_5_1 and var_5_2
		local var_5_5 = arg_5_0.fileList

		if #var_5_5 > 0 then
			if var_5_4 then
				local var_5_6, var_5_7 = var_0_0.CalcDormListSize(var_5_5)

				if var_5_6 > 0 then
					table.insert(var_5_0, function(arg_6_0)
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							modal = true,
							locked = true,
							hideToggle = true,
							type = MSGBOX_TYPE_FILE_DOWNLOAD,
							content = string.format(i18n("file_down_msgbox", var_5_7)),
							onYes = arg_6_0,
							onNo = arg_5_0.onNo,
							onClose = arg_5_0.onClose
						})
					end)
				end
			end

			table.insert(var_5_0, function(arg_7_0)
				var_0_0.DormDownloadLock = {
					curSize = 0,
					totalSize = 1,
					roomId = arg_5_0.roomId
				}

				local var_7_0 = {
					groupName = var_0_0.DormGroupName,
					fileNameList = var_5_5
				}
				local var_7_1 = {
					dataList = {
						var_7_0
					},
					onFinish = arg_7_0
				}

				var_0_0.ExtraDownload(var_7_1)
			end)
			table.insert(var_5_0, function(arg_8_0, arg_8_1)
				local var_8_0 = var_0_0.DormDownloadLock.roomId

				var_0_0.DormDownloadLock = nil

				pg.m02:sendNotification(var_0_0.NotifyDormDownloadFinish, var_8_0)
				arg_8_0(arg_8_1)
			end)
		end
	end

	seriesAsync(var_5_0, arg_5_0.finishFunc)
end

function var_0_0.ExtraDownload(arg_9_0)
	local var_9_0 = arg_9_0.onFinish
	local var_9_1 = arg_9_0.dataList[1]
	local var_9_2 = var_9_1.groupName
	local var_9_3 = #var_9_1.fileNameList > 0 and GroupHelper.CreateArrByLuaFileList(var_9_2, var_9_1.fileNameList) or nil

	if not var_9_3 or var_9_3.Length == 0 then
		var_9_0()

		return
	end

	local function var_9_4(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
		local var_10_0 = tonumber(tostring(arg_10_3))
		local var_10_1 = tonumber(tostring(arg_10_4))

		if var_0_0.DormDownloadLock.curSize ~= var_10_0 then
			var_0_0.DormDownloadLock.curSize = var_10_0
			var_0_0.DormDownloadLock.totalSize = var_10_1

			pg.m02:sendNotification(var_0_0.NotifyDormDownloadProgress)
		end
	end

	local function var_9_5(arg_11_0, arg_11_1, arg_11_2)
		return
	end

	local function var_9_6(arg_12_0, arg_12_1)
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDownload(var_0_0.DormDownloadLock.roomId, arg_12_0 and 1 or 2))

		if arg_12_0 then
			var_9_0(true)
		else
			local function var_12_0()
				var_0_0.ExtraDownload(arg_9_0)
			end

			local function var_12_1()
				var_9_0()
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				locked = true,
				content = i18n("file_down_mgr_error", "", ""),
				onYes = var_12_0,
				onNo = var_12_1,
				onClose = var_12_1
			})
		end
	end

	pg.m02:sendNotification(var_0_0.NotifyDormDownloadStart)

	local var_9_7 = BundleWizardUpdater.Inst:GetFileList(var_9_1.groupName, var_9_1.fileNameList)
	local var_9_8 = BundleWizardUpdater.Inst:CreateListInfo(var_9_1.groupName, var_9_7, var_9_5, var_9_6, var_9_4)

	BundleWizardUpdater.Inst:StartUpdate(var_9_8)
end

function var_0_0.IsDownloading()
	local var_15_0 = GroupHelper.GetGroupMgrByName(var_0_0.DormGroupName)

	return var_0_0.DormDownloadLock or GroupHelper.GetGroupMgrByName(var_0_0.DormGroupName).state == DownloadState.Updating
end

function var_0_0.GetDownloadList()
	local var_16_0 = {}
	local var_16_1 = GroupHelper.GetGroupMgrByName(var_0_0.DormGroupName)

	if var_16_1.toUpdate then
		local var_16_2 = var_16_1.toUpdate.Count

		for iter_16_0 = 0, var_16_2 - 1 do
			local var_16_3 = var_16_1.toUpdate[iter_16_0]
			local var_16_4 = var_16_3[0]
			local var_16_5 = var_16_3[1]
			local var_16_6 = var_16_3[2]

			table.insert(var_16_0, var_16_4)
		end
	end

	return var_16_0
end

local var_0_1 = {
	room = "dorm3d/scenesres/scenes/",
	apartment = "dorm3d/character/"
}
local var_0_2

function var_0_0.GetDownloadResourceDic()
	if not var_0_2 then
		var_0_2 = {}

		for iter_17_0, iter_17_1 in ipairs(pg.dorm3d_rooms.all) do
			local var_17_0 = pg.dorm3d_rooms[iter_17_1]

			if var_17_0.is_common == 1 then
				-- block empty
			else
				local var_17_1 = string.lower(var_17_0.resource_name)

				var_0_2[var_17_1] = true
			end
		end
	end

	local var_17_2 = {}

	for iter_17_2, iter_17_3 in ipairs(DormGroupConst.GetDownloadList()) do
		local var_17_3 = "common"

		for iter_17_4, iter_17_5 in pairs(var_0_1) do
			local var_17_4, var_17_5 = string.find(iter_17_3, iter_17_5)

			if var_17_5 then
				local var_17_6 = string.split(string.sub(iter_17_3, var_17_5 + 1), "/")[1]

				if var_0_2[var_17_6] then
					var_17_3 = iter_17_4 .. "_" .. var_17_6
				end

				break
			end
		end

		var_17_2[var_17_3] = var_17_2[var_17_3] or {}

		table.insert(var_17_2[var_17_3], iter_17_3)
	end

	return var_17_2
end

function var_0_0.GetFilePathList(arg_18_0)
	local var_18_0 = Application.persistentDataPath .. "/AssetBundles/"
	local var_18_1 = var_18_0 .. arg_18_0

	if not var_18_0:match("/$") then
		var_18_0 = var_18_0 .. "/"
	end

	originalPrint("fullCacheDirPath", tostring(var_18_0))
	originalPrint("shortDirPath:", tostring(arg_18_0))
	originalPrint("fullDirPath", tostring(var_18_1))

	local var_18_2 = {}
	local var_18_3 = System.IO.Directory
	local var_18_4 = ReflectionHelp.RefGetField(typeof("System.IO.SearchOption"), "AllDirectories", nil)

	originalPrint("fullDirPath Exist:", tostring(var_18_3.Exists(var_18_1)))

	if var_18_3.Exists(var_18_1) then
		local var_18_5 = var_18_3.GetFiles(var_18_1, "*", var_18_4):ToTable()

		for iter_18_0, iter_18_1 in ipairs(var_18_5) do
			iter_18_1 = iter_18_1:gsub("\\", "/")

			local var_18_6 = string.sub(iter_18_1, #var_18_0 + 1)

			table.insert(var_18_2, var_18_6)
		end
	end

	originalPrint("filePathList first:", tostring(var_18_2[1]))
	originalPrint("filePathList last:", tostring(var_18_2[#var_18_2]))

	return var_18_2
end

function var_0_0.DelDir(arg_19_0)
	local var_19_0 = var_0_0.GetFilePathList(arg_19_0)
	local var_19_1 = #var_19_0

	if var_19_1 > 0 then
		local var_19_2 = System.Array.CreateInstance(typeof(System.String), var_19_1)

		for iter_19_0 = 0, var_19_1 - 1 do
			var_19_2[iter_19_0] = var_19_0[iter_19_0 + 1]
		end

		HotfixHelper.DeleteFileByShortPathArr(var_0_0.DormGroupName, var_19_2)
	end
end

function var_0_0.GetDelRoomSize(arg_20_0, arg_20_1)
	local var_20_0 = 0

	for iter_20_0, iter_20_1 in ipairs(arg_20_1) do
		local var_20_1 = var_0_1[iter_20_1] .. arg_20_0
		local var_20_2 = var_0_0.GetFilePathList(var_20_1)

		var_20_0 = var_20_0 + var_0_0.GetDormMgr():GetCacheFileSize(var_20_2)
	end

	return HashUtil.BytesToString(var_20_0)
end

function var_0_0.DelRoom(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in ipairs(arg_21_1) do
		var_0_0.DelDir(var_0_1[iter_21_1] .. arg_21_0)
	end
end

return var_0_0
