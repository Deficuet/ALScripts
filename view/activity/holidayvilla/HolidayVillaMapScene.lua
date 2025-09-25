local var_0_0 = class("HolidayVillaMapScene", import("view.base.BaseUI"))
local var_0_1 = pg.activity_holiday_region
local var_0_2 = pg.activity_holiday_site

function var_0_0.getUIName(arg_1_0)
	return "HolidayVillaMapUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.mapScroll = arg_2_0:findTF("mapScroll")
	arg_2_0.map = arg_2_0:findTF("mapScroll/Viewport/map")
	arg_2_0.regionList = UIItemList.New(arg_2_0:findTF("regions", arg_2_0.map), arg_2_0:findTF("regions/region", arg_2_0.map))
	arg_2_0.siteList = UIItemList.New(arg_2_0:findTF("sites", arg_2_0.map), arg_2_0:findTF("sites/site", arg_2_0.map))
	arg_2_0.ani = arg_2_0:findTF("ani", arg_2_0.map)
	arg_2_0.backBtn = arg_2_0:findTF("ui/top/backBtn")
	arg_2_0.homeBtn = arg_2_0:findTF("ui/top/homeBtn")
	arg_2_0.helpBtn = arg_2_0:findTF("ui/top/helpBtn")
	arg_2_0.res = arg_2_0:findTF("ui/top/res")
	arg_2_0.watermelonGameBtn = arg_2_0:findTF("ui/left/watermelonGameBtn")
	arg_2_0.minerGameBtn = arg_2_0:findTF("ui/left/minerGameBtn")
	arg_2_0.springBtn = arg_2_0:findTF("ui/left/springBtn")
	arg_2_0.taskBar = arg_2_0:findTF("ui/taskBar")
	arg_2_0.bookBtn = arg_2_0:findTF("ui/bookBtn")
	arg_2_0.taskBtn = arg_2_0:findTF("ui/taskBtn")
	arg_2_0.shopBtn = arg_2_0:findTF("ui/shopBtn")
	arg_2_0.wharfBtn = arg_2_0:findTF("ui/wharfBtn")
	arg_2_0.mapScaleSlider = arg_2_0:findTF("ui/mapScaleSlider")
	arg_2_0.siteDescPage = arg_2_0:findTF("subPages/siteDescPage")
	arg_2_0.allRepairCompletePage = arg_2_0:findTF("subPages/allRepairCompletePage")

	setText(arg_2_0._tf:Find("ui/bookBtn/name"), i18n("holiday_tip_collection"))
	setText(arg_2_0._tf:Find("ui/taskBtn/name"), i18n("holiday_tip_task"))
	setText(arg_2_0._tf:Find("ui/shopBtn/name"), i18n("holiday_tip_shop"))
	setText(arg_2_0._tf:Find("ui/wharfBtn/name"), i18n("holiday_tip_trans"))
	setText(arg_2_0._tf:Find("ui/taskBar/title"), i18n("holiday_tip_task_now"))
	setText(arg_2_0.allRepairCompletePage:Find("panel/desc"), i18n("holiday_tip_finish"))
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:InitData()
	arg_3_0:RefreshData()
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.homeBtn, function()
		arg_3_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.holiday_tip_gametip.tip
		})
	end, SFX_PANEL)

	local var_3_0 = arg_3_0.mapScroll.rect.width
	local var_3_1 = arg_3_0.mapScroll.rect.height
	local var_3_2 = math.max(var_3_0 / 4096, var_3_1 / 2522)

	arg_3_0.mapScaleSlider:GetComponent(typeof(Slider)).minValue = var_3_2
	arg_3_0.mapScaleSlider:GetComponent(typeof(Slider)).value = 1

	onSlider(arg_3_0, arg_3_0.mapScaleSlider, function(arg_7_0)
		arg_3_0.map.localScale = Vector3(arg_7_0, arg_7_0, 1)

		local var_7_0 = Vector3(1 / arg_7_0, 1 / arg_7_0, 1)

		for iter_7_0 = 0, arg_3_0:findTF("regions", arg_3_0.map).childCount - 1 do
			arg_3_0:findTF("regions", arg_3_0.map):GetChild(iter_7_0).localScale = var_7_0
		end

		for iter_7_1 = 0, arg_3_0:findTF("sites", arg_3_0.map).childCount - 1 do
			arg_3_0:findTF("sites", arg_3_0.map):GetChild(iter_7_1).localScale = var_7_0
		end

		setActive(arg_3_0:findTF("regions", arg_3_0.map), arg_7_0 > 0.75)
		setActive(arg_3_0:findTF("sites", arg_3_0.map), arg_7_0 > 0.75)
	end)
	arg_3_0:Show()
	setActive(arg_3_0.ani, false)
	setActive(arg_3_0.siteDescPage, false)
	setActive(arg_3_0.allRepairCompletePage, false)
	pg.NewStoryMgr.GetInstance():Play(arg_3_0.firstStory, function()
		if not pg.NewStoryMgr.GetInstance():IsPlayed("HOLIDAY_1") then
			pg.NewGuideMgr.GetInstance():Play("HOLIDAY_1")
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = "HOLIDAY_1"
			})
		end
	end)
