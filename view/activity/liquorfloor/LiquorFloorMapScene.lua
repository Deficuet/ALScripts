local var_0_0 = class("LiquorFloorMapScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "LiquorFloorUI"
end

var_0_0.RANDOM_POS = {
	Vector2.New(121.6, 121.6),
	Vector2.New(-258.5, 22.8),
	Vector2.New(-166.1, 283),
	Vector2.New(-647.1, -14),
	Vector2.New(-440.7, -26.8),
	Vector2.New(-534.5, -285.1),
	Vector2.New(279.7, -299.1),
	Vector2.New(599.7, -299.1),
	Vector2.New(897.5, -15.2),
	Vector2.New(468.8, -15.2),
	Vector2.New(952.9, 166.2),
	Vector2.New(10.9, -91.6)
}
var_0_0.TOP_POS = {
	Vector2.New(213, 152),
	Vector2.New(15, -137),
	Vector2.New(348, -50),
	Vector2.New(-32, -6),
	Vector2.New(-296, -267),
	Vector2.New(399, -113)
}
var_0_0.architecturePos = {
	Vector2.New(-224.8, 183),
	Vector2.New(-435, -81.5),
	Vector2.New(452.5, 320.5),
	Vector2.New(201, 53),
	Vector2.New(26, -236.5),
	Vector2.New(641.5, -63)
}

function var_0_0.SetActivity(arg_2_0, arg_2_1)
	arg_2_0.activity = arg_2_1
end

function var_0_0.init(arg_3_0)
	arg_3_0.ui = arg_3_0._tf:Find("ui")
	arg_3_0.fightBtn = arg_3_0.ui:Find("fightBtn")
	arg_3_0.taskBtn = arg_3_0.ui:Find("decorate/decorate1_1/decorate1_2/taskBtn")
	arg_3_0.storyBtn = arg_3_0.ui:Find("decorate/decorate1_1/storyBtn")
	arg_3_0.architectureData = {
		arg_3_0.ui:Find("architecture/muchang_bg"),
		arg_3_0.ui:Find("architecture/nongchang_bg"),
		arg_3_0.ui:Find("architecture/kuangchang_bg"),
		arg_3_0.ui:Find("architecture/sheyingpeng_bg"),
		arg_3_0.ui:Find("architecture/huochezhan_bg"),
		arg_3_0.ui:Find("architecture/jiudian_bg")
	}
	arg_3_0.architectureMapData = {
		arg_3_0._tf:Find("bgs/muchang_xiao"),
		arg_3_0._tf:Find("bgs/nongchang_xiao"),
		arg_3_0._tf:Find("bgs/kuangchang_xiao"),
		arg_3_0._tf:Find("bgs/sheyingpeng_xiao"),
		arg_3_0._tf:Find("bgs/huochezhan_xiao"),
		arg_3_0._tf:Find("bgs/jiudian_xiao")
	}
	arg_3_0.lv = arg_3_0.ui:Find("LV")
	arg_3_0.top = arg_3_0.ui:Find("top")
	arg_3_0.backBtn = arg_3_0.top:Find("back_button")
	arg_3_0.homeBtn = arg_3_0.top:Find("home_button")
	arg_3_0.slotTFs = arg_3_0._tf:Find("bgs/content")
	arg_3_0.slotTpl = arg_3_0._tf:Find("bgs/content/tpl")

	setActive(arg_3_0.slotTpl, false)

	arg_3_0.box = arg_3_0.ui:Find("box")

	SetActive(arg_3_0.box, false)

	arg_3_0.Text_new = arg_3_0.ui:Find("LV/Lv_bg/Text_new")

	SetActive(arg_3_0.Text_new, false)

	arg_3_0.taskTip = arg_3_0.ui:Find("decorate/decorate1_1/decorate1_2/taskBtn/tip")

	setText(arg_3_0.top:Find("title/Text1"), i18n("LiquorFloor_title"))
	setText(arg_3_0.top:Find("title/Text2"), i18n("LiquorFloor_title_en"))
	setText(arg_3_0.ui:Find("decorate/decorate1_1/storyBtn/Text"), i18n("LiquorFloor_story_title"))
	setText(arg_3_0.ui:Find("decorate/decorate1_1/decorate1_2/taskBtn/Text"), i18n("LiquorFloorTaskUI_title"))
end

function var_0_0.OnStoryList(arg_4_0)
	arg_4_0.gather1 = {}
	arg_4_0.gather2 = {}
	arg_4_0.gather3 = {}
	arg_4_0.client = arg_4_0.activity:getConfig("config_client").BookData

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.client[1].data1) do
		table.insert(arg_4_0.gather1, iter_4_1)
	end

	for iter_4_2, iter_4_3 in ipairs(arg_4_0.client[2].data2) do
		table.insert(arg_4_0.gather2, iter_4_3)
	end

	for iter_4_4, iter_4_5 in ipairs(arg_4_0.client[3].data3) do
		table.insert(arg_4_0.gather3, iter_4_5)
	end

	arg_4_0.storyList = {}

	arg_4_0:OnStory()
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0:OnStoryList()
	arg_5_0:InitData()
	onButton(arg_5_0, arg_5_0.fightBtn, function()
		arg_5_0:emit(LiquorFloorMapMediator.GO_FIGHT)
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.taskBtn, function()
		arg_5_0:emit(LiquorFloorMapMediator.OPEN_LAYER, Context.New({
			mediator = LiquorFloorTaskMediator,
			viewComponent = LiquorFloorTaskScene,
			data = {
				activityID = arg_5_0.activity.id
			}
		}))
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.storyBtn, function()
		arg_5_0:emit(LiquorFloorMapMediator.OPEN_CLUE_BOOK)
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.backBtn, function()
		arg_5_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.homeBtn, function()
		arg_5_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.box, function()
		SetActive(arg_5_0.box, false)
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.top:Find("help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.LiquorFloor_tip.tip
		})
	end, SFX_CANCEL)
	setText(arg_5_0.ui:Find("Allgold/Text"), i18n("LiquorFloor_gold_get"))
	onButton(arg_5_0, arg_5_0.ui:Find("Allgold"), function()
		SetActive(arg_5_0.box, false)

		if arg_5_0.activity:HasMaxGold() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("LiquorFloor_gold_max_tip")
			})
		else
			arg_5_0:emit(LiquorFloorMapMediator.ALL_WORKPLACE)
		end
	end, SFX_CANCEL)

	arg_5_0.timeCfg = arg_5_0.activity:getConfig("config_client").endingtime
	arg_5_0.Placeitems = arg_5_0.ui:Find("architecture")
	arg_5_0.Placeitem = arg_5_0.Placeitems:Find("muchang_bg")
	arg_5_0.uilistPlace = UIItemList.New(arg_5_0.Placeitems, arg_5_0.Placeitem)

	arg_5_0:OnPlaceDes()
	arg_5_0:UpdateBubbles()

	arg_5_0.timer = Timer.New(function()
		arg_5_0:OnUpdateTime()
		arg_5_0:OnPlaceDes()
	end, 1, -1)

	arg_5_0.timer:Start()
	arg_5_0:OnUpdateTime()

	arg_5_0.timeCfg = arg_5_0.activity:getConfig("config_client").endingtime
	arg_5_0.spineRoles = {}

	arg_5_0.activity:SetBubbleTipTag(true)
	arg_5_0:RefreshRedPoint()

	if arg_5_0.contextData.openStory == 1 then
		triggerButton(arg_5_0.storyBtn)
	end
