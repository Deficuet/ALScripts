pg = pg or {}
pg.UserAgreementMgr = singletonClass("UserAgreementMgr")

local var_0_0 = pg.UserAgreementMgr
local var_0_1 = "UserAgreementUI"
local var_0_2 = 0
local var_0_3 = 1
local var_0_4 = 2

function var_0_0.Init(arg_1_0, arg_1_1)
	arg_1_0.state = var_0_2

	if arg_1_1 then
		arg_1_1()
	end
end

function var_0_0.Show(arg_2_0, arg_2_1)
	arg_2_0.onClose = arg_2_1.onClose
	arg_2_0.content = arg_2_1.content
	arg_2_0.forceRead = arg_2_1.forceRead
	arg_2_0.title = arg_2_1.title

	if arg_2_0.state == var_0_2 then
		arg_2_0:LoadUI()
	elseif arg_2_0.state == var_0_4 then
		arg_2_0:Flush()
	elseif arg_2_0.state == var_0_3 then
		-- block empty
	end
end

function var_0_0.LoadUI(arg_3_0)
	arg_3_0.state = var_0_3

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetUI(var_0_1, true, function(arg_4_0)
		arg_3_0.state = var_0_4

		pg.UIMgr.GetInstance():LoadingOff()

		arg_3_0._go = arg_4_0

		arg_3_0:OnLoaded()
		arg_3_0:Flush()
		setActive(arg_3_0._go, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_3_0._go.transform)
	end)
end

function var_0_0.OnLoaded(arg_5_0)
	arg_5_0.contentTxt = arg_5_0._go.transform:Find("window/container/scrollrect/content/Text"):GetComponent(typeof(Text))
	arg_5_0.acceptBtn = arg_5_0._go.transform:Find("window/accept_btn")
	arg_5_0.acceptBtnTxt = arg_5_0.acceptBtn:Find("Text"):GetComponent(typeof(Text))
	arg_5_0.scrollrect = arg_5_0._go.transform:Find("window/container/scrollrect"):GetComponent(typeof(ScrollRect))
	arg_5_0.titleTxt = arg_5_0._go.transform:Find("window/title"):GetComponent(typeof(Text))
	arg_5_0.msgboxTitleTxt = arg_5_0._go.transform:Find("window/title1/Text"):GetComponent(typeof(Text))
end

function var_0_0.Flush(arg_6_0)
	arg_6_0.msgboxTitleTxt.text = i18n("title_info")
	arg_6_0.contentTxt.text = arg_6_0.content
	arg_6_0.acceptBtnTxt.text = i18n("word_back")
	arg_6_0.titleTxt.text = arg_6_0.title

	local var_6_0 = not arg_6_0.forceRead

	onButton(nil, arg_6_0.acceptBtn, function()
		if var_6_0 then
			arg_6_0:Hide()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("read_the_user_agreement"))
		end
	end)
	onScroll(nil, arg_6_0.scrollrect.gameObject, function(arg_8_0)
		if arg_8_0.y <= 0.01 and not var_6_0 then
			var_6_0 = true

			setButtonEnabled(arg_6_0.acceptBtn, var_6_0)
		end
	end)
	setButtonEnabled(arg_6_0.acceptBtn, var_6_0)
	scrollTo(arg_6_0.scrollrect.gameObject, 0, 1)
end

function var_0_0.Hide(arg_9_0)
	if arg_9_0.onClose then
		arg_9_0.onClose()
	end

	if arg_9_0.acceptBtn then
		removeOnButton(arg_9_0.acceptBtn)
	end

	if arg_9_0.scrollrect then
		arg_9_0.scrollrect.onValueChanged:RemoveAllListeners()
	end

	arg_9_0.onClose = nil
	arg_9_0.content = nil
	arg_9_0.forceRead = nil
	arg_9_0.title = nil

	if arg_9_0._go then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_9_0._go.transform, pg.UIMgr.GetInstance().UIMain)
		PoolMgr.GetInstance():ReturnUI(var_0_1, arg_9_0._go)

		arg_9_0._go = nil
	end

	arg_9_0.state = var_0_2
end

function var_0_0.ShowForBiliPrivate(arg_10_0)
	local var_10_0 = require("GameCfg.useragreems.BiliPrivate")

	arg_10_0:Show({
		content = var_10_0.content,
		title = var_10_0.title
	})
end

function var_0_0.ShowForBiliLicence(arg_11_0)
	local var_11_0 = require("GameCfg.useragreems.BiliLicence")

	arg_11_0:Show({
		content = var_11_0.content,
		title = var_11_0.title
	})
end

function var_0_0.ShowChtPrivate(arg_12_0)
	local var_12_0 = require("GameCfg.useragreems.ChtPrivate")

	arg_12_0:Show({
		content = var_12_0.content,
		title = var_12_0.title
	})
end

function var_0_0.ShowChtLicence(arg_13_0)
	local var_13_0 = require("GameCfg.useragreems.ChtLicence")

	arg_13_0:Show({
		content = var_13_0.content,
		title = var_13_0.title
	})
end
