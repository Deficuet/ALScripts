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

local var_0_9

function var_0_0.Ctor(arg_2_0, ...)
	var_0_0.super.Ctor(arg_2_0, ...)

	arg_2_0.loader = AutoLoader.New()
end

function var_0_0.preload(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.contextData.groupId

	arg_3_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_3_0))

	arg_3_0.volleyballCfg = pg.dorm3d_volleyball[var_3_0]
	arg_3_0.sceneRootName = "beach"
	arg_3_0.sceneName = "map_beach_01"
	arg_3_0.timelineSceneRootName = pg.dorm3d_dorm_template[var_3_0].asset_name
	arg_3_0.timelineSceneName = arg_3_0.volleyballCfg.scene_name

	seriesAsync({
		function(arg_4_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. arg_3_0.sceneRootName .. "/" .. arg_3_0.sceneName .. "_scene"), arg_3_0.sceneName, LoadSceneMode.Additive, function(arg_5_0, arg_5_1)
				arg_3_0:InitGameParam()
				SceneManager.SetActiveScene(arg_5_0)
				arg_4_0()
			end)
		end,
		function(arg_6_0)
			local var_6_0 = arg_3_0.timelineSceneRootName
			local var_6_1 = arg_3_0.timelineSceneName

			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. var_6_0 .. "/timeline/" .. var_6_1 .. "/" .. var_6_1 .. "_scene"), var_6_1, LoadSceneMode.Additive, function(arg_7_0, arg_7_1)
				arg_6_0()
			end)
		end
	}, arg_3_1)
end

function var_0_0.InitGameParam(arg_8_0)
	var_0_0.BallSpeed = arg_8_0.volleyballCfg.BallSpeedParam[1]
	var_0_0.BallQTESpeed = arg_8_0.volleyballCfg.BallSpeedParam[2]
	var_0_0.endScore = arg_8_0.volleyballCfg.endScore
end

function var_0_0.init(arg_9_0)
	arg_9_0:initUI()
	arg_9_0:initScene()
	arg_9_0:BindEvent()
end

function var_0_0.initUI(arg_10_0)
	arg_10_0.skipUI = arg_10_0._tf:Find("SkipUI")

	setActive(arg_10_0.skipUI, false)

	arg_10_0.gameUI = arg_10_0._tf:Find("GameUI")

	setText(arg_10_0.gameUI:Find("Title/Text"), i18n("dorm3d_volleyball_title"))

	arg_10_0.ourScoreTF = arg_10_0.gameUI:Find("Score/Content/Left")
	arg_10_0.otherScoreTF = arg_10_0.gameUI:Find("Score/Content/Right")
	arg_10_0.qteTF = arg_10_0.gameUI:Find("QTE")
	arg_10_0.qteTriggerTF = arg_10_0.gameUI:Find("QTE/animroot/Trigger")

	setActive(arg_10_0.qteTF, false)
	setActive(arg_10_0.gameUI, false)
	arg_10_0.gameUI:Find("Count"):GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		if not arg_10_0.isStartGame then
			return
		end

		arg_10_0.isStartGame = false

		setActive(arg_10_0.gameUI:Find("Count"), false)
		arg_10_0:StartOneRound()
		setActive(arg_10_0.gameUI:Find("Score"), true)
	end)

	arg_10_0.scoreUI = arg_10_0._tf:Find("ScoreUI")

	setActive(arg_10_0.scoreUI, false)

	arg_10_0.endUI = arg_10_0._tf:Find("EndUI")

	setActive(arg_10_0.endUI, false)

	arg_10_0.resultUI = arg_10_0._tf:Find("ResultUI")

	setActive(arg_10_0.resultUI, false)
	setText(arg_10_0.resultUI:Find("AgainBtn/Text"), i18n("dorm3d_minigame_again"))
	setText(arg_10_0.resultUI:Find("CloseBtn/Text"), i18n("dorm3d_minigame_close"))
	arg_10_0.scoreUI:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		if not arg_10_0.isEndOneRound then
			return
		end

		arg_10_0.isEndOneRound = false

		quickPlayAnimation(arg_10_0.scoreUI, "Anim_Dorm3d_volleyball_score_out")
		onDelayTick(function()
			setActive(arg_10_0.scoreUI, false)
		end, 0.1)

		if arg_10_0:CheckEndGame() then
			arg_10_0:EndGame()
		else
			setActive(arg_10_0.gameUI, true)
			arg_10_0:StartOneRound()
		end
	end)

	local var_10_0 = arg_10_0._tf:Find("Debug")

	setActive(var_10_0, false)

	arg_10_0.debugTimelineName = var_10_0:Find("Timeline"):GetComponent(typeof(Text))
	arg_10_0.debugTrackName = var_10_0:Find("Track"):GetComponent(typeof(Text))
