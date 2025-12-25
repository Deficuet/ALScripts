local var_0_0 = class("WinterFestival2025SkinMagazinePage", import("view.activity.CorePage.CorSkinMagazineTemplatePage"))

var_0_0.EXPAND_WIDTH = 761
var_0_0.CLOSE_WIDTH = 164
var_0_0.DURATION_PARAMETER = 2500

function var_0_0.OnFirstFlush(arg_1_0)
	var_0_0.super.OnFirstFlush(arg_1_0)

	for iter_1_0, iter_1_1 in ipairs(arg_1_0.taskList) do
		local var_1_0 = arg_1_0.items:GetChild(iter_1_0 - 1):Find("got")
		local var_1_1 = arg_1_0.items:GetChild(iter_1_0 - 1):Find("got_short")

		setActive(var_1_0, false)
		setActive(var_1_1, false)
	end

	local var_1_2 = arg_1_0.activity:getConfig("config_client").story

	for iter_1_2, iter_1_3 in ipairs(arg_1_0.taskList) do
		local var_1_3 = arg_1_0.taskProxy:getFinishTaskById(iter_1_3)

		if var_1_3 and var_1_3:getTaskStatus() == 2 and checkExist(var_1_2, {
			iter_1_2
		}, {
			1
		}) then
			local var_1_4 = var_1_2[iter_1_2][1]
			local var_1_5, var_1_6 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_1_4)

			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = var_1_4
			})
		end
	end
end

function var_0_0.OnUpdateFlush(arg_2_0)
	local var_2_0 = 0
	local var_2_1 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.taskList) do
		var_2_1[iter_2_1] = tobool(arg_2_0.taskProxy:getFinishTaskById(iter_2_1))

		if var_2_1[iter_2_1] then
			var_2_0 = var_2_0 + 1
		end

		local var_2_2 = arg_2_0.items:GetChild(iter_2_0 - 1):Find("got")
		local var_2_3 = arg_2_0.items:GetChild(iter_2_0 - 1):Find("got_short")
		local var_2_4 = var_2_2:GetComponent(typeof(DftAniEvent))
		local var_2_5 = var_2_3:GetComponent(typeof(DftAniEvent))

		local function var_2_6()
			local var_3_0 = arg_2_0.activity:getConfig("config_client").story

			for iter_3_0, iter_3_1 in ipairs(arg_2_0.taskList) do
				if arg_2_0.taskProxy:getFinishTaskById(iter_3_1) and checkExist(var_3_0, {
					iter_3_0
				}, {
					1
				}) then
					local var_3_1 = var_3_0[iter_3_0][1]

					playStory(var_3_1)
				end
			end
		end

		var_2_4:SetEndEvent(var_2_6)
		var_2_5:SetEndEvent(var_2_6)

		if arg_2_0.index == iter_2_0 then
			setActive(var_2_2, var_2_1[iter_2_1])
			setActive(var_2_3, false)
		else
			setActive(var_2_2, false)
			setActive(var_2_3, var_2_1[iter_2_1])
		end
	end

	if arg_2_0.usedCnt ~= var_2_0 then
		arg_2_0.usedCnt = var_2_0

		local var_2_7 = arg_2_0.activity

		var_2_7.data1 = arg_2_0.usedCnt

		getProxy(ActivityProxy):updateActivity(var_2_7)
	end

	arg_2_0:RefreshData()
	setText(arg_2_0.countTf, arg_2_0.remainCnt)

	local var_2_8 = var_2_1[arg_2_0.taskList[arg_2_0.index]]

	setActive(arg_2_0.awardTf:Find("got"), var_2_8)
	setActive(arg_2_0.awardTf:Find("get"), arg_2_0.remainCnt > 0 and not var_2_8)
end

return var_0_0
