local var_0_0 = class("DecodeGamePage", import(".TemplatePage.SkinTemplatePage"))
local var_0_1

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.dayTF = arg_1_0.bg:Find("Text"):GetComponent(typeof(Text))
	arg_1_0.item = arg_1_0.bg:Find("items/item")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.uilist = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.start = arg_1_0._tf:Find("AD/start")
	arg_1_0.itemIcon = arg_1_0._tf:Find("AD/ring/icon")
	arg_1_0.itemLock = arg_1_0._tf:Find("AD/ring/lock")
	arg_1_0.itemGot = arg_1_0._tf:Find("AD/ring/got")
	arg_1_0.itemProgressG = arg_1_0._tf:Find("AD/ring/bar_g")
	arg_1_0.itemProgressB = arg_1_0._tf:Find("AD/ring/bar_b")
	arg_1_0.red = arg_1_0._tf:Find("AD/red")
	arg_1_0.number1 = arg_1_0._tf:Find("AD/1"):GetComponent(typeof(Image))
	arg_1_0.number2 = arg_1_0._tf:Find("AD/2"):GetComponent(typeof(Image))
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)

	var_0_1 = arg_2_0.activity:getConfig("config_client").decodeGameId

	onButton(arg_2_0, arg_2_0.start, function()
		pg.m02:sendNotification(GAME.REQUEST_MINI_GAME, {
			type = MiniGameRequestCommand.REQUEST_HUB_DATA,
			callback = function()
				pg.m02:sendNotification(GAME.GO_MINI_GAME, var_0_1)
			end
		})
	end, SFX_PANEL)

	local var_2_0 = Equipment.New({
		id = DecodeGameConst.AWARD[2]
	})

	GetImageSpriteFromAtlasAsync("equips/" .. var_2_0:getConfig("icon"), "", arg_2_0.itemIcon)
end

function var_0_0.GetProgressColor(arg_5_0)
	return "#E6F9FD", "#738285"
end

function var_0_0.OnUpdateFlush(arg_6_0)
	var_0_0.super.OnUpdateFlush(arg_6_0)

	arg_6_0.dayTF.text = arg_6_0.nday .. "/7"

	pg.m02:sendNotification(GAME.REQUEST_MINI_GAME, {
		type = MiniGameRequestCommand.REQUEST_HUB_DATA,
		callback = function()
			arg_6_0:UpdateGameProgress()
		end
	})
end

function var_0_0.UpdateGameProgress(arg_8_0)
	local var_8_0 = getProxy(MiniGameProxy)
	local var_8_1 = var_8_0:GetHubByGameId(var_0_1)
	local var_8_2 = var_8_0:GetMiniGameData(var_0_1)
	local var_8_3 = DecodeMiniGameView.GetData(var_8_1, var_8_2)
	local var_8_4 = DecodeGameModel.New()

	var_8_4:SetData(var_8_3)

	local var_8_5 = var_8_4:GetUnlockedCnt()

	if var_8_5 < DecodeGameConst.MAP_ROW * DecodeGameConst.MAP_COLUMN * DecodeGameConst.MAX_MAP_COUNT then
		setFillAmount(arg_8_0.itemProgressB, var_8_5 * DecodeGameConst.PROGRESS2FILLAMOUMT)
	else
		setFillAmount(arg_8_0.itemProgressB, 1)
	end

	local var_8_6 = {
		0.212,
		0.538,
		1
	}
	local var_8_7 = var_8_4:GetPassWordProgress()
	local var_8_8 = 0

	for iter_8_0, iter_8_1 in ipairs(var_8_7) do
		if iter_8_1 then
			var_8_8 = var_8_8 + 1
		end
	end

	setFillAmount(arg_8_0.itemProgressG, var_8_8 == 0 and 0 or var_8_6[var_8_8])

	local var_8_9 = var_8_4.isFinished

	setActive(arg_8_0.itemLock, not var_8_9)
	setActive(arg_8_0.itemGot, var_8_9)
	arg_8_0:UpdateCanUseCnt(var_8_4.canUseCnt)
	setActive(arg_8_0.red, not var_8_9 and arg_8_0:IsFinishAllTasks())
end

function var_0_0.IsFinishAllTasks(arg_9_0)
	local var_9_0 = arg_9_0.taskGroup[#arg_9_0.taskGroup]

	return _.all(var_9_0, function(arg_10_0)
		return getProxy(TaskProxy):getFinishTaskById(arg_10_0) ~= nil
	end)
end

function var_0_0.UpdateCanUseCnt(arg_11_0, arg_11_1)
	local var_11_0 = math.floor(arg_11_1 / 10)
	local var_11_1 = arg_11_1 % 10

	arg_11_0.number1.sprite = GetSpriteFromAtlas("ui/DecodeGameNumber_atlas", var_11_0)
	arg_11_0.number2.sprite = GetSpriteFromAtlas("ui/DecodeGameNumber_atlas", var_11_1)
	tf(arg_11_0.number1).localPosition = var_11_0 == 1 and Vector3(571, 221.6) or Vector3(551.7, 221.6)
	tf(arg_11_0.number2).localPosition = var_11_1 == 1 and Vector3(644, 221.6) or Vector3(625.5, 221.6)
end

return var_0_0
