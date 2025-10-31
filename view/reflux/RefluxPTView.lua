local var_0_0 = class("RefluxPTView", import("..base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "RefluxPTUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
	arg_2_0:updateUI()
end

function var_0_0.OnDestroy(arg_3_0)
	return
end

function var_0_0.OnBackPress(arg_4_0)
	arg_4_0:Hide()
end

function var_0_0.initData(arg_5_0)
	arg_5_0.refluxProxy = getProxy(RefluxProxy)
end

function var_0_0.initUI(arg_6_0)
	arg_6_0.nextBtn = arg_6_0._tf:Find("NextBtn")
	arg_6_0.countText = arg_6_0._tf:Find("PTCount")

	local var_6_0 = arg_6_0.countText:GetComponent(typeof(Text))

	var_6_0.material = Object.Instantiate(var_6_0.material)
	arg_6_0.faceSpriteList = {}

	local var_6_1 = arg_6_0._tf:Find("Face")

	for iter_6_0 = 0, var_6_1.childCount - 1 do
		local var_6_2 = var_6_1:GetChild(iter_6_0)
		local var_6_3 = getImageSprite(var_6_2)

		table.insert(arg_6_0.faceSpriteList, var_6_3)
	end

	arg_6_0.scrollViewTF = arg_6_0._tf:Find("ScrollRect")
	arg_6_0.viewportTF = arg_6_0.scrollViewTF
	arg_6_0.tpl = arg_6_0._tf:Find("StepTpl")
	arg_6_0.tplContainerTF = arg_6_0._tf:Find("ScrollRect/Container")
	arg_6_0.stepUIIList = UIItemList.New(arg_6_0.tplContainerTF, arg_6_0.tpl)

	arg_6_0.stepUIIList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_7_1 = arg_7_1 + 1

			arg_6_0:updateTpl(arg_7_2, arg_7_1)
		end
	end)
end

function var_0_0.updateData(arg_8_0)
	return
end

function var_0_0.updateUI(arg_9_0)
	arg_9_0:updateTplList()
	arg_9_0:ScrollPt(arg_9_0.refluxProxy.ptStage - 1)
	setText(arg_9_0.countText, arg_9_0.refluxProxy.ptNum)
end

function var_0_0.updateOutline(arg_10_0)
	local var_10_0 = arg_10_0.countText:GetComponent(typeof(Text))

	var_10_0.material = Object.Instantiate(var_10_0.material)
end

function var_0_0.updateTpl(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_1:Find("item")
	local var_11_1 = var_11_0:Find("award")
	local var_11_2 = var_11_0:Find("text_unlock")
	local var_11_3 = var_11_0:Find("text_pt")
	local var_11_4 = arg_11_1:Find("checked")
	local var_11_5 = arg_11_1:Find("face")
	local var_11_6 = arg_11_1:Find("progress")
	local var_11_7 = var_11_6:Find("text")
	local var_11_8 = var_11_6:Find("Fill Area")
	local var_11_9 = arg_11_1:Find("achieve")
	local var_11_10 = pg.return_pt_template[arg_11_2]
	local var_11_11 = arg_11_0.refluxProxy.ptNum
	local var_11_12 = var_11_10.pt_require
	local var_11_13 = arg_11_0.refluxProxy.ptStage + 1
	local var_11_14 = arg_11_0.refluxProxy.ptStage
	local var_11_15 = arg_11_0:getAwardForShow(arg_11_2)

	updateDrop(var_11_1, var_11_15, {
		Q = true
	})
	setText(var_11_2, i18n("reflux_word_2"))
	setText(var_11_3, var_11_12 .. "PT")
	setActive(var_11_4, arg_11_2 < var_11_13)

	local var_11_16 = arg_11_2 < var_11_13 and Color.gray or Color.white
	local var_11_17 = arg_11_1:GetComponentsInChildren(typeof(Image)):ToTable()

	for iter_11_0, iter_11_1 in ipairs(var_11_17) do
		iter_11_1.color = var_11_16
	end

	setImageColor(var_11_0, var_11_16)

	local var_11_18, var_11_19 = arg_11_0:getPTMinAndMax(arg_11_2)

	var_11_6.sizeDelta = Vector2(125, 20)

	setSlider(var_11_6, var_11_18, var_11_19, var_11_11)
	setActive(var_11_8, var_11_18 < var_11_11)
	setText(var_11_7, var_11_12 .. "PT")

	local var_11_20 = arg_11_2 == var_11_13 and var_11_12 <= var_11_11

	setActive(var_11_9, var_11_20)

	if var_11_20 then
		onButton(arg_11_0, arg_11_1, function()
			arg_11_0:onStepClick(arg_11_2)
		end, SFX_PANEL)
	else
		removeOnButton(arg_11_1)
	end

	local var_11_21 = (arg_11_2 - 1) % 10 + 1
	local var_11_22 = arg_11_0.faceSpriteList[var_11_21]

	setImageSprite(var_11_5, var_11_22)
end

function var_0_0.updateTplList(arg_13_0)
	arg_13_0.stepUIIList:align(#pg.return_pt_template.all)
end

function var_0_0.updateAfterServer(arg_14_0)
	local var_14_0 = #pg.return_pt_template.all
	local var_14_1 = arg_14_0.refluxProxy.ptStage + 1
	local var_14_2 = var_14_1 - 1

	if var_14_1 <= var_14_0 and var_14_1 >= 1 then
		local var_14_3 = arg_14_0.tplContainerTF:GetChild(var_14_1 - 1)

		arg_14_0:updateTpl(var_14_3, var_14_1)
	end

	if var_14_2 <= var_14_0 and var_14_2 >= 1 then
		local var_14_4 = arg_14_0.tplContainerTF:GetChild(var_14_2 - 1)

		arg_14_0:updateTpl(var_14_4, var_14_2)
	end

	arg_14_0:ScrollPt(arg_14_0.refluxProxy.ptStage - 1)
end

function var_0_0.ScrollPt(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = arg_15_0.tplContainerTF:GetComponent(typeof(HorizontalLayoutGroup))
	local var_15_1 = arg_15_0.tpl:GetComponent(typeof(LayoutElement))
	local var_15_2 = math.max(arg_15_1 * (var_15_1.preferredWidth + var_15_0.spacing) - arg_15_0.viewportTF.rect.width * 0.5 + var_15_1.preferredWidth, 0)
	local var_15_3 = arg_15_0.tplContainerTF.childCount * var_15_1.preferredWidth + (arg_15_0.tplContainerTF.childCount - 1) * var_15_0.spacing - arg_15_0.viewportTF.rect.width
	local var_15_4 = math.clamp(var_15_2 / var_15_3, 0, 1)

	arg_15_0.scrollViewTF:GetComponent(typeof(ScrollRect)).horizontalNormalizedPosition = var_15_4
end

function var_0_0.onStepClick(arg_16_0, arg_16_1)
	local function var_16_0()
		pg.m02:sendNotification(GAME.REFLUX_GET_PT_AWARD)
	end

	local var_16_1 = arg_16_0:getAwardForShow(arg_16_1)

	var_16_1[1] = var_16_1.type
	var_16_1[2] = var_16_1.id
	var_16_1[3] = var_16_1.count

	local var_16_2 = {
		var_16_1
	}
	local var_16_3, var_16_4 = Task.StaticJudgeOverflow(false, false, false, true, true, var_16_2)

	if var_16_3 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_ITEM_BOX,
			content = i18n("award_max_warning"),
			items = var_16_4,
			onYes = var_16_0
		})
	else
		var_16_0()
	end
end

function var_0_0.getAwardForShow(arg_18_0, arg_18_1)
	local var_18_0 = pg.return_pt_template[arg_18_1]
	local var_18_1 = var_18_0.level
	local var_18_2 = arg_18_0.refluxProxy.returnLV
	local var_18_3

	for iter_18_0, iter_18_1 in ipairs(var_18_1) do
		local var_18_4 = iter_18_1[1]
		local var_18_5 = iter_18_1[2]

		if var_18_4 <= var_18_2 and var_18_2 <= var_18_5 then
			var_18_3 = iter_18_0
		end
	end

	local var_18_6 = var_18_0.award_display[var_18_3]

	return {
		type = var_18_6[1],
		id = var_18_6[2],
		count = var_18_6[3]
	}
end

function var_0_0.getPTMinAndMax(arg_19_0, arg_19_1)
	local var_19_0
	local var_19_1
	local var_19_2 = pg.return_pt_template[arg_19_1].pt_require
	local var_19_3 = arg_19_1 - 1
	local var_19_4 = pg.return_pt_template[var_19_3]

	if var_19_4 then
		var_19_0 = var_19_4.pt_require
	else
		var_19_0 = 0
	end

	return var_19_0, var_19_2
end

function var_0_0.isAnyPTCanGetAward()
	local var_20_0 = #pg.return_pt_template.all
	local var_20_1 = getProxy(RefluxProxy)
	local var_20_2 = var_20_1.ptStage + 1

	if var_20_2 <= var_20_0 then
		return pg.return_pt_template[var_20_2].pt_require <= var_20_1.ptNum
	else
		return false
	end
end

return var_0_0
