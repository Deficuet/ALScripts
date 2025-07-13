local var_0_0 = class("MainUI", import("..base.BaseUI"))
local var_0_1 = Mathf

var_0_0.EJECT_DURATION = 0.5
var_0_0.EJECT_DURATION_ENTER = 0.4
var_0_0.DIRECTION_RIGHT = 1
var_0_0.DIRECTION_DOWN = 2
var_0_0.DIRECTION_LEFT = 3
var_0_0.DIRECTION_UP = 4
var_0_0.DIRECTION_DOWN_RIGHT = 5
var_0_0.DIRECTION_UP_LEFT = 6
var_0_0.REVERT_VERTICAL = -1
var_0_0.REVERT_HERIZONTAL = -2
var_0_0.REVERT_HERIZONTAL_VERTICAL = -3
var_0_0.STATE_MAIN = 1
var_0_0.STATE_SECONDARY = 2
var_0_0.STATE_ALL_HIDE = 3
var_0_0.TOUCH_HEIGHT = 20
var_0_0.TOUCH_LOOP = 1
var_0_0.TOUCH_DURATION = 0.1
var_0_0.BREATH_HEIGHT = -20
var_0_0.DEFAULT_HEIGHT = -10
var_0_0.BREATH_DURATION = 2.3
var_0_0.CHAT_HEIGHT = 15
var_0_0.CHAT_DURATION = 0.3
var_0_0.PAINT_DEFAULT_POS_X = -600
var_0_0.CHAT_SHOW_TIME = 3
var_0_0.CHAT_INTERVAL = 30
var_0_0.CHAT_ANIMATION_TIME = 0.3
var_0_0.BASE_TIME_INFO = {
	{
		{
			0,
			5
		},
		"bg_main_night"
	},
	{
		{
			5,
			8
		},
		"bg_main_twilight"
	},
	{
		{
			8,
			16
		},
		"bg_main_day"
	},
	{
		{
			16,
			19
		},
		"bg_main_twilight"
	},
	{
		{
			19,
			24
		},
		"bg_main_night"
	}
}
var_0_0.BUFFTEXT_SHOW_TIME = 7

local var_0_2
local var_0_3 = pg.ship_spine_shift

function var_0_0.getUIName(arg_1_0)
	return "MainUI"
end

function var_0_0.getDiffTimeInfo(arg_2_0)
	local var_2_0 = var_0_0.BASE_TIME_INFO

	if checkExist(getProxy(ActivityProxy):getActivityById(pg.gameset.dayandnight_bgm.key_value), {
		"isEnd"
	}) == false then
		var_2_0 = pg.gameset.dayandnight_bgm.description
	end

	local var_2_1 = pg.TimeMgr.GetInstance():GetServerHour()

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		local var_2_2 = iter_2_1[1]

		if var_2_1 >= var_2_2[1] and var_2_1 < var_2_2[2] then
			return iter_2_1
		end
	end
end

function var_0_0.getBGM(arg_3_0)
	local var_3_0 = arg_3_0:getCurrentFlagship()

	if var_3_0:IsBgmSkin() and getProxy(SettingsProxy):IsBGMEnable() then
		return var_3_0:GetSkinBgm()
	end

	return arg_3_0:getDiffTimeInfo()[3] or var_0_0.super.getBGM(arg_3_0)
end

function var_0_0.getCurrentFlagship(arg_4_0)
	local var_4_0 = getProxy(PlayerProxy):getData()
	local var_4_1 = getProxy(SettingsProxy):getCurrentSecretaryIndex()

	return (getProxy(BayProxy):getShipById(var_4_0.characters[var_4_1] or var_4_0.character))
end

function var_0_0.setShips(arg_5_0, arg_5_1)
	arg_5_0.ships = arg_5_1
end

function var_0_0.setBG(arg_6_0)
	PoolMgr.GetInstance():GetSprite("commonbg/" .. arg_6_0:getDiffTimeInfo()[2], "", false, function(arg_7_0)
		arg_6_0.bgLoading = false

		arg_6_0:setChangeBtnInteractable()
		setImageSprite(arg_6_0._bg:Find("bg"), arg_7_0)
	end)
end

function var_0_0.Ctor(arg_8_0)
	var_0_0.super.Ctor(arg_8_0)

	var_0_2 = pg.AssistantInfo
end

function var_0_0.init(arg_9_0)
	arg_9_0.redDotHelper = MainSceneRetDotHelper.New(arg_9_0._go)
	arg_9_0._leftPanel = arg_9_0:findTF("toTop/frame/leftPanel")
	arg_9_0._hideBtn = arg_9_0:findTF("toTop/frame/leftPanel/hideButton")
	arg_9_0._cameraBtn = arg_9_0:findTF("toTop/frame/leftPanel/cameraButton")
	arg_9_0._changeBtn = arg_9_0:findTF("toTop/frame/leftPanel/changeBtn")
	arg_9_0._chatBtn = arg_9_0:findTF("toTop/frame/leftPanel/chatButton")
	arg_9_0._monthCardBtn = arg_9_0:findTF("toTop/frame/leftPanel/monthCardButton")
	arg_9_0._commissionBtn = arg_9_0:findTF("toTop/frame/leftPanel/commissionButton")
	arg_9_0._commissionBtn.localPosition = Vector3(0, arg_9_0._commissionBtn.localPosition.y, 0)
	arg_9_0._wordBtn = arg_9_0:findTF("toTop/frame/leftPanel/wordBtn")
	arg_9_0._wordBtnOpen = arg_9_0:findTF("toTop/frame/leftPanel/wordBtn/open")
	arg_9_0._wordBtnClose = arg_9_0:findTF("toTop/frame/leftPanel/wordBtn/close")
	arg_9_0._rightPanel = arg_9_0:findTF("toTop/frame/rightPanel")
	arg_9_0._combatBtn = arg_9_0:findTF("toTop/frame/rightPanel/eventPanel/combatBtn")
	arg_9_0._formationBtn = arg_9_0:findTF("toTop/frame/rightPanel/eventPanel/formationButton")
	arg_9_0._rightTopPanel = arg_9_0:findTF("toTop/frame/rightTopPanel")
	arg_9_0._friendBtn = arg_9_0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/friendButton")
	arg_9_0._mailBtn = arg_9_0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/mailButton")
	arg_9_0._noticeBtn = arg_9_0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/noticeButton")
	arg_9_0._settingBtn = arg_9_0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/settingButton")
	arg_9_0._rankBtn = arg_9_0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/rankButton")
	arg_9_0._collectionBtn = arg_9_0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/collectionButton")
	arg_9_0._memoryBtn = arg_9_0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/memoryButton")
	arg_9_0._monopolyBtn = arg_9_0:findTF("rightPanel/linkBtns/monopoly_btn")
	arg_9_0._blackWhitBtn = arg_9_0:findTF("rightPanel/linkBtns/blackwhite_btn")
	arg_9_0._memoryBookBtn = arg_9_0:findTF("rightPanel/linkBtns/memorybook_btn")
	arg_9_0._ActivityBtns = arg_9_0:findTF("linkBtns", arg_9_0._rightPanel)
	arg_9_0._ActivityBtnTpl = arg_9_0:findTF("buttonTpl", arg_9_0._rightPanel)
	rtf(arg_9_0._ActivityBtnTpl).anchoredPosition = Vector2.zero
	arg_9_0._bottomPanel = arg_9_0:findTF("toTop/frame/bottomPanel")
	arg_9_0._dockBtn = arg_9_0:findTF("toTop/frame/bottomPanel/btm/buttons_container/dockBtn")
	arg_9_0._equipBtn = arg_9_0:findTF("toTop/frame/bottomPanel/btm/buttons_container/equipButton")
	arg_9_0._phonyui = arg_9_0:findTF("toTop/frame/phonyui")
	arg_9_0._settingBottom = arg_9_0:findTF("toTop/frame/settingBottom")
	arg_9_0._moveBtn = arg_9_0:findTF("toTop/frame/settingBottom/move")
	arg_9_0._setBtn = arg_9_0:findTF("toTop/frame/settingBottom/set")
	arg_9_0._setOn = arg_9_0:findTF("toTop/frame/settingBottom/set/on")
	arg_9_0._setOff = arg_9_0:findTF("toTop/frame/settingBottom/set/off")
	arg_9_0._moveOn = arg_9_0:findTF("toTop/frame/settingBottom/move/on")
	arg_9_0._moveOff = arg_9_0:findTF("toTop/frame/settingBottom/move/off")
	arg_9_0._settingRight = arg_9_0:findTF("toTop/frame/settingRight")
	arg_9_0._resetBtn = arg_9_0:findTF("toTop/frame/settingRight/reset")
	arg_9_0._saveBtn = arg_9_0:findTF("toTop/frame/settingRight/save")
	arg_9_0._backBtn = arg_9_0:findTF("toTop/frame/settingRight/back")
	arg_9_0._voteBookBtn = arg_9_0:findTF("btm/vote_book_btn", arg_9_0._bottomPanel)
	arg_9_0._buildBtn = arg_9_0:findTF("toTop/frame/bottomPanel/btm/buttons_container/buildButton")
	arg_9_0._taskBtn = arg_9_0:findTF("toTop/frame/bottomPanel/btm/buttons_container/taskButton")
	arg_9_0._guildButton = arg_9_0:findTF("toTop/frame/bottomPanel/btm/buttons_container/guildButton")
	arg_9_0._mallBtn = arg_9_0:findTF("toTop/frame/bottomPanel/btm/buttons_container/mallBtn")
	arg_9_0._mallSellTag = arg_9_0:findTF("SellTag", arg_9_0._mallBtn)
	arg_9_0._skinSellTag = arg_9_0:findTF("skinTag", arg_9_0._mallBtn)
	arg_9_0._montgcardTag = arg_9_0:findTF("MonthcardTag", arg_9_0._mallBtn)
	arg_9_0._freeGiftTag = arg_9_0:findTF("tip", arg_9_0._mallBtn)
	arg_9_0._freeBuildTag = arg_9_0:findTF("buildTag", arg_9_0._buildBtn)
	arg_9_0._liveBtn = arg_9_0:findTF("toTop/frame/bottomPanel/btm/buttons_container/liveButton")
	arg_9_0._technologyBtn = arg_9_0:findTF("toTop/frame/bottomPanel/btm/buttons_container/technologyButton")
	arg_9_0._bottomBlur = arg_9_0._bottomPanel:Find("btm")
	arg_9_0._rightTopBlur = arg_9_0._rightTopPanel:Find("bg")
	arg_9_0._playerResOb = arg_9_0:findTF("toTop/frame/playerRes")
	arg_9_0._resPanel = PlayerResource.New()

	tf(arg_9_0._resPanel._go):SetParent(tf(arg_9_0._playerResOb), false)

	arg_9_0._commanderPanel = arg_9_0:findTF("toTop/frame/commanderPanel")
	arg_9_0._commanderPanelbg = arg_9_0:findTF("toTop/top")
	arg_9_0._commanderInfoBtn = arg_9_0:findTF("top/iconBack", arg_9_0._commanderPanel)
	arg_9_0._nameLabel = arg_9_0:findTF("top/playerInfoBg2/playerInfoBg/nameLabel", arg_9_0._commanderPanel)
	arg_9_0._levelLabel = arg_9_0:findTF("top/playerInfoBg2/playerInfoBg/levelLabel", arg_9_0._commanderPanel)
	arg_9_0._expBar = arg_9_0:findTF("top/playerInfoBg2/playerInfoBg/expArea", arg_9_0._commanderPanel):GetComponent(typeof(Slider))
	arg_9_0._icon = arg_9_0:findTF("top/iconBack/icon", arg_9_0._commanderPanel)
	arg_9_0._buffList = arg_9_0:findTF("buffList", arg_9_0._commanderPanel)
	arg_9_0._buffTpl = arg_9_0:findTF("buff", arg_9_0._buffList)
	arg_9_0._buffText = arg_9_0:findTF("buffText", arg_9_0._commanderPanel)
	arg_9_0._linkBtns = arg_9_0:findTF("link_btns", arg_9_0._commanderPanel)
	arg_9_0.traingCampBtn = arg_9_0:findTF("traningcamp", arg_9_0._linkBtns)
	arg_9_0.refluxBtn = arg_9_0:findTF("return", arg_9_0._linkBtns)
	arg_9_0.exSkinBtn = arg_9_0:findTF("ex_skin_btn", arg_9_0._commanderPanel)

	setActive(arg_9_0.exSkinBtn, false)
	setActive(arg_9_0._buffText, false)

	arg_9_0._btmbg = arg_9_0:findTF("toTop/btm")
	arg_9_0._paintingTF = arg_9_0:findTF("paint")
	arg_9_0._paintingBgTf = arg_9_0:findTF("paintBg")
	arg_9_0._paintingContainer = arg_9_0:findTF("paint/fitter")
	arg_9_0._chatTextBg = arg_9_0:findTF("chat/chatbgtop")
	arg_9_0._chatText = arg_9_0:findTF("chat/Text")
	arg_9_0._chat = arg_9_0:findTF("chat")
	arg_9_0.initChatBgH = arg_9_0._chatTextBg.sizeDelta.y
	arg_9_0.effectTF = arg_9_0:findTF("effect", arg_9_0._paintingTF)
	arg_9_0._chatBg = arg_9_0:findTF("chatPreview", arg_9_0._rightPanel)
	arg_9_0._chatEmptySign = arg_9_0:findTF("EmptySign", arg_9_0._chatBg)

	setActive(arg_9_0._chatEmptySign, false)

	arg_9_0._chatList = arg_9_0:findTF("list", arg_9_0._chatBg)
	arg_9_0._chatItem = arg_9_0:findTF("item", arg_9_0._chatBg).gameObject

	arg_9_0._chatItem:SetActive(false)

	arg_9_0._chatActBtn = arg_9_0:findTF("ActivityBtn", arg_9_0._chatBg)
	arg_9_0._chatActBtnDisable = arg_9_0:findTF("ActivityBtnDisable", arg_9_0._chatBg)
	arg_9_0.hideChatFlag = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)

	setActive(arg_9_0._chatActBtn, arg_9_0.hideChatFlag)
	setActive(arg_9_0._chatActBtnDisable, not arg_9_0.hideChatFlag)

	if LOCK_HIDE_CHAT then
		SetActive(arg_9_0._chatActBtn, false)
	end

	arg_9_0._bg = arg_9_0:findTF("Sea")
	arg_9_0._currentState = var_0_0.STATE_MAIN
	arg_9_0._chat.localScale = Vector3(0, 0)
	arg_9_0._paintingOffset = 0
	arg_9_0.toTopPanel = arg_9_0:findTF("toTop")
	arg_9_0.skinExpireDisplayPage = SkinExpireDisplayPage.New(arg_9_0.toTopPanel, arg_9_0.event)
	arg_9_0.attireExpireDisplayPage = AttireExpireDisplayPage.New(arg_9_0.toTopPanel, arg_9_0.event)
	arg_9_0.skinExperienceDiplayPage = SkinExperienceDiplayPage.New(arg_9_0.toTopPanel, arg_9_0.event)
	arg_9_0.secondaryPage = MainUISecondaryPage.New(arg_9_0:findTF("MainUISecondaryPanel"), arg_9_0)
	arg_9_0._paintingTimer = Timer.New(function()
		arg_9_0._paintingBgTf.localScale = arg_9_0._paintingTF.localScale
		arg_9_0._paintingBgTf.localPosition = arg_9_0._paintingBgTf.localPosition + (arg_9_0._paintingTF.localPosition - arg_9_0._paintingBgTf.localPosition) * 0.6
	end, 0.033, -1)

	arg_9_0._paintingTimer:Start()
	arg_9_0._paintingTimer:Pause()
