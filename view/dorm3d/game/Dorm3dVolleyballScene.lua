local var_0_0 = class("Dorm3dVolleyballScene", import("view.dorm3d.Game.Dorm3dGameTemplate"))
local var_0_1 = "ui-dorm_countdown"
local var_0_2 = "ui-dorm_qte_appear"
local var_0_3 = "ui-dorm_qte_hit"
local var_0_4 = "ui-dorm_qte_citical"
local var_0_5 = "ui-dorm_qte_miss"
local var_0_6 = "ui-dorm_scoring"
local var_0_7 = "ui-dorm_victory"
local var_0_8 = "ui-dorm_pop_up"

var_0_0.QTE_RESULT = {
	MISS = "Miss",
	PERFECT = "Critical",
	HIT = "Hit"
}
var_0_0.ROUND_RESULT = {
	OUR_WIN = 1,
	OTHER_WIN = 2
}
var_0_0.GAME_RESULT = {
	VICTORY = 1,
	DEFEAT = 2
}
var_0_0.hitRadiusMax = 231
var_0_0.hitRadiusMin = 50
var_0_0.perfectRadiusMax = 139
var_0_0.perfectRadiusMin = 85
var_0_0.perfectScaleRandoms = {
	0.7,
	1.7
}
var_0_0.triggerRadius = 255
var_0_0.endScore = 6
var_0_0.BallInitPos = Vector3(22, 4.5, -22.4)
var_0_0.BallSpeed = 0.1
var_0_0.BallQTESpeed = 0.01
var_0_0.BallRandomDelat = {
	Top = 300,
	Bottom = 300,
	Left = 300,
	Right = 300
}

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dVolleyballUI"
end

function var_0_0.lowerAdpter(arg_2_0)
	return true
end

local var_0_9

function var_0_0.Ctor(arg_3_0, ...)
	var_0_0.super.Ctor(arg_3_0, ...)

	arg_3_0.loader = AutoLoader.New()
end

function var_0_0.preload(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0.contextData.groupId

	arg_4_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_4_0))

	arg_4_0.volleyballCfg = pg.dorm3d_volleyball[var_4_0]
	arg_4_0.sceneRootName = "beach"
	arg_4_0.sceneName = "map_beach_01"
	arg_4_0.timelineSceneRootName = pg.dorm3d_dorm_template[var_4_0].asset_name
	arg_4_0.timelineSceneName = arg_4_0.volleyballCfg.scene_name

	seriesAsync({
		function(arg_5_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. arg_4_0.sceneRootName .. "/" .. arg_4_0.sceneName .. "_scene"), arg_4_0.sceneName, LoadSceneMode.Additive, function(arg_6_0, arg_6_1)
				arg_4_0:InitGameParam()
				SceneManager.SetActiveScene(arg_6_0)
				arg_5_0()
			end)
		end,
		function(arg_7_0)
			local var_7_0 = arg_4_0.timelineSceneRootName
			local var_7_1 = arg_4_0.timelineSceneName

			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. var_7_0 .. "/timeline/" .. var_7_1 .. "/" .. var_7_1 .. "_scene"), var_7_1, LoadSceneMode.Additive, function(arg_8_0, arg_8_1)
				arg_7_0()
			end)
		end
	}, arg_4_1)
end

function var_0_0.InitGameParam(arg_9_0)
	var_0_0.BallSpeed = arg_9_0.volleyballCfg.BallSpeedParam[1]
	var_0_0.BallQTESpeed = arg_9_0.volleyballCfg.BallSpeedParam[2]
	var_0_0.endScore = arg_9_0.volleyballCfg.endScore
end

function var_0_0.init(arg_10_0)
	arg_10_0:initUI()
	arg_10_0:initScene()
	arg_10_0:BindEvent()
end

