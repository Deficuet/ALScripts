local var_0_0 = class("PreviewPtHybridTemplatePage", import("view.base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.btnList = arg_1_0:findTF("btn_list", arg_1_0.bg)
	arg_1_0.battleBtn = arg_1_0:findTF("fight", arg_1_0.btnList)
	arg_1_0.getBtn = arg_1_0:findTF("get_btn", arg_1_0.btnList)
	arg_1_0.gotBtn = arg_1_0:findTF("got_btn", arg_1_0.btnList)
	arg_1_0.ptList = arg_1_0:findTF("pt_list", arg_1_0.bg)
	arg_1_0.slider = arg_1_0:findTF("slider", arg_1_0.ptList)
	arg_1_0.step = arg_1_0:findTF("step", arg_1_0.ptList)
	arg_1_0.progress = arg_1_0:findTF("progress", arg_1_0.ptList)
	arg_1_0.awardTF = arg_1_0:findTF("award", arg_1_0.ptList)
end

function var_0_0.OnFirstFlush(arg_2_0)
	arg_2_0:initBtn()
	eachChild(arg_2_0.btnList, function(arg_3_0)
		arg_2_0.btnFuncList[arg_3_0.name](arg_3_0)
	end)
end

function var_0_0.OnDataSetting(arg_4_0)
	if arg_4_0.ptData then
		arg_4_0.ptData:Update(arg_4_0.activity)
	else
		arg_4_0.ptData = ActivityPtData.New(arg_4_0.activity)
	end
end

function var_0_0.initBtn(arg_5_0)
	local function var_5_0(arg_6_0)
		local var_6_0 = getProxy(ActivityProxy):getActivityById(arg_6_0)

		if not var_6_0 or var_6_0 and var_6_0:isEnd() then
			return true
		else
			return false
		end
	end

	local var_5_1 = arg_5_0.activity:getConfig("config_client")

	arg_5_0.btnFuncList = {
		task = function(arg_7_0)
			onButton(arg_5_0, arg_7_0, function()
				if var_5_1.taskLinkActID and var_5_0(var_5_1.taskLinkActID) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_5_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
					page = "activity"
				})
			end)
		end,
		shop = function(arg_9_0)
			local var_9_0 = _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_10_0)
				return arg_10_0:getConfig("config_client").pt_id == pg.gameset.activity_res_id.key_value
			end)

			onButton(arg_5_0, arg_9_0, function()
				if var_5_1.shopLinkActID and var_5_0(var_5_1.shopLinkActID) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_5_0:emit(ActivityMediator.GO_SHOPS_LAYER, {
					warp = NewShopsScene.TYPE_ACTIVITY,
					actId = var_9_0 and var_9_0.id
				})
			end)
		end,
		build = function(arg_12_0)
			onButton(arg_5_0, arg_12_0, function()
				if var_5_1.buildLinkActID and var_5_0(var_5_1.buildLinkActID) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_5_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
					page = BuildShipScene.PAGE_BUILD,
					projectName = BuildShipScene.PROJECTS.ACTIVITY
				})
			end)
		end,
		fight = function(arg_14_0)
			onButton(arg_5_0, arg_14_0, function()
				if var_5_1.fightLinkActID and var_5_0(var_5_1.fightLinkActID) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_5_0:emit(ActivityMediator.BATTLE_OPERA)
			end)
		end,
		lottery = function(arg_16_0)
			onButton(arg_5_0, arg_16_0, function()
				if var_5_1.lotteryLinkActID and var_5_0(var_5_1.lotteryLinkActID) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_5_0:emit(ActivityMediator.GO_LOTTERY)
			end)
		end,
		memory = function(arg_18_0)
			return
		end,
		activity = function(arg_19_0)
			return
		end,
		mountain = function(arg_20_0)
			return
		end,
		skinshop = function(arg_21_0)
			onButton(arg_5_0, arg_21_0, function()
				arg_5_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.SKINSHOP)
			end)
		end,
		display_btn = function(arg_23_0)
			onButton(arg_5_0, arg_23_0, function()
				arg_5_0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {
					type = arg_5_0.ptData.type,
					dropList = arg_5_0.ptData.dropList,
					targets = arg_5_0.ptData.targets,
					level = arg_5_0.ptData.level,
					count = arg_5_0.ptData.count,
					resId = arg_5_0.ptData.resId,
					unlockStamps = arg_5_0.ptData:GetDayUnlockStamps()
				})
			end, SFX_PANEL)
		end,
		get_btn = function(arg_25_0)
			onButton(arg_5_0, arg_25_0, function()
				local var_26_0 = {}
				local var_26_1 = arg_5_0.ptData:GetAward()
				local var_26_2 = getProxy(PlayerProxy):getRawData()
				local var_26_3 = pg.gameset.urpt_chapter_max.description[1]
				local var_26_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_26_3)
				local var_26_5, var_26_6 = Task.StaticJudgeOverflow(var_26_2.gold, var_26_2.oil, var_26_4, true, true, {
					{
						var_26_1.type,
						var_26_1.id,
						var_26_1.count
					}
				})

				if var_26_5 then
					table.insert(var_26_0, function(arg_27_0)
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							type = MSGBOX_TYPE_ITEM_BOX,
							content = i18n("award_max_warning"),
							items = var_26_6,
							onYes = arg_27_0
						})
					end)
				end

				seriesAsync(var_26_0, function()
					local var_28_0, var_28_1 = arg_5_0.ptData:GetResProgress()

					arg_5_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
						cmd = 1,
						activity_id = arg_5_0.ptData:GetId(),
						arg1 = var_28_1
					})
				end)
			end, SFX_PANEL)
		end,
		got_btn = function(arg_29_0)
			return
		end,
		boost_btn = function(arg_30_0)
			onButton(arg_5_0, arg_30_0, function()
				if var_5_1.boostLinkActID and var_5_0(var_5_1.boostLinkActID) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				local var_31_0 = getProxy(ActivityProxy):getActivityById(var_5_1.boostLinkActID)
				local var_31_1 = var_31_0:getConfig("config_id")
				local var_31_2 = var_31_0:getConfig("config_client").icon
				local var_31_3 = var_31_0:getConfig("config_client").name
				local var_31_4 = var_31_0:getConfig("config_client").desc

				if var_31_2 and var_31_3 and var_31_4 then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						iconPreservedAspect = true,
						hideNo = true,
						yesText = "text_confirm",
						type = MSGBOX_TYPE_DROP_ITEM,
						content = i18n(var_31_4),
						name = i18n(var_31_3),
						iconPath = {
							"Props/" .. var_31_2,
							var_31_2
						}
					})
				end
			end, SFX_PANEL)
		end
	}
