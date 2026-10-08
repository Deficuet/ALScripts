local var_0_0 = class("MainLiveAreaPage", import("view.base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0:bind(NewMainScene.UPDATE_COVER, function(arg_2_0)
		arg_1_0:ExecuteAction("UpdateCover")
	end)
end

function var_0_0.getResource(arg_3_0)
	local var_3_0 = {}
	local var_3_1 = getProxy(LivingAreaCoverProxy):GetCurCover()

	table.insert(var_3_0, var_3_1:GetBg(LivingAreaCover.TYPE_DAY))
	table.insert(var_3_0, var_3_1:GetBg(LivingAreaCover.TYPE_NIGHT))

	return table.insertto(var_3_0, var_0_0.super.getResource(arg_3_0))
end

function var_0_0.getUIName(arg_4_0)
	return "MainLiveAreaUI"
end

function var_0_0.OnLoaded(arg_5_0)
	arg_5_0._bg = arg_5_0._tf:Find("bg")

	setText(arg_5_0._bg:Find("day/Text"), i18n("word_harbour"))
	setText(arg_5_0._bg:Find("night/Text"), i18n("word_harbour"))

	arg_5_0.timeCfg = pg.gameset.main_live_area_time.description
	arg_5_0._coverBtn = arg_5_0._tf:Find("cover_btn")
	arg_5_0._academyBtn = arg_5_0._tf:Find("school_btn")
	arg_5_0._haremBtn = arg_5_0._tf:Find("backyard_btn")
	arg_5_0._commanderBtn = arg_5_0._tf:Find("commander_btn")
	arg_5_0._educateBtn = arg_5_0._tf:Find("educate_btn")
	arg_5_0._islandBtn = arg_5_0._tf:Find("island_btn")
	arg_5_0.islandAwardTF = arg_5_0._islandBtn:Find("banners/award")

	setText(arg_5_0.islandAwardTF:Find("Text"), i18n("island_post_acceptable"))

	arg_5_0.islandEmptyTF = arg_5_0._islandBtn:Find("banners/empty")

	setText(arg_5_0.islandEmptyTF:Find("Text"), i18n("island_post_vacant"))

	arg_5_0._dormBtn = arg_5_0._tf:Find("dorm_btn")
	arg_5_0._islandBtnEffect = arg_5_0._islandBtn:Find("VX")
	arg_5_0.coverPage = LivingAreaCoverPage.New(arg_5_0._tf, arg_5_0.event, {
		onHide = function()
			arg_5_0:UpdateCoverTip()
		end,
		onSelected = function(arg_7_0)
			arg_5_0:UpdateCoverTemp(arg_7_0)
		end
	})

	local var_5_0 = pg.EasyRedDotMgr.GetInstance()

	arg_5_0.redDotUIList = {
		arg_5_0._haremBtn:Find("tip"),
		arg_5_0._academyBtn:Find("tip"),
		arg_5_0._commanderBtn:Find("tip")
	}

	var_5_0:RegisterRedDot(arg_5_0.redDotUIList[1], {
		"COURTYARD"
	}, function(arg_8_0)
		setActive(arg_8_0, getProxy(DormProxy):IsShowRedDot())
	end)
	var_5_0:RegisterRedDot(arg_5_0.redDotUIList[2], {
		"SCHOOL"
	}, function(arg_9_0)
		setActive(arg_9_0, getProxy(NavalAcademyProxy):IsShowTip())
	end)
	var_5_0:RegisterRedDot(arg_5_0.redDotUIList[3], {
		"COMMANDER"
	}, function(arg_10_0)
		if getProxy(PlayerProxy):getRawData().level < 40 then
			setActive(arg_10_0, false)

			return
		end

		local var_10_0 = getProxy(CommanderProxy):IsFinishAllBox()

		if not LOCK_CATTERY then
			setActive(arg_10_0, var_10_0 or getProxy(CommanderProxy):AnyCatteryExistOP() or getProxy(CommanderProxy):AnyCatteryCanUse())
		else
			setActive(arg_10_0, var_10_0)
		end
	end)
end

function var_0_0.OnInit(arg_11_0)
	arg_11_0.mediator = MainLiveAreaPageMediator.New()

	onButton(arg_11_0, arg_11_0._coverBtn, function()
		arg_11_0.coverPage:ExecuteAction("Show")
	end, SFX_MAIN)
	onButton(arg_11_0, arg_11_0._commanderBtn, function()
		arg_11_0.mediator:GoScene(SCENE.COMMANDERCAT, {
			fromMain = true,
			fleetType = CommanderCatScene.FLEET_TYPE_COMMON
		})
		arg_11_0:Hide()
	end, SFX_MAIN)
	onButton(arg_11_0, arg_11_0._haremBtn, function()
		arg_11_0.mediator:GoScene(SCENE.COURTYARD)
	end, SFX_MAIN)
	onButton(arg_11_0, arg_11_0._academyBtn, function()
		arg_11_0.mediator:GoScene(SCENE.NAVALACADEMYSCENE)
		arg_11_0:Hide()
	end, SFX_MAIN)
	onButton(arg_11_0, arg_11_0._educateBtn, function()
		if LOCK_EDUCATE_SYSTEM then
			return
		end

		if LOCK_NEW_EDUCATE_SYSTEM then
			arg_11_0.mediator:GoScene(SCENE.EDUCATE, {
				isMainEnter = true
			})
		else
			arg_11_0.mediator:GoScene(SCENE.NEW_EDUCATE_SELECT)
		end

		arg_11_0:Hide()
	end, SFX_MAIN)
	onButton(arg_11_0, arg_11_0._islandBtn, function()
		if LOCK_ISLAND_DISPLAY then
			return
		end

		local var_17_0 = {}
		local var_17_1 = "MAP"

		if Application.isEditor or GroupHelper.IsGroupVerLastest(var_17_1) or not GroupHelper.IsGroupWaitToUpdate(var_17_1) then
			-- block empty
		else
			local var_17_2 = GroupHelper.GetGroupSize(var_17_1)
			local var_17_3 = HashUtil.BytesToString(var_17_2)

			if var_17_2 > 0 then
				table.insert(var_17_0, function(arg_18_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						modal = true,
						locked = true,
						type = MSGBOX_TYPE_FILE_DOWNLOAD,
						content = string.format(i18n("group_download_tip", var_17_3)),
						onYes = arg_18_0
					})
				end)
			end

			table.insert(var_17_0, function(arg_19_0)
				local var_19_0 = {}
				local var_19_1 = GroupHelper.GetGroupMgrByName(var_17_1)

				if var_19_1.toUpdate then
					local var_19_2 = var_19_1.toUpdate.Count

					for iter_19_0 = 0, var_19_2 - 1 do
						local var_19_3 = var_19_1.toUpdate[iter_19_0][0]

						table.insert(var_19_0, var_19_3)
					end
				end

				local var_19_4 = {
					groupName = var_17_1,
					fileNameList = var_19_0
				}
				local var_19_5 = {
					dataList = {
						var_19_4
					},
					onFinish = arg_19_0
				}

				pg.FileDownloadMgr.GetInstance():Main(var_19_5)
			end)
		end

		local var_17_4 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d", true)

		if not LOCK_ISLAND_ENTER_TIP_WINDOW and PlayerPrefs.GetString("ISLAND_ENTER_TIP_WINDOW", "") ~= var_17_4 then
			table.insert(var_17_0, function(arg_20_0)
				local function var_20_0()
					if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
						PlayerPrefs.SetString("ISLAND_ENTER_TIP_WINDOW", var_17_4)
					end

					arg_20_0()
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					toggleStatus = true,
					showStopRemind = true,
					type = MSGBOX_TYPE_HELP,
					helps = i18n("island_urgent_notice"),
					onYes = var_20_0,
					onNo = var_20_0
				})
			end)
		end

		seriesAsync(var_17_0, function()
			arg_11_0.mediator:GoIsland(getProxy(PlayerProxy):getRawData().id)
			arg_11_0:Hide()
		end)
	end, SFX_MAIN)
	onButton(arg_11_0, arg_11_0._dormBtn, function()
		arg_11_0.mediator:OpenDormSelectLayer()
		arg_11_0:Hide()
	end, SFX_MAIN)
	onButton(arg_11_0, arg_11_0._tf, function()
		arg_11_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_25_0, arg_25_1, arg_25_2)
	var_0_0.super.Show(arg_25_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_25_0._tf, {
		staticBlur = true
	})

	local var_25_0 = getProxy(PlayerProxy):getRawData()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_25_0.level, "CommanderCatMediator") then
		arg_25_0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_25_0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_25_0.level, "CourtYardMediator") then
		arg_25_0._haremBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_25_0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	local var_25_1 = LOCK_NEW_EDUCATE_SYSTEM and "EducateMediator" or "NewEducateSelectMediator"

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_25_0.level, var_25_1) then
		arg_25_0._educateBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_25_0._educateBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	setActive(arg_25_0._educateBtn:Find("tip"), NewEducateHelper.IsShowNewChildTip())

	local var_25_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(var_25_0.level, "SelectDorm3DMediator")

	if not var_25_2 then
		arg_25_0._dormBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_25_0._dormBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	;(function()
		local var_26_0 = var_25_2 and Dorm3dShopUI.ShouldShowAllTip()
		local var_26_1 = var_25_2 and Dorm3dFurniture.IsTimelimitShopTip()

		setActive(arg_25_0._dormBtn:Find("tip"), var_26_0 or getProxy(ApartmentProxy):HasGiftExpireSoon())
		setActive(arg_25_0._dormBtn:Find("tagFurniture"), var_26_1)
	end)()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_25_0.level, "IslandMediator") then
		arg_25_0._islandBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_25_0._islandBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	arg_25_0:UpdataIslandTip()
	arg_25_0:UpdateCover()
	arg_25_0:UpdateCoverTip()
	arg_25_0:UpdateTime()

	arg_25_0.timer = Timer.New(function()
		arg_25_0:UpdateTime()
	end, 60, -1)

	arg_25_0.timer:Start()
	setActive(arg_25_0._islandBtnEffect, tobool(arg_25_1))

	if arg_25_2 then
		arg_25_2()
	end
