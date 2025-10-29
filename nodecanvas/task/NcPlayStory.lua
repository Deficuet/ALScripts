local var_0_0 = class("NcPlayStory", import("..base.NodeCanvasBaseTask"))

function var_0_0.OnExecute(arg_1_0)
	local var_1_0 = arg_1_0:GetStringArg("storyName")

	arg_1_0:DoAction(var_1_0, true, function()
		arg_1_0:EndAction()
	end)
end

function var_0_0.DoAction(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if not _IslandCore then
		return
	end

	_IslandCore:GetController():NotifiyIsland(ISLAND_EX_EVT.PLAY_STORY, {
		name = arg_3_1,
		refreshNpc = arg_3_2,
		callback = arg_3_3
	})
end

return var_0_0
