local var_0_0 = class("PizzahutPTPage", import(".TemplatePage.PtTemplatePage"))

var_0_0.FADE_TIME = 0.5
var_0_0.SHOW_TIME = 1
var_0_0.FADE_OUT_TIME = 0.5
var_0_0.Menu_Ani_Open_Time = 0.5
var_0_0.Menu_Ani_Close_Time = 0.3
var_0_0.PosList = {
	-256,
	-150,
	-50,
	55,
	160,
	263
}
var_0_0.Pizza_Save_Tag_Pre = "Pizza_Tag_"

function var_0_0.OnDataSetting(arg_1_0)
	var_0_0.super.OnDataSetting(arg_1_0)

	arg_1_0.specialPhaseList = arg_1_0.activity:getConfig("config_data")
	arg_1_0.selectedList = arg_1_0:getSelectedList()
	arg_1_0.curSelectOrder = 0
	arg_1_0.curSelectIndex = 0
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	arg_2_0:findUI()
	arg_2_0:initMainPanel()
	arg_2_0:addListener()
	arg_2_0:initSD()
end

function var_0_0.OnUpdateFlush(arg_3_0)
	var_0_0.super.OnUpdateFlush(arg_3_0)

	local var_3_0, var_3_1, var_3_2 = arg_3_0.ptData:GetResProgress()

	setText(arg_3_0.progress, (var_3_2 >= 1 and setColorStr(var_3_0, "#947D80FF") or var_3_0) .. "/" .. var_3_1)
	arg_3_0:updatePizza()
	arg_3_0:updateMainSelectPanel()
	setActive(arg_3_0.openBtn, arg_3_0:isFinished())
	setActive(arg_3_0.shareBtn, arg_3_0:isFinished())
	onButton(arg_3_0, arg_3_0.battleBtn, function()
		arg_3_0:emit(ActivityMediator.SPECIAL_BATTLE_OPERA)
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_5_0)
	if arg_5_0.spine then
		arg_5_0.spine.transform.localScale = Vector3.one

		pg.PoolMgr.GetInstance():ReturnSpineChar("chuixue_6", arg_5_0.spine)

		arg_5_0.spine = nil
	end

	if arg_5_0.shareGo then
		PoolMgr.GetInstance():ReturnUI("PizzahutSharePage", arg_5_0.shareGo)

		arg_5_0.shareGo = nil
	end
end

