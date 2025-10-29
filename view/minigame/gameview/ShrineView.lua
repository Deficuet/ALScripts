local var_0_0 = class("ShrineView", import("..BaseMiniGameView"))

function var_0_0.getUIName(arg_1_0)
	return "Shrine"
end

function var_0_0.init(arg_2_0)
	arg_2_0:findUI()
	arg_2_0:addListener()
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:initData()
	arg_3_0.spineAnim:SetAction("normal", 0)
	arg_3_0:updateView()
	arg_3_0:updateBuff()
	arg_3_0:updateWitchImg()
end

function var_0_0.onBackPressed(arg_4_0)
	if arg_4_0.shrineBuffView:CheckState(BaseSubView.STATES.INITED) then
		arg_4_0.shrineBuffView:Destroy()
	elseif arg_4_0.shrineResultView:CheckState(BaseSubView.STATES.INITED) then
		arg_4_0.shrineResultView:Destroy()
	else
		arg_4_0:emit(var_0_0.ON_BACK_PRESSED)
	end
end

function var_0_0.OnSendMiniGameOPDone(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.argList
	local var_5_1 = var_5_0[1]
	local var_5_2 = var_5_0[2]

	if var_5_1 == arg_5_0.miniGameId then
		if var_5_2 == 1 then
			arg_5_0:updateView()
			arg_5_0:updateWitchImg()
		elseif var_5_2 == 2 then
			local var_5_3 = getProxy(PlayerProxy):getData()

			var_5_3:consume({
				gold = arg_5_0:GetMGData():getConfig("config_data")[1]
			})
			getProxy(PlayerProxy):updatePlayer(var_5_3)

			local var_5_4 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_SHRINE)

			if var_5_4 and not var_5_4:isEnd() then
				var_5_4.data2 = var_5_4.data2 + 1

				getProxy(ActivityProxy):updateActivity(var_5_4)
			end

			local var_5_5 = var_5_0[3]
			local var_5_6 = pg.benefit_buff_template[var_5_5].name
			local var_5_7 = table.indexof(arg_5_0:GetMGData():getConfig("config_data")[2], var_5_5, 1)
			local var_5_8 = i18n("tips_shrine_buff")

			arg_5_0:playAnime(var_5_8, var_5_7)
			arg_5_0:updateView()
			arg_5_0:updateWitchImg()
		elseif var_5_2 == 3 then
			local var_5_9 = getProxy(PlayerProxy):getData()

			var_5_9:consume({
				gold = arg_5_0:GetMGData():getConfig("config_data")[1]
			})
			getProxy(PlayerProxy):updatePlayer(var_5_9)

			local var_5_10 = i18n("tips_shrine_nobuff")

			arg_5_0:playAnime(var_5_10)
			arg_5_0:updateView()
			arg_5_0:updateWitchImg()
		end
	end
end

function var_0_0.OnModifyMiniGameDataDone(arg_6_0, arg_6_1)
	arg_6_0:updateView()
end

function var_0_0.willExit(arg_7_0)
	if arg_7_0.shrineBuffView:CheckState(BaseSubView.STATES.INITED) then
		arg_7_0.shrineBuffView:Destroy()
	end

	if arg_7_0.shrineResultView:CheckState(BaseSubView.STATES.INITED) then
		arg_7_0.shrineResultView:Destroy()
	end

	arg_7_0.spineAnim = nil

	if arg_7_0._buffTextTimer then
		arg_7_0._buffTextTimer:Stop()
	end

	if arg_7_0._buffTimeCountDownTimer then
		arg_7_0._buffTimeCountDownTimer:Stop()
	end

	if arg_7_0.ringSE then
		arg_7_0.ringSE:Stop(true)
	end
end

function var_0_0.initData(arg_8_0)
	arg_8_0.miniGameId = arg_8_0.contextData.miniGameId

	local var_8_0 = getProxy(MiniGameProxy):GetHubByGameId(arg_8_0.miniGameId)

	if not arg_8_0:isInitedMiniGameData() then
		arg_8_0:SendOperator(MiniGameOPCommand.CMD_SPECIAL_GAME, {
			arg_8_0.miniGameId,
			1
		})
	end

	local var_8_1 = {
		onSelect = function(arg_9_0)
			local var_9_0 = getProxy(PlayerProxy):getData()

			if arg_8_0:GetMGData():getConfig("config_data")[1] > var_9_0.gold then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

				return
			end

			if arg_8_0:GetMGData():GetRuntimeData("count") <= 0 then
				arg_8_0:SendOperator(MiniGameOPCommand.CMD_SPECIAL_GAME, {
					arg_8_0.miniGameId,
					3
				})
			else
				local var_9_1 = arg_8_0:GetMGData():getConfig("config_data")[2][arg_9_0]

				arg_8_0:SendOperator(MiniGameOPCommand.CMD_SPECIAL_GAME, {
					arg_8_0.miniGameId,
					2,
					var_9_1
				})
			end
		end,
		onClose = function()
			arg_8_0.buffEffectAni.enabled = false
			arg_8_0.bgImg.color = Color.New(1, 1, 1)

			setActive(arg_8_0.noAdaptPanel, true)
			setActive(arg_8_0.cloudTF, true)
			setActive(arg_8_0.witchImg, arg_8_0.activityWitch)
		end
	}

	arg_8_0.shrineBuffView = ShrineBuffView.New(arg_8_0._tf.parent, arg_8_0.event, var_8_1)
	arg_8_0.shrineResultView = ShrineResultView.New(arg_8_0._tf, arg_8_0.event)
