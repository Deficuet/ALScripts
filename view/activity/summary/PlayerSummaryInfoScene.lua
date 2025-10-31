local var_0_0 = class("PlayerSummaryInfoScene", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "PlayerSummaryUI"
end

function var_0_0.setActivity(arg_2_0, arg_2_1)
	arg_2_0.activityVO = arg_2_1
end

function var_0_0.setPlayer(arg_3_0, arg_3_1)
	arg_3_0.palyerVO = arg_3_1
end

function var_0_0.setSummaryInfo(arg_4_0, arg_4_1)
	arg_4_0.summaryInfoVO = arg_4_1
end

function var_0_0.init(arg_5_0)
	arg_5_0.backBtn = arg_5_0._tf:Find("bg/back_btn")
	arg_5_0.pageContainer = arg_5_0._tf:Find("bg/main/pages")
	arg_5_0.pageFootContainer = arg_5_0._tf:Find("bg/main/page_foot")
end

function var_0_0.didEnter(arg_6_0)
	if arg_6_0.summaryInfoVO then
		arg_6_0:initSummaryInfo()
	else
		arg_6_0:emit(PlayerSummaryInfoMediator.GET_PLAYER_SUMMARY_INFO)
	end

	onButton(arg_6_0, arg_6_0.backBtn, function()
		if arg_6_0:inAnim() then
			return
		end

		arg_6_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
end

function var_0_0.inAnim(arg_8_0)
	if _.any(arg_8_0.pages or {}, function(arg_9_0)
		return arg_9_0:inAnim()
	end) then
		return true
	end

	return false
end

function var_0_0.initSummaryInfo(arg_10_0)
	arg_10_0.loadingPage = SummaryPageLoading.New(arg_10_0.pageContainer:Find("loading"))
	arg_10_0.pages = {
		SummaryPage1.New(arg_10_0.pageContainer:Find("page1")),
		SummaryPage2.New(arg_10_0.pageContainer:Find("page2")),
		SummaryPage3.New(arg_10_0.pageContainer:Find("page3")),
		SummaryPage4.New(arg_10_0.pageContainer:Find("page4")),
		SummaryPage4.New(arg_10_0.pageContainer:Find("page4_1")),
		SummaryPage4.New(arg_10_0.pageContainer:Find("page4_2")),
		SummaryPage5.New(arg_10_0.pageContainer:Find("page5"))
	}

	local var_10_0 = arg_10_0.summaryInfoVO.isProPose and 3 or 2

	table.remove(arg_10_0.pages, var_10_0):Hide()

	local var_10_1 = {
		function(arg_11_0)
			arg_10_0.loadingPage:Init(arg_10_0.summaryInfoVO)
			arg_11_0()
		end,
		function(arg_12_0)
			arg_10_0.loadingPage:Show(arg_12_0)
		end,
		function(arg_13_0)
			arg_10_0.loadingPage:Hide(arg_13_0)
		end,
		function(arg_14_0)
			for iter_14_0, iter_14_1 in ipairs(arg_10_0.pages) do
				iter_14_1:Init(arg_10_0.summaryInfoVO)
			end

			arg_14_0()
		end,
		function(arg_15_0)
			arg_10_0:registerFootEvent()
			arg_15_0()
		end,
		function(arg_16_0)
			arg_10_0:updatePageFoot(1)
			arg_16_0()
		end,
		function(arg_17_0)
			arg_10_0:registerDrag()
			arg_17_0()
		end
	}

	setActive(arg_10_0.pageFootContainer, false)
	seriesAsync(var_10_1, function()
		setActive(arg_10_0.pageFootContainer, true)
	end)
end

function var_0_0.registerFootEvent(arg_19_0)
	arg_19_0.footTFs = {}

	for iter_19_0 = 1, #arg_19_0.pages do
		local var_19_0 = arg_19_0.pageFootContainer:Find("dot_" .. iter_19_0)

		table.insert(arg_19_0.footTFs, var_19_0)

		local function var_19_1(arg_20_0)
			if arg_20_0 then
				arg_19_0.pages[iter_19_0]:Show()

				arg_19_0.currPage = iter_19_0
			else
				arg_19_0.pages[arg_19_0.currPage]:Hide()
			end
		end

		onToggle(arg_19_0, var_19_0, var_19_1)
	end
end

function var_0_0.registerDrag(arg_21_0)
	arg_21_0:addVerticalDrag(arg_21_0._tf:Find("bg"), function()
		arg_21_0:updatePageFoot(arg_21_0.currPage + 1)
	end, function()
		arg_21_0:updatePageFoot(arg_21_0.currPage - 1)
	end)
end

function var_0_0.updatePageFoot(arg_24_0, arg_24_1)
	if arg_24_0:inAnim() then
		return
	end

	if not arg_24_0.footTFs[arg_24_1] then
		return
	end

	triggerToggle(arg_24_0.footTFs[arg_24_1], true)
end

function var_0_0.addVerticalDrag(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	local var_25_0 = GetOrAddComponent(arg_25_1, "EventTriggerListener")
	local var_25_1
	local var_25_2 = 0
	local var_25_3 = 50

	var_25_0:AddBeginDragFunc(function()
		var_25_2 = 0
		var_25_1 = nil
	end)
	var_25_0:AddDragFunc(function(arg_27_0, arg_27_1)
		local var_27_0 = arg_27_1.position

		if not var_25_1 then
			var_25_1 = var_27_0
		end

		var_25_2 = var_27_0.y - var_25_1.y
	end)
	var_25_0:AddDragEndFunc(function(arg_28_0, arg_28_1)
		if var_25_2 < -var_25_3 then
			if arg_25_3 then
				arg_25_3()
			end
		elseif var_25_2 > var_25_3 and arg_25_2 then
			arg_25_2()
		end
	end)
end

function var_0_0.willExit(arg_29_0)
	for iter_29_0, iter_29_1 in pairs(arg_29_0.pages) do
		iter_29_1:Dispose()
	end

	arg_29_0.pages = nil

	arg_29_0.loadingPage:Dispose()

	arg_29_0.loadingPage = nil
end

return var_0_0
