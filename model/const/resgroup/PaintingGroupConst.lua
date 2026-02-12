local var_0_0 = {}

var_0_0.PaintingGroupName = "PAINTING"
var_0_0.PaintingMgr = nil

function var_0_0.GetPaintingMgr()
	if not var_0_0.PaintingMgr then
		var_0_0.PaintingMgr = BundleWizard.Inst:GetGroupMgr(var_0_0.PaintingGroupName)
	end

	return var_0_0.PaintingMgr
end

var_0_0.NotifyPaintingDownloadFinish = "PaintingGroupConst.NotifyPaintingDownloadFinish"

function var_0_0.VerifyPaintingFileName(arg_2_0)
	return GroupHelper.VerifyFile(var_0_0.PaintingGroupName, arg_2_0)
end

function var_0_0.CalcPaintingListSize(arg_3_0)
	local var_3_0 = GroupHelper.CreateArrByLuaFileList(var_0_0.PaintingGroupName, arg_3_0)
	local var_3_1 = GroupHelper.CalcSizeWithFileArr(var_0_0.PaintingGroupName, var_3_0)
	local var_3_2 = HashUtil.BytesToString(var_3_1)

	return var_3_1, var_3_2
end

function var_0_0.IsPaintingNeedCheck()
	if Application.isEditor then
		return false
	end

	if GroupHelper.IsGroupVerLastest(var_0_0.PaintingGroupName) then
		return false
	end

	if not GroupHelper.IsGroupWaitToUpdate(var_0_0.PaintingGroupName) then
		return false
	end

	return true
end

function var_0_0.FiltePaintingRes(arg_5_0)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0) do
		iter_5_1 = string.lower(iter_5_1)

		if string.match(iter_5_1, "^painting/") then
			table.insert(var_5_0, iter_5_1)
		end
	end

	return var_5_0
end

function var_0_0.AddPaintingNameWithFilteMap(arg_6_0, arg_6_1)
	arg_6_1 = string.lower(arg_6_1)

	if not pg.painting_filte_map then
		warning("painting_filte_map not exist")

		return
	end

	if not pg.painting_filte_map[arg_6_1] then
		warning("painting_filte_map not exist key: " .. arg_6_1)

		return
	end

	local var_6_0 = pg.painting_filte_map[arg_6_1].res_list

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		if not table.contains(arg_6_0, iter_6_1) and var_0_0.VerifyPaintingFileName(iter_6_1) then
			table.insert(arg_6_0, iter_6_1)
		end
	end
end

function var_0_0.AddPaintingNameByShipGroupID(arg_7_0, arg_7_1)
	if var_0_0.IsPaintingNeedCheck() then
		local var_7_0 = ShipGroup.getDefaultSkin(arg_7_1).painting

		var_0_0.AddPaintingNameWithFilteMap(arg_7_0, var_7_0)
	end
end

function var_0_0.AddPaintingNameByShipConfigID(arg_8_0, arg_8_1)
	if var_0_0.IsPaintingNeedCheck() then
		local var_8_0 = {
			configId = arg_8_1
		}
		local var_8_1 = Ship.getGroupId(var_8_0)

		var_0_0.AddPaintingNameByShipGroupID(arg_8_0, var_8_1)
	end
end

function var_0_0.AddPaintingNameBySkinID(arg_9_0, arg_9_1)
	if var_0_0.IsPaintingNeedCheck() then
		local var_9_0 = {
			arg_9_1
		}

		if ShipSkin.IsChangeSkin(arg_9_1) then
			local var_9_1 = ShipSkin.GetAllChangeSkinIds(arg_9_1)

			for iter_9_0, iter_9_1 in ipairs(var_9_1) do
				if not table.contains(var_9_0, iter_9_1) then
					table.insert(var_9_0, iter_9_1)
				end
			end
		end

		for iter_9_2, iter_9_3 in ipairs(var_9_0) do
			local var_9_2 = pg.ship_skin_template[iter_9_3].painting

			if #var_9_2 > 0 then
				var_0_0.AddPaintingNameWithFilteMap(arg_9_0, var_9_2)
			end
		end
	end
end

