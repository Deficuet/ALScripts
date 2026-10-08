local var_0_0 = class("CrusingScene", import("view.base.BaseUI"))

var_0_0.optionsPath = {
	"top/home"
}
var_0_0.FrameSpeed = 10
var_0_0.PlaySpeed = 1.5

function var_0_0.getUIName(arg_1_0)
	return "CrusingUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)
	local var_2_1 = PoolMgr.GetInstance()
	local var_2_2 = {}

	table.insert(var_2_2, function(arg_3_0)
		local var_3_0 = pg.battlepass_event_pt[var_2_0.id].crusing_map

		var_2_1:GetPrefab("crusingmap/" .. var_3_0, "", true, function(arg_4_0)
			arg_2_0.rtMap = tf(arg_4_0)
			arg_2_0.PhaseFrame, arg_2_0.AllFrameCount = CrusingMapInfo.GetPhaseFrame(var_3_0)

			arg_3_0()
		end)
	end)
	table.insert(var_2_2, function(arg_5_0)
		var_2_1:GetSpineChar(pg.battlepass_event_pt[var_2_0.id].spine_name, true, function(arg_6_0)
			arg_2_0.rtModel = tf(arg_6_0)

			arg_5_0()
		end)
	end)
	parallelAsync(var_2_2, function()
		setParent(arg_2_0.rtModel, arg_2_0.rtMap:Find("icon/model"))

		arg_2_0.rtModel.localScale = Vector3.one

		arg_2_1()
	end)
end

function var_0_0.getResource(arg_8_0)
	local var_8_0 = var_0_0.super.getResource(arg_8_0)
	local var_8_1 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if var_8_1 then
		local var_8_2 = pg.battlepass_event_pt[var_8_1.id]
		local var_8_3 = {
			var_8_2.crusing_map and "crusingmap/" .. var_8_2.crusing_map,
			var_8_2.spine_name and "char/" .. var_8_2.spine_name
		}

		for iter_8_0, iter_8_1 in ipairs(var_8_3) do
			if noEmptyStr(iter_8_1) and not table.contains(var_8_0, iter_8_1) then
				table.insert(var_8_0, iter_8_1)
			end
		end
	end

	return var_8_0
end

function var_0_0.init(arg_9_0)
	arg_9_0.rtBg = arg_9_0._tf:Find("bg")
	arg_9_0.scrollMap = arg_9_0.rtBg:Find("map_scroll")
	arg_9_0.btnTask = arg_9_0.rtBg:Find("task_btn")
	arg_9_0.textTip = arg_9_0.rtBg:Find("tip")
	arg_9_0.rtAward = arg_9_0._tf:Find("award_panel")
	arg_9_0.textPhase = arg_9_0.rtAward:Find("phase/Text")
	arg_9_0.sliderPt = arg_9_0.rtAward:Find("Slider")
	arg_9_0.comScroll = GetComponent(arg_9_0.rtAward:Find("view/content"), "LScrollRect")

	function arg_9_0.comScroll.onUpdateItem(arg_10_0, arg_10_1)
		arg_9_0:updateAwardInfo(tf(arg_10_1), arg_9_0.awardList[arg_10_0 + 1])
	end

	arg_9_0.rtNextAward = arg_9_0.rtAward:Find("next")
	arg_9_0.btnAll = arg_9_0.rtAward:Find("btn_all")
	arg_9_0.btnPay = arg_9_0.rtAward:Find("btn_pay")
	arg_9_0.btnAfter = arg_9_0.rtAward:Find("btn_after")
	arg_9_0.btnFinish = arg_9_0.rtAward:Find("btn_finish")
	arg_9_0.rtTop = arg_9_0._tf:Find("top")
	arg_9_0.btnBack = arg_9_0.rtTop:Find("back")
	arg_9_0.btnHelp = arg_9_0.rtTop:Find("help")
	arg_9_0.textDay = arg_9_0.rtTop:Find("day/Text")
	arg_9_0.chargeTipWindow = ChargeTipWindow.New(arg_9_0._tf, arg_9_0.event)
	arg_9_0.LTDic = {}
