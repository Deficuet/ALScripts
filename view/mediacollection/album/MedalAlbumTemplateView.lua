local var_0_0 = class("StarLightMedalAlbumView", import("view.base.BaseUI"))

var_0_0.ICON_SCALE = 1.35
var_0_0.MEDAL_COUNT = 8

local function var_0_1(arg_1_0)
	local var_1_0 = pg.activity_template[arg_1_0.id].config_data

	return _.any(var_1_0, function(arg_2_0)
		return Task.New({
			id = arg_2_0
		}):HasActMedalAward()
	end)
end

local function var_0_2()
	local var_3_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_TASKS)

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		if var_0_1(iter_3_1) then
			return iter_3_1
		end
	end

	return nil
end

function var_0_0.GetHelpTips(arg_4_0)
	local var_4_0 = var_0_2()

	if not var_4_0 then
		return ""
	end

	local var_4_1 = var_4_0:GetActivityTimeStr()
	local var_4_2 = string.split(var_4_1, "-")
	local var_4_3 = pg.gametip.help_starLightAlbum.tip

	_.each(var_4_3, function(arg_5_0)
		arg_5_0.info = string.gsub(arg_5_0.info, "$1", var_4_2[2])
	end)

	return var_4_3
end

function var_0_0.getResource(arg_6_0, arg_6_1)
	local var_6_0 = {}
	local var_6_1 = arg_6_0.GROUP_ID
	local var_6_2 = var_6_1 and pg.activity_medal_group[var_6_1]

	if var_6_2 and var_6_2.item_show then
		local var_6_3 = {}

		local function var_6_4(arg_7_0)
			if noEmptyStr(arg_7_0) and not table.contains(var_6_3, arg_7_0) then
				table.insert(var_6_3, arg_7_0)
			end
		end

		for iter_6_0, iter_6_1 in ipairs(var_6_2.item_show) do
			if iter_6_1 and #iter_6_1 > 0 then
				local var_6_5 = Drop.New({
					type = iter_6_1[1],
					id = iter_6_1[2],
					count = iter_6_1[3] or 1
				})
				local var_6_6 = var_6_5:getIcon()

				if var_6_5.type == DROP_TYPE_FURNITURE then
					var_6_6 = "furnitureicon/" .. var_6_6
				end

				var_6_4(var_6_6)
			end
		end

		for iter_6_2, iter_6_3 in ipairs(var_6_3) do
			table.insert(var_6_0, iter_6_3)
		end
	end

	table.insertto(var_6_0, var_0_0.super.getResource(arg_6_0, arg_6_1))

	return var_6_0
end

function var_0_0.SetMedalGroupData(arg_8_0, arg_8_1)
	arg_8_0.medalGroupList = arg_8_1
	arg_8_0.currentMedalGroup = arg_8_0.medalGroupList[arg_8_0.GROUP_ID] or ActivityMedalGroup.New(arg_8_0.GROUP_ID)

	if arg_8_0.currentMedalGroup:GetMedalGroupState() == ActivityMedalGroup.STATE_ACTIVE then
		arg_8_0.medalTaskView:SetMedalGroup(arg_8_0.currentMedalGroup)
	end

	arg_8_0.medalDetailView:SetMedalGroup(arg_8_0.currentMedalGroup)

	local var_8_0 = arg_8_0.currentMedalGroup:GetMedalIds()

	for iter_8_0 = 1, arg_8_0.MEDAL_COUNT do
		local var_8_1 = var_8_0[iter_8_0]

		LoadImageSpriteAsync("activitymedal/" .. var_8_1 .. "_l", arg_8_0.slots[iter_8_0].slot, true)
		LoadImageSpriteAsync("activitymedal/" .. var_8_1, arg_8_0.slots[iter_8_0].active, true)
	end
end

function var_0_0.ShowPageBtn(arg_9_0, arg_9_1)
	setActive(arg_9_0.prevBtn, false)
	setActive(arg_9_0.nextBtn, false)
end

function var_0_0.UpdateMedalList(arg_10_0)
	return
end

function var_0_0.init(arg_11_0)
	arg_11_0:FindUI()

	arg_11_0.loader = AutoLoader.New()
end

function var_0_0.FindUI(arg_12_0)
	local var_12_0 = arg_12_0._tf:Find("Top")

	arg_12_0.bg = arg_12_0._tf:Find("mask")
	arg_12_0.backBtn = var_12_0:Find("BackBtn")
	arg_12_0.helpBtn = var_12_0:Find("InfoBtn")
	arg_12_0.taskBtn = arg_12_0._tf:Find("Desk/taskBtn")
	arg_12_0.prevBtn = arg_12_0._tf:Find("Desk/prevBtn")
	arg_12_0.nextBtn = arg_12_0._tf:Find("Desk/nextBtn")
	arg_12_0.slots = {}

	for iter_12_0 = 1, arg_12_0.MEDAL_COUNT do
		arg_12_0.slots[iter_12_0] = {
			slot = arg_12_0._tf:Find("Desk/Slot" .. iter_12_0),
			active = arg_12_0._tf:Find("Desk/Slot" .. iter_12_0 .. "/active"),
			tips = arg_12_0._tf:Find("Desk/Slot" .. iter_12_0 .. "/reddot"),
			click = arg_12_0._tf:Find("Desk/Slot" .. iter_12_0 .. "/Click")
		}
	end

	arg_12_0.medalLock = arg_12_0._tf:Find("Desk/medal")
	arg_12_0.trophyLock = arg_12_0._tf:Find("Desk/trophy")
	arg_12_0.medalDetailView = MedalDetailPanel.New(arg_12_0._tf:Find("DetailView"), arg_12_0)

	arg_12_0.medalDetailView:SetIconScale(arg_12_0.ICON_SCALE)

	arg_12_0.medalTaskView = MedalTaskPanel.New(arg_12_0._tf:Find("TaskView"), arg_12_0)