function var_0_0.GetPaintingNameListInLogin()
	local var_10_0 = {}
	local var_10_1 = var_0_0.GetPaintingMgr()
	local var_10_2 = getProxy(ShipSkinProxy)

	if var_10_2 then
		local var_10_3 = var_10_2:GetOwnAndShareSkins()

		for iter_10_0, iter_10_1 in pairs(var_10_3) do
			var_0_0.AddPaintingNameBySkinID(var_10_0, iter_10_1.id)
		end
	end

	local var_10_4 = getProxy(CollectionProxy)

	if var_10_4 then
		local var_10_5 = var_10_4:getGroups()

		for iter_10_2, iter_10_3 in pairs(var_10_5) do
			var_0_0.AddPaintingNameByShipGroupID(var_10_0, iter_10_3.id)
		end
	end

	local var_10_6 = getProxy(BayProxy)

	if var_10_6 then
		local var_10_7 = var_10_6.activityNPCShipIds

		for iter_10_4, iter_10_5 in ipairs(var_10_7) do
			local var_10_8 = var_10_6:getShipById(iter_10_5)

			var_0_0.AddPaintingNameByShipGroupID(var_10_0, var_10_8.groupId)
		end
	end

	return var_10_0
end

function var_0_0.GetPaintingNameListForTec()
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in ipairs(pg.ship_data_blueprint.all) do
		var_0_0.AddPaintingNameByShipGroupID(var_11_0, iter_11_1)
	end

	return var_11_0
end

function var_0_0.GetPaintingNameListForAwardList(arg_12_0)
	local var_12_0 = {}

	for iter_12_0 = 1, #arg_12_0 do
		local var_12_1 = arg_12_0[iter_12_0]
		local var_12_2 = var_12_1.type

		if var_12_2 == DROP_TYPE_SHIP then
			local var_12_3 = var_12_1.id

			var_0_0.AddPaintingNameByShipConfigID(var_12_0, var_12_3)
		elseif var_12_2 == DROP_TYPE_NPC_SHIP then
			local var_12_4 = getProxy(BayProxy):getShipById(var_12_1.id)

			var_0_0.AddPaintingNameByShipConfigID(var_12_0, var_12_4.configId)
		elseif var_12_2 == DROP_TYPE_SKIN then
			local var_12_5 = var_12_1.id

			var_0_0.AddPaintingNameBySkinID(var_12_0, var_12_5)
		end
	end

	return var_12_0
end

function var_0_0.GetPaintingNameListByShipVO(arg_13_0)
	local var_13_0 = {}
	local var_13_1 = getProxy(ShipSkinProxy)
	local var_13_2 = var_13_1:GetAllSkinForShip(arg_13_0)

	for iter_13_0, iter_13_1 in ipairs(var_13_2) do
		var_0_0.AddPaintingNameBySkinID(var_13_0, iter_13_1.id)
	end

	local var_13_3 = var_13_1:GetShareSkinsForShip(arg_13_0)

	for iter_13_2, iter_13_3 in ipairs(var_13_3) do
		var_0_0.AddPaintingNameBySkinID(var_13_0, iter_13_3.id)
	end

	return var_13_0
end

function var_0_0.PaintingDownload(arg_14_0)
	local var_14_0 = {}

	if var_0_0.IsPaintingNeedCheck() then
		local var_14_1 = arg_14_0.isShowBox
		local var_14_2 = pg.FileDownloadMgr.GetInstance():IsNeedRemind()
		local var_14_3 = IsUsingWifi()
		local var_14_4 = var_14_1 and var_14_2
		local var_14_5 = arg_14_0.paintingNameList

		if #var_14_5 > 0 then
			if not var_14_3 and var_14_4 then
				local var_14_6, var_14_7 = var_0_0.CalcPaintingListSize(var_14_5)

				if var_14_6 > 0 then
					table.insert(var_14_0, function(arg_15_0)
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							modal = true,
							locked = true,
							type = MSGBOX_TYPE_FILE_DOWNLOAD,
							content = string.format(i18n("file_down_msgbox", var_14_7)),
							onYes = arg_15_0,
							onNo = arg_14_0.onNo,
							onClose = arg_14_0.onClose
						})
					end)
				end
			end

			table.insert(var_14_0, function(arg_16_0)
				local var_16_0 = {
					groupName = var_0_0.PaintingGroupName,
					fileNameList = var_14_5
				}
				local var_16_1 = {
					dataList = {
						var_16_0
					},
					onFinish = arg_16_0
				}

				pg.FileDownloadMgr.GetInstance():Main(var_16_1)
			end)
			table.insert(var_14_0, function(arg_17_0)
				pg.m02:sendNotification(var_0_0.NotifyPaintingDownloadFinish)
				arg_17_0()
			end)
		end
	end

	seriesAsync(var_14_0, arg_14_0.finishFunc)
end

return var_0_0
