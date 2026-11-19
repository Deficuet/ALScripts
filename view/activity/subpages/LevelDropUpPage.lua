local var_0_0 = class("LevelDropUpPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	onButton(arg_1_0, arg_1_0._tf:Find("go"), function()
		local var_2_0 = getProxy(ChapterProxy)
		local var_2_1

		for iter_2_0, iter_2_1 in ipairs(var_2_0:getMapsByType(Map.SCENARIO)) do
			if iter_2_1:isUnlock() and (not var_2_1 or var_2_1 < iter_2_1.id) then
				var_2_1 = iter_2_1.id
			end
		end

		arg_1_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.LEVEL, {
			entranceStatus = false,
			mapIdx = var_2_1
		})
	end, SFX_PANEL)
end

function var_0_0.OnFirstFlush(arg_3_0)
	LevelDropUpActUtil.MarkTipLevelDropUpAct(arg_3_0.activity.id)
end

return var_0_0