end

function var_0_0.OnUpdateFlush(arg_32_0)
	local var_32_0 = arg_32_0.ptData:getTargetLevel()
	local var_32_1 = arg_32_0.activity:getConfig("config_client").story

	if checkExist(var_32_1, {
		var_32_0
	}, {
		1
	}) then
		pg.NewStoryMgr.GetInstance():Play(var_32_1[var_32_0][1])
	end

	if arg_32_0.step then
		local var_32_2, var_32_3, var_32_4 = arg_32_0.ptData:GetLevelProgress()

		setText(arg_32_0.step, var_32_2 .. "/" .. var_32_3)
	end

	local var_32_5, var_32_6, var_32_7 = arg_32_0.ptData:GetResProgress()

	setText(arg_32_0.progress, (var_32_7 >= 1 and setColorStr(var_32_5, COLOR_GREEN) or var_32_5) .. "/" .. var_32_6)
	setSlider(arg_32_0.slider, 0, 1, var_32_7)

	local var_32_8 = arg_32_0.ptData:CanGetAward()
	local var_32_9 = arg_32_0.ptData:CanGetNextAward()
	local var_32_10 = arg_32_0.ptData:CanGetMorePt()

	setActive(arg_32_0.battleBtn, var_32_10 and not var_32_8 and var_32_9)
	setActive(arg_32_0.getBtn, var_32_8)
	setActive(arg_32_0.gotBtn, not var_32_9)

	local var_32_11 = arg_32_0.ptData:GetAward()

	updateDrop(arg_32_0.awardTF, var_32_11)
	onButton(arg_32_0, arg_32_0.awardTF, function()
		arg_32_0:emit(BaseUI.ON_DROP, var_32_11)
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_34_0)
	return
end

function var_0_0.GetWorldPtData(arg_35_0, arg_35_1)
	if arg_35_1 <= pg.TimeMgr.GetInstance():GetServerTime() - (ActivityMainScene.Data2Time or 0) then
		ActivityMainScene.Data2Time = pg.TimeMgr.GetInstance():GetServerTime()

		arg_35_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 2,
			activity_id = arg_35_0.ptData:GetId()
		})
	end
end

return var_0_0
