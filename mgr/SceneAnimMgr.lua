pg = pg or {}
pg.SceneAnimMgr = singletonClass("SceneAnimMgr")

local var_0_0 = pg.SceneAnimMgr

function var_0_0.Ctor(arg_1_0)
	arg_1_0.loadingList = {}
	arg_1_0.dormCallbackList = {}
end

function var_0_0.Init(arg_2_0, arg_2_1)
	print("initializing sceneanim manager...")
	LoadAndInstantiateAsync("ui", "SceneAnimUI", function(arg_3_0)
		arg_2_0._go = arg_3_0

		arg_2_0._go:SetActive(false)

		arg_2_0._tf = arg_2_0._go.transform

		arg_2_0._tf:SetParent(pg.UIMgr.GetInstance().OverlayToast, false)

		arg_2_0.container = arg_2_0._tf:Find("container")

		if arg_2_1 then
			arg_2_1()
		end
	end, true, true)
end

function var_0_0.SixthAnniversaryJPCoverGoScene(arg_4_0, arg_4_1)
	arg_4_0.playing = true

	setActive(arg_4_0._tf, true)

	local var_4_0 = "SixthAnniversaryJPCoverUI"

	PoolMgr.GetInstance():GetUI(var_4_0, true, function(arg_5_0)
		local var_5_0 = arg_5_0.transform

		setParent(var_5_0, arg_4_0.container, false)
		setActive(var_5_0, true)

		local var_5_1 = var_5_0:Find("houshanyunwu"):GetComponent(typeof(SpineAnimUI))

		var_5_1:SetActionCallBack(function(arg_6_0)
			if arg_6_0 == "finish" then
				PoolMgr.GetInstance():ReturnUI(var_4_0, arg_5_0)

				arg_4_0.playing = nil

				setActive(var_5_0, false)
				setActive(arg_4_0._tf, false)
			elseif arg_6_0 == "action" then
				pg.m02:sendNotification(GAME.GO_SCENE, arg_4_1)
			end
		end)
		var_5_1:SetAction("action", 0)
	end)
end