function var_0_0.initUI(arg_11_0)
	arg_11_0.skipUI = arg_11_0._tf:Find("SkipUI")

	setActive(arg_11_0.skipUI, false)

	arg_11_0.gameUI = arg_11_0._tf:Find("GameUI")

	setText(arg_11_0.gameUI:Find("Title/Text"), i18n("dorm3d_volleyball_title"))

	arg_11_0.ourScoreTF = arg_11_0.gameUI:Find("Score/Content/Left")
	arg_11_0.otherScoreTF = arg_11_0.gameUI:Find("Score/Content/Right")
	arg_11_0.qteTF = arg_11_0.gameUI:Find("QTE")
	arg_11_0.qteTriggerTF = arg_11_0.gameUI:Find("QTE/animroot/Trigger")

	setActive(arg_11_0.qteTF, false)
	setActive(arg_11_0.gameUI, false)
	arg_11_0.gameUI:Find("Count"):GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		if not arg_11_0.isStartGame then
			return
		end

		arg_11_0.isStartGame = false

		setActive(arg_11_0.gameUI:Find("Count"), false)
		arg_11_0:StartOneRound()
		setActive(arg_11_0.gameUI:Find("Score"), true)
	end)

	arg_11_0.scoreUI = arg_11_0._tf:Find("ScoreUI")

	setActive(arg_11_0.scoreUI, false)

	arg_11_0.endUI = arg_11_0._tf:Find("EndUI")

	setActive(arg_11_0.endUI, false)

	arg_11_0.resultUI = arg_11_0._tf:Find("ResultUI")

	setActive(arg_11_0.resultUI, false)
	setText(arg_11_0.resultUI:Find("AgainBtn/Text"), i18n("dorm3d_minigame_again"))
	setText(arg_11_0.resultUI:Find("CloseBtn/Text"), i18n("dorm3d_minigame_close"))
	arg_11_0.scoreUI:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		if not arg_11_0.isEndOneRound then
			return
		end

		arg_11_0.isEndOneRound = false

		quickPlayAnimation(arg_11_0.scoreUI, "Anim_Dorm3d_volleyball_score_out")
		onDelayTick(function()
			setActive(arg_11_0.scoreUI, false)
		end, 0.1)

		if arg_11_0:CheckEndGame() then
			arg_11_0:EndGame()
		else
			setActive(arg_11_0.gameUI, true)
			arg_11_0:StartOneRound()
		end
	end)

	local var_11_0 = arg_11_0._tf:Find("Debug")

	setActive(var_11_0, false)

	arg_11_0.debugTimelineName = var_11_0:Find("Timeline"):GetComponent(typeof(Text))
	arg_11_0.debugTrackName = var_11_0:Find("Track"):GetComponent(typeof(Text))
end

function var_0_0.BindEvent(arg_15_0)
	onButton(arg_15_0, arg_15_0.gameUI:Find("Title/BackBtn"), function()
		arg_15_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_15_0, arg_15_0.gameUI, function()
		if not arg_15_0.startQTEUI then
			return
		end

		arg_15_0:EndQTE()
	end)
	onButton(arg_15_0, arg_15_0.skipUI:Find("SkipBtn"), function()
		setActive(arg_15_0.skipUI, false)
		arg_15_0:StopPlayingTimeline()
		arg_15_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_15_0, arg_15_0.endUI, function()
		arg_15_0:emit(Dorm3dGameMediatorTemplate.TRIGGER_FAVOR, arg_15_0.apartment.configId)
	end, SFX_PANEL)
	onButton(arg_15_0, arg_15_0.resultUI:Find("AgainBtn"), function()
		setActive(arg_15_0.resultUI, false)
		arg_15_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_15_0, arg_15_0.resultUI:Find("CloseBtn"), function()
		arg_15_0:closeView()
	end, SFX_CANCEL)
end

