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
	arg_4_0._bg = arg_4_0:findTF("bg")

	setText(arg_4_0:findTF("day/Text", arg_4_0._bg), i18n("word_harbour"))
	setText(arg_4_0:findTF("night/Text", arg_4_0._bg), i18n("word_harbour"))

	arg_4_0.timeCfg = pg.gameset.main_live_area_time.description
	arg_4_0._coverBtn = arg_4_0:findTF("cover_btn")
	arg_4_0._academyBtn = arg_4_0:findTF("school_btn")
	arg_4_0._haremBtn = arg_4_0:findTF("backyard_btn")
	arg_4_0._commanderBtn = arg_4_0:findTF("commander_btn")
	arg_4_0._educateBtn = arg_4_0:findTF("educate_btn")
	arg_4_0._islandBtn = arg_4_0:findTF("island_btn")
	arg_4_0.islandAwardTF = arg_4_0._islandBtn:Find("banners/award")

	setText(arg_4_0.islandAwardTF:Find("Text"), i18n("island_post_acceptable"))

	arg_4_0.islandEmptyTF = arg_4_0._islandBtn:Find("banners/empty")

	setText(arg_4_0.islandEmptyTF:Find("Text"), i18n("island_post_vacant"))

	arg_4_0._dormBtn = arg_4_0:findTF("dorm_btn")
	arg_4_0._islandBtnEffect = arg_4_0:findTF("VX", arg_4_0._islandBtn)
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

		local function var_13_0()
			arg_7_0.mediator:GoIsland(getProxy(PlayerProxy):getRawData().id)
			arg_7_0:Hide()
		end

		local var_13_1 = "MAP"

		if Application.isEditor or GroupHelper.IsGroupVerLastest(var_13_1) or not GroupHelper.IsGroupWaitToUpdate(var_13_1) then
			var_13_0()

			return
		end

		local var_13_2 = {}
		local var_13_3 = GroupHelper.GetGroupSize(var_13_1)
		local var_13_4 = HashUtil.BytesToString(var_13_3)

		if var_13_3 > 0 then
			table.insert(var_13_2, function(arg_15_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					locked = true,
					type = MSGBOX_TYPE_FILE_DOWNLOAD,
					content = string.format(i18n("group_download_tip", var_13_4)),
					onYes = arg_15_0
				})
			end)
		end

		table.insert(var_13_2, function(arg_16_0)
			local var_16_0 = {}
			local var_16_1 = GroupHelper.GetGroupMgrByName(var_13_1)

			if var_16_1.toUpdate then
				local var_16_2 = var_16_1.toUpdate.Count

				for iter_16_0 = 0, var_16_2 - 1 do
					local var_16_3 = var_16_1.toUpdate[iter_16_0][0]

					table.insert(var_16_0, var_16_3)
				end
			end

			local var_16_4 = {
				groupName = var_13_1,
				fileNameList = var_16_0
			}
			local var_16_5 = {
				dataList = {
					var_16_4
				},
				onFinish = arg_16_0
			}

			pg.FileDownloadMgr.GetInstance():Main(var_16_5)
		end)
		seriesAsync(var_13_2, var_13_0)
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._dormBtn, function()
		arg_7_0.mediator:OpenDormSelectLayer()
		arg_7_0:Hide()
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._tf, function()
		arg_7_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_19_0, arg_19_1, arg_19_2)
	var_0_0.super.Show(arg_19_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_19_0._tf, {
		staticBlur = true
	})

	local var_19_0 = getProxy(PlayerProxy):getRawData()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_19_0.level, "CommanderCatMediator") then
		arg_19_0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_19_0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_19_0.level, "CourtYardMediator") then
		arg_19_0._haremBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_19_0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	local var_19_1 = LOCK_NEW_EDUCATE_SYSTEM and "EducateMediator" or "NewEducateSelectMediator"

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_19_0.level, var_19_1) then
		arg_19_0._educateBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_19_0._educateBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	setActive(arg_19_0._educateBtn:Find("tip"), NewEducateHelper.IsShowNewChildTip())

	local var_19_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(var_19_0.level, "SelectDorm3DMediator")

	if not var_19_2 then
		arg_19_0._dormBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_19_0._dormBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	;(function()
		local var_20_0 = var_19_2 and Dorm3dShopUI.ShouldShowAllTip()
		local var_20_1 = var_19_2 and Dorm3dFurniture.IsTimelimitShopTip()

		setActive(arg_19_0._dormBtn:Find("tip"), var_20_0)
		setActive(arg_19_0._dormBtn:Find("tagFurniture"), var_20_1)
	end)()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_19_0.level, "IslandMediator") then
		arg_19_0._islandBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_19_0._islandBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	arg_19_0:UpdataIslandTip()
	arg_19_0:UpdateCover()
	arg_19_0:UpdateCoverTip()
	arg_19_0:UpdateTime()

	arg_19_0.timer = Timer.New(function()
		arg_19_0:UpdateTime()
	end, 60, -1)

	arg_19_0.timer:Start()
	setActive(arg_19_0._islandBtnEffect, tobool(arg_19_1))

	if arg_19_2 then
		arg_19_2()
	end
