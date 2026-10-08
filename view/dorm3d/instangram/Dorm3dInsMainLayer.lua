local var_0_0 = class("Dorm3dInsMainLayer", import("...base.BaseUI"))

var_0_0.OPEN_INS = "Dorm3dInsMainLayer.OPEN_INS"
var_0_0.OPEN_CHAT = "Dorm3dInsMainLayer.OPEN_CHAT"
var_0_0.OPEN_PHONE = "Dorm3dInsMainLayer.OPEN_PHONE"
var_0_0.DOWNLOAD_ROOM = "Dorm3dInsMainLayer.DOWNLOAD_ROOM"
var_0_0.DELETE_ROOM = "Dorm3dInsMainLayer.DELETE_ROOM"
var_0_0.FLUSH_LEFT = "Dorm3dInsMainLayer.FLUSH_LEFT"

local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = "PAGE_INS"
local var_0_4 = "PAGE_CHAT"
local var_0_5 = "PAGE_PHONE"
local var_0_6 = "PAGE_MAIN"
local var_0_7 = 2
local var_0_8 = 1

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dInsMainUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {}

	local function var_2_1(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	for iter_2_0, iter_2_1 in ipairs(getProxy(Dorm3dInsProxy):GetRoomList() or {}) do
		var_2_1(iter_2_1:GetIcon())
		var_2_1(iter_2_1:GetCard())
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.init(arg_4_0)
	arg_4_0.bg = arg_4_0._tf:Find("bg")
	arg_4_0.mainTf = arg_4_0._tf:Find("main")
	arg_4_0.mainPages = {
		[var_0_8] = Dorm3dInsPublicPage.New(arg_4_0._tf:Find("main/public_page"), arg_4_0.event),
		[var_0_7] = Dorm3dInsCharPage.New(arg_4_0._tf:Find("main/char_page"), arg_4_0.event)
	}
	arg_4_0.roomListContainer = arg_4_0._tf:Find("left/scroll/mask/list")
	arg_4_0.roomItemList = UIItemList.New(arg_4_0.roomListContainer, arg_4_0.roomListContainer:Find("tpl"))

	arg_4_0.roomItemList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateRoomList(arg_5_1, arg_5_2)
		end
	end)

	arg_4_0.expandPanel = arg_4_0._tf:Find("expand_panel")
	arg_4_0.expandListContainer = arg_4_0._tf:Find("expand_panel/scroll/mask/list")
	arg_4_0.expandItemList = UIItemList.New(arg_4_0.expandListContainer, arg_4_0.expandListContainer:Find("tpl"))

	arg_4_0.expandItemList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateRoomList(arg_6_1, arg_6_2)
		end
	end)

	arg_4_0.selectPanel = arg_4_0._tf:Find("select_panel")
	arg_4_0.selectListContainer = arg_4_0._tf:Find("select_panel/list")
	arg_4_0.selectItemList = UIItemList.New(arg_4_0.selectListContainer, arg_4_0.selectListContainer:Find("tpl"))

	arg_4_0.selectItemList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventInit then
			arg_4_0:InitSelectItem(arg_7_1, arg_7_2)
		end
	end)

	arg_4_0.selectOpen = false
	arg_4_0.downloadTf = arg_4_0._tf:Find("main/download")
	arg_4_0.download = arg_4_0.downloadTf:Find("btns/download")
	arg_4_0.downloading = arg_4_0.downloadTf:Find("btns/downloading")
	arg_4_0.delete = arg_4_0.downloadTf:Find("btns/delete")
	arg_4_0.downloadProgress = arg_4_0.downloadTf:Find("progress")
	arg_4_0.slider = arg_4_0.downloadProgress:Find("slider")

	arg_4_0:BlurPanel(arg_4_0._tf)
	arg_4_0:InitData()
end

function var_0_0.InitData(arg_8_0)
	arg_8_0.roomDataDic = {}
	arg_8_0.roomDataList = Clone(getProxy(Dorm3dInsProxy):GetRoomList())

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.roomDataList) do
		arg_8_0.roomDataDic[iter_8_1.id] = iter_8_1
	end

	arg_8_0.selectOptions = {}

	arg_8_0:BuildSelectOptions()
	arg_8_0:FilterRoomList(var_0_1)
	arg_8_0:SortRoomList()
end

