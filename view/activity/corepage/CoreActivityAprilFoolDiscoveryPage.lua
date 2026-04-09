local var_0_0 = class("CoreActivityAprilFoolDiscoveryPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.bgName = nil
	arg_1_0.itemList = arg_1_0._tf:Find("AD/list")
	arg_1_0.items = CustomIndexLayer.Clone2Full(arg_1_0.itemList, 9)
	arg_1_0.selectIndex = 0
	arg_1_0.btnHelp = arg_1_0.bg:Find("help_btn")
	arg_1_0.btnBattle = arg_1_0.bg:Find("battle_btn")
	arg_1_0.btnIncomplete = arg_1_0.bg:Find("incomplete_btn")
	arg_1_0.tip = arg_1_0.bg:Find("tip")
	arg_1_0.slider = arg_1_0.bg:Find("slider")
	arg_1_0.leftTime = arg_1_0.slider:Find("time")
	arg_1_0.loader = AutoLoader.New()
end

function var_0_0.OnDataSetting(arg_2_0)
	if arg_2_0.activity.data1 == 0 and arg_2_0.activity.data3 == 1 then
		arg_2_0.activity.data3 = 0

		pg.m02:sendNotification(GAME.PUZZLE_PIECE_OP, {
			cmd = 1,
			actId = arg_2_0.activity.id
		})

		return true
	end

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.activity.data1_list) do
		if not table.contains(arg_2_0.activity.data2_list, iter_2_1) then
			pg.m02:sendNotification(GAME.MEMORYBOOK_UNLOCK, {
				id = iter_2_1,
				actId = arg_2_0.activity.id
			})

			return true
		end
	end
end

function var_0_0.OnFirstFlush(arg_3_0)
	local var_3_0 = pg.activity_event_picturepuzzle[arg_3_0.activity.id]

	assert(var_3_0, "Can't Find activity_event_picturepuzzle 's ID : " .. arg_3_0.activity.id)

	arg_3_0.puzzleConfig = var_3_0
	arg_3_0.keyList = Clone(var_3_0.pickup_picturepuzzle)

	table.insertto(arg_3_0.keyList, var_3_0.drop_picturepuzzle)
	assert(#arg_3_0.keyList == #arg_3_0.items, string.format("keyList has {0}, but items has 9", #arg_3_0.keyList))
	table.sort(arg_3_0.keyList)
	onButton(arg_3_0, arg_3_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.bulin_help.tip
		})
	end, SFX_PANEL)

	local var_3_1 = arg_3_0.activity.id

	onButton(arg_3_0, arg_3_0.btnBattle, function()
		if #arg_3_0.activity.data2_list < #arg_3_0.keyList then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))

			return
		end

		arg_3_0:emit(ActivityMediator.ON_SIMULATION_COMBAT, {
			warnMsg = "bulin_tip_other3",
			stageId = arg_3_0.puzzleConfig.chapter
		}, function()
			local var_6_0 = getProxy(ActivityProxy)
			local var_6_1 = var_6_0:getActivityById(var_3_1)

			if var_6_1.data1 == 1 then
				return
			end

			var_6_1.data3 = 1

			var_6_0:updateActivity(var_6_1)
		end)
	end, SFX_PANEL)

	local var_3_2 = arg_3_0.activity:getConfig("config_client")

	pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_3_2.guideName)
end

local var_0_1 = {
	"lock",
	"hint",
	"unlock"
}

