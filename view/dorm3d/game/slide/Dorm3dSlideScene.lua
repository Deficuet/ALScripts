local var_0_0 = class("Dorm3dSlideScene", import("view.dorm3d.Game.Dorm3dGameTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dSlideUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.contextData.groupId

	arg_2_0.gameConfig = pg.dorm3d_minigame_slide[var_2_0]

	arg_2_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_2_0))

	arg_2_0.sceneInfo = {
		{
			path = arg_2_0.gameConfig.peform_scene_info[1],
			name = arg_2_0.gameConfig.peform_scene_info[2]
		},
		{
			path = arg_2_0.gameConfig.perform_timeline_info[1],
			name = arg_2_0.gameConfig.perform_timeline_info[2]
		}
	}

	seriesAsync({
		function(arg_3_0)
			SceneOpMgr.Inst:LoadSceneAsync(arg_2_0.sceneInfo[1].path, arg_2_0.sceneInfo[1].name, LoadSceneMode.Additive, function(arg_4_0, arg_4_1)
				SceneManager.SetActiveScene(arg_4_0)
				arg_3_0()
			end)
		end,
		function(arg_5_0)
			SceneOpMgr.Inst:LoadSceneAsync(arg_2_0.sceneInfo[2].path, arg_2_0.sceneInfo[2].name, LoadSceneMode.Additive, function(arg_6_0, arg_6_1)
				arg_5_0()
			end)
		end
	}, arg_2_1)
end

function var_0_0.init(arg_7_0)
	arg_7_0:InitScene()
	arg_7_0:InitUI()

	local var_7_0 = Dorm3dHxHelper.GetTimelineMainCharacter()

	Dorm3dHxHelper.ReplaceCharacterParts(var_7_0)
	Dorm3dHxHelper.HideCharacterPart(var_7_0, nil, true)
	Dorm3dHxHelper.ShowHolyLight({
		var_7_0
	}, arg_7_0.holyLightRoot)
end

function var_0_0.InitUI(arg_8_0)
	onButton(arg_8_0, arg_8_0._tf:Find("GameUI/Title/BackBtn"), function()
		arg_8_0:emit(var_0_0.ON_BACK)
	end, SFX_DORM_CLICK)

	arg_8_0.qteTF = arg_8_0._tf:Find("GameUI/QTE")

	setActive(arg_8_0.qteTF, false)

	arg_8_0.countTF = arg_8_0._tf:Find("GameUI/Count")

	setActive(arg_8_0.countTF, false)
	arg_8_0.countTF:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		setActive(arg_8_0.countTF, false)
	end)

	arg_8_0.endUI = arg_8_0._tf:Find("EndUI")

	setText(arg_8_0._tf:Find("GameUI/Title/Text"), i18n("3ddorm_beach_slide_tip7"))

	arg_8_0.ltList = {}
	arg_8_0.timerList = {}
	arg_8_0.holyLightRoot = arg_8_0._tf:Find("HolyLightRoot")
end

