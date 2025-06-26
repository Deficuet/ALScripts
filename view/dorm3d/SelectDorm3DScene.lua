local var_0_0 = class("SelectDorm3DScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "SelectDorm3DUI"
end

var_0_0.optionsPath = {
	"Main/option"
}

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

	arg_2_0.rtStamina = arg_2_0.rtMain:Find("stamina")
	arg_2_0.rtRes = arg_2_0.rtMain:Find("res")

	arg_2_0:InitResBar()

	arg_2_0.rtWeekTask = arg_2_0.rtMain:Find("task")

	arg_2_0:UpdateWeekTask()

	arg_2_0.rtLayer = arg_2_0._tf:Find("Layer")
	arg_2_0.floorData = _.keys(pg.dorm3d_rooms.get_id_list_by_in_map)

	arg_2_0:SetMapSwitch()
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0:SetFloor(arg_9_0.floorData[arg_9_0.selectedFloorId])
	arg_9_0:UpdateStamina()
	arg_9_0:CheckGuide("DORM3D_GUIDE_02")
	arg_9_0:FlushInsBtn()

	if not ApartmentProxy.CheckDeviceRAMEnough() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("drom3d_memory_limit_tip"))
	end
end

function var_0_0.FlushInsBtn(arg_10_0)
	arg_10_0.insBtn:Flush()
end

function var_0_0.UpdateStamina(arg_11_0)
	setText(arg_11_0.rtStamina:Find("Text"), string.format("%d/%d", getProxy(ApartmentProxy):getStamina()))
	setActive(arg_11_0.rtStamina:Find("vfx_ui_stamina01"), getProxy(ApartmentProxy):getStamina() > 0)
end

function var_0_0.SetFloor(arg_12_0, arg_12_1)
	local var_12_0

	eachChild(arg_12_0.rtMap, function(arg_13_0)
		setActive(arg_13_0, arg_13_0.name == arg_12_1)

		if arg_13_0.name == arg_12_1 then
			var_12_0 = arg_13_0
		end
	end)
	assert(var_12_0)

	arg_12_0.roomDic = {}

	for iter_12_0, iter_12_1 in ipairs(pg.dorm3d_rooms.get_id_list_by_in_map[arg_12_1]) do
		arg_12_0.roomDic[iter_12_1] = var_12_0:Find(pg.dorm3d_rooms[iter_12_1].assets_prefix)

		arg_12_0:InitIconTrigger(iter_12_1)
		arg_12_0:UpdateIconState(iter_12_1)
	end

	arg_12_0:ReplaceSpecialRoomIcon()
end

function var_0_0.FlushFloor(arg_14_0)
	arg_14_0:SetFloor(arg_14_0.floorData[arg_14_0.selectedFloorId])
end

