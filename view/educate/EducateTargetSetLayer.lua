local var_0_0 = class("EducateTargetSetLayer", import(".base.EducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EducateTargetSetUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
end

function var_0_0.initData(arg_3_0)
	arg_3_0:initTargetList()

	arg_3_0.selectedIndex = 1
end

function var_0_0.initTargetList(arg_4_0)
	local var_4_0 = getProxy(EducateProxy)
	local var_4_1 = var_4_0:GetCharData()

	arg_4_0.maxAttrId = var_4_1:GetAttrSortIds()[1]

	local var_4_2 = var_4_1:GetStage()
	local var_4_3 = var_4_0:GetTaskProxy():GetTargetId() == 0 and 1 or var_4_2 + 1
	local var_4_4 = var_4_0:GetPersonalityId()
	local var_4_5 = {}
	local var_4_6 = {}

	for iter_4_0, iter_4_1 in ipairs(pg.child_target_set.all) do
		if pg.child_target_set[iter_4_1].stage == var_4_3 then
			local var_4_7 = pg.child_target_set[iter_4_1].condition

			if var_4_7 == "" or #var_4_7 == 0 then
				table.insert(var_4_5, iter_4_1)
			elseif var_4_4 == var_4_7[2][1] then
				table.insert(var_4_6, iter_4_1)
			end
		end
	end

	table.sort(var_4_6, CompareFuncs({
		function(arg_5_0)
			local var_5_0 = pg.child_target_set[arg_5_0].condition[1][1]

			return -var_4_1:GetAttrById(var_5_0)
		end,
		function(arg_6_0)
			return arg_6_0
		end
	}))

	local var_4_8 = 0

	arg_4_0.targetList = {}

	for iter_4_2, iter_4_3 in ipairs(var_4_6) do
		table.insert(arg_4_0.targetList, iter_4_3)

		var_4_8 = var_4_8 + 1

		if var_4_8 == 4 then
			break
		end
	end

	if var_4_8 < 4 then
		for iter_4_4, iter_4_5 in ipairs(var_4_5) do
			table.insert(arg_4_0.targetList, iter_4_5)

			var_4_8 = var_4_8 + 1

			if var_4_8 == 4 then
				break
			end
		end
	end
end

function var_0_0.findUI(arg_7_0)
	arg_7_0.windowTF = arg_7_0:findTF("anim_root/window")
	arg_7_0.targetContent = arg_7_0:findTF("content", arg_7_0.windowTF)
	arg_7_0.targetTpl = arg_7_0:findTF("tpl", arg_7_0.targetContent)

	setActive(arg_7_0.targetTpl, false)

	arg_7_0.sureBtn = arg_7_0:findTF("sure_btn", arg_7_0.windowTF)

	setText(arg_7_0:findTF("Text", arg_7_0.sureBtn), i18n("word_ok"))
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.sureBtn, function()
		local var_9_0 = arg_8_0.targetList[arg_8_0.selectedIndex]
		local var_9_1 = pg.child_target_set[var_9_0].recommend_attr2
		local var_9_2 = pg.child_attr[var_9_1].name

		arg_8_0:emit(EducateBaseUI.EDUCATE_ON_MSG_TIP, {
			content = i18n("child_target_set_sure_tip", var_9_2),
			onYes = function()
				arg_8_0:emit(EducateTargetSetMediator.ON_TARGET_SET, {
					open = true,
					id = var_9_0
				})

				local var_10_0 = arg_8_0:findTF("anim_root"):GetComponent(typeof(Animation))
				local var_10_1 = arg_8_0:findTF("anim_root"):GetComponent(typeof(DftAniEvent))

				var_10_1:SetEndEvent(function()
					var_10_1:SetEndEvent(nil)
					arg_8_0:emit(var_0_0.ON_CLOSE)
				end)
				var_10_0:Play("anim_educate_targetset_out")
			end
		})
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_12_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_12_0._tf)
	arg_12_0:initTarget()
end

function var_0_0.initTarget(arg_13_0)
	for iter_13_0 = 1, #arg_13_0.targetList do
		local var_13_0 = cloneTplTo(arg_13_0.targetTpl, arg_13_0.targetContent, tostring(iter_13_0))
		local var_13_1 = arg_13_0.targetList[iter_13_0]

		setImageSprite(arg_13_0:findTF("animroot/icon/Image", var_13_0), LoadSprite("educatetarget/" .. pg.child_target_set[var_13_1].icon), true)
		setImageSprite(arg_13_0:findTF("animroot/name", var_13_0), LoadSprite("educatetarget/" .. pg.child_target_set[var_13_1].pic), true)
		onButton(arg_13_0, var_13_0, function()
			if arg_13_0.selectedIndex == iter_13_0 then
				return
			end

			arg_13_0.selectedIndex = iter_13_0

			arg_13_0:updateTarget()
		end, SFX_PANEL)

		local var_13_2 = pg.child_target_set[var_13_1].recommend_attr

		setActive(arg_13_0:findTF("animroot/recommand", var_13_0), var_13_2 == arg_13_0.maxAttrId)
	end

	arg_13_0:updateTarget()

	local var_13_3 = {}

	table.insert(var_13_3, function(arg_15_0)
		onDelayTick(function()
			arg_15_0()
		end, 0.066)
	end)

	for iter_13_1 = 1, #arg_13_0.targetList do
		table.insert(var_13_3, function(arg_17_0)
			arg_13_0:findTF(tostring(iter_13_1), arg_13_0.targetContent):GetComponent(typeof(Animation)):Play("anim_educate_targetset_tpl_in")
			onDelayTick(function()
				arg_17_0()
			end, 0.066)
		end)
	end

	seriesAsync(var_13_3, function()
		return
	end)
end

function var_0_0.updateTarget(arg_20_0)
	eachChild(arg_20_0.targetContent, function(arg_21_0)
		setActive(arg_20_0:findTF("animroot/selected", arg_21_0), arg_20_0.selectedIndex == tonumber(arg_21_0.name))
	end)
end

function var_0_0.willExit(arg_22_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_22_0._tf)
end

function var_0_0.onBackPressed(arg_23_0)
	return
end

return var_0_0
