local var_0_0 = class("CourtYardBottomPanel", import(".CourtYardBasePanel"))

function var_0_0.GetUIName(arg_1_0)
	return "main/bottomPanel"
end

function var_0_0.init(arg_2_0)
	arg_2_0.granaryBtn = arg_2_0:findTF("bottomleft/feed_btn")
	arg_2_0.stockBar = arg_2_0:findTF("progress", arg_2_0.granaryBtn):GetComponent(typeof(Slider))
	arg_2_0.stockTimeTxt = arg_2_0:findTF("time", arg_2_0.granaryBtn):GetComponent(typeof(Text))
	arg_2_0.stockTxt = arg_2_0:findTF("Text", arg_2_0.granaryBtn):GetComponent(typeof(Text))
	arg_2_0.stampBtn = arg_2_0:findTF("stamp")
	arg_2_0.shopBtn = arg_2_0:findTF("bottomright/shop_btn")
	arg_2_0.decorateBtn = arg_2_0:findTF("bottomright/decorate_btn")
	arg_2_0.templateBtn = arg_2_0:findTF("bottomright/theme_template_btn")
	arg_2_0.shareBtn = arg_2_0:findTF("bottomright/share_btn")
	arg_2_0.shopTip = arg_2_0.shopBtn:Find("tip")
	arg_2_0.trainBtn = arg_2_0:findTF("bottomleft/train_btn")
	arg_2_0.trainBtnTxt = arg_2_0.trainBtn:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.trainBtnLabel = arg_2_0.trainBtn:Find("label"):GetComponent(typeof(Text))
	arg_2_0.icon1 = arg_2_0:findTF("bottomleft/train_btn/icon")
	arg_2_0.icon2 = arg_2_0:findTF("bottomleft/train_btn/icon_1")

	setText(arg_2_0.granaryBtn:Find("label"), i18n("courtyard_label_capacity"))
	setText(arg_2_0.shareBtn:Find("Text"), i18n("courtyard_label_share"))
	setText(arg_2_0.shopBtn:Find("Text"), i18n("courtyard_label_shop"))
	setText(arg_2_0.decorateBtn:Find("Text"), i18n("courtyard_label_decoration"))
	setText(arg_2_0.templateBtn:Find("Text"), i18n("courtyard_label_template"))
end

function var_0_0.OnRegister(arg_3_0)
	onButton(arg_3_0, arg_3_0.stampBtn, function()
		getProxy(TaskProxy):dealMingshiTouchFlag(7)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.shareBtn, function()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeBackyard, pg.ShareMgr.PANEL_TYPE_PINK)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.granaryBtn, function()
		arg_3_0:emit(CourtYardMediator.GO_GRANARY)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.shopBtn, function()
		arg_3_0:emit(CourtYardMediator.GO_SHOP)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.decorateBtn, function()
		arg_3_0:emit(CourtYardMediator.OPEN_DECORATION)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.templateBtn, function()
		if LOCK_BACKYARD_TEMPLATE then
			return
		end

		arg_3_0:emit(CourtYardMediator.GO_THEME_TEMPLATE)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.trainBtn, function()
		if arg_3_0.contextData.floor == 1 then
			arg_3_0:emit(CourtYardMediator.SEL_TRAIN_SHIP)
		elseif arg_3_0.contextData.floor == 2 then
			arg_3_0:emit(CourtYardMediator.SEL_REST_SHIP)
		end
	end, SFX_PANEL)
	arg_3_0:SetActive(arg_3_0.stampBtn, not LOCK_CLICK_MINGSHI and getProxy(TaskProxy):mingshiTouchFlagEnabled())
	arg_3_0:UpdateShopTip()
end

function var_0_0.OnVisitRegister(arg_11_0)
	setActive(arg_11_0._tf, false)
end

