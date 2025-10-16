local var_0_0 = class("SelectDorm3DScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "SelectDorm3DUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.rtMap = arg_2_0._tf:Find("Map")
	arg_2_0.rtIconTip = arg_2_0.rtMap:Find("tip")

	setActive(arg_2_0.rtIconTip, false)
	onButton(arg_2_0, arg_2_0.rtIconTip:Find("bg"), function()
		arg_2_0:HideIconTipWindow()
	end, SFX_CANCEL)
	setText(arg_2_0.rtIconTip:Find("window/btn_cancel/Text"), i18n("text_cancel"))
	onButton(arg_2_0, arg_2_0.rtIconTip:Find("window/btn_cancel"), function()
		arg_2_0:HideIconTipWindow()
	end, SFX_CANCEL)
	setText(arg_2_0.rtIconTip:Find("window/btn_confirm/Text"), i18n("text_confirm"))

	arg_2_0.rtMain = arg_2_0._tf:Find("Main")

	setText(arg_2_0.rtMain:Find("title/Text"), i18n("dorm3d_role_choose"))
	onButton(arg_2_0, arg_2_0.rtMain:Find("btn_back"), function()
		arg_2_0.clearSceneCache = true

		arg_2_0:closeView()
	end, SFX_CANCEL)

	arg_2_0.insBtn = Dorm3dInsBtn.New(arg_2_0.rtMain:Find("btn_ins"))

	onButton(arg_2_0, arg_2_0.insBtn.root, function()
		arg_2_0:emit(SelectDorm3DMediator.OPEN_INS_LAYER, arg_2_0.insBtn.IsNewPhoneCall())
	end)
	setActive(arg_2_0.rtMain:Find("btn_ins"), not DORM_LOCK_INS)

	local var_2_0 = getProxy(PlayerProxy):getRawData().id

	if not pg.TimeMgr.GetInstance():IsSameWeek(pg.TimeMgr.GetInstance():GetServerTime(), PlayerPrefs.GetInt(var_2_0 .. "_dorm3dGiftWeekRefreshTimeStamp", 0)) then
		ApartmentProxy.RefreshGiftDailyTip()
	end

	setActive(arg_2_0.rtMain:Find("btn_shop/tip"), Dorm3dShopUI.ShouldShowAllTip())
	onButton(arg_2_0, arg_2_0.rtMain:Find("btn_shop"), function()
		arg_2_0:emit(SelectDorm3DMediator.OPEN_SHOP_LAYER, function()
			setActive(arg_2_0.rtMain:Find("btn_shop/tip"), Dorm3dShopUI.ShouldShowAllTip())
		end)
	end)
	onButton(arg_2_0, arg_2_0.rtMain:Find("option/setting"), function()
		arg_2_0:emit(SelectDorm3DMediator.OPEN_SETTING_LAYER)
	end)
	onButton(arg_2_0, arg_2_0.rtMain:Find("option/home"), function()
		arg_2_0:emit(BaseUI.ON_HOME)
	end)

	arg_2_0.rtStamina = arg_2_0.rtMain:Find("stamina")
	arg_2_0.rtRes = arg_2_0.rtMain:Find("res")

	arg_2_0:InitResBar()

	arg_2_0.rtWeekTask = arg_2_0.rtMain:Find("task")

	arg_2_0:UpdateWeekTask()

	arg_2_0.rtLayer = arg_2_0._tf:Find("Layer")
	arg_2_0.floorData = _.keys(pg.dorm3d_rooms.get_id_list_by_in_map)

	arg_2_0:SetMapSwitch()
end

function var_0_0.didEnter(arg_11_0)
	arg_11_0:SetFloor(arg_11_0.floorData[arg_11_0.selectedFloorId])
	arg_11_0:UpdateStamina()
	arg_11_0:CheckGuide("DORM3D_GUIDE_02")
	arg_11_0:FlushInsBtn()

	if not ApartmentProxy.CheckDeviceRAMEnough() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("drom3d_memory_limit_tip"))
	end
end

function var_0_0.FlushInsBtn(arg_12_0)
	arg_12_0.insBtn:Flush()
end

