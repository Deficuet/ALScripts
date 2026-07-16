pg = pg or {}
pg.SystemGuideMgr = singletonClass("SystemGuideMgr")

local var_0_0 = pg.SystemGuideMgr
local var_0_1

function var_0_0.Init(arg_1_0, arg_1_1)
	var_0_1 = require("GameCfg.guide.newguide.SSG001")

	arg_1_1()
end

local function var_0_2(arg_2_0)
	if getProxy(PlayerProxy) then
		return pg.NewStoryMgr.GetInstance():IsPlayed(arg_2_0)
	end

	return false
end

local function var_0_3(arg_3_0)
	if arg_3_0 then
		arg_3_0()
	end
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if pg.SeriesGuideMgr.GetInstance():isRunning() then
		var_0_3(arg_4_2)

		return
	end

	if var_0_2(arg_4_0) then
		var_0_3(arg_4_2)

		return
	end

	if not pg.NewGuideMgr.GetInstance():CanPlay() then
		var_0_3(arg_4_2)

		return
	end

	if arg_4_0 == "SYG001" then
		pg.TrackerMgr.GetInstance():Tracking(TRACKING_TUTORIAL_COMPLETE_2)
	elseif arg_4_0 == "SYG003" then
		pg.TrackerMgr.GetInstance():Tracking(TRACKING_TUTORIAL_COMPLETE_3)
	elseif arg_4_0 == "SYG006" then
		pg.TrackerMgr.GetInstance():Tracking(TRACKING_TUTORIAL_COMPLETE_4)
	end

	if arg_4_3 then
		pg.NewGuideMgr.GetInstance():Play(arg_4_0, arg_4_1, function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_4_0
			})
			existCall(arg_4_2)
		end)
	else
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = arg_4_0
		})
		pg.NewGuideMgr.GetInstance():Play(arg_4_0, arg_4_1, arg_4_2)
	end
end

function var_0_0.Play(arg_6_0, arg_6_1, arg_6_2)
	if IsUnityEditor and not ENABLE_GUIDE then
		if arg_6_2 then
			arg_6_2()
		end

		return
	end

	if arg_6_1.exited then
		return
	end

	local var_6_0 = var_0_1[arg_6_1.__cname]

	if not var_6_0 then
		var_0_3(arg_6_2)

		return
	end

	local var_6_1 = _.detect(var_6_0, function(arg_7_0)
		local var_7_0 = arg_7_0.id
		local var_7_1 = arg_7_0.condition

		return not var_0_2(var_7_0) and var_7_1(arg_6_1)
	end)

	if not var_6_1 then
		var_0_3(arg_6_2)

		return
	end

	local var_6_2 = var_6_1.id
	local var_6_3 = var_6_1.args(arg_6_1)

	var_0_4(var_6_2, var_6_3, arg_6_2)
end

function var_0_0.PlayChapter(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_1.id == 1160002 then
		arg_8_0:PlayByGuideId("NG0011", nil, arg_8_2)
	elseif arg_8_1:isTypeDefence() then
		arg_8_0:PlayByGuideId("NG0016", nil, arg_8_2)
	else
		existCall(arg_8_2)
	end
end

function var_0_0.PlayByGuideId(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	var_0_4(arg_9_1, arg_9_2, arg_9_3, arg_9_4)
end

function var_0_0.FixGuide(arg_10_0, arg_10_1)
	if not var_0_2("FixGuide") then
		var_0_4("FixGuide")
		arg_10_1()
	end
end

function var_0_0.PlayDailyLevel(arg_11_0, arg_11_1)
	if not var_0_2("NG0015") then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = "NG0015"
		})
		arg_11_1()
	end
end

function var_0_0.PlayCommander(arg_12_0)
	local var_12_0 = {
		"ZHIHUIMIAO2",
		"NG006",
		"NG007",
		"ZHIHUIMIAO3",
		"NG008",
		"ZHIHUIMIAO4",
		"NG009"
	}

	if not LOCK_CATTERY then
		table.insert(var_12_0, "NG0029")
	end

	local var_12_1 = _.select(var_12_0, function(arg_13_0)
		return not var_0_2(arg_13_0)
	end)
	local var_12_2 = {}
	local var_12_3

	for iter_12_0, iter_12_1 in ipairs(var_12_1) do
		table.insert(var_12_2, function(arg_14_0)
			if iter_12_1 == "NG006" and table.getCount(getProxy(CommanderProxy):getData()) >= 1 or iter_12_1 == "NG007" and getProxy(BagProxy):getItemCountById(20012) < 1 or iter_12_1 == "NG008" and getProxy(CommanderProxy):getBoxes()[1]:getState() ~= CommanderBox.STATE_FINISHED or iter_12_1 == "NG009" and table.getCount(getProxy(CommanderProxy):getData()) ~= 1 then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = iter_12_1
				})
				arg_14_0()
			elseif iter_12_1 == "ZHIHUIMIAO2" or iter_12_1 == "ZHIHUIMIAO3" or iter_12_1 == "ZHIHUIMIAO4" then
				pg.NewStoryMgr.GetInstance():Play(iter_12_1, arg_14_0, true)
			elseif iter_12_1 == "NG0029" then
				if var_12_3 == "NG009" then
					var_0_4(iter_12_1, {
						1
					}, arg_14_0)
				else
					var_0_4(iter_12_1, {
						2
					}, arg_14_0)
				end
			else
				var_12_3 = iter_12_1

				var_0_4(iter_12_1, {}, arg_14_0)
			end
		end)
	end

	seriesAsync(var_12_2)
end

function var_0_0.PlayGuildAssaultFleet(arg_15_0, arg_15_1)
	arg_15_0:PlayByGuideId("GNG001", {}, arg_15_1)
end