end

function var_0_0.InitData(arg_9_0)
	arg_9_0.activityId = ActivityConst.HOLIDAY_ACT_ID
	arg_9_0.taskActivityId = ActivityConst.HOLIDAY_TASK_ID
	arg_9_0.activityProxy = getProxy(ActivityProxy)
	arg_9_0.taskProxy = getProxy(TaskProxy)
	arg_9_0.activity = arg_9_0.activityProxy:getActivityById(arg_9_0.activityId)
	arg_9_0.exchangeTaskId = arg_9_0.activity:getConfig("config_data")[1][1]

	local var_9_0 = arg_9_0.activity:getConfig("config_client")

	arg_9_0.taskIdAndPositions = var_9_0.task
	arg_9_0.mapTimes = var_9_0.endingtime
	arg_9_0.funtionIds = var_9_0.function_id
	arg_9_0.firstStory = var_9_0.first_story
end

function var_0_0.RefreshData(arg_10_0)
	arg_10_0.activity = arg_10_0.activityProxy:getActivityById(arg_10_0.activityId)
	arg_10_0.hasExchanged = arg_10_0.activity.data1 == 1
	arg_10_0.clickedSiteIds = arg_10_0.activity:getData1List()
end

function var_0_0.Show(arg_11_0)
	arg_11_0:ExchangeAndSiteClick()
	arg_11_0:ShowMap()
	arg_11_0:ShowUI()
end

function var_0_0.ExchangeAndSiteClick(arg_12_0)
	local var_12_0 = arg_12_0.taskProxy:getFinishTaskById(arg_12_0.exchangeTaskId)

	if arg_12_0.activity:getData1() == 0 and var_12_0 and not arg_12_0.doingExchange then
		arg_12_0.beforeExchangeResList = {
			{
				66001,
				arg_12_0.activity:getVitemNumber(66001)
			},
			{
				66002,
				arg_12_0.activity:getVitemNumber(66002)
			},
			{
				66003,
				arg_12_0.activity:getVitemNumber(66003)
			},
			{
				66004,
				arg_12_0.activity:getVitemNumber(66004)
			},
			{
				66005,
				arg_12_0.activity:getVitemNumber(66005)
			}
		}

		arg_12_0:emit(HolidayVillaMapMediator.EXCHANGE_RESOURCES, arg_12_0.activityId)

		arg_12_0.doingExchange = true
	end

	for iter_12_0, iter_12_1 in ipairs(var_0_1.all) do
		local var_12_1 = var_0_1[iter_12_1]

		if arg_12_0.taskProxy:getTaskVO(var_12_1.task_id):getTaskStatus() == 2 and not table.contains(arg_12_0.clickedSiteIds, var_12_1.site_id) then
			arg_12_0:emit(HolidayVillaMapMediator.SITE_CLICKED, arg_12_0.activityId, var_12_1.site_id)
		end
	end

	for iter_12_2, iter_12_3 in ipairs(var_0_2.all) do
		local var_12_2 = var_0_2[iter_12_3]

		if var_12_2.type == 1 and table.contains(arg_12_0.clickedSiteIds, var_12_2.id) and not pg.NewStoryMgr.GetInstance():IsPlayed(var_12_2.jumpto) then
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = var_12_2.jumpto
			})
		end
	end