end

function var_0_0.BindEvent(arg_14_0)
	onButton(arg_14_0, arg_14_0.gameUI:Find("Title/BackBtn"), function()
		arg_14_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_14_0, arg_14_0.gameUI, function()
		if not arg_14_0.startQTEUI then
			return
		end

		arg_14_0:EndQTE()
	end)
	onButton(arg_14_0, arg_14_0.skipUI:Find("SkipBtn"), function()
		setActive(arg_14_0.skipUI, false)
		arg_14_0:StopPlayingTimeline()
		arg_14_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.endUI, function()
		arg_14_0:emit(Dorm3dGameMediatorTemplate.TRIGGER_FAVOR, arg_14_0.apartment.configId)
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.resultUI:Find("AgainBtn"), function()
		setActive(arg_14_0.resultUI, false)
		arg_14_0:StartGame()
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.resultUI:Find("CloseBtn"), function()
		arg_14_0:closeView()
	end, SFX_CANCEL)
end

function var_0_0.initScene(arg_21_0)
	local var_21_0 = SceneManager.GetSceneByName(arg_21_0.sceneName):GetRootGameObjects()

	table.IpairsCArray(var_21_0, function(arg_22_0, arg_22_1)
		if arg_22_1.name == "[MainBlock]" then
			arg_21_0.modelRoot = tf(arg_22_1):Find("[Model]/scene_root")
			arg_21_0.ballTF = arg_21_0.modelRoot:Find("fbx/litmap05/pre_db_sportinggoods03")
			arg_21_0.ballTF.position = var_0_0.BallInitPos

			setActive(arg_21_0.ballTF, false)
		elseif arg_22_1.name == "MainCamera" then
			arg_21_0.mainCamera = arg_22_1.transform

			setActive(arg_21_0.mainCamera, false)
		elseif arg_22_1.name == "PlayerCamera" then
			arg_21_0.ballCamera = arg_22_1.transform
			arg_21_0.ballCameraComp = arg_21_0.ballCamera:GetComponent(typeof(Camera))

			setActive(arg_21_0.ballCamera, false)
		elseif arg_22_1.name == "TriggerPlane" then
			setActive(arg_22_1, false)

			local var_22_0 = tf(arg_22_1):Find("BallCreate")
			local var_22_1 = var_22_0:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_21_0.ballCreatePlane = Plane.New(var_22_1.normals[0], -Vector3.Dot(var_22_0.position, var_22_1.normals[0]))

			local var_22_2 = tf(arg_22_1):Find("BallQte")

			setLocalPosition(var_22_2, Vector3(arg_21_0.volleyballCfg.BallQtePlane[1][1], arg_21_0.volleyballCfg.BallQtePlane[1][2], arg_21_0.volleyballCfg.BallQtePlane[1][3]))
			setLocalEulerAngles(var_22_2, Vector3(arg_21_0.volleyballCfg.BallQtePlane[2][1], arg_21_0.volleyballCfg.BallQtePlane[2][2], arg_21_0.volleyballCfg.BallQtePlane[2][3]))

			local var_22_3 = var_22_2:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_21_0.ballQtePlane = Plane.New(var_22_3.normals[0], -Vector3.Dot(var_22_2.position, var_22_3.normals[0]))

			local var_22_4 = tf(arg_22_1):Find("BallMiss")

			setLocalPosition(var_22_4, Vector3(arg_21_0.volleyballCfg.BallMissPlane[1][1], arg_21_0.volleyballCfg.BallMissPlane[1][2], arg_21_0.volleyballCfg.BallMissPlane[1][3]))
			setLocalEulerAngles(var_22_4, Vector3(arg_21_0.volleyballCfg.BallMissPlane[2][1], arg_21_0.volleyballCfg.BallMissPlane[2][2], arg_21_0.volleyballCfg.BallMissPlane[2][3]))

			local var_22_5 = var_22_4:GetComponent(typeof(UnityEngine.MeshCollider)).sharedMesh

			arg_21_0.ballMissPlane = Plane.New(var_22_5.normals[0], -Vector3.Dot(var_22_4.position, var_22_5.normals[0]))
		end
	end)
	arg_21_0:InitLightSettings()

	local var_21_1 = SceneManager.GetSceneByName(arg_21_0.timelineSceneName):GetRootGameObjects()

	arg_21_0.totalDirectorList = {}

	table.IpairsCArray(var_21_1, function(arg_23_0, arg_23_1)
		local var_23_0 = tf(arg_23_1):Find("[sequence]")

		if IsNil(var_23_0) then
			return
		end

		local var_23_1 = var_23_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		var_23_1.playOnAwake = false

		var_23_1:Stop()

		local var_23_2 = var_23_0:GetComponentsInChildren(typeof(UnityEngine.Playables.PlayableDirector)):ToTable()

		for iter_23_0, iter_23_1 in ipairs(var_23_2) do
			iter_23_1.playOnAwake = false

			iter_23_1:Stop()
		end

		table.insert(arg_21_0.totalDirectorList, {
			name = arg_23_1.name,
			director = var_23_1
		})
		setActive(arg_23_1, false)
	end)