function var_0_0.initScene(arg_22_0)
	local var_22_0 = SceneManager.GetSceneByName(arg_22_0.sceneName):GetRootGameObjects()

	table.IpairsCArray(var_22_0, function(arg_23_0, arg_23_1)
		if arg_23_1.name == "[MainBlock]" then
			arg_22_0.modelRoot = tf(arg_23_1):Find("[Model]/scene_root")
			arg_22_0.ballTF = arg_22_0.modelRoot:Find("fbx/litmap05/pre_db_sportinggoods03")
			arg_22_0.ballTF.position = var_0_0.BallInitPos

			setActive(arg_22_0.ballTF, false)
		elseif arg_23_1.name == "MainCamera" then
			arg_22_0.mainCamera = arg_23_1.transform

			setActive(arg_22_0.mainCamera, false)
		elseif arg_23_1.name == "PlayerCamera" then
			arg_22_0.ballCamera = arg_23_1.transform
			arg_22_0.ballCameraComp = arg_22_0.ballCamera:GetComponent(typeof(Camera))

			setActive(arg_22_0.ballCamera, false)
		elseif arg_23_1.name == "TriggerPlane" then
			setActive(arg_23_1, false)

			local var_23_0 = tf(arg_23_1):Find("BallCreate")
			local var_23_1 = var_23_0:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_22_0.ballCreatePlane = Plane.New(var_23_1.normals[0], -Vector3.Dot(var_23_0.position, var_23_1.normals[0]))

			local var_23_2 = tf(arg_23_1):Find("BallQte")

			setLocalPosition(var_23_2, Vector3(arg_22_0.volleyballCfg.BallQtePlane[1][1], arg_22_0.volleyballCfg.BallQtePlane[1][2], arg_22_0.volleyballCfg.BallQtePlane[1][3]))
			setLocalEulerAngles(var_23_2, Vector3(arg_22_0.volleyballCfg.BallQtePlane[2][1], arg_22_0.volleyballCfg.BallQtePlane[2][2], arg_22_0.volleyballCfg.BallQtePlane[2][3]))

			local var_23_3 = var_23_2:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_22_0.ballQtePlane = Plane.New(var_23_3.normals[0], -Vector3.Dot(var_23_2.position, var_23_3.normals[0]))

			local var_23_4 = tf(arg_23_1):Find("BallMiss")

			setLocalPosition(var_23_4, Vector3(arg_22_0.volleyballCfg.BallMissPlane[1][1], arg_22_0.volleyballCfg.BallMissPlane[1][2], arg_22_0.volleyballCfg.BallMissPlane[1][3]))
			setLocalEulerAngles(var_23_4, Vector3(arg_22_0.volleyballCfg.BallMissPlane[2][1], arg_22_0.volleyballCfg.BallMissPlane[2][2], arg_22_0.volleyballCfg.BallMissPlane[2][3]))

			local var_23_5 = var_23_4:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_22_0.ballMissPlane = Plane.New(var_23_5.normals[0], -Vector3.Dot(var_23_4.position, var_23_5.normals[0]))
		end
	end)
	arg_22_0:InitLightSettings()

	local var_22_1 = SceneManager.GetSceneByName(arg_22_0.timelineSceneName):GetRootGameObjects()

	arg_22_0.totalDirectorList = {}

	table.IpairsCArray(var_22_1, function(arg_24_0, arg_24_1)
		local var_24_0 = tf(arg_24_1):Find("[sequence]")

		if IsNil(var_24_0) then
			return
		end

		local var_24_1 = var_24_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		var_24_1.playOnAwake = false

		var_24_1:Stop()

		local var_24_2 = var_24_0:GetComponentsInChildren(typeof(UnityEngine.Playables.PlayableDirector)):ToTable()

		for iter_24_0, iter_24_1 in ipairs(var_24_2) do
			iter_24_1.playOnAwake = false

			iter_24_1:Stop()
		end

		table.insert(arg_22_0.totalDirectorList, {
			name = arg_24_1.name,
			director = var_24_1
		})
		setActive(arg_24_1, false)
	end)
end

function var_0_0.InitLightSettings(arg_25_0)
	arg_25_0.globalVolume = GameObject.Find("GlobalVolume")
	arg_25_0.characterLight = GameObject.Find("CharacterLight")

	local var_25_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_25_0:GetComponentsInChildren(typeof(Light)), function(arg_26_0, arg_26_1)
		arg_26_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.didEnter(arg_27_0)
	arg_27_0:InitData()
	setActive(arg_27_0.skipUI, true)
	arg_27_0:PlayTimeline({
		name = arg_27_0:GetWeightTimeline("jinchang")
	}, function()
		if not arg_27_0.playingFlag then
			setActive(arg_27_0.skipUI, false)
			arg_27_0:StartGame()
		end
	end)
end

function var_0_0.InitData(arg_29_0)
	return
end