function var_0_0.InitIconTrigger(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.roomDic[arg_15_1]
	local var_15_1 = pg.dorm3d_rooms[arg_15_1].assets_prefix

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(var_15_1)), "", var_15_0:Find("icon"))
	onButton(arg_15_0, var_15_0, function()
		if BLOCK_DORM3D_ROOMS and table.contains(BLOCK_DORM3D_ROOMS, arg_15_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_system_switch"))

			return
		end

		if arg_15_1 ~= 1 and (not getProxy(ApartmentProxy):getRoom(1) or not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_02")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip"))

			return
		end

		local var_16_0 = getProxy(ApartmentProxy):getRoom(arg_15_1)
		local var_16_1 = pg.dorm3d_rooms[arg_15_1].type

		if var_16_1 == 1 then
			if arg_15_1 ~= 4 and not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_06") then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip2"))

				return
			end

			if not var_16_0 then
				arg_15_0:emit(SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_15_1)
			else
				arg_15_0:TryDownloadResource({
					click = true,
					roomId = arg_15_1
				}, function()
					local var_17_0 = ApartmentProxy.GetRoomInviteList(arg_15_1)

					if arg_15_0:CheckGuide("DORM3D_GUIDE_06") then
						var_17_0 = {}
					end

					arg_15_0:emit(SelectDorm3DMediator.OPEN_INVITE_LAYER, arg_15_1, var_17_0, function()
						arg_15_0:FlushFloor()
					end)
				end)
			end
		elseif var_16_1 == 2 then
			if not var_16_0 then
				arg_15_0:ShowIconTipWindow(arg_15_1, var_15_0)
			else
				arg_15_0:TryDownloadResource({
					click = true,
					roomId = arg_15_1
				}, function()
					arg_15_0:emit(SelectDorm3DMediator.ON_DORM, {
						roomId = var_16_0.id,
						groupIds = var_16_0:getInviteList()
					})
				end)
			end
		else
			assert(false)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateIconState(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.roomDic[arg_20_1]
	local var_20_1 = getProxy(ApartmentProxy):getRoom(arg_20_1)
	local var_20_2 = var_20_1 and var_20_1:getState() or "lock"

	setActive(var_20_0:Find("icon/mask"), var_20_2 ~= "complete")
	eachChild(var_20_0:Find("front"), function(arg_21_0)
		setActive(arg_21_0, arg_21_0.name == var_20_2)
	end)
	switch(var_20_2, {
		loading = function()
			local var_22_0 = DormGroupConst.DormDownloadLock

			setSlider(var_20_0:Find("front/loading/progress"), 0, var_22_0.totalSize, var_22_0.curSize)
		end,
		complete = function()
			local var_23_0 = var_20_0:Find("front/complete")
			local var_23_1 = var_20_1:isPersonalRoom()

			setActive(var_23_0, var_23_1)

			if var_23_1 then
				local var_23_2 = getProxy(ApartmentProxy):getApartment(var_20_1:getPersonalGroupId())
				local var_23_3 = var_23_2:getIconTip(var_20_1:GetConfigID())

				eachChild(var_23_0:Find("tip"), function(arg_24_0)
					setActive(arg_24_0, arg_24_0.name == var_23_3)
				end)
				setText(var_23_0:Find("favor/Text"), var_23_2.level)
			end
		end
	})

	local var_20_3 = getProxy(PlayerProxy):getRawData().id

	if var_20_0:Find("tip") then
		setActive(var_20_0:Find("tip"), PlayerPrefs.GetInt(var_20_3 .. "_dorm3dRoomInviteSuccess_" .. arg_20_1, 1) == 0)
	end
end

function var_0_0.UpdateShowIcon(arg_25_0, arg_25_1, arg_25_2)
	removeOnButton(arg_25_2)
	setActive(arg_25_2:Find("icon/mask"), false)
	eachChild(arg_25_2:Find("front"), function(arg_26_0)
		setActive(arg_26_0, false)
	end)
end

function var_0_0.ReplaceSpecialRoomIcon(arg_27_0)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in pairs(getProxy(ApartmentProxy):getRawData()) do
		for iter_27_2, iter_27_3 in ipairs(iter_27_1:getSpecialTalking()) do
			local var_27_1 = pg.dorm3d_dialogue_group[iter_27_3].trigger_config[1]

			if arg_27_0.roomDic[var_27_1] then
				var_27_0[var_27_1] = var_27_0[var_27_1] or {}

				table.insert(var_27_0[var_27_1], iter_27_3)
			end
		end
	end

	for iter_27_4, iter_27_5 in pairs(var_27_0) do
		setActive(arg_27_0.roomDic[iter_27_4], false)

		local var_27_2 = cloneTplTo(arg_27_0.roomDic[iter_27_4], arg_27_0.roomDic[iter_27_4].parent, arg_27_0.roomDic[iter_27_4].name .. "_special")

		arg_27_0:UpdateShowIcon(iter_27_4, var_27_2)
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(pg.dorm3d_rooms[iter_27_4].assets_prefix)), "", var_27_2:Find("icon"))
		setActive(var_27_2:Find("front/complete"), true)
		setActive(var_27_2:Find("front/complete/favor"), false)
		eachChild(var_27_2:Find("front/complete/tip"), function(arg_28_0)
			setActive(arg_28_0, arg_28_0.name == "main")
		end)
		table.sort(iter_27_5)

		local var_27_3 = iter_27_5[1]
		local var_27_4 = pg.dorm3d_dialogue_group[var_27_3]

		onButton(arg_27_0, var_27_2, function()
			arg_27_0:TryDownloadResource({
				click = true,
				roomId = var_27_4.room_id
			}, function()
				arg_27_0:emit(SelectDorm3DMediator.ON_DORM, {
					roomId = var_27_4.room_id,
					groupIds = {
						var_27_4.char_id
					},
					specialId = var_27_3
				})
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadUpdate(arg_31_0, arg_31_1, arg_31_2)
	switch(arg_31_2, {
		start = function()
			if arg_31_0.roomDic[arg_31_1] then
				arg_31_0:UpdateIconState(arg_31_1)
			end
		end,
		loading = function()
			if arg_31_0.roomDic[arg_31_1] then
				local var_33_0 = DormGroupConst.DormDownloadLock

				setSlider(arg_31_0.roomDic[arg_31_1]:Find("front/loading/progress"), 0, var_33_0.totalSize, var_33_0.curSize)
			end
		end,
		finish = function()
			for iter_34_0, iter_34_1 in pairs(arg_31_0.roomDic) do
				arg_31_0:UpdateIconState(iter_34_0)
			end

			arg_31_0:CheckGuide("DORM3D_GUIDE_02")
		end,
		delete = function()
			if arg_31_0.roomDic[arg_31_1] then
				arg_31_0:UpdateIconState(arg_31_1)
			end
		end
	})
end

function var_0_0.AfterRoomUnlock(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_1.roomId

	if isActive(arg_36_0.rtIconTip) then
		arg_36_0:HideIconTipWindow()
	end

	eachChild(arg_36_0.roomDic[var_36_0]:Find("icon/mask"), function(arg_37_0)
		setActive(arg_37_0, true)
	end)
	quickPlayAnimation(arg_36_0.roomDic[var_36_0], "anim_Dorm3d_selectDorm_icon_unlock")
	pg.UIMgr.GetInstance():LoadingOn(false)
	LeanTween.delayedCall(1.2333333333333334, System.Action(function()
		pg.UIMgr.GetInstance():LoadingOff(false)
		arg_36_0:UpdateIconState(var_36_0)
		arg_36_0:TryDownloadResource(arg_36_1)
		arg_36_0:CheckGuide("DORM3D_GUIDE_02")
		arg_36_0:SetMapSwitch()
	end))
end

function var_0_0.ShowIconTipWindow(arg_39_0, arg_39_1, arg_39_2)
	setLocalPosition(arg_39_0.rtIconTip:Find("window"), arg_39_0.rtIconTip:InverseTransformPoint(arg_39_2.position))
	removeAllChildren(arg_39_0.rtIconTip:Find("window/icon"))

	arg_39_2 = cloneTplTo(arg_39_2, arg_39_0.rtIconTip:Find("window/icon"))

	arg_39_0:UpdateShowIcon(arg_39_1, arg_39_2)
	setAnchoredPosition(arg_39_2, Vector2.zero)

	local var_39_0 = ApartmentRoom.New({
		id = arg_39_1
	})
	local var_39_1, var_39_2 = var_39_0:getDownloadNeedSize()

	setText(arg_39_0.rtIconTip:Find("window/Text"), i18n("dorm3d_role_assets_download", ShipGroup.getDefaultShipNameByGroupID(var_39_0:getPersonalGroupId()), var_39_0:needDownload() and var_39_2 or "0B"))
	onButton(arg_39_0, arg_39_0.rtIconTip:Find("window/btn_confirm"), function()
		arg_39_0:emit(SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM, arg_39_1)
	end, SFX_CONFIRM)
	setActive(arg_39_0.rtIconTip, true)
end

function var_0_0.HideIconTipWindow(arg_41_0)
	setActive(arg_41_0.rtIconTip, false)
end

function var_0_0.TryDownloadResource(arg_42_0, arg_42_1, arg_42_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_now_is_downloading"))

		return
	end

	local var_42_0 = getProxy(ApartmentProxy):getRoom(arg_42_1.roomId)
	local var_42_1 = var_42_0:getDownloadNameList()

	if #var_42_1 > 0 then
		local var_42_2 = {
			isShowBox = true,
			fileList = var_42_1,
			finishFunc = function(arg_43_0)
				if arg_43_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_resource_download_complete"))
				end
			end,
			roomId = var_42_0.configId
		}

		DormGroupConst.DormDownload(var_42_2)
	else
		existCall(arg_42_2)
	end
end

function var_0_0.InitResBar(arg_44_0)
	arg_44_0.goldMax = arg_44_0.rtRes:Find("gold/max"):GetComponent(typeof(Text))
	arg_44_0.goldValue = arg_44_0.rtRes:Find("gold/Text"):GetComponent(typeof(Text))
	arg_44_0.oilMax = arg_44_0.rtRes:Find("oil/max"):GetComponent(typeof(Text))
	arg_44_0.oilValue = arg_44_0.rtRes:Find("oil/Text"):GetComponent(typeof(Text))
	arg_44_0.gemValue = arg_44_0.rtRes:Find("gem/Text"):GetComponent(typeof(Text))

	onButton(arg_44_0, arg_44_0.rtRes:Find("gold"), function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_44_0, arg_44_0.rtRes:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_44_0, arg_44_0.rtRes:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	arg_44_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_48_0)
	local var_48_0 = getProxy(PlayerProxy):getRawData()

	PlayerResUI.StaticFlush(var_48_0, arg_48_0.goldMax, arg_48_0.goldValue, arg_48_0.oilMax, arg_48_0.oilValue, arg_48_0.gemValue)
end

function var_0_0.UpdateWeekTask(arg_49_0)
	local var_49_0 = getDorm3dGameset("drom3d_weekly_task")[1]
	local var_49_1 = getProxy(TaskProxy):getTaskVO(var_49_0)
	local var_49_2 = var_49_1:isReceive()
	local var_49_3 = var_49_2 and 3 or var_49_1:getProgress()
	local var_49_4 = arg_49_0.rtWeekTask:Find("content")

	for iter_49_0 = 1, 3 do
		triggerToggle(var_49_4:Find("tpl_" .. iter_49_0), iter_49_0 <= var_49_3)
	end

	local var_49_5 = Drop.Create(var_49_1:getConfig("award_display")[1])

	updateDorm3dIcon(var_49_4:Find("Dorm3dIconTpl"), var_49_5)
	onButton(arg_49_0, var_49_4:Find("Dorm3dIconTpl"), function()
		if not var_49_2 and var_49_1:isFinish() then
			arg_49_0:emit(SelectDorm3DMediator.ON_SUBMIT_TASK, var_49_0)
		else
			arg_49_0:emit(BaseUI.ON_NEW_DROP, {
				drop = var_49_5
			})
		end
	end, SFX_CONFIRM)
	setActive(var_49_4:Find("Dorm3dIconTpl/get"), not var_49_2 and var_49_1:isFinish())
	setGray(var_49_4:Find("Dorm3dIconTpl"), var_49_2)
	onButton(arg_49_0, arg_49_0._tf:Find("Main/task_done"), function()
		setActive(arg_49_0.rtWeekTask, true)
		setActive(arg_49_0._tf:Find("Main/task_done"), false)
	end)
	onButton(arg_49_0, arg_49_0.rtWeekTask:Find("title"), function()
		if var_49_2 then
			setActive(arg_49_0.rtWeekTask, false)
			setActive(arg_49_0._tf:Find("Main/task_done"), true)
		end
	end)
end

function var_0_0.CheckGuide(arg_53_0, arg_53_1)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_53_1) then
		return
	end

	return switch(arg_53_1, {
		DORM3D_GUIDE_02 = function()
			local var_54_0 = getProxy(ApartmentProxy):getApartment(20220)

			if var_54_0 and not var_54_0:needDownload() then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = arg_53_1
				})
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_53_1)))
				pg.NewGuideMgr.GetInstance():Play(arg_53_1, nil, function()
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_53_1)))
				end)

				return true
			end
		end,
		DORM3D_GUIDE_06 = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_53_1
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_53_1)))
			pg.NewGuideMgr.GetInstance():Play(arg_53_1, nil, function()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_53_1)))
			end)

			return true
		end
	}, function()
		return false
	end)