end

function var_0_0.UpdateTime(arg_22_0)
	local var_22_0 = pg.TimeMgr.GetInstance()
	local var_22_1 = var_22_0:GetServerHour()
	local var_22_2 = var_22_1 < 12

	setActive(arg_22_0:findTF("AM", arg_22_0._bg), var_22_2)
	setActive(arg_22_0:findTF("PM", arg_22_0._bg), not var_22_2)

	local var_22_3 = arg_22_0:getCoverType(var_22_1)

	setActive(arg_22_0:findTF("day", arg_22_0._bg), var_22_3 == LivingAreaCover.TYPE_DAY)
	setActive(arg_22_0:findTF("night", arg_22_0._bg), var_22_3 == LivingAreaCover.TYPE_NIGHT)
	setActive(arg_22_0:findTF("lock/day", arg_22_0._islandBtn), var_22_3 == LivingAreaCover.TYPE_DAY)
	setActive(arg_22_0:findTF("lock/night", arg_22_0._islandBtn), var_22_3 ~= LivingAreaCover.TYPE_DAY)

	local var_22_4 = var_22_0:CurrentSTimeDesc("%Y/%m/%d", true)

	setText(arg_22_0:findTF("date", arg_22_0._bg), var_22_4)

	local var_22_5 = var_22_0:CurrentSTimeDesc(":%M", true)

	if var_22_1 > 12 then
		var_22_1 = var_22_1 - 12
	end

	setText(arg_22_0:findTF("time", arg_22_0._bg), var_22_1 .. var_22_5)

	local var_22_6 = EducateHelper.GetWeekStrByNumber(var_22_0:GetServerWeek())

	setText(arg_22_0:findTF("date/week", arg_22_0._bg), var_22_6)
end

function var_0_0.getCoverType(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.timeCfg) do
		local var_23_0 = iter_23_1[1]

		if arg_23_1 >= var_23_0[1] and arg_23_1 < var_23_0[2] then
			return iter_23_1[2]
		end
	end

	return LivingAreaCover.TYPE_DAY
end

function var_0_0.UpdateCover(arg_24_0)
	local var_24_0 = getProxy(LivingAreaCoverProxy):GetCurCover()

	if arg_24_0.cover and arg_24_0.cover.id == var_24_0.id then
		return
	end

	arg_24_0.cover = var_24_0

	arg_24_0:_loadBg()
end

function var_0_0.UpdateCoverTemp(arg_25_0, arg_25_1)
	if arg_25_0.cover and arg_25_0.cover.id == arg_25_1.id then
		return
	end

	arg_25_0.cover = arg_25_1

	arg_25_0:_loadBg()
end

function var_0_0._loadBg(arg_26_0)
	setImageSprite(arg_26_0:findTF("day", arg_26_0._bg), GetSpriteFromAtlas(arg_26_0.cover:GetBg(LivingAreaCover.TYPE_DAY), ""), true)
	setImageSprite(arg_26_0:findTF("night", arg_26_0._bg), GetSpriteFromAtlas(arg_26_0.cover:GetBg(LivingAreaCover.TYPE_NIGHT), ""), true)
end

function var_0_0.UpdateCoverTip(arg_27_0)
	setActive(arg_27_0:findTF("tip", arg_27_0._coverBtn), getProxy(LivingAreaCoverProxy):IsTip())
end

function var_0_0.UpdataIslandTip(arg_28_0)
	setActive(arg_28_0._islandBtn:Find("banners"), not LOCK_ISLAND_DISPLAY)

	if LOCK_ISLAND_DISPLAY then
		return
	end

	local var_28_0, var_28_1 = getProxy(SystemTipProxy):GetIslandTipInfos()

	setActive(arg_28_0.islandAwardTF, var_28_0 > 0)
	setActive(arg_28_0.islandEmptyTF, var_28_1 > 0)
end

function var_0_0.Hide(arg_29_0)
	if arg_29_0.coverPage and arg_29_0.coverPage:GetLoaded() and arg_29_0.coverPage:isShowing() then
		arg_29_0.coverPage:Hide()

		return
	end

	if arg_29_0:isShowing() then
		var_0_0.super.Hide(arg_29_0)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_29_0._tf, arg_29_0._parentTf)
	end

	if arg_29_0.timer ~= nil then
		arg_29_0.timer:Stop()

		arg_29_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_30_0)
	for iter_30_0, iter_30_1 in ipairs(arg_30_0.redList) do
		pg.redDotHelper:RemoveNode(iter_30_1)
	end

	arg_30_0.redList = nil

	arg_30_0.mediator:Dispose()

	arg_30_0.mediator = nil

	arg_30_0:Hide()
	arg_30_0.coverPage:Destroy()

	arg_30_0.coverPage = nil
	arg_30_0.cover = nil
end

return var_0_0