function var_0_0.PlayTimeline(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_1.name
	local var_30_1 = arg_30_1.track
	local var_30_2 = _.detect(arg_30_0.totalDirectorList, function(arg_31_0)
		return arg_31_0.name == var_30_0
	end)

	assert(var_30_2, "Missing director " .. var_30_0)
	arg_30_0:StopPlayingTimeline(tobool(var_30_2))

	if not var_30_2 then
		existCall(arg_30_2)

		return
	end

	local var_30_3 = {}

	arg_30_0.playingDirector = var_30_2.director

	local var_30_4 = arg_30_0.playingDirector.transform

	arg_30_0.debugTimelineName.text = var_30_4.parent.name

	table.insert(var_30_3, function(arg_32_0)
		if arg_30_1.time then
			arg_30_0.playingDirector.time = math.clamp(arg_30_1.time, 0, arg_30_0.playingDirector.duration)
		end

		TimelineSupport.InitTimeline(arg_30_0.playingDirector)

		local var_32_0 = {}

		GetOrAddComponent(var_30_4, "DftCommonSignalReceiver"):SetCommonEvent(function(arg_33_0)
			switch(arg_33_0.stringParameter, {
				TimelineRandomTrack = function()
					arg_30_0:DoTimelineRandomTrack(arg_30_0.playingDirector)
				end,
				TimelineLoop = function()
					arg_30_0.playingDirector.time = arg_33_0.floatParameter
				end,
				TimelineEnd = function()
					var_32_0.finish = true

					arg_30_0.playingDirector:Stop()
					setActive(tf(arg_30_0.playingDirector).parent, false)
				end
			}, function()
				warning("other event trigger:" .. arg_33_0.stringParameter)
			end)

			if var_32_0.finish then
				arg_30_0.timelineMark = var_32_0
				arg_30_0.debugTimelineName.text = ""
				arg_30_0.debugTrackName.text = ""

				arg_32_0()
			end
		end)
		arg_30_0.playingDirector:Evaluate()
		arg_30_0:DoTimelineRandomTrack(arg_30_0.playingDirector)
		setActive(tf(arg_30_0.playingDirector).parent, true)
		arg_30_0.playingDirector:Play()
		setActive(arg_30_0.mainCamera, false)

		if arg_30_0.activeDirectorInfo then
			arg_30_0.lastDirectorInfo = arg_30_0.activeDirectorInfo
		end

		arg_30_0.activeDirectorInfo = var_30_2
	end)
	seriesAsync(var_30_3, function()
		setActive(arg_30_0.mainCamera, true)

		arg_30_0.playingDirector = nil

		local var_38_0 = arg_30_0.timelineMark

		arg_30_0.timelineMark = nil

		existCall(arg_30_2, var_38_0)
	end)
end

function var_0_0.StopPlayingTimeline(arg_39_0, arg_39_1)
	if arg_39_0.playingDirector then
		arg_39_0.playingDirector:Stop()
		setActive(tf(arg_39_0.playingDirector).parent, false)

		arg_39_0.debugTimelineName.text = ""
		arg_39_0.debugTrackName.text = ""
		arg_39_0.playingDirector = nil

		if not arg_39_1 then
			setActive(arg_39_0.mainCamera, true)
		end
	end
end

function var_0_0.StartGame(arg_40_0)
	setActive(arg_40_0.mainCamera, true)

	arg_40_0.playingFlag = true
	arg_40_0.gameResult = nil
	arg_40_0.ourScore, arg_40_0.otherScore = 0, 0

	setActive(arg_40_0.gameUI, true)
	setActive(arg_40_0.gameUI:Find("Score"), false)

	local var_40_0 = arg_40_0.gameUI:Find("Count")

	setActive(var_40_0, true)

	arg_40_0.isStartGame = true

	pg.CriMgr.GetInstance():PlaySE_V3(var_0_1)
end

function var_0_0.UpdateGameScore(arg_41_0)
	setText(arg_41_0.ourScoreTF, arg_41_0.ourScore)
	setText(arg_41_0.otherScoreTF, arg_41_0.otherScore)
end

function var_0_0.UpdateScoreTpl(arg_42_0, arg_42_1)
	setText(arg_42_1:Find("Left/Tens/Text"), 0)
	setText(arg_42_1:Find("Left/Units/Text"), arg_42_0.ourScore % 10)
	setText(arg_42_1:Find("Right/Tens/Text"), 0)
	setText(arg_42_1:Find("Right/Units/Text"), arg_42_0.otherScore % 10)
end

function var_0_0.StartOneRound(arg_43_0)
	arg_43_0:UpdateGameScore()

	arg_43_0.roundEndFlag = false
	arg_43_0.roundResult = nil

	seriesAsync({
		function(arg_44_0)
			arg_43_0:FaQiuOP(arg_44_0)
		end,
		function(arg_45_0)
			arg_43_0:OneQTE()
		end
	})
end

function var_0_0.OneQTE(arg_46_0)
	seriesAsync({
		function(arg_47_0)
			arg_46_0:StartQTE(arg_47_0)
		end,
		function(arg_48_0)
			switch(arg_46_0.qteResult, {
				[var_0_0.QTE_RESULT.MISS] = function()
					arg_46_0:QteMissOP(function()
						arg_46_0.roundEndFlag = true
						arg_46_0.roundResult = var_0_0.ROUND_RESULT.OTHER_WIN

						arg_48_0()
					end)
				end,
				[var_0_0.QTE_RESULT.HIT] = function()
					arg_46_0:QteHitOP(arg_48_0)
				end,
				[var_0_0.QTE_RESULT.PERFECT] = function()
					arg_46_0:QtePerfectOP(function()
						arg_46_0.roundEndFlag = true
						arg_46_0.roundResult = var_0_0.ROUND_RESULT.OUR_WIN

						arg_48_0()
					end)
				end
			}, function()
				assert(false, "unknow qte result" .. arg_46_0.qteResult)
			end)
		end
	}, function()
		if not arg_46_0.roundEndFlag then
			arg_46_0:OneQTE()
		else
			arg_46_0:EndOneRound()
		end
	end)
end

function var_0_0.EndOneRound(arg_56_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_6)

	arg_56_0.isEndOneRound = true

	setActive(arg_56_0.gameUI, false)
	arg_56_0:UpdateScoreTpl(arg_56_0.scoreUI:Find("ScoreTpl"))
	setText(arg_56_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_56_0.ourScore % 10)
	setText(arg_56_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_56_0.otherScore % 10)
	switch(arg_56_0.roundResult, {
		[var_0_0.ROUND_RESULT.OUR_WIN] = function()
			arg_56_0.ourScore = arg_56_0.ourScore + 1

			setText(arg_56_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_56_0.ourScore % 10)
			setActive(arg_56_0.scoreUI, true)
			quickPlayAnimation(arg_56_0.scoreUI, "Anim_Dorm3d_volleyball_score_leftin")
		end,
		[var_0_0.ROUND_RESULT.OTHER_WIN] = function()
			arg_56_0.otherScore = arg_56_0.otherScore + 1

			setText(arg_56_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_56_0.otherScore % 10)
			setActive(arg_56_0.scoreUI, true)
			quickPlayAnimation(arg_56_0.scoreUI, "Anim_Dorm3d_volleyball_score_rightin")
		end
	}, function()
		assert(false, "unknow round result" .. arg_56_0.roundResult)
	end)
end

function var_0_0.CheckEndGame(arg_60_0)
	if arg_60_0.ourScore >= var_0_0.endScore then
		arg_60_0.gameResult = var_0_0.GAME_RESULT.VICTORY

		return true
	end

	if arg_60_0.otherScore >= var_0_0.endScore then
		arg_60_0.gameResult = var_0_0.GAME_RESULT.DEFEAT

		return true
	end

	return false
end

function var_0_0.EndGame(arg_61_0)
	if arg_61_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
		pg.CriMgr.GetInstance():PlaySE_V3(var_0_7)
	end

	seriesAsync({
		function(arg_62_0)
			local var_62_0 = arg_61_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "shibai" or "shengli"

			arg_61_0:PlayTimeline({
				name = arg_61_0:GetWeightTimeline(var_62_0)
			}, arg_62_0)
		end
	}, function()
		arg_61_0:PlayTimeline({
			name = arg_61_0:GetWeightTimeline("daiji")
		}, function()
			return
		end)
		setActive(arg_61_0.endUI, true)
		setActive(arg_61_0.endUI:Find("Title/Victory"), arg_61_0.gameResult == var_0_0.GAME_RESULT.VICTORY)
		setActive(arg_61_0.endUI:Find("Title/Defeat"), arg_61_0.gameResult == var_0_0.GAME_RESULT.DEFEAT)
		arg_61_0:UpdateScoreTpl(arg_61_0.endUI:Find("ScoreTpl"))
	end)
end

function var_0_0.ShowResultUI(arg_65_0, arg_65_1)
	(function()
		local var_66_0 = arg_65_0.contextData.roomId
		local var_66_1 = arg_65_0.contextData.groupId
		local var_66_2 = arg_65_0.contextData.groupIds or {
			var_66_1
		}
		local var_66_3 = table.concat(var_66_2, ",")
		local var_66_4 = arg_65_0.ourScore .. ":" .. arg_65_0.otherScore

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataRoom(var_66_0, 8, var_66_3, var_66_4))
	end)()
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_8)
	seriesAsync({
		function(arg_67_0)
			quickPlayAnimation(arg_65_0.endUI, "Anim_Dorm3d_volleyball_end_out")
			onDelayTick(function()
				setActive(arg_65_0.endUI, false)
			end, 0.1)

			if arg_65_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
				arg_65_0:PlayTimeline({
					name = arg_65_0:GetWeightTimeline("jiangli")
				}, arg_67_0)
			else
				arg_65_0:StopPlayingTimeline()
				arg_67_0()
			end
		end
	}, function()
		setActive(arg_65_0.resultUI, true)

		local var_69_0

		var_69_0 = arg_65_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "Victory" or "Defeat"

		setText(arg_65_0.resultUI:Find("Panel/Text"), i18n("volleyball_end_tip", arg_65_0.apartment:getConfig("name")))

		if arg_65_1 and arg_65_1.cost > 0 then
			setActive(arg_65_0.resultUI:Find("Panel/Award"), true)
			setText(arg_65_0.resultUI:Find("Panel/Award/Text"), i18n("volleyball_end_award", arg_65_0.apartment:getConfig("name")))
		else
			setActive(arg_65_0.resultUI:Find("Panel/Award"), false)
		end

		gcAll()
	end)
