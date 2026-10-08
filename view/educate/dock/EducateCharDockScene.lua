local var_0_0 = class("EducateCharDockScene", import("view.base.BaseUI"))

var_0_0.ON_CLOSE_VIEW = "EducateCharDockScene.ON_CLOSE_VIEW"
var_0_0.ON_SELECT = "EducateCharDockScene.ON_SELECT"
var_0_0.ON_CONFIRM = "EducateCharDockScene.ON_CONFIRM"
var_0_0.ON_SELECTED = "EducateCharDockScene.ON_SELECTED"
var_0_0.MSG_CLEAR_TIP = "EducateCharDockScene.MSG_CLEAR_TIP"

function var_0_0.getUIName(arg_1_0)
	return "EducateCharDockUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/educatechardockui",
		"ui/educatedockui_atlas",
		"ui/educatecharprofileui_atlas",
		"cue/story-richang-8.b"
	}

	local function var_2_1()
		local var_3_0 = {}

		for iter_3_0, iter_3_1 in ipairs(pg.secretary_special_ship.all) do
			local var_3_1 = pg.secretary_special_ship[iter_3_1].painting

			if var_3_1 then
				table.insert(var_3_0, "painting/" .. var_3_1)
				table.insert(var_3_0, "paintingface/" .. var_3_1)
			end
		end

		return var_3_0
	end

	return ResPathSupport.MergeLuaArr(var_2_0, var_2_1())
end

function var_0_0.init(arg_4_0)
	arg_4_0.backBtn = arg_4_0._tf:Find("adapt/top/back")
	arg_4_0.homeBtn = arg_4_0._tf:Find("adapt/top/home")
	arg_4_0.selectPage = EducateCharSelectPage.New(arg_4_0._tf:Find("adapt/pages"), arg_4_0.event)
	arg_4_0.groupPage = EducateCharGroupPage.New(arg_4_0._tf:Find("adapt/pages/groupPage"), arg_4_0.event, arg_4_0.contextData)
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0.backBtn, function()
		if arg_5_0.contextData.tbSkinId then
			arg_5_0:closeView()

			return
		end

		if arg_5_0.selectPage and arg_5_0.selectPage:GetLoaded() and arg_5_0.selectPage:isShowing() then
			arg_5_0.selectPage:Back(function()
				arg_5_0.groupPage:Show()
				arg_5_0.groupPage:InitList()
				arg_5_0.selectPage:Hide()
			end)

			return
		end

		arg_5_0:closeView()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.homeBtn, function()
		arg_5_0:emit(var_0_0.ON_HOME)
	end, SFX_PANEL)
	arg_5_0:bind(var_0_0.ON_CLOSE_VIEW, function()
		arg_5_0:closeView()
	end)
	arg_5_0:bind(var_0_0.ON_SELECT, function(arg_10_0, arg_10_1, arg_10_2)
		arg_5_0.groupPage:Hide()
		arg_5_0.selectPage:ExecuteAction("Update", arg_10_1, arg_10_2)
	end)
	arg_5_0:bind(var_0_0.ON_SELECTED, function(arg_11_0, arg_11_1)
		arg_5_0:emit(EducateCharDockMediator.ON_SELECTED, arg_11_1)
	end)
	arg_5_0:bind(var_0_0.ON_CONFIRM, function(arg_12_0, arg_12_1)
		if arg_5_0.contextData.tbSkinId then
			arg_5_0:closeView()

			return
		end

		arg_5_0.groupPage:Show()
		arg_5_0.selectPage:Hide()
		arg_5_0.groupPage:FlushList(arg_12_1)
	end)
	arg_5_0.groupPage:Update()
end

function var_0_0.onBackPressed(arg_13_0)
	if arg_13_0.selectPage and arg_13_0.selectPage:GetLoaded() and arg_13_0.selectPage:isShowing() then
		triggerButton(arg_13_0.backBtn)

		return
	end

	var_0_0.super.onBackPressed(arg_13_0)
end

function var_0_0.willExit(arg_14_0)
	if arg_14_0.selectPage then
		arg_14_0.selectPage:Destroy()

		arg_14_0.selectPage = nil
	end

	if arg_14_0.groupPage then
		arg_14_0.groupPage:Destroy()

		arg_14_0.groupPage = nil
	end
end

return var_0_0
