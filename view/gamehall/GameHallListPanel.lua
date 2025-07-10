local var_0_0 = class("GameHallListPanel")
local var_0_1 = false

var_0_0.ScrollPosition = nil

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._tf = arg_1_1
	arg_1_0._event = arg_1_2
	arg_1_0.content = findTF(arg_1_0._tf, "ad/viewport/content")
	arg_1_0.listTpl = findTF(arg_1_0.content, "listTpl")

	setActive(arg_1_0.listTpl, false)

	arg_1_0.gameRoomDatas = {}

	for iter_1_0, iter_1_1 in ipairs(pg.game_room_template.all) do
		local var_1_0 = pg.game_room_template[iter_1_1].unlock_time

		if pg.TimeMgr:GetInstance():Table2ServerTime({
			year = var_1_0[1][1],
			month = var_1_0[1][2],
			day = var_1_0[1][3],
			hour = var_1_0[2][1],
			min = var_1_0[2][2],
			sec = var_1_0[2][3]
		}) < pg.TimeMgr:GetInstance():GetServerTime() then
			table.insert(arg_1_0.gameRoomDatas, Clone(pg.game_room_template[iter_1_1]))
		end
	end

	table.sort(arg_1_0.gameRoomDatas, function(arg_2_0, arg_2_1)
		return arg_2_0.order < arg_2_1.order
	end)

	for iter_1_2 = 1, #arg_1_0.gameRoomDatas do
		local var_1_1 = tf(instantiate(go(arg_1_0.listTpl)))
		local var_1_2 = arg_1_0.gameRoomDatas[iter_1_2]

		setParent(var_1_1, arg_1_0.content)
		setActive(var_1_1, true)

		local var_1_3 = var_1_2.icon
		local var_1_4 = var_1_2.id
		local var_1_5 = getProxy(GameRoomProxy):getRoomScore(var_1_4)

		setActive(findTF(var_1_1, "empty"), var_1_5 == 0)
		setActive(findTF(var_1_1, "total"), var_1_5 > 0)
		setActive(findTF(var_1_1, "txtScore"), var_1_5 > 0)

		local var_1_6

		if var_1_5 < 10 then
			var_1_6 = "00" .. var_1_5
		elseif var_1_5 < 100 then
			var_1_6 = "0" .. var_1_5
		else
			var_1_6 = "" .. var_1_5
		end

		setText(findTF(var_1_1, "txtScore"), var_1_6)
		setImageSprite(findTF(var_1_1, "mask/gameIcon"), LoadSprite("gamehallicon/" .. var_1_3), true)
		onButton(arg_1_0._event, var_1_1, function()
			var_0_0.ScrollPosition = arg_1_0.content.anchoredPosition

			arg_1_0._event:emit(GameHallMediator.OPEN_MINI_GAME, var_1_2)
		end, SFX_CANCEL)
	end
end

function var_0_0.setVisible(arg_4_0, arg_4_1)
	setActive(arg_4_0._tf, arg_4_1)

	if arg_4_1 then
		local var_4_0 = getProxy(GameRoomProxy):ticketMaxTip()

		if var_4_0 and not GameRoomProxy.ticket_remind then
			GameRoomProxy.ticket_remind = true

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = var_4_0,
				onYes = function()
					return
				end,
				onNo = function()
					arg_4_0:setVisible(false)
				end
			})
		end

		if var_0_0.ScrollPosition then
			arg_4_0.content.anchoredPosition = var_0_0.ScrollPosition
		end
	end
end

function var_0_0.getVisible(arg_7_0)
	return isActive(arg_7_0._tf)
end

function var_0_0.dispose(arg_8_0)
	return
end

return var_0_0
