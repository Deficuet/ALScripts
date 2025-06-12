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
	arg_4_0._dormBtn = arg_4_0:findTF("dorm_btn")
	arg_4_0.coverPage = LivingAreaCoverPage.New(arg_4_0._tf, arg_4_0.event, {
		onHide = function()
			arg_4_0:UpdateCoverTip()
		end,
		onSelected = function(arg_6_0)
			arg_4_0:UpdateCoverTemp(arg_6_0)
		end
	})

	pg.redDotHelper:AddNode(RedDotNode.New(arg_4_0._haremBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.COURTYARD
	}))
	pg.redDotHelper:AddNode(SelfRefreshRedDotNode.New(arg_4_0._academyBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.SCHOOL
	}))
	pg.redDotHelper:AddNode(SelfRefreshRedDotNode.New(arg_4_0._commanderBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.COMMANDER
	}))
end

function var_0_0.OnInit(arg_7_0)
	onButton(arg_7_0, arg_7_0._coverBtn, function()
		arg_7_0.coverPage:ExecuteAction("Show")
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._commanderBtn, function()
		arg_7_0:emit(NewMainMediator.GO_SCENE, SCENE.COMMANDERCAT, {
			fromMain = true,
			fleetType = CommanderCatScene.FLEET_TYPE_COMMON
		})
		arg_7_0:Hide()
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._haremBtn, function()
		arg_7_0:emit(NewMainMediator.GO_SCENE, SCENE.COURTYARD)
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._academyBtn, function()
		arg_7_0:emit(NewMainMediator.GO_SCENE, SCENE.NAVALACADEMYSCENE)
		arg_7_0:Hide()
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._educateBtn, function()
		if LOCK_EDUCATE_SYSTEM then
			return
		end

		if LOCK_NEW_EDUCATE_SYSTEM then
			arg_7_0:emit(NewMainMediator.GO_SCENE, SCENE.EDUCATE, {
				isMainEnter = true
			})
		else
			arg_7_0:emit(NewMainMediator.GO_SCENE, SCENE.NEW_EDUCATE_SELECT)
		end

		arg_7_0:Hide()
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._islandBtn, function()
		return
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._dormBtn, function()
		arg_7_0:emit(NewMainMediator.OPEN_DORM_SELECT_LAYER)
		arg_7_0:Hide()
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._tf, function()
		arg_7_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_16_0)
	var_0_0.super.Show(arg_16_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_16_0._tf, true, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	local var_16_0 = getProxy(PlayerProxy):getRawData()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_16_0.level, "CommanderCatMediator") then
		arg_16_0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_16_0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_16_0.level, "CourtYardMediator") then
		arg_16_0._haremBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_16_0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	local var_16_1 = LOCK_NEW_EDUCATE_SYSTEM and "EducateMediator" or "NewEducateSelectMediator"

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_16_0.level, var_16_1) then
		arg_16_0._educateBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_16_0._educateBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	setActive(arg_16_0._educateBtn:Find("tip"), NewEducateHelper.IsShowNewChildTip())

	local var_16_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(var_16_0.level, "SelectDorm3DMediator")

	if not var_16_2 then
		arg_16_0._dormBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_16_0._dormBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	;(function()
		local var_17_0 = var_16_2 and Dorm3dGift.NeedViewTip()
		local var_17_1 = var_16_2 and Dorm3dFurniture.NeedViewTip()
		local var_17_2 = var_16_2 and Dorm3dFurniture.IsTimelimitShopTip()

		setActive(arg_16_0._dormBtn:Find("tip"), not var_17_2 and (var_17_0 or var_17_1))
		setActive(arg_16_0._dormBtn:Find("tagFurniture"), var_17_2)
	end)()
	arg_16_0:UpdateCover()
	arg_16_0:UpdateCoverTip()
	arg_16_0:UpdateTime()

	arg_16_0.timer = Timer.New(function()
		arg_16_0:UpdateTime()
	end, 60, -1)

	arg_16_0.timer:Start()
end

