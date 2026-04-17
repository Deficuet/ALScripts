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
		arg_11_0:StartLoading(var_11_0, var_11_2, arg_14_0)
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
		arg_11_0:EndLoading(var_11_0, var_11_2, arg_17_0)
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

function var_0_0.StartLoading(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	switch(arg_19_1, {
		Dorm3DLoading = function()
			GetComponent(arg_19_2, typeof(Animator)):SetBool("Finish", false)

			local var_20_0 = arg_19_2:Find("bg"):GetComponent(typeof(Image)).material

			var_20_0:SetInt("_DissolveTexFlip", 1)
			LeanTween.value(1, 0, 0.6):setOnUpdate(System.Action_float(function(arg_21_0)
				var_20_0:SetFloat("_Dissolve", arg_21_0)
			end)):setEase(LeanTweenType.easeOutCubic)
			arg_19_2:GetComponent("DftAniEvent"):SetTriggerEvent(arg_19_3)
			quickPlayAnimator(arg_19_2, "anim_dorm3d_loading_in")
		end,
		IslandplaneLoading = function()
			arg_19_2:GetComponent("DftAniEvent"):SetTriggerEvent(arg_19_3)
			quickPlayAnimation(arg_19_2, "anim_planeLoading_in")
			arg_19_2:Find("load"):GetComponent("SkeletonAnimation").state:SetAnimation(0, "cut_in", false)
		end,
		IslandcarLoading = function()
			arg_19_2:GetComponent("DftAniEvent"):SetTriggerEvent(arg_19_3)
			quickPlayAnimation(arg_19_2, "anim_planeLoading_in")
			arg_19_2:Find("load"):GetComponent("SkeletonAnimation").state:SetAnimation(0, "cut_in", false)
		end,
		jufengyuziyouqundao = function()
			arg_19_2 = arg_19_2:Find("scale")

			arg_19_2:GetComponent("DftAniEvent"):SetTriggerEvent(arg_19_3)
			quickPlayAnimator(arg_19_2, "jufeng")
		end,
		jufengyuziyouqundao_fullscreen = function()
			arg_19_2 = arg_19_2:Find("scale")

			arg_19_2:GetComponent("DftAniEvent"):SetTriggerEvent(arg_19_3)
			quickPlayAnimator(arg_19_2, "jufeng")
		end,
		jiarihangxianshanyaohaibin = function()
			arg_19_2 = arg_19_2:Find("scale")

			arg_19_2:GetComponent("DftAniEvent"):SetTriggerEvent(arg_19_3)
			quickPlayAnimator(arg_19_2, "manyou")
		end
	}, function()
		return
	end)
end

function var_0_0.LoopLoading(arg_28_0, arg_28_1, arg_28_2)
	switch(arg_28_1, {
		Dorm3DLoading = function()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_loading_loop")
		end,
		IslandplaneLoading = function()
			arg_28_2:Find("load"):GetComponent("SkeletonAnimation").state:SetAnimation(0, "normal", true)
		end,
		IslandcarLoading = function()
			arg_28_2:Find("load"):GetComponent("SkeletonAnimation").state:SetAnimation(0, "normal", true)
		end
	}, function()
		return
	end)
end

function var_0_0.EndLoading(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	switch(arg_33_1, {
		Dorm3DLoading = function()
			local var_34_0 = arg_33_2:Find("bg"):GetComponent(typeof(Image)).material

			var_34_0:SetInt("_DissolveTexFlip", 0)
			LeanTween.value(0, 1, 0.6):setOnUpdate(System.Action_float(function(arg_35_0)
				var_34_0:SetFloat("_Dissolve", arg_35_0)
			end)):setEase(LeanTweenType.easeInOutCubic)
			arg_33_2:GetComponent("DftAniEvent"):SetEndEvent(arg_33_3)
			GetComponent(arg_33_2, typeof(Animator)):SetBool("Finish", true)
		end,
		IslandplaneLoading = function()
			arg_33_2:GetComponent("DftAniEvent"):SetEndEvent(arg_33_3)
			quickPlayAnimation(arg_33_2, "anim_planeLoading_out")
		end,
		IslandcarLoading = function()
			arg_33_2:GetComponent("DftAniEvent"):SetEndEvent(arg_33_3)
			quickPlayAnimation(arg_33_2, "anim_planeLoading_out")
		end,
		jufengyuziyouqundao = function()
			arg_33_3()
		end,
		jufengyuziyouqundao_fullscreen = function()
			arg_33_3()
		end,
		jiarihangxianshanyaohaibin = function()
			arg_33_3()
		end
	}, function()
		return
	end)
end

function var_0_0.RegisterDormNextCall(arg_42_0, arg_42_1)
	function arg_42_0.dormNextCall()
		arg_42_0.dormNextCall = nil

		return arg_42_1()
	end
end

function var_0_0.Dorm3DSceneChange(arg_44_0, arg_44_1)
	table.insert(arg_44_0.dormCallbackList, arg_44_1)

	if not arg_44_0.playing then
		pg.UIMgr.GetInstance():LoadingOn(false)
		arg_44_0:DoDorm3DSceneChange()
	end

	existCall(arg_44_0.dormNextCall)
end

function var_0_0.DoDorm3DSceneChange(arg_45_0, arg_45_1)
	arg_45_0.playing = true

	setActive(arg_45_0._tf, true)

	local var_45_0 = "Dorm3DLoading"
	local var_45_1 = {}

	if not arg_45_1 then
		table.insert(var_45_1, function(arg_46_0)
			PoolMgr.GetInstance():GetUI(var_45_0, true, function(arg_47_0)
				arg_45_1 = arg_47_0.transform

				setParent(arg_45_1, arg_45_0.container, false)
				arg_46_0()
			end)
		end)
	end

	seriesAsync(var_45_1, function()
		local var_48_0 = arg_45_1:Find("bg"):GetComponent(typeof(Image)).material
		local var_48_1 = arg_45_1:GetComponent("DftAniEvent")

		var_48_1:SetTriggerEvent(function(arg_49_0)
			local var_49_0

			local function var_49_1()
				if #arg_45_0.dormCallbackList > 0 then
					table.remove(arg_45_0.dormCallbackList, 1)(var_49_1)
				else
					GetComponent(arg_45_1, typeof(Animator)):SetBool("Finish", true)
					var_48_0:SetInt("_DissolveTexFlip", 0)
					LeanTween.value(0, 1, 0.6):setOnUpdate(System.Action_float(function(arg_51_0)
						var_48_0:SetFloat("_Dissolve", arg_51_0)
					end)):setEase(LeanTweenType.easeInOutCubic)
				end
			end

			var_49_1()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_loading_loop")
		end)
		var_48_1:SetEndEvent(function(arg_52_0)
			if #arg_45_0.dormCallbackList > 0 then
				quickPlayAnimator(arg_45_1, "anim_dorm3d_loading_in")
				arg_45_0:DoDorm3DSceneChange(arg_45_1)
			else
				PoolMgr.GetInstance():ReturnUI(var_45_0, arg_45_1.gameObject)

				arg_45_0.playing = nil

				setActive(arg_45_0._tf, false)
				pg.UIMgr.GetInstance():LoadingOff()
			end
		end)
		GetComponent(arg_45_1, typeof(Animator)):SetBool("Finish", false)
		var_48_0:SetInt("_DissolveTexFlip", 1)
		LeanTween.value(1, 0, 0.6):setOnUpdate(System.Action_float(function(arg_53_0)
			var_48_0:SetFloat("_Dissolve", arg_53_0)
		end)):setEase(LeanTweenType.easeOutCubic)
	end)
end

function var_0_0.IsPlaying(arg_54_0)
	return arg_54_0.playing
end

function var_0_0.Dispose(arg_55_0)
	setActive(arg_55_0._tf, false)

	arg_55_0.playing = nil
end