function var_0_0.UpdateStamina(arg_13_0)
	setText(arg_13_0.rtStamina:Find("Text"), string.format("%d/%d", getProxy(ApartmentProxy):getStamina()))
	setActive(arg_13_0.rtStamina:Find("vfx_ui_stamina01"), getProxy(ApartmentProxy):getStamina() > 0)
end

function var_0_0.SetFloor(arg_14_0, arg_14_1)
	local var_14_0

	eachChild(arg_14_0.rtMap, function(arg_15_0)
		setActive(arg_15_0, arg_15_0.name == arg_14_1)

		if arg_15_0.name == arg_14_1 then
			var_14_0 = arg_15_0
		end
	end)
	assert(var_14_0)

	arg_14_0.roomDic = {}

	for iter_14_0, iter_14_1 in ipairs(pg.dorm3d_rooms.get_id_list_by_in_map[arg_14_1]) do
		arg_14_0.roomDic[iter_14_1] = var_14_0:Find(pg.dorm3d_rooms[iter_14_1].assets_prefix)

		arg_14_0:InitIconTrigger(iter_14_1)
		arg_14_0:UpdateIconState(iter_14_1)
	end

	arg_14_0:ReplaceSpecialRoomIcon()
end

function var_0_0.FlushFloor(arg_16_0)
	arg_16_0:SetFloor(arg_16_0.floorData[arg_16_0.selectedFloorId])
end

