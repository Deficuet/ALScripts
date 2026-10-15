local var_0_0 = class("LevelAwardPage", import("...base.BaseActivityPage"))

function var_0_0.getResource(arg_1_0)
	local var_1_0 = {
		"ui/activityuipage/level_award_atlas"
	}

	table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))

	return var_1_0
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.bg = arg_2_0._tf:Find("bg")
	arg_2_0.award = arg_2_0._tf:Find("scroll/award")
	arg_2_0.content = arg_2_0._tf:Find("scroll/content")
	arg_2_0.scrollTF = arg_2_0._tf:Find("scroll")
	arg_2_0.pageSignDownTF = arg_2_0._tf:Find("sign")
	arg_2_0.pageSignUpTF = arg_2_0._tf:Find("sign_up")
end

function var_0_0.OnDataSetting(arg_3_0)
	arg_3_0.config = pg.activity_level_award[arg_3_0.activity:getConfig("config_id")]
end

function var_0_0.OnFirstFlush(arg_4_0)
	setActive(arg_4_0.award, false)

	for iter_4_0 = 1, #arg_4_0.config.front_drops do
		local var_4_0 = arg_4_0.config.front_drops[iter_4_0]
		local var_4_1 = var_4_0[1]
		local var_4_2 = cloneTplTo(arg_4_0.award, arg_4_0.content, "award" .. tostring(iter_4_0))
		local var_4_3 = var_4_2:Find("limit_label/labelLevel")
		local var_4_4 = var_4_2:Find("btnAchieve")
		local var_4_5 = var_4_2:Find("items")
		local var_4_6 = var_4_2:Find("item")

		setActive(var_4_6, false)
		GetImageSpriteFromAtlasAsync("ui/activityuipage/level_award_atlas", tostring(var_4_1), var_4_3, true)

		for iter_4_1 = 2, #var_4_0 do
			local var_4_7 = cloneTplTo(var_4_6, var_4_5)
			local var_4_8 = var_4_0[iter_4_1]
			local var_4_9 = {
				type = var_4_8[1],
				id = var_4_8[2],
				count = var_4_8[3]
			}

			updateDrop(var_4_7, var_4_9)
			onButton(arg_4_0, var_4_7, function()
				arg_4_0:emit(BaseUI.ON_DROP, var_4_9)
			end, SFX_PANEL)
		end

		onButton(arg_4_0, var_4_4, function()
			arg_4_0:emit(ActivityMediator.EVENT_OPERATION, {
				cmd = 1,
				activity_id = arg_4_0.activity.id,
				arg1 = var_4_1
			})
		end, SFX_PANEL)
		onScroll(arg_4_0, arg_4_0.scrollTF, function(arg_7_0)
			setActive(arg_4_0.pageSignDownTF, arg_7_0.y > 0.01)
			setActive(arg_4_0.pageSignUpTF, arg_7_0.y < 0.99)
		end)
	end
end

function var_0_0.OnUpdateFlush(arg_8_0)
	for iter_8_0 = 1, #arg_8_0.config.front_drops do
		local var_8_0 = arg_8_0.config.front_drops[iter_8_0]
		local var_8_1 = arg_8_0.content:Find("award" .. tostring(iter_8_0))
		local var_8_2 = var_8_1:Find("btnAchieve")
		local var_8_3 = var_8_1:Find("achieve_sign")
		local var_8_4 = _.include(arg_8_0.activity.data1_list, var_8_0[1])

		if var_8_4 then
			var_8_1.transform:SetAsLastSibling()
		end

		setGray(var_8_1:Find("limit_label"), var_8_4)
		setGray(var_8_1:Find("items"), var_8_4)
		setActive(var_8_3, var_8_4)
		setActive(var_8_2, arg_8_0.shareData.player.level >= var_8_0[1] and not var_8_4)
	end
end

function var_0_0.OnDestroy(arg_9_0)
	return
end

return var_0_0