end

function var_0_0.UpdateTime(arg_28_0)
	local var_28_0 = pg.TimeMgr.GetInstance()
	local var_28_1 = var_28_0:GetServerHour()
	local var_28_2 = var_28_1 < 12

	setActive(arg_28_0._bg:Find("AM"), var_28_2)
	setActive(arg_28_0._bg:Find("PM"), not var_28_2)

	local var_28_3 = arg_28_0:getCoverType(var_28_1)

	setActive(arg_28_0._bg:Find("day"), var_28_3 == LivingAreaCover.TYPE_DAY)
	setActive(arg_28_0._bg:Find("night"), var_28_3 == LivingAreaCover.TYPE_NIGHT)
	setActive(arg_28_0._islandBtn:Find("lock/day"), var_28_3 == LivingAreaCover.TYPE_DAY)
	setActive(arg_28_0._islandBtn:Find("lock/night"), var_28_3 ~= LivingAreaCover.TYPE_DAY)

	local var_28_4 = var_28_0:CurrentSTimeDesc("%Y/%m/%d", true)

	setText(arg_28_0._bg:Find("date"), var_28_4)

	local var_28_5 = var_28_0:CurrentSTimeDesc(":%M", true)

	if var_28_1 > 12 then
		var_28_1 = var_28_1 - 12
	end

	setText(arg_28_0._bg:Find("time"), var_28_1 .. var_28_5)

	local var_28_6 = EducateHelper.GetWeekStrByNumber(var_28_0:GetServerWeek())

	setText(arg_28_0._bg:Find("date/week"), var_28_6)
