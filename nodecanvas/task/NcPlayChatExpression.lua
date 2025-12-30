local var_0_0 = class("NcPlayChatExpression", import("..base.NodeCanvasBaseTask"))

function var_0_0.OnExecute(arg_1_0)
	local var_1_0 = arg_1_0:GetStringArg("emojiId")
	local var_1_1 = arg_1_0:GetStringArg("id")
	local var_1_2 = arg_1_0:GetStringArg("type")

	arg_1_0:DoAction(var_1_0, tonumber(var_1_1), tonumber(var_1_2), function()
		return
	end)
	arg_1_0:EndAction()
end

function var_0_0.DoAction(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	if not _IslandCore then
		return
	end

	local var_3_0 = arg_3_0:WarpStory(arg_3_1, arg_3_2, arg_3_3)

	_IslandCore:GetController():NotifiyCore(ISLAND_EVT.RAW_PLAY_BUBBLE, {
		info = var_3_0,
		callback = arg_3_4
	})
end

function var_0_0.WarpStory(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	return {
		id = "NPC_WARP_STORY",
		mode = 9,
		map = {
			{
				9999,
				arg_4_2,
				arg_4_3
			}
		},
		scripts = {
			{
				emojiType = 2,
				characterId = 9999,
				emoji = arg_4_1
			}
		}
	}
end

return var_0_0