function var_0_0.findUI(arg_6_0)
	arg_6_0.shareBtn = arg_6_0.bg:Find("share_btn")
	arg_6_0.empty = arg_6_0.bg:Find("empty")
	arg_6_0.pizzaTF = arg_6_0.bg:Find("Pizza")
	arg_6_0.openBtn = arg_6_0.bg:Find("open_btn")
	arg_6_0.helpBtn = arg_6_0.bg:Find("help_btn")
	arg_6_0.specialTF = arg_6_0._tf:Find("Special")
	arg_6_0.backBG = arg_6_0.specialTF:Find("BG")
	arg_6_0.closeBtn = arg_6_0.specialTF:Find("CloseBtn")
	arg_6_0.menuTF = arg_6_0.specialTF:Find("Menu")
	arg_6_0.mainPanel = arg_6_0.menuTF:Find("MainPanel")
	arg_6_0.mainToggleTFList = {}

	for iter_6_0 = 1, 6 do
		arg_6_0.mainToggleTFList[iter_6_0] = arg_6_0.mainPanel:GetChild(iter_6_0 - 1)
	end

	arg_6_0.secondPanel = arg_6_0.menuTF:Find("SecondList")
	arg_6_0.selectBtn = arg_6_0.menuTF:Find("SelectBtn")
	arg_6_0.mainPanelCG = GetComponent(arg_6_0.mainPanel, "CanvasGroup")
	arg_6_0.secondPanelCG = GetComponent(arg_6_0.secondPanel, "CanvasGroup")
	arg_6_0.selectBtnImg = GetComponent(arg_6_0.selectBtn, "Image")
	arg_6_0.resTF = arg_6_0._tf:Find("Res")

	local var_6_0 = arg_6_0.resTF:Find("1/1")
	local var_6_1 = arg_6_0.resTF:Find("1/2")
	local var_6_2 = arg_6_0.resTF:Find("1/3")
	local var_6_3 = arg_6_0.resTF:Find("2/1/1")
	local var_6_4 = arg_6_0.resTF:Find("2/1/2")
	local var_6_5 = arg_6_0.resTF:Find("2/1/3")
	local var_6_6 = arg_6_0.resTF:Find("2/2/1")
	local var_6_7 = arg_6_0.resTF:Find("2/2/2")
	local var_6_8 = arg_6_0.resTF:Find("2/2/3")
	local var_6_9 = arg_6_0.resTF:Find("2/3/1")
	local var_6_10 = arg_6_0.resTF:Find("2/3/2")
	local var_6_11 = arg_6_0.resTF:Find("2/3/3")
	local var_6_12 = arg_6_0.resTF:Find("3/1/1")
	local var_6_13 = arg_6_0.resTF:Find("3/1/2")
	local var_6_14 = arg_6_0.resTF:Find("3/1/3")
	local var_6_15 = arg_6_0.resTF:Find("3/2/1")
	local var_6_16 = arg_6_0.resTF:Find("3/2/2")
	local var_6_17 = arg_6_0.resTF:Find("3/2/3")
	local var_6_18 = arg_6_0.resTF:Find("3/3/1")
	local var_6_19 = arg_6_0.resTF:Find("3/3/2")
	local var_6_20 = arg_6_0.resTF:Find("3/3/3")
	local var_6_21 = arg_6_0.resTF:Find("4/1")
	local var_6_22 = arg_6_0.resTF:Find("4/2")
	local var_6_23 = arg_6_0.resTF:Find("4/3")
	local var_6_24 = arg_6_0.resTF:Find("5/1")
	local var_6_25 = arg_6_0.resTF:Find("5/2")
	local var_6_26 = arg_6_0.resTF:Find("5/3")
	local var_6_27 = arg_6_0.resTF:Find("6/1")
	local var_6_28 = arg_6_0.resTF:Find("6/2")
	local var_6_29 = arg_6_0.resTF:Find("6/3")

	arg_6_0.iconTable = {
		["1"] = {
			var_6_0,
			var_6_1,
			var_6_2
		},
		["21"] = {
			var_6_3,
			var_6_4,
			var_6_5
		},
		["22"] = {
			var_6_6,
			var_6_7,
			var_6_8
		},
		["23"] = {
			var_6_9,
			var_6_10,
			var_6_11
		},
		["311"] = {
			var_6_12
		},
		["312"] = {
			var_6_13
		},
		["313"] = {
			var_6_14
		},
		["321"] = {
			var_6_15
		},
		["322"] = {
			var_6_16
		},
		["323"] = {
			var_6_17
		},
		["331"] = {
			var_6_18
		},
		["332"] = {
			var_6_19
		},
		["333"] = {
			var_6_20
		},
		["4"] = {
			var_6_21,
			var_6_22,
			var_6_23
		},
		["5"] = {
			var_6_24,
			var_6_25,
			var_6_26
		},
		["6"] = {
			var_6_27,
			var_6_28,
			var_6_29
		}
	}
	arg_6_0.pizzaResTF = arg_6_0._tf:Find("Pizza")
	arg_6_0.mainToggleSelectedTF = {}

	for iter_6_1, iter_6_2 in ipairs(arg_6_0.mainToggleTFList) do
		arg_6_0.mainToggleSelectedTF[iter_6_1] = iter_6_2:GetChild(0)
	end

	arg_6_0.selectedIconResTF = arg_6_0._tf:Find("SelectedIcon")
end

