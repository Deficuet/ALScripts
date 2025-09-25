local var_0_0 = class("TownSkinPage", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "TownSkinPageUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.activity = getProxy(ActivityProxy):getActivityById(5535)
	arg_2_0.story = arg_2_0.activity:getConfig("config_client").story
	arg_2_0.storyStateDic = {}

	arg_2_0:ShowMask(false)

	arg_2_0.isPlaying = false

	arg_2_0:InitStoryState()
	arg_2_0:UpdateStoryView()
	arg_2_0:UpdateItemView(arg_2_0.activity)
end

function var_0_0.InitStoryState(arg_3_0)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.story) do
		if checkExist(arg_3_0.story, {
			iter_3_0
		}, {
			1
		}) then
			local var_3_0 = false
			local var_3_1 = iter_3_1[1]

			if pg.NewStoryMgr.GetInstance():IsPlayed(var_3_1) then
				var_3_0 = true
			end

			local var_3_2 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_3_1)

			arg_3_0.storyStateDic[var_3_2] = var_3_0
		end
	end
end

function var_0_0.UpdateStoryView(arg_4_0)
	local var_4_0 = {
		"pittsburgh",
		"indiana",
		"fargo",
		"kersaint",
		"friedrich",
		"painleve"
	}

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		local var_4_1 = arg_4_0.story[iter_4_0][1]
		local var_4_2 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_4_1)
		local var_4_3 = arg_4_0.storyStateDic[var_4_2]
		local var_4_4 = arg_4_0._tf:Find("frame/bg/" .. iter_4_1 .. "/locked")
		local var_4_5 = arg_4_0._tf:Find("frame/bg/" .. iter_4_1 .. "/unlocked")

		setActive(var_4_4, not var_4_3)
		setActive(var_4_5, var_4_3)

		if var_4_3 then
			onButton(arg_4_0, var_4_5, function()
				pg.NewStoryMgr.GetInstance():Play(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_4_2), nil, true)
			end)
		else
			onButton(arg_4_0, var_4_4, function()
				if getProxy(ActivityProxy):getActivityById(5535).data1 <= 0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("activity_0815_town_memory"))

					return
				end

				pg.m02:sendNotification(GAME.ACTIVITY_UNLOCKSTORYT, {
					cmd = 1,
					activity_id = arg_4_0.activity.id,
					arg1 = var_4_2
				})
			end)
		end
	end
end

function var_0_0.UpdateItemView(arg_7_0, arg_7_1)
	setText(arg_7_0._tf:Find("frame/des/count"), tostring(arg_7_1.data1))
end

function var_0_0.UpdataStoryState(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1.storyId

	arg_8_0.storyStateDic[var_8_0] = true

	local var_8_1 = 0

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.story) do
		local var_8_2 = iter_8_1[1]

		if pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_8_2) == var_8_0 then
			var_8_1 = iter_8_0
		end
	end

	local var_8_3 = {
		"pittsburgh",
		"indiana",
		"fargo",
		"kersaint",
		"friedrich",
		"painleve"
	}

	for iter_8_2, iter_8_3 in ipairs(var_8_3) do
		if iter_8_2 == var_8_1 then
			local var_8_4 = arg_8_0.storyStateDic[var_8_0]
			local var_8_5 = arg_8_0._tf:Find("frame/bg/" .. iter_8_3 .. "/locked")
			local var_8_6 = arg_8_0._tf:Find("frame/bg/" .. iter_8_3 .. "/unlocked")
			local var_8_7 = var_8_5:GetComponent(typeof(Animation))
			local var_8_8 = var_8_7:GetClip("anim_cowboy_skin_fargo_unlock").length

			var_8_7:Play("anim_cowboy_skin_fargo_unlock")
			arg_8_0:ShowMask(true)

			arg_8_0.isPlaying = true

			onDelayTick(function()
				arg_8_0.isPlaying = false

				arg_8_0:ShowMask(false)
				setActive(var_8_5, not var_8_4)
				setActive(var_8_6, var_8_4)
				pg.NewStoryMgr.GetInstance():Play(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_8_0))
			end, var_8_8)

			if var_8_4 then
				onButton(arg_8_0, var_8_6, function()
					pg.NewStoryMgr.GetInstance():Play(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_8_0), nil, true)
				end)
			else
				onButton(arg_8_0, var_8_5, function()
					if getProxy(ActivityProxy):getActivityById(5535).data1 <= 0 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("activity_0815_town_memory"))

						return
					end

					pg.m02:sendNotification(GAME.ACTIVITY_UNLOCKSTORYT, {
						cmd = 1,
						activity_id = arg_8_0.activity.id,
						arg1 = var_8_0
					})
				end)
			end
		end
	end
end

function var_0_0.didEnter(arg_12_0)
	onButton(arg_12_0, arg_12_0._tf:Find("frame/back"), function()
		arg_12_0:onBackPressed()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0._tf:Find("bg"), function()
		arg_12_0:onBackPressed()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0._tf:Find("frame/des/itemDes"), function()
		local var_15_0 = getProxy(ActivityProxy):getActivityById(5535).data1
		local var_15_1 = {
			type = DROP_TYPE_VITEM,
			id = arg_12_0.activity:getConfig("config_id"),
			count = var_15_0
		}

		arg_12_0:emit(BaseUI.ON_DROP, var_15_1)
	end)
	pg.UIMgr.GetInstance():BlurPanel(arg_12_0._tf)
end

function var_0_0.ShowMask(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0._tf:Find("mask")

	GetOrAddComponent(var_16_0, typeof(CanvasGroup)).blocksRaycasts = arg_16_1
end

function var_0_0.willExit(arg_17_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_17_0._tf)
end

function var_0_0.onBackPressed(arg_18_0)
	if arg_18_0.isPlaying then
		return
	end

	arg_18_0.super.onBackPressed(arg_18_0)
end

return var_0_0
