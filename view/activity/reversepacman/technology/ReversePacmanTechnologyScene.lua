local var_0_0 = class("ReversePacmanTechnologyScene", import("view.base.BaseUI"))

var_0_0.TOGGLE_TYPE = {
	ROLE_SKILL = 2,
	PLAYER_SKILL = 3,
	HR = 1
}

function var_0_0.getUIName(arg_1_0)
	return "ReversePacmanTechnologyUI"
end

function var_0_0.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiBgBtn, function()
		arg_2_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.uiBackBtn, function()
		arg_2_0:closeView()
	end, SFX_CANCEL)
	onToggle(arg_2_0, arg_2_0.uiHrBtn, function(arg_5_0)
		if arg_5_0 then
			arg_2_0:ShowHrPanel()
		elseif arg_2_0.hrView then
			local var_5_0 = ReversePacmanTools.GetActivity()

			if var_5_0:GetGiftTip() then
				var_5_0:SetGiftTip()
				arg_2_0:RefreshTips()
			end
		end

		arg_2_0.hrToggleItem:OnSelected(arg_5_0)
		setActive(arg_2_0.uiHrPanel, arg_5_0)
	end, SFX_PANEL)
	onToggle(arg_2_0, arg_2_0.uiRoleSkillBtn, function(arg_6_0)
		if arg_6_0 then
			arg_2_0:ShowRoleSkillPanel()
		elseif arg_2_0.rollSkillView then
			local var_6_0 = ReversePacmanTools.GetActivity()

			if var_6_0:GetRoleSkillTip() then
				var_6_0:SetRoleSkillTip()
				arg_2_0:RefreshTips()
			end
		end

		arg_2_0.roleSkillToggleItem:OnSelected(arg_6_0)
		setActive(arg_2_0.uiRoleSkillPanel, arg_6_0)
	end, SFX_PANEL)
	onToggle(arg_2_0, arg_2_0.uiPlayerSkillBtn, function(arg_7_0)
		if arg_7_0 then
			arg_2_0:ShowPlayerSkillPanel()
		elseif arg_2_0.playerSkillView then
			local var_7_0 = ReversePacmanTools.GetActivity()

			if var_7_0:GetPlayerSkillTip() then
				var_7_0:SetPlayerSkillTip()
				arg_2_0:RefreshTips()
			end
		end

		arg_2_0.playerSkillToggleItem:OnSelected(arg_7_0)
		setActive(arg_2_0.uiPlayerSkillPanel, arg_7_0)
	end, SFX_PANEL)
	setText(arg_2_0.uiTitleText, i18n("reverse_pacman_select_logistics_sys"))
	setActive(arg_2_0.uiHrPanel, false)
	setActive(arg_2_0.uiRoleSkillPanel, false)
	setActive(arg_2_0.uiPlayerSkillPanel, false)

	arg_2_0.hrToggleItem = ReversePacmanTechnologyHrToggle.New(arg_2_0.uiHrBtn, arg_2_0)
	arg_2_0.roleSkillToggleItem = ReversePacmanTechnologyRoleSkillToggle.New(arg_2_0.uiRoleSkillBtn, arg_2_0)
	arg_2_0.playerSkillToggleItem = ReversePacmanTechnologyPlayerSkillToggle.New(arg_2_0.uiPlayerSkillBtn, arg_2_0)
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0:BlurPanel(arg_8_0._tf)

	local var_8_0 = ReversePacmanTools.GetActivity()
	local var_8_1 = arg_8_0.contextData.toggleType

	if var_8_0:GetGiftTip() then
		var_8_1 = var_0_0.TOGGLE_TYPE.HR
	elseif var_8_0:GetRoleSkillTip() then
		var_8_1 = var_0_0.TOGGLE_TYPE.ROLE_SKILL
	elseif var_8_0:GetPlayerSkillTip() then
		var_8_1 = var_0_0.TOGGLE_TYPE.PLAYER_SKILL
	end

	if var_8_1 == var_0_0.TOGGLE_TYPE.ROLE_SKILL then
		triggerToggle(arg_8_0.uiRoleSkillBtn, true)
	elseif var_8_1 == var_0_0.TOGGLE_TYPE.PLAYER_SKILL then
		triggerToggle(arg_8_0.uiPlayerSkillBtn, true)
	else
		triggerToggle(arg_8_0.uiHrBtn, true)
	end

	arg_8_0:RefreshTips()
end

function var_0_0.ShowHrPanel(arg_9_0)
	arg_9_0.hrView = arg_9_0.hrView or ReversePacmanTechnologyHrView.New(arg_9_0.uiHrPanel, arg_9_0)

	arg_9_0.hrView:Show()
end

function var_0_0.ShowRoleSkillPanel(arg_10_0)
	arg_10_0.rollSkillView = arg_10_0.rollSkillView or ReversePacmanTechnologyRoleSkillView.New(arg_10_0.uiRoleSkillPanel, arg_10_0)
end

function var_0_0.ShowPlayerSkillPanel(arg_11_0)
	arg_11_0.playerSkillView = arg_11_0.playerSkillView or ReversePacmanTechnologyPlayerSkillView.New(arg_11_0.uiPlayerSkillPanel, arg_11_0)
end

function var_0_0.RefreshTips(arg_12_0)
	arg_12_0.hrToggleItem:RefreshTip()
	arg_12_0.roleSkillToggleItem:RefreshTip()
	arg_12_0.playerSkillToggleItem:RefreshTip()
end

function var_0_0.willExit(arg_13_0)
	arg_13_0:UnOverlayPanel(arg_13_0._tf)
	arg_13_0.hrToggleItem:willExit()

	arg_13_0.hrToggleItem = nil

	arg_13_0.roleSkillToggleItem:willExit()

	arg_13_0.roleSkillToggleItem = nil

	arg_13_0.playerSkillToggleItem:willExit()

	arg_13_0.playerSkillToggleItem = nil

	if arg_13_0.hrView then
		local var_13_0 = ReversePacmanTools.GetActivity()

		if var_13_0:GetGiftTip() then
			var_13_0:SetGiftTip()
		end

		arg_13_0.hrView:willExit()

		arg_13_0.hrView = nil
	end

	if arg_13_0.rollSkillView then
		local var_13_1 = ReversePacmanTools.GetActivity()

		if var_13_1:GetRoleSkillTip() then
			var_13_1:SetRoleSkillTip()
		end

		arg_13_0.rollSkillView:willExit()

		arg_13_0.rollSkillView = nil
	end

	if arg_13_0.playerSkillView then
		local var_13_2 = ReversePacmanTools.GetActivity()

		if var_13_2:GetPlayerSkillTip() then
			var_13_2:SetPlayerSkillTip()
		end

		arg_13_0.playerSkillView:willExit()

		arg_13_0.playerSkillView = nil
	end
end

return var_0_0
