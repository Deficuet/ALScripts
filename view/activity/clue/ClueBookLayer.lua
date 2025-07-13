local var_0_0 = class("ClueBookLayer", import("view.base.BaseUI"))
local var_0_1 = pg.activity_clue
local var_0_2 = pg.activity_clue_group
local var_0_3 = pg.activity_clue_ending

function var_0_0.getUIName(arg_1_0)
	return "ClueBookUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.closeBtn = arg_2_0:findTF("frame/close")
	arg_2_0.pageTgs = {
		arg_2_0:findTF("frame/toggles/sitePageTg"),
		arg_2_0:findTF("frame/toggles/charaPageTg"),
		arg_2_0:findTF("frame/toggles/endingPageTg"),
		arg_2_0:findTF("frame/toggles/storyPageTg")
	}
	arg_2_0.pages = arg_2_0:findTF("frame/pages")
	arg_2_0.sitePage = arg_2_0:findTF("sitePage", arg_2_0.pages)
	arg_2_0.charaPage = arg_2_0:findTF("charaPage", arg_2_0.pages)
	arg_2_0.endingPage = arg_2_0:findTF("endingPage", arg_2_0.pages)
	arg_2_0.storyPage = arg_2_0:findTF("storyPage", arg_2_0.pages)
	arg_2_0.award = arg_2_0:findTF("frame/award")

	setText(arg_2_0:findTF("Text", arg_2_0.pageTgs[1]), i18n("clue_title_1"))
	setText(arg_2_0:findTF("selected/Text", arg_2_0.pageTgs[1]), i18n("clue_title_1"))
	setText(arg_2_0:findTF("Text", arg_2_0.pageTgs[2]), i18n("clue_title_2"))
	setText(arg_2_0:findTF("selected/Text", arg_2_0.pageTgs[2]), i18n("clue_title_2"))
	setText(arg_2_0:findTF("Text", arg_2_0.pageTgs[3]), i18n("clue_title_3"))
	setText(arg_2_0:findTF("selected/Text", arg_2_0.pageTgs[3]), i18n("clue_title_3"))
	setText(arg_2_0:findTF("Text", arg_2_0.pageTgs[4]), i18n("clue_title_4"))
	setText(arg_2_0:findTF("selected/Text", arg_2_0.pageTgs[4]), i18n("clue_title_4"))

	for iter_2_0 = 1, 3 do
		setText(arg_2_0:findTF("right/Viewport/Content/siteGroup" .. iter_2_0 .. "/goBtn/Text", arg_2_0.sitePage), i18n("clue_task_goto"))
	end

	setText(arg_2_0:findTF("right/goBtn/Text", arg_2_0.charaPage), i18n("clue_task_goto"))
	setText(arg_2_0:findTF("doing/Text", arg_2_0.award), i18n("clue_get"))
	setText(arg_2_0:findTF("get/Text", arg_2_0.award), i18n("clue_get"))
	setText(arg_2_0:findTF("got/Text", arg_2_0.award), i18n("clue_got"))
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:InitData()
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:StopBgm()
		arg_3_0:closeView()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0:findTF("mask"), function()
		arg_3_0:StopBgm()
		arg_3_0:closeView()
	end, SFX_PANEL)
	arg_3_0:InitView()
	arg_3_0:UpdateView()
	pg.BgmMgr.GetInstance():Push(arg_3_0.__cname, arg_3_0.bgm)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf, false)
end

function var_0_0.InitData(arg_6_0)
	arg_6_0.activityId = ActivityConst.Valleyhospital_ACT_ID
	arg_6_0.taskActivityId = ActivityConst.Valleyhospital_TASK_ID
	arg_6_0.activity = getProxy(ActivityProxy):getActivityById(arg_6_0.activityId)
	arg_6_0.taskProxy = getProxy(TaskProxy)

	local var_6_0 = arg_6_0.activity:getConfig("config_client")

	arg_6_0.clueSite = var_6_0.clue_site
	arg_6_0.clueChara = var_6_0.clue_chara
	arg_6_0.clueEnding = var_6_0.clue_ending
	arg_6_0.story = var_6_0.story
	arg_6_0.storyTaskId = var_6_0.storyTaskId
	arg_6_0.afterStory = var_6_0.afterStory
	arg_6_0.bgm = var_6_0.bgm2
	arg_6_0.pageIndex = 1
	arg_6_0.subPageSiteIndex = 1
	arg_6_0.subPageCharaIndex = 1
	arg_6_0.subPageEndingIndex = 1
	arg_6_0.endingIndex = 1
	arg_6_0.storyIndex = 1
	arg_6_0.playerId = getProxy(PlayerProxy):getRawData().id
	arg_6_0.investigatingGroupId = PlayerPrefs.GetInt("investigatingGroupId_" .. arg_6_0.activityId .. "_" .. arg_6_0.playerId)
