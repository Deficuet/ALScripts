local var_0_0 = class("NewBattleResultStatisticsPage", import("view.base.BaseSubView"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 0
local var_0_4 = 1

function var_0_0.getUIName(arg_1_0)
	return "NewBattleResultStatisticsPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.mask = arg_2_0:findTF("mask")
	arg_2_0.paintingTr = arg_2_0:findTF("painting")
	arg_2_0.resultPaintingTr = arg_2_0:findTF("result")
	arg_2_0.topPanel = arg_2_0:findTF("top")
	arg_2_0.gradeIcon = arg_2_0:findTF("top/grade/icon"):GetComponent(typeof(Image))
	arg_2_0.gradeTxt = arg_2_0:findTF("top/grade/Text"):GetComponent(typeof(Image))
	arg_2_0.chapterName = arg_2_0:findTF("top/grade/chapterName"):GetComponent(typeof(Text))
	arg_2_0.opBonus = arg_2_0:findTF("top/grade/operation_bonus")
	arg_2_0.playerName = arg_2_0:findTF("top/exp/name"):GetComponent(typeof(Text))
	arg_2_0.playerLv = arg_2_0:findTF("top/exp/lv"):GetComponent(typeof(Text))
	arg_2_0.playerExp = arg_2_0:findTF("top/exp/Text"):GetComponent(typeof(Text))
	arg_2_0.playerExpLabel = arg_2_0:findTF("top/exp/Text/exp_label"):GetComponent(typeof(Text))
	arg_2_0.playerExpBar = arg_2_0:findTF("top/exp/exp_bar/progress"):GetComponent(typeof(Image))
	arg_2_0.commmanderContainer = arg_2_0:findTF("top/exp/commanders")
	arg_2_0.shipContainer = arg_2_0:findTF("left")
	arg_2_0.rawImage = arg_2_0._tf:Find("bg"):GetComponent(typeof(RawImage))
	arg_2_0.blackBg = arg_2_0._tf:Find("black")
	arg_2_0.bottomPanel = arg_2_0:findTF("bottom")
	arg_2_0.confrimBtn = arg_2_0:findTF("bottom/confirmBtn")
	arg_2_0.statisticsBtn = arg_2_0:findTF("bottom/statisticsBtn")
	arg_2_0.mainFleetBtn = arg_2_0:findTF("bottom/mainFleetBtn")
	arg_2_0.subFleetBtn = arg_2_0:findTF("bottom/subFleetBtn")
	arg_2_0.chatText = arg_2_0:findTF("chat/Text"):GetComponent(typeof(Text))

	setText(arg_2_0.confrimBtn:Find("Text"), i18n("msgbox_text_confirm"))

	arg_2_0.cg = GetOrAddComponent(arg_2_0._tf, typeof(CanvasGroup))
	arg_2_0.commaderTpls = {}
	arg_2_0.emptyTpls = {
		arg_2_0:findTF("top/exp/emptycomanders/1"),
		arg_2_0:findTF("top/exp/emptycomanders/2")
	}

	setText(arg_2_0.emptyTpls[1]:Find("Text"), i18n("series_enemy_empty_commander_main"))
	setText(arg_2_0.emptyTpls[2]:Find("Text"), i18n("series_enemy_empty_commander_assistant"))

	arg_2_0.surfaceShipTpls = {}
	arg_2_0.subShipTpls = {}
	arg_2_0.animationFlags = {
		[var_0_1] = {
			[var_0_3] = false,
			[var_0_4] = false
		},
		[var_0_2] = {
			[var_0_3] = false,
			[var_0_4] = false
		}
	}
	arg_2_0.animation = NewBattleResultAnimation.New(arg_2_0._tf)
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.teamType = var_0_1
	arg_3_0.displayMode = var_0_3
end

function var_0_0.SetUp(arg_4_0, arg_4_1, arg_4_2)
	seriesAsync({
		function(arg_5_0)
			arg_4_0.cg.alpha = 0

			arg_4_0:UpdatePainting(arg_5_0)
			arg_4_0:UpdateGrade()
			arg_4_0:UpdateChapterName()
			arg_4_0:UpdateSwitchBtn()
			arg_4_0:UpdatePlayer()
		end,
		function(arg_6_0)
			arg_4_0:LoadBG(arg_6_0)
		end,
		function(arg_7_0)
			arg_4_0.cg.alpha = 1

			arg_4_0:PlayEnterAnimation(arg_7_0)
		end,
		function(arg_8_0)
			if arg_4_2 then
				arg_4_2()
			end

			arg_4_0:InitMainView(arg_8_0)
		end
	}, function()
		arg_4_0:UpdateMetaBtn()
		arg_4_0:RegisterEvent(arg_4_1)
	end)
end

function var_0_0.InitMainView(arg_10_0, arg_10_1)
	arg_10_0.isEnter = true

	parallelAsync({
		function(arg_11_0)
			arg_10_0:UpdateCommanders(arg_11_0)
		end,
		function(arg_12_0)
			arg_10_0:StartEnterAnimation(arg_12_0)
		end,
		function(arg_13_0)
			arg_10_0:InitShips(arg_13_0)
		end
	}, arg_10_1)
end

function var_0_0.PlayEnterAnimation(arg_14_0, arg_14_1)
	if not getProxy(SettingsProxy):IsDisplayResultPainting() then
		arg_14_1()
		Object.Destroy(arg_14_0.rawImage.gameObject)

		return
	end

	local var_14_0 = pg.UIMgr.GetInstance().uiCamera.gameObject.transform:Find("Canvas")

	arg_14_0.rawImage.texture = pg.UIMgr.GetInstance():GetStaticRtt(pg.UIMgr.CameraUI)
	rtf(arg_14_0.rawImage.gameObject).sizeDelta = var_14_0.sizeDelta
	arg_14_0.blackBg.sizeDelta = var_14_0.sizeDelta

	if arg_14_0.effectTr then
		arg_14_0.effectTr.anchorMax = Vector2(0.5, 0.5)
		arg_14_0.effectTr.anchorMin = Vector2(0.5, 0.5)

		local var_14_1 = GameObject.Find("UICamera/Canvas").transform

		arg_14_0.effectTr.sizeDelta = var_14_1.sizeDelta
	end

	setAnchoredPosition(arg_14_0.topPanel, {
		y = 320
	})
	setAnchoredPosition(arg_14_0.bottomPanel, {
		y = -320
	})

	local var_14_2 = arg_14_0:GetPaintingPosition()

	arg_14_0.mask.localPosition = var_14_2

	if arg_14_0.animation then
		arg_14_0.animation:Play(arg_14_0.resultPaintingData, function()
			arg_14_0.rawImage.texture = nil

			Object.Destroy(arg_14_0.rawImage.gameObject)
			arg_14_1()
		end)
	end
end

function var_0_0.LoadBG(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0._parentTf:Find("Effect")

	if not IsNil(var_16_0) then
		setParent(var_16_0, arg_16_0._tf)
		var_16_0:SetSiblingIndex(2)

		arg_16_0.effectTr = var_16_0

		arg_16_1()
	else
		local var_16_1 = NewBattleResultUtil.Score2Bg(arg_16_0.contextData.score)

		LoadAnyAsync("BattleResultItems/" .. var_16_1, "", nil, function(arg_17_0)
			if arg_16_0.exited or IsNil(arg_17_0) then
				if arg_16_1 then
					arg_16_1()
				end

				return
			end

			local var_17_0 = Object.Instantiate(arg_17_0, arg_16_0._tf)

			var_17_0.transform:SetSiblingIndex(2)

			arg_16_0.effectTr = var_17_0.transform

			if arg_16_1 then
				arg_16_1()
			end
		end)
	end
end

function var_0_0.RegisterEvent(arg_18_0, arg_18_1)
	onButton(arg_18_0, arg_18_0.mainFleetBtn, function()
		arg_18_0.teamType = var_0_1

		arg_18_0:UpdateShips(false)
		arg_18_0:UpdateCommanders(function()
			return
		end)
		arg_18_0:UpdateSwitchBtn()
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.subFleetBtn, function()
		arg_18_0.teamType = var_0_2

		arg_18_0:UpdateShips(false)
		arg_18_0:UpdateCommanders(function()
			return
		end)
		arg_18_0:UpdateSwitchBtn()
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.statisticsBtn, function()
		arg_18_0.displayMode = 1 - arg_18_0.displayMode

		arg_18_0:UpdateShipDetail()
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.confrimBtn, function()
		arg_18_1()
	end, SFX_PANEL)

	if arg_18_0.contextData.autoSkipFlag then
		onNextTick(function()
			triggerButton(arg_18_0.confrimBtn)
		end)
	end
end

local function var_0_5(arg_26_0, arg_26_1)
	onButton(arg_26_0, arg_26_1, function()
		setActive(arg_26_1, false)

		if arg_26_0.metaExpView then
			return
		end

		arg_26_0.metaExpView = BattleResultMetaExpView.New(arg_26_0._tf, arg_26_0.event, arg_26_0.contextData)

		local var_27_0 = getProxy(MetaCharacterProxy):getLastMetaSkillExpInfoList()

		arg_26_0.metaExpView:setData(var_27_0, function()
			if arg_26_1 then
				setActive(arg_26_1, true)
			end

			arg_26_0.metaExpView = nil
		end)
		arg_26_0.metaExpView:Reset()
		arg_26_0.metaExpView:Load()
		arg_26_0.metaExpView:ActionInvoke("Show")
		arg_26_0.metaExpView:ActionInvoke("openPanel")
	end, SFX_PANEL)
end

function var_0_0.UpdateMetaBtn(arg_29_0)
	local var_29_0 = getProxy(MetaCharacterProxy):getLastMetaSkillExpInfoList()

	if var_29_0 and #var_29_0 > 0 then
		LoadAnyAsync("BattleResultItems/MetaBtn", "", nil, function(arg_30_0)
			if arg_29_0.exited or IsNil(arg_30_0) then
				return
			end

			local var_30_0 = Object.Instantiate(arg_30_0, arg_29_0._tf)

			var_0_5(arg_29_0, var_30_0.transform)
		end)
	end
end

function var_0_0.StartEnterAnimation(arg_31_0, arg_31_1)
	LeanTween.value(arg_31_0.topPanel.gameObject, 320, 0, 0.2):setOnUpdate(System.Action_float(function(arg_32_0)
		setAnchoredPosition(arg_31_0.topPanel, {
			y = arg_32_0
		})
	end))
	LeanTween.value(arg_31_0.bottomPanel.gameObject, -320, 0, 0.2):setOnUpdate(System.Action_float(function(arg_33_0)
		setAnchoredPosition(arg_31_0.bottomPanel, {
			y = arg_33_0
		})
	end)):setOnComplete(System.Action(arg_31_1))
end

function var_0_0.GetShipSlotExpandPosition(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0:GetShipSlotShrinkPosition(arg_34_1)

	return Vector2(1300, var_34_0.y)
end

function var_0_0.GetShipSlotShrinkPosition(arg_35_0, arg_35_1)
	return Vector2(500, 250) + (arg_35_1 - 1) * Vector2(69.55, -117.7)
end

local function var_0_6(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = ""
	local var_36_1 = arg_36_0 and arg_36_0[arg_36_2]

	if arg_36_1 or var_36_1 then
		var_36_0 = arg_36_1 and arg_36_1:getConfig("name") or var_36_1 and i18n("Word_Ship_Exp_Buff")
	end

	return var_36_0
end

function var_0_0.GetAnimationFlag(arg_37_0)
	if arg_37_0.contextData.autoSkipFlag then
		return false
	end

	local var_37_0 = arg_37_0.animationFlags[arg_37_0.teamType][arg_37_0.displayMode]

	if var_37_0 == false then
		arg_37_0.animationFlags[arg_37_0.teamType][arg_37_0.displayMode] = true
	end

	return not var_37_0
end

function var_0_0.UpdateShipDetail(arg_38_0)
	local var_38_0 = arg_38_0.teamType == var_0_1
	local var_38_1 = var_38_0 and arg_38_0.surfaceShipTpls or arg_38_0.subShipTpls
	local var_38_2, var_38_3 = NewBattleResultUtil.SeparateSurfaceAndSubShips(arg_38_0.contextData.oldMainShips)
	local var_38_4 = var_38_0 and var_38_2 or var_38_3
	local var_38_5 = arg_38_0.displayMode == var_0_3
	local var_38_6 = arg_38_0.contextData.expBuff
	local var_38_7 = arg_38_0.contextData.buffShips
	local var_38_8 = NewBattleResultUtil.GetMaxOutput(arg_38_0.contextData.oldMainShips, arg_38_0.contextData.statistics)

	arg_38_0.numeberAnimations = {}

	local var_38_9 = arg_38_0:GetAnimationFlag()

	for iter_38_0, iter_38_1 in ipairs(var_38_4) do
		local var_38_10 = arg_38_0.contextData.statistics[iter_38_1.id] or {}
		local var_38_11 = var_38_1[iter_38_0]
		local var_38_12 = arg_38_0.contextData.newMainShips[iter_38_1.id]

		local function var_38_13()
			setText(var_38_11:Find("atk"), not var_38_5 and (var_38_10.output or 0) or "EXP" .. "<color=#FFDE38>+" .. NewBattleResultUtil.GetShipExpOffset(iter_38_1, var_38_12) .. "</color>")
			setText(var_38_11:Find("killCount"), not var_38_5 and (var_38_10.kill_count or 0) or "Lv." .. var_38_12.level)

			var_38_11:Find("dmg/bar"):GetComponent(typeof(Image)).fillAmount = not var_38_5 and (var_38_10.output or 0) / var_38_8 or var_38_12:getExp() / getExpByRarityFromLv1(var_38_12:getConfig("rarity"), var_38_12.level)
		end

		if var_38_9 then
			local var_38_14 = NewBattleResultShipCardAnimation.New(var_38_11, var_38_5, iter_38_1, var_38_12, var_38_10, var_38_8)

			var_38_14:SetUp(var_38_13)
			table.insert(arg_38_0.numeberAnimations, var_38_14)
		else
			var_38_13()
		end

		setText(var_38_11:Find("kill_count_label"), not var_38_5 and i18n("battle_result_kill_count") or iter_38_1:getName())
		setText(var_38_11:Find("dmg_count_label"), not var_38_5 and i18n("battle_result_dmg") or var_0_6(var_38_7, var_38_6, iter_38_1:getGroupId()) or "")
	end
end

local function var_0_7(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_1:Find("MVP")

	if IsNil(var_40_0) then
		LoadAnyAsync("BattleResultItems/MVP", "", nil, function(arg_41_0)
			if arg_40_0.exited or IsNil(arg_41_0) then
				return
			end

			Object.Instantiate(arg_41_0, arg_40_1).name = "MVP"
		end)
	end

	local var_40_1 = arg_40_1:Find("MVPBG")

	if IsNil(var_40_1) then
		LoadAnyAsync("BattleResultItems/MVPBG", "", nil, function(arg_42_0)
			if arg_40_0.exited or IsNil(arg_42_0) then
				return
			end

			local var_42_0 = Object.Instantiate(arg_42_0, arg_40_1)

			var_42_0.name = "MVPBG"

			var_42_0.transform:SetAsFirstSibling()
		end)
	end
end

local function var_0_8(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_1:Find("LevelUp")

	if IsNil(var_43_0) then
		LoadAnyAsync("BattleResultItems/LevelUp", "", nil, function(arg_44_0)
			if arg_43_0.exited or IsNil(arg_44_0) then
				return
			end

			Object.Instantiate(arg_44_0, arg_43_1).name = "LevelUp"
		end)
	end
end

local function var_0_9(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_1:Find("Intmacy")

	if IsNil(var_45_0) then
		ResourceMgr.Inst:getAssetAsync("ui/zhandoujiesuan_xingxing", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_46_0)
			if arg_45_0.exited or IsNil(arg_46_0) then
				return
			end

			Object.Instantiate(arg_46_0, arg_45_1).name = "Intmacy"
		end), true, true)
	end
end

local function var_0_10(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4, arg_47_5)
	local var_47_0 = arg_47_1:Find("mask/icon"):GetComponent(typeof(Image))

	var_47_0.sprite = LoadSprite("herohrzicon/" .. arg_47_2:getPainting())
	var_47_0.gameObject.transform.sizeDelta = Vector2(432, 96)

	setImageSprite(arg_47_1:Find("type"), GetSpriteFromAtlas("shiptype", shipType2print(arg_47_2:getShipType())), true)

	local var_47_1 = arg_47_2:getStar()
	local var_47_2 = arg_47_2:getMaxStar()
	local var_47_3 = UIItemList.New(arg_47_1:Find("stars"), arg_47_1:Find("stars/star_tpl"))
	local var_47_4 = var_47_2 - var_47_1

	var_47_3:make(function(arg_48_0, arg_48_1, arg_48_2)
		if arg_48_0 == UIItemList.EventUpdate then
			local var_48_0 = arg_48_1 + 1 <= var_47_4

			SetActive(arg_48_2:Find("empty"), var_48_0)
			SetActive(arg_48_2:Find("star"), not var_48_0)
		end
	end)
	var_47_3:align(var_47_2)

	if arg_47_3 then
		var_0_7(arg_47_0, arg_47_1)
	end

	if arg_47_4 then
		var_0_8(arg_47_0, arg_47_1)
	end

	if arg_47_5 then
		onDelayTick(function()
			if arg_47_0.exited then
				return
			end

			var_0_9(arg_47_0, arg_47_1)
		end, 1)
	end
end

function var_0_0.InitShips(arg_50_0, arg_50_1)
	arg_50_0:UpdateShips(true, arg_50_1)
end

function var_0_0.UpdateShips(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = arg_51_0.teamType == var_0_1 and arg_51_0.surfaceShipTpls or arg_51_0.subShipTpls
	local var_51_1 = arg_51_0.teamType == var_0_1 and arg_51_0.subShipTpls or arg_51_0.surfaceShipTpls
	local var_51_2, var_51_3 = NewBattleResultUtil.SeparateSurfaceAndSubShips(arg_51_0.contextData.oldMainShips)
	local var_51_4 = arg_51_0.teamType == var_0_1 and var_51_2 or var_51_3

	local function var_51_5()
		for iter_52_0, iter_52_1 in ipairs(var_51_4) do
			local var_52_0 = var_51_0[iter_52_0]

			var_52_0:GetComponent(typeof(CanvasGroup)).alpha = 1
			var_52_0.anchoredPosition = arg_51_0:GetShipSlotExpandPosition(iter_52_0)

			local var_52_1 = arg_51_0.contextData.newMainShips[iter_52_1.id]

			var_0_10(arg_51_0, var_52_0, iter_52_1, arg_51_0.contextData.statistics.mvpShipID and arg_51_0.contextData.statistics.mvpShipID == iter_52_1.id, var_52_1.level > iter_52_1.level, var_52_1:getIntimacy() > iter_52_1:getIntimacy())
		end

		arg_51_0:UpdateShipDetail()
		arg_51_0:StartShipsEnterAnimation(var_51_0, arg_51_1 and 0.6 or 0, arg_51_2)
	end

	arg_51_0:LoadShipTpls(var_51_0, var_51_4, var_51_5)

	for iter_51_0, iter_51_1 in ipairs(var_51_1) do
		iter_51_1:GetComponent(typeof(CanvasGroup)).alpha = 0
	end
end

function var_0_0.LoadShipTpls(arg_53_0, arg_53_1, arg_53_2, arg_53_3)
	local var_53_0 = {}

	if #arg_53_1 < #arg_53_2 then
		table.insert(var_53_0, function(arg_54_0)
			LoadAnyAsync("BattleResultItems/Ship", "", nil, function(arg_55_0)
				if arg_53_0.exited then
					arg_54_0()

					return
				end

				arg_54_0(arg_55_0)
			end)
		end)
		table.insert(var_53_0, function(arg_56_0, arg_56_1)
			if not arg_56_1 then
				arg_56_0()

				return
			end

			for iter_56_0 = #arg_53_1 + 1, #arg_53_2 do
				local var_56_0 = Object.Instantiate(arg_56_1, arg_53_0.shipContainer).transform

				var_56_0:GetComponent(typeof(CanvasGroup)).alpha = 0

				table.insert(arg_53_1, var_56_0)
			end

			arg_56_0()
		end)
	end

	seriesAsync(var_53_0, arg_53_3)
end

function var_0_0.StartShipsEnterAnimation(arg_57_0, arg_57_1, arg_57_2, arg_57_3)
	if arg_57_2 <= 0 then
		for iter_57_0, iter_57_1 in ipairs(arg_57_1) do
			iter_57_1.anchoredPosition = arg_57_0:GetShipSlotShrinkPosition(iter_57_0)
		end

		return
	end

	local var_57_0 = {}

	for iter_57_2, iter_57_3 in ipairs(arg_57_1) do
		local var_57_1 = iter_57_3:GetComponent(typeof(CanvasGroup))

		var_57_1.alpha = 0

		local var_57_2 = arg_57_0:GetShipSlotExpandPosition(iter_57_2)
		local var_57_3 = arg_57_0:GetShipSlotShrinkPosition(iter_57_2)

		table.insert(var_57_0, function(arg_58_0)
			if arg_57_0.exited then
				return
			end

			var_57_1.alpha = 1

			LeanTween.value(iter_57_3.gameObject, var_57_2.x, var_57_3.x, arg_57_2 - (iter_57_2 - 1) * 0.1):setOnUpdate(System.Action_float(function(arg_59_0)
				iter_57_3.anchoredPosition = Vector3(arg_59_0, iter_57_3.anchoredPosition.y, 0)
			end))
			onDelayTick(arg_58_0, 0.1)
		end)
	end

	seriesAsync(var_57_0, arg_57_3)
end

function var_0_0.UpdateSwitchBtn(arg_60_0)
	local var_60_0 = NewBattleResultUtil.HasSubShip(arg_60_0.contextData.oldMainShips)
	local var_60_1 = NewBattleResultUtil.HasSurfaceShip(arg_60_0.contextData.oldMainShips)

	setActive(arg_60_0.mainFleetBtn, arg_60_0.teamType == var_0_2 and var_60_1 and var_60_0)
	setActive(arg_60_0.subFleetBtn, arg_60_0.teamType == var_0_1 and var_60_1 and var_60_0)

	if not var_60_1 then
		arg_60_0.teamType = var_0_2
	end
end

function var_0_0.UpdateMvpPainting(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_0.contextData.oldMainShips
	local var_61_1, var_61_2, var_61_3, var_61_4 = NewBattleResultUtil.SeparateMvpShip(var_61_0, arg_61_0.contextData.statistics.mvpShipID, arg_61_0.contextData.statistics._flagShipID)

	var_61_4 = var_61_4 or var_61_0[#var_61_0 - 1]

	local var_61_5 = arg_61_0.resultPaintingTr
	local var_61_6 = var_61_4:getPainting()

	setPaintingPrefabAsync(var_61_5, var_61_6, "jiesuan", function()
		ShipExpressionHelper.SetExpression(findTF(var_61_5, "fitter"):GetChild(0), var_61_6, ShipWordHelper.WORD_TYPE_MVP, var_61_4:getCVIntimacy())
		arg_61_0:RecordPainting(arg_61_1)
	end)
	arg_61_0:DisplayShipDialogue(var_61_4)
end

function var_0_0.RecordPainting(arg_63_0, arg_63_1)
	onNextTick(function()
		local var_64_0 = arg_63_0.resultPaintingTr:Find("fitter"):GetChild(0)

		if not IsNil(var_64_0) then
			arg_63_0.resultPaintingData = {
				position = Vector2(var_64_0.position.x, var_64_0.position.y),
				pivot = rtf(var_64_0).pivot,
				scale = Vector2(var_64_0.localScale.x, var_64_0.localScale.y)
			}

			SetParent(var_64_0, arg_63_0.paintingTr:Find("painting/fitter"), true)
		end

		arg_63_1()
	end)
end

function var_0_0.UpdateFailedPainting(arg_65_0, arg_65_1)
	local var_65_0 = arg_65_0.contextData.oldMainShips

	LoadAnyAsync("BattleResultItems/FailedPainting", "", nil, function(arg_66_0)
		if arg_65_0.exited or IsNil(arg_66_0) then
			arg_65_1()

			return
		end

		Object.Instantiate(arg_66_0, arg_65_0.paintingTr).transform:SetAsFirstSibling()
		arg_65_1()
	end)
	arg_65_0:DisplayShipDialogue(var_65_0[math.random(#var_65_0)])
end

function var_0_0.GetPaintingPosition(arg_67_0)
	local var_67_0 = arg_67_0.contextData.oldMainShips

	return (NewBattleResultDisplayPaintingsPage.StaticGetFinalExpandPosition(#var_67_0))
end

function var_0_0.UpdatePaintingPosition(arg_68_0)
	local var_68_0 = arg_68_0:GetPaintingPosition()

	arg_68_0.paintingTr.localPosition = var_68_0
end

function var_0_0.UpdatePainting(arg_69_0, arg_69_1)
	arg_69_0:UpdatePaintingPosition()

	if arg_69_0.contextData.score > 1 then
		arg_69_0:UpdateMvpPainting(arg_69_1)
	else
		arg_69_0:UpdateFailedPainting(arg_69_1)
	end
end

function var_0_0.DisplayShipDialogue(arg_70_0, arg_70_1)
	local var_70_0
	local var_70_1
	local var_70_2

	if arg_70_0.contextData.score > 1 then
		local var_70_3, var_70_4

		var_70_3, var_70_4, var_70_1 = ShipWordHelper.GetWordAndCV(arg_70_1.skinId, ShipWordHelper.WORD_TYPE_MVP, nil, nil, arg_70_1:getCVIntimacy())
	else
		local var_70_5, var_70_6

		var_70_5, var_70_6, var_70_1 = ShipWordHelper.GetWordAndCV(arg_70_1.skinId, ShipWordHelper.WORD_TYPE_LOSE, nil, nil, arg_70_1:getCVIntimacy())
	end

	arg_70_0.chatText.text = var_70_1
	arg_70_0.chatText.alignment = #var_70_1 > CHAT_POP_STR_LEN and TextAnchor.MiddleLeft or TextAnchor.MiddleCenter

	arg_70_0:PlayMvpShipVoice()
end

function var_0_0.PlayMvpShipVoice(arg_71_0)
	if not arg_71_0.contextData.statistics.mvpShipID or type(arg_71_0.contextData.statistics.mvpShipID) == "number" and arg_71_0.contextData.statistics.mvpShipID <= 0 then
		return
	end

	local var_71_0 = _.detect(arg_71_0.contextData.oldMainShips, function(arg_72_0)
		return arg_72_0.id == arg_71_0.contextData.statistics.mvpShipID
	end)

	assert(var_71_0)

	local var_71_1
	local var_71_2
	local var_71_3

	if arg_71_0.contextData.score > 1 then
		local var_71_4, var_71_5

		var_71_4, var_71_3, var_71_5 = ShipWordHelper.GetWordAndCV(var_71_0.skinId, ShipWordHelper.WORD_TYPE_MVP, nil, nil, var_71_0:getCVIntimacy())
	else
		local var_71_6, var_71_7

		var_71_6, var_71_3, var_71_7 = ShipWordHelper.GetWordAndCV(var_71_0.skinId, ShipWordHelper.WORD_TYPE_LOSE)
	end

	if var_71_3 then
		arg_71_0:StopVoice()
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_71_3, function(arg_73_0)
			arg_71_0._currentVoice = arg_73_0
		end)
	end
end

function var_0_0.StopVoice(arg_74_0)
	if arg_74_0._currentVoice then
		arg_74_0._currentVoice:PlaybackStop()

		arg_74_0._currentVoice = nil
	end
end

function var_0_0.UpdateGrade(arg_75_0)
	local var_75_0, var_75_1 = NewBattleResultUtil.Score2Grade(arg_75_0.contextData.score, arg_75_0.contextData._scoreMark)

	LoadImageSpriteAsync(var_75_0, arg_75_0.gradeIcon, false)
	LoadImageSpriteAsync(var_75_1, arg_75_0.gradeTxt, false)
end

function var_0_0.UpdateChapterName(arg_76_0)
	local var_76_0 = NewBattleResultUtil.GetChapterName(arg_76_0.contextData)

	arg_76_0.chapterName.text = var_76_0

	setActive(arg_76_0.opBonus, NewBattleResultUtil.IsOpBonus(arg_76_0.contextData.extraBuffList))
end

function var_0_0.UpdatePlayer(arg_77_0)
	local var_77_0 = arg_77_0.contextData.oldPlayer
	local var_77_1 = getProxy(PlayerProxy):getRawData()

	arg_77_0.playerName.text = var_77_1:GetName()

	local function var_77_2()
		arg_77_0.playerLv.text = "Lv." .. var_77_1.level

		local var_78_0 = NewBattleResultUtil.GetPlayerExpOffset(var_77_0, var_77_1)

		arg_77_0.playerExp.text = "+" .. var_78_0
		arg_77_0.playerExpLabel.text = "EXP"
		arg_77_0.playerExpBar.fillAmount = var_77_1.level == var_77_1:getMaxLevel() and 1 or var_77_1.exp / getConfigFromLevel1(pg.user_level, var_77_1.level).exp_interval
	end

	if not arg_77_0.contextData.autoSkipFlag then
		local var_77_3 = NewBattleResultPlayerAniamtion.New(arg_77_0.playerLv, arg_77_0.playerExp, arg_77_0.playerExpBar, var_77_1, var_77_0)

		var_77_3:SetUp(var_77_2)

		arg_77_0.playerAniamtion = var_77_3
	else
		var_77_2()
	end
end

local function var_0_11(arg_79_0, arg_79_1, arg_79_2)
	GetImageSpriteFromAtlasAsync("commandericon/" .. arg_79_2:getPainting(), "", arg_79_0:Find("icon"))
	setText(arg_79_0:Find("name_text"), arg_79_2:getName())
	setText(arg_79_0:Find("lv_text"), "Lv." .. arg_79_2.level)
	setText(arg_79_0:Find("exp"), "+" .. arg_79_1.exp)

	local var_79_0 = arg_79_2:isMaxLevel() and 1 or arg_79_1.curExp / arg_79_2:getNextLevelExp()

	arg_79_0:Find("exp_bar/progress"):GetComponent(typeof(Image)).fillAmount = var_79_0
end

function var_0_0.UpdateCommanders(arg_80_0, arg_80_1)
	local var_80_0 = arg_80_0.teamType
	local var_80_1 = arg_80_0.contextData.commanderExps or {}
	local var_80_2 = var_80_0 == var_0_1 and var_80_1.surfaceCMD or var_80_1.submarineCMD

	var_80_2 = var_80_2 or {}

	local function var_80_3()
		for iter_81_0 = 1, #var_80_2 do
			local var_81_0 = getProxy(CommanderProxy):getCommanderById(var_80_2[iter_81_0].commander_id)

			setActive(arg_80_0.commaderTpls[iter_81_0], true)
			var_0_11(arg_80_0.commaderTpls[iter_81_0], var_80_2[iter_81_0], var_81_0)
		end

		for iter_81_1 = #arg_80_0.commaderTpls, #var_80_2 + 1, -1 do
			setActive(arg_80_0.commaderTpls[iter_81_1], false)
		end
	end

	for iter_80_0 = 1, #arg_80_0.emptyTpls do
		setActive(arg_80_0.emptyTpls[iter_80_0], var_80_2[iter_80_0] == nil)
	end

	arg_80_0:LoadCommanderTpls(#var_80_2, var_80_3)
	arg_80_1()
end

function var_0_0.LoadCommanderTpls(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0 = {}

	if arg_82_1 > #arg_82_0.commaderTpls then
		table.insert(var_82_0, function(arg_83_0)
			LoadAnyAsync("BattleResultItems/Commander", "", nil, function(arg_84_0)
				if arg_82_0.exited then
					arg_83_0()

					return
				end

				arg_83_0(arg_84_0)
			end)
		end)
		table.insert(var_82_0, function(arg_85_0, arg_85_1)
			if not arg_85_1 then
				arg_85_0()

				return
			end

			for iter_85_0 = #arg_82_0.commaderTpls + 1, arg_82_1 do
				table.insert(arg_82_0.commaderTpls, Object.Instantiate(arg_85_1, arg_82_0.commmanderContainer).transform)
			end

			arg_85_0()
		end)
	end

	seriesAsync(var_82_0, arg_82_2)
end

function var_0_0.onBackPressed(arg_86_0)
	if arg_86_0.metaExpView then
		arg_86_0.metaExpView:closePanel()

		arg_86_0.metaExpView = nil

		return true
	end

	return false
end

function var_0_0.OnDestroy(arg_87_0)
	arg_87_0.exited = true

	if arg_87_0.metaExpView then
		arg_87_0.metaExpView:Destroy()

		arg_87_0.metaExpView = nil
	end

	if arg_87_0:isShowing() then
		arg_87_0:Hide()
	end

	if arg_87_0.animation then
		arg_87_0.animation:Dispose()
	end

	arg_87_0.animation = nil

	if LeanTween.isTweening(arg_87_0.topPanel.gameObject) then
		LeanTween.cancel(arg_87_0.topPanel.gameObject)
	end

	if LeanTween.isTweening(arg_87_0.bottomPanel.gameObject) then
		LeanTween.cancel(arg_87_0.bottomPanel.gameObject)
	end

	if arg_87_0.surfaceShipTpls then
		for iter_87_0, iter_87_1 in ipairs(arg_87_0.surfaceShipTpls) do
			if LeanTween.isTweening(iter_87_1.gameObject) then
				LeanTween.cancel(iter_87_1.gameObject)
			end
		end
	end

	if arg_87_0.subShipTpls then
		for iter_87_2, iter_87_3 in ipairs(arg_87_0.subShipTpls) do
			if LeanTween.isTweening(iter_87_3.gameObject) then
				LeanTween.cancel(iter_87_3.gameObject)
			end
		end
	end

	if arg_87_0.numeberAnimations then
		for iter_87_4, iter_87_5 in ipairs(arg_87_0.numeberAnimations) do
			iter_87_5:Dispose()
		end
	end

	if arg_87_0.playerAniamtion then
		arg_87_0.playerAniamtion:Dispose()

		arg_87_0.playerAniamtion = nil
	end
end

return var_0_0
