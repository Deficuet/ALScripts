local var_0_0 = class("HolidayVillaWharfLayer", import("view.base.BaseUI"))
local var_0_1 = pg.activity_holiday_trans

function var_0_0.getUIName(arg_1_0)
	return "HolidayVillaWharfUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.bg = arg_2_0:findTF("bg")
	arg_2_0.closeBtn = arg_2_0:findTF("closeBtn")
	arg_2_0.res = arg_2_0:findTF("res")
	arg_2_0.wharfResCount = arg_2_0:findTF("frame/resNum")
	arg_2_0.transportList = arg_2_0:findTF("frame/transportList")
	arg_2_0.transportCompletePage = arg_2_0:findTF("transportCompletePage")

	setText(arg_2_0._tf:Find("frame/nameBg/name"), i18n("holiday_tip_trans_tip"))
	setText(arg_2_0._tf:Find("frame/resDesc"), i18n("holiday_tip_trans_get"))
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:InitData()
	arg_3_0:RefreshData()
	onButton(arg_3_0, arg_3_0.bg, function()
		arg_3_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:closeView()
	end, SFX_CANCEL)
	arg_3_0:Show()
	setActive(arg_3_0.transportCompletePage, false)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.InitData(arg_6_0)
	arg_6_0.activityId = ActivityConst.HOLIDAY_ACT_ID
	arg_6_0.taskActivityId = ActivityConst.HOLIDAY_TASK_ID
	arg_6_0.activityProxy = getProxy(ActivityProxy)
	arg_6_0.taskProxy = getProxy(TaskProxy)
	arg_6_0.activity = arg_6_0.activityProxy:getActivityById(arg_6_0.activityId)
	arg_6_0.transTaskIds = arg_6_0.activity:getConfig("config_client").task_trans
end

function var_0_0.RefreshData(arg_7_0)
	arg_7_0.activity = arg_7_0.activityProxy:getActivityById(arg_7_0.activityId)
end

function var_0_0.Show(arg_8_0)
	local var_8_0 = {
		{
			66001,
			arg_8_0.activity:getVitemNumber(66001)
		},
		{
			66002,
			arg_8_0.activity:getVitemNumber(66002)
		},
		{
			66003,
			arg_8_0.activity:getVitemNumber(66003)
		},
		{
			66004,
			arg_8_0.activity:getVitemNumber(66004)
		}
	}

	arg_8_0:SetRes(arg_8_0.res, var_8_0)
	setText(arg_8_0.wharfResCount, arg_8_0.activity:getVitemNumber(66006))

	local var_8_1 = true

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.transTaskIds) do
		if not arg_8_0.taskProxy:getFinishTaskById(iter_8_1) then
			var_8_1 = false

			break
		end
	end

	if not var_8_1 then
		setText(arg_8_0._tf:Find("frame/desc"), i18n("holiday_tip_trans_desc1"))
		arg_8_0:SetTransList(1)
	else
		setText(arg_8_0._tf:Find("frame/desc"), i18n("holiday_tip_trans_desc2"))
		arg_8_0:SetTransList(2)
	end
end

function var_0_0.SetTransList(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0.transportList:Find("smallTransport")
	local var_9_1 = arg_9_0.transportList:Find("middleTransport")
	local var_9_2 = arg_9_0.transportList:Find("bigTransport")
	local var_9_3 = arg_9_0.transportList:Find("touristTransport")

	setActive(var_9_0, arg_9_1 == 1)
	setActive(var_9_1, arg_9_1 == 1)
	setActive(var_9_2, arg_9_1 == 1)
	setActive(var_9_3, arg_9_1 == 2)

	if arg_9_1 == 1 then
		arg_9_0:SetTransport(var_9_0, var_0_1[1])
		arg_9_0:SetTransport(var_9_1, var_0_1[2])
		arg_9_0:SetTransport(var_9_2, var_0_1[3])
	elseif arg_9_1 == 2 then
		arg_9_0:SetTransport(var_9_3, var_0_1[4])
	end
end

function var_0_0.SetTransport(arg_10_0, arg_10_1, arg_10_2)
	setText(arg_10_1:Find("name"), arg_10_2.name)
	LoadImageSpriteAsync(arg_10_2.icon, arg_10_1:Find("picture"))

	local var_10_0 = arg_10_0.taskProxy:getTaskById(arg_10_2.cost_task_id):getConfig("target_id_2")[1][2]

	setText(arg_10_1:Find("resConsume"), var_10_0)

	local var_10_1 = Clone(arg_10_2.award)

	for iter_10_0, iter_10_1 in ipairs(var_10_1) do
		table.remove(iter_10_1, 1)
	end

	arg_10_0:SetRes(arg_10_1:Find("awards"), var_10_1)
	onButton(arg_10_0, arg_10_1, function()
		if arg_10_0.activity:getVitemNumber(66006) < var_10_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("holiday_tip_trans_not"))

			return
		end

		arg_10_0.doingTransCfg = arg_10_2

		arg_10_0:emit(HolidayVillaWharfMediator.ON_TASK_SUBMIT_ONESTEP, arg_10_0.taskActivityId, {
			arg_10_2.cost_task_id
		})
	end, SFX_PANEL)
