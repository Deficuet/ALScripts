local var_0_0 = class("ResourcePage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ResourcePage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.titleTxt = arg_2_0:findTF("frame/title/text"):GetComponent(typeof(Text))
	arg_2_0.iconImg = arg_2_0:findTF("frame/title/icon"):GetComponent(typeof(Image))
	arg_2_0.closeBtn = arg_2_0:findTF("frame/btnBack")
	arg_2_0.descTxt = arg_2_0:findTF("frame/content/describe/class"):GetComponent(typeof(Text))
	arg_2_0.levelTxt = arg_2_0:findTF("frame/title/icon/current"):GetComponent(typeof(Text))
	arg_2_0.currentLevelTxt = arg_2_0:findTF("frame/content/info/level/curr"):GetComponent(typeof(Text))
	arg_2_0.nextLevelTxt = arg_2_0:findTF("frame/content/info/level/next"):GetComponent(typeof(Text))
	arg_2_0.costTxt = arg_2_0:findTF("frame/content/upgrade_btn/cost"):GetComponent(typeof(Text))
	arg_2_0.spendTimeTxt = arg_2_0:findTF("frame/upgrade_duration/Text"):GetComponent(typeof(Text))
	arg_2_0.upgradeBtn = arg_2_0:findTF("frame/content/upgrade_btn")
	arg_2_0.upgradingBtn = arg_2_0:findTF("frame/content/upgrading_block")
	arg_2_0.attrUIlist = UIItemList.New(arg_2_0:findTF("frame/content/info/conent"), arg_2_0:findTF("frame/content/info/conent/tpl"))

	setText(arg_2_0.upgradeBtn:Find("Image"), i18n("word_levelup"))
	setText(arg_2_0.upgradingBtn:Find("Image"), i18n("class_label_upgrading"))
	setText(arg_2_0:findTF("frame/content/upgrade_btn/costback/label"), i18n("text_consume"))
	setText(arg_2_0:findTF("frame/upgrade_duration/Image/Text"), i18n("class_label_upgradetime"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.upgradeBtn, function()
		if arg_3_0:CheckUpgrade() then
			arg_3_0:OnUpgrade()
		end
	end, SFX_PANEL)
	arg_3_0.attrUIlist:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateResourceFieldAttr(arg_3_0.attrs[arg_7_1 + 1], arg_7_2)
		end
	end)
end

function var_0_0.Flush(arg_8_0, arg_8_1)
	arg_8_0:Update(arg_8_1)
	arg_8_0:Show()
end

function var_0_0.Update(arg_9_0, arg_9_1)
	arg_9_0.resourceField = arg_9_1

	arg_9_0:Refresh()
end

function var_0_0.CheckUpgrade(arg_10_0)
	if not arg_10_0.resourceField:CanUpgrade() then
		if arg_10_0.resourceField:IsMaxLevel() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("class_res_maxlevel_tip"))
		elseif not arg_10_0.resourceField:IsReachLevel() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_limit_level", arg_10_0.resourceField:GetTargetLevel()))
		elseif not arg_10_0.resourceField:IsReachRes() then
			local var_10_0 = arg_10_0.resourceField:GetTargetRes()
			local var_10_1 = getProxy(PlayerProxy):getRawData().gold

			GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
				{
					59001,
					var_10_0 - var_10_1,
					var_10_0
				}
			})
		end

		return false
	end

	return true
end

function var_0_0.OnUpgrade(arg_11_0)
	local var_11_0 = arg_11_0.resourceField:GetUpgradeType()

	arg_11_0:emit(NavalAcademyMediator.UPGRADE_FIELD, var_11_0)
end