function var_0_0.addListener(arg_7_0)
	onButton(arg_7_0, arg_7_0.getBtn, function()
		local var_8_0, var_8_1, var_8_2 = arg_7_0.ptData:GetLevelProgress()
		local var_8_3 = table.indexof(arg_7_0.specialPhaseList, var_8_0, 1)

		if var_8_3 then
			arg_7_0:openMainPanel(var_8_3)
		else
			local var_8_4 = {}
			local var_8_5 = arg_7_0.ptData:GetAward()
			local var_8_6 = getProxy(PlayerProxy):getData()

			if var_8_5.type == DROP_TYPE_RESOURCE and var_8_5.id == PlayerConst.ResGold and var_8_6:GoldMax(var_8_5.count) then
				table.insert(var_8_4, function(arg_9_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("gold_max_tip_title") .. i18n("award_max_warning"),
						onYes = arg_9_0
					})
				end)
			end

			seriesAsync(var_8_4, function()
				local var_10_0, var_10_1 = arg_7_0.ptData:GetResProgress()

				arg_7_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
					cmd = 1,
					activity_id = arg_7_0.ptData:GetId(),
					arg1 = var_10_1
				})
			end)
		end
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.openBtn, function()
		arg_7_0:openMainPanel()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.pizzahut_help.tip
		})
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.shareBtn, function()
		arg_7_0:share()
	end, SFX_PANEL)
end

function var_0_0.initMainPanel(arg_14_0)
	onButton(arg_14_0, arg_14_0.backBG, function()
		arg_14_0:closeSpecial()

		if arg_14_0:isFinished() then
			setActive(arg_14_0.openBtn, true)
		end
	end, SFX_CANCEL)

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.mainToggleTFList) do
		onToggle(arg_14_0, iter_14_1, function(arg_16_0)
			arg_14_0.curSelectOrder = iter_14_0

			if arg_16_0 == true then
				local var_16_0 = var_0_0.PosList[iter_14_0]

				setLocalPosition(arg_14_0.secondPanel, {
					x = var_16_0
				})
				setLocalPosition(arg_14_0.selectBtn, {
					x = var_16_0
				})

				local var_16_1

				if iter_14_0 == 1 then
					var_16_1 = arg_14_0.iconTable["1"]
				elseif iter_14_0 == 2 then
					local var_16_2 = 2 .. arg_14_0.selectedList[1]

					var_16_1 = arg_14_0.iconTable[var_16_2]
				elseif iter_14_0 == 3 then
					local var_16_3 = 3 .. arg_14_0.selectedList[1] .. arg_14_0.selectedList[2]

					var_16_1 = arg_14_0.iconTable[var_16_3]
				elseif iter_14_0 >= 4 and iter_14_0 <= 6 then
					var_16_1 = arg_14_0.iconTable[tostring(iter_14_0)]
				end

				local var_16_4 = {}

				for iter_16_0 = 1, 3 do
					var_16_4[iter_16_0] = arg_14_0.secondPanel:GetChild(iter_16_0 - 1)
				end

				if #var_16_1 == 1 then
					setActive(var_16_4[2], false)
					setActive(var_16_4[3], false)

					local var_16_5 = getImageSprite(var_16_1[1])

					setImageSprite(var_16_4[1]:Find("icon"), var_16_5, true)
					onToggle(arg_14_0, var_16_4[1], function(arg_17_0)
						if arg_17_0 == true then
							arg_14_0:openSelectBtn()

							arg_14_0.curSelectIndex = 1
						end
					end, SFX_PANEL)
					triggerToggle(var_16_4[1], true)
				else
					setActive(var_16_4[2], true)
					setActive(var_16_4[3], true)

					for iter_16_1 = 1, 3 do
						local var_16_6 = getImageSprite(var_16_1[iter_16_1])

						setImageSprite(var_16_4[iter_16_1]:Find("icon"), var_16_6, true)
						onToggle(arg_14_0, var_16_4[iter_16_1], function(arg_18_0)
							if arg_18_0 == true then
								arg_14_0:openSelectBtn()

								arg_14_0.curSelectIndex = iter_16_1
							else
								setActive(arg_14_0.selectBtn, false)

								arg_14_0.curSelectIndex = 0
							end
						end, SFX_PANEL)
					end
				end

				for iter_16_2 = 1, 3 do
					triggerToggle(var_16_4[iter_16_2], false)
				end

				arg_14_0:openSecondPanel()
				setActive(arg_14_0.selectBtn, false)
			else
				setActive(arg_14_0.secondPanel, false)
				setActive(arg_14_0.selectBtn, false)
			end

			arg_14_0:updateMainSelectPanel()
		end, SFX_PANEL)
	end

	onButton(arg_14_0, arg_14_0.selectBtn, function()
		if not arg_14_0:isFinished() then
			if arg_14_0.curSelectIndex then
				local var_19_0, var_19_1 = arg_14_0.ptData:GetResProgress()

				arg_14_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
					cmd = 1,
					activity_id = arg_14_0.ptData:GetId(),
					arg1 = var_19_1,
					arg2 = arg_14_0.curSelectIndex,
					callback = function()
						arg_14_0.selectedList[arg_14_0.curSelectOrder] = arg_14_0.curSelectIndex

						arg_14_0:closeSpecial()
					end
				})
			end
		else
			arg_14_0:changeIndexSelect()
			arg_14_0:updatePizza()
			arg_14_0:updateMainSelectPanel()
		end
	end, SFX_PANEL)