function var_0_0.BuildSelectOptions(arg_9_0)
	table.insert(arg_9_0.selectOptions, {
		mode = var_0_1,
		label = i18n("dorm3d_privatechat_screen_all")
	})

	for iter_9_0, iter_9_1 in pairs(pg.dorm3d_rooms.get_id_list_by_in_map) do
		table.insert(arg_9_0.selectOptions, {
			mode = var_0_2,
			arg = iter_9_0,
			label = i18n("dorm3d_privatechat_screen_" .. iter_9_0)
		})
	end
end

function var_0_0.FilterRoomList(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.roomIdList = _.map(_.select(arg_10_0.roomDataList, function(arg_11_0)
		return switch(arg_10_1, {
			[var_0_1] = function()
				return true
			end,
			[var_0_2] = function()
				return arg_11_0:GetInMap() == arg_10_2
			end
		})
	end), function(arg_14_0)
		return arg_14_0.id
	end)
end

function var_0_0.SortRoomList(arg_15_0)
	table.sort(arg_15_0.roomIdList, function(arg_16_0, arg_16_1)
		local var_16_0 = arg_15_0.roomDataDic[arg_16_0]:IsCare() and 1 or 0
		local var_16_1 = arg_15_0.roomDataDic[arg_16_1]:IsCare() and 1 or 0

		if var_16_0 ~= var_16_1 then
			return var_16_1 < var_16_0
		end

		local var_16_2 = arg_15_0.roomDataDic[arg_16_0]:GetType()
		local var_16_3 = arg_15_0.roomDataDic[arg_16_1]:GetType()

		if var_16_2 ~= var_16_3 then
			return var_16_3 < var_16_2
		end

		return arg_16_0 < arg_16_1
	end)
end

function var_0_0.ClosePrePage(arg_17_0)
	switch(arg_17_0.curPage, {
		[var_0_3] = function()
			arg_17_0:emit(Dorm3dInsMainMediator.CLOSE_JUUS)
		end,
		[var_0_4] = function()
			arg_17_0:emit(Dorm3dInsMainMediator.CLOSE_CHAT)
		end,
		[var_0_5] = function()
			arg_17_0:emit(Dorm3dInsMainMediator.CLOSE_PHONE)
		end,
		[var_0_6] = function()
			setActive(arg_17_0.mainTf, false)
		end
	})

	arg_17_0.curPage = nil
end

function var_0_0.didEnter(arg_22_0)
	onButton(arg_22_0, arg_22_0.bg, function()
		if arg_22_0.curPage then
			arg_22_0:ClosePrePage()
		end

		arg_22_0:closeView()
	end, SFX_PANEL)
	onButton(arg_22_0, arg_22_0._tf:Find("left/btn_select"), function()
		arg_22_0:OpenOrCloseSelectPanel()
	end)
	onButton(arg_22_0, arg_22_0.selectPanel:Find("back"), function()
		arg_22_0:OpenOrCloseSelectPanel()
	end)
	onButton(arg_22_0, arg_22_0._tf:Find("left/btn_expand"), function()
		setActive(arg_22_0.expandPanel, true)
		arg_22_0.expandPanel:SetAsLastSibling()
	end)
	onButton(arg_22_0, arg_22_0.expandPanel:Find("btn_close"), function()
		setActive(arg_22_0.expandPanel, false)
	end)
	onButton(arg_22_0, arg_22_0.downloadTf, function()
		arg_22_0:OnClickDownload(arg_22_0.selectedId)
	end)

	local function var_22_0(arg_29_0)
		if not arg_22_0.roomDataDic[arg_22_0.selectedId]:IsDownloaded() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_privatechat_room_unlock"))
		else
			existCall(arg_29_0)
		end
	end

	arg_22_0:bind(var_0_0.OPEN_INS, function(arg_30_0)
		var_22_0(function()
			arg_22_0:ClosePrePage()

			arg_22_0.curPage = var_0_3

			arg_22_0:emit(Dorm3dInsMainMediator.OPEN_JUUS, arg_22_0.roomDataDic[arg_22_0.selectedId].groupId)
		end)
	end)
	arg_22_0:bind(var_0_0.OPEN_CHAT, function(arg_32_0)
		var_22_0(function()
			arg_22_0:ClosePrePage()

			arg_22_0.curPage = var_0_4

			arg_22_0:emit(Dorm3dInsMainMediator.OPEN_CHAT, arg_22_0.roomDataDic[arg_22_0.selectedId].groupId)
		end)
	end)
	arg_22_0:bind(var_0_0.OPEN_PHONE, function(arg_34_0)
		var_22_0(function()
			if DORM_LOCK_INS_PHONE then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_privatechat_telephone"))

				return
			end

			arg_22_0:ClosePrePage()

			arg_22_0.curPage = var_0_5

			arg_22_0:emit(Dorm3dInsMainMediator.OPEN_PHONE, arg_22_0.roomDataDic[arg_22_0.selectedId].groupId)
		end)
	end)
	arg_22_0:bind(var_0_0.FLUSH_LEFT, function(arg_36_0)
		arg_22_0:SortRoomList()
		arg_22_0.roomItemList:align(#arg_22_0.roomIdList)
	end)

	arg_22_0.selectedId = arg_22_0.roomIdList[1]

	arg_22_0.selectItemList:align(#arg_22_0.selectOptions)

	arg_22_0.curPage = var_0_6

	arg_22_0:Flush()

	if arg_22_0.contextData.isPhone then
		-- block empty
	end
end

function var_0_0.UpdateRoomList(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_0.roomDataDic[arg_37_0.roomIdList[arg_37_1 + 1]]

	setActive(arg_37_2:Find("selected"), var_37_0.id == arg_37_0.selectedId)
	setActive(arg_37_2:Find("like"), var_37_0:IsCare())
	GetImageSpriteFromAtlasAsync(var_37_0:GetIcon(), "", arg_37_2:Find("mask/icon"), true)
	setActive(arg_37_2:Find("tip"), var_37_0:ShouldTip())
	onButton(arg_37_0, arg_37_2, function()
		arg_37_0.selectedId = var_37_0.id

		if arg_37_0.curPage ~= var_0_6 then
			arg_37_0:OpenMain()
		end

		arg_37_0:Flush()
	end)
end

function var_0_0.OpenMain(arg_39_0)
	arg_39_0:ClosePrePage()
	setActive(arg_39_0.mainTf, true)
	arg_39_0:Flush()

	arg_39_0.curPage = var_0_6
end

function var_0_0.Flush(arg_40_0)
	local function var_40_0(arg_41_0)
		return #arg_40_0.mainPages - arg_41_0 + 1
	end

	local var_40_1 = arg_40_0.roomDataDic[arg_40_0.selectedId]:GetType()
	local var_40_2 = var_40_0(var_40_1)

	arg_40_0.mainPages[var_40_2]:Hide()
	arg_40_0.mainPages[var_40_1]:Show()
	arg_40_0.mainPages[var_40_1]:Flush(arg_40_0.roomDataDic[arg_40_0.selectedId])
	arg_40_0.roomItemList:align(#arg_40_0.roomIdList)
	arg_40_0.expandItemList:align(#arg_40_0.roomIdList)
	arg_40_0:FlushDownload()
end

function var_0_0.FlushLeft(arg_42_0)
	arg_42_0.roomItemList:align(#arg_42_0.roomIdList)
end

function var_0_0.InitSelectItem(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_0.selectOptions[arg_43_1 + 1]

	setText(arg_43_2:Find("label"), var_43_0.label)
	onButton(arg_43_0, arg_43_2, function()
		arg_43_0:FilterRoomList(var_43_0.mode, var_43_0.arg)
		arg_43_0:SortRoomList()
		arg_43_0.roomItemList:align(#arg_43_0.roomIdList)
		arg_43_0.expandItemList:align(#arg_43_0.roomIdList)
	end)
end

function var_0_0.OpenOrCloseSelectPanel(arg_45_0)
	arg_45_0.selectOpen = not arg_45_0.selectOpen

	setActive(arg_45_0.selectPanel, arg_45_0.selectOpen)

	if arg_45_0.selectOpen then
		arg_45_0.selectPanel:SetAsLastSibling()
	end
end

local var_0_9 = 1
local var_0_10 = 2
local var_0_11 = 3

function var_0_0.CheckCurrentDownloadState(arg_46_0, arg_46_1)
	if DormGroupConst.DormDownloadLock and DormGroupConst.DormDownloadLock.roomId == arg_46_1 then
		return var_0_11
	end

	return arg_46_0.roomDataDic[arg_46_1]:IsDownloaded() and var_0_10 or var_0_9
end

function var_0_0.FlushDownload(arg_47_0, arg_47_1)
	arg_47_1 = arg_47_1 or arg_47_0:CheckCurrentDownloadState(arg_47_0.selectedId)

	setActive(arg_47_0.download, arg_47_1 == var_0_9)
	setActive(arg_47_0.delete, arg_47_1 == var_0_10)
	setActive(arg_47_0.downloading, arg_47_1 == var_0_11)
	arg_47_0:FlushDownloadSlider(arg_47_1)
end

function var_0_0.FlushDownloadSlider(arg_48_0, arg_48_1)
	setActive(arg_48_0.downloadProgress, arg_48_1 == var_0_11)

	if arg_48_1 == var_0_11 then
		local var_48_0 = DormGroupConst.DormDownloadLock

		setSlider(arg_48_0.slider, 0, var_48_0.totalSize, var_48_0.curSize)
	end
end

function var_0_0.DownloadUpdate(arg_49_0, arg_49_1, arg_49_2)
	if arg_49_1 ~= arg_49_0.selectedId then
		return
	end

	switch(arg_49_2, {
		start = function()
			arg_49_0:FlushDownload(var_0_11)
		end,
		loading = function()
			arg_49_0:FlushDownloadSlider(var_0_11)
		end,
		finish = function()
			arg_49_0:FlushDownload(var_0_10)
		end,
		delete = function()
			arg_49_0:FlushDownload(var_0_9)
		end
	})
end

function var_0_0.OnClickDownload(arg_54_0, arg_54_1)
	if not getProxy(ApartmentProxy):getRoom(1) or not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_02") then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip"))

		return
	end

	local var_54_0 = arg_54_0:CheckCurrentDownloadState(arg_54_1)

	switch(var_54_0, {
		[var_0_10] = function()
			arg_54_0:DeleteRoom(arg_54_1)
		end,
		[var_0_9] = function()
			if not getProxy(ApartmentProxy):getRoom(arg_54_1) then
				if arg_54_0.roomDataDic[arg_54_1]:GetType() == 1 then
					arg_54_0:emit(Dorm3dInsMainMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_54_1)
				elseif arg_54_0.roomDataDic[arg_54_1]:GetType() == 2 then
					arg_54_0:emit(Dorm3dInsMainMediator.ON_UNLOCK_DORM_ROOM, arg_54_1)
				end
			else
				arg_54_0:TryDownloadResource({
					roomId = arg_54_1
				})
			end
		end,
		[var_0_11] = function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_now_is_downloading"))
		end
	})
end

function var_0_0.TryDownloadResource(arg_58_0, arg_58_1, arg_58_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_now_is_downloading"))

		return
	end

	local var_58_0 = getProxy(ApartmentProxy):getRoom(arg_58_1.roomId)
	local var_58_1 = var_58_0:getDownloadNameList()

	if #var_58_1 > 0 then
		local var_58_2 = {
			isShowBox = true,
			fileList = var_58_1,
			finishFunc = function(arg_59_0)
				if arg_59_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_resource_download_complete"))
				end
			end,
			roomId = var_58_0.configId
		}

		DormGroupConst.DormDownload(var_58_2)
	else
		existCall(arg_58_2)
	end
end

function var_0_0.DeleteRoom(arg_60_0, arg_60_1)
	arg_60_0:TryDownloadResource({
		roomId = arg_60_1
	}, function()
		local var_61_0 = getProxy(ApartmentProxy):getRoom(arg_60_1)
		local var_61_1 = var_61_0:getConfig("room")

		if var_61_0:isPersonalRoom() then
			var_61_1 = ShipGroup.getDefaultShipNameByGroupID(var_61_0:getPersonalGroupId())
		end

		local var_61_2

		if var_61_0:isPersonalRoom() then
			var_61_2 = DormGroupConst.GetDelRoomSize(string.lower(var_61_0:getConfig("resource_name")), {
				"room",
				"apartment"
			})
		else
			var_61_2 = DormGroupConst.GetDelRoomSize(string.lower(var_61_0:getConfig("resource_name")), {
				"room"
			})
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("dorm3d_role_assets_delete", var_61_1, var_61_2),
			onYes = function()
				if IsUnityEditor then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_open"))

					return
				end

				if var_61_0:isPersonalRoom() then
					DormGroupConst.DelRoom(string.lower(var_61_0:getConfig("resource_name")), {
						"room",
						"apartment"
					})
				else
					DormGroupConst.DelRoom(string.lower(var_61_0:getConfig("resource_name")), {
						"room"
					})
				end

				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_delete_finish"))
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDownload(var_61_0.id, 3))
				arg_60_0:emit(Dorm3dInsMainMediator.NotifyDormDelete, arg_60_1)
			end
		})
	end)
end

return var_0_0