end

function var_0_0.InitLightSettings(arg_24_0)
	arg_24_0.globalVolume = GameObject.Find("GlobalVolume")
	arg_24_0.characterLight = GameObject.Find("CharacterLight")

	local var_24_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_24_0:GetComponentsInChildren(typeof(Light)), function(arg_25_0, arg_25_1)
		arg_25_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.didEnter(arg_26_0)
	arg_26_0:InitData()
	setActive(arg_26_0.skipUI, true)
	arg_26_0:PlayTimeline({
		name = arg_26_0:GetWeightTimeline("jinchang")
	}, function()
		if not arg_26_0.playingFlag then
			setActive(arg_26_0.skipUI, false)
			arg_26_0:StartGame()
		end
	end)
end

function var_0_0.InitData(arg_28_0)
	return
end

function var_0_0.PlayTimeline(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_1.name
	local var_29_1 = arg_29_1.track
	local var_29_2 = _.detect(arg_29_0.totalDirectorList, function(arg_30_0)
		return arg_30_0.name == var_29_0
	end)

	assert(var_29_2, "Missing director " .. var_29_0)
	arg_29_0:StopPlayingTimeline(tobool(var_29_2))

	if not var_29_2 then
		existCall(arg_29_2)

		return
	end

	local var_29_3 = {}

	arg_29_0.playingDirector = var_29_2.director

	local var_29_4 = arg_29_0.playingDirector.transform

	arg_29_0.debugTimelineName.text = var_29_4.parent.name

	table.insert(var_29_3, function(arg_31_0)
		if arg_29_1.time then
			arg_29_0.playingDirector.time = math.clamp(arg_29_1.time, 0, arg_29_0.playingDirector.duration)
		end

		TimelineSupport.InitTimeline(arg_29_0.playingDirector)

		local var_31_0 = {}

		GetOrAddComponent(var_29_4, "DftCommonSignalReceiver"):SetCommonEvent(function(arg_32_0)
			switch(arg_32_0.stringParameter, {
				TimelineRandomTrack = function()
					arg_29_0:DoTimelineRandomTrack(arg_29_0.playingDirector)
				end,
				TimelineLoop = function()
					arg_29_0.playingDirector.time = arg_32_0.floatParameter
				end,
				TimelineEnd = function()
					var_31_0.finish = true

					arg_29_0.playingDirector:Stop()
					setActive(tf(arg_29_0.playingDirector).parent, false)
				end
			}, function()
				warning("other event trigger:" .. arg_32_0.stringParameter)
			end)

			if var_31_0.finish then
				arg_29_0.timelineMark = var_31_0
				arg_29_0.debugTimelineName.text = ""
				arg_29_0.debugTrackName.text = ""

				arg_31_0()
			end
		end)
		arg_29_0.playingDirector:Evaluate()
		arg_29_0:DoTimelineRandomTrack(arg_29_0.playingDirector)
		setActive(tf(arg_29_0.playingDirector).parent, true)
		arg_29_0.playingDirector:Play()
		setActive(arg_29_0.mainCamera, false)

		if arg_29_0.activeDirectorInfo then
			arg_29_0.lastDirectorInfo = arg_29_0.activeDirectorInfo
		end

		arg_29_0.activeDirectorInfo = var_29_2
	end)
	seriesAsync(var_29_3, function()
		setActive(arg_29_0.mainCamera, true)

		arg_29_0.playingDirector = nil

		local var_37_0 = arg_29_0.timelineMark

		arg_29_0.timelineMark = nil

		existCall(arg_29_2, var_37_0)
	end)
end

function var_0_0.StopPlayingTimeline(arg_38_0, arg_38_1)
	if arg_38_0.playingDirector then
		arg_38_0.playingDirector:Stop()
		setActive(tf(arg_38_0.playingDirector).parent, false)

		arg_38_0.debugTimelineName.text = ""
		arg_38_0.debugTrackName.text = ""
		arg_38_0.playingDirector = nil

		if not arg_38_1 then
			setActive(arg_38_0.mainCamera, true)
		end
	end
end

function var_0_0.StartGame(arg_39_0)
	setActive(arg_39_0.mainCamera, true)

	arg_39_0.playingFlag = true
	arg_39_0.gameResult = nil
	arg_39_0.ourScore, arg_39_0.otherScore = 0, 0

	setActive(arg_39_0.gameUI, true)
	setActive(arg_39_0.gameUI:Find("Score"), false)

	local var_39_0 = arg_39_0.gameUI:Find("Count")

	setActive(var_39_0, true)

	arg_39_0.isStartGame = true

	pg.CriMgr.GetInstance():PlaySE_V3(var_0_1)
end

function var_0_0.UpdateGameScore(arg_40_0)
	setText(arg_40_0.ourScoreTF, arg_40_0.ourScore)
	setText(arg_40_0.otherScoreTF, arg_40_0.otherScore)
end

function var_0_0.UpdateScoreTpl(arg_41_0, arg_41_1)
	setText(arg_41_1:Find("Left/Tens/Text"), 0)
	setText(arg_41_1:Find("Left/Units/Text"), arg_41_0.ourScore % 10)
	setText(arg_41_1:Find("Right/Tens/Text"), 0)
	setText(arg_41_1:Find("Right/Units/Text"), arg_41_0.otherScore % 10)
end

function var_0_0.StartOneRound(arg_42_0)
	arg_42_0:UpdateGameScore()

	arg_42_0.roundEndFlag = false
	arg_42_0.roundResult = nil

	seriesAsync({
		function(arg_43_0)
			arg_42_0:FaQiuOP(arg_43_0)
		end,
		function(arg_44_0)
			arg_42_0:OneQTE()
		end
	})
end

function var_0_0.OneQTE(arg_45_0)
	seriesAsync({
		function(arg_46_0)
			arg_45_0:StartQTE(arg_46_0)
		end,
		function(arg_47_0)
			switch(arg_45_0.qteResult, {
				[var_0_0.QTE_RESULT.MISS] = function()
					arg_45_0:QteMissOP(function()
						arg_45_0.roundEndFlag = true
						arg_45_0.roundResult = var_0_0.ROUND_RESULT.OTHER_WIN

						arg_47_0()
					end)
				end,
				[var_0_0.QTE_RESULT.HIT] = function()
					arg_45_0:QteHitOP(arg_47_0)
				end,
				[var_0_0.QTE_RESULT.PERFECT] = function()
					arg_45_0:QtePerfectOP(function()
						arg_45_0.roundEndFlag = true
						arg_45_0.roundResult = var_0_0.ROUND_RESULT.OUR_WIN

						arg_47_0()
					end)
				end
			}, function()
				assert(false, "unknow qte result" .. arg_45_0.qteResult)
			end)
		end
	}, function()
		if not arg_45_0.roundEndFlag then
			arg_45_0:OneQTE()
		else
			arg_45_0:EndOneRound()
		end
	end)
end

function var_0_0.EndOneRound(arg_55_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_6)

	arg_55_0.isEndOneRound = true

	setActive(arg_55_0.gameUI, false)
	arg_55_0:UpdateScoreTpl(arg_55_0.scoreUI:Find("ScoreTpl"))
	setText(arg_55_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_55_0.ourScore % 10)
	setText(arg_55_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_55_0.otherScore % 10)
	switch(arg_55_0.roundResult, {
		[var_0_0.ROUND_RESULT.OUR_WIN] = function()
			arg_55_0.ourScore = arg_55_0.ourScore + 1

			setText(arg_55_0.scoreUI:Find("ScoreTpl/Left/Units/new/newText"), arg_55_0.ourScore % 10)
			setActive(arg_55_0.scoreUI, true)
			quickPlayAnimation(arg_55_0.scoreUI, "Anim_Dorm3d_volleyball_score_leftin")
		end,
		[var_0_0.ROUND_RESULT.OTHER_WIN] = function()
			arg_55_0.otherScore = arg_55_0.otherScore + 1

			setText(arg_55_0.scoreUI:Find("ScoreTpl/Right/Units/new/newText"), arg_55_0.otherScore % 10)
			setActive(arg_55_0.scoreUI, true)
			quickPlayAnimation(arg_55_0.scoreUI, "Anim_Dorm3d_volleyball_score_rightin")
		end
	}, function()
		assert(false, "unknow round result" .. arg_55_0.roundResult)
	end)
end

function var_0_0.CheckEndGame(arg_59_0)
	if arg_59_0.ourScore >= var_0_0.endScore then
		arg_59_0.gameResult = var_0_0.GAME_RESULT.VICTORY

		return true
	end

	if arg_59_0.otherScore >= var_0_0.endScore then
		arg_59_0.gameResult = var_0_0.GAME_RESULT.DEFEAT

		return true
	end

	return false
end

function var_0_0.EndGame(arg_60_0)
	if arg_60_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
		pg.CriMgr.GetInstance():PlaySE_V3(var_0_7)
	end

	seriesAsync({
		function(arg_61_0)
			local var_61_0 = arg_60_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "shibai" or "shengli"

			arg_60_0:PlayTimeline({
				name = arg_60_0:GetWeightTimeline(var_61_0)
			}, arg_61_0)
		end
	}, function()
		arg_60_0:PlayTimeline({
			name = arg_60_0:GetWeightTimeline("daiji")
		}, function()
			return
		end)
		setActive(arg_60_0.endUI, true)
		setActive(arg_60_0.endUI:Find("Title/Victory"), arg_60_0.gameResult == var_0_0.GAME_RESULT.VICTORY)
		setActive(arg_60_0.endUI:Find("Title/Defeat"), arg_60_0.gameResult == var_0_0.GAME_RESULT.DEFEAT)
		arg_60_0:UpdateScoreTpl(arg_60_0.endUI:Find("ScoreTpl"))
	end)
end

function var_0_0.ShowResultUI(arg_64_0, arg_64_1)
	(function()
		local var_65_0 = arg_64_0.contextData.roomId
		local var_65_1 = arg_64_0.contextData.groupId
		local var_65_2 = arg_64_0.contextData.groupIds or {
			var_65_1
		}
		local var_65_3 = table.concat(var_65_2, ",")
		local var_65_4 = arg_64_0.ourScore .. ":" .. arg_64_0.otherScore

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataRoom(var_65_0, 8, var_65_3, var_65_4))
	end)()
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_8)
	seriesAsync({
		function(arg_66_0)
			quickPlayAnimation(arg_64_0.endUI, "Anim_Dorm3d_volleyball_end_out")
			onDelayTick(function()
				setActive(arg_64_0.endUI, false)
			end, 0.1)

			if arg_64_0.gameResult == var_0_0.GAME_RESULT.VICTORY then
				arg_64_0:PlayTimeline({
					name = arg_64_0:GetWeightTimeline("jiangli")
				}, arg_66_0)
			else
				arg_64_0:StopPlayingTimeline()
				arg_66_0()
			end
		end
	}, function()
		setActive(arg_64_0.resultUI, true)

		local var_68_0

		var_68_0 = arg_64_0.gameResult == var_0_0.GAME_RESULT.VICTORY and "Victory" or "Defeat"

		setText(arg_64_0.resultUI:Find("Panel/Text"), i18n("volleyball_end_tip", arg_64_0.apartment:getConfig("name")))

		if arg_64_1 and arg_64_1.cost > 0 then
			setActive(arg_64_0.resultUI:Find("Panel/Award"), true)
			setText(arg_64_0.resultUI:Find("Panel/Award/Text"), i18n("volleyball_end_award", arg_64_0.apartment:getConfig("name")))
		else
			setActive(arg_64_0.resultUI:Find("Panel/Award"), false)
		end

		gcAll()
	end)