end

function var_0_0.ShowMap(arg_13_0)
	local var_13_0 = 0

	arg_13_0.regionList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = var_0_1.all[arg_14_1 + 1]
			local var_14_1 = var_0_1[var_14_0]
			local var_14_2 = var_0_2[var_14_1.site_id]
			local var_14_3 = arg_13_0.taskProxy:getTaskVO(var_14_1.task_id)
			local var_14_4 = var_14_3:getTaskStatus()

			if var_14_2.task_id == 0 then
				setActive(arg_14_2, var_14_4 ~= 2)
			else
				local var_14_5 = arg_13_0.taskProxy:getTaskVO(var_14_2.task_id):getTaskStatus()

				setActive(arg_14_2, var_14_5 == 2 and var_14_4 ~= 2)
			end

			if var_14_4 ~= 2 then
				arg_14_2.anchoredPosition = Vector2(var_14_1.locate[1], var_14_1.locate[2])

				setText(arg_14_2:Find("name"), var_14_2.name)

				local var_14_6 = var_14_3:getConfig("target_id_2")

				arg_13_0:SetRes(arg_14_2:Find("res"), var_14_6)
				onButton(arg_13_0, arg_14_2, function()
					for iter_15_0, iter_15_1 in ipairs(var_14_6) do
						local var_15_0 = iter_15_1[1]

						if iter_15_1[2] > arg_13_0.activity:getVitemNumber(var_15_0) then
							pg.TipsMgr.GetInstance():ShowTips(i18n("holiday_tip_rebuild_not"))

							return
						end
					end

					setActive(arg_13_0.ani, true)

					arg_13_0.ani.anchoredPosition = Vector2(var_14_1.rebuild_ani[1], var_14_1.rebuild_ani[2])

					SetActionCallback(arg_13_0.ani, function(arg_16_0)
						if arg_16_0 == "finish" then
							setActive(arg_13_0.ani, false)
							arg_13_0:emit(HolidayVillaMapMediator.ON_TASK_SUBMIT_ONESTEP, arg_13_0.taskActivityId, {
								var_14_1.task_id
							}, function(arg_17_0)
								if arg_17_0 then
									local var_17_0

									if var_14_0 == 1 then
										var_17_0 = "HOLIDAY_2"
									elseif var_14_0 == 3 then
										var_17_0 = "HOLIDAY_3"
									elseif var_14_0 == 4 then
										var_17_0 = "HOLIDAY_4"
									elseif var_14_0 == 5 then
										var_17_0 = "HOLIDAY_5"
									elseif var_14_0 == 6 then
										var_17_0 = "HOLIDAY_6"
									end

									arg_13_0:ShowSiteDescPage(var_14_2, true, function()
										if var_17_0 and not pg.NewStoryMgr.GetInstance():IsPlayed(var_17_0) then
											pg.NewGuideMgr.GetInstance():Play(var_17_0)
											pg.m02:sendNotification(GAME.STORY_UPDATE, {
												storyId = var_17_0
											})
										end
									end)
									arg_13_0:emit(HolidayVillaMapMediator.SITE_CLICKED, arg_13_0.activityId, var_14_1.site_id)
								end
							end)
						end
					end)
					SetAction(arg_13_0.ani, "normal", false)
				end, SFX_PANEL)
			else
				var_13_0 = var_13_0 + 1
			end
		end
	end)
	arg_13_0.regionList:align(#var_0_1.all)

	for iter_13_0 = 0, 8 do
		setActive(arg_13_0.map:GetChild(iter_13_0), false)
	end

	if var_13_0 ~= 6 then
		setActive(arg_13_0:findTF("bg" .. var_13_0, arg_13_0.map), true)
	else
		local var_13_1 = pg.TimeMgr.GetInstance():GetServerHour()

		for iter_13_1, iter_13_2 in ipairs(arg_13_0.mapTimes) do
			local var_13_2 = iter_13_2[1][1]
			local var_13_3 = iter_13_2[1][2]
			local var_13_4 = iter_13_2[2]
			local var_13_5 = iter_13_2[3]

			if var_13_2 <= var_13_1 and var_13_1 < var_13_3 then
				setActive(arg_13_0:findTF("bg" .. var_13_0 .. "_" .. var_13_4, arg_13_0.map), true)

				if arg_13_0.bgm ~= var_13_5 then
					arg_13_0.bgm = var_13_5

					pg.BgmMgr.GetInstance():Push(arg_13_0.__cname, var_13_5)
				end

				break
			end
		end
	end

	local var_13_6 = {
		1,
		2,
		3
	}
	local var_13_7 = Clone(var_0_2.all)

	for iter_13_3 = #var_13_7, 1, -1 do
		if not table.contains(var_13_6, var_0_2[var_13_7[iter_13_3]].type) then
			table.remove(var_13_7, iter_13_3)
		end
	end

	arg_13_0.siteList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			local var_19_0 = var_13_7[arg_19_1 + 1]
			local var_19_1 = var_0_2[var_19_0]
			local var_19_2 = var_19_1.type
			local var_19_3 = arg_13_0.taskProxy:getFinishTaskById(var_19_1.task_id)

			setActive(arg_19_2:Find("1"), var_19_2 == 2)
			setActive(arg_19_2:Find("2"), var_19_2 == 1 or var_19_2 == 3)

			if var_19_3 and not table.contains(arg_13_0.clickedSiteIds, var_19_0) then
				arg_19_2.anchoredPosition = Vector2(var_19_1.locate[1], var_19_1.locate[2])

				if var_19_2 == 1 then
					for iter_19_0 = 0, arg_19_2:Find("2").childCount - 1 do
						local var_19_4 = arg_19_2:Find("2"):GetChild(iter_19_0)

						setActive(var_19_4, var_19_4.name == var_19_1.icon)
					end

					onButton(arg_13_0, arg_19_2, function()
						pg.NewStoryMgr.GetInstance():Play(var_19_1.jumpto)
						arg_13_0:emit(HolidayVillaMapMediator.SITE_CLICKED, arg_13_0.activityId, var_19_0)
					end, SFX_PANEL)
				elseif var_19_2 == 2 then
					setText(arg_19_2:Find("1/name"), var_19_1.name)
					onButton(arg_13_0, arg_19_2, function()
						if var_19_0 == arg_13_0.funtionIds[1] then
							triggerButton(arg_13_0.watermelonGameBtn)
						elseif var_19_0 == arg_13_0.funtionIds[2] then
							triggerButton(arg_13_0.minerGameBtn)
						elseif var_19_0 == arg_13_0.funtionIds[3] then
							triggerButton(arg_13_0.springBtn)
						elseif var_19_0 == arg_13_0.funtionIds[4] then
							triggerButton(arg_13_0.wharfBtn)
						end
					end, SFX_PANEL)
				elseif var_19_2 == 3 then
					for iter_19_1 = 0, arg_19_2:Find("2").childCount - 1 do
						local var_19_5 = arg_19_2:Find("2"):GetChild(iter_19_1)

						setActive(var_19_5, var_19_5.name == var_19_1.icon)
					end

					onButton(arg_13_0, arg_19_2, function()
						arg_13_0:ShowSiteDescPage(var_19_1, false)
						arg_13_0:emit(HolidayVillaMapMediator.SITE_CLICKED, arg_13_0.activityId, var_19_0)
					end, SFX_PANEL)
				end
			else
				setActive(arg_19_2, false)
			end
		end
	end)
	arg_13_0.siteList:align(#var_13_7)
end

function var_0_0.ShowUI(arg_23_0)
	local var_23_0 = {
		{
			66001,
			arg_23_0.activity:getVitemNumber(66001)
		},
		{
			66002,
			arg_23_0.activity:getVitemNumber(66002)
		},
		{
			66003,
			arg_23_0.activity:getVitemNumber(66003)
		},
		{
			66004,
			arg_23_0.activity:getVitemNumber(66004)
		}
	}

	arg_23_0:SetRes(arg_23_0.res, var_23_0)

	local var_23_1 = var_0_2[arg_23_0.funtionIds[1]].task_id
	local var_23_2 = arg_23_0.taskProxy:getFinishTaskById(var_23_1)

	setActive(arg_23_0:findTF("lock", arg_23_0.watermelonGameBtn), not var_23_2)
	setActive(arg_23_0:findTF("remain", arg_23_0.watermelonGameBtn), var_23_2)

	if var_23_2 then
		setText(arg_23_0:findTF("remain/Text", arg_23_0.watermelonGameBtn), getProxy(MiniGameProxy):GetHubByGameId(76).count)
		onButton(arg_23_0, arg_23_0.watermelonGameBtn, function()
			arg_23_0:emit(HolidayVillaMapMediator.OPEN_MINI_GAME, 76)
		end, SFX_PANEL)
	else
		onButton(arg_23_0, arg_23_0.watermelonGameBtn, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("activity_holiday_function_lock"))
		end, SFX_PANEL)
	end

	local var_23_3 = var_0_2[arg_23_0.funtionIds[2]].task_id
	local var_23_4 = arg_23_0.taskProxy:getFinishTaskById(var_23_3)

	setActive(arg_23_0:findTF("lock", arg_23_0.minerGameBtn), not var_23_4)
	setActive(arg_23_0:findTF("remain", arg_23_0.minerGameBtn), var_23_4)

	if var_23_4 then
		setText(arg_23_0:findTF("remain/Text", arg_23_0.minerGameBtn), getProxy(MiniGameProxy):GetHubByGameId(77).count)
		onButton(arg_23_0, arg_23_0.minerGameBtn, function()
			arg_23_0:emit(HolidayVillaMapMediator.OPEN_MINI_GAME, 77)
		end, SFX_PANEL)
	else
		onButton(arg_23_0, arg_23_0.minerGameBtn, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("activity_holiday_function_lock"))
		end, SFX_PANEL)
	end

	local var_23_5 = var_0_2[arg_23_0.funtionIds[3]].task_id
	local var_23_6 = arg_23_0.taskProxy:getFinishTaskById(var_23_5)

	setActive(arg_23_0:findTF("lock", arg_23_0.springBtn), not var_23_6)
	setActive(arg_23_0:findTF("tip", arg_23_0.springBtn), var_23_6)

	if var_23_6 then
		setActive(arg_23_0:findTF("tip", arg_23_0.springBtn), false)
		onButton(arg_23_0, arg_23_0.springBtn, function()
			arg_23_0:emit(HolidayVillaMapMediator.GO_HOTSPRING)
		end, SFX_PANEL)
	else
		onButton(arg_23_0, arg_23_0.springBtn, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("activity_holiday_function_lock"))
		end, SFX_PANEL)
	end

	local var_23_7 = arg_23_0.taskIdAndPositions[1][1]
	local var_23_8 = arg_23_0.taskProxy:getFinishTaskById(var_23_7)

	setActive(arg_23_0.bookBtn, var_23_8)
	setActive(arg_23_0.taskBtn, var_23_8)
	setActive(arg_23_0.shopBtn, var_23_8)
	setActive(arg_23_0.wharfBtn, var_23_8)

	if var_23_8 then
		setActive(arg_23_0:findTF("tip", arg_23_0.bookBtn), CollectionBookMediator.GetCollectionBookTip())
		onButton(arg_23_0, arg_23_0.bookBtn, function()
			arg_23_0:emit(HolidayVillaMapMediator.ON_BOOK)
		end, SFX_PANEL)
		setActive(arg_23_0:findTF("tip", arg_23_0.taskBtn), HolidayVillaTasksLayer.ShouldShowTip())
		onButton(arg_23_0, arg_23_0.taskBtn, function()
			arg_23_0:emit(HolidayVillaMapMediator.OPEN_HolidayVilla_TASk)
		end, SFX_PANEL)
		setText(arg_23_0:findTF("res/Text", arg_23_0.shopBtn), arg_23_0.activity:getVitemNumber(66005))
		onButton(arg_23_0, arg_23_0.shopBtn, function()
			arg_23_0:emit(HolidayVillaMapMediator.ON_SHOP)
		end, SFX_PANEL)
		setText(arg_23_0:findTF("res/Text", arg_23_0.wharfBtn), arg_23_0.activity:getVitemNumber(66006))
		onButton(arg_23_0, arg_23_0.wharfBtn, function()
			arg_23_0:emit(HolidayVillaMapMediator.OPEN_WHARF)
		end, SFX_PANEL)
	end

	arg_23_0:SetTaskBar()