end

function var_0_0.OnStory(arg_15_0)
	for iter_15_0, iter_15_1 in ipairs(arg_15_0.gather1) do
		local var_15_0 = arg_15_0:getCollectDataBySiteId(iter_15_1)

		if var_15_0.unlock[2] <= arg_15_0.activity:GetTownLevel() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_15_0.luaID) then
			pg.NewStoryMgr.GetInstance():Play(var_15_0.luaID, function()
				if iter_15_0 == 1 then
					pg.NewGuideMgr.GetInstance():Play("LiquorFloor_help")
				end
			end)
		end
	end

	local var_15_1 = arg_15_0.activity:GetPlaceList()

	for iter_15_2, iter_15_3 in ipairs(arg_15_0.gather2) do
		local var_15_2 = arg_15_0:getCollectDataBySiteId(iter_15_3)

		if var_15_2.unlock[2] <= var_15_1[var_15_2.unlock[1]]:GetLevel() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_15_2.luaID) then
			pg.NewStoryMgr.GetInstance():Play(var_15_2.luaID, function()
				return
			end)
		end
	end

	for iter_15_4, iter_15_5 in ipairs(arg_15_0.gather3) do
		local var_15_3 = arg_15_0:getCollectDataBySiteId(iter_15_5)

		if var_15_3.unlock[2] <= var_15_1[var_15_3.unlock[1]]:GetLevel() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_15_3.luaID) then
			pg.NewStoryMgr.GetInstance():Play(var_15_3.luaID, function()
				return
			end)
		end
	end