end

function var_0_0.FaQiuOP(arg_69_0, arg_69_1)
	arg_69_0:PlayTimeline({
		name = arg_69_0:GetWeightTimeline("faqiu")
	}, arg_69_1)
end

function var_0_0.StartQTE(arg_70_0, arg_70_1)
	arg_70_0.qteCallback = arg_70_1

	setActive(arg_70_0.ballCamera, true)
	setActive(arg_70_0.mainCamera, false)

	arg_70_0.randomScreenPos = Vector2(math.random(var_0_0.BallRandomDelat.Left, Screen.width - var_0_0.BallRandomDelat.Right), math.random(var_0_0.BallRandomDelat.Bottom, Screen.height - var_0_0.BallRandomDelat.Top))

	local var_70_0 = arg_70_0.ballCameraComp:ScreenPointToRay(arg_70_0.randomScreenPos)

	arg_70_0.randomScale = math.random(var_0_0.perfectScaleRandoms[1] * 10, arg_70_0.perfectScaleRandoms[2] * 10) / 10

	local var_70_1 = (var_0_0.perfectRadiusMax + var_0_0.perfectRadiusMin) / 2 * arg_70_0.randomScale / var_0_0.triggerRadius
	local var_70_2 = arg_70_0.ballQtePlane.distance + (arg_70_0.ballMissPlane.distance - arg_70_0.ballQtePlane.distance) * (1 - var_70_1)
	local var_70_3, var_70_4 = Plane.New(arg_70_0.ballQtePlane.normal, var_70_2):Raycast(var_70_0)

	assert(var_70_3, "retPerfect plane not in view")

	arg_70_0.ballDir = (var_70_0:GetPoint(var_70_4) - var_0_0.BallInitPos):Normalize()

	local var_70_5 = Ray.New(arg_70_0.ballDir, var_0_0.BallInitPos)
	local var_70_6, var_70_7 = arg_70_0.ballQtePlane:Raycast(var_70_5)

	assert(var_70_6, "qte plane not in view")

	local var_70_8 = var_70_5:GetPoint(var_70_7)
	local var_70_9, var_70_10 = arg_70_0.ballMissPlane:Raycast(var_70_5)

	assert(var_70_9, "miss plane not in view")

	local var_70_11 = var_70_5:GetPoint(var_70_10)
	local var_70_12 = 0

	arg_70_0.qteUITime = (var_70_8 - var_70_11):Magnitude() / var_0_0.BallQTESpeed
	arg_70_0.ballTimer = Timer.New(function()
		if var_70_12 >= var_70_10 then
			arg_70_0.ballTimer:Stop()

			arg_70_0.ballTimer = nil

			setActive(arg_70_0.ballTF, false)

			arg_70_0.ballTF.position = var_0_0.BallInitPos

			if arg_70_0.startQTEUI then
				setLocalScale(arg_70_0.qteTriggerTF, {
					x = 0,
					y = 0
				})
				arg_70_0:EndQTE(var_0_0.QTE_RESULT.MISS)
			end
		elseif var_70_12 >= var_70_7 then
			var_70_12 = var_70_12 + var_0_0.BallQTESpeed
			arg_70_0.ballTF.position = var_70_5:GetPoint(var_70_12)

			if not arg_70_0.startQTEUI then
				arg_70_0:StartQTEUI()
			end

			arg_70_0.curScale = arg_70_0.curScale - 1 / arg_70_0.qteUITime

			setLocalScale(arg_70_0.qteTriggerTF, {
				x = arg_70_0.curScale,
				y = arg_70_0.curScale
			})

			arg_70_0.curRadius = var_0_0.triggerRadius * arg_70_0.curScale

			if arg_70_0.curScale < 0 then
				arg_70_0:EndQTE()
			end
		else
			var_70_12 = var_70_12 + var_0_0.BallSpeed
			arg_70_0.ballTF.position = var_70_5:GetPoint(var_70_12)
		end
	end, 0.016666666666666666, -1)

	setActive(arg_70_0.ballTF, true)
	arg_70_0.ballTimer:Start()