end

function var_0_0.SetMapSwitch(arg_59_0)
	local var_59_0 = getProxy(PlayerProxy):getRawData().id

	arg_59_0.selectedFloorId = PlayerPrefs.GetInt("DORM_SELECTED_FLOOR_ID" .. var_59_0, 1)

	if pg.NewGuideMgr.GetInstance():GetCurrentGuideName() == "DORM3D_GUIDE_01" then
		arg_59_0.selectedFloorId = 1
	elseif not DORM_LOCK_SELECT_NEW then
		local var_59_1 = pg.dorm3d_set.drom3d_new_room_remind.key_value_int

		if PlayerPrefs.GetInt("DORM_SELECTED_NEW_ROOM_FLOOR" .. var_59_0 .. var_59_1, 0) == 0 then
			arg_59_0.selectedFloorId = table.indexof(arg_59_0.floorData, pg.dorm3d_rooms[var_59_1].in_map)

			PlayerPrefs.SetInt("DORM_SELECTED_NEW_ROOM_FLOOR" .. var_59_0 .. var_59_1, 1)
		end
	end

	local var_59_2 = arg_59_0._tf:Find("interludeAni")
	local var_59_3 = var_59_2:GetComponent(typeof(Animation))
	local var_59_4 = var_59_2:GetComponent(typeof(DftAniEvent))

	onButton(arg_59_0, arg_59_0.rtMain:Find("btn_switch/left"), function()
		var_59_4:SetTriggerEvent(function()
			arg_59_0:ChangeMap(arg_59_0.selectedFloorId - 1)
		end)
		var_59_3:Play("anim_InterludeAni")
	end)
	onButton(arg_59_0, arg_59_0.rtMain:Find("btn_switch/right"), function()
		var_59_4:SetTriggerEvent(function()
			arg_59_0:ChangeMap(arg_59_0.selectedFloorId + 1)
		end)
		var_59_3:Play("anim_InterludeAni")
	end)
	setActive(arg_59_0.rtMain:Find("btn_switch/switchPanel"), false)

	local var_59_5 = arg_59_0.rtMain:Find("btn_switch/switchPanel"):GetComponent(typeof(Animation))

	arg_59_0.rtMain:Find("btn_switch/switchPanel"):GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		setActive(arg_59_0.rtMain:Find("btn_switch/switchPanel"), false)
	end)
	onButton(arg_59_0, arg_59_0.rtMain:Find("btn_switch/switch"), function()
		setActive(arg_59_0.rtMain:Find("btn_switch/switchPanel"), true)
	end)
	onButton(arg_59_0, arg_59_0.rtMain:Find("btn_switch/switchPanel"), function()
		var_59_5:Play("anim_switchPanel_exit")
	end)

	local var_59_6 = UIItemList.New(arg_59_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"), arg_59_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content/floor"))

	var_59_6:make(function(arg_67_0, arg_67_1, arg_67_2)
		if arg_67_0 == UIItemList.EventUpdate then
			local var_67_0 = arg_59_0.floorData[arg_67_1 + 1]
			local var_67_1 = Clone(pg.dorm3d_rooms.get_id_list_by_in_map[var_67_0])

			for iter_67_0 = #var_67_1, 1, -1 do
				if pg.dorm3d_rooms[var_67_1[iter_67_0]].is_common == 1 then
					table.remove(var_67_1, iter_67_0)
				end
			end

			setActive(arg_67_2:Find("select"), arg_67_1 + 1 == arg_59_0.selectedFloorId)
			setText(arg_67_2:Find("name"), i18n("dorm3d_room_" .. var_67_0))
			table.sort(var_67_1, CompareFuncs({
				function(arg_68_0)
					local var_68_0 = getProxy(ApartmentProxy):getRoom(arg_68_0)

					return (var_68_0 and var_68_0:getState() or "lock") == "complete" and 0 or 1
				end,
				function(arg_69_0)
					return pg.dorm3d_rooms[arg_69_0].type == 2 and 0 or 1
				end
			}))

			local var_67_2 = UIItemList.New(arg_67_2:Find("rooms"), arg_67_2:Find("rooms/room"))

			var_67_2:make(function(arg_70_0, arg_70_1, arg_70_2)
				if arg_70_0 == UIItemList.EventUpdate then
					local var_70_0 = var_67_1[arg_70_1 + 1]
					local var_70_1 = pg.dorm3d_rooms[var_70_0]
					local var_70_2 = getProxy(ApartmentProxy):getRoom(var_70_0)
					local var_70_3 = var_70_2 and var_70_2:getState() or "lock"

					setActive(arg_70_2:Find("lock"), var_70_3 ~= "complete")
					setActive(arg_70_2:Find("normal"), var_70_3 == "complete")

					if var_70_3 == "complete" then
						local var_70_4 = string.format("dorm3dselect/room_icon_%s", string.lower(var_70_1.assets_prefix))

						GetImageSpriteFromAtlasAsync(var_70_4, "", arg_70_2:Find("normal/mask/icon"), false)
					end

					setText(arg_70_2:Find("roomId"), var_70_0)
				end
			end)
			var_67_2:align(#var_67_1)
			onButton(arg_59_0, arg_67_2, function()
				var_59_4:SetTriggerEvent(function()
					arg_59_0:ChangeMap(arg_67_1 + 1)
				end)
				var_59_3:Play("anim_InterludeAni")
				var_59_5:Play("anim_switchPanel_exit")
			end, SFX_PANEL)
		end
	end)
	var_59_6:align(#arg_59_0.floorData)
	arg_59_0:ChangeMap(arg_59_0.selectedFloorId)
end

function var_0_0.ChangeMap(arg_73_0, arg_73_1)
	arg_73_0.selectedFloorId = arg_73_1

	local var_73_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("DORM_SELECTED_FLOOR_ID" .. var_73_0, arg_73_0.selectedFloorId)
	arg_73_0:SetFloor(arg_73_0.floorData[arg_73_0.selectedFloorId])
	setActive(arg_73_0.rtMain:Find("btn_switch/left"), arg_73_0.selectedFloorId > 1)
	setActive(arg_73_0.rtMain:Find("btn_switch/right"), arg_73_0.selectedFloorId < #arg_73_0.floorData)
	setText(arg_73_0.rtMain:Find("btn_switch/switch/currentName"), i18n("dorm3d_room_" .. arg_73_0.floorData[arg_73_0.selectedFloorId]))

	for iter_73_0 = 0, #arg_73_0.floorData - 1 do
		setActive(arg_73_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"):GetChild(iter_73_0):Find("select"), iter_73_0 + 1 == arg_73_1)
	end

	arg_73_0.floorTipFlag = {}
	arg_73_0.floorRoomTipFlag = {}

	for iter_73_1, iter_73_2 in ipairs(arg_73_0.floorData) do
		local var_73_1 = false
		local var_73_2 = {}
		local var_73_3 = pg.dorm3d_rooms.get_id_list_by_in_map[iter_73_2]

		for iter_73_3, iter_73_4 in ipairs(var_73_3) do
			if pg.dorm3d_rooms[iter_73_4].is_common == 0 then
				var_73_2[iter_73_4] = false

				local var_73_4 = getProxy(ApartmentProxy):getRoom(iter_73_4)
				local var_73_5 = var_73_4 and var_73_4:getState() or "lock"

				if var_73_5 == "complete" and var_73_4:isPersonalRoom() and getProxy(ApartmentProxy):getApartment(var_73_4:getPersonalGroupId()):getIconTip(var_73_4:GetConfigID()) then
					var_73_1 = true
					var_73_2[iter_73_4] = true
				end

				if var_73_5 == "complete" and not var_73_4:isPersonalRoom() then
					var_73_2[iter_73_4] = PlayerPrefs.GetInt(var_73_0 .. "_dorm3dRoomInviteSuccess_" .. iter_73_4, 1) == 0
				end
			end
		end

		table.insert(arg_73_0.floorTipFlag, var_73_1)
		table.insert(arg_73_0.floorRoomTipFlag, var_73_2)
	end

	if arg_73_0.selectedFloorId > 1 then
		setActive(arg_73_0.rtMain:Find("btn_switch/left/tip"), arg_73_0.floorTipFlag[arg_73_0.selectedFloorId - 1])
	end

	if arg_73_0.selectedFloorId < #arg_73_0.floorData then
		setActive(arg_73_0.rtMain:Find("btn_switch/right/tip"), arg_73_0.floorTipFlag[arg_73_0.selectedFloorId + 1])
	end

	setActive(arg_73_0.rtMain:Find("btn_switch/switch/tip"), table.contains(arg_73_0.floorTipFlag, true))

	for iter_73_5 = 0, arg_73_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content").childCount - 1 do
		local var_73_6 = arg_73_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"):GetChild(iter_73_5)

		for iter_73_6 = 0, var_73_6:Find("rooms").childCount - 1 do
			local var_73_7 = var_73_6:Find("rooms"):GetChild(iter_73_6)
			local var_73_8 = var_73_7:Find("roomId"):GetComponent(typeof(Text)).text

			setActive(var_73_7:Find("normal/tip"), arg_73_0.floorRoomTipFlag[iter_73_5 + 1][tonumber(var_73_8)])
		end
	end
end

function var_0_0.onBackPressed(arg_74_0)
	if isActive(arg_74_0.rtIconTip) then
		arg_74_0:HideIconTipWindow()
	else
		var_0_0.super.onBackPressed(arg_74_0)
	end
end

function var_0_0.willExit(arg_75_0)
	if isActive(arg_75_0.rtIconTip) then
		arg_75_0:HideIconTipWindow()
	end

	if arg_75_0.clearSceneCache then
		-- block empty
	end
end

return var_0_0
