local var_0_0 = class("StarLightMedalAlbumView", import("view.base.BaseUI"))

var_0_0.ICON_SCALE = 1.35
var_0_0.MEDAL_COUNT = 8

function var_0_0.getResource(arg_1_0, arg_1_1)
	local var_1_0 = {}
	local var_1_1 = arg_1_0.GROUP_ID
	local var_1_2 = var_1_1 and pg.activity_medal_group[var_1_1]

	if var_1_2 and var_1_2.item_show then
		local var_1_3 = {}

		local function var_1_4(arg_2_0)
			if noEmptyStr(arg_2_0) and not table.contains(var_1_3, arg_2_0) then
				table.insert(var_1_3, arg_2_0)
			end
		end

		for iter_1_0, iter_1_1 in ipairs(var_1_2.item_show) do
			if iter_1_1 and #iter_1_1 > 0 then
				local var_1_5 = Drop.New({
					type = iter_1_1[1],
					id = iter_1_1[2],
					count = iter_1_1[3] or 1
				})
				local var_1_6 = var_1_5:getIcon()

				if var_1_5.type == DROP_TYPE_FURNITURE then
					var_1_6 = "furnitureicon/" .. var_1_6
				end

				var_1_4(var_1_6)
			end
		end

		for iter_1_2, iter_1_3 in ipairs(var_1_3) do
			table.insert(var_1_0, iter_1_3)
		end
	end

	table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0, arg_1_1))

	return var_1_0
end

function var_0_0.SetMedalGroupData(arg_3_0, arg_3_1)
	arg_3_0.medalGroupList = arg_3_1
	arg_3_0.currentMedalGroup = arg_3_0.medalGroupList[arg_3_0.GROUP_ID] or ActivityMedalGroup.New(arg_3_0.GROUP_ID)

	if arg_3_0.currentMedalGroup:GetMedalGroupState() == ActivityMedalGroup.STATE_ACTIVE then
		arg_3_0.medalTaskView:SetMedalGroup(arg_3_0.currentMedalGroup)
	end

	arg_3_0.medalDetailView:SetMedalGroup(arg_3_0.currentMedalGroup)

	local var_3_0 = arg_3_0.currentMedalGroup:GetMedalIds()

	for iter_3_0 = 1, arg_3_0.MEDAL_COUNT do
		local var_3_1 = var_3_0[iter_3_0]

		LoadImageSpriteAsync("activitymedal/" .. var_3_1 .. "_l", arg_3_0.slots[iter_3_0].slot, true)
		LoadImageSpriteAsync("activitymedal/" .. var_3_1, arg_3_0.slots[iter_3_0].active, true)
	end
end

function var_0_0.ShowPageBtn(arg_4_0, arg_4_1)
	setActive(arg_4_0.prevBtn, false)
	setActive(arg_4_0.nextBtn, false)
end

function var_0_0.UpdateMedalList(arg_5_0)
	return
end

function var_0_0.init(arg_6_0)
	arg_6_0:FindUI()

	arg_6_0.loader = AutoLoader.New()
end

function var_0_0.FindUI(arg_7_0)
	local var_7_0 = arg_7_0._tf:Find("Top")

	arg_7_0.bg = arg_7_0._tf:Find("mask")
	arg_7_0.backBtn = var_7_0:Find("BackBtn")
	arg_7_0.helpBtn = var_7_0:Find("InfoBtn")
	arg_7_0.taskBtn = arg_7_0._tf:Find("Desk/taskBtn")
	arg_7_0.prevBtn = arg_7_0._tf:Find("Desk/prevBtn")
	arg_7_0.nextBtn = arg_7_0._tf:Find("Desk/nextBtn")
	arg_7_0.slots = {}

	for iter_7_0 = 1, arg_7_0.MEDAL_COUNT do
		arg_7_0.slots[iter_7_0] = {
			slot = arg_7_0._tf:Find("Desk/Slot" .. iter_7_0),
			active = arg_7_0._tf:Find("Desk/Slot" .. iter_7_0 .. "/active"),
			tips = arg_7_0._tf:Find("Desk/Slot" .. iter_7_0 .. "/reddot"),
			click = arg_7_0._tf:Find("Desk/Slot" .. iter_7_0 .. "/Click")
		}
	end

	arg_7_0.medalLock = arg_7_0._tf:Find("Desk/medal")
	arg_7_0.trophyLock = arg_7_0._tf:Find("Desk/trophy")
	arg_7_0.medalDetailView = MedalDetailPanel.New(arg_7_0._tf:Find("DetailView"), arg_7_0)

	arg_7_0.medalDetailView:SetIconScale(arg_7_0.ICON_SCALE)

	arg_7_0.medalTaskView = MedalTaskPanel.New(arg_7_0._tf:Find("TaskView"), arg_7_0)
end