end

function var_0_0.findUI(arg_11_0)
	arg_11_0.noAdaptPanel = arg_11_0._tf:Find("noAdaptPanel")
	arg_11_0.buffTF = arg_11_0.noAdaptPanel:Find("Buff")
	arg_11_0.buffImg = arg_11_0.buffTF:Find("BuffTypeImg")
	arg_11_0.buffEffectAni = GetComponent(arg_11_0.buffImg, "Animator")
	arg_11_0.buffText = arg_11_0.buffTF:Find("BuffText")
	arg_11_0.buffDftAniEvent = GetComponent(arg_11_0.buffImg, "DftAniEvent")
	arg_11_0.bgImg = arg_11_0._tf:Find("BGImg"):GetComponent(typeof(Image))
	arg_11_0.bgImg.color = Color.New(1, 1, 1)
	arg_11_0.cloudTF = arg_11_0._tf:Find("BG/cloud")

	local var_11_0 = arg_11_0.noAdaptPanel:Find("Top")

	arg_11_0.topTF = var_11_0
	arg_11_0.backBtn = var_11_0:Find("BackBtn")
	arg_11_0.helpBtn = var_11_0:Find("HelpBtn")
	arg_11_0.timesText = var_11_0:Find("Times/Text")
	arg_11_0.goldText = var_11_0:Find("Gold/Text")

	local var_11_1 = arg_11_0._tf:Find("Main")

	arg_11_0.witchImg = var_11_1:Find("Witch")
	arg_11_0.rope = var_11_1:Find("Rope")
	arg_11_0.spineAnim = GetComponent(arg_11_0.rope, "SpineAnimUI")
	arg_11_0.press = GetComponent(arg_11_0.rope, "EventTriggerListener")
end

function var_0_0.addListener(arg_12_0)
	onButton(arg_12_0, arg_12_0.backBtn, function()
		arg_12_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_newyear_shrine.tip
		})
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.rope, function()
		arg_12_0.bgImg.color = Color.New(0, 0, 0)

		setActive(arg_12_0.noAdaptPanel, false)
		setActive(arg_12_0.cloudTF, false)
		setActive(arg_12_0.witchImg, false)
		arg_12_0.shrineBuffView:Reset()
		arg_12_0.shrineBuffView:Load()
	end)
	onButton(arg_12_0, arg_12_0.buffImg, function()
		arg_12_0:updateBuffDesc()
	end, SFX_PANEL)
	arg_12_0.buffDftAniEvent:SetStartEvent(function()
		setButtonEnabled(arg_12_0.rope, false)
	end)
	arg_12_0.buffDftAniEvent:SetEndEvent(function()
		setButtonEnabled(arg_12_0.rope, true)
	end)
end

function var_0_0.playAnime(arg_19_0, arg_19_1, arg_19_2)
	setButtonEnabled(arg_19_0.rope, false)

	arg_19_0.ringSE = pg.CriMgr.GetInstance():PlaySE_V3("ui-shensheling")

	if arg_19_0.spineAnim then
		arg_19_0.spineAnim:SetAction("action", 0)
		arg_19_0.spineAnim:SetActionCallBack(function(arg_20_0)
			if arg_20_0 == "finish" then
				arg_19_0.spineAnim:SetActionCallBack(nil)

				if arg_19_0.ringSE then
					arg_19_0.ringSE:Stop(true)
				end

				arg_19_0.shrineResultView:Reset()
				arg_19_0.shrineResultView:Load()
				arg_19_0.shrineResultView:ActionInvoke("updateView", arg_19_1, arg_19_2)
				arg_19_0.shrineResultView:ActionInvoke("setCloseFunc", function()
					if arg_19_2 then
						arg_19_0:updateBuff()

						arg_19_0.buffEffectAni.enabled = true
					end

					setButtonEnabled(arg_19_0.rope, true)
				end)
				arg_19_0.spineAnim:SetAction("normal", 0)
			end
		end)
	end