end

function var_0_0.didEnter(arg_11_0)
	onButton(arg_11_0, arg_11_0.btnBack, function()
		arg_11_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.btnTask, function()
		if arg_11_0.phase < #arg_11_0.awardList then
			arg_11_0:emit(CrusingMediator.EVENT_OPEN_TASK)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("battlepass_complete"))
		end
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.btnAll, function()
		local var_14_0 = arg_11_0.activity:GetCrusingUnreceiveAward()

		if #var_14_0 > 0 then
			local var_14_1 = {}

			if arg_11_0:checkLimitMax(var_14_0) then
				table.insert(var_14_1, function(arg_15_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("player_expResource_mail_fullBag"),
						onYes = arg_15_0
					})
				end)
			end

			seriesAsync(var_14_1, function()
				arg_11_0:emit(CrusingMediator.EVENT_GET_AWARD_ALL)
			end)
		end
	end, SFX_CONFIRM)
	onButton(arg_11_0, arg_11_0.btnPay, function()
		arg_11_0:openBuyPanel()
	end, SFX_CONFIRM)
	onButton(arg_11_0, arg_11_0.btnAfter, function()
		local var_18_0 = arg_11_0.activity:GetCrusingUnreceiveAward()

		if #var_18_0 > 0 then
			local var_18_1 = {}

			if arg_11_0:checkLimitMax(var_18_0) then
				table.insert(var_18_1, function(arg_19_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("player_expResource_mail_fullBag"),
						onYes = arg_19_0
					})
				end)
			end

			seriesAsync(var_18_1, function()
				arg_11_0:emit(CrusingMediator.EVENT_GET_AWARD_ALL)
			end)
		end
	end, SFX_CONFIRM)
	onButton(arg_11_0, arg_11_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("battlepass_main_help_" .. pg.battlepass_event_pt[arg_11_0.activity.id].map_name)
		})
	end, SFX_PANEL)

	local function var_11_0(arg_22_0)
		local var_22_0 = {
			_tf = arg_22_0,
			rtLine = arg_22_0:Find("line"),
			rtIcon = arg_22_0:Find("icon"),
			rtSimple = arg_22_0:Find("simple")
		}

		setParent(arg_22_0, arg_11_0.scrollMap)
		SetCompomentEnabled(arg_22_0, typeof(Image), false)

		arg_22_0.name = "map_tpl"

		SetAction(var_22_0.rtIcon:Find("model"):GetChild(0), "normal")

		return var_22_0
	end

	arg_11_0.maps = {
		var_11_0(arg_11_0.rtMap)
	}

	while #arg_11_0.maps < 3 do
		table.insert(arg_11_0.maps, var_11_0(tf(Instantiate(arg_11_0.rtMap))))
	end

	Canvas.ForceUpdateCanvases()

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.maps) do
		setParent(iter_11_1.rtLine, arg_11_0.scrollMap:Find("bg"), true)
	end

	GetComponent(arg_11_0.textTip, "RichText"):AddSprite("pt", GetSpriteFromAtlas(Drop.New({
		type = DROP_TYPE_VITEM,
		id = arg_11_0.ptId
	}):getIcon(), ""))
	setText(arg_11_0.textTip, i18n("battlepass_main_tip_" .. pg.battlepass_event_pt[arg_11_0.activity.id].map_name))

	local var_11_1 = arg_11_0.activity.stopTime - pg.TimeMgr.GetInstance():GetServerTime()

	setText(arg_11_0.textDay, i18n("battlepass_main_time", math.floor(var_11_1 / 86400), math.floor(var_11_1 % 86400 / 3600)))

	local var_11_2 = GetComponent(arg_11_0.scrollMap, typeof(ScrollRect))
	local var_11_3 = var_11_2.content.rect.width
	local var_11_4 = var_11_2.viewport.rect.width
	local var_11_5 = var_11_3 / 3 / (var_11_3 - var_11_4)

	onScroll(arg_11_0, arg_11_0.scrollMap, function(arg_23_0)
		if arg_23_0.x < 0.1 then
			local var_23_0 = var_11_2.velocity
			local var_23_1 = var_11_2.normalizedPosition

			var_23_1.x = arg_23_0.x + var_11_5
			var_11_2.normalizedPosition = var_23_1
			var_11_2.velocity = var_23_0
		elseif arg_23_0.x > 0.9 then
			local var_23_2 = var_11_2.velocity
			local var_23_3 = var_11_2.normalizedPosition

			var_23_3.x = arg_23_0.x - var_11_5
			var_11_2.normalizedPosition = var_23_3
			var_11_2.velocity = var_23_2
		end
	end)
	arg_11_0:onScroll(arg_11_0.comScroll, function(arg_24_0)
		arg_11_0:updateNextAward(arg_24_0.y)
	end)
	arg_11_0:updateAwardPanel()
	arg_11_0:buildPhaseAwardScrollPos()

	if arg_11_0.phase == 0 then
		arg_11_0.comScroll:ScrollTo(0)
	elseif arg_11_0.phase == #arg_11_0.awardList then
		arg_11_0.comScroll:ScrollTo(1)
	else
		arg_11_0.comScroll:ScrollTo(math.clamp(arg_11_0.phasePos[arg_11_0.phase], 0, 1))
	end

	arg_11_0:updateMapStatus()
	LoadImageSpriteAtlasAsync(Drop.New({
		type = DROP_TYPE_VITEM,
		id = arg_11_0.ptId
	}):getIcon(), "", arg_11_0.sliderPt:Find("Text/icon"), true)
	arg_11_0:updateMapWay()