end

function var_0_0.SetRes(arg_34_0, arg_34_1, arg_34_2)
	for iter_34_0 = 0, arg_34_1.childCount - 1 do
		setActive(arg_34_1:GetChild(iter_34_0), false)
	end

	for iter_34_1, iter_34_2 in ipairs(arg_34_2) do
		local var_34_0 = iter_34_2[1]
		local var_34_1 = iter_34_2[2]

		for iter_34_3 = 0, arg_34_1.childCount - 1 do
			local var_34_2 = arg_34_1:GetChild(iter_34_3)

			if var_34_2.name == tostring(var_34_0) then
				setActive(var_34_2, true)
				setText(arg_34_0:findTF("Text", var_34_2), var_34_1)

				break
			end
		end
	end
end

function var_0_0.SetTaskBar(arg_35_0)
	local var_35_0 = false

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.taskIdAndPositions) do
		local var_35_1 = iter_35_1[1]
		local var_35_2 = iter_35_1[2]
		local var_35_3 = arg_35_0.taskProxy:getTaskVO(var_35_1)

		if var_35_3:getTaskStatus() ~= 2 then
			var_35_0 = true

			if arg_35_0.nowTaskId ~= var_35_1 then
				arg_35_0.nowTaskId = var_35_1
				arg_35_0.initTaskPosition = false
			end

			setText(arg_35_0:findTF("desc", arg_35_0.taskBar), var_35_3:getConfig("desc"))
			onButton(arg_35_0, arg_35_0.taskBar, function()
				arg_35_0.mapScaleSlider:GetComponent(typeof(Slider)).value = 1

				local var_36_0 = arg_35_0.mapScroll.rect.width
				local var_36_1 = arg_35_0.mapScroll.rect.height

				scrollTo(arg_35_0.mapScroll, ((4096 - var_36_0) / 2 - var_35_2[1]) / (4096 - var_36_0), ((2522 - var_36_1) / 2 - var_35_2[2]) / (2522 - var_36_1))
			end, SFX_PANEL)

			break
		end
	end

	if not var_35_0 then
		setText(arg_35_0:findTF("desc", arg_35_0.taskBar), i18n("holiday_tip_task_finish"))
		onButton(arg_35_0, arg_35_0.taskBar, function()
			arg_35_0.mapScaleSlider:GetComponent(typeof(Slider)).value = 1

			scrollTo(arg_35_0.mapScroll, 0.5, 0.5)
		end, SFX_PANEL)
	end

	if not arg_35_0.initTaskPosition then
		arg_35_0.initTaskPosition = true

		triggerButton(arg_35_0.taskBar)
	end
