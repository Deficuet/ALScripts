local var_0_0 = class("EducateGuideSequence")

var_0_0.config = {
	EducateScene = {
		{
			ignorePlayer = true,
			id = "tb_1",
			condition = function()
				return getProxy(EducateProxy):GetTaskProxy():GetTaskById(EducateConst.MAIN_TASK_ID_1)
			end,
			args = function()
				return {}
			end,
			nextOne = function()
				return "tb_2"
			end
		},
		{
			id = "tb_2",
			ignorePlayer = true,
			condition = function()
				return pg.NewStoryMgr.GetInstance():IsPlayed("tb_1") and getProxy(EducateProxy):GetTaskProxy():GetTargetId() == 0
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_4",
			condition = function()
				local var_6_0 = getProxy(EducateProxy):GetCurTime()

				return pg.NewStoryMgr.GetInstance():IsPlayed("tb_3") and var_6_0.month == 2 and var_6_0.week == 4
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_5",
			condition = function()
				return getProxy(EducateProxy):GetCurTime().month ~= 2
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_18",
			condition = function()
				local var_10_0 = getProxy(EducateProxy):GetCurTime()

				return var_10_0.month == 3 and var_10_0.week == 2
			end,
			args = function()
				return {}
			end,
			nextOne = function()
				return "tb_19"
			end
		},
		{
			id = "tb_19",
			condition = function()
				local var_13_0 = getProxy(EducateProxy):GetCurTime()

				return pg.NewStoryMgr.GetInstance():IsPlayed("tb_18") and var_13_0.month == 3 and var_13_0.week == 2
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_8",
			condition = function()
				return #getProxy(EducateProxy):GetPolaroidList() > 0
			end,
			args = function()
				return pg.NewStoryMgr.GetInstance():IsPlayed("tb_7") and {
					1,
					3
				} or {
					1,
					2,
					3
				}
			end
		},
		{
			id = "tb_12_0",
			condition = function()
				return #getProxy(EducateProxy):GetEventProxy():GetHomeSpecEvents() > 0
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_12",
			condition = function()
				return EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_FAVOR_AND_MIND)
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_10",
			condition = function()
				local var_21_0 = getProxy(EducateProxy):GetCurTime()

				return var_21_0.month == 3 and var_21_0.week == 4 and #getProxy(EducateProxy):GetBuffList() > 0
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_9_2",
			condition = function()
				local var_23_0 = getProxy(EducateProxy):GetTaskProxy()
				local var_23_1 = var_23_0:GetTargetId()
				local var_23_2 = var_23_0:GetTargetSetDays()
				local var_23_3 = getProxy(EducateProxy):GetCurTime()

				return EducateHelper.IsSameDay(var_23_3, var_23_2[2]) and pg.child_target_set[var_23_1].stage == 2
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_11",
			ignorePlayer = true,
			condition = function()
				local var_25_0 = getProxy(EducateProxy):GetCurTime()
				local var_25_1 = getProxy(EducateProxy):GetCharData()

				return var_25_0.month == 4 and var_25_0.week == 1 and var_25_1.site == var_25_1:GetSiteCnt()
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_13",
			condition = function()
				local var_27_0 = getProxy(EducateProxy):GetCurTime()

				return var_27_0.month == 4 and var_27_0.week == 3
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_14",
			condition = function()
				local var_29_0 = getProxy(EducateProxy):GetCurTime()

				return var_29_0.month == 4 and var_29_0.week == 4
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_21",
			condition = function()
				local var_31_0 = getProxy(EducateProxy):GetTaskProxy()
				local var_31_1 = var_31_0:GetTargetId()
				local var_31_2 = var_31_0:GetTargetSetDays()
				local var_31_3 = getProxy(EducateProxy):GetCurTime()

				return EducateHelper.IsSameDay(var_31_3, var_31_2[3]) and pg.child_target_set[var_31_1].stage == 3
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_9",
			condition = function()
				local var_33_0 = getProxy(EducateProxy):GetCurTime()

				return var_33_0.month == 6 and var_33_0.week == 1
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_22",
			condition = function()
				local var_35_0 = getProxy(EducateProxy):GetTaskProxy()
				local var_35_1 = var_35_0:GetTargetId()
				local var_35_2 = var_35_0:GetTargetSetDays()
				local var_35_3 = getProxy(EducateProxy):GetCurTime()

				return EducateHelper.IsSameDay(var_35_3, var_35_2[4]) and pg.child_target_set[var_35_1].stage == 4
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_16",
			condition = function()
				local var_37_0 = getProxy(EducateProxy):GetCurTime()

				return var_37_0.month == 14 and var_37_0.week == 4
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb_17",
			condition = function()
				return getProxy(EducateProxy):GetGameStatus() == EducateConst.STATUES_RESET
			end,
			args = function()
				return {}
			end
		}
	},
	EducateTargetLayer = {
		{
			id = "tb_3",
			ignorePlayer = true,
			condition = function()
				return pg.NewStoryMgr.GetInstance():IsPlayed("tb_2") and getProxy(EducateProxy):GetTaskProxy():GetTaskById(EducateConst.MAIN_TASK_ID_2)
			end,
			args = function()
				return {}
			end
		}
	},
	EducateCollectEntranceLayer = {
		{
			id = "tb_7",
			condition = function()
				return EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_MEMORY)
			end,
			args = function()
				return {}
			end
		}
	}
}

function var_0_0.CheckGuide(arg_45_0, arg_45_1)
	if not getProxy(EducateProxy):IsFirstGame() then
		arg_45_1()

		return
	end

	local var_45_0 = var_0_0.config[arg_45_0] or {}
	local var_45_1 = underscore.detect(var_45_0, function(arg_46_0)
		local var_46_0 = arg_46_0.id
		local var_46_1 = arg_46_0.condition

		return (arg_46_0.ignorePlayer or not pg.NewStoryMgr.GetInstance():IsPlayed(var_46_0)) and var_46_1()
	end)

	if not var_45_1 then
		arg_45_1()

		return
	end

	local var_45_2 = var_45_1.id
	local var_45_3 = var_45_1.args()

	if pg.SeriesGuideMgr.GetInstance():isRunning() then
		arg_45_1()

		return
	end

	if not pg.NewGuideMgr.GetInstance():CanPlay() then
		arg_45_1()

		return
	end

	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = var_45_2
	})
	pg.NewGuideMgr.GetInstance():Play(var_45_2, var_45_3, function()
		if var_45_1.nextOne then
			local var_47_0, var_47_1 = var_45_1.nextOne()

			var_0_0.PlayNextOne(var_47_0, var_47_1)
		end

		arg_45_1()
	end, arg_45_1)
end

function var_0_0.PlayNextOne(arg_48_0, arg_48_1)
	if not arg_48_0 then
		return
	end

	pg.NewGuideMgr.GetInstance():Play(arg_48_0, arg_48_1, function()
		return
	end)
	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = arg_48_0
	})
end

return var_0_0