end

function var_0_0.didEnter(arg_13_0)
	var_0_0.super.didEnter(arg_13_0)
	arg_13_0:AddListener()
	arg_13_0:UpdateView()
	pg.UIMgr.GetInstance():BlurPanel(arg_13_0._tf)
end

function var_0_0.AddListener(arg_14_0)
	onButton(arg_14_0, arg_14_0.backBtn, function()
		arg_14_0:closeView()
	end, SFX_CANCEL)

	for iter_14_0 = 1, arg_14_0.MEDAL_COUNT do
		onButton(arg_14_0, arg_14_0.slots[iter_14_0].click, function()
			arg_14_0:showMedalView(iter_14_0)
		end)
	end

	onButton(arg_14_0, arg_14_0.taskBtn, function()
		arg_14_0:showTaskView()
	end)
	onButton(arg_14_0, arg_14_0.bg, function()
		arg_14_0:closeView()
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.helpBtn, function()
		local var_19_0 = arg_14_0:GetHelpTips()

		if not var_19_0 or var_19_0 == "" then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = var_19_0
		})
	end)
	onButton(arg_14_0, arg_14_0.medalLock, function()
		local var_20_0 = arg_14_0.currentMedalGroup:getConfig("item_show")[2]
		local var_20_1 = {
			type = var_20_0[1],
			id = var_20_0[2],
			count = var_20_0[3]
		}

		arg_14_0:emit(BaseUI.ON_DROP, var_20_1)
	end, SFX_PANEL)

	if arg_14_0.trophyLock then
		onButton(arg_14_0, arg_14_0.trophyLock, function()
			local var_21_0 = arg_14_0.currentMedalGroup:getConfig("item_show")[1]
			local var_21_1 = {
				type = var_21_0[1],
				id = var_21_0[2],
				count = var_21_0[3]
			}

			arg_14_0:emit(BaseUI.ON_DROP, var_21_1)
		end, SFX_PANEL)
	end
end

function var_0_0.showMedalView(arg_22_0, arg_22_1)
	arg_22_0.medalDetailView:SetCurrentIndex(arg_22_1)
	arg_22_0.medalDetailView:UpdateMedal()
	arg_22_0.medalDetailView:SetActive(true)
end

function var_0_0.showTaskView(arg_23_0)
	arg_23_0.medalTaskView:ShowMedalTask()
	arg_23_0.medalTaskView:SetActive(true)
end

function var_0_0.UpdateView(arg_24_0)
	local var_24_0 = arg_24_0.currentMedalGroup:GetMedalIds()
	local var_24_1 = arg_24_0.currentMedalGroup:GetMedalList()

	for iter_24_0 = 1, arg_24_0.MEDAL_COUNT do
		local var_24_2 = var_24_0[iter_24_0]
		local var_24_3 = arg_24_0.slots[iter_24_0]

		if var_24_1[var_24_2].timeStamp then
			setActive(var_24_3.active, true)
		else
			setActive(var_24_3.active, false)
		end
	end

	if arg_24_0.trophyLock then
		arg_24_0.trophyLock:GetComponent(typeof(Image)).enabled = not arg_24_0:OwnTrophy()
	end

	arg_24_0.medalLock:GetComponent(typeof(Image)).enabled = not arg_24_0:OwnMedal()

	setActive(arg_24_0.taskBtn, arg_24_0.currentMedalGroup:GetMedalGroupState() == ActivityMedalGroup.STATE_ACTIVE)
end

function var_0_0.OwnTrophy(arg_25_0)
	local var_25_0 = arg_25_0.currentMedalGroup:getConfig("task_show")
	local var_25_1 = -1

	if var_25_0 and type(var_25_0) == "table" then
		var_25_1 = var_25_0[1]
	end

	if var_25_1 <= 0 then
		return false
	end

	local var_25_2 = pg.task_data_template[var_25_1].award_display[1]

	return Task.OwnSpAward(var_25_2)
end

function var_0_0.OwnMedal(arg_26_0)
	local var_26_0 = arg_26_0.currentMedalGroup:getConfig("task_show")
	local var_26_1 = -1

	if var_26_0 and type(var_26_0) == "table" then
		var_26_1 = var_26_0[2]
	end

	if var_26_1 <= 0 then
		return false
	end

	local var_26_2 = pg.task_data_template[var_26_1].award_display
	local var_26_3 = var_26_2[#var_26_2]

	return Task.OwnSpAward(var_26_3)
end

function var_0_0.FlushTaskPanel(arg_27_0)
	arg_27_0.medalTaskView:SetMedalGroup(arg_27_0.currentMedalGroup)
	arg_27_0.medalTaskView:ShowMedalTask()
end

function var_0_0.willExit(arg_28_0)
	arg_28_0.medalDetailView:SetActive(false)
	arg_28_0.medalTaskView:SetActive(false)
	arg_28_0.medalDetailView:Dispose()
	arg_28_0.medalTaskView:Dispose()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_28_0._tf)
	arg_28_0.loader:Clear()
end

return var_0_0
