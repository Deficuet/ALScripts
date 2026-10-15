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
	arg_14_0:SetFloor(arg_14_0.floorData[arg_14_0.selectedFloorId])
	arg_14_0:UpdateStamina()
	arg_14_0:CheckGuide("DORM3D_GUIDE_02")
	arg_14_0:FlushInsBtn()

	if not ApartmentProxy.CheckDeviceRAMEnough() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("drom3d_memory_limit_tip"))
	end
end

function var_0_0.FlushInsBtn(arg_15_0)
	arg_15_0.insBtn:Flush()
end

function var_0_0.UpdateStamina(arg_16_0)
	setText(arg_16_0.rtStamina:Find("Text"), string.format("%d/%d", getProxy(ApartmentProxy):getStamina()))
	setActive(arg_16_0.rtStamina:Find("vfx_ui_stamina01"), getProxy(ApartmentProxy):getStamina() > 0)
end

function var_0_0.SetFloor(arg_17_0, arg_17_1)
	local var_17_0

	eachChild(arg_17_0.rtMap, function(arg_18_0)
		setActive(arg_18_0, arg_18_0.name == arg_17_1)

		if arg_18_0.name == arg_17_1 then
			var_17_0 = arg_18_0
		end
	end)
	assert(var_17_0)

	arg_17_0.roomDic = {}

	for iter_17_0, iter_17_1 in ipairs(pg.dorm3d_rooms.get_id_list_by_in_map[arg_17_1]) do
		arg_17_0.roomDic[iter_17_1] = var_17_0:Find(pg.dorm3d_rooms[iter_17_1].assets_prefix)

		arg_17_0:InitIconTrigger(iter_17_1)
		arg_17_0:UpdateIconState(iter_17_1)
	end

	arg_17_0:ReplaceSpecialRoomIcon()
end

function var_0_0.FlushFloor(arg_19_0)
	arg_19_0:SetFloor(arg_19_0.floorData[arg_19_0.selectedFloorId])
end