end

function var_0_0.uiEnterAnim(arg_11_0)
	local var_11_0

	if arg_11_0.contextData.isFromLogin or getProxy(PlayerProxy):getFlag("battle") then
		local var_11_1 = GetOrAddComponent(arg_11_0._tf, typeof(CanvasGroup))

		function var_11_0(...)
			arg_11_0:enablePartialBlur()

			if arg_11_0.tempFlagShip then
				var_11_1.blocksRaycasts = true
			else
				var_11_1.blocksRaycasts = true
			end
		end

		var_11_1.blocksRaycasts = false
	else
		arg_11_0:enablePartialBlur()
	end

	local var_11_2 = getProxy(PlayerProxy)
	local var_11_3 = var_11_2:getData()
	local var_11_4 = getProxy(SettingsProxy):getCurrentSecretaryIndex()

	if var_11_2:getFlag("battle") then
		var_11_4 = math.random(#var_11_3.characters)

		getProxy(SettingsProxy):setCurrentSecretaryIndex(var_11_4)
	end

	local var_11_5 = getProxy(BayProxy):getShipById(var_11_3.characters[var_11_4]):getPainting()

	arg_11_0:loadChar(var_11_5)

	arg_11_0.tempFlagShip = getProxy(BayProxy):getShipById(var_11_3.characters[var_11_4])

	if arg_11_0.tempFlagShip then
		arg_11_0:updateFlagShip(arg_11_0.tempFlagShip)
	end

	setAnchoredPosition(arg_11_0._bottomPanel, Vector2(0, -128))
	setAnchoredPosition(arg_11_0._btmbg, Vector2(0, -128))
	setAnchoredPosition(arg_11_0._commanderPanel, Vector2(0, 141))
	setAnchoredPosition(arg_11_0._commanderPanelbg, Vector2(0, 141))
	setAnchoredPosition(arg_11_0._leftPanel, Vector2(-222, 0))
	setAnchoredPosition(arg_11_0._rightPanel, Vector2(847, 0))
	setAnchoredPosition(arg_11_0._rightTopPanel, Vector2(847, 0))
	setAnchoredPosition(arg_11_0._playerResOb, Vector2(0, 77))
	arg_11_0:ejectGimmick(arg_11_0._bottomPanel, var_0_0.REVERT_VERTICAL, var_0_0.EJECT_DURATION_ENTER, nil, 0, {
		0,
		1
	})
	arg_11_0:ejectGimmick(arg_11_0._btmbg, var_0_0.REVERT_VERTICAL, var_0_0.EJECT_DURATION_ENTER, nil, 0, {
		0,
		1
	})
	arg_11_0:ejectGimmick(arg_11_0._playerResOb, var_0_0.REVERT_VERTICAL, var_0_0.EJECT_DURATION_ENTER, nil, 0, {
		0,
		1
	})
	arg_11_0:ejectGimmick(arg_11_0._commanderPanel, var_0_0.REVERT_HERIZONTAL_VERTICAL, var_0_0.EJECT_DURATION_ENTER, nil, 0, {
		0,
		1
	})
	arg_11_0:ejectGimmick(arg_11_0._commanderPanelbg, var_0_0.REVERT_HERIZONTAL_VERTICAL, var_0_0.EJECT_DURATION_ENTER, nil, 0, {
		0,
		1
	})
	arg_11_0:ejectGimmick(arg_11_0._rightTopPanel, var_0_0.REVERT_HERIZONTAL, var_0_0.EJECT_DURATION_ENTER, nil, 0.1, {
		0,
		1
	})
	arg_11_0:ejectGimmick(arg_11_0._rightPanel, var_0_0.REVERT_HERIZONTAL, var_0_0.EJECT_DURATION_ENTER, nil, 0.2, {
		0,
		1
	})
	arg_11_0:ejectGimmick(arg_11_0._leftPanel, var_0_0.REVERT_HERIZONTAL, var_0_0.EJECT_DURATION_ENTER, var_11_0, 0.2, {
		0,
		1
	})
end

function var_0_0.openSecondaryPanel(arg_13_0)
	arg_13_0.secondaryPage:Show(arg_13_0._player)
end

function var_0_0.closeSecondaryPanel(arg_14_0, arg_14_1)
	if arg_14_1 then
		arg_14_0:enablePartialBlur()
	end

	if arg_14_0.secondaryPage then
		arg_14_0.secondaryPage:Hide()
	end
end

function var_0_0.disablePartialBlur(arg_15_0)
	if arg_15_0._tf then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_15_0.toTopPanel, arg_15_0._tf)
	end
end

function var_0_0.enablePartialBlur(arg_16_0)
	if arg_16_0._tf then
		local var_16_0 = {}

		table.insert(var_16_0, arg_16_0.toTopPanel:Find("frame/rightTopPanel/bg"))
		table.insert(var_16_0, arg_16_0.toTopPanel:Find("frame/rightPanel/eventPanel"))
		table.insert(var_16_0, arg_16_0.toTopPanel:Find("frame/rightPanel/chatPreview"))
		pg.UIMgr.GetInstance():OverlayPanelPB(arg_16_0.toTopPanel, {
			pbList = var_16_0
		})
	end
end

function var_0_0.emit(arg_17_0, ...)
	if arg_17_0.event then
		arg_17_0.event:emit(...)
	end
end

local var_0_4
local var_0_5