function var_0_0.InitScene(arg_11_0)
	local var_11_0 = SceneManager.GetSceneByName(arg_11_0.sceneInfo[1].name):GetRootGameObjects()

	table.IpairsCArray(var_11_0, function(arg_12_0, arg_12_1)
		return
	end)

	arg_11_0.timelineDic = {}

	local var_11_1 = SceneManager.GetSceneByName(arg_11_0.sceneInfo[2].name):GetRootGameObjects()

	table.IpairsCArray(var_11_1, function(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_1.transform:Find("[sequence]")

		if var_13_0 then
			local var_13_1 = var_13_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

			arg_11_0.timelineDic[arg_13_1.name] = {
				obj = arg_13_1,
				seq = var_13_0,
				director = var_13_1
			}

			TimelineSupport.DisablePlayOnAwake(var_13_1)
			setActive(arg_13_1, true)
		end
	end)

	arg_11_0.speedComp = GetOrAddComponent(arg_11_0.timelineDic[arg_11_0.gameConfig.perform_catch].seq, typeof(TimelineSpeed))
end

function var_0_0.didEnter(arg_14_0)
	arg_14_0:StartGame()
end

function var_0_0.ShowCountDown(arg_15_0)
	setActive(arg_15_0.countTF, true)
end

function var_0_0.StartQTE(arg_16_0)
	local var_16_0 = {}

	arg_16_0.resultList = {}

	for iter_16_0 = 1, SlideConst.QTE_COUNT do
		table.insert(var_16_0, function(arg_17_0)
			local var_17_0 = cloneTplTo(arg_16_0.qteTF, arg_16_0._tf:Find("GameUI"))
			local var_17_1 = var_17_0:Find("animroot/Perfect")
			local var_17_2 = (SlideConst.QTE_TIME - SlideConst.QTE_SUCCESS_RANGE[1]) / SlideConst.QTE_TIME

			setLocalScale(var_17_1, Vector3(var_17_2, var_17_2, var_17_2))

			local var_17_3 = var_17_0:Find("animroot/Centres")
			local var_17_4 = (SlideConst.QTE_TIME - SlideConst.QTE_SUCCESS_RANGE[2]) / SlideConst.QTE_TIME

			setLocalScale(var_17_3, Vector3(var_17_4, var_17_4, var_17_4))
			setAnchoredPosition(var_17_0, {
				x = arg_16_0.gameConfig.qte_position[iter_16_0][1],
				y = arg_16_0.gameConfig.qte_position[iter_16_0][2]
			})
			setActive(var_17_0, true)

			local var_17_5 = var_17_0:Find("animroot/Trigger")
			local var_17_6 = 0
			local var_17_7 = Timer.New(function()
				if var_17_6 >= SlideConst.QTE_TIME then
					arg_16_0.timerList[iter_16_0]:Stop()
					setActive(var_17_0, false)

					return
				end

				var_17_6 = var_17_6 + 0.016666666666666666
				var_17_5.localScale = Vector3.Lerp(Vector3(1, 1, 1), Vector3(0, 0, 0), var_17_6 / SlideConst.QTE_TIME)
			end, 0.016666666666666666, -1)

			var_17_7:Start()

			arg_16_0.timerList[iter_16_0] = var_17_7

			onButton(arg_16_0, var_17_0, function()
				arg_16_0.timerList[iter_16_0]:Stop()

				if var_17_6 >= SlideConst.QTE_SUCCESS_RANGE[1] and var_17_6 <= SlideConst.QTE_SUCCESS_RANGE[2] then
					arg_16_0.resultList[iter_16_0] = true

					setActive(var_17_0:Find("animroot/Result/Hit"), true)
				else
					arg_16_0.resultList[iter_16_0] = false

					setActive(var_17_0:Find("animroot/Result/Miss"), true)
				end
			end)
			table.insert(arg_16_0.ltList, LeanTween.delayedCall(iter_16_0 == SlideConst.QTE_COUNT and SlideConst.QTE_TIME or SlideConst.QTE_INTERVAL, System.Action(arg_17_0)).uniqueId)
		end)
	end

	seriesAsync(var_16_0, function()
		arg_16_0:EndQTE()
	end)
	arg_16_0.speedComp:SetTimelineSpeed(SlideConst.QTE_SLOW_SPEED)
end

function var_0_0.EndQTE(arg_21_0)
	arg_21_0.speedComp:SetTimelineSpeed(1)

	arg_21_0.catchSuccess = true

	for iter_21_0 = 1, SlideConst.QTE_COUNT do
		if not arg_21_0.resultList[iter_21_0] then
			arg_21_0.catchSuccess = false

			break
		end
	end

	setActive(arg_21_0.endUI, true)
	setActive(arg_21_0.endUI:Find("Title/Victory"), arg_21_0.catchSuccess)
	setActive(arg_21_0.endUI:Find("Title/Defeat"), not arg_21_0.catchSuccess)
	onDelayTick(function()
		quickPlayAnimation(arg_21_0.endUI, "Anim_Dorm3d_volleyball_end_out")
		onDelayTick(function()
			setActive(arg_21_0.endUI, false)
		end, 0.1)
	end, 1.167)
end

function var_0_0.StartGame(arg_24_0)
	seriesAsync({
		function(arg_25_0)
			arg_24_0:PlayTimeline(arg_24_0.gameConfig.perform_ready, arg_25_0)
		end,
		function(arg_26_0)
			arg_24_0:PlayTimeline(arg_24_0.gameConfig.perform_down, arg_26_0)
		end,
		function(arg_27_0)
			arg_24_0:PlayTimeline(arg_24_0.gameConfig.perform_catch, arg_27_0)
		end,
		function(arg_28_0)
			if arg_24_0.catchSuccess then
				arg_24_0:PlayTimeline(arg_24_0.gameConfig.perform_success, arg_28_0)
			else
				arg_24_0:PlayTimeline(arg_24_0.gameConfig.perform_fail, arg_28_0)
			end
		end
	}, function()
		arg_24_0:emit(var_0_0.ON_BACK)
	end)
end

function var_0_0.PlayTimeline(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_0.timelineDic[arg_30_1].seq
	local var_30_1 = arg_30_0.timelineDic[arg_30_1].director

	GetOrAddComponent(var_30_0, "DftCommonSignalReceiver"):SetCommonEvent(function(arg_31_0)
		switch(arg_31_0.stringParameter, {
			PrepareQTE = function()
				arg_30_0:ShowCountDown()
			end,
			StartQTE = function()
				arg_30_0:StartQTE()
			end,
			TimelineEnd = function()
				var_30_1:Stop()
				existCall(arg_30_2)
			end,
			Vibrate = function()
				return
			end
		}, function()
			warning("other event trigger:" .. arg_31_0.stringParameter)
		end)
	end)
	var_30_1:Play()
end

function var_0_0.willExit(arg_37_0)
	for iter_37_0, iter_37_1 in ipairs(arg_37_0.ltList) do
		if LeanTween.isTweening(iter_37_1) then
			LeanTween.cancel(iter_37_1)
		end
	end

	for iter_37_2, iter_37_3 in pairs(arg_37_0.timerList) do
		iter_37_3:Stop()
	end

	local var_37_0 = underscore.map(arg_37_0.sceneInfo, function(arg_38_0)
		return function(arg_39_0)
			SceneOpMgr.Inst:UnloadSceneAsync(arg_38_0.path, arg_38_0.name, arg_39_0)
		end
	end)

	seriesAsync(var_37_0, function()
		return
	end)
end

return var_0_0
