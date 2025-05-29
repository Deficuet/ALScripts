local var_0_0 = class("KwxyKrTracker")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.mapping = {
		[TRACKING_TUTORIAL_COMPLETE_1] = "tutorial_complete_1",
		[TRACKING_USER_LEVELUP] = "user_levelup",
		[TRACKING_GUIDE_COMPLETE] = "stdhour1",
		[TRACKING_EXP_LV_10] = "stdlevel10",
		[TRACKING_EXP_LV_20] = "stdlevel20",
		[TRACKING_EXP_LV_30] = "stdlevel30",
		[TRACKING_STRIKE_FAILD] = "stdexhausted",
		[TRACKING_PAY_OIL] = "stdstaminapurchase",
		[TRACKING_PAY_FAILD] = "stdrechargeprompt",
		[TRACKING_PAY_SUCCESS] = "stdrecharge",
		[TRACKING_BUILD_OR_SKIN_FAILD] = "stdlackofdiamonds",
		[TRACKING_COST_300_D] = "stdspend300"
	}
end

function var_0_0.Tracking(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	if arg_2_0.mapping[arg_2_1] == nil then
		return
	end

	if arg_2_1 == TRACKING_TUTORIAL_COMPLETE_1 then
		pg.SdkMgr.GetInstance():CompletedTutorial()
		pg.SdkMgr.GetInstance():UnlockAchievement()
	elseif arg_2_1 == TRACKING_USER_LEVELUP then
		pg.SdkMgr.GetInstance():SdkLevelUp(arg_2_4, arg_2_3)
	else
		pg.SdkMgr.GetInstance():EventTrack(arg_2_1)
	end
end

return var_0_0
