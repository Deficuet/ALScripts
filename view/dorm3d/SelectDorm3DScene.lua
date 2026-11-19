local var_0_0 = class("SelectDorm3DScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "SelectDorm3DUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {}

	local function var_2_1(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	for iter_2_0, iter_2_1 in pairs(pg.dorm3d_rooms.get_id_list_by_in_map or {}) do
		for iter_2_2, iter_2_3 in ipairs(iter_2_1) do
			local var_2_2 = pg.dorm3d_rooms[iter_2_3]

			if var_2_2 and var_2_2.assets_prefix then
				var_2_1(string.format("dorm3dselect/room_icon_%s", string.lower(var_2_2.assets_prefix)))
			end
		end
	end

	var_2_1("weaponframes")
	var_2_1("ui/dormstyledropmsgboxui")

	local var_2_3 = getDorm3dGameset("drom3d_weekly_task")[1]
	local var_2_4 = var_2_3 and getProxy(TaskProxy):getTaskVO(var_2_3)
	local var_2_5 = var_2_4 and var_2_4:getConfig("award_display") and var_2_4:getConfig("award_display")[1]

	if var_2_5 then
		local var_2_6 = Drop.Create(var_2_5)

		if var_2_6.type == DROP_TYPE_DORM3D_GIFT then
			local var_2_7 = pg.dorm3d_gift[var_2_6.id]

			var_2_1(var_2_7 and var_2_7.icon)
		else
			var_2_1(var_2_6:getIcon())
		end
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.init(arg_4_0)
	arg_4_0.rtMap = arg_4_0._tf:Find("Map")
	arg_4_0.rtIconTip = arg_4_0.rtMap:Find("tip")

	setActive(arg_4_0.rtIconTip, false)
	onButton(arg_4_0, arg_4_0.rtIconTip:Find("bg"), function()
		arg_4_0:HideIconTipWindow()
	end, SFX_CANCEL)
	setText(arg_4_0.rtIconTip:Find("window/btn_cancel/Text"), i18n("text_cancel"))
	onButton(arg_4_0, arg_4_0.rtIconTip:Find("window/btn_cancel"), function()
		arg_4_0:HideIconTipWindow()
	end, SFX_CANCEL)
	setText(arg_4_0.rtIconTip:Find("window/btn_confirm/Text"), i18n("text_confirm"))

	arg_4_0.rtMain = arg_4_0._tf:Find("Main")

	setText(arg_4_0.rtMain:Find("title/Text"), i18n("dorm3d_role_choose"))
	onButton(arg_4_0, arg_4_0.rtMain:Find("btn_back"), function()
		arg_4_0.clearSceneCache = true

		arg_4_0:closeView()
	end, SFX_CANCEL)

	arg_4_0.insBtn = Dorm3dInsBtn.New(arg_4_0.rtMain:Find("btn_ins"))

	onButton(arg_4_0, arg_4_0.insBtn.root, function()
		arg_4_0:emit(SelectDorm3DMediator.OPEN_INS_LAYER, arg_4_0.insBtn.IsNewPhoneCall())
	end)
	setActive(arg_4_0.rtMain:Find("btn_ins"), not DORM_LOCK_INS)

	local var_4_0 = getProxy(PlayerProxy):getRawData().id

	if not pg.TimeMgr.GetInstance():IsSameWeek(pg.TimeMgr.GetInstance():GetServerTime(), PlayerPrefs.GetInt(var_4_0 .. "_dorm3dGiftWeekRefreshTimeStamp", 0)) then
		ApartmentProxy.RefreshGiftDailyTip()
	end

	setActive(arg_4_0.rtMain:Find("btn_shop/tip"), Dorm3dShopUI.ShouldShowAllTip())
	onButton(arg_4_0, arg_4_0.rtMain:Find("btn_shop"), function()
		arg_4_0:emit(SelectDorm3DMediator.OPEN_SHOP_LAYER, function()
			setActive(arg_4_0.rtMain:Find("btn_shop/tip"), Dorm3dShopUI.ShouldShowAllTip())
		end)
	end)
	onButton(arg_4_0, arg_4_0.rtMain:Find("option/setting"), function()
		arg_4_0:emit(SelectDorm3DMediator.OPEN_SETTING_LAYER)
	end)
	onButton(arg_4_0, arg_4_0.rtMain:Find("option/home"), function()
		arg_4_0:emit(BaseUI.ON_HOME)
	end)

	arg_4_0.rtStamina = arg_4_0.rtMain:Find("stamina")
	arg_4_0.rtRes = arg_4_0.rtMain:Find("res")

	arg_4_0:InitResBar()

	arg_4_0.rtWeekTask = arg_4_0.rtMain:Find("task")

	arg_4_0:UpdateWeekTask()

	arg_4_0.rtLayer = arg_4_0._tf:Find("Layer")
	arg_4_0.floorData = _.keys(pg.dorm3d_rooms.get_id_list_by_in_map)

	table.sort(arg_4_0.floorData, function(arg_13_0, arg_13_1)
		return (tonumber(string.match(arg_13_0, "%d+")) or 0) < (tonumber(string.match(arg_13_1, "%d+")) or 0)
	end)
	arg_4_0:SetMapSwitch()
end

function var_0_0.didEnter(arg_14_0)
	DormGroupConst.WithDownloadResourceSnapshot(function()
		arg_14_0:SetFloor(arg_14_0.floorData[arg_14_0.selectedFloorId])
		arg_14_0:UpdateStamina()
		arg_14_0:CheckGuide("DORM3D_GUIDE_02")
		arg_14_0:FlushInsBtn()

		if not ApartmentProxy.CheckDeviceRAMEnough() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("drom3d_memory_limit_tip"))
		end
	end)
end

function var_0_0.FlushInsBtn(arg_16_0)
	DormGroupConst.WithDownloadResourceSnapshot(function()
		arg_16_0.insBtn:Flush()
	end)
end

function var_0_0.UpdateStamina(arg_18_0)
	setText(arg_18_0.rtStamina:Find("Text"), string.format("%d/%d", getProxy(ApartmentProxy):getStamina()))
	setActive(arg_18_0.rtStamina:Find("vfx_ui_stamina01"), getProxy(ApartmentProxy):getStamina() > 0)
end

function var_0_0.SetFloor(arg_19_0, arg_19_1)
	DormGroupConst.WithDownloadResourceSnapshot(function()
		local var_20_0

		eachChild(arg_19_0.rtMap, function(arg_21_0)
			setActive(arg_21_0, arg_21_0.name == arg_19_1)

			if arg_21_0.name == arg_19_1 then
				var_20_0 = arg_21_0
			end
		end)
		assert(var_20_0)

		arg_19_0.roomDic = {}

		for iter_20_0, iter_20_1 in ipairs(pg.dorm3d_rooms.get_id_list_by_in_map[arg_19_1]) do
			arg_19_0.roomDic[iter_20_1] = var_20_0:Find(pg.dorm3d_rooms[iter_20_1].assets_prefix)

			arg_19_0:InitIconTrigger(iter_20_1)
			arg_19_0:UpdateIconState(iter_20_1)
		end

		arg_19_0:ReplaceSpecialRoomIcon()
	end)
end

function var_0_0.FlushFloor(arg_22_0)
	arg_22_0:SetFloor(arg_22_0.floorData[arg_22_0.selectedFloorId])
end

function var_0_0.InitIconTrigger(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.roomDic[arg_23_1]
	local var_23_1 = pg.dorm3d_rooms[arg_23_1].assets_prefix

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(var_23_1)), "", var_23_0:Find("icon"))
	onButton(arg_23_0, var_23_0, function()
		if BLOCK_DORM3D_ROOMS and table.contains(BLOCK_DORM3D_ROOMS, arg_23_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_system_switch"))

			return
		end

		if arg_23_1 ~= 1 and (not getProxy(ApartmentProxy):getRoom(1) or not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_02")) and not DORM_LOCK_GUIDE then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip"))

			return
		end

		local var_24_0 = getProxy(ApartmentProxy):getRoom(arg_23_1)
		local var_24_1 = pg.dorm3d_rooms[arg_23_1].type

		if var_24_1 == 1 then
			if arg_23_1 ~= 4 and not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_06") and not DORM_LOCK_GUIDE then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip2"))

				return
			end

			if not var_24_0 then
				arg_23_0:emit(SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_23_1)
			else
				arg_23_0:TryDownloadResource({
					click = true,
					roomId = arg_23_1
				}, function()
					local var_25_0 = ApartmentProxy.GetRoomInviteList(arg_23_1)

					if arg_23_0:CheckGuide("DORM3D_GUIDE_06") then
						var_25_0 = {}
					end

					arg_23_0:emit(SelectDorm3DMediator.OPEN_INVITE_LAYER, arg_23_1, var_25_0, function()
						arg_23_0:FlushFloor()
					end)
				end)
			end
		elseif var_24_1 == 2 then
			if not var_24_0 then
				arg_23_0:ShowIconTipWindow(arg_23_1, var_23_0)
			else
				arg_23_0:TryDownloadResource({
					click = true,
					roomId = arg_23_1
				}, function()
					arg_23_0:emit(SelectDorm3DMediator.ON_DORM, {
						roomId = var_24_0.id,
						groupIds = var_24_0:getInviteList()
					})
				end)
			end
		else
			assert(false)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateIconState(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0.roomDic[arg_28_1]
	local var_28_1 = getProxy(ApartmentProxy):getRoom(arg_28_1)
	local var_28_2 = var_28_1 and var_28_1:getState() or "lock"

	setActive(var_28_0:Find("icon/mask"), var_28_2 ~= "complete")
	eachChild(var_28_0:Find("front"), function(arg_29_0)
		setActive(arg_29_0, arg_29_0.name == var_28_2)
	end)
	switch(var_28_2, {
		loading = function()
			local var_30_0 = DormGroupConst.DormDownloadLock

			setSlider(var_28_0:Find("front/loading/progress"), 0, var_30_0.totalSize, var_30_0.curSize)
		end,
		complete = function()
			local var_31_0 = var_28_0:Find("front/complete")
			local var_31_1 = var_28_1:isPersonalRoom()

			setActive(var_31_0, var_31_1)

			if var_31_1 then
				local var_31_2 = getProxy(ApartmentProxy):getApartment(var_28_1:getPersonalGroupId())
				local var_31_3 = var_31_2:getIconTip(var_28_1:GetConfigID())

				eachChild(var_31_0:Find("tip"), function(arg_32_0)
					setActive(arg_32_0, arg_32_0.name == var_31_3)
				end)
				setText(var_31_0:Find("favor/Text"), var_31_2.level)
			end
		end
	})

	local var_28_3 = getProxy(PlayerProxy):getRawData().id

	if arg_28_1 == 4 then
		setActive(var_28_0:Find("inivite_tip"), PlayerPrefs.GetInt(var_28_3 .. "_dorm3dRoomInviteSuccess_" .. arg_28_1, 1) == 0)
	end

	local function var_28_4()
		if not var_28_1 or not var_28_1:isPersonalRoom() then
			return false
		end

		return getProxy(ApartmentProxy):HasShipGroupGiftExpireSoon(var_28_1:getConfig("character")[1])
	end

	setActive(var_28_0:Find("tip"), var_28_4())
end

function var_0_0.UpdateShowIcon(arg_34_0, arg_34_1, arg_34_2)
	removeOnButton(arg_34_2)
	setActive(arg_34_2:Find("icon/mask"), false)
	eachChild(arg_34_2:Find("front"), function(arg_35_0)
		setActive(arg_35_0, false)
	end)
end

function var_0_0.ReplaceSpecialRoomIcon(arg_36_0)
	local var_36_0 = {}

	for iter_36_0, iter_36_1 in pairs(getProxy(ApartmentProxy):getRawData()) do
		for iter_36_2, iter_36_3 in ipairs(iter_36_1:getSpecialTalking()) do
			local var_36_1 = pg.dorm3d_dialogue_group[iter_36_3].trigger_config[1]

			if arg_36_0.roomDic[var_36_1] then
				var_36_0[var_36_1] = var_36_0[var_36_1] or {}

				table.insert(var_36_0[var_36_1], iter_36_3)
			end
		end
	end

	for iter_36_4, iter_36_5 in pairs(var_36_0) do
		setActive(arg_36_0.roomDic[iter_36_4], false)

		local var_36_2 = cloneTplTo(arg_36_0.roomDic[iter_36_4], arg_36_0.roomDic[iter_36_4].parent, arg_36_0.roomDic[iter_36_4].name .. "_special")

		arg_36_0:UpdateShowIcon(iter_36_4, var_36_2)
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(pg.dorm3d_rooms[iter_36_4].assets_prefix)), "", var_36_2:Find("icon"))
		setActive(var_36_2:Find("front/complete"), true)
		setActive(var_36_2:Find("front/complete/favor"), false)
		eachChild(var_36_2:Find("front/complete/tip"), function(arg_37_0)
			setActive(arg_37_0, arg_37_0.name == "main")
		end)
		table.sort(iter_36_5)

		local var_36_3 = iter_36_5[1]
		local var_36_4 = pg.dorm3d_dialogue_group[var_36_3]

		if DORM_LOCK_GUIDE and var_36_3 == 10010 then
			return
		end

		onButton(arg_36_0, var_36_2, function()
			arg_36_0:TryDownloadResource({
				click = true,
				roomId = var_36_4.room_id
			}, function()
				arg_36_0:emit(SelectDorm3DMediator.ON_DORM, {
					roomId = var_36_4.room_id,
					groupIds = {
						var_36_4.char_id
					},
					specialId = var_36_3
				})
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadUpdate(arg_40_0, arg_40_1, arg_40_2)
	switch(arg_40_2, {
		start = function()
			if arg_40_0.roomDic[arg_40_1] then
				arg_40_0:UpdateIconState(arg_40_1)
			end
		end,
		loading = function()
			if arg_40_0.roomDic[arg_40_1] then
				local var_42_0 = DormGroupConst.DormDownloadLock

				setSlider(arg_40_0.roomDic[arg_40_1]:Find("front/loading/progress"), 0, var_42_0.totalSize, var_42_0.curSize)
			end
		end,
		finish = function()
			DormGroupConst.WithDownloadResourceSnapshot(function()
				for iter_44_0, iter_44_1 in pairs(arg_40_0.roomDic) do
					arg_40_0:UpdateIconState(iter_44_0)
				end

				arg_40_0:CheckGuide("DORM3D_GUIDE_02")
			end)
		end,
		delete = function()
			if arg_40_0.roomDic[arg_40_1] then
				arg_40_0:UpdateIconState(arg_40_1)
			end
		end
	})
end

function var_0_0.AfterRoomUnlock(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_1.roomId

	if isActive(arg_46_0.rtIconTip) then
		arg_46_0:HideIconTipWindow()
	end

	eachChild(arg_46_0.roomDic[var_46_0]:Find("icon/mask"), function(arg_47_0)
		setActive(arg_47_0, true)
	end)
	quickPlayAnimation(arg_46_0.roomDic[var_46_0], "anim_Dorm3d_selectDorm_icon_unlock")
	pg.UIMgr.GetInstance():LoadingOn(false)
	LeanTween.delayedCall(1.2333333333333334, System.Action(function()
		pg.UIMgr.GetInstance():LoadingOff(false)
		arg_46_0:UpdateIconState(var_46_0)
		arg_46_0:TryDownloadResource(arg_46_1)
		arg_46_0:CheckGuide("DORM3D_GUIDE_02")
		arg_46_0:SetMapSwitch()
	end))
end

function var_0_0.ShowIconTipWindow(arg_49_0, arg_49_1, arg_49_2)
	setLocalPosition(arg_49_0.rtIconTip:Find("window"), arg_49_0.rtIconTip:InverseTransformPoint(arg_49_2.position))
	removeAllChildren(arg_49_0.rtIconTip:Find("window/icon"))

	arg_49_2 = cloneTplTo(arg_49_2, arg_49_0.rtIconTip:Find("window/icon"))

	arg_49_0:UpdateShowIcon(arg_49_1, arg_49_2)
	setAnchoredPosition(arg_49_2, Vector2.zero)

	local var_49_0 = ApartmentRoom.New({
		id = arg_49_1
	})
	local var_49_1, var_49_2 = var_49_0:getDownloadNeedSize()

	setText(arg_49_0.rtIconTip:Find("window/Text"), i18n("dorm3d_role_assets_download", ShipGroup.getDefaultShipNameByGroupID(var_49_0:getPersonalGroupId()), var_49_0:needDownload() and var_49_2 or "0B"))
	onButton(arg_49_0, arg_49_0.rtIconTip:Find("window/btn_confirm"), function()
		arg_49_0:emit(SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM, arg_49_1)
	end, SFX_CONFIRM)
	setActive(arg_49_0.rtIconTip, true)
end

function var_0_0.HideIconTipWindow(arg_51_0)
	setActive(arg_51_0.rtIconTip, false)
end

function var_0_0.TryDownloadResource(arg_52_0, arg_52_1, arg_52_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_now_is_downloading"))

		return
	end

	local var_52_0 = getProxy(ApartmentProxy):getRoom(arg_52_1.roomId)
	local var_52_1 = var_52_0:getDownloadNameList()

	if #var_52_1 > 0 then
		local var_52_2 = {
			isShowBox = true,
			fileList = var_52_1,
			finishFunc = function(arg_53_0)
				if arg_53_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_resource_download_complete"))
				end
			end,
			roomId = var_52_0.configId
		}

		DormGroupConst.DormDownload(var_52_2)
	else
		existCall(arg_52_2)
	end
end

function var_0_0.InitResBar(arg_54_0)
	arg_54_0.goldMax = arg_54_0.rtRes:Find("gold/max"):GetComponent(typeof(Text))
	arg_54_0.goldValue = arg_54_0.rtRes:Find("gold/Text"):GetComponent(typeof(Text))
	arg_54_0.oilMax = arg_54_0.rtRes:Find("oil/max"):GetComponent(typeof(Text))
	arg_54_0.oilValue = arg_54_0.rtRes:Find("oil/Text"):GetComponent(typeof(Text))
	arg_54_0.gemValue = arg_54_0.rtRes:Find("gem/Text"):GetComponent(typeof(Text))

	onButton(arg_54_0, arg_54_0.rtRes:Find("gold"), function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_54_0, arg_54_0.rtRes:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_54_0, arg_54_0.rtRes:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	arg_54_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_58_0)
	local var_58_0 = getProxy(PlayerProxy):getRawData()

	PlayerResUI.StaticFlush(var_58_0, arg_58_0.goldMax, arg_58_0.goldValue, arg_58_0.oilMax, arg_58_0.oilValue, arg_58_0.gemValue)
end

function var_0_0.UpdateWeekTask(arg_59_0)
	local var_59_0 = getDorm3dGameset("drom3d_weekly_task")[1]
	local var_59_1 = getProxy(TaskProxy):getTaskVO(var_59_0)
	local var_59_2 = var_59_1:isReceive()
	local var_59_3 = var_59_2 and 3 or var_59_1:getProgress()
	local var_59_4 = arg_59_0.rtWeekTask:Find("content")

	for iter_59_0 = 1, 3 do
		triggerToggle(var_59_4:Find("tpl_" .. iter_59_0), iter_59_0 <= var_59_3)
	end

	local var_59_5 = Drop.Create(var_59_1:getConfig("award_display")[1])

	updateCustomDrop(var_59_4:Find("Dorm3dIconTpl"), var_59_5)
	onButton(arg_59_0, var_59_4:Find("Dorm3dIconTpl"), function()
		if not var_59_2 and var_59_1:isFinish() then
			arg_59_0:emit(SelectDorm3DMediator.ON_SUBMIT_TASK, var_59_0)
		else
			arg_59_0:emit(BaseUI.ON_NEW_DROP, {
				drop = var_59_5
			})
		end
	end, SFX_CONFIRM)
	setActive(var_59_4:Find("Dorm3dIconTpl/get"), not var_59_2 and var_59_1:isFinish())
	setGray(var_59_4:Find("Dorm3dIconTpl"), var_59_2)
	onButton(arg_59_0, arg_59_0._tf:Find("Main/task_done"), function()
		setActive(arg_59_0.rtWeekTask, true)
		setActive(arg_59_0._tf:Find("Main/task_done"), false)
	end)
	onButton(arg_59_0, arg_59_0.rtWeekTask:Find("title"), function()
		if var_59_2 then
			setActive(arg_59_0.rtWeekTask, false)
			setActive(arg_59_0._tf:Find("Main/task_done"), true)
		end
	end)
end

function var_0_0.CheckGuide(arg_63_0, arg_63_1)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_63_1) then
		return
	end

	if DORM_LOCK_GUIDE then
		return false
	end

	return switch(arg_63_1, {
		DORM3D_GUIDE_02 = function()
			local var_64_0 = getProxy(ApartmentProxy):getApartment(20220)

			if var_64_0 and not var_64_0:needDownload() then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = arg_63_1
				})
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_63_1)))
				pg.NewGuideMgr.GetInstance():Play(arg_63_1, nil, function()
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_63_1)))
				end)

				return true
			end
		end,
		DORM3D_GUIDE_06 = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_63_1
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_63_1)))
			pg.NewGuideMgr.GetInstance():Play(arg_63_1, nil, function()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_63_1)))
			end)

			return true
		end
	}, function()
		return false
	end)