end

function var_0_0.FaQiuOP(arg_70_0, arg_70_1)
	arg_70_0:PlayTimeline({
		name = arg_70_0:GetWeightTimeline("faqiu")
	}, arg_70_1)
end

function var_0_0.StartQTE(arg_71_0, arg_71_1)
	arg_71_0.qteCallback = arg_71_1

	setActive(arg_71_0.ballCamera, true)
	setActive(arg_71_0.mainCamera, false)

	arg_71_0.randomScreenPos = Vector2(math.random(var_0_0.BallRandomDelat.Left, Screen.width - var_0_0.BallRandomDelat.Right), math.random(var_0_0.BallRandomDelat.Bottom, Screen.height - var_0_0.BallRandomDelat.Top))

	local var_71_0 = arg_71_0.ballCameraComp:ScreenPointToRay(arg_71_0.randomScreenPos)

	arg_71_0.randomScale = math.random(var_0_0.perfectScaleRandoms[1] * 10, arg_71_0.perfectScaleRandoms[2] * 10) / 10

	local var_71_1 = (var_0_0.perfectRadiusMax + var_0_0.perfectRadiusMin) / 2 * arg_71_0.randomScale / var_0_0.triggerRadius
	local var_71_2 = arg_71_0.ballQtePlane.distance + (arg_71_0.ballMissPlane.distance - arg_71_0.ballQtePlane.distance) * (1 - var_71_1)
	local var_71_3, var_71_4 = Plane.New(arg_71_0.ballQtePlane.normal, var_71_2):Raycast(var_71_0)

	assert(var_71_3, "retPerfect plane not in view")

	arg_71_0.ballDir = (var_71_0:GetPoint(var_71_4) - var_0_0.BallInitPos):Normalize()

	local var_71_5 = Ray.New(arg_71_0.ballDir, var_0_0.BallInitPos)
	local var_71_6, var_71_7 = arg_71_0.ballQtePlane:Raycast(var_71_5)

	assert(var_71_6, "qte plane not in view")

	local var_71_8 = var_71_5:GetPoint(var_71_7)
	local var_71_9, var_71_10 = arg_71_0.ballMissPlane:Raycast(var_71_5)

	assert(var_71_9, "miss plane not in view")

	local var_71_11 = var_71_5:GetPoint(var_71_10)
	local var_71_12 = 0

	arg_71_0.qteUITime = (var_71_8 - var_71_11):Magnitude() / var_0_0.BallQTESpeed
	arg_71_0.ballTimer = Timer.New(function()
		if var_71_12 >= var_71_10 then
			arg_71_0.ballTimer:Stop()

			arg_71_0.ballTimer = nil

			setActive(arg_71_0.ballTF, false)

			arg_71_0.ballTF.position = var_0_0.BallInitPos

			if arg_71_0.startQTEUI then
				setLocalScale(arg_71_0.qteTriggerTF, {
					x = 0,
					y = 0
				})
				arg_71_0:EndQTE(var_0_0.QTE_RESULT.MISS)
			end
		elseif var_71_12 >= var_71_7 then
			var_71_12 = var_71_12 + var_0_0.BallQTESpeed
			arg_71_0.ballTF.position = var_71_5:GetPoint(var_71_12)

			if not arg_71_0.startQTEUI then
				arg_71_0:StartQTEUI()
			end

			arg_71_0.curScale = arg_71_0.curScale - 1 / arg_71_0.qteUITime

			setLocalScale(arg_71_0.qteTriggerTF, {
				x = arg_71_0.curScale,
				y = arg_71_0.curScale
			})

			arg_71_0.curRadius = var_0_0.triggerRadius * arg_71_0.curScale

			if arg_71_0.curScale < 0 then
				arg_71_0:EndQTE()
			end
		else
			var_71_12 = var_71_12 + var_0_0.BallSpeed
			arg_71_0.ballTF.position = var_71_5:GetPoint(var_71_12)
		end
	end, 0.016666666666666666, -1)

	setActive(arg_71_0.ballTF, true)
	arg_71_0.ballTimer:Start()
