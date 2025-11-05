local var_0_0 = class("MainLiveAreaPage", import("view.base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0:bind(NewMainScene.UPDATE_COVER, function(arg_2_0)
		arg_1_0:ExecuteAction("UpdateCover")
	end)
end

function var_0_0.getUIName(arg_3_0)
	return "MainLiveAreaUI"
end

function var_0_0.OnLoaded(arg_4_0)
	arg_4_0._bg = arg_4_0._tf:Find("bg")

	setText(arg_4_0._bg:Find("day/Text"), i18n("word_harbour"))
	setText(arg_4_0._bg:Find("night/Text"), i18n("word_harbour"))

	arg_4_0.timeCfg = pg.gameset.main_live_area_time.description
	arg_4_0._coverBtn = arg_4_0._tf:Find("cover_btn")
	arg_4_0._academyBtn = arg_4_0._tf:Find("school_btn")
	arg_4_0._haremBtn = arg_4_0._tf:Find("backyard_btn")
	arg_4_0._commanderBtn = arg_4_0._tf:Find("commander_btn")
	arg_4_0._educateBtn = arg_4_0._tf:Find("educate_btn")
	arg_4_0._islandBtn = arg_4_0._tf:Find("island_btn")
	arg_4_0.islandAwardTF = arg_4_0._islandBtn:Find("banners/award")

	setText(arg_4_0.islandAwardTF:Find("Text"), i18n("island_post_acceptable"))

	arg_4_0.islandEmptyTF = arg_4_0._islandBtn:Find("banners/empty")

	setText(arg_4_0.islandEmptyTF:Find("Text"), i18n("island_post_vacant"))

	arg_4_0._dormBtn = arg_4_0._tf:Find("dorm_btn")
	arg_4_0._islandBtnEffect = arg_4_0._islandBtn:Find("VX")
	arg_4_0.coverPage = LivingAreaCoverPage.New(arg_4_0._tf, arg_4_0.event, {
		onHide = function()
			arg_4_0:UpdateCoverTip()
		end,
		onSelected = function(arg_6_0)
			arg_4_0:UpdateCoverTemp(arg_6_0)
		end
	})
	arg_4_0.redList = {
		RedDotNode.New(arg_4_0._haremBtn:Find("tip"), {
			pg.RedDotMgr.TYPES.COURTYARD
		}),
		SelfRefreshRedDotNode.New(arg_4_0._academyBtn:Find("tip"), {
			pg.RedDotMgr.TYPES.SCHOOL
		}),
		SelfRefreshRedDotNode.New(arg_4_0._commanderBtn:Find("tip"), {
			pg.RedDotMgr.TYPES.COMMANDER
		})
	}

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.redList) do
		pg.redDotHelper:AddNode(iter_4_1)
	end
end

