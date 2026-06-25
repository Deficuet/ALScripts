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

	table.sort(arg_2_0.floorData, function(arg_11_0, arg_11_1)
		return (tonumber(string.match(arg_11_0, "%d+")) or 0) < (tonumber(string.match(arg_11_1, "%d+")) or 0)
	end)
	arg_2_0:SetMapSwitch()
end

function var_0_0.didEnter(arg_12_0)
	arg_12_0:SetFloor(arg_12_0.floorData[arg_12_0.selectedFloorId])
	arg_12_0:UpdateStamina()
	arg_12_0:CheckGuide("DORM3D_GUIDE_02")
	arg_12_0:FlushInsBtn()

	if not ApartmentProxy.CheckDeviceRAMEnough() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("drom3d_memory_limit_tip"))
	end
end

function var_0_0.FlushInsBtn(arg_13_0)
	arg_13_0.insBtn:Flush()
end

function var_0_0.UpdateStamina(arg_14_0)
	setText(arg_14_0.rtStamina:Find("Text"), string.format("%d/%d", getProxy(ApartmentProxy):getStamina()))
	setActive(arg_14_0.rtStamina:Find("vfx_ui_stamina01"), getProxy(ApartmentProxy):getStamina() > 0)
end

function var_0_0.SetFloor(arg_15_0, arg_15_1)
	local var_15_0

	eachChild(arg_15_0.rtMap, function(arg_16_0)
		setActive(arg_16_0, arg_16_0.name == arg_15_1)

		if arg_16_0.name == arg_15_1 then
			var_15_0 = arg_16_0
		end
	end)
	assert(var_15_0)

	arg_15_0.roomDic = {}

	for iter_15_0, iter_15_1 in ipairs(pg.dorm3d_rooms.get_id_list_by_in_map[arg_15_1]) do
		arg_15_0.roomDic[iter_15_1] = var_15_0:Find(pg.dorm3d_rooms[iter_15_1].assets_prefix)

		arg_15_0:InitIconTrigger(iter_15_1)
		arg_15_0:UpdateIconState(iter_15_1)
	end

	arg_15_0:ReplaceSpecialRoomIcon()
end

function var_0_0.FlushFloor(arg_17_0)
	arg_17_0:SetFloor(arg_17_0.floorData[arg_17_0.selectedFloorId])
end