function var_0_0.OtherWorldCoverGoScene(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.playing = true

	setActive(arg_7_0._tf, true)

	local var_7_0 = "OtherworldCoverUI"

	PoolMgr.GetInstance():GetUI(var_7_0, true, function(arg_8_0)
		local var_8_0 = arg_8_0.transform

		setParent(var_8_0, arg_7_0.container, false)
		setActive(var_8_0, true)

		local var_8_1 = var_8_0:Find("yuncaizhuanchang"):GetComponent(typeof(SpineAnimUI))

		var_8_1:SetActionCallBack(function(arg_9_0)
			if arg_9_0 == "finish" then
				PoolMgr.GetInstance():ReturnUI(var_7_0, arg_8_0)

				arg_7_0.playing = nil

				setActive(var_8_0, false)
				setActive(arg_7_0._tf, false)
			elseif arg_9_0 == "action" then
				pg.m02:sendNotification(GAME.GO_SCENE, arg_7_1, arg_7_2)
			end
		end)
		var_8_1:SetAction("action", 0)
	end)
end

function var_0_0.CommonSceneChange(arg_10_0, arg_10_1, arg_10_2)
	table.insert(arg_10_0.loadingList, {
		arg_10_1,
		arg_10_2
	})

	if not arg_10_0.playing then
		arg_10_0:DoSceneChange()
	end
end

function var_0_0.DoSceneChange(arg_11_0)
	arg_11_0.playing = true

	setActive(arg_11_0._tf, true)
	pg.UIMgr.GetInstance():LoadingOn(false)

	local var_11_0, var_11_1 = unpack(table.remove(arg_11_0.loadingList, 1))
	local var_11_2 = arg_11_0.container:Find(var_11_0)
	local var_11_3 = {}

	if not var_11_2 then
		table.insert(var_11_3, function(arg_12_0)
			PoolMgr.GetInstance():GetUI(var_11_0, true, function(arg_13_0)
				var_11_2 = arg_13_0.transform

				setParent(var_11_2, arg_11_0.container, false)
				arg_12_0()
			end)
		end)
	end

	table.insert(var_11_3, function(arg_14_0)
		var_11_2:GetComponent("DftAniEvent"):SetTriggerEvent(arg_14_0)
		arg_11_0:StartLoading(var_11_0, var_11_2)
	end)
	table.insert(var_11_3, function(arg_15_0)
		local var_15_0

		local function var_15_1()
			if #arg_11_0.loadingList > 0 and arg_11_0.loadingList[1][1] == var_11_0 then
				var_11_0, var_11_1 = unpack(table.remove(arg_11_0.loadingList, 1))

				var_11_1(var_15_1)
			else
				arg_15_0()
			end
		end

		var_11_1(var_15_1)
		arg_11_0:LoopLoading(var_11_0, var_11_2)
	end)
	table.insert(var_11_3, function(arg_17_0)
		var_11_2:GetComponent("DftAniEvent"):SetEndEvent(arg_17_0)
		arg_11_0:EndLoading(var_11_0, var_11_2)
	end)
	seriesAsync(var_11_3, function()
		PoolMgr.GetInstance():ReturnUI(var_11_0, var_11_2.gameObject)
		pg.UIMgr.GetInstance():LoadingOff()

		if #arg_11_0.loadingList > 0 then
			arg_11_0:DoSceneChange()
		else
			arg_11_0.playing = nil

			setActive(arg_11_0._tf, false)
		end
	end)
end

function var_0_0.StartLoading(arg_19_0, arg_19_1, arg_19_2)
	switch(arg_19_1, {
		Dorm3DLoading = function()
			GetComponent(arg_19_2, typeof(Animator)):SetBool("Finish", false)

			local var_20_0 = arg_19_2:Find("bg"):GetComponent(typeof(Image)).material

			var_20_0:SetInt("_DissolveTexFlip", 1)
			LeanTween.value(1, 0, 0.6):setOnUpdate(System.Action_float(function(arg_21_0)
				var_20_0:SetFloat("_Dissolve", arg_21_0)
			end)):setEase(LeanTweenType.easeOutCubic)
			quickPlayAnimator(arg_19_2, "anim_dorm3d_loading_in")
		end,
		IslandplaneLoading = function()
			quickPlayAnimation(arg_19_2, "anim_planeLoading_in")
			arg_19_2:Find("load"):GetComponent("SkeletonAnimation").state:SetAnimation(0, "cut_in", false)
		end,
		IslandcarLoading = function()
			quickPlayAnimation(arg_19_2, "anim_planeLoading_in")
			arg_19_2:Find("load"):GetComponent("SkeletonAnimation").state:SetAnimation(0, "cut_in", false)
		end
	}, function()
		return
	end)
end

function var_0_0.LoopLoading(arg_25_0, arg_25_1, arg_25_2)
	switch(arg_25_1, {
		Dorm3DLoading = function()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_loading_loop")
		end,
		IslandplaneLoading = function()
			arg_25_2:Find("load"):GetComponent("SkeletonAnimation").state:SetAnimation(0, "normal", true)
		end,
		IslandcarLoading = function()
			arg_25_2:Find("load"):GetComponent("SkeletonAnimation").state:SetAnimation(0, "normal", true)
		end
	}, function()
		return
	end)
end

function var_0_0.EndLoading(arg_30_0, arg_30_1, arg_30_2)
	switch(arg_30_1, {
		Dorm3DLoading = function()
			local var_31_0 = arg_30_2:Find("bg"):GetComponent(typeof(Image)).material

			var_31_0:SetInt("_DissolveTexFlip", 0)
			LeanTween.value(0, 1, 0.6):setOnUpdate(System.Action_float(function(arg_32_0)
				var_31_0:SetFloat("_Dissolve", arg_32_0)
			end)):setEase(LeanTweenType.easeInOutCubic)
			GetComponent(arg_30_2, typeof(Animator)):SetBool("Finish", true)
		end,
		IslandplaneLoading = function()
			quickPlayAnimation(arg_30_2, "anim_planeLoading_out")
		end,
		IslandcarLoading = function()
			quickPlayAnimation(arg_30_2, "anim_planeLoading_out")
		end
	}, function()
		return
	end)
end

function var_0_0.RegisterDormNextCall(arg_36_0, arg_36_1)
	function arg_36_0.dormNextCall()
		arg_36_0.dormNextCall = nil

		return arg_36_1()
	end
end

function var_0_0.Dorm3DSceneChange(arg_38_0, arg_38_1)
	table.insert(arg_38_0.dormCallbackList, arg_38_1)

	if not arg_38_0.playing then
		pg.UIMgr.GetInstance():LoadingOn(false)
		arg_38_0:DoDorm3DSceneChange()
	end

	existCall(arg_38_0.dormNextCall)
end

function var_0_0.DoDorm3DSceneChange(arg_39_0, arg_39_1)
	arg_39_0.playing = true

	setActive(arg_39_0._tf, true)

	local var_39_0 = "Dorm3DLoading"
	local var_39_1 = {}

	if not arg_39_1 then
		table.insert(var_39_1, function(arg_40_0)
			PoolMgr.GetInstance():GetUI(var_39_0, true, function(arg_41_0)
				arg_39_1 = arg_41_0.transform

				setParent(arg_39_1, arg_39_0.container, false)
				arg_40_0()
			end)
		end)
	end

	seriesAsync(var_39_1, function()
		local var_42_0 = arg_39_1:Find("bg"):GetComponent(typeof(Image)).material
		local var_42_1 = arg_39_1:GetComponent("DftAniEvent")

		var_42_1:SetTriggerEvent(function(arg_43_0)
			local var_43_0

			local function var_43_1()
				if #arg_39_0.dormCallbackList > 0 then
					table.remove(arg_39_0.dormCallbackList, 1)(var_43_1)
				else
					GetComponent(arg_39_1, typeof(Animator)):SetBool("Finish", true)
					var_42_0:SetInt("_DissolveTexFlip", 0)
					LeanTween.value(0, 1, 0.6):setOnUpdate(System.Action_float(function(arg_45_0)
						var_42_0:SetFloat("_Dissolve", arg_45_0)
					end)):setEase(LeanTweenType.easeInOutCubic)
				end
			end

			var_43_1()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_loading_loop")
		end)
		var_42_1:SetEndEvent(function(arg_46_0)
			if #arg_39_0.dormCallbackList > 0 then
				quickPlayAnimator(arg_39_1, "anim_dorm3d_loading_in")
				arg_39_0:DoDorm3DSceneChange(arg_39_1)
			else
				PoolMgr.GetInstance():ReturnUI(var_39_0, arg_39_1.gameObject)

				arg_39_0.playing = nil

				setActive(arg_39_0._tf, false)
				pg.UIMgr.GetInstance():LoadingOff()
			end
		end)
		GetComponent(arg_39_1, typeof(Animator)):SetBool("Finish", false)
		var_42_0:SetInt("_DissolveTexFlip", 1)
		LeanTween.value(1, 0, 0.6):setOnUpdate(System.Action_float(function(arg_47_0)
			var_42_0:SetFloat("_Dissolve", arg_47_0)
		end)):setEase(LeanTweenType.easeOutCubic)
	end)
end

function var_0_0.IsPlaying(arg_48_0)
	return arg_48_0.playing
end

function var_0_0.Dispose(arg_49_0)
	setActive(arg_49_0._tf, false)

	arg_49_0.playing = nil
end