end

function var_0_0.openMainPanel(arg_21_0, arg_21_1)
	arg_21_0.selectedList = arg_21_0:getSelectedList()

	setActive(arg_21_0.openBtn, false)

	for iter_21_0 = 1, 6 do
		triggerToggle(arg_21_0.mainToggleTFList[iter_21_0], false)

		GetComponent(arg_21_0.mainToggleTFList[iter_21_0], "Toggle").interactable = arg_21_0:isFinished()
	end

	arg_21_0:updateMainSelectPanel()
	setActive(arg_21_0.specialTF, true)
	LeanTween.value(go(arg_21_0.mainPanel), 0, 1, var_0_0.Menu_Ani_Open_Time):setOnUpdate(System.Action_float(function(arg_22_0)
		arg_21_0.mainPanelCG.alpha = arg_22_0
	end)):setOnComplete(System.Action(function()
		arg_21_0.mainPanelCG.alpha = 1
	end))
	LeanTween.value(go(arg_21_0.mainPanel), -640, 0, var_0_0.Menu_Ani_Open_Time):setOnUpdate(System.Action_float(function(arg_24_0)
		setLocalPosition(arg_21_0.mainPanel, {
			x = arg_24_0
		})
	end)):setOnComplete(System.Action(function()
		setLocalPosition(arg_21_0.mainPanel, {
			x = 0
		})

		if arg_21_1 and arg_21_1 > 0 then
			triggerToggle(arg_21_0.mainToggleTFList[arg_21_1], true)
		end
	end))
end

function var_0_0.closeMainPanel(arg_26_0)
	LeanTween.value(go(arg_26_0.mainPanel), 1, 0, var_0_0.Menu_Ani_Close_Time):setOnUpdate(System.Action_float(function(arg_27_0)
		arg_26_0.mainPanelCG.alpha = arg_27_0
	end)):setOnComplete(System.Action(function()
		arg_26_0.mainPanelCG.alpha = 0

		setActive(arg_26_0.specialTF, false)
	end))
	LeanTween.value(go(arg_26_0.mainPanel), 0, -640, var_0_0.Menu_Ani_Close_Time):setOnUpdate(System.Action_float(function(arg_29_0)
		setLocalPosition(arg_26_0.mainPanel, {
			x = arg_29_0
		})
	end)):setOnComplete(System.Action(function()
		setLocalPosition(arg_26_0.mainPanel, {
			x = -640
		})
		setActive(arg_26_0.specialTF, false)
	end))
end

