local var_0_0 = class("ReversePacmanInterviewList", import("view.base.BasePanel"))

var_0_0.ON_CLICK_TOGGLE = "ReversePacmanInterviewList::ON_CLICK_TOGGLE"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0.btnList = {
		ReversePacmanInterviewRoleTypeToggle.New(arg_2_0.uiAllTf, arg_2_0, ReversePacmanHomeConst.ROLE_TYPE.ALL),
		ReversePacmanInterviewRoleTypeToggle.New(arg_2_0.uiChaserTf, arg_2_0, ReversePacmanHomeConst.ROLE_TYPE.CHASER),
		ReversePacmanInterviewRoleTypeToggle.New(arg_2_0.uiAmbusherTf, arg_2_0, ReversePacmanHomeConst.ROLE_TYPE.AMBUSHER),
		ReversePacmanInterviewRoleTypeToggle.New(arg_2_0.uiPlannerTf, arg_2_0, ReversePacmanHomeConst.ROLE_TYPE.PLANNER)
	}

	setText(arg_2_0.uiRoleTitleText, i18n("reverse_pacman_select_role"))
	setText(arg_2_0.uiHiredTitleText, i18n("reverse_pacman_hired_role"))

	arg_2_0.unHireItemList = {}
	arg_2_0.alreadyHireItemList = {}
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0.eventIDList = {
		arg_3_0:bind(var_0_0.ON_CLICK_TOGGLE, handler(arg_3_0, arg_3_0.OnClickToggle)),
		arg_3_0:bind(ReversePacmanInterviewScene.ON_SELECTED_ROLE, handler(arg_3_0, arg_3_0.OnSelectedRole))
	}

	arg_3_0.btnList[1]:OnTriggerToggle()
end

function var_0_0.OnClickToggle(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_2 = arg_4_2 or arg_4_0.selectedRoleType
	arg_4_0.selectedRoleType = arg_4_2

	local var_4_0 = ReversePacmanTools.GetActivity()
	local var_4_1 = {}

	if arg_4_2 == ReversePacmanHomeConst.ROLE_TYPE.ALL then
		var_4_1 = var_4_0:getConfig("config_client").chasing_char
	else
		var_4_1 = ReversePacmanTools.GetRoleListByType(arg_4_2)
	end

	local var_4_2 = {}
	local var_4_3 = {}

	for iter_4_0, iter_4_1 in ipairs(var_4_1) do
		if ReversePacmanTools.IsHireRole(iter_4_1) then
			table.insert(var_4_3, iter_4_1)
		else
			table.insert(var_4_2, iter_4_1)
		end
	end

	table.sort(var_4_2, function(arg_5_0, arg_5_1)
		local var_5_0 = ReversePacmanTools.IsUnlockRole(arg_5_0)

		if var_5_0 == ReversePacmanTools.IsUnlockRole(arg_5_1) then
			return arg_5_0 < arg_5_1
		else
			return var_5_0
		end
	end)

	arg_4_0.unHireList = var_4_2
	arg_4_0.alreadyHireList = var_4_3

	arg_4_0:RefreshUnHireRoleList()
	arg_4_0:RefreshAlreadyHireList()

	local var_4_4 = arg_4_3 or arg_4_0.unHireList[1] or arg_4_0.alreadyHireList[1]

	arg_4_0:emit(ReversePacmanInterviewScene.ON_SELECTED_ROLE, var_4_4)
end

function var_0_0.RefreshUnHireRoleList(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.unHireList) do
		arg_6_0.unHireItemList[iter_6_0] = arg_6_0.unHireItemList[iter_6_0] or ReversePacmanInterviewRoleItem.New(Object.Instantiate(arg_6_0.uiRoleItem, arg_6_0.uiUnHireListParent), arg_6_0)

		arg_6_0.unHireItemList[iter_6_0]:SetRoleID(iter_6_1)
	end

	for iter_6_2 = #arg_6_0.unHireList + 1, #arg_6_0.unHireItemList do
		arg_6_0.unHireItemList[iter_6_2]:Show(false)
	end
end

function var_0_0.RefreshAlreadyHireList(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.alreadyHireList) do
		arg_7_0.alreadyHireItemList[iter_7_0] = arg_7_0.alreadyHireItemList[iter_7_0] or ReversePacmanInterviewRoleItem.New(Object.Instantiate(arg_7_0.uiRoleItem, arg_7_0.uiAlreadyHireListParent), arg_7_0)

		arg_7_0.alreadyHireItemList[iter_7_0]:SetRoleID(iter_7_1)
	end

	for iter_7_2 = #arg_7_0.alreadyHireList + 1, #arg_7_0.alreadyHireItemList do
		arg_7_0.alreadyHireItemList[iter_7_2]:Show(false)
	end
end

function var_0_0.OnSelectedRole(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.selectedID = arg_8_2

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.unHireItemList) do
		iter_8_1:OnSlectedRole(arg_8_2)
	end

	for iter_8_2, iter_8_3 in ipairs(arg_8_0.alreadyHireItemList) do
		iter_8_3:OnSlectedRole(arg_8_2)
	end
end

function var_0_0.willExit(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.eventIDList) do
		arg_9_0:disconnect(iter_9_1)
	end

	arg_9_0.eventIDList = nil

	for iter_9_2, iter_9_3 in ipairs(arg_9_0.unHireItemList) do
		iter_9_3:willExit()
	end

	arg_9_0.unHireItemList = nil

	for iter_9_4, iter_9_5 in ipairs(arg_9_0.alreadyHireItemList) do
		iter_9_5:willExit()
	end

	arg_9_0.alreadyHireItemList = nil

	arg_9_0:detach()
end

return var_0_0