end

function var_0_0.willExit(arg_25_0)
	for iter_25_0, iter_25_1 in pairs(arg_25_0.LTDic) do
		if iter_25_1 then
			LeanTween.cancel(iter_25_0)
		end
	end

	local var_25_0 = PoolMgr.GetInstance()
	local var_25_1 = pg.battlepass_event_pt[arg_25_0.activity.id].crusing_map
	local var_25_2 = pg.battlepass_event_pt[arg_25_0.activity.id].spine_name

	for iter_25_2, iter_25_3 in ipairs(arg_25_0.maps) do
		setParent(iter_25_3.rtLine, iter_25_3._tf, true)
		var_25_0:ReturnSpineChar(var_25_2, go(iter_25_3.rtIcon:Find("model"):GetChild(0)))
		var_25_0:ReturnPrefab("crusingmap/" .. var_25_1, "", go(iter_25_3._tf))
	end

	if arg_25_0.chargeTipWindow then
		arg_25_0.chargeTipWindow:Destroy()

		arg_25_0.chargeTipWindow = nil
	end
end

function var_0_0.setActivity(arg_26_0, arg_26_1)
	arg_26_0.activity = arg_26_1

	for iter_26_0, iter_26_1 in pairs(arg_26_1:GetCrusingInfo()) do
		arg_26_0[iter_26_0] = iter_26_1
	end
end

function var_0_0.setPlayer(arg_27_0, arg_27_1)
	arg_27_0.player = arg_27_1
end

