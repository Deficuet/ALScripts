local var_0_0 = class("MainPaintingLiteBtn", import(".MainBaseBtn"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
	setActive(arg_1_0._tf, false)
	pg.DelegateInfo.New(arg_1_0)
	arg_1_0:bind(NewMainScene.ENTER_SILENT_VIEW, function()
		arg_1_0:changeLitOn(false)
	end)
	onButton(arg_1_0, findTF(arg_1_0._tf, "btn"), function()
		arg_1_0:OnClickBtn()
	end)

	function SpinePaintingConst.painting_lit_action_callback()
		if arg_1_0._litUI then
			arg_1_0._litUI:SetVisible(arg_1_0._liteOn and not SpinePaintingConst.spine_painting_action)
		end
	end

	arg_1_0:changeLitOn(false)
end

function var_0_0.OnClick(arg_5_0)
	return
end

function var_0_0.OnClickBtn(arg_6_0)
	arg_6_0:changeLitOn(not arg_6_0._liteOn)
end

function var_0_0.changeLitOn(arg_7_0, arg_7_1)
	arg_7_0._liteOn = arg_7_1
	SpinePaintingConst.painting_lit_opening = arg_7_0._liteOn

	if arg_7_0._litUI then
		arg_7_0._litUI:SetVisible(arg_7_0._liteOn and not SpinePaintingConst.spine_painting_action)
	end

	arg_7_0:updateUI()
end

function var_0_0.Flush(arg_8_0, arg_8_1)
	arg_8_0:FlushUI()
end

function var_0_0.FlushUI(arg_9_0)
	local var_9_0 = getProxy(PlayerProxy):getRawData():GetFlagShip()

	arg_9_0._paintingName = var_9_0:getPainting()
	arg_9_0._shipId = var_9_0.id

	local var_9_1 = getProxy(SettingsProxy):getCharacterSetting(var_9_0.id, SHIP_FLAG_SP)

	SpinePaintingConst.painting_lit_value = SpinePaintingDrag.GetPaintingLite(arg_9_0._paintingName, arg_9_0._shipId)

	local var_9_2 = SpinePaintingConst.painting_lit_data[arg_9_0._paintingName] and SpinePaintingConst.painting_lit_data[arg_9_0._paintingName].classes or "MainPaintingLitUI"
	local var_9_3

	if var_9_2 and _G[var_9_2] then
		var_9_3 = _G[var_9_2]
	end

	if var_9_0:isLightSkin() and var_9_1 then
		if arg_9_0._litUI and arg_9_0._litUI:GetSkinId() ~= var_9_0:getSkinId() then
			arg_9_0._litUI:Dispose()

			arg_9_0._litUI = nil
		end

		if not arg_9_0._litUI then
			arg_9_0._litUI = var_9_3.New(arg_9_0._tf, arg_9_0)

			arg_9_0._litUI:SetShip(var_9_0)
		end

		setActive(arg_9_0._tf, true)
		arg_9_0:changeLitOn(false)
	else
		setActive(arg_9_0._tf, false)
	end

	if arg_9_0._litUI then
		arg_9_0._litUI:Flush()
	end

	arg_9_0:updateUI()
end

function var_0_0.updateUI(arg_10_0)
	setActive(findTF(arg_10_0._tf, "btn/on"), arg_10_0._liteOn)
	setActive(findTF(arg_10_0._tf, "btn/off"), not arg_10_0._liteOn)

	if arg_10_0._litUI then
		arg_10_0._litUI:Update()
	end
end

function var_0_0.IsFixed(arg_11_0)
	return true
end

function var_0_0.Dispose(arg_12_0)
	pg.DelegateInfo.Dispose(arg_12_0)
	var_0_0.super.Dispose(arg_12_0)
end

return var_0_0
