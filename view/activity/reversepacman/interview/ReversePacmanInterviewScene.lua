local var_0_0 = class("ReversePacmanInterviewScene", import("view.base.BaseUI"))

var_0_0.ON_SELECTED_ROLE = "ReversePacmanInterviewScene::ON_SELECTED_ROLE"
var_0_0.ON_CLOSE_RESUME = "ReversePacmanInterviewScene::ON_CLOSE_RESUME"

function var_0_0.getUIName(arg_1_0)
	return "ReversePacmanInterviewUI"
end

function var_0_0.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiHomeBtn, function()
		arg_2_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiBackBtn, function()
		arg_2_0:onBackPressed()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiHelpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip["20260908gameplay_hire"].tip
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiShopBtn, function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SKINSHOP)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiResumeBtn, function()
		arg_2_0:ShowRoleListPanel(false)

		if arg_2_0.resumeView == nil then
			arg_2_0.resumeView = ReversePacmanResumeScene.New(arg_2_0.uiResumePanel, arg_2_0)
		end

		arg_2_0.resumeView:didEnter(arg_2_0.selectedID)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiGetCurrencyBtn, function()
		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanTaskScene,
			mediator = ReversePacmanTaskMediator
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiUnlockBtn, function()
		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanTaskScene,
			mediator = ReversePacmanTaskMediator
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiHireBtn, function()
		if not ReversePacmanTools.IsHireRole(arg_2_0.selectedID) then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("reverse_pacman_hire_tip"),
				onYes = function()
					arg_2_0:emit(ReversePacmanInterviewMediator.CMD_HIRE, arg_2_0.selectedID)
				end
			})

			return
		end
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiCurrencyBtn, function()
		local var_12_0 = ReversePacmanTools.GetInterviewItemID()

		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanItemPopScene,
			mediator = ReversePacmanItemPopMediator,
			data = {
				dropType = DROP_TYPE_VITEM,
				dropID = var_12_0,
				count = ReversePacmanTools.GetItemCnt(var_12_0),
				limitItemGuideID = ReversePacmanTools.GetActivity():getConfig("config_client").invite_link or 238
			}
		}))
	end, SFX_PANEL)

	arg_2_0.interviewList = ReversePacmanInterviewRoleList.New(arg_2_0.uiRolePanel, arg_2_0)
	arg_2_0.nameView = ReversePacmanInterviewRoleName.New(arg_2_0.uiNamePanel, arg_2_0)

	setText(arg_2_0.uiFrontText, i18n("reverse_pacman_owned"))

	local var_2_0 = Drop.New({
		type = DROP_TYPE_VITEM,
		id = ReversePacmanTools.GetInterviewItemID()
	})

	setImageSprite(arg_2_0.uiCurrencyImage, GetSpriteFromAtlas(var_2_0:getIcon(), ""))
end

function var_0_0.didEnter(arg_13_0)
	arg_13_0:BlurPanel(arg_13_0._tf)

	arg_13_0.eventIDList = {
		arg_13_0:bind(var_0_0.ON_SELECTED_ROLE, handler(arg_13_0, arg_13_0.OnSelectedRole)),
		arg_13_0:bind(var_0_0.ON_CLOSE_RESUME, handler(arg_13_0, arg_13_0.OnCloseResume))
	}

	arg_13_0.interviewList:didEnter()
	arg_13_0:ShowRoleListPanel(true)
	arg_13_0:RefreshCurrency()

	local var_13_0 = ReversePacmanTools.GetUnreadyHireStory()

	if #var_13_0 > 0 then
		local var_13_1 = {}

		for iter_13_0, iter_13_1 in ipairs(var_13_0) do
			table.insert(var_13_1, function(arg_14_0)
				arg_13_0:OnRoleHireSuccess(iter_13_1, arg_14_0)
			end)
		end

		seriesAsync(var_13_1, function()
			return
		end)
	end

	arg_13_0:RefreshTips()
end

function var_0_0.RefreshCurrency(arg_16_0)
	local var_16_0 = ReversePacmanTools.GetInterviewItemID()

	setText(arg_16_0.uiInterviewCntText, i18n("reverse_pacman_count", ReversePacmanTools.GetItemCnt(var_16_0)))
end

function var_0_0.RefreshPainting(arg_17_0)
	arg_17_0.paintingDefaultAngle = arg_17_0.uiPaintingTf.localEulerAngles

	if arg_17_0.shipVO then
		retPaintingPrefab(arg_17_0.uiPaintingTf, arg_17_0.shipVO:getPainting())
	end

	local var_17_0 = arg_17_0.selectedID
	local var_17_1 = pg.activity_chasing_character[var_17_0]
	local var_17_2 = ShipGroup.getDefaultShipConfig(pg.ship_skin_template[var_17_1.skin_id].ship_group).id
	local var_17_3 = Ship.New({
		id = var_17_2,
		configId = var_17_2,
		skin_id = var_17_1.skin_id
	})

	setPaintingPrefabAsync(arg_17_0.uiPaintingTf, var_17_3:getPainting(), "chuanwu", function()
		arg_17_0:RefreshPaintingColor()
	end, {
		skinID = var_17_3:getSkinId(),
		rotateZ = arg_17_0.paintingDefaultAngle.z
	})
end

