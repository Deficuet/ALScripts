local var_0_0 = class("AprilFoolDiscovery2024Page", import(".AprilFoolDiscoveryRePage"))
local var_0_1 = "goldenawake"

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")

	local var_1_0 = arg_1_0._tf:Find("AD/List")

	arg_1_0.items = CustomIndexLayer.Clone2Full(var_1_0, 11)
	arg_1_0.selectIndex = 0
	arg_1_0.btnHelp = arg_1_0.bg:Find("help_btn")
	arg_1_0.btnBattle = arg_1_0.bg:Find("battle_btn")
	arg_1_0.tip = arg_1_0.bg:Find("tip")
	arg_1_0.slider = arg_1_0.bg:Find("slider")
	arg_1_0.leftTime = arg_1_0.slider:Find("time")
	arg_1_0.loader = AutoLoader.New()

	for iter_1_0 = 1, #var_0_1 do
		arg_1_0.loader:GetSprite("ui/activityuipage/AprilFoolDiscovery2024Page_atlas", string.sub(var_0_1, iter_1_0, iter_1_0), arg_1_0.items[iter_1_0]:Find("Character"))
	end

	arg_1_0._funcsLink = {}
end

function var_0_0.OnDataSetting(arg_2_0)
	local var_2_0 = var_0_0.super.OnDataSetting(arg_2_0)

	local function var_2_1()
		if arg_2_0.activity.data1 == 1 and arg_2_0.activity.data3 == 1 then
			arg_2_0.activity.data3 = 0

			pg.m02:sendNotification(GAME.PUZZLE_PIECE_OP, {
				cmd = 4,
				actId = arg_2_0.activity.id
			})

			return true
		end
	end

	var_2_0 = var_2_0 or var_2_1()

	return var_2_0
end

function var_0_0.OnFirstFlush(arg_4_0)
	local var_4_0 = pg.activity_event_picturepuzzle[arg_4_0.activity.id]

	assert(var_4_0, "Can't Find activity_event_picturepuzzle 's ID : " .. arg_4_0.activity.id)

	arg_4_0.puzzleConfig = var_4_0
	arg_4_0.keyList = Clone(var_4_0.pickup_picturepuzzle)

	table.insertto(arg_4_0.keyList, var_4_0.drop_picturepuzzle)
	assert(#arg_4_0.keyList == #arg_4_0.items, string.format("keyList has {0}, but items has {1}", #arg_4_0.keyList, #arg_4_0.items))
	table.sort(arg_4_0.keyList)
	onButton(arg_4_0, arg_4_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.caibulin_help.tip
		})
	end, SFX_PANEL)

	local var_4_1 = arg_4_0.activity.id

	onButton(arg_4_0, arg_4_0.btnBattle, function()
		if #arg_4_0.activity.data2_list < #arg_4_0.keyList then
			pg.TipsMgr.GetInstance():ShowTips(i18n("caibulin_lock_tip"))

			return
		end

		local var_6_0 = arg_4_0.puzzleConfig.chapter

		arg_4_0:emit(ActivityMediator.ON_SIMULATION_COMBAT, {
			warnMsg = "bulin_tip_other3",
			stageId = var_6_0
		}, function()
			if not pg.NewStoryMgr.GetInstance():IsPlayed(tostring(var_6_0), true) then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = tostring(var_6_0)
				})
			end

			local var_7_0 = getProxy(ActivityProxy)
			local var_7_1 = var_7_0:getActivityById(var_4_1)

			if var_7_1.data1 == 1 then
				return
			end

			var_7_1.data3 = 1

			var_7_0:updateActivity(var_7_1)
		end)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_8_0)
	local var_8_0

	var_8_0 = arg_8_0.activity.data1 >= 1

	local var_8_1 = #arg_8_0.activity.data2_list == #arg_8_0.keyList
	local var_8_2 = arg_8_0.activity.data2_list
	local var_8_3 = arg_8_0.activity.data3_list

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.items) do
		local var_8_4 = arg_8_0.keyList[iter_8_0]
		local var_8_5 = table.contains(var_8_2, var_8_4) and 3 or table.contains(var_8_3, var_8_4) and 2 or 1

		onButton(arg_8_0, iter_8_1, function()
			if var_8_5 >= 3 then
				return
			end

			if var_8_5 == 2 then
				arg_8_0.selectIndex = iter_8_0

				arg_8_0:UpdateSelection()

				return
			elseif var_8_5 == 1 then
				if pg.TimeMgr.GetInstance():GetServerTime() < arg_8_0.activity.data2 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("bulin_tip_other2"))

					return
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("bulin_tip_other1"),
					onYes = function()
						pg.m02:sendNotification(GAME.PUZZLE_PIECE_OP, {
							cmd = 3,
							actId = arg_8_0.activity.id,
							id = var_8_4
						})

						arg_8_0.selectIndex = iter_8_0
					end
				})
			end
		end)
		setActive(iter_8_1:Find("Character"), var_8_5 == 3)
		setActive(iter_8_1:Find("Unlock"), var_8_5 == 2)
		setActive(iter_8_1:Find("Locked"), var_8_5 == 1)
	end

	setActive(arg_8_0.btnBattle:Find("Lock"), not var_8_1)
	arg_8_0:UpdateSelection()

	local var_8_6 = pg.activity_event_picturepuzzle[arg_8_0.activity.id]

	if #table.mergeArray(arg_8_0.activity.data1_list, arg_8_0.activity.data2_list, true) >= #var_8_6.pickup_picturepuzzle + #var_8_6.drop_picturepuzzle then
		local var_8_7 = arg_8_0.activity:getConfig("config_client").comStory

		arg_8_0:AddFunc(function(arg_11_0)
			pg.NewStoryMgr.GetInstance():Play(var_8_7, arg_11_0)
		end)
	end
end

function var_0_0.UpdateSelection(arg_12_0)
	local var_12_0 = arg_12_0.keyList[arg_12_0.selectIndex]
	local var_12_1 = table.contains(arg_12_0.activity.data3_list, var_12_0)

	setText(arg_12_0.tip, var_12_1 and i18n("caibulin_tip" .. arg_12_0.selectIndex) or "")
	arg_12_0:CreateCDTimer()
end

return var_0_0