end

function var_0_0.updateView(arg_22_0)
	if not arg_22_0:isInitedMiniGameData() then
		return
	end

	local var_22_0 = arg_22_0:GetMGData():GetRuntimeData("count")

	setText(arg_22_0.timesText, var_22_0)

	local var_22_1 = getProxy(PlayerProxy):getData().gold

	setText(arg_22_0.goldText, var_22_1)
end

function var_0_0.updateBuff(arg_23_0, arg_23_1)
	if arg_23_1 then
		setImageSprite(arg_23_0.buffImg, GetSpriteFromAtlas("ui/shrineui_atlas", "buff_type_" .. arg_23_1))
		setActive(arg_23_0.buffImg, true)
	else
		local var_23_0 = getProxy(PlayerProxy):getData()
		local var_23_1 = arg_23_0:GetMGData():getConfig("config_data")[2]
		local var_23_2

		for iter_23_0, iter_23_1 in ipairs(var_23_0.buff_list) do
			var_23_2 = table.indexof(var_23_1, iter_23_1.id, 1)

			if var_23_2 then
				if pg.TimeMgr.GetInstance():GetServerTime() < iter_23_1.timestamp then
					setImageSprite(arg_23_0.buffImg, GetSpriteFromAtlas("ui/shrineui_atlas", "buff_type_" .. var_23_2))
					setActive(arg_23_0.buffImg, true)

					break
				end

				var_23_2 = nil

				break
			end
		end

		if not var_23_2 then
			setActive(arg_23_0.buffImg, false)
		end
	end
end

function var_0_0.updateBuffDesc(arg_24_0)
	local var_24_0
	local var_24_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME)

	if var_24_1 and not var_24_1:isEnd() then
		local var_24_2 = arg_24_0:GetMGData():getConfig("config_data")[2]
		local var_24_3 = getProxy(PlayerProxy):getData()

		for iter_24_0, iter_24_1 in pairs(var_24_3.buff_list) do
			if table.contains(var_24_2, iter_24_1.id) then
				var_24_0 = ActivityBuff.New(var_24_1.id, iter_24_1.id, iter_24_1.timestamp)

				break
			end
		end
	end

	if arg_24_0._buffTimeCountDownTimer then
		arg_24_0._buffTimeCountDownTimer:Stop()
	end

	if arg_24_0._buffTextTimer then
		arg_24_0._buffTextTimer:Stop()
	end

	local var_24_4 = var_24_0:getConfig("desc")

	if var_24_0:getConfig("max_time") > 0 then
		local var_24_5 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_24_6 = var_24_0.timestamp

		if var_24_6 then
			local var_24_7 = var_24_6 - var_24_5
			local var_24_8 = pg.TimeMgr.GetInstance():DescCDTime(var_24_7)

			setText(arg_24_0.buffText:Find("Text"), string.gsub(var_24_4, "$" .. 1, var_24_8))

			arg_24_0._buffTimeCountDownTimer = Timer.New(function()
				if var_24_7 > 0 then
					var_24_7 = var_24_7 - 1

					local var_25_0 = pg.TimeMgr.GetInstance():DescCDTime(var_24_7)

					setText(arg_24_0.buffText:Find("Text"), string.gsub(var_24_4, "$" .. 1, var_25_0))
				else
					arg_24_0._buffTimeCountDownTimer:Stop()
					setActive(arg_24_0.buffText, false)
					setActive(arg_24_0.buffImg, false)
				end
			end, 1, -1)

			setActive(arg_24_0.buffText, true)
			arg_24_0._buffTimeCountDownTimer:Start()
		end
	end

	arg_24_0._buffTextTimer = Timer.New(function()
		setActive(arg_24_0.buffText, false)
		arg_24_0._buffTimeCountDownTimer:Stop()
	end, 7, 1)

	arg_24_0._buffTextTimer:Start()
end

function var_0_0.updateWitchImg(arg_27_0)
	arg_27_0.activityWitch = false

	if not arg_27_0:isInitedMiniGameData() then
		return
	end

	if arg_27_0:GetMGData():GetRuntimeData("serverGold") >= arg_27_0:GetMGData():getConfig("simple_config_data").target then
		arg_27_0.activityWitch = true

		setActive(arg_27_0.witchImg, true)
	end
end

function var_0_0.isInitedMiniGameData(arg_28_0)
	if not arg_28_0:GetMGData():GetRuntimeData("isInited") then
		return false
	else
		return true
	end
end

return var_0_0