function var_0_0.InitIconTrigger(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.roomDic[arg_20_1]
	local var_20_1 = pg.dorm3d_rooms[arg_20_1].assets_prefix

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(var_20_1)), "", var_20_0:Find("icon"))
	onButton(arg_20_0, var_20_0, function()
		if BLOCK_DORM3D_ROOMS and table.contains(BLOCK_DORM3D_ROOMS, arg_20_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_system_switch"))

			return
		end

		if arg_20_1 ~= 1 and (not getProxy(ApartmentProxy):getRoom(1) or not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_02")) and not DORM_LOCK_GUIDE then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip"))

			return
		end

		local var_21_0 = getProxy(ApartmentProxy):getRoom(arg_20_1)
		local var_21_1 = pg.dorm3d_rooms[arg_20_1].type

		if var_21_1 == 1 then
			if arg_20_1 ~= 4 and not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_06") and not DORM_LOCK_GUIDE then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip2"))

				return
			end

			if not var_21_0 then
				arg_20_0:emit(SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_20_1)
			else
				arg_20_0:TryDownloadResource({
					click = true,
					roomId = arg_20_1
				}, function()
					local var_22_0 = ApartmentProxy.GetRoomInviteList(arg_20_1)

					if arg_20_0:CheckGuide("DORM3D_GUIDE_06") then
						var_22_0 = {}
					end

					arg_20_0:emit(SelectDorm3DMediator.OPEN_INVITE_LAYER, arg_20_1, var_22_0, function()
						arg_20_0:FlushFloor()
					end)
				end)
			end
		elseif var_21_1 == 2 then
			if not var_21_0 then
				arg_20_0:ShowIconTipWindow(arg_20_1, var_20_0)
			else
				arg_20_0:TryDownloadResource({
					click = true,
					roomId = arg_20_1
				}, function()
					arg_20_0:emit(SelectDorm3DMediator.ON_DORM, {
						roomId = var_21_0.id,
						groupIds = var_21_0:getInviteList()
					})
				end)
			end
		else
			assert(false)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateIconState(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.roomDic[arg_25_1]
	local var_25_1 = getProxy(ApartmentProxy):getRoom(arg_25_1)
	local var_25_2 = var_25_1 and var_25_1:getState() or "lock"

	setActive(var_25_0:Find("icon/mask"), var_25_2 ~= "complete")
	eachChild(var_25_0:Find("front"), function(arg_26_0)
		setActive(arg_26_0, arg_26_0.name == var_25_2)
	end)
	switch(var_25_2, {
		loading = function()
			local var_27_0 = DormGroupConst.DormDownloadLock

			setSlider(var_25_0:Find("front/loading/progress"), 0, var_27_0.totalSize, var_27_0.curSize)
		end,
		complete = function()
			local var_28_0 = var_25_0:Find("front/complete")
			local var_28_1 = var_25_1:isPersonalRoom()

			setActive(var_28_0, var_28_1)

			if var_28_1 then
				local var_28_2 = getProxy(ApartmentProxy):getApartment(var_25_1:getPersonalGroupId())
				local var_28_3 = var_28_2:getIconTip(var_25_1:GetConfigID())

				eachChild(var_28_0:Find("tip"), function(arg_29_0)
					setActive(arg_29_0, arg_29_0.name == var_28_3)
				end)
				setText(var_28_0:Find("favor/Text"), var_28_2.level)
			end
		end
	})

	local var_25_3 = getProxy(PlayerProxy):getRawData().id

	if arg_25_1 == 4 then
		setActive(var_25_0:Find("inivite_tip"), PlayerPrefs.GetInt(var_25_3 .. "_dorm3dRoomInviteSuccess_" .. arg_25_1, 1) == 0)
	end

	local function var_25_4()
		if not var_25_1 or not var_25_1:isPersonalRoom() then
			return false
		end

		return getProxy(ApartmentProxy):HasShipGroupGiftExpireSoon(var_25_1:getConfig("character")[1])
	end

	setActive(var_25_0:Find("tip"), var_25_4())
end

function var_0_0.UpdateShowIcon(arg_31_0, arg_31_1, arg_31_2)
	removeOnButton(arg_31_2)
	setActive(arg_31_2:Find("icon/mask"), false)
	eachChild(arg_31_2:Find("front"), function(arg_32_0)
		setActive(arg_32_0, false)
	end)
end

function var_0_0.ReplaceSpecialRoomIcon(arg_33_0)
	local var_33_0 = {}

	for iter_33_0, iter_33_1 in pairs(getProxy(ApartmentProxy):getRawData()) do
		for iter_33_2, iter_33_3 in ipairs(iter_33_1:getSpecialTalking()) do
			local var_33_1 = pg.dorm3d_dialogue_group[iter_33_3].trigger_config[1]

			if arg_33_0.roomDic[var_33_1] then
				var_33_0[var_33_1] = var_33_0[var_33_1] or {}

				table.insert(var_33_0[var_33_1], iter_33_3)
			end
		end
	end

	for iter_33_4, iter_33_5 in pairs(var_33_0) do
		setActive(arg_33_0.roomDic[iter_33_4], false)

		local var_33_2 = cloneTplTo(arg_33_0.roomDic[iter_33_4], arg_33_0.roomDic[iter_33_4].parent, arg_33_0.roomDic[iter_33_4].name .. "_special")

		arg_33_0:UpdateShowIcon(iter_33_4, var_33_2)
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(pg.dorm3d_rooms[iter_33_4].assets_prefix)), "", var_33_2:Find("icon"))
		setActive(var_33_2:Find("front/complete"), true)
		setActive(var_33_2:Find("front/complete/favor"), false)
		eachChild(var_33_2:Find("front/complete/tip"), function(arg_34_0)
			setActive(arg_34_0, arg_34_0.name == "main")
		end)
		table.sort(iter_33_5)

		local var_33_3 = iter_33_5[1]
		local var_33_4 = pg.dorm3d_dialogue_group[var_33_3]

		if DORM_LOCK_GUIDE and var_33_3 == 10010 then
			return
		end

		onButton(arg_33_0, var_33_2, function()
			arg_33_0:TryDownloadResource({
				click = true,
				roomId = var_33_4.room_id
			}, function()
				arg_33_0:emit(SelectDorm3DMediator.ON_DORM, {
					roomId = var_33_4.room_id,
					groupIds = {
						var_33_4.char_id
					},
					specialId = var_33_3
				})
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadUpdate(arg_37_0, arg_37_1, arg_37_2)
	switch(arg_37_2, {
		start = function()
			if arg_37_0.roomDic[arg_37_1] then
				arg_37_0:UpdateIconState(arg_37_1)
			end
		end,
		loading = function()
			if arg_37_0.roomDic[arg_37_1] then
				local var_39_0 = DormGroupConst.DormDownloadLock

				setSlider(arg_37_0.roomDic[arg_37_1]:Find("front/loading/progress"), 0, var_39_0.totalSize, var_39_0.curSize)
			end
		end,
		finish = function()
			for iter_40_0, iter_40_1 in pairs(arg_37_0.roomDic) do
				arg_37_0:UpdateIconState(iter_40_0)
			end

			arg_37_0:CheckGuide("DORM3D_GUIDE_02")
		end,
		delete = function()
			if arg_37_0.roomDic[arg_37_1] then
				arg_37_0:UpdateIconState(arg_37_1)
			end
		end
	})
end

function var_0_0.AfterRoomUnlock(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_1.roomId

	if isActive(arg_42_0.rtIconTip) then
		arg_42_0:HideIconTipWindow()
	end

	eachChild(arg_42_0.roomDic[var_42_0]:Find("icon/mask"), function(arg_43_0)
		setActive(arg_43_0, true)
	end)
	quickPlayAnimation(arg_42_0.roomDic[var_42_0], "anim_Dorm3d_selectDorm_icon_unlock")
	pg.UIMgr.GetInstance():LoadingOn(false)
	LeanTween.delayedCall(1.2333333333333334, System.Action(function()
		pg.UIMgr.GetInstance():LoadingOff(false)
		arg_42_0:UpdateIconState(var_42_0)
		arg_42_0:TryDownloadResource(arg_42_1)
		arg_42_0:CheckGuide("DORM3D_GUIDE_02")
		arg_42_0:SetMapSwitch()
	end))
end

function var_0_0.ShowIconTipWindow(arg_45_0, arg_45_1, arg_45_2)
	setLocalPosition(arg_45_0.rtIconTip:Find("window"), arg_45_0.rtIconTip:InverseTransformPoint(arg_45_2.position))
	removeAllChildren(arg_45_0.rtIconTip:Find("window/icon"))

	arg_45_2 = cloneTplTo(arg_45_2, arg_45_0.rtIconTip:Find("window/icon"))

	arg_45_0:UpdateShowIcon(arg_45_1, arg_45_2)
	setAnchoredPosition(arg_45_2, Vector2.zero)

	local var_45_0 = ApartmentRoom.New({
		id = arg_45_1
	})
	local var_45_1, var_45_2 = var_45_0:getDownloadNeedSize()

	setText(arg_45_0.rtIconTip:Find("window/Text"), i18n("dorm3d_role_assets_download", ShipGroup.getDefaultShipNameByGroupID(var_45_0:getPersonalGroupId()), var_45_0:needDownload() and var_45_2 or "0B"))
	onButton(arg_45_0, arg_45_0.rtIconTip:Find("window/btn_confirm"), function()
		arg_45_0:emit(SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM, arg_45_1)
	end, SFX_CONFIRM)
	setActive(arg_45_0.rtIconTip, true)
end

function var_0_0.HideIconTipWindow(arg_47_0)
	setActive(arg_47_0.rtIconTip, false)
end

function var_0_0.TryDownloadResource(arg_48_0, arg_48_1, arg_48_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_now_is_downloading"))

		return
	end

	local var_48_0 = getProxy(ApartmentProxy):getRoom(arg_48_1.roomId)
	local var_48_1 = var_48_0:getDownloadNameList()

	if #var_48_1 > 0 then
		local var_48_2 = {
			isShowBox = true,
			fileList = var_48_1,
			finishFunc = function(arg_49_0)
				if arg_49_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_resource_download_complete"))
				end
			end,
			roomId = var_48_0.configId
		}

		DormGroupConst.DormDownload(var_48_2)
	else
		existCall(arg_48_2)
	end
end

function var_0_0.InitResBar(arg_50_0)
	arg_50_0.goldMax = arg_50_0.rtRes:Find("gold/max"):GetComponent(typeof(Text))
	arg_50_0.goldValue = arg_50_0.rtRes:Find("gold/Text"):GetComponent(typeof(Text))
	arg_50_0.oilMax = arg_50_0.rtRes:Find("oil/max"):GetComponent(typeof(Text))
	arg_50_0.oilValue = arg_50_0.rtRes:Find("oil/Text"):GetComponent(typeof(Text))
	arg_50_0.gemValue = arg_50_0.rtRes:Find("gem/Text"):GetComponent(typeof(Text))

	onButton(arg_50_0, arg_50_0.rtRes:Find("gold"), function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_50_0, arg_50_0.rtRes:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_50_0, arg_50_0.rtRes:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	arg_50_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_54_0)
	local var_54_0 = getProxy(PlayerProxy):getRawData()

	PlayerResUI.StaticFlush(var_54_0, arg_54_0.goldMax, arg_54_0.goldValue, arg_54_0.oilMax, arg_54_0.oilValue, arg_54_0.gemValue)
end

function var_0_0.UpdateWeekTask(arg_55_0)
	local var_55_0 = getDorm3dGameset("drom3d_weekly_task")[1]
	local var_55_1 = getProxy(TaskProxy):getTaskVO(var_55_0)
	local var_55_2 = var_55_1:isReceive()
	local var_55_3 = var_55_2 and 3 or var_55_1:getProgress()
	local var_55_4 = arg_55_0.rtWeekTask:Find("content")

	for iter_55_0 = 1, 3 do
		triggerToggle(var_55_4:Find("tpl_" .. iter_55_0), iter_55_0 <= var_55_3)
	end

	local var_55_5 = Drop.Create(var_55_1:getConfig("award_display")[1])

	updateCustomDrop(var_55_4:Find("Dorm3dIconTpl"), var_55_5)
	onButton(arg_55_0, var_55_4:Find("Dorm3dIconTpl"), function()
		if not var_55_2 and var_55_1:isFinish() then
			arg_55_0:emit(SelectDorm3DMediator.ON_SUBMIT_TASK, var_55_0)
		else
			arg_55_0:emit(BaseUI.ON_NEW_DROP, {
				drop = var_55_5
			})
		end
	end, SFX_CONFIRM)
	setActive(var_55_4:Find("Dorm3dIconTpl/get"), not var_55_2 and var_55_1:isFinish())
	setGray(var_55_4:Find("Dorm3dIconTpl"), var_55_2)
	onButton(arg_55_0, arg_55_0._tf:Find("Main/task_done"), function()
		setActive(arg_55_0.rtWeekTask, true)
		setActive(arg_55_0._tf:Find("Main/task_done"), false)
	end)
	onButton(arg_55_0, arg_55_0.rtWeekTask:Find("title"), function()
		if var_55_2 then
			setActive(arg_55_0.rtWeekTask, false)
			setActive(arg_55_0._tf:Find("Main/task_done"), true)
		end
	end)
end

function var_0_0.CheckGuide(arg_59_0, arg_59_1)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_59_1) then
		return
	end

	if DORM_LOCK_GUIDE then
		return false
	end

	return switch(arg_59_1, {
		DORM3D_GUIDE_02 = function()
			local var_60_0 = getProxy(ApartmentProxy):getApartment(20220)

			if var_60_0 and not var_60_0:needDownload() then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = arg_59_1
				})
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_59_1)))
				pg.NewGuideMgr.GetInstance():Play(arg_59_1, nil, function()
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_59_1)))
				end)

				return true
			end
		end,
		DORM3D_GUIDE_06 = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_59_1
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_59_1)))
			pg.NewGuideMgr.GetInstance():Play(arg_59_1, nil, function()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_59_1)))
			end)

			return true
		end
	}, function()
		return false
	end)