end

function var_0_0.getCoverType(arg_29_0, arg_29_1)
	for iter_29_0, iter_29_1 in ipairs(arg_29_0.timeCfg) do
		local var_29_0 = iter_29_1[1]

		if arg_29_1 >= var_29_0[1] and arg_29_1 < var_29_0[2] then
			return iter_29_1[2]
		end
	end

	return LivingAreaCover.TYPE_DAY
end

function var_0_0.UpdateCover(arg_30_0)
	local var_30_0 = getProxy(LivingAreaCoverProxy):GetCurCover()

	if arg_30_0.cover and arg_30_0.cover.id == var_30_0.id then
		return
	end

	arg_30_0.cover = var_30_0

	arg_30_0:_loadBg()
end

function var_0_0.UpdateCoverTemp(arg_31_0, arg_31_1)
	if arg_31_0.cover and arg_31_0.cover.id == arg_31_1.id then
		return
	end

	arg_31_0.cover = arg_31_1

	arg_31_0:_loadBg()
end

function var_0_0._loadBg(arg_32_0)
	setImageSprite(arg_32_0._bg:Find("day"), GetSpriteFromAtlas(arg_32_0.cover:GetBg(LivingAreaCover.TYPE_DAY), ""), true)
	setImageSprite(arg_32_0._bg:Find("night"), GetSpriteFromAtlas(arg_32_0.cover:GetBg(LivingAreaCover.TYPE_NIGHT), ""), true)
end

function var_0_0.UpdateCoverTip(arg_33_0)
	setActive(arg_33_0._coverBtn:Find("tip"), getProxy(LivingAreaCoverProxy):IsTip())
end

function var_0_0.UpdataIslandTip(arg_34_0)
	setActive(arg_34_0._islandBtn:Find("banners"), not LOCK_ISLAND_DISPLAY)

	if LOCK_ISLAND_DISPLAY then
		return
	end

	local var_34_0, var_34_1 = getProxy(SystemTipProxy):GetIslandTipInfos()

	setActive(arg_34_0.islandAwardTF, var_34_0 > 0)
	setActive(arg_34_0.islandEmptyTF, var_34_1 > 0)
end

function var_0_0.Hide(arg_35_0)
	if arg_35_0.coverPage and arg_35_0.coverPage:GetLoaded() and arg_35_0.coverPage:isShowing() then
		arg_35_0.coverPage:Hide()

		return
	end

	if arg_35_0:isShowing() then
		var_0_0.super.Hide(arg_35_0)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_35_0._tf, arg_35_0._parentTf)
	end

	if arg_35_0.timer ~= nil then
		arg_35_0.timer:Stop()

		arg_35_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_36_0)
	local var_36_0 = pg.EasyRedDotMgr.GetInstance()

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.redDotUIList) do
		var_36_0:UnRegisterRedDot(iter_36_1)
	end

	arg_36_0.redDotUIList = nil

	arg_36_0.mediator:Dispose()

	arg_36_0.mediator = nil

	arg_36_0:Hide()
	arg_36_0.coverPage:Destroy()

	arg_36_0.coverPage = nil
	arg_36_0.cover = nil
end

return var_0_0
