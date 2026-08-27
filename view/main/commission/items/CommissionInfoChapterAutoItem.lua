local var_0_0 = class("CommissionInfoChapterAutoItem", import(".CommissionInfoItem"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.timeContainer = arg_1_0._tf:Find("frame/counter/time")
	arg_1_0.timeText = arg_1_0.timeContainer:Find("Text"):GetComponent(typeof(Text))
	arg_1_0.expireContainer = arg_1_0._tf:Find("frame/expire")
	arg_1_0.expireText = arg_1_0.expireContainer:Find("Text"):GetComponent(typeof(Text))
	arg_1_0.lockTF = arg_1_0._tf:Find("lock")

	setActive(arg_1_0.lockTF, false)
	setText(arg_1_0.lockTF:Find("Text"), i18n("commission_label_unlock_auto_tip"))
end

function var_0_0.CanOpen(arg_2_0)
	return ChapterAutoProxy.IsSystemOpen()
end

function var_0_0.Init(arg_3_0)
	setActive(arg_3_0.foldFlag, false)
	var_0_0.super.Init(arg_3_0)

	local var_3_0 = arg_3_0:CanOpen()

	setActive(arg_3_0.lockTF, not var_3_0)

	arg_3_0.detailPanel = ChapterAutoDetailPanel.New(arg_3_0._tf, arg_3_0.view.event)
end

function var_0_0.OnFlush(arg_4_0)
	arg_4_0.list = {}

	local var_4_0 = getProxy(ChapterAutoProxy)
	local var_4_1 = getProxy(ChapterAutoProxy):GetWillExpireTicketCnt()

	arg_4_0.expireText.text = i18n("auto_battle_book_expire_warning", var_4_1)

	setActive(arg_4_0.expireContainer, var_4_1 > 0)

	arg_4_0.finishedTime = var_4_0:GetFinishAllCommissionTime()

	arg_4_0:OnUpdateTime()

	if arg_4_0.isShowTime then
		arg_4_0:AddTimer()
	else
		arg_4_0:RemoveTimer()
	end
end

function var_0_0.OnUpdateTime(arg_5_0)
	local var_5_0, var_5_1 = getProxy(ChapterAutoProxy):GetCntInfo()

	arg_5_0.isLeisure = var_5_1 == 0
	arg_5_0.isFinishedAll = not arg_5_0.isLeisure and var_5_0 == var_5_1
	arg_5_0.isShowTime = not arg_5_0.isLeisure and not arg_5_0.isFinishedAll
	arg_5_0.finishedCounter.text = var_5_0 .. "/" .. var_5_1
	arg_5_0.ongoingCounter.text = ""
	arg_5_0.leisureCounter.text = ""

	setActive(arg_5_0.ongoingCounterContainer, false)
	setActive(arg_5_0.finishedCounterContainer, not arg_5_0.isLeisure)
	setActive(arg_5_0.leisureCounterContainer, arg_5_0.isLeisure)
	setActive(arg_5_0.goBtn, arg_5_0.isLeisure or var_5_0 < var_5_1)
	setActive(arg_5_0.finishedBtn, arg_5_0.isFinishedAll)

	if arg_5_0.isShowTime then
		local var_5_2 = pg.TimeMgr.GetInstance()
		local var_5_3 = arg_5_0.finishedTime - var_5_2:GetServerTime()

		arg_5_0.timeText.text = var_5_3 > 0 and var_5_2:DescCDTime(var_5_3) or "00:00:00"
	end

	if arg_5_0.isFinishedAll then
		arg_5_0:RemoveTimer()
	end
end

function var_0_0.UpdateListItem(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	return
end

function var_0_0.AddTimer(arg_7_0)
	arg_7_0:RemoveTimer()
	setActive(arg_7_0.timeContainer, true)

	arg_7_0.timer = Timer.New(function()
		arg_7_0:OnUpdateTime()
	end, 1, -1)

	arg_7_0.timer:Start()
	arg_7_0.timer.func()
end

function var_0_0.RemoveTimer(arg_9_0)
	setActive(arg_9_0.timeContainer, false)

	if arg_9_0.timer then
		arg_9_0.timer:Stop()

		arg_9_0.timer = nil
	end
end

function var_0_0.GetList(arg_10_0)
	return getProxy(ChapterAutoProxy):GetCommissionList()
end

function var_0_0.OnSkip(arg_11_0)
	local var_11_0 = getProxy(ChapterProxy)

	if arg_11_0.isLeisure then
		arg_11_0:emit(CommissionInfoMediator.GO_BATTLE)
	else
		local var_11_1 = var_11_0:getChapterById(var_11_0:GetAutoChapterId())

		arg_11_0.detailPanel:ExecuteAction("Enter", var_11_1)
	end
end

function var_0_0.OnFinishAll(arg_12_0)
	arg_12_0:emit(CommissionInfoMediator.ON_END_CHAPTER_AUTO)
end

function var_0_0.Dispose(arg_13_0)
	var_0_0.super.Dispose(arg_13_0)
	arg_13_0:RemoveTimer()

	if arg_13_0.detailPanel then
		arg_13_0.detailPanel:Destroy()

		arg_13_0.detailPanel = nil
	end
end

return var_0_0