end

function var_0_0.SetMapSwitch(arg_65_0)
	local var_65_0 = getProxy(PlayerProxy):getRawData().id

	arg_65_0.selectedFloorId = PlayerPrefs.GetInt("DORM_SELECTED_FLOOR_ID" .. var_65_0, 1)

	if pg.NewGuideMgr.GetInstance():GetCurrentGuideName() == "DORM3D_GUIDE_01" then
		arg_65_0.selectedFloorId = 1
	elseif not DORM_LOCK_SELECT_NEW then
		local var_65_1 = pg.dorm3d_set.drom3d_new_room_remind.key_value_int

		if PlayerPrefs.GetInt("DORM_SELECTED_NEW_ROOM_FLOOR" .. var_65_0 .. var_65_1, 0) == 0 then
			arg_65_0.selectedFloorId = table.indexof(arg_65_0.floorData, pg.dorm3d_rooms[var_65_1].in_map)

			PlayerPrefs.SetInt("DORM_SELECTED_NEW_ROOM_FLOOR" .. var_65_0 .. var_65_1, 1)
		end
	end

	local var_65_2 = arg_65_0._tf:Find("interludeAni")
	local var_65_3 = var_65_2:GetComponent(typeof(Animation))
	local var_65_4 = var_65_2:GetComponent(typeof(DftAniEvent))

	onButton(arg_65_0, arg_65_0.rtMain:Find("btn_switch/left"), function()
		var_65_4:SetTriggerEvent(function()
			arg_65_0:ChangeMap(arg_65_0.selectedFloorId - 1)
		end)
		var_65_3:Play("anim_InterludeAni")
	end)
	onButton(arg_65_0, arg_65_0.rtMain:Find("btn_switch/right"), function()
		var_65_4:SetTriggerEvent(function()
			arg_65_0:ChangeMap(arg_65_0.selectedFloorId + 1)
		end)
		var_65_3:Play("anim_InterludeAni")
	end)
	setActive(arg_65_0.rtMain:Find("btn_switch/switchPanel"), false)

	local var_65_5 = arg_65_0.rtMain:Find("btn_switch/switchPanel"):GetComponent(typeof(Animation))

	arg_65_0.rtMain:Find("btn_switch/switchPanel"):GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		setActive(arg_65_0.rtMain:Find("btn_switch/switchPanel"), false)
	end)
	onButton(arg_65_0, arg_65_0.rtMain:Find("btn_switch/switch"), function()
		setActive(arg_65_0.rtMain:Find("btn_switch/switchPanel"), true)
	end)
	onButton(arg_65_0, arg_65_0.rtMain:Find("btn_switch/switchPanel"), function()
		var_65_5:Play("anim_switchPanel_exit")
	end)

	local var_65_6 = UIItemList.New(arg_65_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"), arg_65_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content/floor"))

	var_65_6:make(function(arg_73_0, arg_73_1, arg_73_2)
		if arg_73_0 == UIItemList.EventUpdate then
			local var_73_0 = arg_65_0.floorData[arg_73_1 + 1]
			local var_73_1 = Clone(pg.dorm3d_rooms.get_id_list_by_in_map[var_73_0])

			for iter_73_0 = #var_73_1, 1, -1 do
				if pg.dorm3d_rooms[var_73_1[iter_73_0]].is_common == 1 then
					table.remove(var_73_1, iter_73_0)
				end
			end

			setActive(arg_73_2:Find("select"), arg_73_1 + 1 == arg_65_0.selectedFloorId)
			setText(arg_73_2:Find("name"), i18n("dorm3d_room_" .. var_73_0))
			table.sort(var_73_1, CompareFuncs({
				function(arg_74_0)
					local var_74_0 = getProxy(ApartmentProxy):getRoom(arg_74_0)

					return (var_74_0 and var_74_0:getState() or "lock") == "complete" and 0 or 1
				end,
				function(arg_75_0)
					return pg.dorm3d_rooms[arg_75_0].type == 2 and 0 or 1
				end
			}))

			local var_73_2 = UIItemList.New(arg_73_2:Find("rooms"), arg_73_2:Find("rooms/room"))

			var_73_2:make(function(arg_76_0, arg_76_1, arg_76_2)
				if arg_76_0 == UIItemList.EventUpdate then
					local var_76_0 = var_73_1[arg_76_1 + 1]
					local var_76_1 = pg.dorm3d_rooms[var_76_0]
					local var_76_2 = getProxy(ApartmentProxy):getRoom(var_76_0)
					local var_76_3 = var_76_2 and var_76_2:getState() or "lock"

					setActive(arg_76_2:Find("lock"), var_76_3 ~= "complete")

					local var_76_4 = string.format("dorm3dselect/room_icon_%s", string.lower(var_76_1.assets_prefix))

					GetImageSpriteFromAtlasAsync(var_76_4, "", arg_76_2:Find("normal/mask/icon"), false)
					setText(arg_76_2:Find("roomId"), var_76_0)
				end
			end)
			var_73_2:align(#var_73_1)
			onButton(arg_65_0, arg_73_2, function()
				var_65_4:SetTriggerEvent(function()
					arg_65_0:ChangeMap(arg_73_1 + 1)
				end)
				var_65_3:Play("anim_InterludeAni")
				var_65_5:Play("anim_switchPanel_exit")
			end, SFX_PANEL)
		end
	end)
	var_65_6:align(#arg_65_0.floorData)
	arg_65_0:ChangeMap(arg_65_0.selectedFloorId)
end

function var_0_0.ChangeMap(arg_79_0, arg_79_1)
	arg_79_0.selectedFloorId = arg_79_1

	local var_79_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("DORM_SELECTED_FLOOR_ID" .. var_79_0, arg_79_0.selectedFloorId)
	arg_79_0:SetFloor(arg_79_0.floorData[arg_79_0.selectedFloorId])
	setActive(arg_79_0.rtMain:Find("btn_switch/left"), arg_79_0.selectedFloorId > 1)
	setActive(arg_79_0.rtMain:Find("btn_switch/right"), arg_79_0.selectedFloorId < #arg_79_0.floorData)
	setText(arg_79_0.rtMain:Find("btn_switch/switch/currentName"), i18n("dorm3d_room_" .. arg_79_0.floorData[arg_79_0.selectedFloorId]))

	for iter_79_0 = 0, #arg_79_0.floorData - 1 do
		setActive(arg_79_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"):GetChild(iter_79_0):Find("select"), iter_79_0 + 1 == arg_79_1)
	end

	arg_79_0.floorTipFlag = {}
	arg_79_0.floorRoomTipFlag = {}

	for iter_79_1, iter_79_2 in ipairs(arg_79_0.floorData) do
		local var_79_1 = false
		local var_79_2 = {}
		local var_79_3 = pg.dorm3d_rooms.get_id_list_by_in_map[iter_79_2]

		for iter_79_3, iter_79_4 in ipairs(var_79_3) do
			if pg.dorm3d_rooms[iter_79_4].is_common == 0 then
				var_79_2[iter_79_4] = false

				local var_79_4 = getProxy(ApartmentProxy):getRoom(iter_79_4)
				local var_79_5 = var_79_4 and var_79_4:getState() or "lock"

				if var_79_5 == "complete" and var_79_4:isPersonalRoom() and getProxy(ApartmentProxy):getApartment(var_79_4:getPersonalGroupId()):getIconTip(var_79_4:GetConfigID()) then
					var_79_1 = true
					var_79_2[iter_79_4] = true
				end

				if var_79_5 == "complete" and not var_79_4:isPersonalRoom() then
					var_79_2[iter_79_4] = PlayerPrefs.GetInt(var_79_0 .. "_dorm3dRoomInviteSuccess_" .. iter_79_4, 1) == 0
				end
			end
		end

		table.insert(arg_79_0.floorTipFlag, var_79_1)
		table.insert(arg_79_0.floorRoomTipFlag, var_79_2)
	end

	if arg_79_0.selectedFloorId > 1 then
		setActive(arg_79_0.rtMain:Find("btn_switch/left/tip"), arg_79_0.floorTipFlag[arg_79_0.selectedFloorId - 1])
	end

	if arg_79_0.selectedFloorId < #arg_79_0.floorData then
		setActive(arg_79_0.rtMain:Find("btn_switch/right/tip"), arg_79_0.floorTipFlag[arg_79_0.selectedFloorId + 1])
	end

	setActive(arg_79_0.rtMain:Find("btn_switch/switch/tip"), table.contains(arg_79_0.floorTipFlag, true))

	for iter_79_5 = 0, arg_79_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content").childCount - 1 do
		local var_79_6 = arg_79_0.rtMain:Find("btn_switch/switchPanel/switchScrollView/Viewport/Content"):GetChild(iter_79_5)

		for iter_79_6 = 0, var_79_6:Find("rooms").childCount - 1 do
			local var_79_7 = var_79_6:Find("rooms"):GetChild(iter_79_6)
			local var_79_8 = var_79_7:Find("roomId"):GetComponent(typeof(Text)).text

			setActive(var_79_7:Find("normal/tip"), arg_79_0.floorRoomTipFlag[iter_79_5 + 1][tonumber(var_79_8)])
		end
	end
end

function var_0_0.onBackPressed(arg_80_0)
	if isActive(arg_80_0.rtIconTip) then
		arg_80_0:HideIconTipWindow()
	else
		var_0_0.super.onBackPressed(arg_80_0)
	end
end

function var_0_0.willExit(arg_81_0)
	if isActive(arg_81_0.rtIconTip) then
		arg_81_0:HideIconTipWindow()
	end

	if arg_81_0.clearSceneCache then
		-- block empty
	end
end

return var_0_0