function var_0_0.UpdateTime(arg_19_0)
	local var_19_0 = pg.TimeMgr.GetInstance()
	local var_19_1 = var_19_0:GetServerHour()
	local var_19_2 = var_19_1 < 12

	setActive(arg_19_0:findTF("AM", arg_19_0._bg), var_19_2)
	setActive(arg_19_0:findTF("PM", arg_19_0._bg), not var_19_2)

	local var_19_3 = arg_19_0:getCoverType(var_19_1)

	setActive(arg_19_0:findTF("day", arg_19_0._bg), var_19_3 == LivingAreaCover.TYPE_DAY)
	setActive(arg_19_0:findTF("night", arg_19_0._bg), var_19_3 == LivingAreaCover.TYPE_NIGHT)
	setActive(arg_19_0:findTF("day", arg_19_0._islandBtn), var_19_3 == LivingAreaCover.TYPE_DAY)
	setActive(arg_19_0:findTF("night", arg_19_0._islandBtn), var_19_3 ~= LivingAreaCover.TYPE_DAY)

	local var_19_4 = var_19_0:CurrentSTimeDesc("%Y/%m/%d", true)

	setText(arg_19_0:findTF("date", arg_19_0._bg), var_19_4)

	local var_19_5 = var_19_0:CurrentSTimeDesc(":%M", true)

	if var_19_1 > 12 then
		var_19_1 = var_19_1 - 12
	end

	setText(arg_19_0:findTF("time", arg_19_0._bg), var_19_1 .. var_19_5)

	local var_19_6 = EducateHelper.GetWeekStrByNumber(var_19_0:GetServerWeek())

	setText(arg_19_0:findTF("date/week", arg_19_0._bg), var_19_6)
end

function var_0_0.getCoverType(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.timeCfg) do
		local var_20_0 = iter_20_1[1]

		if arg_20_1 >= var_20_0[1] and arg_20_1 < var_20_0[2] then
			return iter_20_1[2]
		end
	end

	return LivingAreaCover.TYPE_DAY
end

function var_0_0.UpdateCover(arg_21_0)
	local var_21_0 = getProxy(LivingAreaCoverProxy):GetCurCover()

	if arg_21_0.cover and arg_21_0.cover.id == var_21_0.id then
		return
	end

	arg_21_0.cover = var_21_0

	arg_21_0:_loadBg()
end

function var_0_0.UpdateCoverTemp(arg_22_0, arg_22_1)
	if arg_22_0.cover and arg_22_0.cover.id == arg_22_1.id then
		return
	end

	arg_22_0.cover = arg_22_1

	arg_22_0:_loadBg()
end

function var_0_0._loadBg(arg_23_0)
	setImageSprite(arg_23_0:findTF("day", arg_23_0._bg), GetSpriteFromAtlas(arg_23_0.cover:GetBg(LivingAreaCover.TYPE_DAY), ""), true)
	setImageSprite(arg_23_0:findTF("night", arg_23_0._bg), GetSpriteFromAtlas(arg_23_0.cover:GetBg(LivingAreaCover.TYPE_NIGHT), ""), true)
end

function var_0_0.UpdateCoverTip(arg_24_0)
	setActive(arg_24_0:findTF("tip", arg_24_0._coverBtn), getProxy(LivingAreaCoverProxy):IsTip())
end

function var_0_0.Hide(arg_25_0)
	if arg_25_0.coverPage and arg_25_0.coverPage:GetLoaded() and arg_25_0.coverPage:isShowing() then
		arg_25_0.coverPage:Hide()

		return
	end

	if arg_25_0:isShowing() then
		var_0_0.super.Hide(arg_25_0)
		pg.UIMgr.GetInstance():UnblurPanel(arg_25_0._tf, arg_25_0._parentTf)
	end

	if arg_25_0.timer ~= nil then
		arg_25_0.timer:Stop()

		arg_25_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_26_0)
	arg_26_0:Hide()
	arg_26_0.coverPage:Destroy()

	arg_26_0.coverPage = nil
	arg_26_0.cover = nil
end

return var_0_0