end

function var_0_0.OnstoryPlay(arg_19_0)
	if not arg_19_0.storyList or #arg_19_0.storyList == 0 then
		return
	end

	pg.NewStoryMgr.GetInstance():Play(arg_19_0.storyList, function()
		return
	end, false)
end

function var_0_0.OnUpdateTime(arg_21_0)
	return
end

function var_0_0.GetRandomPos(arg_22_0)
	local var_22_0 = {}

	for iter_22_0 = 1, #var_0_0.RANDOM_POS do
		table.insert(var_22_0, iter_22_0)
	end

	shuffle(var_22_0)

	local var_22_1 = {}

	for iter_22_1 = 1, 8 do
		table.insert(var_22_1, var_0_0.RANDOM_POS[var_22_0[iter_22_1]])
	end

	return var_22_1
end

function var_0_0.UpdateBubbles(arg_23_0)
	arg_23_0.bubblesPosList = {}

	if arg_23_0.slotTpl then
		setActive(arg_23_0.slotTpl, false)
	end

	arg_23_0.randomPos = Clone(var_0_0.RANDOM_POS)

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.shipIds) do
		local var_23_0 = arg_23_0.slotTFs:Find(iter_23_0) or cloneTplTo(arg_23_0.slotTpl, arg_23_0.slotTFs, iter_23_0)
		local var_23_1 = iter_23_1 > 0 and getProxy(BayProxy):RawGetShipById(iter_23_1) and arg_23_0.activity:GetBubbleCntByPos(iter_23_0) > 0

		setActive(var_23_0, var_23_1)

		if var_23_1 then
			table.insert(arg_23_0.bubblesPosList, iter_23_0)
			arg_23_0:UpdateShip(var_23_0, iter_23_0, iter_23_1)
		end
	end
end

function var_0_0.UpdateShip(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = arg_24_3 > 0 and getProxy(BayProxy):RawGetShipById(arg_24_3)

	if not var_24_0 then
		return
	end

	local var_24_1 = arg_24_0.activity:GetBubbleCntByPos(arg_24_2)
	local var_24_2 = arg_24_0.randomPos[#arg_24_0.randomPos]

	setAnchoredPosition(arg_24_1, var_24_2)
	table.removebyvalue(arg_24_0.randomPos, var_24_2)

	local var_24_3 = LoadSprite("qicon/" .. var_24_0:getPainting())

	setImageSprite(arg_24_1:Find("icon"), var_24_3)
	onButton(arg_24_0, arg_24_1:Find("icon"), function()
		if not arg_24_0.bubblesPosList or #arg_24_0.bubblesPosList <= 0 then
			return
		end

		if arg_24_0.activity:HasMaxGold() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("LiquorFloor_gold_max_tip"),
				onYes = function()
					arg_24_0:emit(LiquorFloorMapMediator.CLICK_BUBBLE, arg_24_0.bubblesPosList)
				end
			})
		else
			arg_24_0:emit(LiquorFloorMapMediator.CLICK_BUBBLE, arg_24_0.bubblesPosList)
		end
	end, SFX_PANEL)