function var_0_0.openSecondPanel(arg_31_0)
	setActive(arg_31_0.secondPanel, true)
	LeanTween.value(go(arg_31_0.secondPanel), 0, 1, var_0_0.Menu_Ani_Open_Time):setOnUpdate(System.Action_float(function(arg_32_0)
		arg_31_0.secondPanelCG.alpha = arg_32_0
	end)):setOnComplete(System.Action(function()
		arg_31_0.secondPanelCG.alpha = 1
	end))
	LeanTween.value(go(arg_31_0.secondPanel), -530, -60, var_0_0.Menu_Ani_Open_Time):setOnUpdate(System.Action_float(function(arg_34_0)
		setLocalPosition(arg_31_0.secondPanel, {
			y = arg_34_0
		})
	end)):setOnComplete(System.Action(function()
		setLocalPosition(arg_31_0.secondPanel, {
			y = -60
		})
	end))
end

function var_0_0.closeSecondPanel(arg_36_0)
	LeanTween.value(go(arg_36_0.secondPanel), 1, 0, var_0_0.Menu_Ani_Close_Time):setOnUpdate(System.Action_float(function(arg_37_0)
		arg_36_0.secondPanelCG.alpha = arg_37_0
	end)):setOnComplete(System.Action(function()
		arg_36_0.secondPanelCG.alpha = 0

		setActive(arg_36_0.secondPanel, false)
	end))
	LeanTween.value(go(arg_36_0.secondPanel), -60, -530, var_0_0.Menu_Ani_Close_Time):setOnUpdate(System.Action_float(function(arg_39_0)
		setLocalPosition(arg_36_0.secondPanel, {
			y = arg_39_0
		})
	end)):setOnComplete(System.Action(function()
		setLocalPosition(arg_36_0.secondPanel, {
			y = -530
		})
		setActive(arg_36_0.secondPanel, false)
		arg_36_0:closeMainPanel()
	end))
end

function var_0_0.openSelectBtn(arg_41_0)
	setActive(arg_41_0.selectBtn, true)
	LeanTween.value(go(arg_41_0.selectBtn), 0, 1, var_0_0.Menu_Ani_Open_Time):setOnUpdate(System.Action_float(function(arg_42_0)
		setImageAlpha(arg_41_0.selectBtn, arg_42_0)
	end)):setOnComplete(System.Action(function()
		setImageAlpha(arg_41_0.selectBtn, 1)
	end))
	LeanTween.value(go(arg_41_0.selectBtn), -145, -210, var_0_0.Menu_Ani_Open_Time):setOnUpdate(System.Action_float(function(arg_44_0)
		setLocalPosition(arg_41_0.selectBtn, {
			y = arg_44_0
		})
	end)):setOnComplete(System.Action(function()
		setLocalPosition(arg_41_0.selectBtn, {
			y = -210
		})
	end))
end

function var_0_0.closeSelectBtn(arg_46_0)
	LeanTween.value(go(arg_46_0.selectBtn), 1, 0, var_0_0.Menu_Ani_Close_Time):setOnUpdate(System.Action_float(function(arg_47_0)
		setImageAlpha(arg_46_0.selectBtn, arg_47_0)
	end)):setOnComplete(System.Action(function()
		setImageAlpha(arg_46_0.selectBtn, 0)
		setActive(arg_46_0.selectBtn, false)
	end))
	LeanTween.value(go(arg_46_0.selectBtn), -210, -145, var_0_0.Menu_Ani_Close_Time):setOnUpdate(System.Action_float(function(arg_49_0)
		setLocalPosition(arg_46_0.selectBtn, {
			y = arg_49_0
		})
	end)):setOnComplete(System.Action(function()
		setLocalPosition(arg_46_0.selectBtn, {
			y = -145
		})
		setActive(arg_46_0.selectBtn, false)
	end))
end

function var_0_0.closeSpecial(arg_51_0)
	arg_51_0:closeSelectBtn()
	arg_51_0:closeSecondPanel()
end