function var_0_0.didEnter(arg_8_0)
	var_0_0.super.didEnter(arg_8_0)
	arg_8_0:AddListener()
	arg_8_0:UpdateView()
	pg.UIMgr.GetInstance():BlurPanel(arg_8_0._tf)
end

function var_0_0.AddListener(arg_9_0)
	onButton(arg_9_0, arg_9_0.backBtn, function()
		arg_9_0:closeView()
	end, SFX_CANCEL)

	for iter_9_0 = 1, arg_9_0.MEDAL_COUNT do
		onButton(arg_9_0, arg_9_0.slots[iter_9_0].click, function()
			arg_9_0:showMedalView(iter_9_0)
		end)
	end

	onButton(arg_9_0, arg_9_0.taskBtn, function()
		arg_9_0:showTaskView()
	end)
	onButton(arg_9_0, arg_9_0.bg, function()
		arg_9_0:closeView()
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_9_0.HELP_TIPS].tip
		})
	end)
	onButton(arg_9_0, arg_9_0.medalLock, function()
		local var_15_0 = arg_9_0.currentMedalGroup:getConfig("item_show")[2]
		local var_15_1 = {
			type = var_15_0[1],
			id = var_15_0[2],
			count = var_15_0[3]
		}

		arg_9_0:emit(BaseUI.ON_DROP, var_15_1)
	end, SFX_PANEL)

	if arg_9_0.trophyLock then
		onButton(arg_9_0, arg_9_0.trophyLock, function()
			local var_16_0 = arg_9_0.currentMedalGroup:getConfig("item_show")[1]
			local var_16_1 = {
				type = var_16_0[1],
				id = var_16_0[2],
				count = var_16_0[3]
			}

			arg_9_0:emit(BaseUI.ON_DROP, var_16_1)
		end, SFX_PANEL)
	end
end

function var_0_0.showMedalView(arg_17_0, arg_17_1)
	arg_17_0.medalDetailView:SetCurrentIndex(arg_17_1)
	arg_17_0.medalDetailView:UpdateMedal()
	arg_17_0.medalDetailView:SetActive(true)
end

function var_0_0.showTaskView(arg_18_0)
	arg_18_0.medalTaskView:ShowMedalTask()
	arg_18_0.medalTaskView:SetActive(true)
end

function var_0_0.UpdateView(arg_19_0)
	local var_19_0 = arg_19_0.currentMedalGroup:GetMedalIds()
	local var_19_1 = arg_19_0.currentMedalGroup:GetMedalList()

	for iter_19_0 = 1, arg_19_0.MEDAL_COUNT do
		local var_19_2 = var_19_0[iter_19_0]
		local var_19_3 = arg_19_0.slots[iter_19_0]

		if var_19_1[var_19_2].timeStamp then
			setActive(var_19_3.active, true)
		else
			setActive(var_19_3.active, false)
		end
	end

	if arg_19_0.trophyLock then
		arg_19_0.trophyLock:GetComponent(typeof(Image)).enabled = not arg_19_0:OwnTrophy()
	end

	arg_19_0.medalLock:GetComponent(typeof(Image)).enabled = not arg_19_0:OwnMedal()

	setActive(arg_19_0.taskBtn, arg_19_0.currentMedalGroup:GetMedalGroupState() == ActivityMedalGroup.STATE_ACTIVE)
end

function var_0_0.OwnTrophy(arg_20_0)
	local var_20_0 = arg_20_0.currentMedalGroup:getConfig("task_show")
	local var_20_1 = -1

	if var_20_0 and type(var_20_0) == "table" then
		var_20_1 = var_20_0[1]
	end

	if var_20_1 <= 0 then
		return false
	end

	local var_20_2 = pg.task_data_template[var_20_1].award_display[1]

	return Task.OwnSpAward(var_20_2)
end

function var_0_0.OwnMedal(arg_21_0)
	local var_21_0 = arg_21_0.currentMedalGroup:getConfig("task_show")
	local var_21_1 = -1

	if var_21_0 and type(var_21_0) == "table" then
		var_21_1 = var_21_0[2]
	end

	if var_21_1 <= 0 then
		return false
	end

	local var_21_2 = pg.task_data_template[var_21_1].award_display
	local var_21_3 = var_21_2[#var_21_2]

	return Task.OwnSpAward(var_21_3)
end

function var_0_0.FlushTaskPanel(arg_22_0)
	arg_22_0.medalTaskView:SetMedalGroup(arg_22_0.currentMedalGroup)
	arg_22_0.medalTaskView:ShowMedalTask()
end

function var_0_0.willExit(arg_23_0)
	arg_23_0.medalDetailView:SetActive(false)
	arg_23_0.medalTaskView:SetActive(false)
	arg_23_0.medalDetailView:Dispose()
	arg_23_0.medalTaskView:Dispose()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_23_0._tf)
	arg_23_0.loader:Clear()
end

return var_0_0