function var_0_0.OnUpdateFlush(arg_7_0)
	var_0_0.super.OnUpdateFlush(arg_7_0)

	local var_7_0 = arg_7_0.activity.data1 > 0
	local var_7_1 = #arg_7_0.activity.data2_list == #arg_7_0.keyList
	local var_7_2 = var_7_0 and "activity_bg_aprilfool_final" or "activity_bg_aprilfool_discovery"

	if var_7_2 ~= arg_7_0.bgName then
		setImageSprite(arg_7_0.bg, LoadSprite("ui/activityuipage/AprilFoolDiscoveryPage_atlas", var_7_2))

		arg_7_0.bg:GetComponent(typeof(Image)).enabled = true
		arg_7_0.bgName = var_7_2
	end

	local var_7_3 = arg_7_0.activity.data2_list
	local var_7_4 = arg_7_0.activity.data3_list

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.items) do
		local var_7_5 = arg_7_0.keyList[iter_7_0]
		local var_7_6 = table.contains(var_7_3, var_7_5) and 3 or table.contains(var_7_4, var_7_5) and 2 or 1

		onButton(arg_7_0, iter_7_1, function()
			if var_7_6 >= 3 then
				return
			end

			if var_7_6 == 2 then
				arg_7_0.selectIndex = iter_7_0

				arg_7_0:UpdateSelection()

				return
			elseif var_7_6 == 1 then
				if pg.TimeMgr.GetInstance():GetServerTime() < arg_7_0.activity.data2 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("bulin_tip_other2"))

					return
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("bulin_tip_other1"),
					onYes = function()
						pg.m02:sendNotification(GAME.PUZZLE_PIECE_OP, {
							cmd = 3,
							actId = arg_7_0.activity.id,
							id = var_7_5
						})

						arg_7_0.selectIndex = iter_7_0
					end
				})
			end
		end)
		arg_7_0.loader:GetSprite("UI/ActivityUIPage/AprilFoolDiscoveryPage_atlas", var_0_1[var_7_6], iter_7_1:Find("state"))
		setActive(iter_7_1:Find("character"), var_7_6 == 3)
	end

	setActive(arg_7_0.btnBattle, var_7_1)
	setActive(arg_7_0.btnIncomplete, not var_7_1)
	arg_7_0:UpdateSelection()
end

function var_0_0.UpdateSelection(arg_10_0)
	local var_10_0 = arg_10_0.keyList[arg_10_0.selectIndex]
	local var_10_1 = table.contains(arg_10_0.activity.data3_list, var_10_0)

	setText(arg_10_0.tip, var_10_1 and i18n("bulin_tip" .. arg_10_0.selectIndex) or "")
	arg_10_0:CreateCDTimer()
end

function var_0_0.CreateCDTimer(arg_11_0)
	if arg_11_0.CDTimer then
		return
	end

	if #arg_11_0.activity.data2_list == #arg_11_0.keyList or pg.TimeMgr.GetInstance():GetServerTime() >= arg_11_0.activity.data2 then
		setActive(arg_11_0.slider, false)
		arg_11_0:RemoveCDTimer()

		return
	end

	setActive(arg_11_0.slider, true)

	arg_11_0.CDTimer = Timer.New(function()
		local var_12_0 = arg_11_0.activity.data2
		local var_12_1 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_12_0 <= var_12_1 then
			setActive(arg_11_0.slider, false)
			arg_11_0:RemoveCDTimer()

			return
		end

		local var_12_2 = var_12_0 - var_12_1
		local var_12_3 = math.floor(var_12_2 / 60)
		local var_12_4 = var_12_2 % 60

		setText(arg_11_0.leftTime, string.format("%d:%02d", var_12_3, var_12_4))

		local var_12_5 = arg_11_0.puzzleConfig.cd

		setSlider(arg_11_0.slider, 0, 1, var_12_2 / var_12_5)
	end, 1, -1)

	arg_11_0.CDTimer:Start()
	arg_11_0.CDTimer.func()
end

function var_0_0.RemoveCDTimer(arg_13_0)
	if arg_13_0.CDTimer then
		arg_13_0.CDTimer:Stop()

		arg_13_0.CDTimer = nil
	end
end

function var_0_0.OnDestroy(arg_14_0)
	arg_14_0.loader:Clear()
	arg_14_0:RemoveCDTimer()
	var_0_0.super.OnDestroy(arg_14_0)
end

return var_0_0
