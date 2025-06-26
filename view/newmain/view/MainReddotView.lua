local var_0_0 = class("MainReddotView")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.listener = {}
	arg_1_0.redDotMgr = pg.RedDotMgr.GetInstance()
	arg_1_0.nodes = {}
end

function var_0_0.Init(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in ipairs(arg_2_1) do
		table.insert(arg_2_0.nodes, iter_2_1)
	end

	arg_2_0.redDotMgr:RegisterRedDotNodes(arg_2_0.nodes)
end

function var_0_0.AddNode(arg_3_0, arg_3_1)
	table.insert(arg_3_0.nodes, arg_3_1)
	arg_3_0.redDotMgr:RegisterRedDotNode(arg_3_1)
	arg_3_1:RefreshSelf()
end

function var_0_0.RemoveNode(arg_4_0, arg_4_1)
	table.removebyvalue(arg_4_0.nodes, arg_4_1)
	arg_4_0.redDotMgr:UnRegisterRedDotNode(arg_4_1)
end

function var_0_0.Refresh(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.nodes) do
		if iter_5_1.Resume then
			iter_5_1:Resume()
		end
	end

	arg_5_0:_Refresh()
end

function var_0_0._Refresh(arg_6_0)
	arg_6_0.redDotMgr:_NotifyAll()
end

function var_0_0.Disable(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.nodes) do
		if iter_7_1.Puase then
			iter_7_1:Puase()
		end
	end
end

function var_0_0.GetNotifyType(arg_8_0)
	if not arg_8_0.listener or #arg_8_0.listener == 0 then
		arg_8_0.listener = {
			[pg.RedDotMgr.TYPES.ATTIRE] = {
				GAME.EDUCATE_GET_ENDINGS_DONE
			},
			[pg.RedDotMgr.TYPES.TASK] = {
				TaskProxy.TASK_UPDATED,
				AvatarFrameProxy.FRAME_TASK_UPDATED
			},
			[pg.RedDotMgr.TYPES.COURTYARD] = {
				DormProxy.INIMACY_AND_MONEY_ADD
			},
			[pg.RedDotMgr.TYPES.MAIL] = {
				MailProxy.UPDATE_ATTACHMENT_COUNT
			},
			[pg.RedDotMgr.TYPES.BUILD] = {
				BuildShipProxy.TIMEUP
			},
			[pg.RedDotMgr.TYPES.GUILD] = {
				GAME.GUILD_GET_REQUEST_LIST_DONE,
				GuildProxy.REQUEST_DELETED,
				GuildProxy.REQUEST_COUNT_UPDATED,
				GAME.BOSS_EVENT_START_DONE,
				GAME.GET_GUILD_INFO_DONE
			},
			[pg.RedDotMgr.TYPES.SCHOOL] = {
				CollectionProxy.TROPHY_UPDATE
			},
			[pg.RedDotMgr.TYPES.FRIEND] = {
				NotificationProxy.FRIEND_REQUEST_ADDED,
				NotificationProxy.FRIEND_REQUEST_REMOVED,
				FriendProxy.FRIEND_NEW_MSG,
				FriendProxy.FRIEND_UPDATED
			},
			[pg.RedDotMgr.TYPES.COMMISSION] = {
				PlayerProxy.UPDATED,
				GAME.EVENT_LIST_UPDATE,
				GAME.EVENT_FINISH_UPDATE,
				GAME.CANCEL_LEARN_TACTICS_DONE
			},
			[pg.RedDotMgr.TYPES.SERVER] = {
				ServerNoticeProxy.SERVER_NOTICES_UPDATE
			},
			[pg.RedDotMgr.TYPES.BLUEPRINT] = {
				TechnologyConst.UPDATE_REDPOINT_ON_TOP,
				GAME.REMOVE_LAYERS
			},
			[pg.RedDotMgr.TYPES.EVENT] = {
				GAME.EVENT_LIST_UPDATE,
				GAME.EVENT_FINISH_UPDATE
			},
			[pg.RedDotMgr.TYPES.ACT_NEWBIE] = {
				GAME.REMOVE_LAYERS
			},
			[pg.RedDotMgr.TYPES.ACT_RETURN] = {
				GAME.REMOVE_LAYERS
			}
		}
	end

	return arg_8_0.listener
end

function var_0_0.Notify(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in pairs(arg_9_0:GetNotifyType()) do
		for iter_9_2, iter_9_3 in ipairs(iter_9_1) do
			if iter_9_3 == arg_9_1 then
				arg_9_0.redDotMgr:NotifyAll(iter_9_0)
			end
		end
	end
end

function var_0_0.Clear(arg_10_0)
	arg_10_0.redDotMgr:UnRegisterRedDotNodes(arg_10_0.nodes)

	arg_10_0.nodes = {}
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0:Clear()

	arg_11_0.listener = nil
end

return var_0_0
