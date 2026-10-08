local var_0_0 = class("Dorm3dInviteLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dInviteWindow"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1 = arg_2_1 or arg_2_0.contextData or {}

	local function var_2_2(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	local var_2_3 = var_2_1.roomId and pg.dorm3d_rooms[var_2_1.roomId]
	local var_2_4 = {}

	local function var_2_5(arg_4_0)
		if arg_4_0 and not table.contains(var_2_4, arg_4_0) then
			table.insert(var_2_4, arg_4_0)
		end
	end

	if var_2_3 then
		if noEmptyStr(var_2_3.assets_prefix) then
			var_2_2("dorm3dselect/room_invite_" .. var_2_3.assets_prefix)
		end

		for iter_2_0, iter_2_1 in ipairs(var_2_3.character or {}) do
			var_2_5(iter_2_1)
		end

		for iter_2_2, iter_2_3 in ipairs(var_2_3.character_pay or {}) do
			var_2_5(iter_2_3)
		end
	end

	for iter_2_4, iter_2_5 in ipairs(var_2_1.groupIds or {}) do
		var_2_5(iter_2_5)
	end

	for iter_2_6, iter_2_7 in ipairs(var_2_4) do
		local var_2_6 = pg.dorm3d_resource.get_id_list_by_ship_group[iter_2_7]
		local var_2_7 = var_2_6 and var_2_6[1]
		local var_2_8 = var_2_7 and pg.dorm3d_resource[var_2_7]

		var_2_2(var_2_8 and var_2_8.head_Icon)

		if var_2_3 then
			local var_2_9 = Apartment.New({
				ship_group = iter_2_7
			}):GetSkinModelID(var_2_3.tag)

			if var_2_9 then
				var_2_2(string.format("dorm3dselect/room_card_apartment_%d", var_2_9))
			end

			var_2_2(string.format("dorm3dselect/room_card_apartment_name_%d", iter_2_7))
		end
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.init(arg_5_0)
	arg_5_0.rtInvitePanel = arg_5_0._tf:Find("invite_panel")

	setText(arg_5_0.rtInvitePanel:Find("window/Text"), i18n("dorm3d_invite_beach_tip"))
	setText(arg_5_0.rtInvitePanel:Find("window/btn_confirm/Text"), i18n("text_confirm"))
	onButton(arg_5_0, arg_5_0.rtInvitePanel:Find("bg"), function()
		arg_5_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.rtInvitePanel:Find("window/btn_close"), function()
		arg_5_0:closeView()
	end, SFX_CANCEL)

	arg_5_0.rtSelectPanel = arg_5_0._tf:Find("select_panel")

	setText(arg_5_0.rtSelectPanel:Find("window/character/title"), i18n("dorm3d_select_tip"))
	onButton(arg_5_0, arg_5_0.rtSelectPanel:Find("bg"), function()
		arg_5_0:HideSelectPanel()
		arg_5_0:ShowInvitePanel()
	end, SFX_CANCEL)
	setText(arg_5_0.rtSelectPanel:Find("window/title/Text"), i18n("dorm3d_data_choose"))
	setText(arg_5_0.rtSelectPanel:Find("window/bottom/container/btn_confirm/Text"), i18n("text_confirm"))

	arg_5_0.selectCountTip = i18n("dorm3d_select_tip")
end

function var_0_0.ShowInvitePanel(arg_9_0)
	GetImageSpriteFromAtlasAsync("dorm3dselect/room_invite_" .. arg_9_0.room:getConfig("assets_prefix"), "", arg_9_0.rtInvitePanel:Find("window/Image"))
	setText(arg_9_0.rtInvitePanel:Find("window/Text"), i18n("dorm3d_data_go", arg_9_0.room:getRoomName()))

	local var_9_0, var_9_1 = arg_9_0.room:getInteractRange()
	local var_9_2 = arg_9_0.rtInvitePanel:Find("window/container")

	UIItemList.StaticAlign(var_9_2, var_9_2:GetChild(0), var_9_1, function(arg_10_0, arg_10_1, arg_10_2)
		arg_10_1 = arg_10_1 + 1

		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_9_0.selectIds[arg_10_1]

			setActive(arg_10_2:Find("empty"), not var_10_0)
			setActive(arg_10_2:Find("ship"), var_10_0)

			if var_10_0 then
				local var_10_1 = pg.dorm3d_resource.get_id_list_by_ship_group[var_10_0][1]

				GetImageSpriteFromAtlasAsync(pg.dorm3d_resource[var_10_1].head_Icon, "", arg_10_2:Find("ship"), true)
			end

			onButton(arg_9_0, arg_10_2, function()
				arg_9_0:HideInvitePanel()
				arg_9_0:ShowSelectPanel()
			end, SFX_PANEL)

			if arg_10_1 == var_9_1 or not var_10_0 then
				local var_10_2 = getProxy(PlayerProxy):getRawData().id

				setActive(arg_10_2:Find("tip"), PlayerPrefs.GetInt(var_10_2 .. "_dorm3dRoomInviteSuccess_" .. arg_9_0.room.id, 1) == 0)
			end
		end
	end)
	onButton(arg_9_0, arg_9_0.rtInvitePanel:Find("window/btn_confirm"), function()
		if #arg_9_0.selectIds < var_9_0 or #arg_9_0.selectIds > var_9_1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_data_Invite_lack"))

			return
		end

		local var_12_0 = {}

		if #arg_9_0.selectIds >= 3 and not ApartmentProxy.CheckDeviceRAMEnough() then
			table.insert(var_12_0, function(arg_13_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("drom3d_beach_memory_limit_tip"),
					onYes = arg_13_0
				})
			end)
		end

		table.insert(var_12_0, function(arg_14_0)
			getProxy(ApartmentProxy):SetRoomInviteList(arg_9_0.room.id, arg_9_0.selectIds)
			arg_14_0()
		end)
		seriesAsync(var_12_0, function()
			arg_9_0:emit(Dorm3dInviteMediator.ON_DORM, {
				roomId = arg_9_0.room.id,
				groupIds = underscore.to_array(arg_9_0.selectIds)
			})
		end)
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():OverlayPanel(arg_9_0.rtInvitePanel, {
		force = true
	})
	setActive(arg_9_0.rtInvitePanel, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_sidebar")
end

function var_0_0.HideInvitePanel(arg_16_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_16_0.rtInvitePanel, arg_16_0._tf)
	setActive(arg_16_0.rtInvitePanel, false)
end

function var_0_0.ShowSelectPanel(arg_17_0)
	local var_17_0 = arg_17_0.room:getInviteList()
	local var_17_1, var_17_2 = arg_17_0.room:getInteractRange()
	local var_17_3 = {}
	local var_17_4 = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		if not arg_17_0.room.unlockCharacter[iter_17_1] then
			var_17_4[iter_17_1] = "lock"
		elseif not getProxy(ApartmentProxy):getApartment(iter_17_1) then
			var_17_4[iter_17_1] = "room"
		elseif Apartment.New({
			ship_group = iter_17_1
		}):needDownload() then
			var_17_4[iter_17_1] = "download"
		else
			var_17_4[iter_17_1] = nil
		end
	end

	local var_17_5 = getProxy(PlayerProxy):getRawData().id
	local var_17_6 = arg_17_0.rtSelectPanel:Find("window/character/container")

	UIItemList.StaticAlign(var_17_6, var_17_6:GetChild(0), #var_17_0, function(arg_18_0, arg_18_1, arg_18_2)
		arg_18_1 = arg_18_1 + 1

		if arg_18_0 == UIItemList.EventUpdate then
			local var_18_0 = var_17_0[arg_18_1]

			setActive(arg_18_2:Find("base"), var_18_0)
			setActive(arg_18_2:Find("empty"), not var_18_0)

			if not var_18_0 then
				arg_18_2.name = "null"

				setText(arg_18_2:Find("empty/Text"), i18n("dorm3d_waiting"))
			else
				arg_18_2.name = tostring(var_18_0)

				arg_17_0:UpdateSelectableCard(arg_18_2:Find("base"), var_18_0, function(arg_19_0)
					table.removebyvalue(var_17_3, var_18_0, true)

					if arg_19_0 then
						table.insert(var_17_3, var_18_0)
					end

					setText(arg_17_0.rtSelectPanel:Find("window/bottom/title/Text"), arg_17_0.selectCountTip .. #var_17_3 .. "/" .. var_17_2)
				end)
				triggerToggle(arg_18_2:Find("base"), table.contains(arg_17_0.selectIds, var_18_0))
				setActive(arg_18_2:Find("base/mask"), var_17_4[var_18_0])
				onButton(arg_17_0, arg_18_2:Find("base/mask"), function()
					if var_17_4[var_18_0] == "lock" then
						arg_17_0:HideSelectPanel()
						arg_17_0:emit(Dorm3dInviteMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_17_0.room:GetConfigID(), var_18_0)
					elseif var_17_4[var_18_0] == "room" then
						pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_role_locked"))
					elseif var_17_4[var_18_0] == "download" then
						pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_beach_tip"))
					end
				end, SFX_PANEL)
				eachChild(arg_18_2:Find("base/operation"), function(arg_21_0)
					setActive(arg_21_0, arg_21_0.name == var_17_4[var_18_0])
				end)
			end

			setActive(arg_18_2:Find("tip"), PlayerPrefs.GetInt(var_17_5 .. "_dorm3dRoomInviteSuccess_" .. arg_17_0.room.id .. "_" .. var_18_0, 1) == 0)
			PlayerPrefs.SetInt(var_17_5 .. "_dorm3dRoomInviteSuccess_" .. arg_17_0.room.id .. "_" .. var_18_0, 1)
		end
	end)
	PlayerPrefs.SetInt(var_17_5 .. "_dorm3dRoomInviteSuccess_" .. arg_17_0.room.id, 1)
	onButton(arg_17_0, arg_17_0.rtSelectPanel:Find("window/bottom/container/btn_confirm"), function()
		if #var_17_3 > var_17_2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_data_Invite_lack"))

			return
		end

		arg_17_0.selectIds = var_17_3

		arg_17_0:HideSelectPanel()
		arg_17_0:ShowInvitePanel()
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():OverlayPanel(arg_17_0.rtSelectPanel, {
		force = true,
		pbList = {
			arg_17_0.rtSelectPanel:Find("window")
		}
	})
	setActive(arg_17_0.rtSelectPanel, true)
end

function var_0_0.UpdateSelectableCard(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0 = Apartment.New({
		ship_group = arg_23_2
	}):GetSkinModelID(arg_23_0.room:getConfig("tag"))

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", var_23_0), "", arg_23_1:Find("Image"))
	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", arg_23_2), "", arg_23_1:Find("name"))

	local var_23_1 = getProxy(ApartmentProxy):getApartment(arg_23_2)
	local var_23_2 = not var_23_1 or var_23_1:needDownload()

	setActive(arg_23_1:Find("lock"), var_23_2)
	setActive(arg_23_1:Find("mask"), var_23_2)
	setActive(arg_23_1:Find("unlock"), not var_23_2)
	setActive(arg_23_1:Find("favor_level"), var_23_1)

	if var_23_1 then
		setText(arg_23_1:Find("favor_level/Text"), var_23_1.level)
	end

	onToggle(arg_23_0, arg_23_1, function(arg_24_0)
		arg_23_3(arg_24_0)

		if arg_24_0 then
			if not var_23_1 then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need unlock apartment{%d}", arg_23_2))
				triggerToggle(arg_23_1, false)
			elseif var_23_1:needDownload() then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need download resource{%d}", arg_23_2))
				triggerToggle(arg_23_1, false)
			end
		end
	end, SFX_UI_CLICK)
end

function var_0_0.HideSelectPanel(arg_25_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_25_0.rtSelectPanel, arg_25_0._tf)
	setActive(arg_25_0.rtSelectPanel, false)
end

function var_0_0.UpdateRoom(arg_26_0, arg_26_1)
	arg_26_0.room = arg_26_1
end

function var_0_0.didEnter(arg_27_0)
	arg_27_0.selectIds = underscore.filter(arg_27_0.contextData.groupIds or {}, function(arg_28_0)
		return arg_27_0.room.unlockCharacter[arg_28_0] and tobool(getProxy(ApartmentProxy):getApartment(arg_28_0)) and not Apartment.New({
			ship_group = arg_28_0
		}):needDownload()
	end)
	arg_27_0.contextData.groupIds = nil

	arg_27_0:ShowInvitePanel()
end

function var_0_0.onBackPressed(arg_29_0)
	if isActive(arg_29_0.rtSelectPanel) then
		arg_29_0:HideSelectPanel()
		arg_29_0:ShowInvitePanel()
	else
		arg_29_0:closeView()
	end
end

function var_0_0.willExit(arg_30_0)
	if isActive(arg_30_0.rtSelectPanel) then
		arg_30_0:HideSelectPanel()
	else
		arg_30_0:HideInvitePanel()
	end
end

return var_0_0