function var_0_0.updateAwardInfo(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_2.pt <= arg_28_0.pt

	if arg_28_1:Find("mask") then
		setActive(arg_28_1:Find("mask"), not var_28_0)
	end

	setText(arg_28_1:Find("Text"), arg_28_2.id)

	local var_28_1 = Drop.Create(arg_28_2.award)

	updateDrop(arg_28_1:Find("award"), var_28_1)
	setActive(arg_28_1:Find("award/get"), var_28_0 and not arg_28_0.awardDic[arg_28_2.pt])
	setActive(arg_28_1:Find("award/got"), arg_28_0.awardDic[arg_28_2.pt])
	setActive(arg_28_1:Find("award/mask"), arg_28_0.awardDic[arg_28_2.pt])
	onButton(arg_28_0, arg_28_1:Find("award"), function()
		arg_28_0:emit(var_0_0.ON_DROP, var_28_1)
	end, SFX_CONFIRM)

	local var_28_2 = Drop.Create(arg_28_2.award_pay)

	updateDrop(arg_28_1:Find("award_pay"), var_28_2)
	setActive(arg_28_1:Find("award_pay/lock"), not arg_28_0.isPay)
	setActive(arg_28_1:Find("award_pay/get"), arg_28_0.isPay and var_28_0 and not arg_28_0.awardPayDic[arg_28_2.pt])
	setActive(arg_28_1:Find("award_pay/got"), arg_28_0.awardPayDic[arg_28_2.pt])
	setActive(arg_28_1:Find("award_pay/mask"), not arg_28_0.isPay or arg_28_0.awardPayDic[arg_28_2.pt])
	onButton(arg_28_0, arg_28_1:Find("award_pay"), function()
		arg_28_0:emit(var_0_0.ON_DROP, var_28_2)
	end, SFX_CONFIRM)
end

function var_0_0.updateAwardPanel(arg_31_0)
	setText(arg_31_0.textPhase, arg_31_0.phase)

	if arg_31_0.phase < #arg_31_0.awardList then
		local var_31_0 = arg_31_0.phase == 0 and 0 or arg_31_0.awardList[arg_31_0.phase].pt
		local var_31_1 = arg_31_0.pt - var_31_0
		local var_31_2 = arg_31_0.awardList[arg_31_0.phase + 1].pt - var_31_0

		setSlider(arg_31_0.sliderPt, 0, var_31_2, var_31_1)
		setText(arg_31_0.sliderPt:Find("Text"), var_31_1 .. "/" .. var_31_2)
	else
		setSlider(arg_31_0.sliderPt, 0, 1, 1)
		setText(arg_31_0.sliderPt:Find("Text"), "MAX")
	end

	arg_31_0.nextAward = nil

	arg_31_0.comScroll:SetTotalCount(#arg_31_0.awardList - 1)
	arg_31_0:updateNextAward(arg_31_0.comScroll.value)

	local var_31_3 = #arg_31_0.activity:GetCrusingUnreceiveAward() > 0

	setActive(arg_31_0.btnAll, not arg_31_0.isPay and var_31_3)
	setActive(arg_31_0.btnPay, not arg_31_0.isPay)
	setActive(arg_31_0.rtAward:Find("text_image_3"), not arg_31_0.isPay)
	setActive(arg_31_0.btnFinish, arg_31_0.isPay and arg_31_0.phase == #arg_31_0.awardList and not var_31_3)
	setActive(arg_31_0.btnAfter, arg_31_0.isPay and not isActive(arg_31_0.btnFinish))
	setButtonEnabled(arg_31_0.btnAfter, var_31_3)
end

function var_0_0.updateMapStatus(arg_32_0)
	for iter_32_0, iter_32_1 in ipairs(arg_32_0.maps) do
		local var_32_0
		local var_32_1 = {}

		eachChild(iter_32_1.rtLine, function(arg_33_0)
			local var_33_0 = tonumber(arg_33_0.name)

			if var_33_0 > arg_32_0.phase then
				if not var_32_0 then
					var_32_0 = var_33_0

					table.insert(var_32_1, arg_33_0)
					setActive(arg_33_0, true)
				elseif var_33_0 < var_32_0 then
					while #var_32_1 > 0 do
						setActive(table.remove(var_32_1), false)
					end

					var_32_0 = var_33_0

					table.insert(var_32_1, arg_33_0)
					setActive(arg_33_0, true)
				elseif var_32_0 == var_33_0 then
					table.insert(var_32_1, arg_33_0)
					setActive(arg_33_0, true)
				else
					setActive(arg_33_0, false)
				end
			else
				setActive(arg_33_0, true)
			end

			local var_33_1 = var_33_0 > arg_32_0.phase

			setGray(arg_33_0, not var_33_1, false)
			setImageAlpha(arg_33_0, var_33_1 and 1 or 0.9)

			if isActive(arg_33_0) then
				local var_33_2

				local function var_33_3(arg_34_0, arg_34_1)
					local var_34_0 = getImageSprite(arg_34_0)

					if var_34_0 then
						setImageSprite(arg_34_1, var_34_0)
					end

					eachChild(arg_34_0, function(arg_35_0)
						var_33_3(arg_35_0, arg_34_1:Find(arg_35_0.name))
					end)
				end

				local var_33_4 = iter_32_1.rtSimple:Find(var_33_1 and "active" or "gray")

				eachChild(arg_33_0, function(arg_36_0)
					var_33_3(var_33_4:Find(arg_36_0.name), arg_36_0)
				end)
			end
		end)
	end
end

function var_0_0.updateMapWay(arg_37_0)
	if arg_37_0.exited or arg_37_0.contextData.frozenMapUpdate then
		return
	end

	local var_37_0 = PlayerPrefs.GetInt(string.format("crusing_%d_phase_display", arg_37_0.activity.id), 0)

	PlayerPrefs.SetInt(string.format("crusing_%d_phase_display", arg_37_0.activity.id), arg_37_0.phase)

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.maps) do
		local var_37_1 = GetComponent(iter_37_1.rtIcon, typeof(Animator))

		if var_37_0 < arg_37_0.phase then
			local var_37_2 = arg_37_0.PhaseFrame[var_37_0]
			local var_37_3 = arg_37_0.PhaseFrame[arg_37_0.phase]

			var_37_1.speed = var_0_0.PlaySpeed

			var_37_1:Play("empty")
			var_37_1:Play("mix", 0, var_37_2 / arg_37_0.AllFrameCount)

			if iter_37_1.rtIcon:Find("model").childCount > 0 then
				SetAction(iter_37_1.rtIcon:Find("model"):GetChild(0), "move")
			end

			local var_37_4

			var_37_4 = LeanTween.delayedCall((var_37_3 - var_37_2) / var_0_0.FrameSpeed / var_0_0.PlaySpeed, System.Action(function()
				var_37_1.speed = 0

				var_37_1:Play("empty")
				var_37_1:Play("mix", 0, var_37_3 / arg_37_0.AllFrameCount)

				arg_37_0.LTDic[var_37_4] = false

				if iter_37_1.rtIcon:Find("model").childCount > 0 then
					SetAction(iter_37_1.rtIcon:Find("model"):GetChild(0), "normal")
				end
			end)).uniqueId
			arg_37_0.LTDic[var_37_4] = true
		else
			var_37_1.speed = 0

			var_37_1:Play("empty")
			var_37_1:Play("mix", 0, arg_37_0.PhaseFrame[arg_37_0.phase] / arg_37_0.AllFrameCount)
		end
	end
end

function var_0_0.buildPhaseAwardScrollPos(arg_39_0)
	arg_39_0.phasePos = {}

	for iter_39_0 = 1, #arg_39_0.awardList - 1 do
		table.insert(arg_39_0.phasePos, arg_39_0.comScroll:HeadIndexToValue(iter_39_0 - 1))
	end
end

function var_0_0.onScroll(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_1.onValueChanged

	assert(arg_40_2, "callback should exist")
	var_40_0:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_40_0, var_40_0)
	var_40_0:AddListener(arg_40_2)
end

function var_0_0.updateNextAward(arg_41_0, arg_41_1)
	if not arg_41_0.phasePos then
		return
	end

	local var_41_0 = arg_41_0.phasePos[#arg_41_0.phasePos] - 1
	local var_41_1 = #arg_41_0.awardList

	for iter_41_0 = var_41_1 - 1, 1, -1 do
		local var_41_2 = arg_41_0.awardList[iter_41_0]

		if arg_41_0.phasePos[iter_41_0] < arg_41_1 + var_41_0 or var_41_2.pt <= arg_41_0.pt then
			break
		elseif var_41_2.isImportent then
			var_41_1 = iter_41_0
		end
	end

	if arg_41_0.nextAward ~= var_41_1 then
		arg_41_0.nextAward = var_41_1

		arg_41_0:updateAwardInfo(arg_41_0.rtNextAward, arg_41_0.awardList[var_41_1])
	end
end

function var_0_0.checkLimitMax(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0.player

	for iter_42_0, iter_42_1 in ipairs(arg_42_1) do
		if iter_42_1.type == DROP_TYPE_RESOURCE then
			if iter_42_1.id == 1 then
				if var_42_0:GoldMax(iter_42_1.count) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title"))

					return true
				end
			elseif iter_42_1.id == 2 and var_42_0:OilMax(iter_42_1.count) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title"))

				return true
			end
		elseif iter_42_1.type == DROP_TYPE_ITEM then
			local var_42_1 = Item.getConfigData(iter_42_1.id)

			if var_42_1.type == Item.EXP_BOOK_TYPE and getProxy(BagProxy):getItemCountById(iter_42_1.id) + iter_42_1.count > var_42_1.max_num then
				return true
			end
		end
	end

	return false
end

function var_0_0.openBuyPanel(arg_43_0)
	local var_43_0 = arg_43_0:getPassID()
	local var_43_1 = Goods.Create({
		shop_id = var_43_0
	}, Goods.TYPE_CHARGE)
	local var_43_2 = var_43_1:getConfig("tag")
	local var_43_3 = var_43_1:GetExtraServiceItem()
	local var_43_4 = var_43_1:GetExtraDrop()
	local var_43_5
	local var_43_6
	local var_43_7
	local var_43_8 = i18n("battlepass_pay_tip")
	local var_43_9 = {
		isChargeType = true,
		commodity = var_43_1,
		infoTip = var_43_1:GetInfoTip(),
		icon = "chargeicon/" .. var_43_1:getConfig("picture"),
		name = var_43_1:getConfig("name_display"),
		tipExtra = var_43_8,
		extraItems = var_43_3,
		price = var_43_1:getConfig("money"),
		isLocalPrice = var_43_1:IsLocalPrice(),
		tagType = var_43_2,
		isMonthCard = var_43_1:isMonthCard(),
		tipBonus = var_43_7,
		bonusItem = var_43_5,
		extraDrop = var_43_4,
		descExtra = var_43_1:getConfig("descrip_extra"),
		onYes = function()
			if ChargeConst.isNeedSetBirth() then
				arg_43_0:emit(CrusingMediator.EVENT_OPEN_BIRTHDAY)
			else
				pg.m02:sendNotification(GAME.CHARGE_OPERATION, {
					shopId = var_43_1.id
				})
			end
		end
	}

	arg_43_0:emit(CrusingMediator.EVENT_GO_CHARGE, var_43_9)
end

function var_0_0.getPassID(arg_45_0)
	local var_45_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if var_45_0 and not var_45_0:isEnd() then
		for iter_45_0, iter_45_1 in ipairs(pg.pay_data_display.all) do
			local var_45_1 = pg.pay_data_display[iter_45_1]

			if var_45_1.sub_display and type(var_45_1.sub_display) == "table" and var_45_1.sub_display[1] == var_45_0.id then
				return iter_45_1
			end
		end
	end
end

function var_0_0.OnChargeSuccess(arg_46_0, arg_46_1)
	arg_46_0.chargeTipWindow:ExecuteAction("Show", arg_46_1)
end

return var_0_0