end

function var_0_0.StartQTEUI(arg_73_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_2)
	setLocalScale(arg_73_0.qteTriggerTF, {
		x = 1,
		y = 1
	})
	eachChild(arg_73_0.qteTF:Find("animroot/Result"), function(arg_74_0)
		setActive(arg_74_0, false)
	end)

	arg_73_0.qteResult = nil
	arg_73_0.curRadius = var_0_0.triggerRadius
	arg_73_0.curPerfectRadiusMax = var_0_0.perfectRadiusMax * arg_73_0.randomScale
	arg_73_0.curPerfectRadiusMin = var_0_0.perfectRadiusMin * arg_73_0.randomScale

	setLocalScale(arg_73_0.qteTF:Find("animroot/Perfect"), {
		x = arg_73_0.randomScale,
		y = arg_73_0.randomScale
	})

	arg_73_0.curScale = 1

	setLocalPosition(arg_73_0.qteTF, LuaHelper.ScreenToLocal(arg_73_0.qteTF.parent, arg_73_0.randomScreenPos, pg.UIMgr.GetInstance().uiCameraComp))
	setActive(arg_73_0.qteTF, true)

	arg_73_0.startQTEUI = true
end

function var_0_0.EndQTE(arg_75_0, arg_75_1)
	arg_75_0.startQTEUI = nil

	setActive(arg_75_0.mainCamera, true)
	setActive(arg_75_0.ballCamera, false)

	if arg_75_1 then
		arg_75_0.qteResult = arg_75_1
	elseif arg_75_0.curRadius < var_0_0.hitRadiusMin or arg_75_0.curRadius > var_0_0.hitRadiusMax then
		arg_75_0.qteResult = var_0_0.QTE_RESULT.MISS
	elseif arg_75_0.curRadius <= arg_75_0.curPerfectRadiusMax and arg_75_0.curRadius >= arg_75_0.curPerfectRadiusMin then
		arg_75_0.qteResult = var_0_0.QTE_RESULT.PERFECT
	else
		arg_75_0.qteResult = var_0_0.QTE_RESULT.HIT
	end

	eachChild(arg_75_0.qteTF:Find("animroot/Result"), function(arg_76_0)
		setActive(arg_76_0, arg_76_0.name == arg_75_0.qteResult)
	end)

	if arg_75_0.ballTimer then
		arg_75_0.ballTimer:Stop()

		arg_75_0.ballTimer = nil

		setActive(arg_75_0.ballTF, false)

		arg_75_0.ballTF.position = var_0_0.BallInitPos
	end

	if arg_75_0.qteCallback then
		arg_75_0.qteCallback()

		arg_75_0.qteCallback = nil
	end

	onDelayTick(function()
		setActive(arg_75_0.qteTF, false)
	end, 1)