function var_0_0.OnInit(arg_7_0)
	arg_7_0.mediator = MainLiveAreaPageMediator.New()

	onButton(arg_7_0, arg_7_0._coverBtn, function()
		arg_7_0.coverPage:ExecuteAction("Show")
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._commanderBtn, function()
		arg_7_0.mediator:GoScene(SCENE.COMMANDERCAT, {
			fromMain = true,
			fleetType = CommanderCatScene.FLEET_TYPE_COMMON
		})
		arg_7_0:Hide()
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._haremBtn, function()
		arg_7_0.mediator:GoScene(SCENE.COURTYARD)
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._academyBtn, function()
		arg_7_0.mediator:GoScene(SCENE.NAVALACADEMYSCENE)
		arg_7_0:Hide()
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._educateBtn, function()
		if LOCK_EDUCATE_SYSTEM then
			return
		end

		if LOCK_NEW_EDUCATE_SYSTEM then
			arg_7_0.mediator:GoScene(SCENE.EDUCATE, {
				isMainEnter = true
			})
		else
			arg_7_0.mediator:GoScene(SCENE.NEW_EDUCATE_SELECT)
		end

		arg_7_0:Hide()
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._islandBtn, function()
		if LOCK_ISLAND_DISPLAY then
			return
		end

		local var_13_0 = {}
		local var_13_1 = "MAP"

		if Application.isEditor or GroupHelper.IsGroupVerLastest(var_13_1) or not GroupHelper.IsGroupWaitToUpdate(var_13_1) then
			-- block empty
		else
			local var_13_2 = GroupHelper.GetGroupSize(var_13_1)
			local var_13_3 = HashUtil.BytesToString(var_13_2)

			if var_13_2 > 0 then
				table.insert(var_13_0, function(arg_14_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						modal = true,
						locked = true,
						type = MSGBOX_TYPE_FILE_DOWNLOAD,
						content = string.format(i18n("group_download_tip", var_13_3)),
						onYes = arg_14_0
					})
				end)
			end

			table.insert(var_13_0, function(arg_15_0)
				local var_15_0 = {}
				local var_15_1 = GroupHelper.GetGroupMgrByName(var_13_1)

				if var_15_1.toUpdate then
					local var_15_2 = var_15_1.toUpdate.Count

					for iter_15_0 = 0, var_15_2 - 1 do
						local var_15_3 = var_15_1.toUpdate[iter_15_0][0]

						table.insert(var_15_0, var_15_3)
					end
				end

				local var_15_4 = {
					groupName = var_13_1,
					fileNameList = var_15_0
				}
				local var_15_5 = {
					dataList = {
						var_15_4
					},
					onFinish = arg_15_0
				}

				pg.FileDownloadMgr.GetInstance():Main(var_15_5)
			end)
		end

		local var_13_4 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d", true)

		if not LOCK_ISLAND_ENTER_TIP_WINDOW and PlayerPrefs.GetString("ISLAND_ENTER_TIP_WINDOW", "") ~= var_13_4 then
			table.insert(var_13_0, function(arg_16_0)
				local function var_16_0()
					if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
						PlayerPrefs.SetString("ISLAND_ENTER_TIP_WINDOW", var_13_4)
					end

					arg_16_0()
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					toggleStatus = true,
					showStopRemind = true,
					type = MSGBOX_TYPE_HELP,
					helps = i18n("island_urgent_notice"),
					onYes = var_16_0,
					onNo = var_16_0
				})
			end)
		end

		seriesAsync(var_13_0, function()
			arg_7_0.mediator:GoIsland(getProxy(PlayerProxy):getRawData().id)
			arg_7_0:Hide()
		end)
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._dormBtn, function()
		arg_7_0.mediator:OpenDormSelectLayer()
		arg_7_0:Hide()
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._tf, function()
		arg_7_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_21_0, arg_21_1, arg_21_2)
	var_0_0.super.Show(arg_21_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_21_0._tf, {
		staticBlur = true
	})

	local var_21_0 = getProxy(PlayerProxy):getRawData()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_21_0.level, "CommanderCatMediator") then
		arg_21_0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_21_0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_21_0.level, "CourtYardMediator") then
		arg_21_0._haremBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_21_0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	local var_21_1 = LOCK_NEW_EDUCATE_SYSTEM and "EducateMediator" or "NewEducateSelectMediator"

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_21_0.level, var_21_1) then
		arg_21_0._educateBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_21_0._educateBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	setActive(arg_21_0._educateBtn:Find("tip"), NewEducateHelper.IsShowNewChildTip())

	local var_21_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(var_21_0.level, "SelectDorm3DMediator")

	if not var_21_2 then
		arg_21_0._dormBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_21_0._dormBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	;(function()
		local var_22_0 = var_21_2 and Dorm3dShopUI.ShouldShowAllTip()
		local var_22_1 = var_21_2 and Dorm3dFurniture.IsTimelimitShopTip()

		setActive(arg_21_0._dormBtn:Find("tip"), var_22_0)
		setActive(arg_21_0._dormBtn:Find("tagFurniture"), var_22_1)
	end)()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_21_0.level, "IslandMediator") then
		arg_21_0._islandBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_21_0._islandBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	arg_21_0:UpdataIslandTip()
	arg_21_0:UpdateCover()
	arg_21_0:UpdateCoverTip()
	arg_21_0:UpdateTime()

	arg_21_0.timer = Timer.New(function()
		arg_21_0:UpdateTime()
	end, 60, -1)

	arg_21_0.timer:Start()
	setActive(arg_21_0._islandBtnEffect, tobool(arg_21_1))

	if arg_21_2 then
		arg_21_2()
	end
end