function var_0_0.updatePizza(arg_52_0)
	setActive(arg_52_0.empty, arg_52_0.selectedList[1] == 0)
	setActive(arg_52_0.pizzaTF, arg_52_0.selectedList[1] > 0)

	local var_52_0 = arg_52_0.pizzaTF:Find("PizzaPan")
	local var_52_1 = arg_52_0.pizzaTF:Find("PizzaSauce")
	local var_52_2 = arg_52_0.pizzaTF:Find("PizzaCheese")
	local var_52_3 = arg_52_0.pizzaTF:Find("EX1")
	local var_52_4 = arg_52_0.pizzaTF:Find("EX2")
	local var_52_5 = arg_52_0.pizzaTF:Find("EX3")

	setActive(var_52_0, arg_52_0.selectedList[1] and arg_52_0.selectedList[1] > 0)
	setActive(var_52_1, arg_52_0.selectedList[2] and arg_52_0.selectedList[2] > 0)
	setActive(var_52_2, arg_52_0.selectedList[3] and arg_52_0.selectedList[3] > 0)
	setActive(var_52_3, arg_52_0.selectedList[4] and arg_52_0.selectedList[4] > 0)
	setActive(var_52_4, arg_52_0.selectedList[5] and arg_52_0.selectedList[5] > 0)
	setActive(var_52_5, arg_52_0.selectedList[6] and arg_52_0.selectedList[6] > 0)

	if arg_52_0.selectedList[1] and arg_52_0.selectedList[1] > 0 then
		local var_52_6 = getImageSprite(arg_52_0._tf:Find(tostring(arg_52_0.selectedList[1]), arg_52_0.pizzaResTF))

		setImageSprite(var_52_0, var_52_6, true)
	end

	if arg_52_0.selectedList[2] and arg_52_0.selectedList[2] > 0 then
		local var_52_7 = arg_52_0.selectedList[1] .. arg_52_0.selectedList[2]
		local var_52_8 = getImageSprite(arg_52_0.pizzaResTF:Find(var_52_7))

		setImageSprite(var_52_1, var_52_8, true)
	end

	if arg_52_0.selectedList[3] and arg_52_0.selectedList[3] > 0 then
		local var_52_9 = arg_52_0.selectedList[1] .. arg_52_0.selectedList[2] .. arg_52_0.selectedList[3]
		local var_52_10 = getImageSprite(arg_52_0.pizzaResTF:Find(var_52_9))

		setImageSprite(var_52_2, var_52_10, true)
	end

	if arg_52_0.selectedList[4] and arg_52_0.selectedList[4] > 0 then
		local var_52_11 = 4 .. arg_52_0.selectedList[4]
		local var_52_12 = getImageSprite(arg_52_0.pizzaResTF:Find(var_52_11))

		setImageSprite(var_52_3, var_52_12, true)
	end

	if arg_52_0.selectedList[5] and arg_52_0.selectedList[5] > 0 then
		local var_52_13 = 5 .. arg_52_0.selectedList[5]
		local var_52_14 = getImageSprite(arg_52_0.pizzaResTF:Find(var_52_13))

		setImageSprite(var_52_4, var_52_14, true)
	end

	if arg_52_0.selectedList[6] and arg_52_0.selectedList[6] > 0 then
		local var_52_15 = 6 .. arg_52_0.selectedList[6]
		local var_52_16 = getImageSprite(arg_52_0.pizzaResTF:Find(var_52_15))

		setImageSprite(var_52_5, var_52_16, true)
	end
end