function var_0_0.InitIconTrigger(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.roomDic[arg_17_1]
	local var_17_1 = pg.dorm3d_rooms[arg_17_1].assets_prefix

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(var_17_1)), "", var_17_0:Find("icon"))
	onButton(arg_17_0, var_17_0, function()
		if BLOCK_DORM3D_ROOMS and table.contains(BLOCK_DORM3D_ROOMS, arg_17_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_system_switch"))

			return
		end

		if arg_17_1 ~= 1 and (not getProxy(ApartmentProxy):getRoom(1) or not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_02")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip"))

			return
		end

		local var_18_0 = getProxy(ApartmentProxy):getRoom(arg_17_1)
		local var_18_1 = pg.dorm3d_rooms[arg_17_1].type

		if var_18_1 == 1 then
			if arg_17_1 ~= 4 and not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_06") then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip2"))

				return
			end

			if not var_18_0 then
				arg_17_0:emit(SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_17_1)
			else
				arg_17_0:TryDownloadResource({
					click = true,
					roomId = arg_17_1
				}, function()
					local var_19_0 = ApartmentProxy.GetRoomInviteList(arg_17_1)

					if arg_17_0:CheckGuide("DORM3D_GUIDE_06") then
						var_19_0 = {}
					end

					arg_17_0:emit(SelectDorm3DMediator.OPEN_INVITE_LAYER, arg_17_1, var_19_0, function()
						arg_17_0:FlushFloor()
					end)
				end)
			end
		elseif var_18_1 == 2 then
			if not var_18_0 then
				arg_17_0:ShowIconTipWindow(arg_17_1, var_17_0)
			else
				arg_17_0:TryDownloadResource({
					click = true,
					roomId = arg_17_1
				}, function()
					arg_17_0:emit(SelectDorm3DMediator.ON_DORM, {
						roomId = var_18_0.id,
						groupIds = var_18_0:getInviteList()
					})
				end)
			end
		else
			assert(false)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateIconState(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.roomDic[arg_22_1]
	local var_22_1 = getProxy(ApartmentProxy):getRoom(arg_22_1)
	local var_22_2 = var_22_1 and var_22_1:getState() or "lock"

	setActive(var_22_0:Find("icon/mask"), var_22_2 ~= "complete")
	eachChild(var_22_0:Find("front"), function(arg_23_0)
		setActive(arg_23_0, arg_23_0.name == var_22_2)
	end)
	switch(var_22_2, {
		loading = function()
			local var_24_0 = DormGroupConst.DormDownloadLock

			setSlider(var_22_0:Find("front/loading/progress"), 0, var_24_0.totalSize, var_24_0.curSize)
		end,
		complete = function()
			local var_25_0 = var_22_0:Find("front/complete")
			local var_25_1 = var_22_1:isPersonalRoom()

			setActive(var_25_0, var_25_1)

			if var_25_1 then
				local var_25_2 = getProxy(ApartmentProxy):getApartment(var_22_1:getPersonalGroupId())
				local var_25_3 = var_25_2:getIconTip(var_22_1:GetConfigID())

				eachChild(var_25_0:Find("tip"), function(arg_26_0)
					setActive(arg_26_0, arg_26_0.name == var_25_3)
				end)
				setText(var_25_0:Find("favor/Text"), var_25_2.level)
			end
		end
	})

	local var_22_3 = getProxy(PlayerProxy):getRawData().id

	if var_22_0:Find("tip") then
		setActive(var_22_0:Find("tip"), PlayerPrefs.GetInt(var_22_3 .. "_dorm3dRoomInviteSuccess_" .. arg_22_1, 1) == 0)
	end
end

function var_0_0.UpdateShowIcon(arg_27_0, arg_27_1, arg_27_2)
	removeOnButton(arg_27_2)
	setActive(arg_27_2:Find("icon/mask"), false)
	eachChild(arg_27_2:Find("front"), function(arg_28_0)
		setActive(arg_28_0, false)
	end)
end

function var_0_0.ReplaceSpecialRoomIcon(arg_29_0)
	local var_29_0 = {}

	for iter_29_0, iter_29_1 in pairs(getProxy(ApartmentProxy):getRawData()) do
		for iter_29_2, iter_29_3 in ipairs(iter_29_1:getSpecialTalking()) do
			local var_29_1 = pg.dorm3d_dialogue_group[iter_29_3].trigger_config[1]

			if arg_29_0.roomDic[var_29_1] then
				var_29_0[var_29_1] = var_29_0[var_29_1] or {}

				table.insert(var_29_0[var_29_1], iter_29_3)
			end
		end
	end

	for iter_29_4, iter_29_5 in pairs(var_29_0) do
		setActive(arg_29_0.roomDic[iter_29_4], false)

		local var_29_2 = cloneTplTo(arg_29_0.roomDic[iter_29_4], arg_29_0.roomDic[iter_29_4].parent, arg_29_0.roomDic[iter_29_4].name .. "_special")

		arg_29_0:UpdateShowIcon(iter_29_4, var_29_2)
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(pg.dorm3d_rooms[iter_29_4].assets_prefix)), "", var_29_2:Find("icon"))
		setActive(var_29_2:Find("front/complete"), true)
		setActive(var_29_2:Find("front/complete/favor"), false)
		eachChild(var_29_2:Find("front/complete/tip"), function(arg_30_0)
			setActive(arg_30_0, arg_30_0.name == "main")
		end)
		table.sort(iter_29_5)

		local var_29_3 = iter_29_5[1]
		local var_29_4 = pg.dorm3d_dialogue_group[var_29_3]

		onButton(arg_29_0, var_29_2, function()
			arg_29_0:TryDownloadResource({
				click = true,
				roomId = var_29_4.room_id
			}, function()
				arg_29_0:emit(SelectDorm3DMediator.ON_DORM, {
					roomId = var_29_4.room_id,
					groupIds = {
						var_29_4.char_id
					},
					specialId = var_29_3
				})
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadUpdate(arg_33_0, arg_33_1, arg_33_2)
	switch(arg_33_2, {
		start = function()
			if arg_33_0.roomDic[arg_33_1] then
				arg_33_0:UpdateIconState(arg_33_1)
			end
		end,
		loading = function()
			if arg_33_0.roomDic[arg_33_1] then
				local var_35_0 = DormGroupConst.DormDownloadLock

				setSlider(arg_33_0.roomDic[arg_33_1]:Find("front/loading/progress"), 0, var_35_0.totalSize, var_35_0.curSize)
			end
		end,
		finish = function()
			for iter_36_0, iter_36_1 in pairs(arg_33_0.roomDic) do
				arg_33_0:UpdateIconState(iter_36_0)
			end

			arg_33_0:CheckGuide("DORM3D_GUIDE_02")
		end,
		delete = function()
			if arg_33_0.roomDic[arg_33_1] then
				arg_33_0:UpdateIconState(arg_33_1)
			end
		end
	})
end

function var_0_0.AfterRoomUnlock(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_1.roomId

	if isActive(arg_38_0.rtIconTip) then
		arg_38_0:HideIconTipWindow()
	end

	eachChild(arg_38_0.roomDic[var_38_0]:Find("icon/mask"), function(arg_39_0)
		setActive(arg_39_0, true)
	end)
	quickPlayAnimation(arg_38_0.roomDic[var_38_0], "anim_Dorm3d_selectDorm_icon_unlock")
	pg.UIMgr.GetInstance():LoadingOn(false)
	LeanTween.delayedCall(1.2333333333333334, System.Action(function()
		pg.UIMgr.GetInstance():LoadingOff(false)
		arg_38_0:UpdateIconState(var_38_0)
		arg_38_0:TryDownloadResource(arg_38_1)
		arg_38_0:CheckGuide("DORM3D_GUIDE_02")
		arg_38_0:SetMapSwitch()
	end))
end

function var_0_0.ShowIconTipWindow(arg_41_0, arg_41_1, arg_41_2)
	setLocalPosition(arg_41_0.rtIconTip:Find("window"), arg_41_0.rtIconTip:InverseTransformPoint(arg_41_2.position))
	removeAllChildren(arg_41_0.rtIconTip:Find("window/icon"))

	arg_41_2 = cloneTplTo(arg_41_2, arg_41_0.rtIconTip:Find("window/icon"))

	arg_41_0:UpdateShowIcon(arg_41_1, arg_41_2)
	setAnchoredPosition(arg_41_2, Vector2.zero)

	local var_41_0 = ApartmentRoom.New({
		id = arg_41_1
	})
	local var_41_1, var_41_2 = var_41_0:getDownloadNeedSize()

	setText(arg_41_0.rtIconTip:Find("window/Text"), i18n("dorm3d_role_assets_download", ShipGroup.getDefaultShipNameByGroupID(var_41_0:getPersonalGroupId()), var_41_0:needDownload() and var_41_2 or "0B"))
	onButton(arg_41_0, arg_41_0.rtIconTip:Find("window/btn_confirm"), function()
		arg_41_0:emit(SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM, arg_41_1)
	end, SFX_CONFIRM)
	setActive(arg_41_0.rtIconTip, true)
end

function var_0_0.HideIconTipWindow(arg_43_0)
	setActive(arg_43_0.rtIconTip, false)
end

function var_0_0.TryDownloadResource(arg_44_0, arg_44_1, arg_44_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_now_is_downloading"))

		return
	end

	local var_44_0 = getProxy(ApartmentProxy):getRoom(arg_44_1.roomId)
	local var_44_1 = var_44_0:getDownloadNameList()

	if #var_44_1 > 0 then
		local var_44_2 = {
			isShowBox = true,
			fileList = var_44_1,
			finishFunc = function(arg_45_0)
				if arg_45_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_resource_download_complete"))
				end
			end,
			roomId = var_44_0.configId
		}

		DormGroupConst.DormDownload(var_44_2)
	else
		existCall(arg_44_2)
	end
end

function var_0_0.InitResBar(arg_46_0)
	arg_46_0.goldMax = arg_46_0.rtRes:Find("gold/max"):GetComponent(typeof(Text))
	arg_46_0.goldValue = arg_46_0.rtRes:Find("gold/Text"):GetComponent(typeof(Text))
	arg_46_0.oilMax = arg_46_0.rtRes:Find("oil/max"):GetComponent(typeof(Text))
	arg_46_0.oilValue = arg_46_0.rtRes:Find("oil/Text"):GetComponent(typeof(Text))
	arg_46_0.gemValue = arg_46_0.rtRes:Find("gem/Text"):GetComponent(typeof(Text))

	onButton(arg_46_0, arg_46_0.rtRes:Find("gold"), function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_46_0, arg_46_0.rtRes:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_46_0, arg_46_0.rtRes:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	arg_46_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_50_0)
	local var_50_0 = getProxy(PlayerProxy):getRawData()

	PlayerResUI.StaticFlush(var_50_0, arg_50_0.goldMax, arg_50_0.goldValue, arg_50_0.oilMax, arg_50_0.oilValue, arg_50_0.gemValue)
end

function var_0_0.UpdateWeekTask(arg_51_0)
	local var_51_0 = getDorm3dGameset("drom3d_weekly_task")[1]
	local var_51_1 = getProxy(TaskProxy):getTaskVO(var_51_0)
	local var_51_2 = var_51_1:isReceive()
	local var_51_3 = var_51_2 and 3 or var_51_1:getProgress()
	local var_51_4 = arg_51_0.rtWeekTask:Find("content")

	for iter_51_0 = 1, 3 do
		triggerToggle(var_51_4:Find("tpl_" .. iter_51_0), iter_51_0 <= var_51_3)
	end

	local var_51_5 = Drop.Create(var_51_1:getConfig("award_display")[1])

	updateCustomDrop(var_51_4:Find("Dorm3dIconTpl"), var_51_5)
	onButton(arg_51_0, var_51_4:Find("Dorm3dIconTpl"), function()
		if not var_51_2 and var_51_1:isFinish() then
			arg_51_0:emit(SelectDorm3DMediator.ON_SUBMIT_TASK, var_51_0)
		else
			arg_51_0:emit(BaseUI.ON_NEW_DROP, {
				drop = var_51_5
			})
		end
	end, SFX_CONFIRM)
	setActive(var_51_4:Find("Dorm3dIconTpl/get"), not var_51_2 and var_51_1:isFinish())
	setGray(var_51_4:Find("Dorm3dIconTpl"), var_51_2)
	onButton(arg_51_0, arg_51_0._tf:Find("Main/task_done"), function()
		setActive(arg_51_0.rtWeekTask, true)
		setActive(arg_51_0._tf:Find("Main/task_done"), false)
	end)
	onButton(arg_51_0, arg_51_0.rtWeekTask:Find("title"), function()
		if var_51_2 then
			setActive(arg_51_0.rtWeekTask, false)
			setActive(arg_51_0._tf:Find("Main/task_done"), true)
		end
	end)
end

function var_0_0.CheckGuide(arg_55_0, arg_55_1)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_55_1) then
		return
	end

	return switch(arg_55_1, {
		DORM3D_GUIDE_02 = function()
			local var_56_0 = getProxy(ApartmentProxy):getApartment(20220)

			if var_56_0 and not var_56_0:needDownload() then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = arg_55_1
				})
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_55_1)))
				pg.NewGuideMgr.GetInstance():Play(arg_55_1, nil, function()
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_55_1)))
				end)

				return true
			end
		end,
		DORM3D_GUIDE_06 = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_55_1
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_55_1)))
			pg.NewGuideMgr.GetInstance():Play(arg_55_1, nil, function()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_55_1)))
			end)

			return true
		end
	}, function()
		return false
	end)