end

function var_0_0.Onstory(arg_27_0)
	if not #arg_27_0.storyList or #arg_27_0.storyList == 0 then
		return
	end

	pg.NewStoryMgr.GetInstance():SeriesPlay(arg_27_0.storyList)
end

function var_0_0.CleanSpines(arg_28_0)
	if arg_28_0.spineRoles then
		table.Foreach(arg_28_0.spineRoles, function(arg_29_0, arg_29_1)
			arg_29_1:Dispose()
		end)
	end

	arg_28_0.spineRoles = {}
end

function var_0_0.InitData(arg_30_0)
	local var_30_0 = arg_30_0.activity:GetPlaceList()

	arg_30_0.shipIds = arg_30_0.activity:GetShipIds()

	arg_30_0:AchitectureMessage(var_30_0)
	arg_30_0:OnLV()
	arg_30_0:UpdateGold()

	local var_30_1 = arg_30_0.activity:getConfig("config_client")

	SetActive(arg_30_0.ui:Find("Allgold/tip"), LiquorFloorMapScene.GetLiquorFloorMapTip())
end

function var_0_0.OnPlaceDes(arg_31_0)
	local var_31_0
	local var_31_1 = arg_31_0.activity:GetPlaceList()

	arg_31_0.uilistPlace:make(function(arg_32_0, arg_32_1, arg_32_2)
		if arg_32_0 == UIItemList.EventUpdate then
			arg_31_0:UpdatePlace(arg_32_1, arg_32_2, var_31_1)
		end
	end)
	arg_31_0.uilistPlace:align(#var_31_1)
end

function var_0_0.UpdatePlace(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	i = arg_33_1 + 1
	arg_33_0._subTime = pg.TimeMgr.GetInstance():GetServerTime()

	if arg_33_3[i]:GetType() == 1 then
		SetActive(arg_33_0.architectureData[i]:Find("tip"), false)

		if arg_33_3[i]:OnStartTime() < arg_33_3[i]:GetTypeParam() * 7200 or arg_33_3[i]:GetTypeParam() == 0 then
			setImageSprite(arg_33_0.architectureData[i]:Find("numbg/icon1"), LoadSprite("ui/LiquorFloorUI_atlas", "settleGold_1"), true)
		elseif arg_33_3[i]:OnStartTime() > arg_33_3[i]:GetTypeParam() * 7200 and arg_33_3[i]:OnStartTime() < arg_33_3[i]:GetTypeParam() * 14400 then
			setImageSprite(arg_33_0.architectureData[i]:Find("numbg/icon1"), LoadSprite("ui/LiquorFloorUI_atlas", "settleGold_2"), true)
		elseif arg_33_3[i]:OnStartTime() > arg_33_3[i]:GetTypeParam() * 14400 then
			SetActive(arg_33_0.architectureData[i]:Find("tip"), true)
			setImageSprite(arg_33_0.architectureData[i]:Find("numbg/icon1"), LoadSprite("ui/LiquorFloorUI_atlas", "settleGold_3"), true)
		end
	end

	if arg_33_3[i]:OnStartTime() <= 0 then
		setText(arg_33_2:Find("numbg/Text"), "0")
	else
		setText(arg_33_2:Find("numbg/Text"), TownActivity2.GoldToShow(arg_33_3[i]:OnStartTime()))
	end
end

function var_0_0.AchitectureMessage(arg_34_0, arg_34_1)
	for iter_34_0 = 1, #arg_34_1 do
		setText(arg_34_0.architectureData[iter_34_0]:Find("lv"), arg_34_1[iter_34_0]:GetLevel())
		setText(arg_34_0.architectureData[iter_34_0]:Find("name"), arg_34_1[iter_34_0]:GetName())

		if arg_34_1[iter_34_0]:GetType() == 1 and arg_34_1[iter_34_0]:GetLevel() > 0 then
			SetActive(arg_34_0.architectureData[iter_34_0]:Find("numbg"), true)
			onButton(arg_34_0, arg_34_0.architectureData[iter_34_0]:Find("numbg"), function()
				if arg_34_1[iter_34_0]:OnStartTime() <= 0 then
					return
				end

				if arg_34_0.activity:HasMaxGold() then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("LiquorFloor_gold_max_tip")
					})
				else
					arg_34_0:emit(LiquorFloorMapMediator.ADD_WORKPLACE, arg_34_1[iter_34_0]:GetId())
				end
			end, SFX_CANCEL)
		else
			SetActive(arg_34_0.architectureData[iter_34_0]:Find("numbg"), false)
		end

		onButton(arg_34_0, arg_34_0.architectureData[iter_34_0], function()
			SetActive(arg_34_0.box, true)
			setAnchoredPosition(arg_34_0.box, var_0_0.TOP_POS[iter_34_0])
			arg_34_0:OnBox(arg_34_1[iter_34_0], iter_34_0, arg_34_0.activity)
		end, SFX_CANCEL)
	end

	arg_34_0:OnMap()