function var_0_0.updateMainSelectPanel(arg_53_0)
	if arg_53_0.selectedList[1] and arg_53_0.selectedList[1] > 0 then
		local var_53_0 = getImageSprite(arg_53_0._tf:Find(tostring(arg_53_0.selectedList[1]), arg_53_0.selectedIconResTF))

		setImageSprite(arg_53_0.mainToggleSelectedTF[1], var_53_0, true)
		setActive(arg_53_0.mainToggleSelectedTF[1], true)
	end

	if arg_53_0.selectedList[2] and arg_53_0.selectedList[2] > 0 then
		local var_53_1 = arg_53_0.selectedList[1] .. arg_53_0.selectedList[2]
		local var_53_2 = getImageSprite(arg_53_0.selectedIconResTF:Find(var_53_1))

		setImageSprite(arg_53_0.mainToggleSelectedTF[2], var_53_2, true)
		setActive(arg_53_0.mainToggleSelectedTF[2], true)
	end

	if arg_53_0.selectedList[3] and arg_53_0.selectedList[3] > 0 then
		local var_53_3 = arg_53_0.selectedList[1] .. arg_53_0.selectedList[2] .. arg_53_0.selectedList[3]
		local var_53_4 = getImageSprite(arg_53_0.selectedIconResTF:Find(var_53_3))

		setImageSprite(arg_53_0.mainToggleSelectedTF[3], var_53_4, true)
		setActive(arg_53_0.mainToggleSelectedTF[3], true)
	end

	if arg_53_0.selectedList[4] and arg_53_0.selectedList[4] > 0 then
		local var_53_5 = 4 .. arg_53_0.selectedList[4]
		local var_53_6 = getImageSprite(arg_53_0.selectedIconResTF:Find(var_53_5))

		setImageSprite(arg_53_0.mainToggleSelectedTF[4], var_53_6, true)
		setActive(arg_53_0.mainToggleSelectedTF[4], true)
	end

	if arg_53_0.selectedList[5] and arg_53_0.selectedList[5] > 0 then
		local var_53_7 = 5 .. arg_53_0.selectedList[5]
		local var_53_8 = getImageSprite(arg_53_0.selectedIconResTF:Find(var_53_7))

		setImageSprite(arg_53_0.mainToggleSelectedTF[5], var_53_8, true)
		setActive(arg_53_0.mainToggleSelectedTF[5], true)
	end

	if arg_53_0.selectedList[6] and arg_53_0.selectedList[6] > 0 then
		local var_53_9 = 6 .. arg_53_0.selectedList[6]
		local var_53_10 = getImageSprite(arg_53_0.selectedIconResTF:Find(var_53_9))

		setImageSprite(arg_53_0.mainToggleSelectedTF[6], var_53_10, true)
		setActive(arg_53_0.mainToggleSelectedTF[6], true)
	end
end

function var_0_0.isFinished(arg_54_0)
	return #arg_54_0.activity.data2_list == 6
end

function var_0_0.changeIndexSelect(arg_55_0)
	arg_55_0.selectedList[arg_55_0.curSelectOrder] = arg_55_0.curSelectIndex

	local var_55_0 = var_0_0.Pizza_Save_Tag_Pre .. arg_55_0.curSelectOrder

	PlayerPrefs.SetInt(var_55_0, arg_55_0.curSelectIndex)
end

function var_0_0.getSelectedList(arg_56_0)
	arg_56_0.selectedList = {
		0,
		0,
		0,
		0,
		0,
		0
	}

	for iter_56_0, iter_56_1 in ipairs(arg_56_0.activity.data2_list) do
		arg_56_0.selectedList[iter_56_0] = iter_56_1
	end

	if arg_56_0:isFinished() then
		for iter_56_2 = 1, 6 do
			local var_56_0 = var_0_0.Pizza_Save_Tag_Pre .. iter_56_2
			local var_56_1 = PlayerPrefs.GetInt(var_56_0, 0)

			if var_56_1 > 0 then
				arg_56_0.selectedList[iter_56_2] = var_56_1
			end
		end
	end

	arg_56_0:saveSelectedList()

	return arg_56_0.selectedList
end

function var_0_0.saveSelectedList(arg_57_0)
	for iter_57_0 = 1, 6 do
		local var_57_0 = var_0_0.Pizza_Save_Tag_Pre .. iter_57_0
		local var_57_1 = arg_57_0.selectedList[iter_57_0]

		PlayerPrefs.SetInt(var_57_0, var_57_1)
	end
end