end

function var_0_0.SetMapSwitch(arg_61_0)
	local var_61_0 = getProxy(PlayerProxy):getRawData().id

	arg_61_0.selectedFloorId = PlayerPrefs.GetInt("DORM_SELECTED_FLOOR_ID" .. var_61_0, 1)

	if pg.NewGuideMgr.GetInstance():GetCurrentGuideName() == "DORM3D_GUIDE_01" then
		arg_61_0.selectedFloorId = 1
	elseif not DORM_LOCK_SELECT_NEW then
		local var_61_1 = pg.dorm3d_set.drom3d_new_room_remind.key_value_int

		if PlayerPrefs.GetInt("DORM_SELECTED_NEW_ROOM_FLOOR" .. var_61_0 .. var_61_1, 0) == 0 then
			arg_61_0.selectedFloorId = table.indexof(arg_61_0.floorData, pg.dorm3d_rooms[var_61_1].in_map)

			PlayerPrefs.SetInt("DORM_SELECTED_NEW_ROOM_FLOOR" .. var_61_0 .. var_61_1, 1)
		end
	end

	local var_61_2 = arg_61_0._tf:Find("interludeAni")
	local var_61_3 = var_61_2:GetComponent(typeof(Animation))
	local var_61_4 = var_61_2:GetComponent(typeof(DftAniEvent))

	onButton(arg_61_0, arg_61_0.rtMain:Find("btn_switch/left"), function()
		var_61_4:SetTriggerEvent(function()
			arg_61_0:ChangeMap(arg_61_0.selectedFloorId - 1)
		end)
		var_61_3:Play("anim_InterludeAni")
	end)
	onButton(arg_61_0, arg_61_0.rtMain:Find("btn_switch/right"), function()
		var_61_4:SetTriggerEvent(function()
			arg_61_0:ChangeMap(arg_61_0.selectedFloorId + 1)
		end)
		var_61_3:Play("anim_InterludeAni")
	end)
	setActive(arg_61_0.rtMain:Find("btn_switch/switchPanel"), false)

	local var_61_5 = arg_61_0.rtMain:Find("btn_switch/switchPanel"):GetComponent(typeof(Animation))

	arg_61_0.rtMain:Find("btn_switch/switchPanel"):GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		setActive(arg_61_0.rtMain:Find("btn_switch/switchPanel"), false)
	end)
	onButton(arg_61_0, arg_61_0.rtMain:Find("btn_switch/switch"), function()
		setActive(arg_61_0.rtMain:Find("btn_switch/switchPanel"), true)
	end)
	onButton(arg_61_0, arg_61_0.rtMain:Find("btn_switch/switchPanel"), function()
		var_61_5:Play("anim_switchPanel_exit")
	end)

	local var_61_6 = UIItemList.New(arg_61_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"), arg_61_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content/floor"))

	var_61_6:make(function(arg_69_0, arg_69_1, arg_69_2)
		if arg_69_0 == UIItemList.EventUpdate then
			local var_69_0 = arg_61_0.floorData[arg_69_1 + 1]
			local var_69_1 = Clone(pg.dorm3d_rooms.get_id_list_by_in_map[var_69_0])

			for iter_69_0 = #var_69_1, 1, -1 do
				if pg.dorm3d_rooms[var_69_1[iter_69_0]].is_common == 1 then
					table.remove(var_69_1, iter_69_0)
				end
			end

			setActive(arg_69_2:Find("select"), arg_69_1 + 1 == arg_61_0.selectedFloorId)
			setText(arg_69_2:Find("name"), i18n("dorm3d_room_" .. var_69_0))
			table.sort(var_69_1, CompareFuncs({
				function(arg_70_0)
					local var_70_0 = getProxy(ApartmentProxy):getRoom(arg_70_0)

					return (var_70_0 and var_70_0:getState() or "lock") == "complete" and 0 or 1
				end,
				function(arg_71_0)
					return pg.dorm3d_rooms[arg_71_0].type == 2 and 0 or 1
				end
			}))

			local var_69_2 = UIItemList.New(arg_69_2:Find("rooms"), arg_69_2:Find("rooms/room"))

			var_69_2:make(function(arg_72_0, arg_72_1, arg_72_2)
				if arg_72_0 == UIItemList.EventUpdate then
					local var_72_0 = var_69_1[arg_72_1 + 1]
					local var_72_1 = pg.dorm3d_rooms[var_72_0]
					local var_72_2 = getProxy(ApartmentProxy):getRoom(var_72_0)
					local var_72_3 = var_72_2 and var_72_2:getState() or "lock"

					setActive(arg_72_2:Find("lock"), var_72_3 ~= "complete")

					local var_72_4 = string.format("dorm3dselect/room_icon_%s", string.lower(var_72_1.assets_prefix))

					GetImageSpriteFromAtlasAsync(var_72_4, "", arg_72_2:Find("normal/mask/icon"), false)
					setText(arg_72_2:Find("roomId"), var_72_0)
				end
			end)
			var_69_2:align(#var_69_1)
			onButton(arg_61_0, arg_69_2, function()
				var_61_4:SetTriggerEvent(function()
					arg_61_0:ChangeMap(arg_69_1 + 1)
				end)
				var_61_3:Play("anim_InterludeAni")
				var_61_5:Play("anim_switchPanel_exit")
			end, SFX_PANEL)
		end
	end)
	var_61_6:align(#arg_61_0.floorData)
	arg_61_0:ChangeMap(arg_61_0.selectedFloorId)
end

function var_0_0.ChangeMap(arg_75_0, arg_75_1)
	arg_75_0.selectedFloorId = arg_75_1

	local var_75_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("DORM_SELECTED_FLOOR_ID" .. var_75_0, arg_75_0.selectedFloorId)
	arg_75_0:SetFloor(arg_75_0.floorData[arg_75_0.selectedFloorId])
	setActive(arg_75_0.rtMain:Find("btn_switch/left"), arg_75_0.selectedFloorId > 1)
	setActive(arg_75_0.rtMain:Find("btn_switch/right"), arg_75_0.selectedFloorId < #arg_75_0.floorData)
	setText(arg_75_0.rtMain:Find("btn_switch/switch/currentName"), i18n("dorm3d_room_" .. arg_75_0.floorData[arg_75_0.selectedFloorId]))

	for iter_75_0 = 0, #arg_75_0.floorData - 1 do
		setActive(arg_75_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"):GetChild(iter_75_0):Find("select"), iter_75_0 + 1 == arg_75_1)
	end

	arg_75_0.floorTipFlag = {}
	arg_75_0.floorRoomTipFlag = {}

	for iter_75_1, iter_75_2 in ipairs(arg_75_0.floorData) do
		local var_75_1 = false
		local var_75_2 = {}
		local var_75_3 = pg.dorm3d_rooms.get_id_list_by_in_map[iter_75_2]

		for iter_75_3, iter_75_4 in ipairs(var_75_3) do
			if pg.dorm3d_rooms[iter_75_4].is_common == 0 then
				var_75_2[iter_75_4] = false

				local var_75_4 = getProxy(ApartmentProxy):getRoom(iter_75_4)
				local var_75_5 = var_75_4 and var_75_4:getState() or "lock"

				if var_75_5 == "complete" and var_75_4:isPersonalRoom() and getProxy(ApartmentProxy):getApartment(var_75_4:getPersonalGroupId()):getIconTip(var_75_4:GetConfigID()) then
					var_75_1 = true
					var_75_2[iter_75_4] = true
				end

				if var_75_5 == "complete" and not var_75_4:isPersonalRoom() then
					var_75_2[iter_75_4] = PlayerPrefs.GetInt(var_75_0 .. "_dorm3dRoomInviteSuccess_" .. iter_75_4, 1) == 0
				end
			end
		end

		table.insert(arg_75_0.floorTipFlag, var_75_1)
		table.insert(arg_75_0.floorRoomTipFlag, var_75_2)
	end

	if arg_75_0.selectedFloorId > 1 then
		setActive(arg_75_0.rtMain:Find("btn_switch/left/tip"), arg_75_0.floorTipFlag[arg_75_0.selectedFloorId - 1])
	end

	if arg_75_0.selectedFloorId < #arg_75_0.floorData then
		setActive(arg_75_0.rtMain:Find("btn_switch/right/tip"), arg_75_0.floorTipFlag[arg_75_0.selectedFloorId + 1])
	end

	setActive(arg_75_0.rtMain:Find("btn_switch/switch/tip"), table.contains(arg_75_0.floorTipFlag, true))

	for iter_75_5 = 0, arg_75_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content").childCount - 1 do
		local var_75_6 = arg_75_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"):GetChild(iter_75_5)

		for iter_75_6 = 0, var_75_6:Find("rooms").childCount - 1 do
			local var_75_7 = var_75_6:Find("rooms"):GetChild(iter_75_6)
			local var_75_8 = var_75_7:Find("roomId"):GetComponent(typeof(Text)).text

			setActive(var_75_7:Find("normal/tip"), arg_75_0.floorRoomTipFlag[iter_75_5 + 1][tonumber(var_75_8)])
		end
	end
end

function var_0_0.onBackPressed(arg_76_0)
	if isActive(arg_76_0.rtIconTip) then
		arg_76_0:HideIconTipWindow()
	else
		var_0_0.super.onBackPressed(arg_76_0)
	end
end

function var_0_0.willExit(arg_77_0)
	if isActive(arg_77_0.rtIconTip) then
		arg_77_0:HideIconTipWindow()
	end

	if arg_77_0.clearSceneCache then
		-- block empty
	end
end

return var_0_0
