local var_0_0 = class("VoteDiaplayPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "VoteDisplay"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.paitingTF = findTF(arg_2_0._tf, "painting")
	arg_2_0.numberTxt = findTF(arg_2_0._tf, "filter_bg/Text"):GetComponent(typeof(Text))
	arg_2_0.nameTxt = findTF(arg_2_0._tf, "frame/bg/name"):GetComponent(typeof(Text))
	arg_2_0.enNameTxt = findTF(arg_2_0._tf, "frame/bg/en_name"):GetComponent(typeof(Text))
	arg_2_0.descTxt = findTF(arg_2_0._tf, "frame/bg/scroll/desc"):GetComponent(typeof(Text))
	arg_2_0.valueInput = findTF(arg_2_0._tf, "frame/bg/InputField"):GetComponent(typeof(InputField))
	arg_2_0.addBtn = findTF(arg_2_0._tf, "frame/bg/add")
	arg_2_0.miunsBtn = findTF(arg_2_0._tf, "frame/bg/miuns")
	arg_2_0.maxBtn = findTF(arg_2_0._tf, "frame/bg/max")
	arg_2_0.submitBtn = findTF(arg_2_0._tf, "frame/bg/submit")
	arg_2_0.rankTxt = findTF(arg_2_0._tf, "frame/bg/rank"):GetComponent(typeof(Text))
	arg_2_0.votesTxt = findTF(arg_2_0._tf, "frame/bg/votes"):GetComponent(typeof(Text))
	arg_2_0.shiptypeTxt = findTF(arg_2_0._tf, "frame/bg/shiptype"):GetComponent(typeof(Text))
	arg_2_0.nationImg = findTF(arg_2_0._tf, "frame/bg/nation"):GetComponent(typeof(Image))
	arg_2_0.bg1 = findTF(arg_2_0._tf, "frame/bg/bg1")
	arg_2_0.bg2 = findTF(arg_2_0._tf, "frame/bg/bg2")
end

function var_0_0.Open(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
	arg_3_0.callback = arg_3_5

	assert(arg_3_0.callback)

	arg_3_0.maxValue = arg_3_3
	arg_3_0.rank = arg_3_2
	arg_3_0.value = 1

	setActive(arg_3_0.bg1, not arg_3_4)
	setActive(arg_3_0.bg2, arg_3_4)

	arg_3_0.votes = arg_3_4 or "-"

	setActive(arg_3_0._tf, true)

	arg_3_0.numberTxt.text = "X" .. arg_3_3

	if arg_3_1 ~= arg_3_0.voteShip then
		arg_3_0.voteShip = arg_3_1

		arg_3_0:Update(arg_3_1)
	end

	onInputEndEdit(arg_3_0, go(arg_3_0.valueInput), function()
		local var_4_0 = getInputText(go(arg_3_0.valueInput))
		local var_4_1 = tonumber(var_4_0)

		if var_4_1 < 1 then
			arg_3_0.value = 1
		elseif var_4_1 > arg_3_0.maxValue then
			arg_3_0.value = math.max(1, arg_3_0.maxValue)
		else
			arg_3_0.value = var_4_1
		end

		arg_3_0:UpdateCnt()
	end)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.UpdateCnt(arg_5_0)
	arg_5_0.valueInput.text = arg_5_0.value
end

function var_0_0.Update(arg_6_0, arg_6_1)
	arg_6_0.nameTxt.text = arg_6_1:getShipName()
	arg_6_0.enNameTxt.text = arg_6_1:getEnName()
	arg_6_0.descTxt.text = arg_6_1:GetDesc()
	arg_6_0.votesTxt.text = arg_6_0.votes
	arg_6_0.rankTxt.text = arg_6_0.rank
	arg_6_0.shiptypeTxt.text = arg_6_1:getShipTypeName()

	local var_6_0 = arg_6_1:getNationality()
	local var_6_1

	if var_6_0 then
		var_6_1 = LoadSprite("prints/" .. nation2print(var_6_0) .. "_0")
	else
		var_6_1 = GetSpriteFromAtlas("ui/VoteUI_atlas", "nation")
	end

	arg_6_0.nationImg.sprite = var_6_1

	arg_6_0:UpdateCnt()
	onButton(arg_6_0, arg_6_0._tf, function()
		arg_6_0:Close()
	end)
	onButton(arg_6_0, arg_6_0.addBtn, function()
		if arg_6_0.value >= arg_6_0.maxValue then
			return
		end

		arg_6_0.value = arg_6_0.value + 1

		arg_6_0:UpdateCnt()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.miunsBtn, function()
		if arg_6_0.value == 1 then
			return
		end

		arg_6_0.value = arg_6_0.value - 1

		arg_6_0:UpdateCnt()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.maxBtn, function()
		if arg_6_0.maxValue == 0 then
			return
		end

		arg_6_0.value = arg_6_0.maxValue

		arg_6_0:UpdateCnt()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.submitBtn, function()
		arg_6_0.callback(arg_6_0.value)
		arg_6_0:Close()
	end, SFX_PANEL)

	arg_6_0.paintingName = arg_6_1:getPainting()

	LoadPaintingPrefabAsync(arg_6_0.paitingTF, arg_6_0.paintingName, arg_6_0.paintingName, "jiesuan")
end

function var_0_0.Close(arg_12_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_12_0._tf, arg_12_0._parent)
	setActive(arg_12_0._tf, false)
	retPaintingPrefab(arg_12_0.paitingTF, arg_12_0.paintingName)

	arg_12_0.callback = nil
	arg_12_0.maxValue = 0
	arg_12_0.rank = 0
	arg_12_0.value = 1
	arg_12_0.voteShip = nil
end

function var_0_0.OnDestroy(arg_13_0)
	arg_13_0:Close()
end

return var_0_0