function var_0_0.share(arg_58_0)
	PoolMgr.GetInstance():GetUI("PizzahutSharePage", false, function(arg_59_0)
		local var_59_0 = GameObject.Find("UICamera/Canvas/UIMain")

		SetParent(arg_59_0, var_59_0, false)

		arg_58_0.shareGo = arg_59_0

		local var_59_1 = arg_59_0:Find("PlayerName")
		local var_59_2 = arg_59_0:Find("PizzaContainer")
		local var_59_3 = getProxy(PlayerProxy):getData().name

		setText(var_59_1, var_59_3)

		local var_59_4 = getProxy(PlayerProxy):getRawData()
		local var_59_5 = getProxy(UserProxy):getRawData()
		local var_59_6 = getProxy(ServerProxy):getRawData()[var_59_5 and var_59_5.server or 0]
		local var_59_7 = var_59_4 and var_59_4.name or ""
		local var_59_8 = var_59_6 and var_59_6.name or ""
		local var_59_9 = arg_59_0:Find("deck")

		setText(var_59_9:Find("name/value"), var_59_7)
		setText(var_59_9:Find("server/value"), var_59_8)
		setText(var_59_9:Find("lv/value"), var_59_4.level)

		local var_59_10 = cloneTplTo(arg_58_0.pizzaTF, var_59_2)

		setLocalPosition(tf(var_59_10), {
			x = 0,
			y = 0
		})
		setLocalScale(tf(var_59_10), {
			x = 1.4,
			y = 1.4
		})
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypePizzahut)

		if arg_58_0.shareGo then
			PoolMgr.GetInstance():ReturnUI("PizzahutSharePage", arg_58_0.shareGo)

			arg_58_0.shareGo = nil
		end
	end)
end

function var_0_0.initSD(arg_60_0)
	arg_60_0.sdContainer = arg_60_0.bg:Find("sdcontainer")
	arg_60_0.spine = nil
	arg_60_0.spineLRQ = GetSpineRequestPackage.New("chuixue_6", function(arg_61_0)
		SetParent(arg_61_0, arg_60_0.sdContainer)

		arg_60_0.spine = arg_61_0
		arg_60_0.spine.transform.localScale = Vector3.one

		local var_61_0 = arg_60_0.spine:GetComponent("SpineAnimUI")

		if var_61_0 then
			var_61_0:SetAction("stand", 0)
		end

		arg_60_0.spineLRQ = nil
	end):Start()

	setActive(arg_60_0.sdContainer, true)
end

function var_0_0.showBubble(arg_62_0, arg_62_1)
	local var_62_0

	if not arg_62_1 then
		if isActive(arg_62_0.battleBtn) then
			var_62_0 = i18n("sofmapsd_1")
		elseif isActive(arg_62_0.getBtn) then
			var_62_0 = i18n("sofmapsd_2")
		elseif isActive(arg_62_0.gotBtn) then
			var_62_0 = i18n("sofmapsd_4")
		end
	else
		var_62_0 = arg_62_1
	end

	setText(arg_62_0.bubbleText, var_62_0)

	local function var_62_1(arg_63_0)
		arg_62_0.bubbleCG.alpha = arg_63_0

		setLocalScale(arg_62_0.bubble, Vector3.one * arg_63_0)
	end

	local function var_62_2()
		LeanTween.value(go(arg_62_0.bubble), 1, 0, var_0_0.FADE_OUT_TIME):setOnUpdate(System.Action_float(var_62_1)):setOnComplete(System.Action(function()
			setActive(arg_62_0.bubble, false)
		end))
	end

	LeanTween.cancel(go(arg_62_0.bubble))
	setActive(arg_62_0.bubble, true)
	LeanTween.value(go(arg_62_0.bubble), 0, 1, var_0_0.FADE_TIME):setOnUpdate(System.Action_float(var_62_1)):setOnComplete(System.Action(function()
		LeanTween.delayedCall(go(arg_62_0.bubble), var_0_0.SHOW_TIME, System.Action(var_62_2))
	end))
end

return var_0_0