function var_0_0.Refresh(arg_12_0)
	local var_12_0 = arg_12_0.resourceField
	local var_12_1 = var_12_0:GetKeyWord()

	arg_12_0.iconImg.sprite = GetSpriteFromAtlas("ui/ResourceFieldUI_atlas", var_12_1)
	arg_12_0.titleTxt.text = var_12_0:GetName()

	local var_12_2 = arg_12_0.resourceField

	arg_12_0.descTxt.text = var_12_2:GetDesc()

	local var_12_3 = "Lv." .. var_12_2:GetLevel()

	arg_12_0.levelTxt.text = var_12_3

	local var_12_4 = var_12_2:IsMaxLevel()
	local var_12_5 = var_12_4 and "Lv.Max" or "Lv." .. var_12_2:GetLevel() + 1

	arg_12_0.currentLevelTxt.text = var_12_3
	arg_12_0.nextLevelTxt.text = var_12_5

	local var_12_6 = var_12_4 and "-" or var_12_2:GetCost().count
	local var_12_7 = var_12_2:IsReachRes() and COLOR_WHITE or COLOR_RED

	arg_12_0.costTxt.text = "<color=" .. var_12_7 .. ">" .. var_12_6 .. "</color>"

	arg_12_0:FlushState()
end

function var_0_0.FlushState(arg_13_0)
	local var_13_0 = arg_13_0.resourceField
	local var_13_1 = var_13_0:IsMaxLevel()
	local var_13_2 = var_13_0:IsStarting()

	setActive(arg_13_0.upgradeBtn, not var_13_2)
	setActive(arg_13_0.upgradingBtn, var_13_2)
	setGray(arg_13_0.upgradeBtn, var_13_1, true)
	arg_13_0:RemoveTimer()

	if var_13_2 then
		arg_13_0:AddTimer()
	else
		local var_13_3 = var_13_1 and "-" or pg.TimeMgr.GetInstance():DescCDTime(var_13_0:GetSpendTime())

		arg_13_0.spendTimeTxt.text = var_13_3
	end

	arg_13_0:UpdateResourceFieldAttrs()
end

function var_0_0.UpdateResourceFieldAttrs(arg_14_0)
	arg_14_0.attrs = arg_14_0.resourceField:GetEffectAttrs()

	arg_14_0.attrUIlist:align(#arg_14_0.attrs)
end

function var_0_0.UpdateResourceFieldAttr(arg_15_0, arg_15_1, arg_15_2)
	setText(arg_15_2:Find("label"), arg_15_1:GetName())
	setText(arg_15_2:Find("advance"), "[+" .. arg_15_1:GetAdditionDesc() .. "]")

	local var_15_0 = arg_15_1:GetValue()
	local var_15_1 = arg_15_1:GetNextValue()
	local var_15_2 = arg_15_1:GetMaxValue()

	setFillAmount(arg_15_2:Find("curr"), var_15_0 / var_15_2)
	setFillAmount(arg_15_2:Find("prev"), var_15_1 / var_15_2)
	LeanTween.cancel(go(arg_15_2:Find("prev")))
	blinkAni(arg_15_2:Find("prev"), 0.8, -1, 0.3):setFrom(1)
	setText(arg_15_2:Find("current"), arg_15_1:GetProgressDesc())
end

function var_0_0.AddTimer(arg_16_0)
	local var_16_0 = arg_16_0.resourceField:GetUpgradeTimeStamp()

	if var_16_0 > pg.TimeMgr.GetInstance():GetServerTime() then
		arg_16_0.timer = Timer.New(function()
			local var_17_0 = var_16_0 - pg.TimeMgr.GetInstance():GetServerTime()

			if var_17_0 <= 0 then
				arg_16_0:RemoveTimer()
			end

			arg_16_0.spendTimeTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_17_0)
		end, 1, -1)

		arg_16_0.timer:Start()
		arg_16_0.timer.func()
	end
end

function var_0_0.RemoveTimer(arg_18_0)
	if arg_18_0.timer then
		arg_18_0.timer:Stop()

		arg_18_0.timer = nil
	end
end

function var_0_0.Show(arg_19_0)
	if not arg_19_0.isOpen then
		var_0_0.super.Show(arg_19_0)
		pg.UIMgr.GetInstance():BlurPanel(arg_19_0._tf)

		arg_19_0.isOpen = true
	end
end

function var_0_0.Hide(arg_20_0)
	if arg_20_0.isOpen then
		arg_20_0.isOpen = false

		var_0_0.super.Hide(arg_20_0)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_20_0._tf, arg_20_0._parentTf)
	end
end

function var_0_0.OnDestroy(arg_21_0)
	arg_21_0:Hide()
	arg_21_0:RemoveTimer()
end

return var_0_0
