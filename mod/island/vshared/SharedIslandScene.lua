local var_0_0 = class("SharedIslandScene", import("..View.base.IslandBaseScene"))

function var_0_0.getUIName(arg_1_0)
	return "SharedIslandUI"
end

function var_0_0.GetIsland(arg_2_0)
	return getProxy(IslandProxy):GetSharedIsland()
end

function var_0_0.init(arg_3_0)
	arg_3_0.homeBtn = arg_3_0:findTF("top/home")
	arg_3_0.levelTxt = arg_3_0:findTF("top/level_panel/level"):GetComponent(typeof(Text))
	arg_3_0.expTr = arg_3_0:findTF("top/level_panel/exp")
	arg_3_0.nameTxt = arg_3_0:findTF("top/level_panel/name"):GetComponent(typeof(Text))
	arg_3_0.prosperityTxt = arg_3_0:findTF("top/level_panel/prosperity/Text"):GetComponent(typeof(Text))
	arg_3_0.prosperityLabel = arg_3_0:findTF("top/level_panel/prosperity"):GetComponent(typeof(Text))
	arg_3_0.mapBtn = arg_3_0:findTF("top/map_btn")
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0.homeBtn, function()
		if ISLAND_PLAYER_TESTING then
			arg_4_0:emit(SharedIslandMediator.RETURN_SELF_ISLAND)

			return
		end

		arg_4_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.mapBtn, function()
		arg_4_0:OpenPage(SharedIslandMapPage)
	end, SFX_PANEL)
	arg_4_0:StartCore()
	arg_4_0:UpdateIslandInfo()
end

function var_0_0.UpdateIslandInfo(arg_7_0)
	local var_7_0 = arg_7_0:GetIsland()

	arg_7_0.levelTxt.text = var_7_0:GetLevel()
	arg_7_0.nameTxt.text = var_7_0:GetName()

	if var_7_0:IsMaxLevel() then
		setFillAmount(arg_7_0.expTr, 1)
	else
		setFillAmount(arg_7_0.expTr, var_7_0:GetExp() / var_7_0:GetTargeExp())
	end

	if var_7_0:CanAddProsperity() then
		arg_7_0.prosperityTxt.text = var_7_0:GetProsperity() .. "/" .. var_7_0:GetTargetProsperity()
	else
		arg_7_0.prosperityTxt.text = "MAX"
	end

	arg_7_0.prosperityLabel.text = i18n("island_prosperity_level")
end

function var_0_0.willExit(arg_8_0)
	return
end

function var_0_0.onBackPressed(arg_9_0)
	arg_9_0:emit(var_0_0.ON_BACK_PRESSED)
end

return var_0_0