end

function var_0_0.SetMapSwitch(arg_69_0)
	local var_69_0 = getProxy(PlayerProxy):getRawData().id

	arg_69_0.selectedFloorId = PlayerPrefs.GetInt("DORM_SELECTED_FLOOR_ID" .. var_69_0, 1)

	if pg.NewGuideMgr.GetInstance():GetCurrentGuideName() == "DORM3D_GUIDE_01" then
		arg_69_0.selectedFloorId = 1
	elseif not DORM_LOCK_SELECT_NEW then
		local var_69_1 = pg.dorm3d_set.drom3d_new_room_remind.key_value_int

		if PlayerPrefs.GetInt("DORM_SELECTED_NEW_ROOM_FLOOR" .. var_69_0 .. var_69_1, 0) == 0 then
			arg_69_0.selectedFloorId = table.indexof(arg_69_0.floorData, pg.dorm3d_rooms[var_69_1].in_map)

			PlayerPrefs.SetInt("DORM_SELECTED_NEW_ROOM_FLOOR" .. var_69_0 .. var_69_1, 1)
		end
	end

	local var_69_2 = arg_69_0._tf:Find("interludeAni")
	local var_69_3 = var_69_2:GetComponent(typeof(Animation))
	local var_69_4 = var_69_2:GetComponent(typeof(DftAniEvent))

	onButton(arg_69_0, arg_69_0.rtMain:Find("btn_switch/left"), function()
		var_69_4:SetTriggerEvent(function()
			arg_69_0:ChangeMap(arg_69_0.selectedFloorId - 1)
		end)
		var_69_3:Play("anim_InterludeAni")
	end)
	onButton(arg_69_0, arg_69_0.rtMain:Find("btn_switch/right"), function()
		var_69_4:SetTriggerEvent(function()
			arg_69_0:ChangeMap(arg_69_0.selectedFloorId + 1)
		end)
		var_69_3:Play("anim_InterludeAni")
	end)
	setActive(arg_69_0.rtMain:Find("btn_switch/switchPanel"), false)

	local var_69_5 = arg_69_0.rtMain:Find("btn_switch/switchPanel"):GetComponent(typeof(Animation))

	arg_69_0.rtMain:Find("btn_switch/switchPanel"):GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		setActive(arg_69_0.rtMain:Find("btn_switch/switchPanel"), false)
	end)
	onButton(arg_69_0, arg_69_0.rtMain:Find("btn_switch/switch"), function()
		setActive(arg_69_0.rtMain:Find("btn_switch/switchPanel"), true)
	end)
	onButton(arg_69_0, arg_69_0.rtMain:Find("btn_switch/switchPanel"), function()
		var_69_5:Play("anim_switchPanel_exit")
	end)

	local var_69_6 = UIItemList.New(arg_69_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"), arg_69_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content/floor"))

	var_69_6:make(function(arg_77_0, arg_77_1, arg_77_2)
		if arg_77_0 == UIItemList.EventUpdate then
			local var_77_0 = arg_69_0.floorData[arg_77_1 + 1]
			local var_77_1 = Clone(pg.dorm3d_rooms.get_id_list_by_in_map[var_77_0])

			for iter_77_0 = #var_77_1, 1, -1 do
				if pg.dorm3d_rooms[var_77_1[iter_77_0]].is_common == 1 then
					table.remove(var_77_1, iter_77_0)
				end
			end

			setActive(arg_77_2:Find("select"), arg_77_1 + 1 == arg_69_0.selectedFloorId)
			setText(arg_77_2:Find("name"), i18n("dorm3d_room_" .. var_77_0))
			table.sort(var_77_1, CompareFuncs({
				function(arg_78_0)
					local var_78_0 = getProxy(ApartmentProxy):getRoom(arg_78_0)

					return (var_78_0 and var_78_0:getState() or "lock") == "complete" and 0 or 1
				end,
				function(arg_79_0)
					return pg.dorm3d_rooms[arg_79_0].type == 2 and 0 or 1
				end
			}))

			local var_77_2 = UIItemList.New(arg_77_2:Find("rooms"), arg_77_2:Find("rooms/room"))

			var_77_2:make(function(arg_80_0, arg_80_1, arg_80_2)
				if arg_80_0 == UIItemList.EventUpdate then
					local var_80_0 = var_77_1[arg_80_1 + 1]
					local var_80_1 = pg.dorm3d_rooms[var_80_0]
					local var_80_2 = getProxy(ApartmentProxy):getRoom(var_80_0)
					local var_80_3 = var_80_2 and var_80_2:getState() or "lock"

					setActive(arg_80_2:Find("lock"), var_80_3 ~= "complete")

					local var_80_4 = string.format("dorm3dselect/room_icon_%s", string.lower(var_80_1.assets_prefix))

					GetImageSpriteFromAtlasAsync(var_80_4, "", arg_80_2:Find("normal/mask/icon"), false)
					setText(arg_80_2:Find("roomId"), var_80_0)
				end
			end)
			var_77_2:align(#var_77_1)
			onButton(arg_69_0, arg_77_2, function()
				var_69_4:SetTriggerEvent(function()
					arg_69_0:ChangeMap(arg_77_1 + 1)
				end)
				var_69_3:Play("anim_InterludeAni")
				var_69_5:Play("anim_switchPanel_exit")
			end, SFX_PANEL)
		end
	end)
	var_69_6:align(#arg_69_0.floorData)
	arg_69_0:ChangeMap(arg_69_0.selectedFloorId)
end

function var_0_0.ChangeMap(arg_83_0, arg_83_1)
	arg_83_0.selectedFloorId = arg_83_1

	local var_83_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("DORM_SELECTED_FLOOR_ID" .. var_83_0, arg_83_0.selectedFloorId)
	arg_83_0:SetFloor(arg_83_0.floorData[arg_83_0.selectedFloorId])
	setActive(arg_83_0.rtMain:Find("btn_switch/left"), arg_83_0.selectedFloorId > 1)
	setActive(arg_83_0.rtMain:Find("btn_switch/right"), arg_83_0.selectedFloorId < #arg_83_0.floorData)
	setText(arg_83_0.rtMain:Find("btn_switch/switch/currentName"), i18n("dorm3d_room_" .. arg_83_0.floorData[arg_83_0.selectedFloorId]))

	for iter_83_0 = 0, #arg_83_0.floorData - 1 do
		setActive(arg_83_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"):GetChild(iter_83_0):Find("select"), iter_83_0 + 1 == arg_83_1)
	end

	arg_83_0.floorTipFlag = {}
	arg_83_0.floorRoomTipFlag = {}

	for iter_83_1, iter_83_2 in ipairs(arg_83_0.floorData) do
		local var_83_1 = false
		local var_83_2 = {}
		local var_83_3 = pg.dorm3d_rooms.get_id_list_by_in_map[iter_83_2]

		for iter_83_3, iter_83_4 in ipairs(var_83_3) do
			if pg.dorm3d_rooms[iter_83_4].is_common == 0 then
				var_83_2[iter_83_4] = false

				local var_83_4 = getProxy(ApartmentProxy):getRoom(iter_83_4)
				local var_83_5 = var_83_4 and var_83_4:getState() or "lock"

				if var_83_5 == "complete" and var_83_4:isPersonalRoom() and getProxy(ApartmentProxy):getApartment(var_83_4:getPersonalGroupId()):getIconTip(var_83_4:GetConfigID()) then
					var_83_1 = true
					var_83_2[iter_83_4] = true
				end

				if var_83_5 == "complete" and not var_83_4:isPersonalRoom() then
					var_83_2[iter_83_4] = PlayerPrefs.GetInt(var_83_0 .. "_dorm3dRoomInviteSuccess_" .. iter_83_4, 1) == 0
				end
			end
		end

		table.insert(arg_83_0.floorTipFlag, var_83_1)
		table.insert(arg_83_0.floorRoomTipFlag, var_83_2)
	end

	if arg_83_0.selectedFloorId > 1 then
		setActive(arg_83_0.rtMain:Find("btn_switch/left/tip"), arg_83_0.floorTipFlag[arg_83_0.selectedFloorId - 1])
	end

	if arg_83_0.selectedFloorId < #arg_83_0.floorData then
		setActive(arg_83_0.rtMain:Find("btn_switch/right/tip"), arg_83_0.floorTipFlag[arg_83_0.selectedFloorId + 1])
	end

	setActive(arg_83_0.rtMain:Find("btn_switch/switch/tip"), table.contains(arg_83_0.floorTipFlag, true))

	for iter_83_5 = 0, arg_83_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content").childCount - 1 do
		local var_83_6 = arg_83_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"):GetChild(iter_83_5)

		for iter_83_6 = 0, var_83_6:Find("rooms").childCount - 1 do
			local var_83_7 = var_83_6:Find("rooms"):GetChild(iter_83_6)
			local var_83_8 = var_83_7:Find("roomId"):GetComponent(typeof(Text)).text

			setActive(var_83_7:Find("normal/tip"), arg_83_0.floorRoomTipFlag[iter_83_5 + 1][tonumber(var_83_8)])
		end
	end
end

function var_0_0.onBackPressed(arg_84_0)
	if isActive(arg_84_0.rtIconTip) then
		arg_84_0:HideIconTipWindow()
	else
		var_0_0.super.onBackPressed(arg_84_0)
	end
end

function var_0_0.willExit(arg_85_0)
	if isActive(arg_85_0.rtIconTip) then
		arg_85_0:HideIconTipWindow()
	end

	if arg_85_0.clearSceneCache then
		-- block empty
	end
end

return var_0_0