end

function var_0_0.ShowSiteDescPage(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	setActive(arg_38_0.siteDescPage, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_38_0.siteDescPage)
	setActive(arg_38_0.siteDescPage:Find("repairComplete"), arg_38_2)
	setText(arg_38_0:findTF("panel/name", arg_38_0.siteDescPage), arg_38_1.jumpto[1][1])
	setText(arg_38_0:findTF("panel/desc", arg_38_0.siteDescPage), arg_38_1.jumpto[2][1])
	LoadImageSpriteAsync(arg_38_1.jumpto[3][1], arg_38_0:findTF("panel/picBg/mask/picture", arg_38_0.siteDescPage))
	onButton(arg_38_0, arg_38_0:findTF("bg", arg_38_0.siteDescPage), function()
		setActive(arg_38_0.siteDescPage, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_38_0.siteDescPage, arg_38_0._tf:Find("subPages"))

		if arg_38_3 then
			arg_38_3()
		end
	end, SFX_CANCEL)
	onButton(arg_38_0, arg_38_0:findTF("closeBtn", arg_38_0.siteDescPage), function()
		setActive(arg_38_0.siteDescPage, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_38_0.siteDescPage, arg_38_0._tf:Find("subPages"))

		if arg_38_3 then
			arg_38_3()
		end
	end, SFX_CANCEL)
end

function var_0_0.ShowAllRepairPage(arg_41_0)
	setActive(arg_41_0.allRepairCompletePage, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_41_0.allRepairCompletePage)
	arg_41_0:SetRes(arg_41_0:findTF("panel/source/res", arg_41_0.allRepairCompletePage), arg_41_0.beforeExchangeResList)
	setText(arg_41_0:findTF("panel/destination/res/Text", arg_41_0.allRepairCompletePage), arg_41_0.activity:getVitemNumber(66005) - arg_41_0.beforeExchangeResList[5][2])
	onButton(arg_41_0, arg_41_0:findTF("bg", arg_41_0.allRepairCompletePage), function()
		setActive(arg_41_0.allRepairCompletePage, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_41_0.allRepairCompletePage, arg_41_0._tf:Find("subPages"))
	end, SFX_CANCEL)
	onButton(arg_41_0, arg_41_0:findTF("closeBtn", arg_41_0.allRepairCompletePage), function()
		setActive(arg_41_0.allRepairCompletePage, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_41_0.allRepairCompletePage, arg_41_0._tf:Find("subPages"))
	end, SFX_CANCEL)
end

function var_0_0.willExit(arg_44_0)
	return
end

function var_0_0.onBackPressed(arg_45_0)
	if isActive(arg_45_0.siteDescPage) then
		setActive(arg_45_0.siteDescPage, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_45_0.siteDescPage, arg_45_0._tf:Find("subPages"))

		return
	end

	if isActive(arg_45_0.allRepairCompletePage) then
		setActive(arg_45_0.allRepairCompletePage, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_45_0.allRepairCompletePage, arg_45_0._tf:Find("subPages"))

		return
	end

	arg_45_0:closeView()
end

function var_0_0.IsShowMainTip(arg_46_0)
	local var_46_0 = arg_46_0:getConfig("config_client").task
	local var_46_1 = arg_46_0:getConfig("config_client").function_id
	local var_46_2 = var_0_2[var_46_1[1]].task_id
	local var_46_3 = getProxy(TaskProxy):getFinishTaskById(var_46_2)
	local var_46_4 = var_0_2[var_46_1[2]].task_id
	local var_46_5 = getProxy(TaskProxy):getFinishTaskById(var_46_4)
	local var_46_6 = var_46_0[1][1]
	local var_46_7 = getProxy(TaskProxy):getFinishTaskById(var_46_6)

	return var_46_3 and getProxy(MiniGameProxy):GetHubByGameId(76).count > 0 or var_46_5 and getProxy(MiniGameProxy):GetHubByGameId(77).count > 0 or var_46_7 and CollectionBookMediator.GetCollectionBookTip() or var_46_7 and HolidayVillaTasksLayer.ShouldShowTip()
end

return var_0_0