function var_0_0.InitIconTrigger(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.roomDic[arg_18_1]
	local var_18_1 = pg.dorm3d_rooms[arg_18_1].assets_prefix

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(var_18_1)), "", var_18_0:Find("icon"))
	onButton(arg_18_0, var_18_0, function()
		if BLOCK_DORM3D_ROOMS and table.contains(BLOCK_DORM3D_ROOMS, arg_18_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_system_switch"))

			return
		end

		if arg_18_1 ~= 1 and (not getProxy(ApartmentProxy):getRoom(1) or not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_02")) and not DORM_LOCK_GUIDE then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip"))

			return
		end

		local var_19_0 = getProxy(ApartmentProxy):getRoom(arg_18_1)
		local var_19_1 = pg.dorm3d_rooms[arg_18_1].type

		if var_19_1 == 1 then
			if arg_18_1 ~= 4 and not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_06") and not DORM_LOCK_GUIDE then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip2"))

				return
			end

			if not var_19_0 then
				arg_18_0:emit(SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_18_1)
			else
				arg_18_0:TryDownloadResource({
					click = true,
					roomId = arg_18_1
				}, function()
					local var_20_0 = ApartmentProxy.GetRoomInviteList(arg_18_1)

					if arg_18_0:CheckGuide("DORM3D_GUIDE_06") then
						var_20_0 = {}
					end

					arg_18_0:emit(SelectDorm3DMediator.OPEN_INVITE_LAYER, arg_18_1, var_20_0, function()
						arg_18_0:FlushFloor()
					end)
				end)
			end
		elseif var_19_1 == 2 then
			if not var_19_0 then
				arg_18_0:ShowIconTipWindow(arg_18_1, var_18_0)
			else
				arg_18_0:TryDownloadResource({
					click = true,
					roomId = arg_18_1
				}, function()
					arg_18_0:emit(SelectDorm3DMediator.ON_DORM, {
						roomId = var_19_0.id,
						groupIds = var_19_0:getInviteList()
					})
				end)
			end
		else
			assert(false)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateIconState(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.roomDic[arg_23_1]
	local var_23_1 = getProxy(ApartmentProxy):getRoom(arg_23_1)
	local var_23_2 = var_23_1 and var_23_1:getState() or "lock"

	setActive(var_23_0:Find("icon/mask"), var_23_2 ~= "complete")
	eachChild(var_23_0:Find("front"), function(arg_24_0)
		setActive(arg_24_0, arg_24_0.name == var_23_2)
	end)
	switch(var_23_2, {
		loading = function()
			local var_25_0 = DormGroupConst.DormDownloadLock

			setSlider(var_23_0:Find("front/loading/progress"), 0, var_25_0.totalSize, var_25_0.curSize)
		end,
		complete = function()
			local var_26_0 = var_23_0:Find("front/complete")
			local var_26_1 = var_23_1:isPersonalRoom()

			setActive(var_26_0, var_26_1)

			if var_26_1 then
				local var_26_2 = getProxy(ApartmentProxy):getApartment(var_23_1:getPersonalGroupId())
				local var_26_3 = var_26_2:getIconTip(var_23_1:GetConfigID())

				eachChild(var_26_0:Find("tip"), function(arg_27_0)
					setActive(arg_27_0, arg_27_0.name == var_26_3)
				end)
				setText(var_26_0:Find("favor/Text"), var_26_2.level)
			end
		end
	})

	local var_23_3 = getProxy(PlayerProxy):getRawData().id

	if arg_23_1 == 4 then
		setActive(var_23_0:Find("inivite_tip"), PlayerPrefs.GetInt(var_23_3 .. "_dorm3dRoomInviteSuccess_" .. arg_23_1, 1) == 0)
	end

	local function var_23_4()
		if not var_23_1 or not var_23_1:isPersonalRoom() then
			return false
		end

		return getProxy(ApartmentProxy):HasShipGroupGiftExpireSoon(var_23_1:getConfig("character")[1])
	end

	setActive(var_23_0:Find("tip"), var_23_4())
end

function var_0_0.UpdateShowIcon(arg_29_0, arg_29_1, arg_29_2)
	removeOnButton(arg_29_2)
	setActive(arg_29_2:Find("icon/mask"), false)
	eachChild(arg_29_2:Find("front"), function(arg_30_0)
		setActive(arg_30_0, false)
	end)
end

function var_0_0.ReplaceSpecialRoomIcon(arg_31_0)
	local var_31_0 = {}

	for iter_31_0, iter_31_1 in pairs(getProxy(ApartmentProxy):getRawData()) do
		for iter_31_2, iter_31_3 in ipairs(iter_31_1:getSpecialTalking()) do
			local var_31_1 = pg.dorm3d_dialogue_group[iter_31_3].trigger_config[1]

			if arg_31_0.roomDic[var_31_1] then
				var_31_0[var_31_1] = var_31_0[var_31_1] or {}

				table.insert(var_31_0[var_31_1], iter_31_3)
			end
		end
	end

	for iter_31_4, iter_31_5 in pairs(var_31_0) do
		setActive(arg_31_0.roomDic[iter_31_4], false)

		local var_31_2 = cloneTplTo(arg_31_0.roomDic[iter_31_4], arg_31_0.roomDic[iter_31_4].parent, arg_31_0.roomDic[iter_31_4].name .. "_special")

		arg_31_0:UpdateShowIcon(iter_31_4, var_31_2)
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(pg.dorm3d_rooms[iter_31_4].assets_prefix)), "", var_31_2:Find("icon"))
		setActive(var_31_2:Find("front/complete"), true)
		setActive(var_31_2:Find("front/complete/favor"), false)
		eachChild(var_31_2:Find("front/complete/tip"), function(arg_32_0)
			setActive(arg_32_0, arg_32_0.name == "main")
		end)
		table.sort(iter_31_5)

		local var_31_3 = iter_31_5[1]
		local var_31_4 = pg.dorm3d_dialogue_group[var_31_3]

		if DORM_LOCK_GUIDE and var_31_3 == 10010 then
			return
		end

		onButton(arg_31_0, var_31_2, function()
			arg_31_0:TryDownloadResource({
				click = true,
				roomId = var_31_4.room_id
			}, function()
				arg_31_0:emit(SelectDorm3DMediator.ON_DORM, {
					roomId = var_31_4.room_id,
					groupIds = {
						var_31_4.char_id
					},
					specialId = var_31_3
				})
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadUpdate(arg_35_0, arg_35_1, arg_35_2)
	switch(arg_35_2, {
		start = function()
			if arg_35_0.roomDic[arg_35_1] then
				arg_35_0:UpdateIconState(arg_35_1)
			end
		end,
		loading = function()
			if arg_35_0.roomDic[arg_35_1] then
				local var_37_0 = DormGroupConst.DormDownloadLock

				setSlider(arg_35_0.roomDic[arg_35_1]:Find("front/loading/progress"), 0, var_37_0.totalSize, var_37_0.curSize)
			end
		end,
		finish = function()
			for iter_38_0, iter_38_1 in pairs(arg_35_0.roomDic) do
				arg_35_0:UpdateIconState(iter_38_0)
			end

			arg_35_0:CheckGuide("DORM3D_GUIDE_02")
		end,
		delete = function()
			if arg_35_0.roomDic[arg_35_1] then
				arg_35_0:UpdateIconState(arg_35_1)
			end
		end
	})
end

function var_0_0.AfterRoomUnlock(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_1.roomId

	if isActive(arg_40_0.rtIconTip) then
		arg_40_0:HideIconTipWindow()
	end

	eachChild(arg_40_0.roomDic[var_40_0]:Find("icon/mask"), function(arg_41_0)
		setActive(arg_41_0, true)
	end)
	quickPlayAnimation(arg_40_0.roomDic[var_40_0], "anim_Dorm3d_selectDorm_icon_unlock")
	pg.UIMgr.GetInstance():LoadingOn(false)
	LeanTween.delayedCall(1.2333333333333334, System.Action(function()
		pg.UIMgr.GetInstance():LoadingOff(false)
		arg_40_0:UpdateIconState(var_40_0)
		arg_40_0:TryDownloadResource(arg_40_1)
		arg_40_0:CheckGuide("DORM3D_GUIDE_02")
		arg_40_0:SetMapSwitch()
	end))
end

function var_0_0.ShowIconTipWindow(arg_43_0, arg_43_1, arg_43_2)
	setLocalPosition(arg_43_0.rtIconTip:Find("window"), arg_43_0.rtIconTip:InverseTransformPoint(arg_43_2.position))
	removeAllChildren(arg_43_0.rtIconTip:Find("window/icon"))

	arg_43_2 = cloneTplTo(arg_43_2, arg_43_0.rtIconTip:Find("window/icon"))

	arg_43_0:UpdateShowIcon(arg_43_1, arg_43_2)
	setAnchoredPosition(arg_43_2, Vector2.zero)

	local var_43_0 = ApartmentRoom.New({
		id = arg_43_1
	})
	local var_43_1, var_43_2 = var_43_0:getDownloadNeedSize()

	setText(arg_43_0.rtIconTip:Find("window/Text"), i18n("dorm3d_role_assets_download", ShipGroup.getDefaultShipNameByGroupID(var_43_0:getPersonalGroupId()), var_43_0:needDownload() and var_43_2 or "0B"))
	onButton(arg_43_0, arg_43_0.rtIconTip:Find("window/btn_confirm"), function()
		arg_43_0:emit(SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM, arg_43_1)
	end, SFX_CONFIRM)
	setActive(arg_43_0.rtIconTip, true)
end

function var_0_0.HideIconTipWindow(arg_45_0)
	setActive(arg_45_0.rtIconTip, false)
end

function var_0_0.TryDownloadResource(arg_46_0, arg_46_1, arg_46_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_now_is_downloading"))

		return
	end

	local var_46_0 = getProxy(ApartmentProxy):getRoom(arg_46_1.roomId)
	local var_46_1 = var_46_0:getDownloadNameList()

	if #var_46_1 > 0 then
		local var_46_2 = {
			isShowBox = true,
			fileList = var_46_1,
			finishFunc = function(arg_47_0)
				if arg_47_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_resource_download_complete"))
				end
			end,
			roomId = var_46_0.configId
		}

		DormGroupConst.DormDownload(var_46_2)
	else
		existCall(arg_46_2)
	end
end

function var_0_0.InitResBar(arg_48_0)
	arg_48_0.goldMax = arg_48_0.rtRes:Find("gold/max"):GetComponent(typeof(Text))
	arg_48_0.goldValue = arg_48_0.rtRes:Find("gold/Text"):GetComponent(typeof(Text))
	arg_48_0.oilMax = arg_48_0.rtRes:Find("oil/max"):GetComponent(typeof(Text))
	arg_48_0.oilValue = arg_48_0.rtRes:Find("oil/Text"):GetComponent(typeof(Text))
	arg_48_0.gemValue = arg_48_0.rtRes:Find("gem/Text"):GetComponent(typeof(Text))

	onButton(arg_48_0, arg_48_0.rtRes:Find("gold"), function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_48_0, arg_48_0.rtRes:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_48_0, arg_48_0.rtRes:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	arg_48_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_52_0)
	local var_52_0 = getProxy(PlayerProxy):getRawData()

	PlayerResUI.StaticFlush(var_52_0, arg_52_0.goldMax, arg_52_0.goldValue, arg_52_0.oilMax, arg_52_0.oilValue, arg_52_0.gemValue)
end

function var_0_0.UpdateWeekTask(arg_53_0)
	local var_53_0 = getDorm3dGameset("drom3d_weekly_task")[1]
	local var_53_1 = getProxy(TaskProxy):getTaskVO(var_53_0)
	local var_53_2 = var_53_1:isReceive()
	local var_53_3 = var_53_2 and 3 or var_53_1:getProgress()
	local var_53_4 = arg_53_0.rtWeekTask:Find("content")

	for iter_53_0 = 1, 3 do
		triggerToggle(var_53_4:Find("tpl_" .. iter_53_0), iter_53_0 <= var_53_3)
	end

	local var_53_5 = Drop.Create(var_53_1:getConfig("award_display")[1])

	updateCustomDrop(var_53_4:Find("Dorm3dIconTpl"), var_53_5)
	onButton(arg_53_0, var_53_4:Find("Dorm3dIconTpl"), function()
		if not var_53_2 and var_53_1:isFinish() then
			arg_53_0:emit(SelectDorm3DMediator.ON_SUBMIT_TASK, var_53_0)
		else
			arg_53_0:emit(BaseUI.ON_NEW_DROP, {
				drop = var_53_5
			})
		end
	end, SFX_CONFIRM)
	setActive(var_53_4:Find("Dorm3dIconTpl/get"), not var_53_2 and var_53_1:isFinish())
	setGray(var_53_4:Find("Dorm3dIconTpl"), var_53_2)
	onButton(arg_53_0, arg_53_0._tf:Find("Main/task_done"), function()
		setActive(arg_53_0.rtWeekTask, true)
		setActive(arg_53_0._tf:Find("Main/task_done"), false)
	end)
	onButton(arg_53_0, arg_53_0.rtWeekTask:Find("title"), function()
		if var_53_2 then
			setActive(arg_53_0.rtWeekTask, false)
			setActive(arg_53_0._tf:Find("Main/task_done"), true)
		end
	end)
end

function var_0_0.CheckGuide(arg_57_0, arg_57_1)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_57_1) then
		return
	end

	if DORM_LOCK_GUIDE then
		return false
	end

	return switch(arg_57_1, {
		DORM3D_GUIDE_02 = function()
			local var_58_0 = getProxy(ApartmentProxy):getApartment(20220)

			if var_58_0 and not var_58_0:needDownload() then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = arg_57_1
				})
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_57_1)))
				pg.NewGuideMgr.GetInstance():Play(arg_57_1, nil, function()
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_57_1)))
				end)

				return true
			end
		end,
		DORM3D_GUIDE_06 = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_57_1
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_57_1)))
			pg.NewGuideMgr.GetInstance():Play(arg_57_1, nil, function()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_57_1)))
			end)

			return true
		end
	}, function()
		return false
	end)