end

function var_0_0.OnMap(arg_37_0)
	local var_37_0 = arg_37_0.activity:GetPlaceList()

	for iter_37_0 = 1, #var_37_0 do
		local var_37_1 = var_37_0[iter_37_0]:GetIcon()

		setImageSprite(arg_37_0.architectureMapData[iter_37_0], LoadSprite("ui/LiquorFloorUI_atlas", var_37_1))
	end

	local var_37_2 = arg_37_0.activity:TownLevel()

	if var_37_2 >= 0 and var_37_2 <= 3 then
		setImageSprite(arg_37_0._tf:Find("bgs"), LoadSprite("ui/LiquorFloorUI_atlas", "bg1"), true)
	elseif var_37_2 > 3 and var_37_2 <= 7 then
		setImageSprite(arg_37_0._tf:Find("bgs"), LoadSprite("ui/LiquorFloorUI_atlas", "bg2"), true)
	elseif var_37_2 > 7 and var_37_2 <= 10 then
		setImageSprite(arg_37_0._tf:Find("bgs"), LoadSprite("ui/LiquorFloorUI_atlas", "bg3"), true)
	end
end

function var_0_0.UpdateGold(arg_38_0)
	local var_38_0 = TownActivity2.GoldToShow(arg_38_0.activity:GetGold())

	arg_38_0.top:Find("res/gold1/Text"):GetComponent(typeof(Text)).text = var_38_0 .. "/" .. TownActivity2.GoldToShow(arg_38_0.activity:GetLimitGold())

	setText(arg_38_0.top:Find("res/gold2/Text"), " " .. TownActivity2.GoldToShow(arg_38_0.activity:GetGold2()))
end

function var_0_0.OnLV(arg_39_0)
	local var_39_0 = arg_39_0.activity:TownLevel()

	if var_39_0 >= #arg_39_0.activity.listLVList2 + 1 then
		setFillAmount(arg_39_0.lv:Find("Slider"), 1)
		SetActive(arg_39_0.lv:Find("num_bg"), false)
	else
		setFillAmount(arg_39_0.lv:Find("Slider"), var_39_0 / arg_39_0.activity.listLVList[var_39_0])

		local var_39_1

		if arg_39_0.activity.listLVList2[var_39_0 - 1] then
			var_39_1 = arg_39_0.activity:GetPtAllGold() - arg_39_0.activity.listLVList2[var_39_0 - 1]
		else
			var_39_1 = arg_39_0.activity:GetPtAllGold()
		end

		setText(arg_39_0.lv:Find("num_bg/num"), TownActivity2.GoldToShow(var_39_1) .. "/" .. TownActivity2.GoldToShow(arg_39_0.activity.listLVList[var_39_0]))
	end

	setText(arg_39_0.lv:Find("Lv_bg/Text"), var_39_0)
	setText(arg_39_0.ui:Find("LV/lvbtn/Text"), i18n("LiquorFloor_level"))