end

function var_0_0.SetRes(arg_12_0, arg_12_1, arg_12_2)
	for iter_12_0 = 0, arg_12_1.childCount - 1 do
		setActive(arg_12_1:GetChild(iter_12_0), false)
	end

	for iter_12_1, iter_12_2 in ipairs(arg_12_2) do
		local var_12_0 = iter_12_2[1]
		local var_12_1 = iter_12_2[2]

		for iter_12_3 = 0, arg_12_1.childCount - 1 do
			local var_12_2 = arg_12_1:GetChild(iter_12_3)

			if var_12_2.name == tostring(var_12_0) then
				setActive(var_12_2, true)
				setText(arg_12_0:findTF("Text", var_12_2), var_12_1)
			end
		end
	end
end

function var_0_0.ShowCompletePage(arg_13_0)
	setActive(arg_13_0.transportCompletePage, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_13_0.transportCompletePage)
	SetAction(arg_13_0.transportCompletePage:Find("ani"), "normal" .. arg_13_0.doingTransCfg.id, false)
	setText(arg_13_0:findTF("desc/Text", arg_13_0.transportCompletePage), arg_13_0.doingTransCfg.result_desc)
	setActive(arg_13_0:findTF("desc/triangle", arg_13_0.transportCompletePage), false)

	local var_13_0 = GetOrAddComponent(arg_13_0:findTF("desc/Text", arg_13_0.transportCompletePage), typeof(Typewriter))

	var_13_0:setSpeed(0.05)

	function var_13_0.endFunc()
		setActive(arg_13_0:findTF("desc/triangle", arg_13_0.transportCompletePage), true)
	end

	var_13_0:Play()
	onButton(arg_13_0, arg_13_0:findTF("bg", arg_13_0.transportCompletePage), function()
		setActive(arg_13_0.transportCompletePage, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0.transportCompletePage, arg_13_0._tf)

		if not arg_13_0.hasShowedAwards and #arg_13_0.awards > 0 then
			arg_13_0.hasShowedAwards = true

			arg_13_0:emit(BaseUI.ON_ACHIEVE, arg_13_0.awards)
		end
	end, SFX_CANCEL)
	onButton(arg_13_0, arg_13_0:findTF("desc", arg_13_0.transportCompletePage), function()
		setActive(arg_13_0.transportCompletePage, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0.transportCompletePage, arg_13_0._tf)

		if not arg_13_0.hasShowedAwards and #arg_13_0.awards > 0 then
			arg_13_0.hasShowedAwards = true

			arg_13_0:emit(BaseUI.ON_ACHIEVE, arg_13_0.awards)
		end
	end, SFX_CANCEL)
end

function var_0_0.SetAwardsShow(arg_17_0, arg_17_1)
	arg_17_0.awards = arg_17_1
	arg_17_0.hasShowedAwards = false
end

function var_0_0.willExit(arg_18_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_18_0._tf, arg_18_0._parentTf)
end

function var_0_0.onBackPressed(arg_19_0)
	if isActive(arg_19_0.transportCompletePage) then
		setActive(arg_19_0.transportCompletePage, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_19_0.transportCompletePage, arg_19_0._tf)

		if not arg_19_0.hasShowedAwards and #arg_19_0.awards > 0 then
			arg_19_0.hasShowedAwards = true

			arg_19_0:emit(BaseUI.ON_ACHIEVE, arg_19_0.awards)
		end

		return
	end

	arg_19_0:closeView()
end

return var_0_0