function var_0_0.OnFlush(arg_12_0, arg_12_1)
	arg_12_1 = arg_12_1 or bit.bor(BackYardConst.DORM_UPDATE_TYPE_UPDATEFOOD, BackYardConst.DORM_UPDATE_TYPE_LEVEL, BackYardConst.DORM_UPDATE_TYPE_SHIP, BackYardConst.DORM_UPDATE_TYPE_USEFOOD, BackYardConst.DORM_UPDATE_TYPE_EXTENDFOOD)

	local var_12_0 = arg_12_0.dorm

	if bit.band(arg_12_1, BackYardConst.DORM_UPDATE_TYPE_UPDATEFOOD) > 0 or bit.band(arg_12_1, BackYardConst.DORM_UPDATE_TYPE_USEFOOD) > 0 or bit.band(arg_12_1, BackYardConst.DORM_UPDATE_TYPE_EXTENDFOOD) > 0 then
		arg_12_0:CalcStockLeftTime()
	end

	if bit.band(arg_12_1, BackYardConst.DORM_UPDATE_TYPE_SHIP) > 0 then
		arg_12_0:CalcStockLeftTime()
		arg_12_0:UpdateTrainBtn()
	end

	if bit.band(arg_12_1, BackYardConst.DORM_UPDATE_TYPE_LEVEL) > 0 then
		SetActive(arg_12_0.templateBtn, not LOCK_BACKYARD_TEMPLATE)

		if not LOCK_BACKYARD_TEMPLATE then
			arg_12_0:PlayBackYardThemeTemplate()
			SetActive(arg_12_0.templateBtn, var_12_0:IsMaxLevel() and arg_12_0:IsInner())
		end
	end

	if bit.band(arg_12_1, BackYardConst.DORM_UPDATE_TYPE_UPDATEFOOD) > 0 or bit.band(arg_12_1, BackYardConst.DORM_UPDATE_TYPE_LEVEL) > 0 or bit.band(arg_12_1, BackYardConst.DORM_UPDATE_TYPE_USEFOOD) > 0 or bit.band(arg_12_1, BackYardConst.DORM_UPDATE_TYPE_EXTENDFOOD) > 0 then
		local var_12_1 = pg.dorm_data_template[var_12_0.id].capacity

		arg_12_0.stockBar.value = var_12_0.food / (var_12_1 + var_12_0.dorm_food_max)
		arg_12_0.stockTxt.text = math.ceil(var_12_0.food) .. "/" .. var_12_1 + var_12_0.dorm_food_max
	end

	arg_12_0:UpdateFloor()
end

function var_0_0.PlayBackYardThemeTemplate(arg_13_0)
	if getProxy(DormProxy):getRawData():IsMaxLevel() and not pg.NewStoryMgr.GetInstance():GetPlayedFlag(90021) then
		_BackyardMsgBoxMgr:Show({
			modal = true,
			hideNo = true,
			hideClose = true,
			content = i18n("open_backyard_theme_template_tip")
		})
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = "NG0020"
		})
	end
end

function var_0_0.UpdateTrainBtn(arg_14_0)
	if arg_14_0.contextData.floor == 1 then
		arg_14_0.trainBtnLabel.text = i18n("courtyard_label_train")
		arg_14_0.trainBtnTxt.text = arg_14_0.dorm:GetStateShipCnt(Ship.STATE_TRAIN) .. "/" .. arg_14_0.dorm.exp_pos
	elseif arg_14_0.contextData.floor == 2 then
		arg_14_0.trainBtnLabel.text = i18n("courtyard_label_rest")
		arg_14_0.trainBtnTxt.text = arg_14_0.dorm:GetStateShipCnt(Ship.STATE_REST) .. "/" .. arg_14_0.dorm.rest_pos
	end
end

function var_0_0.UpdateShopTip(arg_15_0)
	setActive(arg_15_0.shopTip, getProxy(SettingsProxy):IsTipNewTheme() or getProxy(SettingsProxy):IsTipNewGemFurniture())
end

function var_0_0.OnRemoveLayer(arg_16_0, arg_16_1)
	if arg_16_1 == NewBackYardShopMediator then
		arg_16_0:UpdateShopTip()
	end
end

function var_0_0.CalcStockLeftTime(arg_17_0)
	local var_17_0 = arg_17_0.dorm

	arg_17_0:RemoveTimer()

	arg_17_0.stockTimeTxt.text = ""

	if var_17_0:GetStateShipCnt(Ship.STATE_TRAIN) <= 0 or var_17_0.food <= 0 then
		return
	end

	local var_17_1 = var_17_0:getFoodLeftTime()

	arg_17_0.timer = Timer.New(function()
		local var_18_0 = math.floor(var_17_1) - pg.TimeMgr.GetInstance():GetServerTime()

		arg_17_0.stockTimeTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_18_0)

		if var_18_0 <= 0 then
			arg_17_0:RemoveTimer()
		end
	end, 1, -1)

	arg_17_0.timer:Start()
	arg_17_0.timer.func()
end

function var_0_0.RemoveTimer(arg_19_0)
	arg_19_0.stockTimeTxt.text = ""

	if arg_19_0.timer then
		arg_19_0.timer:Stop()

		arg_19_0.timer = nil
	end
end

function var_0_0.GetMoveY(arg_20_0)
	return {
		{
			arg_20_0._tf,
			-1
		}
	}
end

function var_0_0.UpdateFloor(arg_21_0, arg_21_1)
	SetActive(arg_21_0.granaryBtn, arg_21_0:IsInner() and getProxy(DormProxy).floor == 1)
	arg_21_0:UpdateTrainBtn()
	setActive(arg_21_0.icon1, getProxy(DormProxy).floor == 1)
	setActive(arg_21_0.icon2, getProxy(DormProxy).floor == 2)
end

function var_0_0.OnDispose(arg_22_0)
	arg_22_0:RemoveTimer()
end

return var_0_0