end

function var_0_0.OnUpgradeMoveLV(arg_40_0)
	local var_40_0 = arg_40_0.activity:GetTownLevel()

	setText(arg_40_0.Text_new, var_40_0)
	SetActive(arg_40_0.Text_new, true)
	LeanTween.move(arg_40_0.Text_new, Vector3(0, 0, 0), 1):setOnComplete(System.Action(function()
		arg_40_0:OnLV()
	end))
end

function var_0_0.OnBox(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	if arg_42_1:GetType() == 1 then
		SetActive(arg_42_0.box:Find("role_bg"), false)
	elseif arg_42_1:GetType() == 3 then
		SetActive(arg_42_0.box:Find("role_bg"), true)
		arg_42_0:OnRole_bg(arg_42_1)
	else
		SetActive(arg_42_0.box:Find("role_bg"), false)
	end

	setText(arg_42_0.box:Find("box_bg/lv"), arg_42_1:GetLevel())
	setText(arg_42_0.box:Find("box_bg/name"), arg_42_1:GetName())
	setText(arg_42_0.box:Find("box_bg/describe"), arg_42_1:GetDesc())

	if arg_42_1:GetType() == 1 then
		setText(arg_42_0.box:Find("box_bg/Text"), i18n("LiquorFloor_gold"))
	elseif arg_42_1:GetType() == 2 then
		setText(arg_42_0.box:Find("box_bg/Text"), i18n("LiquorFloor_gold_num"))
	elseif arg_42_1:GetType() == 3 then
		setText(arg_42_0.box:Find("box_bg/Text"), i18n("LiquorFloor_character_num"))
	end

	local var_42_0 = arg_42_3:GetGoldOutput()

	setText(arg_42_0.box:Find("box_bg/num"), TownActivity2.GoldToShow(arg_42_1:GetTypeParam(var_42_0)))

	local var_42_1 = arg_42_0:OnNextArchitecture(arg_42_1:GetId())

	if var_42_1 == 0 then
		SetActive(arg_42_0.box:Find("box_bg/num_1"), false)
		SetActive(arg_42_0.box:Find("box_bg/decorate2"), false)
	else
		setText(arg_42_0.box:Find("box_bg/num_1"), TownActivity2.GoldToShow(var_42_1))
	end

	local var_42_2 = arg_42_1:GetNeedTownLv()

	if var_42_2 <= arg_42_3:TownLevel() and #arg_42_1:GetUpgrade() ~= 0 then
		SetActive(arg_42_0.box:Find("box_bg/num"), true)
		SetActive(arg_42_0.box:Find("box_bg/decorate2"), true)
		SetActive(arg_42_0.box:Find("box_bg/num_1"), true)
		SetActive(arg_42_0.box:Find("box_bg/btn_lock"), false)
		SetActive(arg_42_0.box:Find("box_bg/upgrade"), true)

		local var_42_3 = arg_42_1:GetUpgrade()

		setText(arg_42_0.box:Find("box_bg/upgrade/name"), i18n("LiquorFloor_update"))

		local var_42_4 = arg_42_3:GetUpgradeGold(arg_42_1:GetId())

		setText(arg_42_0.box:Find("box_bg/upgrade/num1"), TownActivity2.GoldToShow(var_42_4[1][3]))
		SetActive(arg_42_0.box:Find("box_bg/num_man"), false)

		if #var_42_4 == 1 then
			SetActive(arg_42_0.box:Find("box_bg/upgrade/icon2"), false)
			SetActive(arg_42_0.box:Find("box_bg/upgrade/num2"), false)
		else
			SetActive(arg_42_0.box:Find("box_bg/upgrade/icon2"), true)
			SetActive(arg_42_0.box:Find("box_bg/upgrade/num2"), true)
			setText(arg_42_0.box:Find("box_bg/upgrade/num2"), TownActivity2.GoldToShow(var_42_4[2][3]))
		end

		if arg_42_3:UpgradeGold(arg_42_1:GetId()) then
			arg_42_0.box:Find("box_bg/upgrade"):GetComponent(typeof(Button)).interactable = true

			onButton(arg_42_0, arg_42_0.box:Find("box_bg/upgrade"), function()
				arg_42_0:emit(LiquorFloorMapMediator.UPGRADE_WORKPLACE, arg_42_1:GetId(), arg_42_1, arg_42_2)
			end, SFX_CANCEL)
		else
			arg_42_0.box:Find("box_bg/upgrade"):GetComponent(typeof(Button)).interactable = false
		end
	elseif #arg_42_1:GetUpgrade() == 0 and var_42_2 == 0 then
		SetActive(arg_42_0.box:Find("box_bg/num"), false)
		SetActive(arg_42_0.box:Find("box_bg/decorate2"), false)
		SetActive(arg_42_0.box:Find("box_bg/num_1"), false)
		SetActive(arg_42_0.box:Find("box_bg/upgrade"), false)
		SetActive(arg_42_0.box:Find("box_bg/btn_lock/icon"), false)
		SetActive(arg_42_0.box:Find("box_bg/btn_lock"), true)
		SetActive(arg_42_0.box:Find("box_bg/btn_lock/name"), true)
		SetActive(arg_42_0.box:Find("box_bg/num_man"), true)

		local var_42_5 = arg_42_3:GetGoldOutput()

		setText(arg_42_0.box:Find("box_bg/num_man"), TownActivity2.GoldToShow(arg_42_1:GetTypeParam(var_42_5)))
		setText(arg_42_0.box:Find("box_bg/btn_lock/name"), i18n("LiquorFloor_update_max"))
	else
		SetActive(arg_42_0.box:Find("box_bg/num_man"), false)
		SetActive(arg_42_0.box:Find("box_bg/btn_lock"), true)
		SetActive(arg_42_0.box:Find("box_bg/upgrade"), false)
		setText(arg_42_0.box:Find("box_bg/btn_lock/name"), i18n("LiquorFloor_update_unlock", var_42_2))
	end
end

function var_0_0.OnRole_bg(arg_44_0, arg_44_1)
	arg_44_0.items = arg_44_0.box:Find("role_bg/list")
	arg_44_0.item = arg_44_0.items:Find("bg")
	arg_44_0.uilist = UIItemList.New(arg_44_0.items, arg_44_0.item)

	setActive(arg_44_0.item, false)
	arg_44_0.uilist:make(function(arg_45_0, arg_45_1, arg_45_2)
		if arg_45_0 == UIItemList.EventUpdate then
			arg_44_0:UpdateTask(arg_45_1, arg_45_2, arg_44_1:GetTypeParam(), arg_44_0:OnNextArchitecture(arg_44_1:GetId()), arg_44_1)
		end
	end)
	arg_44_0.uilist:align(9)
	setText(arg_44_0.box:Find("role_bg/rule1"), i18n("LiquorFloor_character_tip"))
end

function var_0_0.UpdateTask(arg_46_0, arg_46_1, arg_46_2, arg_46_3, arg_46_4, arg_46_5)
	local var_46_0 = arg_46_1 + 1

	if not arg_46_5:GetUpgrade() or #arg_46_5:GetUpgrade() == 0 then
		SetActive(arg_46_2:Find("icon"), false)
		SetActive(arg_46_2:Find("Text"), false)
		SetActive(arg_46_2:Find("btn"), false)
	else
		SetActive(arg_46_2:Find("icon"), false)
		SetActive(arg_46_2:Find("Text"), var_46_0 == arg_46_4)
	end

	setButtonEnabled(arg_46_2, var_46_0 < arg_46_4 or arg_46_4 == -1)
	SetActive(arg_46_2:Find("btn"), var_46_0 < arg_46_4 or arg_46_4 == -1)

	if var_46_0 < arg_46_4 and arg_46_4 == -1 then
		SetActive(arg_46_2:Find("Text"), false)
	elseif var_46_0 == arg_46_4 then
		SetActive(arg_46_2:Find("Text"), true)
		setText(arg_46_2:Find("Text"), i18n("LiquorFloor_character_unlock", arg_46_4))
	else
		SetActive(arg_46_2:Find("Text"), false)
	end

	local var_46_1 = LoadSprite("ui/LiquorFloorUI_atlas", "box_decorate1")

	setImageSprite(arg_46_2:Find("btn"), var_46_1, true)

	local var_46_2 = arg_46_0.shipIds[var_46_0]
	local var_46_3

	if arg_46_0.shipIds[var_46_0] then
		local var_46_4 = getProxy(BayProxy):RawGetShipById(var_46_2)

		if var_46_4 then
			local var_46_5 = LoadSprite("qicon/" .. var_46_4:getPainting())

			setImageSprite(arg_46_2:Find("btn"), var_46_5, true)
		end
	end

	onButton(arg_46_0, arg_46_2, function()
		arg_46_0:emit(LiquorFloorMapMediator.OPEN_CHUANWU, var_46_0, var_46_3, arg_46_5:GetId())
	end, SFX_CANCEL)
end

function var_0_0.OnNextArchitecture(arg_48_0, arg_48_1)
	if pg.activity_town_work_level_2[arg_48_1 + 1] then
		return pg.activity_town_work_level_2[arg_48_1 + 1].type_param
	end

	return -1
end

function var_0_0.willExit(arg_49_0)
	if arg_49_0.timer then
		arg_49_0.timer:Stop()

		arg_49_0.timer = nil
	end
end

function var_0_0.RefreshRedPoint(arg_50_0)
	setActive(arg_50_0.taskTip, var_0_0.ShouldShowTaskTip())
	SetActive(arg_50_0.storyBtn:Find("tip"), var_0_0.GetCollectionBookTip())
end

function var_0_0.ShouldShowTaskTip()
	local var_51_0 = ActivityConst.ACTIVITY_TYPE_TOWN2
	local var_51_1 = getProxy(TaskProxy)
	local var_51_2 = getProxy(ActivityProxy):getActivityByType(var_51_0):getConfig("config_client").taskActivityID
	local var_51_3 = pg.activity_template[var_51_2].config_data

	for iter_51_0, iter_51_1 in ipairs(var_51_3) do
		local var_51_4 = var_51_1:getTaskVO(iter_51_1)

		if var_51_4 and var_51_4:getTaskStatus() == 1 then
			return true
		end
	end

	return false
end

function var_0_0.getCollectDataBySiteId(arg_52_0, arg_52_1)
	for iter_52_0, iter_52_1 in ipairs(pg.activity_town_collection_2.all) do
		if pg.activity_town_collection_2[iter_52_1].id == arg_52_1 then
			return pg.activity_town_collection_2[iter_52_1]
		end
	end

	return nil
end

function var_0_0.GetCollectionBookTip()
	local var_53_0 = ActivityConst.ACTIVITY_TYPE_TOWN2
	local var_53_1 = getProxy(TaskProxy)
	local var_53_2 = getProxy(ActivityProxy):getActivityByType(var_53_0):getConfig("config_client").BookData

	for iter_53_0 = 1, #var_53_2 do
		local var_53_3 = getProxy(TaskProxy):getTaskVO(var_53_2[iter_53_0].task)

		if var_53_3 and var_53_3:getTaskStatus() == 1 then
			return true
		end
	end

	return false
end

function var_0_0.GetLiquorFloorMapTip()
	local var_54_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN2):GetPlaceList()

	for iter_54_0 = 1, #var_54_0 do
		if var_54_0[iter_54_0]:GetType() == 1 and var_54_0[iter_54_0]:GetLevel() > 0 then
			local var_54_1 = pg.activity_town_2[ActivityConst.LiquorFloor_ACT_ID].gold_time_limit

			if var_54_0[iter_54_0]:OnStartTime() >= var_54_0[iter_54_0]:GetTypeParam() * var_54_1 then
				return true
			end
		end
	end

	return false
end

return var_0_0
