local var_0_0 = class("TechnologyTreeNationScene", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "TechnologyTreeCampUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:addListener()
	arg_3_0:updateTecItemList()
	arg_3_0:updateOneStepBtn()
	arg_3_0.nationProxy:setRedPointIgnoreTecCampUpgrade()
end

function var_0_0.willExit(arg_4_0)
	for iter_4_0, iter_4_1 in pairs(arg_4_0.timerList) do
		iter_4_1:Stop()
	end

	arg_4_0.nationProxy:refreshRedPoint()
end

function var_0_0.initData(arg_5_0)
	arg_5_0.nationProxy = getProxy(TechnologyNationProxy)
	arg_5_0.nationToPoint = arg_5_0.nationProxy:getNationPointList()
	arg_5_0.tecList = arg_5_0.nationProxy:GetTecList()
	arg_5_0.panelList = {}
	arg_5_0.timerList = {}
end

function var_0_0.calculateCurBuff(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0

	if arg_6_1 == 0 then
		return {}, {}, {}
	else
		var_6_0 = pg.fleet_tech_group[arg_6_2].techs[arg_6_1]
	end

	local var_6_1 = pg.fleet_tech_template[var_6_0].add
	local var_6_2 = {}
	local var_6_3 = {}

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		local var_6_4 = iter_6_1[2]
		local var_6_5 = iter_6_1[3]
		local var_6_6 = iter_6_1[1]

		for iter_6_2, iter_6_3 in ipairs(var_6_6) do
			if var_6_2[iter_6_3] then
				table.insert(var_6_2[iter_6_3], {
					attr = var_6_4,
					value = var_6_5
				})
			else
				var_6_2[iter_6_3] = {
					{
						attr = var_6_4,
						value = var_6_5
					}
				}
				var_6_3[#var_6_3 + 1] = iter_6_3
			end
		end
	end

	local var_6_7 = {}
	local var_6_8 = {}

	for iter_6_4, iter_6_5 in pairs(var_6_2) do
		if not var_6_7[iter_6_4] then
			var_6_7[iter_6_4] = {}
			var_6_8[iter_6_4] = {}
		end

		for iter_6_6, iter_6_7 in ipairs(iter_6_5) do
			local var_6_9 = iter_6_7.attr
			local var_6_10 = iter_6_7.value

			if not var_6_7[iter_6_4][var_6_9] then
				var_6_7[iter_6_4][var_6_9] = var_6_10
				var_6_8[iter_6_4][#var_6_8[iter_6_4] + 1] = var_6_9
			else
				var_6_7[iter_6_4][var_6_9] = var_6_7[iter_6_4][var_6_9] + var_6_10
			end
		end
	end

	table.sort(var_6_3, function(arg_7_0, arg_7_1)
		return arg_7_0 < arg_7_1
	end)

	for iter_6_8, iter_6_9 in pairs(var_6_8) do
		table.sort(iter_6_9, function(arg_8_0, arg_8_1)
			return arg_8_0 < arg_8_1
		end)
	end

	return var_6_3, var_6_8, var_6_7
end

function var_0_0.findUI(arg_9_0)
	arg_9_0.scrollRect = arg_9_0._tf:Find("Scroll View")
	arg_9_0.tecItemContainer = arg_9_0._tf:Find("Scroll View/Viewport/Content")
	arg_9_0.scrollRectCom = GetComponent(arg_9_0.scrollRect, "ScrollRect")
	arg_9_0.tecItemTpl = arg_9_0._tf:Find("CampTecItem")
	arg_9_0.typeItemTpl = arg_9_0._tf:Find("TypeItem")
	arg_9_0.buffItemTpl = arg_9_0._tf:Find("BuffItem")
	arg_9_0.tecItemTplOriginWidth = arg_9_0.tecItemTpl.rect.width
	arg_9_0.oneStepBtn = arg_9_0._tf:Find("OneStepBtn")

	if not LOCK_TEC_NATION_AWARD then
		arg_9_0.awardTpl = Instantiate(GetComponent(arg_9_0._tf, "ItemList").prefabItem[0])

		setActive(arg_9_0.awardTpl, false)

		local var_9_0 = arg_9_0.awardTpl:AddComponent(typeof(LayoutElement))

		var_9_0.preferredWidth = 204
		var_9_0.preferredHeight = 206

		local var_9_1 = arg_9_0._tf:Find("CampTecItem/AwardPanel/FinishBtn/Text")

		setText(var_9_1, i18n("tec_nation_award_finish"))
	else
		setActive(arg_9_0.oneStepBtn, false)
	end
end

function var_0_0.onBackPressed(arg_10_0)
	arg_10_0:emit(var_0_0.ON_BACK)
end

function var_0_0.closeMyself(arg_11_0)
	arg_11_0:emit(var_0_0.ON_CLOSE)
end

function var_0_0.addListener(arg_12_0)
	onButton(arg_12_0, arg_12_0.oneStepBtn, function()
		pg.m02:sendNotification(GAME.GET_CAMP_TEC_AWARD_ONESTEP)
	end, SFX_PANEL)
end

function var_0_0.updateTecItemList(arg_14_0)
	local var_14_0 = UIItemList.New(arg_14_0.tecItemContainer, arg_14_0.tecItemTpl)

	var_14_0:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			local var_15_0 = arg_15_1 + 1

			arg_14_0.panelList[var_15_0] = arg_15_2

			arg_14_0:updateTecItem(var_15_0)
		end
	end)
	var_14_0:align(#pg.fleet_tech_group.all)
end

function var_0_0.updateTecItem(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.panelList[arg_16_1]
	local var_16_1 = var_16_0:Find("AwardPanel")

	arg_16_0:updateTecLevelAward(var_16_1, arg_16_1)

	local var_16_2 = var_16_0:Find("BaseInfo")
	local var_16_3 = var_16_2:Find("BG/Title/Text")
	local var_16_4 = var_16_2:Find("BG/UpLevelColor")
	local var_16_5 = var_16_2:Find("NationBG")
	local var_16_6 = var_16_2:Find("Code")
	local var_16_7 = var_16_6:Find("NationTextImg")
	local var_16_8 = var_16_2:Find("UpLevelBG")
	local var_16_9 = var_16_8:Find("UpLevelBtn")
	local var_16_10 = var_16_8:Find("FinishBtn")
	local var_16_11 = var_16_2:Find("Uping")
	local var_16_12 = var_16_11:Find("Text")
	local var_16_13 = var_16_2:Find("EnglishTextImg")
	local var_16_14 = var_16_2:Find("ProgressBarBG/Progress")
	local var_16_15 = var_16_2:Find("CampLogo")
	local var_16_16 = var_16_2:Find("LevelText/Text")
	local var_16_17 = var_16_2:Find("PointTextBar")
	local var_16_18 = pg.fleet_tech_group[arg_16_1].name
	local var_16_19 = pg.fleet_tech_group[arg_16_1].nation[1]

	setImageSprite(var_16_5, GetSpriteFromAtlas("TecNation", "camptec_nation_bar_" .. var_16_19))
	setImageSprite(var_16_7, GetSpriteFromAtlas("TecNation", "camptec_nation_text_" .. var_16_19), true)
	setImageSprite(var_16_13, GetSpriteFromAtlas("TecNation", "camp_tec_english_" .. var_16_19), true)
	setImageSprite(var_16_15, GetSpriteFromAtlas("TecNation", "camptec_logo_" .. var_16_19))
	setText(var_16_3, var_16_18)

	local var_16_20
	local var_16_21
	local var_16_22 = not arg_16_0.tecList[arg_16_1] and 0 or table.indexof(pg.fleet_tech_group[arg_16_1].techs, arg_16_0.tecList[arg_16_1].completeID, 1) or 0
	local var_16_23 = arg_16_0.nationToPoint[var_16_19]
	local var_16_24

	if var_16_22 == 0 then
		var_16_21 = pg.fleet_tech_group[arg_16_1].techs[1]
		var_16_24 = pg.fleet_tech_template[var_16_21].pt
	elseif var_16_22 == #pg.fleet_tech_group[arg_16_1].techs then
		var_16_21 = pg.fleet_tech_group[arg_16_1].techs[var_16_22]
		var_16_24 = pg.fleet_tech_template[var_16_21].pt
	else
		var_16_21 = pg.fleet_tech_group[arg_16_1].techs[var_16_22 + 1]
		var_16_24 = pg.fleet_tech_template[var_16_21].pt
	end

	BaseUI:setImageAmount(var_16_14, 0.1 + 0.8 * var_16_23 / var_16_24)
	setText(var_16_16, var_16_22)
	setText(var_16_17, var_16_23 .. "/" .. var_16_24)

	local function var_16_25(arg_17_0, arg_17_1, arg_17_2)
		setActive(var_16_6, arg_17_0)
		setActive(var_16_8, arg_17_1)
		setActive(var_16_4, arg_17_1)
		setActive(var_16_9, arg_17_1)
		setActive(var_16_11, arg_17_2)
	end

	if not arg_16_0.tecList[arg_16_1] then
		if var_16_24 <= var_16_23 then
			var_16_25(false, true, false)
		else
			var_16_25(true, false, false)
		end
	elseif var_16_22 == #pg.fleet_tech_group[arg_16_1].techs then
		var_16_25(true, false, false)
	elseif arg_16_0.tecList[arg_16_1].studyID ~= 0 then
		var_16_25(false, false, true)

		if arg_16_0.timerList[arg_16_1] then
			arg_16_0.timerList[arg_16_1]:Stop()
		end

		local var_16_26 = arg_16_0.nationProxy:getLeftTime()

		setText(var_16_12, pg.TimeMgr.GetInstance():DescCDTime(var_16_26))

		arg_16_0.timerList[arg_16_1] = Timer.New(function()
			var_16_26 = var_16_26 - 1

			setText(var_16_12, pg.TimeMgr.GetInstance():DescCDTime(var_16_26))

			if var_16_26 == 0 then
				arg_16_0.timerList[arg_16_1]:Stop()
			end
		end, 1, -1)

		arg_16_0.timerList[arg_16_1]:Start()
	elseif var_16_24 <= var_16_23 then
		var_16_25(false, true, false)
	else
		var_16_25(true, false, false)
	end

	onButton(arg_16_0, var_16_9, function()
		arg_16_0:emit(TechnologyConst.CLICK_UP_TEC_BTN, arg_16_1, var_16_21)
	end, SFX_PANEL)

	local var_16_27 = var_16_0:Find("Mask/DetailPanel")
	local var_16_28 = GetComponent(var_16_0, "LayoutElement")
	local var_16_29 = var_16_27:Find("Toggle")

	arg_16_0:updateDetailPanel(var_16_27, var_16_22, arg_16_1, var_16_19, false)
	onToggle(arg_16_0, var_16_2:Find("BG"), function(arg_20_0)
		if arg_20_0 then
			triggerToggle(var_16_29, false)
			LeanTween.value(go(var_16_0), arg_16_0.tecItemTplOriginWidth, arg_16_0.tecItemTplOriginWidth + var_16_27.rect.width, 0.25):setOnUpdate(System.Action_float(function(arg_21_0)
				var_16_28.preferredWidth = arg_21_0

				if arg_16_1 == #pg.fleet_tech_group.all then
					arg_16_0.scrollRectCom.horizontalNormalizedPosition = 1
				end
			end)):setOnComplete(System.Action(function()
				if arg_16_1 == #pg.fleet_tech_group.all then
					arg_16_0.scrollRectCom.horizontalNormalizedPosition = 1
				end
			end))
		else
			LeanTween.cancel(go(var_16_0))

			local var_20_0 = var_16_28.preferredWidth

			LeanTween.value(go(var_16_0), var_20_0, arg_16_0.tecItemTplOriginWidth, 0.25):setOnUpdate(System.Action_float(function(arg_23_0)
				var_16_28.preferredWidth = arg_23_0
			end))
		end
	end)
end

function var_0_0.updateDetailPanel(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4, arg_24_5)
	local var_24_0 = arg_24_1:Find("TypeItemContainer")
	local var_24_1 = arg_24_1:Find("BG/Logo")

	setImageSprite(var_24_1, GetSpriteFromAtlas("TecNation", "camptec_logo_" .. arg_24_4))

	local var_24_2 = arg_24_1:Find("Toggle")

	if arg_24_2 == #pg.fleet_tech_group[arg_24_3].techs and arg_24_5 == false then
		setActive(var_24_2, false)
	end

	local function var_24_3(arg_25_0, arg_25_1, arg_25_2)
		local var_25_0 = UIItemList.New(var_24_0, arg_24_0.typeItemTpl)
		local var_25_1

		if arg_25_0 == 0 then
			var_25_0:align(0)

			return
		else
			var_25_1 = pg.fleet_tech_group[arg_25_1].techs[arg_25_0]
		end

		local var_25_2
		local var_25_3
		local var_25_4
		local var_25_5 = Color.New(1, 0.9333333333333333, 0.19215686274509805)

		if arg_25_2 then
			var_25_2, var_25_3, var_25_4 = arg_24_0:calculateCurBuff(arg_25_0 - 1, arg_25_1)
		end

		local var_25_6 = pg.fleet_tech_template[var_25_1].add
		local var_25_7 = {}
		local var_25_8 = {}

		for iter_25_0, iter_25_1 in ipairs(var_25_6) do
			local var_25_9 = iter_25_1[2]
			local var_25_10 = iter_25_1[3]
			local var_25_11 = ShipType.FilterOverQuZhuType(iter_25_1[1])

			for iter_25_2, iter_25_3 in ipairs(var_25_11) do
				local var_25_12

				if arg_25_2 then
					if not table.indexof(var_25_2, iter_25_3, 1) then
						var_25_12 = {
							attr = var_25_9,
							value = var_25_10,
							attrColor = var_25_5,
							valueColor = var_25_5
						}
					elseif not table.indexof(var_25_3[iter_25_3], var_25_9, 1) then
						var_25_12 = {
							attr = var_25_9,
							value = var_25_10,
							attrColor = var_25_5,
							valueColor = var_25_5
						}
					elseif var_25_10 ~= var_25_4[iter_25_3][var_25_9] then
						var_25_12 = {
							attr = var_25_9,
							value = var_25_10,
							valueColor = var_25_5
						}
					else
						var_25_12 = {
							attr = var_25_9,
							value = var_25_10
						}
					end
				else
					var_25_12 = {
						attr = var_25_9,
						value = var_25_10
					}
				end

				if var_25_7[iter_25_3] then
					table.insert(var_25_7[iter_25_3], var_25_12)
				else
					var_25_7[iter_25_3] = {
						var_25_12
					}
					var_25_8[#var_25_8 + 1] = iter_25_3
				end
			end
		end

		var_25_0:make(function(arg_26_0, arg_26_1, arg_26_2)
			if arg_26_0 == UIItemList.EventUpdate then
				local var_26_0 = arg_26_2:Find("TypeIcon")
				local var_26_1 = arg_26_2:Find("BuffItemContainer")
				local var_26_2 = var_25_8[arg_26_1 + 1]

				setImageSprite(var_26_0, GetSpriteFromAtlas("ShipType", "buffitem_tec_" .. var_26_2))
				arg_24_0:upBuffList(arg_26_2, var_25_7[var_26_2])
			end
		end)
		var_25_0:align(#var_25_8)
	end

	onToggle(arg_24_0, var_24_2, function(arg_27_0)
		if arg_27_0 == true then
			var_24_3(arg_24_2 + 1, arg_24_3, true)
		else
			var_24_3(arg_24_2, arg_24_3)
		end
	end, SFX_PANEL)

	if arg_24_5 == false then
		triggerToggle(var_24_2, false)
	end
end

function var_0_0.upBuffList(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_1:Find("BuffItemContainer")
	local var_28_1 = UIItemList.New(var_28_0, arg_28_0.buffItemTpl)

	var_28_1:make(function(arg_29_0, arg_29_1, arg_29_2)
		if arg_29_0 == UIItemList.EventUpdate then
			local var_29_0 = arg_29_2:Find("AttrText")
			local var_29_1 = arg_29_2:Find("ValueText")
			local var_29_2 = arg_28_2[arg_29_1 + 1].attr
			local var_29_3 = arg_28_2[arg_29_1 + 1].value
			local var_29_4 = arg_28_2[arg_29_1 + 1].attrColor
			local var_29_5 = arg_28_2[arg_29_1 + 1].valueColor

			setText(var_29_0, AttributeType.Type2Name(pg.attribute_info_by_type[var_29_2].name))
			setText(var_29_1, "+" .. var_29_3)

			if var_29_4 then
				setTextColor(var_29_0, var_29_4)
			else
				setTextColor(var_29_0, Color.white)
			end

			if var_29_5 then
				setTextColor(var_29_1, var_29_5)
			else
				setTextColor(var_29_1, Color.green)
			end
		end
	end)
	var_28_1:align(#arg_28_2)
end

function var_0_0.updateTecLevelAward(arg_30_0, arg_30_1, arg_30_2)
	if LOCK_TEC_NATION_AWARD then
		setActive(arg_30_1, false)

		return
	end

	local var_30_0 = arg_30_0._tf:Find("AwardItem")
	local var_30_1 = arg_30_1:Find("ItemContainer")
	local var_30_2 = UIItemList.New(var_30_1, arg_30_0.awardTpl)
	local var_30_3 = arg_30_1:Find("Level")
	local var_30_4 = arg_30_1:Find("Level/Num")
	local var_30_5 = arg_30_1:Find("GetBtn")
	local var_30_6 = arg_30_1:Find("DisGetBtn")
	local var_30_7 = arg_30_1:Find("FinishBtn")
	local var_30_8 = arg_30_0.nationProxy:GetTecItemByGroupID(arg_30_2)
	local var_30_9 = pg.fleet_tech_group[arg_30_2]
	local var_30_10 = var_30_8 and var_30_8.rewardedID or 0
	local var_30_11 = var_30_8 and var_30_8.completeID or 0
	local var_30_12 = table.indexof(var_30_9.techs, var_30_10, 1) or 0
	local var_30_13 = table.indexof(var_30_9.techs, var_30_11, 1) or 0
	local var_30_14 = var_30_12 + 1
	local var_30_15

	if var_30_12 < var_30_13 then
		var_30_15 = var_30_9.techs[var_30_14]
	elseif var_30_12 == var_30_13 and var_30_12 < #var_30_9.techs then
		var_30_15 = var_30_9.techs[var_30_14]
	end

	if var_30_15 then
		setActive(var_30_3, true)
		setActive(var_30_1, true)
		setActive(var_30_5, var_30_12 < var_30_13)
		setActive(var_30_6, var_30_12 == var_30_13)
		setActive(var_30_7, false)
		setText(var_30_4, var_30_14)

		local var_30_16 = pg.fleet_tech_template[var_30_15].level_award_display

		var_30_2:make(function(arg_31_0, arg_31_1, arg_31_2)
			if arg_31_0 == UIItemList.EventUpdate then
				arg_31_1 = arg_31_1 + 1

				local var_31_0 = var_30_16[arg_31_1]
				local var_31_1 = {
					type = var_31_0[1],
					id = var_31_0[2],
					count = var_31_0[3]
				}

				updateDrop(arg_31_2, var_31_1)
			end
		end)
		var_30_2:align(#var_30_16)

		if var_30_12 < var_30_13 then
			onButton(arg_30_0, var_30_5, function()
				pg.m02:sendNotification(GAME.GET_CAMP_TEC_AWARD, {
					groupID = arg_30_2,
					tecID = var_30_15
				})
			end, SFX_PANEL)
		end
	else
		setActive(var_30_3, false)
		setActive(var_30_1, false)
		setActive(var_30_5, false)
		setActive(var_30_6, false)
		setActive(var_30_7, true)
	end
end

function var_0_0.updateOneStepBtn(arg_33_0)
	if LOCK_TEC_NATION_AWARD then
		setActive(arg_33_0.oneStepBtn, false)

		return
	end

	setActive(arg_33_0.oneStepBtn, arg_33_0.nationProxy:isAnyTecCampCanGetAward())
end

function var_0_0.updateTecListData(arg_34_0)
	arg_34_0.tecList = getProxy(TechnologyNationProxy):GetTecList()
end

return var_0_0