end

function var_0_0.SetMapSwitch(arg_63_0)
	local var_63_0 = getProxy(PlayerProxy):getRawData().id

	arg_63_0.selectedFloorId = PlayerPrefs.GetInt("DORM_SELECTED_FLOOR_ID" .. var_63_0, 1)

	if pg.NewGuideMgr.GetInstance():GetCurrentGuideName() == "DORM3D_GUIDE_01" then
		arg_63_0.selectedFloorId = 1
	elseif not DORM_LOCK_SELECT_NEW then
		local var_63_1 = pg.dorm3d_set.drom3d_new_room_remind.key_value_int

		if PlayerPrefs.GetInt("DORM_SELECTED_NEW_ROOM_FLOOR" .. var_63_0 .. var_63_1, 0) == 0 then
			arg_63_0.selectedFloorId = table.indexof(arg_63_0.floorData, pg.dorm3d_rooms[var_63_1].in_map)

			PlayerPrefs.SetInt("DORM_SELECTED_NEW_ROOM_FLOOR" .. var_63_0 .. var_63_1, 1)
		end
	end

	local var_63_2 = arg_63_0._tf:Find("interludeAni")
	local var_63_3 = var_63_2:GetComponent(typeof(Animation))
	local var_63_4 = var_63_2:GetComponent(typeof(DftAniEvent))

	onButton(arg_63_0, arg_63_0.rtMain:Find("btn_switch/left"), function()
		var_63_4:SetTriggerEvent(function()
			arg_63_0:ChangeMap(arg_63_0.selectedFloorId - 1)
		end)
		var_63_3:Play("anim_InterludeAni")
	end)
	onButton(arg_63_0, arg_63_0.rtMain:Find("btn_switch/right"), function()
		var_63_4:SetTriggerEvent(function()
			arg_63_0:ChangeMap(arg_63_0.selectedFloorId + 1)
		end)
		var_63_3:Play("anim_InterludeAni")
	end)
	setActive(arg_63_0.rtMain:Find("btn_switch/switchPanel"), false)

	local var_63_5 = arg_63_0.rtMain:Find("btn_switch/switchPanel"):GetComponent(typeof(Animation))

	arg_63_0.rtMain:Find("btn_switch/switchPanel"):GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		setActive(arg_63_0.rtMain:Find("btn_switch/switchPanel"), false)
	end)
	onButton(arg_63_0, arg_63_0.rtMain:Find("btn_switch/switch"), function()
		setActive(arg_63_0.rtMain:Find("btn_switch/switchPanel"), true)
	end)
	onButton(arg_63_0, arg_63_0.rtMain:Find("btn_switch/switchPanel"), function()
		var_63_5:Play("anim_switchPanel_exit")
	end)

	local var_63_6 = UIItemList.New(arg_63_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"), arg_63_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content/floor"))

	var_63_6:make(function(arg_71_0, arg_71_1, arg_71_2)
		if arg_71_0 == UIItemList.EventUpdate then
			local var_71_0 = arg_63_0.floorData[arg_71_1 + 1]
			local var_71_1 = Clone(pg.dorm3d_rooms.get_id_list_by_in_map[var_71_0])

			for iter_71_0 = #var_71_1, 1, -1 do
				if pg.dorm3d_rooms[var_71_1[iter_71_0]].is_common == 1 then
					table.remove(var_71_1, iter_71_0)
				end
			end

			setActive(arg_71_2:Find("select"), arg_71_1 + 1 == arg_63_0.selectedFloorId)
			setText(arg_71_2:Find("name"), i18n("dorm3d_room_" .. var_71_0))
			table.sort(var_71_1, CompareFuncs({
				function(arg_72_0)
					local var_72_0 = getProxy(ApartmentProxy):getRoom(arg_72_0)

					return (var_72_0 and var_72_0:getState() or "lock") == "complete" and 0 or 1
				end,
				function(arg_73_0)
					return pg.dorm3d_rooms[arg_73_0].type == 2 and 0 or 1
				end
			}))

			local var_71_2 = UIItemList.New(arg_71_2:Find("rooms"), arg_71_2:Find("rooms/room"))

			var_71_2:make(function(arg_74_0, arg_74_1, arg_74_2)
				if arg_74_0 == UIItemList.EventUpdate then
					local var_74_0 = var_71_1[arg_74_1 + 1]
					local var_74_1 = pg.dorm3d_rooms[var_74_0]
					local var_74_2 = getProxy(ApartmentProxy):getRoom(var_74_0)
					local var_74_3 = var_74_2 and var_74_2:getState() or "lock"

					setActive(arg_74_2:Find("lock"), var_74_3 ~= "complete")

					local var_74_4 = string.format("dorm3dselect/room_icon_%s", string.lower(var_74_1.assets_prefix))

					GetImageSpriteFromAtlasAsync(var_74_4, "", arg_74_2:Find("normal/mask/icon"), false)
					setText(arg_74_2:Find("roomId"), var_74_0)
				end
			end)
			var_71_2:align(#var_71_1)
			onButton(arg_63_0, arg_71_2, function()
				var_63_4:SetTriggerEvent(function()
					arg_63_0:ChangeMap(arg_71_1 + 1)
				end)
				var_63_3:Play("anim_InterludeAni")
				var_63_5:Play("anim_switchPanel_exit")
			end, SFX_PANEL)
		end
	end)
	var_63_6:align(#arg_63_0.floorData)
	arg_63_0:ChangeMap(arg_63_0.selectedFloorId)
end

function var_0_0.ChangeMap(arg_77_0, arg_77_1)
	arg_77_0.selectedFloorId = arg_77_1

	local var_77_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("DORM_SELECTED_FLOOR_ID" .. var_77_0, arg_77_0.selectedFloorId)
	arg_77_0:SetFloor(arg_77_0.floorData[arg_77_0.selectedFloorId])
	setActive(arg_77_0.rtMain:Find("btn_switch/left"), arg_77_0.selectedFloorId > 1)
	setActive(arg_77_0.rtMain:Find("btn_switch/right"), arg_77_0.selectedFloorId < #arg_77_0.floorData)
	setText(arg_77_0.rtMain:Find("btn_switch/switch/currentName"), i18n("dorm3d_room_" .. arg_77_0.floorData[arg_77_0.selectedFloorId]))

	for iter_77_0 = 0, #arg_77_0.floorData - 1 do
		setActive(arg_77_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"):GetChild(iter_77_0):Find("select"), iter_77_0 + 1 == arg_77_1)
	end

	arg_77_0.floorTipFlag = {}
	arg_77_0.floorRoomTipFlag = {}

	for iter_77_1, iter_77_2 in ipairs(arg_77_0.floorData) do
		local var_77_1 = false
		local var_77_2 = {}
		local var_77_3 = pg.dorm3d_rooms.get_id_list_by_in_map[iter_77_2]

		for iter_77_3, iter_77_4 in ipairs(var_77_3) do
			if pg.dorm3d_rooms[iter_77_4].is_common == 0 then
				var_77_2[iter_77_4] = false

				local var_77_4 = getProxy(ApartmentProxy):getRoom(iter_77_4)
				local var_77_5 = var_77_4 and var_77_4:getState() or "lock"

				if var_77_5 == "complete" and var_77_4:isPersonalRoom() and getProxy(ApartmentProxy):getApartment(var_77_4:getPersonalGroupId()):getIconTip(var_77_4:GetConfigID()) then
					var_77_1 = true
					var_77_2[iter_77_4] = true
				end

				if var_77_5 == "complete" and not var_77_4:isPersonalRoom() then
					var_77_2[iter_77_4] = PlayerPrefs.GetInt(var_77_0 .. "_dorm3dRoomInviteSuccess_" .. iter_77_4, 1) == 0
				end
			end
		end

		table.insert(arg_77_0.floorTipFlag, var_77_1)
		table.insert(arg_77_0.floorRoomTipFlag, var_77_2)
	end

	if arg_77_0.selectedFloorId > 1 then
		setActive(arg_77_0.rtMain:Find("btn_switch/left/tip"), arg_77_0.floorTipFlag[arg_77_0.selectedFloorId - 1])
	end

	if arg_77_0.selectedFloorId < #arg_77_0.floorData then
		setActive(arg_77_0.rtMain:Find("btn_switch/right/tip"), arg_77_0.floorTipFlag[arg_77_0.selectedFloorId + 1])
	end

	setActive(arg_77_0.rtMain:Find("btn_switch/switch/tip"), table.contains(arg_77_0.floorTipFlag, true))

	for iter_77_5 = 0, arg_77_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content").childCount - 1 do
		local var_77_6 = arg_77_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"):GetChild(iter_77_5)

		for iter_77_6 = 0, var_77_6:Find("rooms").childCount - 1 do
			local var_77_7 = var_77_6:Find("rooms"):GetChild(iter_77_6)
			local var_77_8 = var_77_7:Find("roomId"):GetComponent(typeof(Text)).text

			setActive(var_77_7:Find("normal/tip"), arg_77_0.floorRoomTipFlag[iter_77_5 + 1][tonumber(var_77_8)])
		end
	end
end

function var_0_0.onBackPressed(arg_78_0)
	if isActive(arg_78_0.rtIconTip) then
		arg_78_0:HideIconTipWindow()
	else
		var_0_0.super.onBackPressed(arg_78_0)
	end
end

function var_0_0.willExit(arg_79_0)
	if isActive(arg_79_0.rtIconTip) then
		arg_79_0:HideIconTipWindow()
	end

	if arg_79_0.clearSceneCache then
		-- block empty
	end
end

return var_0_0