function var_0_0.didEnter(arg_18_0)
	arg_18_0:setBG()
	setActive(arg_18_0._phonyui, false)

	local var_18_0 = getProxy(UserProxy)

	if var_18_0.data.limitServerIds and #var_18_0.data.limitServerIds > 0 then
		return
	end

	onToggle(arg_18_0, arg_18_0._moveBtn, function(arg_19_0)
		setActive(arg_18_0._moveOn, arg_19_0)
		setActive(arg_18_0._moveOff, not arg_19_0)

		if arg_19_0 then
			LeanTween.cancel(go(arg_18_0._paintingTF))

			arg_18_0.paintMoving = true
			arg_18_0._setBtn:GetComponent(typeof(Toggle)).interactable = false
			arg_18_0._setBtn:Find("off"):GetComponent("Image").color = Color.New(1, 1, 1, 0.5)
			arg_18_0._setBtn:Find("on"):GetComponent("Image").color = Color.New(1, 1, 1, 0.5)
			arg_18_0._bg:GetComponent(typeof(Button)).enabled = false
			arg_18_0._paintingTF:GetComponent("CanvasGroup").blocksRaycasts = false

			local var_19_0 = arg_18_0.flagShip
			local var_19_1 = var_19_0:getPainting()
			local var_19_2 = getProxy(SettingsProxy):getCharacterSetting(var_19_0.id, SHIP_FLAG_L2D) and (var_19_1 == "biaoqiang" or var_19_1 == "z23" or var_19_1 == "lafei" or var_19_1 == "lingbo" or var_19_1 == "mingshi" or var_19_1 == "xuefeng")
			local var_19_3 = arg_18_0._paintingTF
			local var_19_4 = var_19_3.anchoredPosition.x
			local var_19_5 = var_19_3.anchoredPosition.y

			arg_18_0.anchoredY = arg_18_0._paintingTF.anchoredPosition.y

			local var_19_6 = var_19_3.rect.width
			local var_19_7 = var_19_3.rect.height
			local var_19_8 = arg_18_0._tf.rect.width / UnityEngine.Screen.width
			local var_19_9 = arg_18_0._tf.rect.height / UnityEngine.Screen.height
			local var_19_10 = var_19_6 / 2
			local var_19_11 = var_19_7 / 2
			local var_19_12
			local var_19_13
			local var_19_14 = GetOrAddComponent(arg_18_0._bg, "MultiTouchZoom")

			var_19_14:SetZoomTarget(arg_18_0._paintingTF)

			local var_19_15 = GetOrAddComponent(arg_18_0._bg, "EventTriggerListener")

			var_19_15.enabled = true
			var_19_14.enabled = true

			local var_19_16 = true

			var_19_15:AddPointDownFunc(function(arg_20_0)
				if Input.touchCount == 1 or Application.isEditor then
					var_19_16 = true
				elseif Input.touchCount >= 2 then
					var_19_16 = false
				end
			end)
			var_19_15:AddPointUpFunc(function(arg_21_0)
				if Input.touchCount <= 2 then
					var_19_16 = true
				end
			end)
			var_19_15:AddBeginDragFunc(function(arg_22_0, arg_22_1)
				var_19_12 = arg_22_1.position.x * var_19_8 - var_19_10 - tf(arg_18_0._paintingTF).localPosition.x
				var_19_13 = arg_22_1.position.y * var_19_9 - var_19_11 - tf(arg_18_0._paintingTF).localPosition.y
			end)
			var_19_15:AddDragFunc(function(arg_23_0, arg_23_1)
				if var_19_16 then
					local var_23_0 = tf(arg_18_0._paintingTF).localPosition

					if var_19_2 then
						tf(arg_18_0._paintingTF).localPosition = Vector3(arg_23_1.position.x * var_19_8 - var_19_10 - var_19_12, tf(arg_18_0._paintingTF).localPosition.y, -22)
					else
						tf(arg_18_0._paintingTF).localPosition = Vector3(arg_23_1.position.x * var_19_8 - var_19_10 - var_19_12, arg_23_1.position.y * var_19_9 - var_19_11 - var_19_13, -22)
					end

					arg_18_0.anchoredY = var_19_3.anchoredPosition.y
				end
			end)

			function var_0_4()
				var_19_15.enabled = false
				var_19_14.enabled = false
			end
		else
			arg_18_0.paintMoving = false
			arg_18_0._bg:GetComponent(typeof(Button)).enabled = true
			arg_18_0._paintingTF:GetComponent("CanvasGroup").blocksRaycasts = true

			arg_18_0:paintBreath()

			arg_18_0.toTopPanel:GetComponent("CanvasGroup").interactable = true
			arg_18_0._setBtn:GetComponent(typeof(Toggle)).interactable = true
			arg_18_0._setBtn:Find("off"):GetComponent("Image").color = Color.New(1, 1, 1, 1)
			arg_18_0._setBtn:Find("on"):GetComponent("Image").color = Color.New(1, 1, 1, 1)

			if var_0_4 then
				var_0_4()
			end
		end
	end)

	GetComponent(arg_18_0._moveBtn, typeof(Toggle)).isOn = false

	onToggle(arg_18_0, arg_18_0._setBtn, function(arg_25_0)
		setActive(arg_18_0._setOn, arg_25_0)
		setActive(arg_18_0._setOff, not arg_25_0)

		if arg_25_0 then
			triggerToggle(arg_18_0._moveBtn, false)
			LeanTween.moveX(arg_18_0._setBtn, -220, 0.5)
			setToggleEnabled(arg_18_0._moveBtn, false)
			setActive(arg_18_0._moveBtn, false)
			setImageAlpha(arg_18_0._backBtn, 0)
			setButtonEnabled(arg_18_0._backBtn, false)
			setActive(arg_18_0._backBtn, false)
			setActive(arg_18_0._resetBtn, true)
			LeanTween.alpha(arg_18_0._resetBtn, 1, 0.5):setOnComplete(System.Action(function()
				setButtonEnabled(arg_18_0._resetBtn, true)
			end))
			setActive(arg_18_0._saveBtn, true)
			LeanTween.alpha(arg_18_0._saveBtn, 1, 0.5):setOnComplete(System.Action(function()
				setButtonEnabled(arg_18_0._saveBtn, true)
			end))
			setActive(arg_18_0._phonyui, true)
			LeanTween.cancel(go(arg_18_0._paintingTF))

			arg_18_0.paintMoving = true

			local var_25_0 = GetOrAddComponent(findTF(arg_18_0._paintingTF, "fitter"), "PaintingScaler")

			var_25_0:Snapshoot()

			var_25_0.FrameName = "mainNormal"
			findTF(arg_18_0._paintingTF, "live2d").anchoredPosition = Vector2(170, 0)

			local var_25_1, var_25_2, var_25_3 = getProxy(SettingsProxy):getSkinPosSetting(arg_18_0.flagShip.skinId)

			if var_25_1 then
				arg_18_0._paintingTF.anchoredPosition = Vector2(var_25_1, var_25_2)
				arg_18_0._paintingTF.localScale = Vector3(var_25_3, var_25_3, 1)
			else
				arg_18_0._paintingTF.anchoredPosition = Vector2(var_0_0.PAINT_DEFAULT_POS_X, var_0_0.DEFAULT_HEIGHT)
				arg_18_0._paintingTF.localScale = Vector3.one
			end

			arg_18_0._bg:GetComponent(typeof(Button)).enabled = false
			arg_18_0._paintingTF:GetComponent("CanvasGroup").blocksRaycasts = false

			local var_25_4 = arg_18_0.flagShip
			local var_25_5 = var_25_4:getPainting()
			local var_25_6 = getProxy(SettingsProxy):getCharacterSetting(var_25_4.id, SHIP_FLAG_L2D) and (var_25_5 == "biaoqiang" or var_25_5 == "z23" or var_25_5 == "lafei" or var_25_5 == "lingbo" or var_25_5 == "mingshi" or var_25_5 == "xuefeng")
			local var_25_7 = arg_18_0._paintingTF
			local var_25_8 = var_25_7.anchoredPosition.x
			local var_25_9 = var_25_7.anchoredPosition.y
			local var_25_10 = var_25_7.rect.width
			local var_25_11 = var_25_7.rect.height
			local var_25_12 = arg_18_0._tf.rect.width / UnityEngine.Screen.width
			local var_25_13 = arg_18_0._tf.rect.height / UnityEngine.Screen.height
			local var_25_14 = var_25_10 / 2
			local var_25_15 = var_25_11 / 2
			local var_25_16
			local var_25_17
			local var_25_18 = GetOrAddComponent(arg_18_0._bg, "MultiTouchZoom")

			var_25_18:SetZoomTarget(arg_18_0._paintingTF)

			local var_25_19 = GetOrAddComponent(arg_18_0._bg, "EventTriggerListener")

			var_25_19.enabled = true
			var_25_18.enabled = true

			local var_25_20 = true

			var_25_19:AddPointDownFunc(function(arg_28_0)
				if Input.touchCount == 1 or Application.isEditor then
					var_25_20 = true
				elseif Input.touchCount >= 2 then
					var_25_20 = false
				end
			end)
			var_25_19:AddPointUpFunc(function(arg_29_0)
				if Input.touchCount <= 2 then
					var_25_20 = true
				end
			end)
			var_25_19:AddBeginDragFunc(function(arg_30_0, arg_30_1)
				var_25_16 = arg_30_1.position.x * var_25_12 - var_25_14 - tf(arg_18_0._paintingTF).localPosition.x
				var_25_17 = arg_30_1.position.y * var_25_13 - var_25_15 - tf(arg_18_0._paintingTF).localPosition.y
			end)
			var_25_19:AddDragFunc(function(arg_31_0, arg_31_1)
				if var_25_20 then
					local var_31_0 = tf(arg_18_0._paintingTF).localPosition

					if var_25_6 then
						tf(arg_18_0._paintingTF).localPosition = Vector3(arg_31_1.position.x * var_25_12 - var_25_14 - var_25_16, tf(arg_18_0._paintingTF).localPosition.y, -22)
					else
						tf(arg_18_0._paintingTF).localPosition = Vector3(arg_31_1.position.x * var_25_12 - var_25_14 - var_25_16, arg_31_1.position.y * var_25_13 - var_25_15 - var_25_17, -22)
					end
				end
			end)

			function var_0_5()
				var_25_19.enabled = false
				var_25_18.enabled = false
			end
		else
			LeanTween.moveX(arg_18_0._setBtn, -450, 0.5):setOnComplete(System.Action(function()
				setToggleEnabled(arg_18_0._moveBtn, true)
				setActive(arg_18_0._moveBtn, true)
			end))
			setActive(arg_18_0._backBtn, true)
			LeanTween.alpha(arg_18_0._backBtn, 1, 0.5):setOnComplete(System.Action(function()
				setButtonEnabled(arg_18_0._backBtn, true)
			end))
			setImageAlpha(arg_18_0._resetBtn, 0)
			setButtonEnabled(arg_18_0._resetBtn, false)
			setActive(arg_18_0._resetBtn, false)
			setImageAlpha(arg_18_0._saveBtn, 0)
			setButtonEnabled(arg_18_0._saveBtn, false)
			setActive(arg_18_0._saveBtn, false)
			setActive(arg_18_0._phonyui, false)

			arg_18_0.paintMoving = false

			if var_0_5 then
				var_0_5()
			end

			arg_18_0._moveBtn:GetComponent(typeof(Toggle)).interactable = true

			arg_18_0:paintMove(arg_18_0._paintingOffset, "mainFullScreen", true, 0, 0)

			arg_18_0._bg:GetComponent(typeof(Button)).enabled = true
			arg_18_0._paintingTF:GetComponent("CanvasGroup").blocksRaycasts = true
			arg_18_0.anchoredY = var_0_0.DEFAULT_HEIGHT

			arg_18_0:paintBreath()
		end
	end)
	setActive(arg_18_0._setBtn, SECRETARY_POS)
	onButton(arg_18_0, arg_18_0._saveBtn, function()
		local var_35_0 = arg_18_0._paintingTF.anchoredPosition
		local var_35_1 = arg_18_0._paintingTF.localScale.x

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("secretary_pos_save"),
			onYes = function()
				getProxy(SettingsProxy):setSkinPosSetting(arg_18_0.flagShip.skinId, var_35_0.x, var_35_0.y, var_35_1)
				pg.TipsMgr.GetInstance():ShowTips(i18n("secretary_pos_save_success"))
				triggerToggle(arg_18_0._setBtn, false)
				arg_18_0:switchForm(var_0_0.STATE_MAIN)
			end
		})
	end)
	setImageAlpha(arg_18_0._saveBtn, 0)
	setButtonEnabled(arg_18_0._saveBtn, false)
	setActive(arg_18_0._saveBtn, false)
	onButton(arg_18_0, arg_18_0._resetBtn, function()
		getProxy(SettingsProxy):resetSkinPosSetting(arg_18_0.flagShip.skinId)

		arg_18_0._paintingTF.anchoredPosition = Vector2(var_0_0.PAINT_DEFAULT_POS_X, var_0_0.DEFAULT_HEIGHT)
		arg_18_0._paintingTF.localScale = Vector3.one
		findTF(arg_18_0._paintingTF, "live2d").anchoredPosition = Vector2(170, 0)
	end)
	setImageAlpha(arg_18_0._resetBtn, 0)
	setButtonEnabled(arg_18_0._resetBtn, false)
	setActive(arg_18_0._resetBtn, false)
	onButton(arg_18_0, arg_18_0._backBtn, function()
		triggerToggle(arg_18_0._moveBtn)
		arg_18_0:switchForm(var_0_0.STATE_MAIN)
	end)
	onButton(arg_18_0, arg_18_0.traingCampBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_TRANINGCAMP)
	end, SFX_PANEL)
	arg_18_0:uiEnterAnim()
	onButton(arg_18_0, arg_18_0.traingCampBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_TRANINGCAMP)
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.refluxBtn, function()
		arg_18_0:emit(MainUIMediator.GO_SCENE, {
			SCENE.REFLUX
		})
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0._combatBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_LEVEL)
	end, SFX_UI_WEIGHANCHOR_BATTLE)
	onButton(arg_18_0, arg_18_0._dockBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_CHUANWUSTART, DockyardScene.MODE_OVERVIEW)
	end, SFX_MAIN)
	onButton(arg_18_0, arg_18_0._hideBtn, function()
		arg_18_0:switchForm(var_0_0.STATE_ALL_HIDE)
	end, SFX_MAIN)

	if PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "2" then
		setActive(arg_18_0._cameraBtn, false)
		print("au platform，hide camera btn")
	else
		print("not au platform，show camera btn")
		onButton(arg_18_0, arg_18_0._cameraBtn, function()
			if PLATFORM_CODE == PLATFORM_CH and pg.SdkMgr.GetInstance():GetChannelUID() == "yun" then
				pg.TipsMgr.GetInstance():ShowTips("指挥官，当前平台不支持该功能哦")

				return
			end

			if CheckPermissionGranted(ANDROID_CAMERA_PERMISSION) then
				arg_18_0:openSnapShot()
			else
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("apply_permission_camera_tip1"),
					onYes = function()
						ApplyPermission({
							ANDROID_CAMERA_PERMISSION
						})
					end
				})
			end
		end, SFX_MAIN)
	end

	setActive(arg_18_0._changeBtn, #getProxy(PlayerProxy):getData().characters > 1)
	onButton(arg_18_0, arg_18_0._changeBtn, function()
		if arg_18_0._currentVoice then
			arg_18_0._currentVoice:Stop(true)
		end

		arg_18_0._currentVoice = nil

		arg_18_0:stopCurVoice()

		arg_18_0.chatFlag = false

		if arg_18_0._delayL2dSeID then
			LeanTween.cancel(arg_18_0._delayL2dSeID)

			arg_18_0._delayL2dSeID = nil
		end

		if arg_18_0._delayVoiceTweenID then
			LeanTween.cancel(arg_18_0._delayVoiceTweenID)

			arg_18_0._delayVoiceTweenID = nil
		end

		arg_18_0._changeBtn:GetComponent(typeof(Button)).interactable = false
		arg_18_0.bgLoading = true
		arg_18_0.paintingLoading = true

		local var_47_0 = getProxy(PlayerProxy):getData()

		if #var_47_0.characters == 1 then
			return
		end

		local var_47_1 = getProxy(SettingsProxy):rotateCurrentSecretaryIndex()
		local var_47_2 = getProxy(BayProxy):getShipById(var_47_0.characters[var_47_1])

		arg_18_0:updateFlagShip(var_47_2)
		arg_18_0:setFlagShip(var_47_2)

		if arg_18_0.shipPrefab and arg_18_0.shipModel then
			PoolMgr.GetInstance():ReturnSpineChar(arg_18_0.shipPrefab, arg_18_0.shipModel)

			arg_18_0.shipPrefab = nil
			arg_18_0.shipModel = nil
		end

		local var_47_3 = var_47_2:getPainting()

		arg_18_0:loadChar(var_47_3)

		if arg_18_0._lastChatTween then
			arg_18_0._lastChatTween:setDelay(0)
		end

		arg_18_0:PlayBGM()
	end)
	onButton(arg_18_0, arg_18_0._mallBtn, function()
		arg_18_0:emit(MainUIMediator.GO_MALL)
	end, SFX_MAIN)
	onButton(arg_18_0, arg_18_0._commissionBtn, function()
		if not LeanTween.isTweening(go(arg_18_0._commissionBtn)) then
			LeanTween.moveX(arg_18_0._commissionBtn, -1 * arg_18_0._commissionBtn.rect.width, 0.2):setOnComplete(System.Action(function()
				arg_18_0:emit(MainUIMediator.OPEN_COMMISSION_INFO)
			end))
		end
	end, SFX_UI_INFO)
	onButton(arg_18_0, arg_18_0._friendBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_FRIEND)
	end, SFX_UI_MENU)
	onButton(arg_18_0, arg_18_0._buildBtn, function()
		arg_18_0:emit(MainUIMediator.GETBOAT)
	end, SFX_UI_BUILDING)
	onButton(arg_18_0, arg_18_0._taskBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_TASK)
	end, SFX_MAIN)
	onButton(arg_18_0, arg_18_0._equipBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_ARMORYSCENE)
	end, SFX_MAIN)
	onButton(arg_18_0, arg_18_0._formationBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_BIANDUI, defaultValue(arg_18_0.contextData.fleetId, 1))
	end, SFX_UI_FORMATION)
	onButton(arg_18_0, arg_18_0._collectionBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_COLLECT_SHIP)
	end, SFX_UI_MENU)
	onButton(arg_18_0, arg_18_0._memoryBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_MEMORY)
	end, SFX_UI_MENU)

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_18_0._player.level, "NewGuildMediator") then
		setActive(arg_18_0:findTF("lock", arg_18_0._guildButton), true)

		arg_18_0._guildButton:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		setActive(arg_18_0:findTF("lock", arg_18_0._guildButton), false)

		arg_18_0._guildButton:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	onButton(arg_18_0, arg_18_0._guildButton, function()
		arg_18_0:emit(MainUIMediator.OPEN_GUILD)
	end, SFX_MAIN)
	onButton(arg_18_0, arg_18_0._mailBtn, function()
		if BATTLE_DEBUG then
			arg_18_0:emit(MainUIMediator.TMP_DEBUG)
		else
			arg_18_0:emit(MainUIMediator.OPEN_MAIL)
		end
	end, SFX_UI_MENU)
	onButton(arg_18_0, arg_18_0._chatBtn, function()
		if not arg_18_0.hideChatFlag or arg_18_0.hideChatFlag ~= 1 then
			arg_18_0:emit(MainUIMediator.OPEN_CHATVIEW)
		end
	end, SFX_UI_CHAT)
	onButton(arg_18_0, arg_18_0._chatBg, function()
		if not LeanTween.isTweening(go(arg_18_0._commissionBtn)) and (not arg_18_0.hideChatFlag or arg_18_0.hideChatFlag ~= 1) then
			arg_18_0:emit(MainUIMediator.OPEN_CHATVIEW)
		end
	end, SFX_UI_CHAT)
	onButton(arg_18_0, arg_18_0._settingBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_SETTINGS)
	end, SFX_UI_MENU)
	onButton(arg_18_0, arg_18_0._chatActBtn, function()
		local var_63_0 = arg_18_0.hideChatFlag and arg_18_0.hideChatFlag == 1
		local var_63_1 = var_63_0 and "show_chat_warning" or "hide_chat_warning"

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n(var_63_1),
			onYes = function()
				if var_63_0 then
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 0)
				else
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 1)
				end

				arg_18_0.hideChatFlag = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)

				arg_18_0:sethideChatBtn()
			end
		})
	end, SFX_UI_PANEL)
	onButton(arg_18_0, arg_18_0._chatActBtnDisable, function()
		local var_65_0 = arg_18_0.hideChatFlag and arg_18_0.hideChatFlag == 1
		local var_65_1 = var_65_0 and "show_chat_warning" or "hide_chat_warning"

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n(var_65_1),
			onYes = function()
				if var_65_0 then
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 0)
				else
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 1)
				end

				arg_18_0.hideChatFlag = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)

				arg_18_0:sethideChatBtn()
			end
		})
	end, SFX_UI_PANEL)
	arg_18_0:sethideChatBtn()
	onButton(arg_18_0, arg_18_0._noticeBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_BULLETINBOARD)
	end, SFX_UI_MENU)

	local var_18_1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_18_0._player.level, "BillboardMediator")

	SetActive(arg_18_0._rankBtn, var_18_1)
	onButton(arg_18_0, arg_18_0._rankBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_RANK)
	end, SFX_UI_MENU)
	onButton(arg_18_0, arg_18_0._commanderInfoBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_PLAYER_INFO_LAYER)
	end, SFX_MAIN)
	onButton(arg_18_0, arg_18_0._bg, function()
		if arg_18_0._currentState == var_0_0.STATE_ALL_HIDE then
			arg_18_0:switchForm(var_0_0.STATE_MAIN)
		end
	end, SFX_MAIN)
	onButton(arg_18_0, arg_18_0._paintingTF, function()
		if arg_18_0._currentState == var_0_0.STATE_ALL_HIDE and getToggleState(arg_18_0._moveBtn) then
			-- block empty
		elseif arg_18_0.live2dChar then
			arg_18_0:AssistantEventEffect()
		else
			local var_71_0 = arg_18_0.flagShip:getCVIntimacy()
			local var_71_1 = var_0_2.filterAssistantEvents(var_0_2.PaintingTouchEvents, arg_18_0.flagShip.skinId, var_71_0)

			arg_18_0:AssistantEventEffect(var_71_1[math.ceil(math.random(#var_71_1))])
			arg_18_0:paintClimax(var_0_0.TOUCH_HEIGHT, var_0_0.TOUCH_DURATION, var_0_0.TOUCH_LOOP)
		end

		if arg_18_0.flagShip then
			arg_18_0:emit(MainUIMediator.ON_TOUCHSHIP, arg_18_0.flagShip.groupId)
		end
	end)
	onButton(arg_18_0, arg_18_0._liveBtn, function()
		arg_18_0:openSecondaryPanel()
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0._technologyBtn, function()
		arg_18_0:emit(MainUIMediator.OPEN_TECHNOLOGY)
	end, SFX_PANEL)

	local function var_18_2(arg_74_0)
		setActive(arg_18_0._wordBtnOpen, not arg_74_0)
		setActive(arg_18_0._wordBtnClose, arg_74_0)
	end

	arg_18_0.showWord = getProxy(SettingsProxy):ShouldShipMainSceneWord()

	onButton(arg_18_0, arg_18_0._wordBtn, function()
		arg_18_0.showWord = not arg_18_0.showWord

		getProxy(SettingsProxy):SaveMainSceneWordFlag(arg_18_0.showWord)

		local var_75_0 = arg_18_0.showWord and i18n("game_openwords") or i18n("game_stopwords")

		pg.TipsMgr.GetInstance():ShowTips(var_75_0)

		if not arg_18_0.showWord and LeanTween.isTweening(arg_18_0._chat.gameObject) then
			LeanTween.cancel(arg_18_0._chat.gameObject)

			arg_18_0._chat.localScale = Vector3(0, 0, 0)
			arg_18_0._lastChatTween = nil
			arg_18_0.chatFlag = nil

			arg_18_0:startChatTimer()
		end

		var_18_2(arg_18_0.showWord)
	end, SFX_PANEL)
	var_18_2(arg_18_0.showWord)

	local var_18_3 = GetOrAddComponent(arg_18_0._paintingTF, "UILongPressTrigger").onLongPressed

	pg.DelegateInfo.Add(arg_18_0, var_18_3)
	var_18_3:RemoveAllListeners()
	var_18_3:AddListener(function()
		if arg_18_0.live2dChar then
			return
		end

		arg_18_0._paintingTF.localScale = Vector3.one
		arg_18_0._settingBottom.anchoredPosition = Vector2(0, -105)
		arg_18_0._settingRight.anchoredPosition = Vector2(865, 0)

		setActive(arg_18_0._settingBottom, false)
		setActive(arg_18_0._settingRight, false)
		arg_18_0:emit(MainUIMediator.ON_SHIP_DETAIL, arg_18_0.flagShip)
	end)
	arg_18_0:paintMove(var_0_0.PAINT_DEFAULT_POS_X, "mainNormal", false, 0)

	arg_18_0._settingBottom.anchoredPosition = Vector2(0, -105)
	arg_18_0._settingRight.anchoredPosition = Vector2(865, 0)

	setActive(arg_18_0._settingBottom, false)
	setActive(arg_18_0._settingRight, false)

	local var_18_4 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	setActive(arg_18_0.refluxBtn, var_18_4 and not var_18_4:isEnd())

	local var_18_5 = TrainingCampScene.isNormalActOn()
	local var_18_6 = TrainingCampScene.isTecActOn()

	setActive(arg_18_0.traingCampBtn, var_18_5 or var_18_6)
	TagTipHelper.MonthCardTagTip(arg_18_0._montgcardTag)
	TagTipHelper.SkinTagTip(arg_18_0._skinSellTag)
	TagTipHelper.FuDaiTagTip(arg_18_0._mallSellTag)
	TagTipHelper.FreeGiftTag({
		arg_18_0._freeGiftTag
	})
	TagTipHelper.FreeBuildTicketTip(arg_18_0._freeBuildTag)
end

function var_0_0.checkGreeGiftTag(arg_77_0)
	TagTipHelper.FreeGiftTag({
		arg_77_0._freeGiftTag
	})
end

function var_0_0.openSnapShot(arg_78_0)
	arg_78_0:emit(MainUIMediator.OPEN_SNAPSHOT, {
		skinId = arg_78_0.flagShip.skinId,
		live2d = arg_78_0.Live2dChar ~= nil
	})
end

function var_0_0.updateMonopolyBtn(arg_79_0, arg_79_1)
	local var_79_0 = arg_79_1 and not arg_79_1:isEnd()

	setActive(arg_79_0._monopolyBtn, var_79_0)

	if var_79_0 then
		onButton(arg_79_0, arg_79_0._monopolyBtn, function()
			arg_79_0:emit(MainUIMediator.ON_MONOPOLY)
		end, SFX_PANEL)
	end
end

function var_0_0.openSnapShot(arg_81_0)
	arg_81_0:emit(MainUIMediator.OPEN_SNAPSHOT, {
		skinId = arg_81_0.flagShip.skinId,
		live2d = arg_81_0.Live2dChar ~= nil
	})
end

function var_0_0.updateMonopolyBtn(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_1 and not arg_82_1:isEnd()

	setActive(arg_82_0._monopolyBtn, var_82_0)

	if var_82_0 then
		onButton(arg_82_0, arg_82_0._monopolyBtn, function()
			arg_82_0:emit(MainUIMediator.ON_MONOPOLY)
		end, SFX_PANEL)
	end
end

function var_0_0.onBackPressed(arg_84_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_84_0.secondaryPage and arg_84_0.secondaryPage:isShowing() then
		arg_84_0:closeSecondaryPanel()

		return
	end

	if arg_84_0._currentState == var_0_0.STATE_ALL_HIDE then
		if getToggleState(arg_84_0._setBtn) then
			triggerToggle(arg_84_0._setBtn, false)
		else
			arg_84_0:switchForm(var_0_0.STATE_MAIN)
		end
	else
		pg.SdkMgr.GetInstance():OnAndoridBackPress()
		pg.PushNotificationMgr.GetInstance():PushAll()
	end
end

function var_0_0.ResetActivityBtns(arg_85_0)
	local var_85_0 = import("GameCfg.activity.MainUIEntranceData")

	assert(var_85_0, "Not Found MAINUI ENTRANCEDATA!!")

	local var_85_1 = arg_85_0._ActivityBtns:GetComponent(typeof(GridLayoutGroup))

	if var_85_0.LayoutProperty.CellSize then
		var_85_1.cellSize = var_85_0.LayoutProperty.CellSize
	end

	if var_85_0.LayoutProperty.Spacing then
		var_85_1.spacing = var_85_0.LayoutProperty.Spacing
	end

	if var_85_0.LayoutProperty.Padding then
		var_85_1.padding = var_85_1.padding.New(unpack(var_85_0.LayoutProperty.Padding))
	end

	local var_85_2 = arg_85_0._ActivityBtnTpl

	for iter_85_0, iter_85_1 in ipairs(var_85_0.CurrentEntrancesList) do
		local var_85_3 = var_85_0[iter_85_1]
		local var_85_4 = tf(var_85_1):Find(var_85_3.ButtonName)

		if IsNil(var_85_4) then
			var_85_4 = cloneTplTo(var_85_2, var_85_1, var_85_3.ButtonName)

			var_85_4:SetSiblingIndex(iter_85_0 - 1)
			arg_85_0:RefreshBtn(var_85_4, var_85_3)

			if var_85_3.Tip then
				setImageSprite(var_85_4:Find("Tip"), LoadSprite("ui/mainui_atlas", var_85_3.Tip), true)
			else
				setActive(var_85_4:Find("Tip"), false)
			end

			if var_85_3.CtorButton then
				var_85_3.CtorButton(arg_85_0, var_85_4)
			end
		elseif var_85_3.forceRefreshImage then
			arg_85_0:RefreshBtn(var_85_4, var_85_3)
		end

		if var_85_0.LayoutProperty.CellScale then
			var_85_4.localScale = var_85_0.LayoutProperty.CellScale
		end

		if var_85_3.UpdateButton then
			var_85_3.UpdateButton(arg_85_0, var_85_4)
		else
			setActive(var_85_4, false)
		end
	end
end

function var_0_0.RefreshBtn(arg_86_0, arg_86_1, arg_86_2)
	local var_86_0 = arg_86_1:Find("Image")

	if var_86_0 == nil then
		var_86_0 = arg_86_1
	end

	if type(arg_86_2.Image) == "function" then
		local var_86_1 = arg_86_2.Image()

		if var_86_1 then
			setImageSprite(var_86_0, var_86_1, true)
		end
	else
		setImageSprite(var_86_0, LoadSprite("ui/mainui_atlas", arg_86_2.Image), true)
	end
end

function var_0_0.UpdateActivityBtn(arg_87_0, arg_87_1)
	local var_87_0 = import("GameCfg.activity.MainUIEntranceData")

	assert(var_87_0, "Not Found MAINUI ENTRANCEDATA!!")

	for iter_87_0, iter_87_1 in ipairs(var_87_0.CurrentEntrancesList) do
		local var_87_1 = var_87_0[iter_87_1]

		if var_87_1 and var_87_1.ButtonName == arg_87_1 then
			local var_87_2 = arg_87_0._ActivityBtns:Find(var_87_1.ButtonName)

			if not IsNil(var_87_2) then
				if var_87_1.UpdateButton then
					var_87_1.UpdateButton(arg_87_0, var_87_2)
				else
					setActive(var_87_2, false)
				end

				if var_87_1.forceRefreshImage then
					arg_87_0:RefreshBtn(var_87_2, var_87_1)
				end
			end

			break
		end
	end
end

function var_0_0.HandleMiniGameBtns(arg_88_0)
	local var_88_0 = import("GameCfg.activity.MainUIEntranceData")

	assert(var_88_0, "Not Found MAINUI ENTRANCEDATA!!")

	for iter_88_0, iter_88_1 in ipairs(var_88_0.CurrentEntrancesList) do
		local var_88_1 = var_88_0[iter_88_1]

		if var_88_1 and var_88_1.Tag and var_88_1.Tag == "MiniGameHub" then
			arg_88_0:UpdateActivityBtn(var_88_1.ButtonName)
		end
	end
end

function var_0_0.updateAnniversaryBtn(arg_89_0, arg_89_1)
	local var_89_0 = arg_89_1 and not arg_89_1:isEnd()

	setActive(arg_89_0._anniversaryBtn, var_89_0)

	if var_89_0 then
		onButton(arg_89_0, arg_89_0._anniversaryBtn, function()
			arg_89_0:emit(MainUIMediator.ON_ANNIVERSARY)
		end, SFX_PANEL)
	end
end

function var_0_0.updateBlackWhitBtn(arg_91_0, arg_91_1)
	local var_91_0 = arg_91_1 and not arg_91_1:isEnd()

	setActive(arg_91_0._blackWhitBtn, var_91_0)

	if var_91_0 then
		onButton(arg_91_0, arg_91_0._blackWhitBtn, function()
			arg_91_0:emit(MainUIMediator.ON_BLACKWHITE)
		end, SFX_PANEL)
	end
end

function var_0_0.updateMemoryBookBtn(arg_93_0, arg_93_1)
	local var_93_0 = arg_93_1 and not arg_93_1:isEnd() and not arg_93_1:isShow()

	setActive(arg_93_0._memoryBookBtn, var_93_0)

	if var_93_0 then
		onButton(arg_93_0, arg_93_0._memoryBookBtn, function()
			arg_93_0:emit(MainUIMediator.ON_MEMORYBOOK)
		end, SFX_PANEL)
	end
end

function var_0_0.updateLotteryBtn(arg_95_0, arg_95_1)
	local var_95_0 = arg_95_1 and not arg_95_1:isEnd()

	setActive(arg_95_0._lotteryBtn, var_95_0)

	if var_95_0 then
		onButton(arg_95_0, arg_95_0._lotteryBtn, function()
			arg_95_0:emit(MainUIMediator.ON_LOTTERY, arg_95_1.id)
		end, SFX_PANEL)
	end
end

function var_0_0.updateActivityPtBtn(arg_97_0, arg_97_1)
	local var_97_0 = arg_97_1 and not arg_97_1:isEnd()

	setActive(arg_97_0._activityPtBtn, var_97_0)

	if var_97_0 then
		onButton(arg_97_0, arg_97_0._activityPtBtn, function()
			arg_97_0:emit(MainUIMediator.ON_ACTIVITY_PT, arg_97_1.id)
		end, SFX_PANEL)
	end

	setActive(arg_97_0._activityPtBtn, false)
end

function var_0_0.updateActivityWowsBtn(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_1 and not arg_99_1:isEnd()

	setActive(arg_99_0._activityTaskWowsBtn, var_99_0)

	if var_99_0 then
		onButton(arg_99_0, arg_99_0._activityTaskWowsBtn, function()
			arg_99_0:emit(MainUIMediator.ON_ACTIVITY_WOWS, arg_99_1.id)
		end, SFX_PANEL)
	end
end

function var_0_0.switchForm(arg_101_0, arg_101_1)
	if arg_101_0._currentState ~= arg_101_1 then
		arg_101_0._currentState = arg_101_1

		if arg_101_1 == var_0_0.STATE_MAIN then
			arg_101_0:ejectGimmick(arg_101_0._bottomPanel, var_0_0.REVERT_VERTICAL)
			arg_101_0:ejectGimmick(arg_101_0._btmbg, var_0_0.REVERT_VERTICAL)
			arg_101_0:ejectGimmick(arg_101_0._leftPanel, var_0_0.REVERT_HERIZONTAL)
			arg_101_0:ejectGimmick(arg_101_0._rightPanel, var_0_0.REVERT_HERIZONTAL)
			arg_101_0:ejectGimmick(arg_101_0._rightTopPanel, var_0_0.REVERT_HERIZONTAL)
			arg_101_0:ejectGimmick(arg_101_0._playerResOb, var_0_0.REVERT_VERTICAL)
			arg_101_0:ejectGimmick(arg_101_0._commanderPanel, var_0_0.REVERT_HERIZONTAL_VERTICAL)
			arg_101_0:ejectGimmick(arg_101_0._commanderPanelbg, var_0_0.REVERT_HERIZONTAL_VERTICAL)
			arg_101_0:concealGimmick(arg_101_0._settingBottom, var_0_0.DIRECTION_DOWN)
			arg_101_0:concealGimmick(arg_101_0._settingRight, var_0_0.DIRECTION_RIGHT)

			arg_101_0._paintingTF.localScale = Vector3(1, 1, 1)

			triggerToggle(arg_101_0._moveBtn, false)
			arg_101_0:paintMove(var_0_0.PAINT_DEFAULT_POS_X, "mainNormal", true, 0)
			arg_101_0:managedTween(LeanTween.delayedCall, function()
				arg_101_0._paintingTimer:Pause()
			end, var_0_0.EJECT_DURATION + 0.3, nil)
		elseif arg_101_1 == var_0_0.STATE_ALL_HIDE then
			arg_101_0._paintingTimer:Resume()
			arg_101_0:concealGimmick(arg_101_0._bottomPanel, var_0_0.DIRECTION_DOWN)
			arg_101_0:concealGimmick(arg_101_0._btmbg, var_0_0.DIRECTION_DOWN)
			arg_101_0:concealGimmick(arg_101_0._rightPanel, var_0_0.DIRECTION_RIGHT)
			arg_101_0:concealGimmick(arg_101_0._leftPanel, var_0_0.DIRECTION_LEFT)
			arg_101_0:concealGimmick(arg_101_0._playerResOb, var_0_0.DIRECTION_UP)
			arg_101_0:concealGimmick(arg_101_0._rightTopPanel, var_0_0.DIRECTION_RIGHT)
			arg_101_0:concealGimmick(arg_101_0._commanderPanel, var_0_0.DIRECTION_UP_LEFT)
			arg_101_0:concealGimmick(arg_101_0._commanderPanelbg, var_0_0.DIRECTION_UP_LEFT)
			arg_101_0:ejectGimmick(arg_101_0._settingBottom, var_0_0.REVERT_VERTICAL)
			arg_101_0:ejectGimmick(arg_101_0._settingRight, var_0_0.REVERT_HERIZONTAL)
			arg_101_0:paintMove(arg_101_0._paintingOffset, "mainFullScreen", true, 0, 0)

			arg_101_0.anchoredY = var_0_0.DEFAULT_HEIGHT
		end
	end
end

function var_0_0.paintBreath(arg_103_0)
	if arg_103_0.live2dChar or arg_103_0.paintMoving then
		return
	end

	local var_103_0 = var_0_0.BREATH_HEIGHT
	local var_103_1 = var_0_0.DEFAULT_HEIGHT
	local var_103_2, var_103_3, var_103_4 = getProxy(SettingsProxy):getSkinPosSetting(arg_103_0.flagShip.skinId)

	if var_103_3 and arg_103_0._currentState == var_0_0.STATE_MAIN then
		var_103_1 = var_103_3
		var_103_0 = var_103_3 - 10
	end

	if arg_103_0._currentState == var_0_0.STATE_ALL_HIDE then
		var_103_1 = arg_103_0.anchoredY
		var_103_0 = var_103_1 - 10
	end

	LeanTween.cancel(go(arg_103_0._paintingTF))
	LeanTween.moveY(rtf(arg_103_0._paintingTF), var_103_0, var_0_0.BREATH_DURATION):setLoopPingPong():setEase(LeanTweenType.easeInOutCubic):setFrom(var_103_1)
end

function var_0_0.paintClimax(arg_104_0, arg_104_1, arg_104_2, arg_104_3)
	if arg_104_0.spinePainting then
		return
	end

	if arg_104_0.live2dChar or arg_104_0.paintMoving then
		return
	end

	local var_104_0, var_104_1, var_104_2 = getProxy(SettingsProxy):getSkinPosSetting(arg_104_0.flagShip.skinId)
	local var_104_3 = arg_104_1

	if var_104_1 then
		var_104_3 = arg_104_1 - var_0_0.DEFAULT_HEIGHT + var_104_1
	end

	if arg_104_0._currentState == var_0_0.STATE_ALL_HIDE then
		var_104_3 = arg_104_1 - var_0_0.DEFAULT_HEIGHT + arg_104_0.anchoredY
	end

	arg_104_3 = arg_104_3 or math.random(3) - 1

	if arg_104_3 ~= 0 then
		LeanTween.cancel(go(arg_104_0._paintingTF))
		LeanTween.moveY(rtf(arg_104_0._paintingTF), var_104_3, arg_104_2):setLoopPingPong(arg_104_3):setOnComplete(System.Action(function()
			arg_104_0:paintBreath()
		end))
	end
end

function var_0_0.paintMove(arg_106_0, arg_106_1, arg_106_2, arg_106_3, arg_106_4, arg_106_5)
	LeanTween.cancel(go(arg_106_0._paintingTF))
	LeanTween.moveY(rtf(arg_106_0._paintingTF), 0, var_0_0.EJECT_DURATION)
	LeanTween.moveY(findTF(arg_106_0._paintingTF, "live2d"), arg_106_4 or 0, var_0_0.EJECT_DURATION)

	local var_106_0 = GetOrAddComponent(findTF(arg_106_0._paintingTF, "fitter"), "PaintingScaler")

	var_106_0:Snapshoot()

	var_106_0.FrameName = arg_106_2

	if arg_106_3 then
		local var_106_1 = LeanTween.value(go(arg_106_0._paintingTF), 0, 1, var_0_0.EJECT_DURATION):setOnUpdate(System.Action_float(function(arg_107_0)
			var_106_0.Tween = arg_107_0
		end)):setEase(LeanTweenType.easeInOutSine)
	end

	arg_106_0._bg:GetComponent("Button").enabled = false
	arg_106_0._paintingTF:GetComponent("Button").enabled = false
	arg_106_0.paintMoving = true

	setActive(arg_106_0._chat, false)
	LeanTween.moveX(rtf(arg_106_0._chat), arg_106_0._currentState == var_0_0.STATE_MAIN and arg_106_1 + 140 or arg_106_1, var_0_0.EJECT_DURATION):setOnComplete(System.Action(function()
		setActive(arg_106_0._chat, true)
	end))

	local var_106_2, var_106_3, var_106_4 = getProxy(SettingsProxy):getSkinPosSetting(arg_106_0.flagShip.skinId)
	local var_106_5

	if var_106_4 and arg_106_2 == "mainNormal" then
		var_106_5 = LeanTween.moveX(rtf(arg_106_0._paintingTF), var_106_2, var_0_0.EJECT_DURATION)

		LeanTween.moveY(rtf(arg_106_0._paintingTF), var_106_3, var_0_0.EJECT_DURATION):setEase(LeanTweenType.easeInOutExpo)
		LeanTween.scale(rtf(arg_106_0._paintingTF), Vector3(var_106_4, var_106_4, 1), var_0_0.EJECT_DURATION):setEase(LeanTweenType.easeInOutExpo)
	else
		var_106_5 = LeanTween.moveX(rtf(arg_106_0._paintingTF), arg_106_1, var_0_0.EJECT_DURATION)

		LeanTween.moveY(rtf(arg_106_0._paintingTF), var_0_0.DEFAULT_HEIGHT, var_0_0.EJECT_DURATION):setEase(LeanTweenType.easeInOutExpo)
		LeanTween.scale(rtf(arg_106_0._paintingTF), Vector3(1, 1, 1), var_0_0.EJECT_DURATION):setEase(LeanTweenType.easeInOutExpo)
	end

	moveTweenL2D = LeanTween.moveX(findTF(arg_106_0._paintingTF, "live2d"), arg_106_5 or 170, var_0_0.EJECT_DURATION):setEase(LeanTweenType.easeInOutExpo)

	var_106_5:setEase(LeanTweenType.easeInOutExpo)
	var_106_5:setOnComplete(System.Action(function()
		arg_106_0.paintMoving = false

		arg_106_0:paintBreath()

		arg_106_0._bg:GetComponent("Button").enabled = true
		arg_106_0._paintingTF:GetComponent("Button").enabled = true
	end))
end

function var_0_0.getCvData(arg_110_0, arg_110_1)
	if arg_110_1 == "" then
		return nil
	end

	local var_110_0 = arg_110_0.flagShip:getCVIntimacy()
	local var_110_1 = string.split(arg_110_1, "_")
	local var_110_2
	local var_110_3
	local var_110_4
	local var_110_5
	local var_110_6
	local var_110_7

	if var_110_1[1] == "main" then
		var_110_2, var_110_4, var_110_3 = ShipWordHelper.GetWordAndCV(arg_110_0.flagShip.skinId, var_110_1[1], tonumber(var_110_1[2]), nil, var_110_0)
		var_110_5 = ShipWordHelper.GetL2dCvCalibrate(arg_110_0.flagShip.skinId, var_110_1[1], tonumber(var_110_1[2]))
		var_110_6 = ShipWordHelper.GetL2dSoundEffect(arg_110_0.flagShip.skinId, var_110_1[1], tonumber(var_110_1[2]))
	else
		var_110_2, var_110_4, var_110_3 = ShipWordHelper.GetWordAndCV(arg_110_0.flagShip.skinId, arg_110_1, nil, nil, var_110_0)
		var_110_5 = ShipWordHelper.GetL2dCvCalibrate(arg_110_0.flagShip.skinId, arg_110_1)
		var_110_6 = ShipWordHelper.GetL2dSoundEffect(arg_110_0.flagShip.skinId, arg_110_1)
	end

	local var_110_8 = var_110_5 == -1

	var_110_5 = arg_110_0.l2dEventFlag and 0 or var_110_5

	return var_110_2, var_110_4, var_110_3, var_110_5, var_110_6, var_110_8
end

function var_0_0.displayShipWord(arg_111_0, arg_111_1)
	if arg_111_0.chatFlag then
		return
	end

	local var_111_0 = arg_111_0.flagShip:getCVIntimacy()
	local var_111_1 = string.split(arg_111_1, "_")
	local var_111_2, var_111_3, var_111_4, var_111_5, var_111_6, var_111_7 = arg_111_0:getCvData(arg_111_1)

	if not var_111_4 or var_111_4 == nil or var_111_4 == "" or var_111_4 == "nil" then
		return
	end

	arg_111_0.chatFlag = true

	if arg_111_0.chatTimer then
		arg_111_0.chatTimer:Stop()

		arg_111_0.chatTimer = nil
	end

	if PLATFORM_CODE == PLATFORM_US then
		setTextEN(arg_111_0._chatText, var_111_4)
	else
		setText(arg_111_0._chatText, SwitchSpecialChar(var_111_4))
	end

	local var_111_8 = arg_111_0._chatText:GetComponent(typeof(Text))

	if #var_111_8.text > CHAT_POP_STR_LEN then
		var_111_8.alignment = TextAnchor.MiddleLeft
	else
		var_111_8.alignment = TextAnchor.MiddleCenter
	end

	local var_111_9 = var_111_8.preferredHeight + 26

	if var_111_9 > arg_111_0.initChatBgH then
		arg_111_0._chatTextBg.sizeDelta = Vector2.New(arg_111_0._chatTextBg.sizeDelta.x, var_111_9)
	else
		arg_111_0._chatTextBg.sizeDelta = Vector2.New(arg_111_0._chatTextBg.sizeDelta.x, arg_111_0.initChatBgH)
	end

	local var_111_10 = arg_111_0.CHAT_SHOW_TIME

	if findTF(arg_111_0._paintingTF, "fitter").childCount > 0 then
		ShipExpressionHelper.SetExpression(findTF(arg_111_0._paintingTF, "fitter"):GetChild(0), arg_111_0.flagShip:getPainting(), arg_111_1, var_111_0, arg_111_0.flagShip.skinId)
	end

	local function var_111_11()
		local function var_112_0()
			arg_111_0._lastChatTween = nil
			arg_111_0.chatFlag = nil

			arg_111_0:startChatTimer()
		end

		if not arg_111_0.showWord then
			var_112_0()

			return
		end

		LeanTween.scale(rtf(arg_111_0._chat.gameObject), Vector3.New(1, 1, 1), arg_111_0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
			arg_111_0._lastChatTween = LeanTween.scale(rtf(arg_111_0._chat.gameObject), Vector3.New(0, 0, 1), arg_111_0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeInBack):setDelay(arg_111_0.CHAT_ANIMATION_TIME + var_111_10):setOnComplete(System.Action(var_112_0))
		end))
	end

	if arg_111_0._delayL2dSeID then
		LeanTween.cancel(arg_111_0._delayL2dSeID)

		arg_111_0._delayL2dSeID = nil
	end

	if arg_111_0.live2dChar and var_111_6 then
		arg_111_0._delayL2dSeID = LeanTween.delayedCall(var_111_6[2], System.Action(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/" .. var_111_6[1])

			arg_111_0._delayL2dSeID = nil
		end)).id
	end

	local var_111_12 = pg.NewStoryMgr.GetInstance():IsRunning()

	if getProxy(ContextProxy):getContextByMediator(NewShipMediator) then
		-- block empty
	elseif var_111_3 and not var_111_12 then
		local function var_111_13()
			if arg_111_0._currentVoice then
				arg_111_0._currentVoice:Stop(true)
			end

			local function var_116_0()
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_111_3, function(arg_118_0)
					if arg_118_0 then
						arg_111_0._currentVoice = arg_118_0.playback
						var_111_10 = arg_118_0:GetLength() * 0.001
					end
				end)
				var_111_11()
			end

			if arg_111_0._delayVoiceTweenID then
				LeanTween.cancel(arg_111_0._delayVoiceTweenID)

				arg_111_0._delayVoiceTweenID = nil
			end

			if arg_111_0.live2dChar and var_111_5 and var_111_5 ~= 0 then
				local var_116_1 = LeanTween.delayedCall(var_111_5, System.Action(function()
					var_116_0()

					arg_111_0._delayVoiceTweenID = nil
				end))

				arg_111_0._delayVoiceTweenID = var_116_1.id
			else
				var_116_0()
			end
		end

		local var_111_14 = ShipWordHelper.RawGetCVKey(arg_111_0.flagShip.skinId)
		local var_111_15 = pg.CriMgr.GetCVBankName(var_111_14)

		pg.CriMgr.GetInstance():LoadCueSheet(var_111_15, function(arg_120_0)
			if arg_120_0 then
				var_111_13()
			else
				var_111_11()
			end
		end)

		arg_111_0.preCvCueSheetName = var_111_15
	elseif var_111_4 then
		var_111_11()
	else
		arg_111_0.chatFlag = false
	end

	removeOnButton(arg_111_0._chat)
	onButton(arg_111_0, arg_111_0._chat, function()
		if arg_111_1 == "mission_complete" or arg_111_1 == "mission" then
			arg_111_0:emit(MainUIMediator.OPEN_TASK)
		elseif arg_111_1 == "collection" then
			arg_111_0:emit(MainUIMediator.OPEN_EVENT)
		elseif arg_111_1 == "event_complete" then
			arg_111_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
		end
	end, SFX_MAIN)
end

function var_0_0.stopCurVoice(arg_122_0)
	if arg_122_0._currentVoice then
		arg_122_0._currentVoice:Stop(true)
	end

	if arg_122_0.preCvCueSheetName then
		pg.CriMgr.GetInstance():UnloadCueSheet(arg_122_0.preCvCueSheetName)

		arg_122_0.preCvCueSheetName = nil
	end
end

function var_0_0.startChatTimer(arg_123_0)
	if arg_123_0.chatFlag or arg_123_0.exited then
		return
	end

	if arg_123_0.chatTimer then
		arg_123_0.chatTimer:Stop()

		arg_123_0.chatTimer = nil
	end

	arg_123_0.chatTimer = Timer.New(function()
		arg_123_0:paintClimax(var_0_0.CHAT_HEIGHT, var_0_0.CHAT_DURATION)

		local var_124_0 = {}

		if getProxy(EventProxy):hasFinishState() and arg_123_0.lastChatEvent ~= "event_complete" then
			table.insert(var_124_0, "event_complete")
		else
			if go(arg_123_0._taskBtn:Find("tip")).activeSelf and arg_123_0.lastChatEvent ~= "mission_complete" then
				table.insert(var_124_0, "mission_complete")
			end

			if getProxy(MailProxy):GetAttachmentCount() > 0 and arg_123_0.lastChatEvent ~= "mail" then
				table.insert(var_124_0, "mail")
			end

			if #var_124_0 == 0 then
				local var_124_1 = arg_123_0.flagShip:getCVIntimacy()

				var_124_0 = var_0_2.filterAssistantEvents(Clone(var_0_2.IdleEvents), arg_123_0.flagShip.skinId, var_124_1)

				if getProxy(TaskProxy):getNotFinishCount() and getProxy(TaskProxy):getNotFinishCount() > 0 and arg_123_0.lastChatEvent ~= "mission" then
					table.insert(var_124_0, "mission")
				end
			end
		end

		arg_123_0.chatTimer:Stop()

		arg_123_0.chatTimer = nil
		arg_123_0.lastChatEvent = var_124_0[math.ceil(math.random(#var_124_0))]

		arg_123_0:AssistantEventEffect(arg_123_0.lastChatEvent)
	end, var_0_0.CHAT_INTERVAL, 1)

	arg_123_0.chatTimer:Start()
end

function var_0_0.initShipChat(arg_125_0)
	if arg_125_0.contextData.isFromLogin then
		arg_125_0.contextData.isFromLogin = nil

		arg_125_0:AssistantEventEffect("event_login")
	elseif getProxy(PlayerProxy):getFlag("battle") then
		getProxy(PlayerProxy):setFlag("battle", nil)
		arg_125_0:AssistantEventEffect("home")
	else
		arg_125_0:startChatTimer()
	end
end

function var_0_0.ShowAssistInfo(arg_126_0, arg_126_1, arg_126_2)
	local var_126_0 = findTF(arg_126_0._paintingTF, "live2d")
	local var_126_1 = findTF(arg_126_0._paintingTF, "spinePainting")
	local var_126_2 = findTF(arg_126_0._paintingBgTf, "spinePainting")
	local var_126_3 = getProxy(SettingsProxy)

	if arg_126_0.live2dChar then
		arg_126_0.live2dChar:Dispose()

		arg_126_0.live2dChar = nil
	end

	if arg_126_0.spinePainting then
		arg_126_0.spinePainting:Dispose()

		arg_126_0.spinePainting = nil
	end

	local var_126_4, var_126_5, var_126_6 = getProxy(SettingsProxy):getSkinPosSetting(arg_126_0.flagShip.skinId)

	if var_126_4 then
		arg_126_0._paintingTF.anchoredPosition = Vector2(var_126_4, var_126_5)
		arg_126_0._paintingTF.localScale = Vector3(var_126_6, var_126_6, 1)
		arg_126_0._paintingBgTf.anchoredPosition = Vector2(var_126_4, var_126_5)
		arg_126_0._paintingBgTf.localScale = Vector3(var_126_6, var_126_6, 1)
	else
		arg_126_0._paintingTF.anchoredPosition = Vector2(var_0_0.PAINT_DEFAULT_POS_X, var_0_0.DEFAULT_HEIGHT)
		arg_126_0._paintingTF.localScale = Vector3.one
		arg_126_0._paintingBgTf.anchoredPosition = Vector2(var_0_0.PAINT_DEFAULT_POS_X, var_0_0.DEFAULT_HEIGHT)
		arg_126_0._paintingBgTf.localScale = Vector3.one
	end

	local var_126_7 = HXSet.autoHxShiftPath("spinepainting/" .. arg_126_1)
	local var_126_8 = PathMgr.FileExists(PathMgr.getAssetBundle(var_126_7))
	local var_126_9 = HXSet.autoHxShiftPath("live2d/" .. arg_126_1)
	local var_126_10 = PathMgr.FileExists(PathMgr.getAssetBundle(var_126_9))

	if var_126_3:getCharacterSetting(arg_126_2.id, SHIP_FLAG_SP) and var_126_8 then
		LeanTween.cancel(go(arg_126_0._paintingTF))

		local var_126_11 = SpinePainting.GenerateData({
			ship = arg_126_2,
			position = Vector3(0, 0, 0),
			parent = var_126_1,
			effectParent = var_126_2
		})

		arg_126_0.spinePainting = SpinePainting.New(var_126_11, function(arg_127_0)
			if arg_126_0.exited then
				arg_127_0:Dispose()

				return
			end

			arg_126_0:initShipChat()

			arg_126_0.paintingLoading = false

			arg_126_0:setChangeBtnInteractable()
		end)
	elseif var_126_3:getCharacterSetting(arg_126_2.id, SHIP_FLAG_L2D) and var_126_10 then
		LeanTween.cancel(go(arg_126_0._paintingTF))

		local var_126_12 = Live2D.GenerateData({
			ship = arg_126_2,
			scale = Vector3(52, 52, 52),
			position = Vector3(0, 0, 100),
			parent = var_126_0
		})

		arg_126_0.live2dChar = Live2D.New(var_126_12, function(arg_128_0)
			if arg_126_0.exited then
				arg_128_0:Dispose()

				return
			end

			arg_126_0:initShipChat()

			arg_126_0.paintingLoading = false

			arg_126_0:setChangeBtnInteractable()
		end)
	else
		SetActive(var_126_0, false)
		setPaintingPrefabAsync(arg_126_0._paintingTF, arg_126_1, "mainNormal", function()
			if arg_126_0.exited then
				retPaintingPrefab(arg_126_0._paintingTF, arg_126_1)

				return
			end

			local var_129_0 = findTF(findTF(arg_126_0._paintingTF, "fitter"):GetChild(0), "Touch")

			if not var_129_0 then
				return
			end

			setActive(var_129_0, true)
			eachChild(var_129_0, function(arg_130_0)
				onButton(arg_126_0, arg_130_0, function()
					if arg_126_0._currentState == var_0_0.STATE_ALL_HIDE and getToggleState(arg_126_0._moveBtn) then
						arg_126_0:switchForm(var_0_0.STATE_MAIN)
					else
						arg_126_0:AssistantEventEffect(var_0_2.getPaintingTouchEvents(arg_130_0.name))
						arg_126_0:paintClimax(var_0_0.TOUCH_HEIGHT, var_0_0.TOUCH_DURATION, var_0_0.TOUCH_LOOP)
					end

					if arg_126_0.flagShip then
						arg_126_0:emit(MainUIMediator.ON_TOUCHSHIP, arg_126_0.flagShip.groupId)
					end
				end)
			end)
			arg_126_0:initShipChat()

			arg_126_0.paintingLoading = false

			arg_126_0:setChangeBtnInteractable()
		end)
		arg_126_0:paintBreath()
	end
end

function var_0_0.AssistantEventEffect(arg_132_0, arg_132_1)
	if not arg_132_1 and arg_132_0.live2dChar and arg_132_0.live2dChar.state == Live2D.STATE_INITED then
		if not Input.mousePosition then
			return
		end

		local var_132_0 = arg_132_0.live2dChar:GetTouchPart()

		if var_132_0 > 0 then
			local var_132_1 = var_0_2.filterAssistantEvents(var_0_2.getAssistantTouchEvents(var_132_0), arg_132_0.flagShip.skinId, 0)

			arg_132_1 = var_132_1[math.ceil(math.random(#var_132_1))]
		else
			local var_132_2 = var_0_2.filterAssistantEvents(var_0_2.IdleEvents, arg_132_0.flagShip.skinId, 0)

			arg_132_1 = var_132_2[math.floor(math.Random(0, #var_132_2)) + 1]
		end
	end

	if not arg_132_1 then
		return
	end

	local var_132_3 = var_0_2.assistantEvents[arg_132_1]
	local var_132_4, var_132_5, var_132_6, var_132_7, var_132_8, var_132_9 = arg_132_0:getCvData(var_132_3.dialog)
	local var_132_10 = false

	if arg_132_0.live2dChar then
		if not var_132_9 then
			arg_132_0.live2dChar:TriggerAction(var_132_3.action)
		else
			var_132_10 = true

			arg_132_0.live2dChar:TriggerAction(var_132_3.action, nil, nil, function()
				arg_132_0:displayShipWord(var_132_3.dialog)
			end)
		end
	end

	if var_132_3.dialog ~= "" and not var_132_10 then
		arg_132_0:displayShipWord(var_132_3.dialog)
	else
		arg_132_0:startChatTimer()
	end
end

function var_0_0.tweenBG(arg_134_0, arg_134_1)
	LeanTween.moveX(rtf(arg_134_0._bg), arg_134_1, var_0_0.EJECT_DURATION):setEase(LeanTweenType.easeInOutExpo)
end

function var_0_0.ejectGimmick(arg_135_0, arg_135_1, arg_135_2, arg_135_3, arg_135_4, arg_135_5, arg_135_6)
	LeanTween.cancel(arg_135_1.gameObject)
	SetActive(arg_135_1, true)

	local var_135_0 = GetOrAddComponent(arg_135_1, "CanvasGroup")

	if not arg_135_0.leans then
		arg_135_0.leans = {}
	end

	if arg_135_2 then
		local var_135_1 = arg_135_0:generateGimmickLean(arg_135_1, arg_135_2, arg_135_3)

		table.insert(arg_135_0.leans, arg_135_1)
		var_135_1:setOnComplete(System.Action(function()
			var_135_0.blocksRaycasts = true

			if arg_135_4 then
				arg_135_4()
			end
		end)):setEase(LeanTweenType.easeInOutExpo):setDelay(arg_135_5 or 0)
	end

	if arg_135_6 then
		var_135_0.alpha = arg_135_6[1]

		LeanTween.alphaCanvas(var_135_0, arg_135_6[2], arg_135_3):setFrom(arg_135_6[1]):setDelay(arg_135_5 or 0)
	end
end

function var_0_0.concealGimmick(arg_137_0, arg_137_1, arg_137_2, arg_137_3)
	GetOrAddComponent(arg_137_1, "CanvasGroup").blocksRaycasts = false

	arg_137_0:generateGimmickLean(arg_137_1, arg_137_2, duration):setOnComplete(System.Action(function()
		SetActive(arg_137_1, false)
	end)):setEase(LeanTweenType.easeInOutExpo):setDelay(arg_137_3 or 0)
end

function var_0_0.generateGimmickLean(arg_139_0, arg_139_1, arg_139_2, arg_139_3)
	arg_139_3 = arg_139_3 or var_0_0.EJECT_DURATION

	local var_139_0 = arg_139_1:GetComponent("RectTransform").rect
	local var_139_1

	if arg_139_2 == var_0_0.DIRECTION_RIGHT then
		var_139_1 = LeanTween.moveX(rtf(arg_139_1), var_139_0.width, arg_139_3)
	elseif arg_139_2 == var_0_0.DIRECTION_LEFT then
		var_139_1 = LeanTween.moveX(rtf(arg_139_1), var_139_0.width * -1, arg_139_3)
	elseif arg_139_2 == var_0_0.DIRECTION_UP then
		var_139_1 = LeanTween.moveY(rtf(arg_139_1), var_139_0.height, arg_139_3)
	elseif arg_139_2 == var_0_0.DIRECTION_DOWN then
		var_139_1 = LeanTween.moveY(rtf(arg_139_1), var_139_0.height * -1, arg_139_3)
	elseif arg_139_2 == var_0_0.DIRECTION_DOWN_RIGHT then
		var_139_1 = LeanTween.moveY(rtf(arg_139_1), Vector3(var_139_0.width, var_139_0.height * -1, 0), arg_139_3)
	elseif arg_139_2 == var_0_0.DIRECTION_UP_LEFT then
		var_139_1 = LeanTween.move(rtf(arg_139_1), Vector3(var_139_0.width * -1, var_139_0.height, 0), arg_139_3)
	elseif arg_139_2 == var_0_0.REVERT_VERTICAL then
		var_139_1 = LeanTween.moveY(rtf(arg_139_1), 0, arg_139_3)
	elseif arg_139_2 == var_0_0.REVERT_HERIZONTAL then
		var_139_1 = LeanTween.moveX(rtf(arg_139_1), 0, arg_139_3)
	elseif arg_139_2 == var_0_0.REVERT_HERIZONTAL_VERTICAL then
		var_139_1 = LeanTween.move(rtf(arg_139_1), Vector3(0, 0, 0), arg_139_3)
	end

	return var_139_1
end

function var_0_0.updatePlayerInfo(arg_140_0, arg_140_1)
	arg_140_0._player = arg_140_1

	arg_140_0._resPanel:setResources(arg_140_1)
	arg_140_0:setProfileInfo(arg_140_1, arg_140_0.ships)
end

function var_0_0.setProfileInfo(arg_141_0, arg_141_1, arg_141_2)
	setText(arg_141_0._nameLabel, arg_141_1.name)
	setText(arg_141_0._levelLabel, "LV." .. arg_141_1.level)

	local var_141_0 = getConfigFromLevel1(pg.user_level, arg_141_1.level)

	if arg_141_1.level == arg_141_0._player:getMaxLevel() then
		arg_141_0._expBar.value = 1
	else
		arg_141_0._expBar.value = arg_141_1.exp / var_141_0.exp_interval
	end

	if not getProxy(PlayerProxy):getFlag("battle") then
		local var_141_1 = arg_141_2[arg_141_1.characters[getProxy(SettingsProxy):getCurrentSecretaryIndex()]]:getPainting()

		arg_141_0:loadChar(var_141_1)
	end
end

function var_0_0.updateBuffList(arg_142_0, arg_142_1)
	local var_142_0 = UIItemList.New(arg_142_0._buffList, arg_142_0._buffTpl)

	var_142_0:make(function(arg_143_0, arg_143_1, arg_143_2)
		if arg_143_0 == UIItemList.EventUpdate then
			local var_143_0 = arg_142_1[arg_143_1 + 1]

			if var_143_0.IsVirtualIcon then
				arg_142_0:RefreshBtn(arg_143_2, var_143_0)

				if var_143_0.UpdateButton then
					var_143_0.UpdateButton(arg_142_0, arg_143_2)
				end
			else
				LoadImageSpriteAsync(var_143_0:getConfig("icon"), arg_143_2)
				onButton(arg_142_0, arg_143_2, function()
					if arg_142_0._buffTextTimer then
						arg_142_0._buffTextTimer:Stop()
					end

					if arg_142_0._buffTimeCountDownTimer then
						arg_142_0._buffTimeCountDownTimer:Stop()
					end

					setActive(arg_142_0._buffText, true)

					local var_144_0 = var_143_0:getConfig("desc")

					if var_143_0:getConfig("max_time") > 0 then
						local var_144_1 = pg.TimeMgr:GetInstance():GetServerTime()
						local var_144_2 = var_143_0.timestamp

						if var_144_2 then
							local var_144_3 = var_144_2 - var_144_1
							local var_144_4 = pg.TimeMgr.GetInstance():DescCDTime(var_144_3)

							setText(arg_142_0._buffText:Find("Text"), string.gsub(var_144_0, "$" .. 1, var_144_4))

							arg_142_0._buffTimeCountDownTimer = Timer.New(function()
								if var_144_3 > 0 then
									var_144_3 = var_144_3 - 1

									local var_145_0 = pg.TimeMgr.GetInstance():DescCDTime(var_144_3)

									setText(arg_142_0._buffText:Find("Text"), string.gsub(var_144_0, "$" .. 1, var_145_0))
								else
									arg_142_0._buffTimeCountDownTimer:Stop()
									setActive(arg_142_0._buffText, false)
									setActive(arg_143_2, false)
								end
							end, 1, -1)

							arg_142_0._buffTimeCountDownTimer:Start()
						end
					else
						setText(arg_142_0._buffText:Find("Text"), var_144_0)
					end

					arg_142_0._buffTextTimer = Timer.New(function()
						setActive(arg_142_0._buffText, false)

						if arg_142_0._buffTimeCountDownTimer ~= nil then
							arg_142_0._buffTimeCountDownTimer:Stop()
						end
					end, var_0_0.BUFFTEXT_SHOW_TIME, 1)

					arg_142_0._buffTextTimer:Start()
				end, SFX_PANEL)
			end
		end
	end)
	var_142_0:align(#arg_142_1)
end

function var_0_0.setChangeBtnInteractable(arg_147_0)
	arg_147_0._changeBtn:GetComponent(typeof(Button)).interactable = not arg_147_0.paintingLoading and not arg_147_0.bgLoading
end

function var_0_0.updateFlagShip(arg_148_0, arg_148_1)
	if not arg_148_0.live2dChar and arg_148_0.flagShip then
		retPaintingPrefab(arg_148_0._paintingTF, arg_148_0.flagShip:getPainting())
	end

	arg_148_0.flagShip = arg_148_1

	local var_148_0 = arg_148_1:getPainting()

	arg_148_0:ShowAssistInfo(var_148_0, arg_148_1)

	if not (getProxy(SettingsProxy):getCharacterSetting(arg_148_1.id, SHIP_FLAG_L2D) and isHalfBodyLive2D(var_148_0)) then
		rtf(arg_148_0._paintingTF).anchorMin = Vector2(0.5, 0.5)
		rtf(arg_148_0._paintingTF).anchorMax = Vector2(0.5, 0.5)
		rtf(arg_148_0._paintingTF).pivot = Vector2(0.5, 0.5)
	else
		rtf(arg_148_0._paintingTF).anchorMin = Vector2(0.5, 0)
		rtf(arg_148_0._paintingTF).anchorMax = Vector2(0.5, 0)
		rtf(arg_148_0._paintingTF).pivot = Vector2(0.5, 0)
	end

	local var_148_1
	local var_148_2 = pg.ship_skin_template[arg_148_0.flagShip.skinId].main_UI_FX

	if var_148_2 ~= "" then
		var_148_1 = var_148_2
	elseif arg_148_1.propose then
		var_148_1 = "jiehuntexiao"
	end

	setActive(arg_148_0.effectTF, var_148_1 ~= nil)

	if arg_148_0._paintingFX then
		local var_148_3 = arg_148_0._paintingFX.name
		local var_148_4 = arg_148_0._paintingFX.obj

		PoolMgr.GetInstance():ReturnPrefab("Effect/" .. var_148_3, var_148_3, var_148_4)

		arg_148_0._paintingFX = nil
	end

	if var_148_1 then
		PoolMgr.GetInstance():GetPrefab("Effect/" .. var_148_1, var_148_1, true, function(arg_149_0)
			if not arg_148_0.exited then
				arg_148_0._paintingFX = {
					name = var_148_1,
					obj = arg_149_0
				}

				local var_149_0 = arg_149_0.transform

				var_149_0:SetParent(arg_148_0.effectTF, true)

				var_149_0.localPosition = Vector3.zero
				var_149_0.localScale = Vector3.one
			else
				PoolMgr.GetInstance():ReturnPrefab("Effect/" .. var_148_1, var_148_1, arg_149_0)
			end
		end)
	end

	if arg_148_0.flagShip then
		local var_148_5 = getProxy(SettingsProxy):getCharacterSetting(arg_148_0.flagShip.id, SHIP_FLAG_BG)
		local var_148_6 = arg_148_0.flagShip:getShipBgPrint()
		local var_148_7 = arg_148_0._bg:Find("bg")

		if var_148_6 ~= arg_148_0.flagShip:rarity2bgPrintForGet() and var_148_5 then
			pg.DynamicBgMgr.GetInstance():LoadBg(arg_148_0, var_148_6, arg_148_0._bg, var_148_7, function(arg_150_0)
				arg_148_0.bgLoading = false

				arg_148_0:setChangeBtnInteractable()

				rtf(arg_150_0).localPosition = Vector3(0, 0, 200)
			end, function(arg_151_0)
				arg_148_0.bgLoading = false

				arg_148_0:setChangeBtnInteractable()

				arg_148_0.defaultBgSprite = getImageSprite(var_148_7)
			end)
		else
			pg.DynamicBgMgr.GetInstance():ClearBg(arg_148_0:getUIName())
			setActive(var_148_7, true)
			arg_148_0:setBG()
		end
	end
end

function var_0_0.setFlagShip(arg_152_0, arg_152_1)
	arg_152_0.tempFlagShip = arg_152_1
end

function var_0_0.notifyActivitySummary(arg_153_0, arg_153_1, arg_153_2)
	arg_153_0._activitySummaryBtn = arg_153_0:findTF("activityButton", arg_153_0._ActivityBtns)

	setActive(arg_153_0._activitySummaryBtn, true)

	local var_153_0 = arg_153_0._activitySummaryBtn:Find("Tip/Text")

	setActive(var_153_0.parent, arg_153_1 > 0)

	if arg_153_1 > 0 then
		setText(var_153_0, arg_153_1)
	end

	onButton(arg_153_0, arg_153_0._activitySummaryBtn, function()
		if arg_153_2 then
			arg_153_0:emit(MainUIMediator.OPEN_ACTIVITY_PANEL, arg_153_2.id)
		else
			arg_153_0:emit(MainUIMediator.OPEN_ACTIVITY_PANEL)
		end
	end, SFX_PANEL)
end

function var_0_0.updateChat(arg_155_0, arg_155_1)
	if arg_155_0.exited then
		return
	end

	if arg_155_0.hideChatFlag and arg_155_0.hideChatFlag == 1 then
		return
	end

	for iter_155_0 = arg_155_0._chatList.childCount, #arg_155_1 - 1 do
		cloneTplTo(arg_155_0._chatItem, arg_155_0._chatList)
	end

	local var_155_0 = arg_155_0._chatList.childCount

	setActive(arg_155_0._chatEmptySign, PLATFORM_CODE == PLATFORM_JP and var_155_0 <= 0)

	for iter_155_1 = 0, var_155_0 - 1 do
		arg_155_0._chatList:GetChild(iter_155_1).gameObject:SetActive(iter_155_1 < #arg_155_1)
	end

	for iter_155_2, iter_155_3 in ipairs(arg_155_1) do
		local var_155_1 = arg_155_0._chatList:GetChild(iter_155_2 - 1)

		arg_155_0:findTF("channel", var_155_1):GetComponent("Image").sprite = GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(iter_155_3.type) .. "_1920", true)

		local var_155_2 = arg_155_0:findTF("text", var_155_1):GetComponent("RichText")

		if iter_155_3.type == ChatConst.ChannelPublic then
			var_155_2.supportRichText = true

			ChatProxy.InjectPublic(var_155_2, iter_155_3, true)
		elseif iter_155_3:IsWorldBossNotify() then
			var_155_2.supportRichText = true
			var_155_2.text = i18n("ad_4", iter_155_3.args.supportType, iter_155_3.args.playerName, iter_155_3.args.bossName, iter_155_3.args.level)
		else
			var_155_2.supportRichText = iter_155_3.emojiId ~= nil

			local var_155_3 = false
			local var_155_4 = iter_155_3.player.name .. ": " .. iter_155_3.content
			local var_155_5 = false

			for iter_155_4 in string.gmatch(var_155_4, ChatConst.EmojiIconCodeMatch) do
				if table.contains(pg.emoji_small_template.all, tonumber(iter_155_4)) then
					var_155_5 = true

					local var_155_6 = pg.emoji_small_template[tonumber(iter_155_4)]
					local var_155_7 = LoadSprite("emoji/" .. var_155_6.pic .. "_small", nil)

					var_155_2:AddSprite(iter_155_4, var_155_7)
				end
			end

			if not iter_155_3.emojiId then
				if var_155_5 then
					var_155_4 = shortenString(var_155_4, 20)
				else
					var_155_4 = shortenString(var_155_4, 24)
				end
			end

			var_155_2.text = string.gsub(var_155_4, ChatConst.EmojiIconCodeMatch, function(arg_156_0)
				if table.contains(pg.emoji_small_template.all, tonumber(arg_156_0)) then
					return string.format("<icon name=%s w=0.7 h=0.7/>", arg_156_0)
				end
			end)
		end
	end
end

function var_0_0.clearChat(arg_157_0, arg_157_1)
	childCount = arg_157_0._chatList.childCount

	for iter_157_0 = 0, childCount - 1 do
		arg_157_0._chatList:GetChild(iter_157_0).gameObject:SetActive(false)
	end
end

function var_0_0.updateBanner(arg_158_0, arg_158_1)
	local var_158_0 = arg_158_0:findTF("eventPanel/mask/event", arg_158_0._rightPanel):GetComponent("HScrollSnap")

	var_158_0:Init()

	local var_158_1 = arg_158_0:findTF("content", var_158_0)
	local var_158_2 = arg_158_0:findTF("item", var_158_0)
	local var_158_3 = arg_158_0:findTF("eventPanel/dots", arg_158_0._rightPanel)
	local var_158_4 = arg_158_0:findTF("eventPanel/dot", arg_158_0._rightPanel)

	setActive(var_158_2, false)
	setActive(var_158_4, false)

	for iter_158_0 = 0, #arg_158_1 - 1 do
		cloneTplTo(var_158_4, var_158_3)

		local var_158_5 = arg_158_1[iter_158_0 + 1]
		local var_158_6 = Instantiate(var_158_2)

		LoadImageSpriteAsync("activitybanner/" .. var_158_5.pic, var_158_6)
		var_158_0:AddChild(var_158_6)
		onButton(arg_158_0, var_158_6, function()
			if var_158_5.type == GAMEUI_BANNER_1 then
				Application.OpenURL(var_158_5.param)
			elseif var_158_5.type == GAMEUI_BANNER_2 then
				arg_158_0:emit(MainUIMediator.GO_SCENE, var_158_5.param)
			elseif var_158_5.type == GAMEUI_BANNER_3 then
				arg_158_0:emit(MainUIMediator.OPEN_ACTIVITY_PANEL, tonumber(var_158_5.param))
			elseif var_158_5.type == GAMEUI_BANNER_4 then
				arg_158_0:emit(MainUIMediator.OPEN_SHOP_LAYER, var_158_5.param)
			elseif var_158_5.type == GAMEUI_BANNER_5 then
				arg_158_0:emit(MainUIMediator.OPEN_SCROLL, tonumber(var_158_5.param))
			elseif var_158_5.type == GAMEUI_BANNER_6 then
				arg_158_0:emit(MainUIMediator.OPEN_TECHNOLOGY)
			elseif var_158_5.type == GAMEUI_BANNER_7 then
				arg_158_0:emit(MainUIMediator.GO_MINI_GAME, var_158_5.param[1])
			elseif var_158_5.type == GAMEUI_BANNER_8 then
				arg_158_0:emit(MainUIMediator.OPEN_GUILD)
			end
		end, SFX_MAIN)

		local var_158_7 = findTF(var_158_6, "red")

		setActive(var_158_7, false)

		if var_158_5.type == 3 and tonumber(var_158_5.param) == nil then
			local var_158_8 = getProxy(ActivityProxy)

			setActive(var_158_7, var_158_8:readyToAchieveByType(ActivityConst.ACTIVITY_TYPE_LEVELAWARD))
		end

		var_158_6:SetActive(true)
	end

	var_158_0.autoSnap = 5
	arg_158_0.bannerSnap = var_158_0
	arg_158_0.bannerContent = var_158_1
	arg_158_0.bannerDots = var_158_3
end

function var_0_0.activeEffect(arg_160_0, arg_160_1)
	setActive(arg_160_0._paintingTF, arg_160_1)
	setActive(arg_160_0._linkBtns, arg_160_1)
end

function var_0_0.resetCommissionBtn(arg_161_0)
	LeanTween.moveX(arg_161_0._commissionBtn, 0, 0.2)
end

function var_0_0.updateExSkinBtn(arg_162_0, arg_162_1)
	setActive(arg_162_0.exSkinBtn, #arg_162_1 > 0)

	if #arg_162_1 > 0 then
		onButton(arg_162_0, arg_162_0.exSkinBtn, function()
			arg_162_0:showExSkinWindow(arg_162_1)
		end, SFX_PANEL)
	end

	local var_162_0 = arg_162_0._buffList.localPosition

	arg_162_0._buffList.localPosition = Vector3(#arg_162_1 > 0 and 390 or 285, var_162_0.y, var_162_0.z)

	local var_162_1 = arg_162_0._buffList.localPosition

	arg_162_0._buffText.localPosition = Vector3(#arg_162_1 > 0 and 339 or 234, -90, var_162_1.z)
end

function var_0_0.showExSkinWindow(arg_164_0, arg_164_1)
	arg_164_0.skinExperienceDiplayPage:ExecuteAction("Show", arg_164_1)
end

function var_0_0.showOverDueExSkins(arg_165_0, arg_165_1)
	arg_165_0.skinExpireDisplayPage:ExecuteAction("Show", arg_165_1)
end

function var_0_0.resumePaitingState(arg_166_0)
	GetOrAddComponent(arg_166_0._tf, typeof(CanvasGroup)).blocksRaycasts = true
	GetOrAddComponent(arg_166_0._paintingTF, typeof(CanvasGroup)).alpha = 1
end

function var_0_0.willExit(arg_167_0)
	if arg_167_0._paintingTimer then
		arg_167_0._paintingTimer:Stop()

		arg_167_0._paintingTimer = nil
	end

	if arg_167_0.redDotHelper then
		arg_167_0.redDotHelper:Dispose()

		arg_167_0.redDotHelper = nil
	end

	arg_167_0:disablePartialBlur()

	if arg_167_0.leans then
		for iter_167_0, iter_167_1 in ipairs(arg_167_0.leans) do
			LeanTween.cancel(go(iter_167_1))
		end

		arg_167_0.leans = {}
	end

	LeanTween.cancel(go(arg_167_0._paintingTF))
	arg_167_0:resumePaitingState()
	LeanTween.cancel(arg_167_0._chat.gameObject)

	if arg_167_0._delayVoiceTweenID then
		LeanTween.cancel(arg_167_0._delayVoiceTweenID)

		arg_167_0._delayVoiceTweenID = nil
	end

	if arg_167_0._delayL2dSeID then
		LeanTween.cancel(arg_167_0._delayL2dSeID)

		arg_167_0._delayL2dSeID = nil
	end

	if arg_167_0._paintingFX then
		local var_167_0 = arg_167_0._paintingFX.name
		local var_167_1 = arg_167_0._paintingFX.obj

		PoolMgr.GetInstance():ReturnPrefab("Effect/" .. var_167_0, var_167_0, var_167_1)

		arg_167_0._paintingFX = nil
	end

	if arg_167_0.chatTimer then
		arg_167_0.chatTimer:Stop()

		arg_167_0.chatTimer = nil
	end

	pg.TimeMgr.GetInstance():RemoveTimer(arg_167_0._timeSchedule)

	arg_167_0._timeSchedule = nil

	if arg_167_0._resPanel then
		arg_167_0._resPanel:exit()

		arg_167_0._resPanel = nil
	end

	if arg_167_0.flagShip then
		retPaintingPrefab(arg_167_0._paintingTF, arg_167_0.flagShip:getPainting())
	end

	if arg_167_0.live2dChar then
		arg_167_0.live2dChar:Dispose()

		arg_167_0.live2dChar = nil
	end

	if arg_167_0.spinePainting then
		arg_167_0.spinePainting:Dispose()

		arg_167_0.spinePainting = nil
	end

	for iter_167_2 = arg_167_0.bannerContent.childCount - 1, 0, -1 do
		clearImageSprite(arg_167_0.bannerContent:GetChild(iter_167_2))
		Destroy(arg_167_0.bannerSnap:RemoveChild(iter_167_2))
	end

	removeAllChildren(arg_167_0.bannerDots)

	if arg_167_0._currentVoice then
		arg_167_0._currentVoice:Stop(true)
	end

	arg_167_0._currentVoice = nil

	arg_167_0:stopCurVoice()
	setActive(arg_167_0._bg:Find("bg"), true)

	if arg_167_0.defaultBgSprite then
		setImageSprite(arg_167_0._bg:Find("bg"), arg_167_0.defaultBgSprite)

		arg_167_0.defaultBgSprite = nil
	end

	if arg_167_0._buffTextTimer then
		arg_167_0._buffTextTimer:Stop()

		arg_167_0._buffTextTimer = nil
	end

	if arg_167_0._buffTimeCountDownTimer then
		arg_167_0._buffTimeCountDownTimer:Stop()

		arg_167_0._buffTimeCountDownTimer = nil
	end

	arg_167_0:recycleSpineChar()
	arg_167_0.skinExpireDisplayPage:Destroy()

	arg_167_0.skinExpireDisplayPage = nil

	arg_167_0.attireExpireDisplayPage:Destroy()

	arg_167_0.attireExpireDisplayPage = nil

	arg_167_0.skinExperienceDiplayPage:Destroy()

	arg_167_0.skinExperienceDiplayPage = nil

	arg_167_0.secondaryPage:Destroy()

	arg_167_0.secondaryPage = nil
end

function var_0_0.sethideChatBtn(arg_168_0)
	local var_168_0 = arg_168_0.hideChatFlag and arg_168_0.hideChatFlag == 1

	setActive(arg_168_0._chatActBtn, var_168_0)
	setActive(arg_168_0._chatActBtnDisable, not var_168_0)

	if var_168_0 then
		arg_168_0:clearChat()
	end

	arg_168_0._chatBg:GetComponent(typeof(Button)).enabled = not var_168_0
	arg_168_0._chatBtn:GetComponent(typeof(Button)).enabled = not var_168_0
end

function var_0_0.showOverDueAttire(arg_169_0, arg_169_1)
	arg_169_0.attireExpireDisplayPage:ExecuteAction("Show", arg_169_1)
end

function var_0_0.loadChar(arg_170_0, arg_170_1)
	if not arg_170_0.shipPrefab then
		arg_170_0.shipPrefab = arg_170_1

		pg.UIMgr.GetInstance():LoadingOn()
		PoolMgr.GetInstance():GetSpineChar(arg_170_1, true, function(arg_171_0)
			pg.UIMgr.GetInstance():LoadingOff()

			arg_170_0.shipModel = arg_171_0
			tf(arg_171_0).localScale = Vector3(0.75, 0.75, 1)

			local var_171_0 = var_0_3[arg_170_1]
			local var_171_1 = var_171_0 and var_171_0.mainui_shift[1] or 0
			local var_171_2 = -130 + (var_171_0 and var_171_0.mainui_shift[2] or 0)

			tf(arg_171_0).localPosition = Vector3(var_171_1, var_171_2, 0)

			setParent(arg_171_0, arg_170_0._icon)
			arg_171_0:GetComponent("SpineAnimUI"):SetAction("normal", 0)
		end)
	end
end

function var_0_0.recycleSpineChar(arg_172_0)
	if arg_172_0.shipPrefab and arg_172_0.shipModel then
		PoolMgr.GetInstance():ReturnSpineChar(arg_172_0.shipPrefab, arg_172_0.shipModel)

		arg_172_0.shipPrefab = nil
		arg_172_0.shipModel = nil
	end
end

function var_0_0.checkRefundInfo(arg_173_0, arg_173_1)
	if getProxy(PlayerProxy):getRefundInfo() then
		local var_173_0 = getProxy(ServerProxy)
		local var_173_1 = true

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideClose = true,
			content = i18n("Supplement_pay1"),
			onYes = function()
				if var_173_1 then
					arg_173_0:emit(MainUIMediator.GO_SCENE, {
						SCENE.BACK_CHARGE
					})
				else
					Application.Quit()
				end

				arg_173_1()
			end,
			onNo = function()
				arg_173_0:emit(MainUIMediator.LOG_OUT)
			end,
			yesText = i18n("Supplement_pay4"),
			noText = i18n("word_back")
		})
	end
end

return var_0_0