end

function var_0_0.StartQTEUI(arg_72_0)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_2)
	setLocalScale(arg_72_0.qteTriggerTF, {
		x = 1,
		y = 1
	})
	eachChild(arg_72_0.qteTF:Find("animroot/Result"), function(arg_73_0)
		setActive(arg_73_0, false)
	end)

	arg_72_0.qteResult = nil
	arg_72_0.curRadius = var_0_0.triggerRadius
	arg_72_0.curPerfectRadiusMax = var_0_0.perfectRadiusMax * arg_72_0.randomScale
	arg_72_0.curPerfectRadiusMin = var_0_0.perfectRadiusMin * arg_72_0.randomScale

	setLocalScale(arg_72_0.qteTF:Find("animroot/Perfect"), {
		x = arg_72_0.randomScale,
		y = arg_72_0.randomScale
	})

	arg_72_0.curScale = 1

	setLocalPosition(arg_72_0.qteTF, LuaHelper.ScreenToLocal(arg_72_0.qteTF.parent, arg_72_0.randomScreenPos, pg.UIMgr.GetInstance().uiCameraComp))
	setActive(arg_72_0.qteTF, true)

	arg_72_0.startQTEUI = true
end

function var_0_0.EndQTE(arg_74_0, arg_74_1)
	arg_74_0.startQTEUI = nil

	setActive(arg_74_0.mainCamera, true)
	setActive(arg_74_0.ballCamera, false)

	if arg_74_1 then
		arg_74_0.qteResult = arg_74_1
	elseif arg_74_0.curRadius < var_0_0.hitRadiusMin or arg_74_0.curRadius > var_0_0.hitRadiusMax then
		arg_74_0.qteResult = var_0_0.QTE_RESULT.MISS
	elseif arg_74_0.curRadius <= arg_74_0.curPerfectRadiusMax and arg_74_0.curRadius >= arg_74_0.curPerfectRadiusMin then
		arg_74_0.qteResult = var_0_0.QTE_RESULT.PERFECT
	else
		arg_74_0.qteResult = var_0_0.QTE_RESULT.HIT
	end

	eachChild(arg_74_0.qteTF:Find("animroot/Result"), function(arg_75_0)
		setActive(arg_75_0, arg_75_0.name == arg_74_0.qteResult)
	end)

	if arg_74_0.ballTimer then
		arg_74_0.ballTimer:Stop()

		arg_74_0.ballTimer = nil

		setActive(arg_74_0.ballTF, false)

		arg_74_0.ballTF.position = var_0_0.BallInitPos
	end

	if arg_74_0.qteCallback then
		arg_74_0.qteCallback()

		arg_74_0.qteCallback = nil
	end

	onDelayTick(function()
		setActive(arg_74_0.qteTF, false)
	end, 1)
