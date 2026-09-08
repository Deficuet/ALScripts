local var_0_0 = class("MainBattleBtn", import(".MainBaseBtn"))

function var_0_0.OnClick(arg_1_0)
	local var_1_0 = getProxy(ChapterProxy):getActiveChapter()

	arg_1_0:emit(NewMainMediator.GO_SCENE, SCENE.LEVEL, {
		chapterId = var_1_0 and var_1_0.id,
		mapIdx = var_1_0 and var_1_0:getConfig("map")
	})
end

function var_0_0.IsFixed(arg_2_0)
	return true
end

function var_0_0.ShowOrHideBtnEffect(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0._tf:Find("FX")

	if IsNil(var_3_0) then
		return
	end

	setActive(var_3_0, arg_3_1)
end

return var_0_0
