local var_0_0 = class("IslandTimelineMgr", import("view.base.BaseSubView"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3

function var_0_0.getUIName(arg_1_0)
	return "IslandTimelineUI"
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_0.poolMgr = arg_2_1

	var_0_0.super.Ctor(arg_2_0, arg_2_2, arg_2_3, arg_2_4)
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0.skipBtn = arg_3_0:findTF("adapt/skip_button")
	arg_3_0.maskCG = arg_3_0:findTF("mask"):GetComponent(typeof(CanvasGroup))
	arg_3_0.state = var_0_1
end

function var_0_0.GetPoolMgr(arg_4_0)
	return arg_4_0.poolMgr
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0.skipBtn, function()
		if not arg_5_0:IsPlaying() then
			return
		end

		arg_5_0:Stop()
	end, SFX_PANEL)
end

function var_0_0.IsPlaying(arg_7_0)
	return arg_7_0.state == var_0_2
end

function var_0_0.Show(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if arg_8_0:IsPlaying() then
		return
	end

	var_0_0.super.Show(arg_8_0)

	arg_8_0.state = var_0_2
	arg_8_0.callback = arg_8_3
	arg_8_0.loadCharacterList = {}

	arg_8_0:PlaySceneTimeline(arg_8_1, arg_8_2, function()
		arg_8_0:Stop()
	end)
end

function var_0_0.PlaySceneTimeline(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	setActive(arg_10_0.skipBtn, false)

	local var_10_0 = pg.island_scene_timeline[arg_10_1]

	assert(var_10_0, "island_scene_timeline >>>>" .. arg_10_1)

	local var_10_1 = IslandSceneSwitcher.New()

	arg_10_0:Mask()
	seriesAsync({
		function(arg_11_0)
			var_10_1:Load(var_10_0.name, nil, {
				function(arg_12_0)
					arg_12_0()
					arg_11_0()
				end
			}, 2)
		end,
		function(arg_13_0)
			arg_10_0:ApplyReplace(var_10_0, arg_10_2, arg_13_0)
		end,
		function(arg_14_0)
			onNextTick(arg_14_0)
		end,
		function(arg_15_0)
			setActive(arg_10_0.skipBtn, true)
			arg_10_0:PlayTimeline(var_10_0.sequence, arg_15_0)
		end,
		function(arg_16_0)
			if not arg_10_0:IsPlaying() then
				arg_16_0()

				return
			end

			arg_10_0:UnloadCharacter()
			arg_10_0:RevertReplace()
			var_10_1:UnLoad()
			_IslandCore:GetView().weatherSystem:Play()
			gcAll(false)
			SceneOpMgr.Inst:SetActiveSceneByIndex(1)
			arg_16_0()
		end
	}, arg_10_3)

	arg_10_0.sceneLoader = var_10_1
end

function var_0_0.RevertReplace(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.revertGo or {}) do
		setParent(iter_17_1.go, iter_17_1.container)

		iter_17_1.go.transform.localPosition = iter_17_1.position
		iter_17_1.go.transform.localEulerAngles = iter_17_1.rotation
		iter_17_1.go.transform.localScale = iter_17_1.scale

		if _IslandCore and iter_17_1.unitId >= 0 then
			local var_17_0 = iter_17_1.unitId == 0 and _IslandCore:GetView().player or _IslandCore:GetView():GetUnitModule(iter_17_1.unitId)

			if var_17_0 then
				var_17_0:Enable()
			end
		end
	end

	arg_17_0.revertGo = {}
end

function var_0_0.ApplyReplace(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	arg_18_0:ReplcaeCamTracks(arg_18_1.sequence)

	if #arg_18_1.obj <= 0 then
		arg_18_3()

		return
	end

	local var_18_0 = {}

	arg_18_0.revertGo = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_1.obj) do
		local var_18_1 = arg_18_1.tracks[iter_18_0]

		table.insert(var_18_0, function(arg_19_0)
			arg_18_0:ReplaceTimelineRes(iter_18_1, var_18_1, arg_18_2, arg_19_0)
		end)
	end

	parallelAsync(var_18_0, arg_18_3)
end

function var_0_0.ReplaceTimelineRes(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	local var_20_0 = arg_20_1[1]
	local var_20_1 = BuildVector3(arg_20_1[2])
	local var_20_2 = BuildVector3(arg_20_1[3])
	local var_20_3 = arg_20_1[4][1]
	local var_20_4 = arg_20_1[4][2]
	local var_20_5 = {}
	local var_20_6
	local var_20_7 = false
	local var_20_8 = -1

	if var_20_3 == IslandConst.TIMELINE_REPLACE_TYPE_CREATE then
		table.insert(var_20_5, function(arg_21_0)
			arg_20_0:LoadCharacter(var_20_4, function(arg_22_0)
				var_20_6 = arg_22_0

				arg_21_0()
			end)
		end)
	elseif var_20_3 == IslandConst.TIMELINE_REPLACE_TYPE_PLAYER then
		if _IslandCore then
			local var_20_9 = _IslandCore:GetView().player

			if var_20_9 then
				var_20_8 = 0

				var_20_9:Disable()

				var_20_6 = var_20_9._go
			end
		end

		var_20_7 = true
	elseif var_20_3 == IslandConst.TIMELINE_REPLACE_TYPE_GEN_OBJ then
		if _IslandCore then
			local var_20_10 = _IslandCore:GetView():GetUnitModule(var_20_4)

			if var_20_10 then
				var_20_8 = var_20_10.id

				var_20_10:Disable()

				var_20_6 = var_20_10._go
			end
		end

		var_20_7 = true
	elseif var_20_3 == IslandConst.TIMELINE_REPLACE_TYPE_STATIC_OBJ then
		var_20_6 = GameObject.Find(var_20_4)
		var_20_7 = true
	elseif var_20_3 == IslandConst.TIMELINE_REPLACE_TYPE_CODE_OBJ then
		table.insert(var_20_5, function(arg_23_0)
			arg_20_0:LoadCharacter(arg_20_3[1], function(arg_24_0)
				var_20_6 = arg_24_0

				arg_23_0()
			end)
		end)
	end

	if var_20_7 and var_20_6 then
		table.insert(arg_20_0.revertGo, {
			go = var_20_6,
			container = var_20_6.transform.parent,
			position = var_20_6.transform.localPosition,
			rotation = var_20_6.transform.localEulerAngles,
			scale = var_20_6.transform.localScale,
			unitId = var_20_8
		})
	end

	table.insert(var_20_5, function(arg_25_0)
		if not var_20_6 then
			arg_25_0()

			return
		end

		setActive(var_20_6, true)

		local var_25_0 = GameObject.Find(var_20_0)

		setParent(var_20_6, var_25_0)

		var_20_6.transform.localPosition = var_20_1
		var_20_6.transform.localEulerAngles = var_20_2

		arg_20_0:ReplaceTracks(var_20_6, arg_20_2, arg_25_0)
	end)
	seriesAsync(var_20_5, arg_20_4)
end

local function var_0_4(arg_26_0, arg_26_1)
	if arg_26_1 == "Animator" then
		local var_26_0 = arg_26_0.transform:GetChild(0):GetComponent(typeof(Animator))

		if var_26_0 then
			return var_26_0
		end

		return (GetOrAddComponent(arg_26_0, typeof(Animator)))
	elseif arg_26_1 == "Transform" then
		return arg_26_0.transform
	else
		return arg_26_0
	end
end

function var_0_0.ReplaceTracks(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in ipairs(arg_27_2) do
		local var_27_1 = iter_27_1[1]
		local var_27_2 = iter_27_1[2]
		local var_27_3 = iter_27_1[3]

		if not var_27_0[var_27_1] then
			var_27_0[var_27_1] = {}
		end

		table.insert(var_27_0[var_27_1], {
			var_27_2,
			var_27_3
		})
	end

	for iter_27_2, iter_27_3 in pairs(var_27_0) do
		local var_27_4 = GameObject.Find(iter_27_2):GetComponent(typeof(UnityEngine.Playables.PlayableDirector))
		local var_27_5 = TimelineHelper.GetTimelineTracks(var_27_4):ToTable()
		local var_27_6 = {}

		for iter_27_4, iter_27_5 in ipairs(var_27_5) do
			var_27_6[iter_27_5.name] = iter_27_5
		end

		for iter_27_6, iter_27_7 in ipairs(iter_27_3) do
			local var_27_7 = tonumber(iter_27_7[1])
			local var_27_8 = var_27_7 and var_27_5[var_27_7 + 1] or var_27_6[iter_27_7[1]]

			if var_27_8 then
				TimelineHelper.SetSceneBinding(var_27_4, var_27_8, var_0_4(arg_27_1, iter_27_7[2]))
			end
		end
	end

	arg_27_3()
end

function var_0_0.ReplcaeCamTracks(arg_28_0, arg_28_1)
	local var_28_0 = GameObject.Find(arg_28_1)

	if not var_28_0 then
		return
	end

	local var_28_1 = var_28_0.transform:GetComponentsInChildren(typeof(UnityEngine.Playables.PlayableDirector), true):ToTable()

	for iter_28_0, iter_28_1 in ipairs(var_28_1) do
		local var_28_2 = TimelineHelper.GetTimelineTracks(iter_28_1):ToTable()

		for iter_28_2, iter_28_3 in ipairs(var_28_2) do
			if iter_28_3:GetType():ToString() == "CinemachineTrack" then
				TimelineHelper.SetSceneBinding(iter_28_1, iter_28_3, IslandCameraMgr.instance.cinemachineBrain)
			end
		end
	end
end

function var_0_0.LoadCharacter(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = pg.island_unit_character[arg_29_1]

	arg_29_0:GetPoolMgr():GetCharacter(var_29_0.model, var_29_0.animator, function(arg_30_0)
		table.insert(arg_29_0.loadCharacterList, {
			data = var_29_0,
			go = arg_30_0
		})
		arg_29_2(arg_30_0)
	end)
end

function var_0_0.UnloadCharacter(arg_31_0, arg_31_1)
	for iter_31_0, iter_31_1 in ipairs(arg_31_0.loadCharacterList) do
		arg_31_0:GetPoolMgr():ReturnCharacter(iter_31_1.data.model, iter_31_1.data.animator, iter_31_1.go)
	end

	arg_31_0.loadCharacterList = {}
end

function var_0_0.Mask(arg_32_0)
	arg_32_0.maskCG.alpha = 1
	arg_32_0.maskCG.blocksRaycasts = true
end

function var_0_0.UnMask(arg_33_0)
	arg_33_0.maskCG.alpha = 0
	arg_33_0.maskCG.blocksRaycasts = false
end

function var_0_0.PlayTimeline(arg_34_0, arg_34_1, arg_34_2)
	if not arg_34_0:IsPlaying() then
		arg_34_2()

		return
	end

	arg_34_0:UnMask()

	local var_34_0 = GameObject.Find(arg_34_1)

	assert(var_34_0, arg_34_1)

	if not var_34_0 then
		return
	end

	local var_34_1 = var_34_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))
	local var_34_2 = GetOrAddComponent(var_34_0, "DftCommonSignalReceiver")

	var_34_2:SetCommonEvent(function(arg_35_0)
		if arg_35_0.stringParameter == "TimelineEnd" then
			var_34_1:Stop()
			var_34_2:SetCommonEvent(nil)

			arg_34_0.dftCommonSignalReceiver = nil
			arg_34_0.playableDirector = nil

			arg_34_2()
		end
	end)
	var_34_1:Play()

	arg_34_0.playableDirector = var_34_1
	arg_34_0.dftCommonSignalReceiver = var_34_2
end

function var_0_0.Stop(arg_36_0)
	arg_36_0:UnloadCharacter()
	arg_36_0:RevertReplace()

	if arg_36_0.playableDirector then
		arg_36_0.playableDirector:Stop()

		arg_36_0.playableDirector = nil
	end

	if arg_36_0.dftCommonSignalReceiver then
		arg_36_0.dftCommonSignalReceiver:SetCommonEvent(nil)

		arg_36_0.dftCommonSignalReceiver = nil
	end

	if arg_36_0.sceneLoader then
		arg_36_0.sceneLoader:UnLoad()
		SceneOpMgr.Inst:SetActiveSceneByIndex(1)

		arg_36_0.sceneLoader = nil
	end

	if arg_36_0.callback then
		arg_36_0.callback()
	end

	arg_36_0.callback = nil
	arg_36_0.state = var_0_3

	arg_36_0:Hide()
end

function var_0_0.Hide(arg_37_0)
	var_0_0.super.Hide(arg_37_0)
	arg_37_0:UnMask()
end

function var_0_0.OnDestroy(arg_38_0)
	if arg_38_0:isShowing() then
		arg_38_0:Stop()
	end
end

return var_0_0