end

function var_0_0.QteMissOP(arg_77_0, arg_77_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_5)
	arg_77_0:PlayTimeline({
		name = arg_77_0:GetWeightTimeline("shiqiu")
	}, arg_77_1)
end

function var_0_0.QteHitOP(arg_78_0, arg_78_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_3)
	seriesAsync({
		function(arg_79_0)
			arg_78_0:PlayTimeline({
				name = arg_78_0:GetWeightTimeline("fly")
			}, arg_79_0)
		end,
		function(arg_80_0)
			arg_78_0:PlayTimeline({
				name = arg_78_0:GetWeightTimeline("jieqiu")
			}, arg_80_0)
		end
	}, arg_78_1)
end

function var_0_0.QtePerfectOP(arg_81_0, arg_81_1)
	pg.CriMgr.GetInstance():PlaySE_V3(var_0_4)
	seriesAsync({
		function(arg_82_0)
			arg_81_0:PlayTimeline({
				name = arg_81_0:GetWeightTimeline("max_fly")
			}, arg_82_0)
		end,
		function(arg_83_0)
			arg_81_0:PlayTimeline({
				name = arg_81_0:GetWeightTimeline("shouji")
			}, arg_83_0)
		end
	}, arg_81_1)
end

function var_0_0.GetWeightTimeline(arg_84_0, arg_84_1)
	local var_84_0 = arg_84_0.volleyballCfg[arg_84_1]

	assert(var_84_0 ~= "", "volleyball cfg is empty string" .. arg_84_1)
	assert(#var_84_0 ~= 0, "volleyball cfg is empty table:" .. arg_84_1)

	local var_84_1 = underscore.reduce(var_84_0, 0, function(arg_85_0, arg_85_1)
		return arg_85_0 + arg_85_1[2]
	end)
	local var_84_2 = math.random() * var_84_1
	local var_84_3 = 0

	for iter_84_0, iter_84_1 in ipairs(var_84_0) do
		var_84_3 = var_84_3 + iter_84_1[2]

		if var_84_2 <= var_84_3 then
			return iter_84_1[1]
		end
	end
end

function var_0_0.DoTimelineRandomTrack(arg_86_0, arg_86_1)
	local var_86_0 = {}

	for iter_86_0, iter_86_1 in ipairs(TimelineHelper.GetTimelineTracks(arg_86_1):ToTable()) do
		if iter_86_1.name ~= "Markers" then
			iter_86_1.muted = true

			table.insert(var_86_0, iter_86_1)
		end
	end

	if #var_86_0 > 0 then
		local var_86_1 = var_86_0[math.random(#var_86_0)]

		underscore.each(var_86_0, function(arg_87_0)
			if arg_87_0.name == var_86_1.name then
				arg_87_0.muted = false
			end
		end)

		arg_86_0.debugTrackName.text = var_86_1.name
	else
		arg_86_0.debugTrackName.text = "track cnt 0"
	end
end

function var_0_0.OnPause(arg_88_0)
	if arg_88_0.ballTimer then
		arg_88_0.ballTimer:Stop()
	end

	if arg_88_0.playingDirector then
		arg_88_0.playingDirector:Pause()
	end
end

function var_0_0.OnResume(arg_89_0)
	if arg_89_0.ballTimer then
		arg_89_0.ballTimer:Start()
	end

	if arg_89_0.playingDirector then
		arg_89_0.playingDirector:Play()
	end
end

function var_0_0.onBackPressed(arg_90_0)
	if not arg_90_0.playingFlag or isActive(arg_90_0.gameUI:Find("Count")) or isActive(arg_90_0.endUI) then
		return
	end

	arg_90_0:OnPause()
	pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_MSGBOX, {
		contentText = i18n("sure_exit_volleyball"),
		onConfirm = function()
			arg_90_0:emit(var_0_0.ON_BACK)
		end,
		onClose = function()
			arg_90_0:OnResume()
		end
	})
end

function var_0_0.willExit(arg_93_0)
	arg_93_0.loader:Clear()

	if arg_93_0.ballTimer then
		arg_93_0.ballTimer:Stop()

		arg_93_0.ballTimer = nil
	end

	local var_93_0 = {
		{
			path = string.lower("dorm3d/character/" .. arg_93_0.timelineSceneRootName .. "/timeline/" .. arg_93_0.timelineSceneName .. "/" .. arg_93_0.timelineSceneName .. "_scene"),
			name = arg_93_0.timelineSceneName
		},
		{
			path = string.lower("dorm3d/scenesres/scenes/common/" .. arg_93_0.sceneRootName .. "/" .. arg_93_0.sceneName .. "_scene"),
			name = arg_93_0.sceneName
		}
	}
	local var_93_1 = underscore.map(var_93_0, function(arg_94_0)
		return function(arg_95_0)
			SceneOpMgr.Inst:UnloadSceneAsync(arg_94_0.path, arg_94_0.name, arg_95_0)
		end
	end)

	seriesAsync(var_93_1, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

return var_0_0