end

function var_0_0.InitView(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.pageTgs) do
		setActive(arg_7_0:findTF("selected", iter_7_1), arg_7_0.pageIndex == iter_7_0)
		onToggle(arg_7_0, iter_7_1, function(arg_8_0)
			if arg_8_0 then
				arg_7_0.pageIndex = iter_7_0

				for iter_8_0 = 0, arg_7_0.pages.childCount - 1 do
					setActive(arg_7_0.pages:GetChild(iter_8_0), iter_8_0 == iter_7_0 - 1)
					setActive(arg_7_0:findTF("tip", arg_7_0.pageTgs[iter_8_0 + 1]), var_0_0.ShouldShowTip(iter_8_0 + 1))
					setActive(arg_7_0:findTF("selected", arg_7_0.pageTgs[iter_8_0 + 1]), arg_7_0.pageIndex == iter_8_0 + 1)
				end

				if iter_7_0 == 1 then
					arg_7_0:ShowSitePage()
				elseif iter_7_0 == 2 then
					arg_7_0:ShowCharaPage()
				elseif iter_7_0 == 3 then
					arg_7_0:ShowEndingPage()
				elseif iter_7_0 == 4 then
					arg_7_0:ShowStoryPage()
				end
			end
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateView(arg_9_0)
	triggerToggle(arg_9_0.pageTgs[arg_9_0.pageIndex], true)
end

function var_0_0.SetClueGroup(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = var_0_2[arg_10_1]
	local var_10_1 = var_0_1.get_id_list_by_group[arg_10_1]
	local var_10_2 = {
		var_0_1[var_10_1[1]],
		var_0_1[var_10_1[2]],
		var_0_1[var_10_1[3]]
	}
	local var_10_3 = {}
	local var_10_4 = arg_10_0.taskProxy:getTaskVO(tonumber(var_10_2[3].task_id)):getProgress()

	for iter_10_0 = 1, 3 do
		var_10_3[iter_10_0] = arg_10_0.taskProxy:getFinishTaskById(tonumber(var_10_2[iter_10_0].task_id))
	end

	setText(arg_10_0:findTF("title/Text", arg_10_2), var_10_0.title)
	setActive(arg_10_0:findTF("title/Text", arg_10_2), var_10_3[1] or var_10_3[2] or var_10_3[3])
	setActive(arg_10_0:findTF("title/lock", arg_10_2), not var_10_3[1] and not var_10_3[2] and not var_10_3[3])
	LoadImageSpriteAsync("cluepictures/" .. var_10_0.pic, arg_10_0:findTF("picture", arg_10_2), false)
	setActive(arg_10_0:findTF("picture/lock", arg_10_2), not var_10_3[1] and not var_10_3[2] and not var_10_3[3])

	local var_10_5 = false

	for iter_10_1 = 1, 3 do
		if var_10_3[iter_10_1] then
			setText(arg_10_0:findTF("clue" .. iter_10_1, arg_10_2), var_10_2[iter_10_1].desc)
		elseif arg_10_0.investigatingGroupId == arg_10_1 then
			setText(arg_10_0:findTF("clue" .. iter_10_1, arg_10_2), "<color=#858593>" .. var_10_2[iter_10_1].unlock_desc .. var_10_2[iter_10_1].unlock_num .. i18n("clue_task_tip", var_10_4) .. "</color>")
		elseif not var_10_5 then
			var_10_5 = true

			setText(arg_10_0:findTF("clue" .. iter_10_1, arg_10_2), "<color=#858593>" .. var_10_2[iter_10_1].unlock_desc .. var_10_2[iter_10_1].unlock_num .. i18n("clue_task_tip", var_10_4) .. "</color>")
		else
			setText(arg_10_0:findTF("clue" .. iter_10_1, arg_10_2), "<color=#858593>？？？</color>")
		end
	end

	setActive(arg_10_0:findTF("goBtn", arg_10_2), not var_10_3[1] or not var_10_3[2] or not var_10_3[3])
	setActive(arg_10_0:findTF("goBtn/selected", arg_10_2), arg_10_0.investigatingGroupId == arg_10_1)
	onButton(arg_10_0, arg_10_0:findTF("goBtn", arg_10_2), function()
		arg_10_0.investigatingGroupId = arg_10_1

		PlayerPrefs.SetInt("investigatingGroupId_" .. arg_10_0.activityId .. "_" .. arg_10_0.playerId, arg_10_1)
		setActive(arg_10_0:findTF("goBtn/selected", arg_10_2), true)

		if arg_10_0.pageIndex == 1 then
			arg_10_0:ShowSitePage()
		elseif arg_10_0.pageIndex == 2 then
			arg_10_0:ShowCharaPage()
		end

		arg_10_0:OpenChapter(arg_10_1)
	end, SFX_PANEL)
end

function var_0_0.SetAward(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.taskProxy:getTaskVO(arg_12_1)
	local var_12_1 = var_12_0:getConfig("award_display")[1]
	local var_12_2 = {
		type = var_12_1[1],
		id = var_12_1[2],
		count = var_12_1[3]
	}

	updateDrop(arg_12_0:findTF("mask/IconTpl", arg_12_0.award), var_12_2)
	onButton(arg_12_0, arg_12_0:findTF("mask", arg_12_0.award), function()
		arg_12_0:emit(BaseUI.ON_DROP, var_12_2)
	end, SFX_PANEL)

	local var_12_3 = var_12_0:getTaskStatus()

	setText(arg_12_0:findTF("Text", arg_12_0.award), var_12_0:getConfig("desc"))
	setActive(arg_12_0:findTF("mask/IconTpl/mask", arg_12_0.award), var_12_3 == 2)
	setActive(arg_12_0:findTF("doing", arg_12_0.award), var_12_3 == 0)
	setActive(arg_12_0:findTF("get", arg_12_0.award), var_12_3 == 1)
	setActive(arg_12_0:findTF("got", arg_12_0.award), var_12_3 == 2)

	if arg_12_2 then
		onButton(arg_12_0, arg_12_0:findTF("get", arg_12_0.award), function()
			arg_12_0:emit(ClueBookMediator.ON_TASK_SUBMIT_ONESTEP, arg_12_0.taskActivityId, {
				arg_12_1
			}, function(arg_15_0)
				if arg_15_0 then
					arg_12_2()
				end
			end)
		end, SFX_PANEL)
	else
		onButton(arg_12_0, arg_12_0:findTF("get", arg_12_0.award), function()
			local var_16_0 = {}
			local var_16_1 = var_12_0:getConfig("award_display")
			local var_16_2 = getProxy(PlayerProxy):getRawData()
			local var_16_3 = pg.gameset.urpt_chapter_max.description[1]
			local var_16_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_16_3)
			local var_16_5, var_16_6 = Task.StaticJudgeOverflow(var_16_2.gold, var_16_2.oil, var_16_4, true, true, var_16_1)

			if var_16_5 then
				table.insert(var_16_0, function(arg_17_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_ITEM_BOX,
						content = i18n("award_max_warning"),
						items = var_16_6,
						onYes = arg_17_0
					})
				end)
			end

			seriesAsync(var_16_0, function()
				arg_12_0:emit(ClueBookMediator.ON_TASK_SUBMIT_ONESTEP, arg_12_0.taskActivityId, {
					arg_12_1
				})
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.ShowSitePage(arg_19_0)
	local var_19_0 = UIItemList.New(arg_19_0:findTF("left/Viewport/Content", arg_19_0.sitePage), arg_19_0:findTF("left/Viewport/Content/pageTg", arg_19_0.sitePage))

	var_19_0:make(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == UIItemList.EventUpdate then
			local var_20_0 = arg_19_0.clueSite[arg_20_1 + 1]
			local var_20_1 = tonumber(var_0_2[var_20_0[1]].task_id)
			local var_20_2 = arg_19_0.taskProxy:getTaskVO(var_20_1):getTaskStatus()

			setText(arg_20_2:Find("Text"), "PAGE  " .. string.format("%02d", arg_20_1 + 1))
			setText(arg_20_2:Find("selected/Text"), "PAGE  " .. string.format("%02d", arg_20_1 + 1))
			setActive(arg_20_2:Find("Text"), arg_19_0.subPageSiteIndex ~= arg_20_1 + 1)
			setActive(arg_20_2:Find("selected"), arg_19_0.subPageSiteIndex == arg_20_1 + 1)
			setActive(arg_20_2:Find("completed"), var_20_2 == 2)
			setActive(arg_20_2:Find("tip"), var_20_2 == 1)
			onToggle(arg_19_0, arg_20_2, function(arg_21_0)
				if arg_21_0 then
					arg_19_0.subPageSiteIndex = arg_20_1 + 1

					for iter_21_0 = 1, #arg_19_0.clueSite do
						setActive(arg_19_0:findTF("left/Viewport/Content", arg_19_0.sitePage):GetChild(iter_21_0 - 1):Find("Text"), arg_19_0.subPageSiteIndex ~= iter_21_0)
						setActive(arg_19_0:findTF("left/Viewport/Content", arg_19_0.sitePage):GetChild(iter_21_0 - 1):Find("selected"), arg_19_0.subPageSiteIndex == iter_21_0)
					end

					for iter_21_1 = 1, 3 do
						local var_21_0 = var_20_0[iter_21_1]

						arg_19_0:SetClueGroup(var_21_0, arg_19_0:findTF("right/Viewport/Content/siteGroup" .. iter_21_1, arg_19_0.sitePage))
					end

					arg_19_0:SetAward(var_20_1)
				end
			end, SFX_PANEL)

			if arg_19_0.subPageSiteIndex == arg_20_1 + 1 then
				triggerToggle(arg_20_2, true)
			end
		end
	end)
	var_19_0:align(#arg_19_0.clueSite)
end

function var_0_0.ShowCharaPage(arg_22_0)
	local var_22_0 = UIItemList.New(arg_22_0:findTF("left/Viewport/Content", arg_22_0.charaPage), arg_22_0:findTF("left/Viewport/Content/pageTg", arg_22_0.charaPage))

	var_22_0:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventUpdate then
			local var_23_0 = arg_22_0.clueChara[arg_23_1 + 1][1]
			local var_23_1 = tonumber(var_0_2[var_23_0].task_id)
			local var_23_2 = arg_22_0.taskProxy:getTaskVO(var_23_1):getTaskStatus()

			if arg_22_0:GetGroupClueCompleteCount(var_23_0) == 0 then
				setText(arg_23_2:Find("Text"), "？？？")
				setText(arg_23_2:Find("selected/Text"), "？？？")
			else
				setText(arg_23_2:Find("Text"), var_0_2[var_23_0].title)
				setText(arg_23_2:Find("selected/Text"), var_0_2[var_23_0].title)
			end

			setActive(arg_23_2:Find("Text"), arg_22_0.subPageCharaIndex ~= arg_23_1 + 1)
			setActive(arg_23_2:Find("selected"), arg_22_0.subPageCharaIndex == arg_23_1 + 1)
			setActive(arg_23_2:Find("Text/completed"), var_23_2 == 2)
			setActive(arg_23_2:Find("selected/Text/completed"), var_23_2 == 2)
			setActive(arg_23_2:Find("tip"), var_23_2 == 1)
			onToggle(arg_22_0, arg_23_2, function(arg_24_0)
				if arg_24_0 then
					arg_22_0.subPageCharaIndex = arg_23_1 + 1

					for iter_24_0 = 1, #arg_22_0.clueChara do
						setActive(arg_22_0:findTF("left/Viewport/Content", arg_22_0.charaPage):GetChild(iter_24_0 - 1):Find("Text"), arg_22_0.subPageCharaIndex ~= iter_24_0)
						setActive(arg_22_0:findTF("left/Viewport/Content", arg_22_0.charaPage):GetChild(iter_24_0 - 1):Find("selected"), arg_22_0.subPageCharaIndex == iter_24_0)
					end

					arg_22_0:SetClueGroup(var_23_0, arg_22_0:findTF("right", arg_22_0.charaPage))
					arg_22_0:SetAward(var_23_1)
				end
			end, SFX_PANEL)

			if arg_22_0.subPageCharaIndex == arg_23_1 + 1 then
				triggerToggle(arg_23_2, true)
			end
		end
	end)
	var_22_0:align(#arg_22_0.clueChara)
	onScroll(arg_22_0, arg_22_0:findTF("left", arg_22_0.charaPage), function(arg_25_0)
		setActive(arg_22_0:findTF("triangle", arg_22_0.charaPage), arg_25_0.y > 0.01)
	end)
end

function var_0_0.GetGroupClueCompleteCount(arg_26_0, arg_26_1)
	local var_26_0 = var_0_1.get_id_list_by_group[arg_26_1]
	local var_26_1 = {
		var_0_1[var_26_0[1]],
		var_0_1[var_26_0[2]],
		var_0_1[var_26_0[3]]
	}
	local var_26_2 = 0

	for iter_26_0 = 1, 3 do
		if arg_26_0.taskProxy:getFinishTaskById(tonumber(var_26_1[iter_26_0].task_id)) then
			var_26_2 = var_26_2 + 1
		end
	end

	return var_26_2
end

function var_0_0.ShowEndingPage(arg_27_0)
	local var_27_0 = UIItemList.New(arg_27_0:findTF("left/Viewport/Content", arg_27_0.endingPage), arg_27_0:findTF("left/Viewport/Content/pageTg", arg_27_0.endingPage))

	var_27_0:make(function(arg_28_0, arg_28_1, arg_28_2)
		if arg_28_0 == UIItemList.EventUpdate then
			local var_28_0 = arg_27_0.clueEnding[arg_28_1 + 1][1]
			local var_28_1 = arg_27_0.clueEnding[arg_28_1 + 1][2]
			local var_28_2 = arg_27_0.taskProxy:getTaskVO(var_28_1):getTaskStatus()

			setText(arg_28_2:Find("Text"), var_0_3[var_28_0[#var_28_0]].title2)
			setText(arg_28_2:Find("selected/Text"), var_0_3[var_28_0[#var_28_0]].title2)
			setActive(arg_28_2:Find("Text"), arg_27_0.subPageEndingIndex ~= arg_28_1 + 1)
			setActive(arg_28_2:Find("selected"), arg_27_0.subPageEndingIndex == arg_28_1 + 1)
			setActive(arg_28_2:Find("Text/completed"), var_28_2 == 2)
			setActive(arg_28_2:Find("selected/Text/completed"), var_28_2 == 2)

			local var_28_3 = false

			if var_28_2 == 1 then
				var_28_3 = true
			else
				local var_28_4 = true

				for iter_28_0 = 1, #var_28_0 do
					local var_28_5 = var_28_0[iter_28_0]
					local var_28_6 = var_0_3[var_28_5]
					local var_28_7 = arg_27_0.taskProxy:getTaskVO(tonumber(var_28_6.task_id)):getTaskStatus()

					if var_28_7 == 1 and var_28_4 then
						var_28_3 = true
					end

					if var_28_7 ~= 2 then
						var_28_4 = false
					end
				end
			end

			setActive(arg_28_2:Find("tip"), var_28_3)
			onToggle(arg_27_0, arg_28_2, function(arg_29_0)
				if arg_29_0 then
					arg_27_0.subPageEndingIndex = arg_28_1 + 1

					for iter_29_0 = 1, #arg_27_0.clueEnding do
						setActive(arg_27_0:findTF("left/Viewport/Content", arg_27_0.endingPage):GetChild(iter_29_0 - 1):Find("Text"), arg_27_0.subPageEndingIndex ~= iter_29_0)
						setActive(arg_27_0:findTF("left/Viewport/Content", arg_27_0.endingPage):GetChild(iter_29_0 - 1):Find("selected"), arg_27_0.subPageEndingIndex == iter_29_0)
					end

					table.sort(var_28_0, function(arg_30_0, arg_30_1)
						local var_30_0 = var_0_3[arg_30_0]
						local var_30_1 = var_0_3[arg_30_1]

						return var_30_0.unlock_pre < var_30_1.unlock_pre
					end)

					local var_29_0 = true

					for iter_29_1 = 1, #var_28_0 do
						local var_29_1 = var_28_0[iter_29_1]
						local var_29_2 = var_0_3[var_29_1]
						local var_29_3 = arg_27_0.taskProxy:getTaskVO(tonumber(var_29_2.task_id)):getTaskStatus()

						setActive(arg_27_0:findTF("right/ending" .. iter_29_1 .. "/icon", arg_27_0.endingPage), var_29_0)
						setActive(arg_27_0:findTF("right/ending" .. iter_29_1 .. "/selected", arg_27_0.endingPage), arg_27_0.endingIndex == iter_29_1)
						setActive(arg_27_0:findTF("right/ending" .. iter_29_1 .. "/lock", arg_27_0.endingPage), not var_29_0)
						setActive(arg_27_0:findTF("right/ending" .. iter_29_1 .. "/tip", arg_27_0.endingPage), var_29_3 == 1 and var_29_0)

						arg_27_0:findTF("right/ending" .. iter_29_1, arg_27_0.endingPage):GetComponent(typeof(CanvasGroup)).alpha = var_29_0 and 1 or 0.8

						if var_29_0 then
							setText(arg_27_0:findTF("right/ending" .. iter_29_1 .. "/title", arg_27_0.endingPage), var_29_2.title)
							onToggle(arg_27_0, arg_27_0:findTF("right/ending" .. iter_29_1, arg_27_0.endingPage), function(arg_31_0)
								if arg_31_0 then
									arg_27_0.endingIndex = iter_29_1

									for iter_31_0 = 1, #var_28_0 do
										setActive(arg_27_0:findTF("right/ending" .. iter_31_0 .. "/selected", arg_27_0.endingPage), iter_31_0 == arg_27_0.endingIndex)
									end

									local var_31_0 = var_29_2.clue
									local var_31_1 = var_29_2.locate

									setText(arg_27_0:findTF("middle/titleBg/Text", arg_27_0.endingPage), var_29_2.title2)
									setText(arg_27_0:findTF("middle/endingDetail/Viewport/Content/detail", arg_27_0.endingPage), var_29_2.desc)
									onScroll(arg_27_0, arg_27_0:findTF("middle/endingDetail", arg_27_0.endingPage), function(arg_32_0)
										setActive(arg_27_0:findTF("middle/triangle", arg_27_0.endingPage), arg_32_0.y > 0.01)
									end)
									setActive(arg_27_0:findTF("right/combine", arg_27_0.endingPage), var_29_3 == 1)
									onButton(arg_27_0, arg_27_0:findTF("right/combine", arg_27_0.endingPage), function()
										arg_27_0:emit(ClueBookMediator.ON_TASK_SUBMIT_ONESTEP, arg_27_0.taskActivityId, {
											tonumber(var_29_2.task_id)
										})
									end, SFX_PANEL)
									setActive(arg_27_0:findTF("middle/cluePanel", arg_27_0.endingPage), var_29_3 ~= 2)

									if var_29_3 ~= 2 then
										local var_31_2 = UIItemList.New(arg_27_0:findTF("middle/cluePanel", arg_27_0.endingPage), arg_27_0:findTF("middle/cluePanel/clueGroup", arg_27_0.endingPage))

										var_31_2:make(function(arg_34_0, arg_34_1, arg_34_2)
											if arg_34_0 == UIItemList.EventUpdate then
												local var_34_0 = var_31_0[arg_34_1 + 1]
												local var_34_1 = var_31_1[arg_34_1 + 1][1]
												local var_34_2 = var_31_1[arg_34_1 + 1][2]
												local var_34_3 = var_31_1[arg_34_1 + 1][3]

												if var_29_2.type == 1 then
													local var_34_4 = var_0_2[var_34_0]

													for iter_34_0 = 1, 4 do
														setActive(arg_34_2:Find("" .. iter_34_0), var_34_1 == iter_34_0)
													end

													setActive(arg_34_2:Find("ending"), false)

													local var_34_5 = arg_34_2:GetChild(var_34_1 - 1)
													local var_34_6 = arg_27_0:GetGroupClueCompleteCount(var_34_0)

													var_34_5:GetComponent(typeof(CanvasGroup)).alpha = var_34_6 == 0 and 0.4 or 1

													if var_34_6 == 0 then
														setText(arg_27_0:findTF("name/Text", var_34_5), "？？？")
													else
														setText(arg_27_0:findTF("name/Text", var_34_5), var_34_4.title)
													end

													setText(arg_27_0:findTF("progress", var_34_5), var_34_6 .. "/3")
													setActive(arg_27_0:findTF("progress", var_34_5), var_34_6 == 1 or var_34_6 == 2)
													setActive(arg_27_0:findTF("complete", var_34_5), var_34_6 == 3)
													onButton(arg_27_0, arg_34_2, function()
														arg_27_0:emit(ClueBookMediator.OPEN_SINGLE_CLUE_GROUP, var_34_0)
													end, SFX_PANEL)
												else
													local var_34_7 = var_0_3[var_34_0]

													setText(arg_34_2:Find("ending/name"), var_34_7.title2)

													for iter_34_1 = 1, 4 do
														setActive(arg_34_2:Find("" .. iter_34_1), false)
													end

													setActive(arg_34_2:Find("ending"), true)

													for iter_34_2 = 1, 3 do
														setActive(arg_34_2:Find("ending/icon" .. iter_34_2), arg_34_1 + 1 == iter_34_2)
													end

													onButton(arg_27_0, arg_34_2, function()
														triggerToggle(arg_27_0:findTF("right/ending" .. arg_34_1 + 1, arg_27_0.endingPage), true)
													end, SFX_PANEL)
												end

												arg_34_2.anchoredPosition = Vector2(var_34_2[1], var_34_2[2])
												arg_34_2.localScale = Vector3(var_34_3, var_34_3, 1)
											end
										end)
										var_31_2:align(#var_31_0)
									end
								end
							end, SFX_PANEL)
						else
							local var_29_4 = "64646a"

							if iter_29_1 == #var_28_0 then
								var_29_4 = "6683cf"
							end

							setText(arg_27_0:findTF("right/ending" .. iter_29_1 .. "/title", arg_27_0.endingPage), "<color=#" .. var_29_4 .. ">" .. var_29_2.title .. "</color>")
							removeOnToggle(arg_27_0:findTF("right/ending" .. iter_29_1, arg_27_0.endingPage))
						end

						if var_29_3 ~= 2 then
							var_29_0 = false
						end
					end

					triggerToggle(arg_27_0:findTF("right/ending" .. arg_27_0.endingIndex, arg_27_0.endingPage), true)
					arg_27_0:SetAward(var_28_1)
				end
			end, SFX_PANEL)

			if arg_27_0.subPageEndingIndex == arg_28_1 + 1 then
				triggerToggle(arg_28_2, true)
			end
		end
	end)
	var_27_0:align(#arg_27_0.clueEnding)
end

function var_0_0.ShowStoryPage(arg_37_0)
	local function var_37_0()
		setText(arg_37_0:findTF("pageIndex/Text", arg_37_0.storyPage), arg_37_0.storyIndex .. "/2")
		setActive(arg_37_0:findTF("leftBtn", arg_37_0.storyPage), arg_37_0.storyIndex == 2)
		setActive(arg_37_0:findTF("rightBtn", arg_37_0.storyPage), arg_37_0.storyIndex == 1)
		setActive(arg_37_0:findTF("subPages/page1", arg_37_0.storyPage), arg_37_0.storyIndex == 1)
		setActive(arg_37_0:findTF("subPages/page2", arg_37_0.storyPage), arg_37_0.storyIndex == 2)
	end

	var_37_0()
	onButton(arg_37_0, arg_37_0:findTF("leftBtn", arg_37_0.storyPage), function()
		arg_37_0.storyIndex = 1

		var_37_0()
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0:findTF("rightBtn", arg_37_0.storyPage), function()
		arg_37_0.storyIndex = 2

		var_37_0()
	end, SFX_PANEL)

	for iter_37_0 = 1, #arg_37_0.story do
		local var_37_1

		if iter_37_0 <= 5 then
			var_37_1 = arg_37_0:findTF("subPages/page1", arg_37_0.storyPage):GetChild(iter_37_0 - 1)
		else
			var_37_1 = arg_37_0:findTF("subPages/page2", arg_37_0.storyPage):GetChild(iter_37_0 - 6)
		end

		local var_37_2 = arg_37_0.story[iter_37_0]
		local var_37_3 = var_37_2[1]
		local var_37_4 = var_37_2[2]
		local var_37_5 = var_37_2[3]
		local var_37_6 = var_37_2[4]
		local var_37_7 = arg_37_0.taskProxy:getTaskVO(var_37_5):getTaskStatus()

		if var_37_3 == 1 then
			setText(arg_37_0:findTF("lock/Text", var_37_1), i18n("clue_lock_tip1"))
		else
			setText(arg_37_0:findTF("lock/Text", var_37_1), i18n("clue_lock_tip2", var_0_3[var_37_4].title))
		end

		setActive(arg_37_0:findTF("lock", var_37_1), var_37_7 == 0)
		setActive(arg_37_0:findTF("canGet", var_37_1), var_37_7 == 1)

		var_37_1:GetComponent(typeof(CanvasGroup)).alpha = var_37_7 == 0 and 0.4 or 1

		if var_37_7 == 1 then
			onButton(arg_37_0, var_37_1, function()
				arg_37_0:emit(ClueBookMediator.ON_TASK_SUBMIT_ONESTEP, arg_37_0.taskActivityId, {
					var_37_5
				}, function(arg_42_0)
					if arg_42_0 then
						pg.NewStoryMgr.GetInstance():Play(var_37_6)
					end
				end)
			end, SFX_PANEL)
		elseif var_37_7 == 2 then
			onButton(arg_37_0, var_37_1, function()
				pg.NewStoryMgr.GetInstance():Play(var_37_6, nil, true)
			end, SFX_PANEL)
		else
			removeOnButton(var_37_1)
		end
	end

	arg_37_0:SetAward(arg_37_0.storyTaskId, function()
		pg.NewStoryMgr.GetInstance():Play(arg_37_0.afterStory)
	end)
end

function var_0_0.OpenChapter(arg_45_0, arg_45_1)
	arg_45_0:emit(ClueBookMediator.OPEN_CLUE_JUMP, arg_45_1)
end

function var_0_0.willExit(arg_46_0)
	return
end

function var_0_0.onBackPressed(arg_47_0)
	arg_47_0:StopBgm()
	arg_47_0:closeView()
end

function var_0_0.ShouldShowTip(arg_48_0)
	local var_48_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.Valleyhospital_ACT_ID)
	local var_48_1 = getProxy(TaskProxy)
	local var_48_2 = var_48_0:getConfig("config_client")
	local var_48_3 = var_48_2.clue_site
	local var_48_4 = var_48_2.clue_chara
	local var_48_5 = var_48_2.clue_ending
	local var_48_6 = var_48_2.story
	local var_48_7 = var_48_2.storyTaskId

	if not arg_48_0 or arg_48_0 == 1 then
		for iter_48_0 = 1, #var_48_3 do
			local var_48_8 = var_48_3[iter_48_0]
			local var_48_9 = tonumber(var_0_2[var_48_8[1]].task_id)

			if var_48_1:getTaskVO(var_48_9):getTaskStatus() == 1 then
				return true
			end
		end
	end

	if not arg_48_0 or arg_48_0 == 2 then
		for iter_48_1 = 1, #var_48_4 do
			local var_48_10 = var_48_4[iter_48_1][1]
			local var_48_11 = tonumber(var_0_2[var_48_10].task_id)

			if var_48_1:getTaskVO(var_48_11):getTaskStatus() == 1 then
				return true
			end
		end
	end

	if not arg_48_0 or arg_48_0 == 3 then
		for iter_48_2 = 1, #var_48_5 do
			local var_48_12 = var_48_5[iter_48_2][1]
			local var_48_13 = var_48_5[iter_48_2][2]

			if var_48_1:getTaskVO(var_48_13):getTaskStatus() == 1 then
				return true
			end

			local var_48_14 = true

			for iter_48_3 = 1, #var_48_12 do
				local var_48_15 = var_48_12[iter_48_3]
				local var_48_16 = var_0_3[var_48_15]
				local var_48_17 = var_48_1:getTaskVO(tonumber(var_48_16.task_id)):getTaskStatus()

				if var_48_17 == 1 and var_48_14 then
					return true
				end

				if var_48_17 ~= 2 then
					var_48_14 = false
				end
			end
		end
	end

	if not arg_48_0 or arg_48_0 == 4 then
		if var_48_1:getTaskVO(var_48_7):getTaskStatus() == 1 then
			return true
		end

		for iter_48_4 = 1, #var_48_6 do
			local var_48_18 = var_48_6[iter_48_4][3]

			if var_48_1:getTaskVO(var_48_18):getTaskStatus() == 1 then
				return true
			end
		end
	end

	return false
end

return var_0_0