end

function var_0_0.QteMissOP(arg_78_0, arg_78_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_5)
	arg_78_0:PlayTimeline({
		name = arg_78_0:GetWeightTimeline("shiqiu")
	}, arg_78_1)
end

function var_0_0.QteHitOP(arg_79_0, arg_79_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_3)
	seriesAsync({
		function(arg_80_0)
			arg_79_0:PlayTimeline({
				name = arg_79_0:GetWeightTimeline("fly")
			}, arg_80_0)
		end,
		function(arg_81_0)
			arg_79_0:PlayTimeline({
				name = arg_79_0:GetWeightTimeline("jieqiu")
			}, arg_81_0)
		end
	}, arg_79_1)
end

function var_0_0.QtePerfectOP(arg_82_0, arg_82_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_4)
	seriesAsync({
		function(arg_83_0)
			arg_82_0:PlayTimeline({
				name = arg_82_0:GetWeightTimeline("max_fly")
			}, arg_83_0)
		end,
		function(arg_84_0)
			arg_82_0:PlayTimeline({
				name = arg_82_0:GetWeightTimeline("shouji")
			}, arg_84_0)
		end
	}, arg_82_1)
end

function var_0_0.GetWeightTimeline(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_0.volleyballCfg[arg_85_1]

	assert(var_85_0 ~= "", "volleyball cfg is empty string" .. arg_85_1)
	assert(#var_85_0 ~= 0, "volleyball cfg is empty table:" .. arg_85_1)

	local var_85_1 = underscore.reduce(var_85_0, 0, function(arg_86_0, arg_86_1)
		return arg_86_0 + arg_86_1[2]
	end)
	local var_85_2 = math.random() * var_85_1
	local var_85_3 = 0

	for iter_85_0, iter_85_1 in ipairs(var_85_0) do
		var_85_3 = var_85_3 + iter_85_1[2]

		if var_85_2 <= var_85_3 then
			return iter_85_1[1]
		end
	end
end

function var_0_0.DoTimelineRandomTrack(arg_87_0, arg_87_1)
	local var_87_0 = {}

	for iter_87_0, iter_87_1 in ipairs(TimelineHelper.GetTimelineTracks(arg_87_1):ToTable()) do
		if iter_87_1.name ~= "Markers" then
			iter_87_1.muted = true

			table.insert(var_87_0, iter_87_1)
		end
	end

	if #var_87_0 > 0 then
		local var_87_1 = var_87_0[math.random(#var_87_0)]

		underscore.each(var_87_0, function(arg_88_0)
			if arg_88_0.name == var_87_1.name then
				arg_88_0.muted = false
			end
		end)

		arg_87_0.debugTrackName.text = var_87_1.name
	else
		arg_87_0.debugTrackName.text = "track cnt 0"
	end
end

function var_0_0.OnPause(arg_89_0)
	if arg_89_0.ballTimer then
		arg_89_0.ballTimer:Stop()
	end

	if arg_89_0.playingDirector then
		arg_89_0.playingDirector:Pause()
	end
end

function var_0_0.OnResume(arg_90_0)
	if arg_90_0.ballTimer then
		arg_90_0.ballTimer:Start()
	end

	if arg_90_0.playingDirector then
		arg_90_0.playingDirector:Play()
	end
end

function var_0_0.onBackPressed(arg_91_0)
	if not arg_91_0.playingFlag or isActive(arg_91_0.gameUI:Find("Count")) or isActive(arg_91_0.endUI) then
		return
	end

	arg_91_0:OnPause()
	pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_MSGBOX, {
		contentText = i18n("sure_exit_volleyball"),
		onConfirm = function()
			arg_91_0:emit(var_0_0.ON_BACK)
		end,
		onClose = function()
			arg_91_0:OnResume()
		end
	})
end

function var_0_0.willExit(arg_94_0)
	arg_94_0.loader:Clear()

	if arg_94_0.ballTimer then
		arg_94_0.ballTimer:Stop()

		arg_94_0.ballTimer = nil
	end

	local var_94_0 = {
		{
			path = string.lower("dorm3d/character/" .. arg_94_0.timelineSceneRootName .. "/timeline/" .. arg_94_0.timelineSceneName .. "/" .. arg_94_0.timelineSceneName .. "_scene"),
			name = arg_94_0.timelineSceneName
		},
		{
			path = string.lower("dorm3d/scenesres/scenes/common/" .. arg_94_0.sceneRootName .. "/" .. arg_94_0.sceneName .. "_scene"),
			name = arg_94_0.sceneName
		}
	}
	local var_94_1 = underscore.map(var_94_0, function(arg_95_0)
		return function(arg_96_0)
			SceneOpMgr.Inst:UnloadSceneAsync(arg_95_0.path, arg_95_0.name, arg_96_0)
		end
	end)

	seriesAsync(var_94_1, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

return var_0_0
