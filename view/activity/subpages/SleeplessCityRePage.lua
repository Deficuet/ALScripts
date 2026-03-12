local var_0_0 = class("SleeplessCityRePage", import(".TemplatePage.PtTemplatePage"))

var_0_0.COLOR = "#BD3F40"

function var_0_0.OnFirstFlush(arg_1_0)
	var_0_0.super.OnFirstFlush(arg_1_0)
	onButton(arg_1_0, arg_1_0.getBtn, function()
		local var_2_0 = {}
		local var_2_1 = arg_1_0.ptData:GetAward()
		local var_2_2 = getProxy(PlayerProxy):getRawData()
		local var_2_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_2_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_2_3)
		local var_2_5, var_2_6 = Task.StaticJudgeOverflow(var_2_2.gold, var_2_2.oil, var_2_4, true, true, {
			{
				var_2_1.type,
				var_2_1.id,
				var_2_1.count
			}
		})

		if var_2_5 then
			table.insert(var_2_0, function(arg_3_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_2_6,
					onYes = arg_3_0
				})
			end)
		end

		seriesAsync(var_2_0, function()
			local var_4_0, var_4_1 = arg_1_0.ptData:GetResProgress()

			arg_1_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
				cmd = 1,
				activity_id = arg_1_0.ptData:GetId(),
				arg1 = var_4_1,
				callback = function()
					arg_1_0:OnUpdateFlush()
				end
			})
		end)
	end, SFX_PANEL)
	arg_1_0:OnUpdateFlush()
end

function var_0_0.OnUpdateFlush(arg_6_0)
	local var_6_0 = arg_6_0.activity:getConfig("config_client").story

	if arg_6_0.level and checkExist(var_6_0, {
		arg_6_0.level
	}, {
		1
	}) then
		pg.NewStoryMgr.GetInstance():Play(var_6_0[arg_6_0.level][1])
	end

	arg_6_0.level = arg_6_0.ptData:getTargetLevel()

	if arg_6_0.step then
		local var_6_1, var_6_2, var_6_3 = arg_6_0.ptData:GetLevelProgress()

		setText(arg_6_0.step, var_6_1 .. "/" .. var_6_2)
	end

	local var_6_4, var_6_5, var_6_6 = arg_6_0.ptData:GetResProgress()

	setText(arg_6_0.progress, (var_6_6 >= 1 and setColorStr(var_6_4, COLOR_GREEN) or setColorStr(var_6_4, var_0_0.COLOR)) .. "/" .. var_6_5)
	setSlider(arg_6_0.slider, 0, 1, var_6_6)

	local var_6_7 = arg_6_0.ptData:CanGetAward()
	local var_6_8 = arg_6_0.ptData:CanGetNextAward()
	local var_6_9 = arg_6_0.ptData:CanGetMorePt()

	setActive(arg_6_0.battleBtn, var_6_9 and not var_6_7 and var_6_8)
	setActive(arg_6_0.getBtn, var_6_7)
	setActive(arg_6_0.gotBtn, not var_6_8)

	local var_6_10 = arg_6_0.ptData:GetAward()

	updateDrop(arg_6_0.awardTF, var_6_10)
	onButton(arg_6_0, arg_6_0.awardTF, function()
		arg_6_0:emit(BaseUI.ON_DROP, var_6_10)
	end, SFX_PANEL)
	setText(arg_6_0.bg:Find("description"), i18n("activity_victory"))

	if not var_6_8 and var_6_6 >= 1 and not var_6_7 then
		arg_6_0.level = arg_6_0.level + 1
	end
end

return var_0_0