function var_0_0.RefreshPaintingColor(arg_19_0)
	return
end

function var_0_0.RefreshName(arg_20_0)
	arg_20_0.nameView:RefreshUI(arg_20_0.selectedID)
end

function var_0_0.RefreshBtns(arg_21_0)
	local var_21_0 = arg_21_0.selectedID
	local var_21_1 = pg.activity_chasing_character[var_21_0]
	local var_21_2 = ReversePacmanTools.IsUnlockRole(var_21_0)

	setActive(arg_21_0.uiUnlockBtn, not var_21_2)
	setActive(arg_21_0.uiResumeBtn, var_21_2)

	if not var_21_2 then
		setActive(arg_21_0.uiGetCurrencyBtn, false)
		setActive(arg_21_0.uiAlreadyHireGo, false)
		setActive(arg_21_0.uiHireBtn, false)

		return
	end

	local var_21_3 = ReversePacmanTools.IsHireRole(var_21_0)

	setActive(arg_21_0.uiAlreadyHireGo, var_21_3)

	if var_21_3 then
		setActive(arg_21_0.uiGetCurrencyBtn, false)
		setActive(arg_21_0.uiHireBtn, false)

		return
	end

	local var_21_4 = ReversePacmanTools.GetItemCnt(var_21_1.need[1]) < var_21_1.need[2]

	setActive(arg_21_0.uiGetCurrencyBtn, var_21_4)

	if var_21_4 then
		setActive(arg_21_0.uiHireBtn, false)

		return
	end

	setActive(arg_21_0.uiHireBtn, not var_21_3)
end

function var_0_0.RefreshShopBtn(arg_22_0)
	local var_22_0 = arg_22_0:GetShopGoodsID()

	if var_22_0 == nil then
		setActive(arg_22_0.uiShopBtn, false)

		return
	end

	local var_22_1 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[var_22_0].time)

	setActive(arg_22_0.uiShopBtn, var_22_1)
end

function var_0_0.GetShopGoodsID(arg_23_0)
	local var_23_0 = ReversePacmanTools.GetActivity():getConfig("config_client").skin_shop_showtime or {}

	for iter_23_0, iter_23_1 in ipairs(var_23_0) do
		if pg.shop_template[iter_23_1].effect_args[1] == arg_23_0.selectedID then
			return iter_23_1
		end
	end
end

function var_0_0.ShowRoleListPanel(arg_24_0, arg_24_1)
	setActive(arg_24_0.uiRolePanel, arg_24_1)

	local var_24_0 = ReversePacmanTools.IsUnlockRole(arg_24_0.selectedID)

	setActive(arg_24_0.uiResumeBtn, arg_24_1 and var_24_0)
	setActive(arg_24_0.uiResumePanel, not arg_24_1)
end

function var_0_0.RefreshTips(arg_25_0)
	return
end

function var_0_0.OnSelectedRole(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0.selectedID = arg_26_2

	arg_26_0:RefreshPainting()
	arg_26_0:RefreshName()
	arg_26_0:RefreshBtns()
	arg_26_0:RefreshShopBtn()
end

function var_0_0.OnCloseResume(arg_27_0)
	arg_27_0:ShowRoleListPanel(true)
end

function var_0_0.OnRoleHireSuccess(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0:RefreshTips()
	arg_28_0:RefreshCurrency()

	local var_28_0 = pg.activity_chasing_character[arg_28_1].love_level_show[1][1]

	arg_28_0:ShowHireProcess()
	pg.NewStoryMgr.GetInstance():Play(var_28_0, function()
		arg_28_0:HideHireProcess(arg_28_1)
		arg_28_0:RefreshPaintingColor()
		existCall(arg_28_2)
	end, true)
end

function var_0_0.OnSelectedOption(arg_30_0)
	return
end

function var_0_0.ShowHireProcess(arg_31_0)
	return
end

function var_0_0.HideHireProcess(arg_32_0, arg_32_1)
	setActive(arg_32_0.uiStoryAdaptTf, false)
	arg_32_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
		viewComponent = ReversePacmanHireSuccessScene,
		mediator = ReversePacmanHireSuccessMediator,
		data = {
			roleID = arg_32_1
		}
	}))
	arg_32_0.interviewList:OnClickToggle(nil, nil, arg_32_0.selectedID)
end

function var_0_0.willExit(arg_33_0)
	if arg_33_0.shipVO then
		retPaintingPrefab(arg_33_0.uiPaintingTf, arg_33_0.shipVO:getPainting())
	end

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.eventIDList) do
		arg_33_0:disconnect(iter_33_1)
	end

	arg_33_0.eventIDList = nil

	arg_33_0:UnOverlayPanel(arg_33_0._tf)
	arg_33_0.interviewList:willExit()

	arg_33_0.interviewList = nil

	arg_33_0.nameView:willExit()

	arg_33_0.nameView = nil

	if arg_33_0.resumeView then
		arg_33_0.resumeView:willExit()

		arg_33_0.resumeView = nil
	end
end

function var_0_0.onBackPressed(arg_34_0)
	if not arg_34_0.uiRolePanel.gameObject.activeSelf then
		arg_34_0:ShowRoleListPanel(true)
	else
		var_0_0.super.onBackPressed(arg_34_0)
	end
end

return var_0_0