function var_0_0.UpdateTime(arg_24_0)
	local var_24_0 = pg.TimeMgr.GetInstance()
	local var_24_1 = var_24_0:GetServerHour()
	local var_24_2 = var_24_1 < 12

	setActive(arg_24_0._bg:Find("AM"), var_24_2)
	setActive(arg_24_0._bg:Find("PM"), not var_24_2)

	local var_24_3 = arg_24_0:getCoverType(var_24_1)

	setActive(arg_24_0._bg:Find("day"), var_24_3 == LivingAreaCover.TYPE_DAY)
	setActive(arg_24_0._bg:Find("night"), var_24_3 == LivingAreaCover.TYPE_NIGHT)
	setActive(arg_24_0._islandBtn:Find("lock/day"), var_24_3 == LivingAreaCover.TYPE_DAY)
	setActive(arg_24_0._islandBtn:Find("lock/night"), var_24_3 ~= LivingAreaCover.TYPE_DAY)

	local var_24_4 = var_24_0:CurrentSTimeDesc("%Y/%m/%d", true)

	setText(arg_24_0._bg:Find("date"), var_24_4)

	local var_24_5 = var_24_0:CurrentSTimeDesc(":%M", true)

	if var_24_1 > 12 then
		var_24_1 = var_24_1 - 12
	end

	setText(arg_24_0._bg:Find("time"), var_24_1 .. var_24_5)

	local var_24_6 = EducateHelper.GetWeekStrByNumber(var_24_0:GetServerWeek())

	setText(arg_24_0._bg:Find("date/week"), var_24_6)
end

function var_0_0.getCoverType(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.timeCfg) do
		local var_25_0 = iter_25_1[1]

		if arg_25_1 >= var_25_0[1] and arg_25_1 < var_25_0[2] then
			return iter_25_1[2]
		end
	end

	return LivingAreaCover.TYPE_DAY
end

function var_0_0.UpdateCover(arg_26_0)
	local var_26_0 = getProxy(LivingAreaCoverProxy):GetCurCover()

	if arg_26_0.cover and arg_26_0.cover.id == var_26_0.id then
		return
	end

	arg_26_0.cover = var_26_0

	arg_26_0:_loadBg()
end

function var_0_0.UpdateCoverTemp(arg_27_0, arg_27_1)
	if arg_27_0.cover and arg_27_0.cover.id == arg_27_1.id then
		return
	end

	arg_27_0.cover = arg_27_1

	arg_27_0:_loadBg()
end

function var_0_0._loadBg(arg_28_0)
	setImageSprite(arg_28_0._bg:Find("day"), GetSpriteFromAtlas(arg_28_0.cover:GetBg(LivingAreaCover.TYPE_DAY), ""), true)
	setImageSprite(arg_28_0._bg:Find("night"), GetSpriteFromAtlas(arg_28_0.cover:GetBg(LivingAreaCover.TYPE_NIGHT), ""), true)
end

function var_0_0.UpdateCoverTip(arg_29_0)
	setActive(arg_29_0._coverBtn:Find("tip"), getProxy(LivingAreaCoverProxy):IsTip())
end

function var_0_0.UpdataIslandTip(arg_30_0)
	setActive(arg_30_0._islandBtn:Find("banners"), not LOCK_ISLAND_DISPLAY)

	if LOCK_ISLAND_DISPLAY then
		return
	end

	local var_30_0, var_30_1 = getProxy(SystemTipProxy):GetIslandTipInfos()

	setActive(arg_30_0.islandAwardTF, var_30_0 > 0)
	setActive(arg_30_0.islandEmptyTF, var_30_1 > 0)
end

function var_0_0.Hide(arg_31_0)
	if arg_31_0.coverPage and arg_31_0.coverPage:GetLoaded() and arg_31_0.coverPage:isShowing() then
		arg_31_0.coverPage:Hide()

		return
	end

	if arg_31_0:isShowing() then
		var_0_0.super.Hide(arg_31_0)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_31_0._tf, arg_31_0._parentTf)
	end

	if arg_31_0.timer ~= nil then
		arg_31_0.timer:Stop()

		arg_31_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_32_0)
	for iter_32_0, iter_32_1 in ipairs(arg_32_0.redList) do
		pg.redDotHelper:RemoveNode(iter_32_1)
	end

	arg_32_0.redList = nil

	arg_32_0.mediator:Dispose()

	arg_32_0.mediator = nil

	arg_32_0:Hide()
	arg_32_0.coverPage:Destroy()

	arg_32_0.coverPage = nil
	arg_32_0.cover = nil
end

return var_0_0
