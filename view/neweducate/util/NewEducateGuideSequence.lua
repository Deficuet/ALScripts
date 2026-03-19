local var_0_0 = class("NewEducateGuideSequence")

var_0_0.config = {
	NewEducateTalentLayer = {
		{
			id = "tb2_1",
			condition = function()
				return true
			end
		}
	},
	NewEducateMainScene = {
		{
			id = "tb2_2",
			condition = function()
				return pg.NewStoryMgr.GetInstance():IsPlayed("tb2_1") and #getProxy(NewEducateProxy):GetCurChar():GetTalentList() > 0
			end
		},
		{
			id = "tb2_3",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 1 and not getProxy(NewEducateProxy):GetCurChar():GetFSM():GetState(NewEducateFSM.SYSTEM.TOPIC)
			end
		},
		{
			id = "tb2_4",
			condition = function()
				return pg.NewStoryMgr.GetInstance():IsPlayed("tb2_3")
			end,
			nextOne = function()
				return "tb2_5"
			end
		},
		{
			id = "tb2_5",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 1
			end,
			nextOne = function()
				return "tb2_6"
			end
		},
		{
			id = "tb2_6",
			condition = function()
				return pg.NewStoryMgr.GetInstance():IsPlayed("tb2_5")
			end,
			nextOne = function()
				return "tb2_7"
			end
		},
		{
			id = "tb2_7",
			condition = function()
				return pg.NewStoryMgr.GetInstance():IsPlayed("tb2_6")
			end
		},
		{
			id = "tb2_9",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 2
			end,
			nextOne = function()
				return "tb2_10"
			end
		},
		{
			id = "tb2_10",
			condition = function()
				return pg.NewStoryMgr.GetInstance():IsPlayed("tb2_9")
			end
		},
		{
			id = "tb2_11",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():IsUnlock("rand_event")
			end
		},
		{
			id = "tb2_13",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():IsUnlock("char_event")
			end
		},
		{
			id = "tb2_15",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():IsUnlock("shop")
			end
		},
		{
			id = "tb2_17",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetPermanentData():IsTarotType()
			end
		},
		{
			id = "tb2_18",
			condition = function()
				local var_18_0 = getProxy(NewEducateProxy):GetCurChar()

				if not var_18_0:GetRoundData():ExistEndless() then
					return false
				end

				if var_18_0:GetFSM():GetSystemNo() ~= NewEducateFSM.SYSTEM.ENDING then
					return false
				end

				local var_18_1 = var_18_0:GetFSM():GetState(NewEducateFSM.SYSTEM.ENDING)

				return var_18_1 and var_18_1:IsFinish()
			end
		}
	},
	NewEducateScheduleScene = {
		{
			id = "tb2_8",
			condition = function()
				return pg.NewStoryMgr.GetInstance():IsPlayed("tb2_7")
			end
		},
		{
			id = "tb2_14",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():IsUnlock("lesson_upgrade")
			end
		}
	},
	NewEducateChooseLayer = {
		{
			id = "tb2_16",
			condition = function()
				return true
			end
		}
	},
	NewEducateRankLayer = {
		{
			id = "tb2_20",
			condition = function()
				return true
			end
		}
	}
}

function var_0_0.CheckGuide(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1 or function()
		return
	end

	if NewEducateConst.LOCK_GUIDE then
		var_23_0()

		return
	end

	local var_23_1 = getProxy(NewEducateProxy):GetCurChar()

	if var_23_1:GetGameCnt() ~= 1 or var_23_1:GetRoundData():IsTemp() then
		var_23_0()

		return
	end

	local var_23_2 = var_0_0.config[arg_23_0] or {}
	local var_23_3 = underscore.detect(var_23_2, function(arg_25_0)
		local var_25_0 = arg_25_0.id
		local var_25_1 = arg_25_0.condition

		return not pg.NewStoryMgr.GetInstance():IsPlayed(var_25_0) and var_25_1()
	end)

	if not var_23_3 then
		var_23_0()

		return
	end

	local var_23_4 = var_23_3.id
	local var_23_5 = {
		var_23_1.id
	}

	if pg.SeriesGuideMgr.GetInstance():isRunning() then
		var_23_0()

		return
	end

	if not pg.NewGuideMgr.GetInstance():CanPlay() then
		var_23_0()

		return
	end

	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = var_23_4
	})
	pg.NewGuideMgr.GetInstance():Play(var_23_4, var_23_5, function()
		if var_23_3.nextOne then
			local var_26_0 = var_23_3.nextOne()

			var_0_0.PlayNextOne(var_26_0, var_23_5)
		end
	end, var_23_0)
end

function var_0_0.PlayNextOne(arg_27_0, arg_27_1)
	if not arg_27_0 then
		return
	end

	pg.NewGuideMgr.GetInstance():Play(arg_27_0, arg_27_1, function()
		return
	end)
	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = arg_27_0
	})
end

return var_0_0
