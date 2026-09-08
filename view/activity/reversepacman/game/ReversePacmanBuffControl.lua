local var_0_0 = class("ReversePacmanBuffControl")
local var_0_1 = 155

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.binder = arg_1_1
	arg_1_0._tf = arg_1_2
	arg_1_0._tpls = arg_1_0._tf:Find("tpls")
	arg_1_0.container = arg_1_0._tf:Find("map")
	arg_1_0.selectPanel = arg_1_0._tf:Find("map/select")

	setActive(arg_1_0.selectPanel, false)

	arg_1_0.bubbleTF = arg_1_0._tf:Find("map/bubble")

	setActive(arg_1_0.bubbleTF, false)

	arg_1_0.uiList = UIItemList.New(arg_1_0._tf:Find("buffs/list"), arg_1_0._tf:Find("buffs/list/tpl"))
end

function var_0_0.SetUp(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_0.map = arg_2_3
	arg_2_0.gameController = arg_2_4
	arg_2_0.buffIds = {}
	arg_2_0.buffCntDic = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1) do
		if iter_2_1 ~= 0 then
			table.insert(arg_2_0.buffIds, iter_2_1)

			arg_2_0.buffCntDic[iter_2_1] = arg_2_2[iter_2_0]
		end
	end

	arg_2_0.uiList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			local var_3_0 = arg_2_0.buffIds[arg_3_1 + 1]

			arg_2_0:UpdataBuffTpl(var_3_0, arg_3_2)
		end
	end)
	arg_2_0.uiList:align(#arg_2_0.buffIds)
	arg_2_0:AddListener()
end

function var_0_0.AddListener(arg_4_0)
	onButton(arg_4_0.binder, arg_4_0.selectPanel:Find("cancel"), function()
		arg_4_0:HideSelectPanel()
	end)
	onButton(arg_4_0.binder, arg_4_0.selectPanel:Find("ok/sure"), function()
		if not arg_4_0.gameController:CanCastBuff(arg_4_0.selectedId, arg_4_0.selectCell) then
			return
		end

		arg_4_0:CastBuff(arg_4_0.selectedId, arg_4_0.selectCell)
		arg_4_0.binder:emit(ReversePacmanConst.EVENT.CAST, {
			buffId = arg_4_0.selectedId,
			cell = arg_4_0.selectCell
		})
	end)
	arg_4_0.binder:bind(ReversePacmanConst.EVENT.PICK, function(arg_7_0, arg_7_1)
		local var_7_0 = arg_4_0.map:GetCellByLocalPos({
			x = arg_7_1.ship.x,
			y = arg_7_1.ship.y
		})

		arg_4_0:ShowBubble(arg_7_1.buff.id, var_7_0)
	end)
	arg_4_0:AddDragMove()
end

function var_0_0.AddDragMove(arg_8_0)
	local var_8_0 = arg_8_0.selectPanel:Find("move")
	local var_8_1 = GetOrAddComponent(var_8_0, typeof(EventTriggerListener))
	local var_8_2 = GameObject.Find("UICamera"):GetComponent(typeof(Camera))

	local function var_8_3(arg_9_0)
		local var_9_0 = LuaHelper.ScreenToLocal(arg_8_0.container, arg_9_0, var_8_2)
		local var_9_1 = arg_8_0.map:GetCellByLocalPos({
			x = var_9_0.x,
			y = var_9_0.y + var_0_1
		})

		if not var_9_1 then
			return
		end

		arg_8_0:SetSelectCell(var_9_1)
	end

	var_8_1:AddBeginDragFunc(function(arg_10_0, arg_10_1)
		var_8_3(arg_10_1.position)
	end)
	var_8_1:AddDragFunc(function(arg_11_0, arg_11_1)
		var_8_3(arg_11_1.position)
	end)
end

function var_0_0.SetSelectCell(arg_12_0, arg_12_1)
	arg_12_0.selectCell = arg_12_1

	setLocalPosition(arg_12_0.selectPanel, arg_12_0.map:GetLocalPosInMap(arg_12_1.x, arg_12_1.y))

	local var_12_0 = arg_12_0.gameController:CanCastBuff(arg_12_0.selectedId, arg_12_1)

	setActive(arg_12_0.selectPanel:Find("ok"), var_12_0)
	setActive(arg_12_0.selectPanel:Find("no"), not var_12_0)
end

function var_0_0.UpdataBuffTpl(arg_13_0, arg_13_1, arg_13_2)
	arg_13_2.name = arg_13_1

	local var_13_0 = pg.activity_chasing_skill[arg_13_1]

	setText(arg_13_2:Find("name"), var_13_0.name)
	LoadImageSpriteAsync(var_13_0.icon, arg_13_2:Find("icon"))

	local var_13_1 = arg_13_0.buffCntDic[arg_13_1]

	setText(arg_13_2:Find("icon/corner/Text"), arg_13_0.buffCntDic[arg_13_1])
	setTextColor(arg_13_2:Find("icon/corner/Text"), var_13_1 > 0 and Color.NewHex("#FFFFFF") or Color.NewHex("#FF6D6D"))
	setTextColor(arg_13_2:Find("name"), var_13_1 > 0 and Color.NewHex("#FFFFFF") or Color.NewHex("#7C7E81"))
	onButton(arg_13_0.binder, arg_13_2, function()
		if var_13_1 <= 0 then
			return
		end

		if LeanTween.isTweening(go(arg_13_2:Find("icon/mask"))) then
			return
		end

		arg_13_0:ShowSelectPanel(arg_13_1)
	end)
end

function var_0_0.ShowSelectPanel(arg_15_0, arg_15_1)
	arg_15_0.selectedId = arg_15_1

	local var_15_0 = arg_15_0.selectPanel:Find("icon")

	LoadImageSpriteAtlasAsync("ui/reversepacmanui_atlas", "game_icon_buff_" .. arg_15_0.selectedId, var_15_0, true)
	setImageAlpha(var_15_0, 1)
	blinkAni(go(var_15_0), 0.2)
	arg_15_0:SetSelectCell(arg_15_0.map:GetCenterCell())
	setActive(arg_15_0.selectPanel, true)
end

function var_0_0.HideSelectPanel(arg_16_0)
	setActive(arg_16_0.selectPanel, false)

	local var_16_0 = arg_16_0.selectPanel:Find("icon")

	if LeanTween.isTweening(go(var_16_0)) then
		LeanTween.cancel(go(var_16_0))
	end
end

function var_0_0.CastBuff(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1 == ReversePacmanConst.BUFF.BLOCK then
		arg_17_0:ShowBubble(arg_17_1, arg_17_2)
	end

	arg_17_0:SetBuffCD(arg_17_1)
	arg_17_0:HideSelectPanel()
end

function var_0_0.GetBubbleTip(arg_18_0, arg_18_1)
	if arg_18_1 == ReversePacmanConst.BUFF.BLOCK then
		return i18n("reverse_pacman_cast_block")
	elseif arg_18_1 == ReversePacmanConst.BUFF.SPEED then
		return i18n("reverse_pacman_pick_speed")
	elseif arg_18_1 == ReversePacmanConst.BUFF.GIANT then
		return i18n("reverse_pacman_pick_giant")
	end

	return ""
end

function var_0_0.ShowBubble(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	if LeanTween.isTweening(go(arg_19_0.bubbleTF)) then
		LeanTween.cancel(go(arg_19_0.bubbleTF))
	end

	setActive(arg_19_0.bubbleTF, true)
	setText(arg_19_0.bubbleTF:Find("Text"), arg_19_0:GetBubbleTip(arg_19_1))

	local var_19_0 = arg_19_0.map:GetLocalPosInMap(arg_19_2.x, arg_19_2.y)

	setLocalPosition(arg_19_0.bubbleTF, var_19_0)
	setCanvasGroupAlpha(arg_19_0.bubbleTF, 1)

	local var_19_1 = 80
	local var_19_2 = arg_19_0.gameController:GetGameplayDuration(1)

	LeanTween.moveLocalY(go(arg_19_0.bubbleTF), var_19_0.y + var_19_1, var_19_2):setEase(LeanTweenType.easeOutCubic)

	local var_19_3 = GetOrAddComponent(arg_19_0.bubbleTF, typeof(CanvasGroup))

	LeanTween.alphaCanvas(var_19_3, 0, var_19_2 * 0.6):setDelay(var_19_2 * 0.4):setOnComplete(System.Action(function()
		setActive(arg_19_0.bubbleTF, false)
	end))
end

function var_0_0.SetBuffCD(arg_21_0, arg_21_1)
	arg_21_0.buffCntDic[arg_21_1] = arg_21_0.buffCntDic[arg_21_1] - 1

	local var_21_0 = arg_21_0.uiList.container:Find(tostring(arg_21_1))

	if arg_21_0.buffCntDic[arg_21_1] <= 0 then
		arg_21_0:UpdataBuffTpl(arg_21_1, var_21_0)

		return
	end

	local var_21_1 = arg_21_0.gameController:GetGameplayDuration(pg.activity_chasing_skill[arg_21_1].cd)
	local var_21_2 = var_21_0:Find("icon/mask")
	local var_21_3 = var_21_2:GetComponent(typeof(Image))

	setActive(var_21_2, true)
	setTextColor(var_21_0:Find("name"), Color.NewHex("#7C7E81"))
	LeanTween.value(go(var_21_2), 1, 0, var_21_1):setOnUpdate(System.Action_float(function(arg_22_0)
		var_21_3.fillAmount = arg_22_0
	end)):setOnComplete(System.Action(function()
		setActive(var_21_2, false)
		arg_21_0:UpdataBuffTpl(arg_21_1, var_21_0)
	end))
end

function var_0_0.Update(arg_24_0, arg_24_1)
	return
end

function var_0_0.Dispose(arg_25_0)
	arg_25_0.uiList:eachActive(function(arg_26_0, arg_26_1)
		if LeanTween.isTweening(go(arg_26_1:Find("icon/mask"))) then
			LeanTween.cancel(go(arg_26_1:Find("icon/mask")))
		end
	end)

	if LeanTween.isTweening(go(arg_25_0.bubbleTF)) then
		LeanTween.cancel(go(arg_25_0.bubbleTF))
	end
end

return var_0_0
