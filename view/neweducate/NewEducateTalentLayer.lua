local var_0_0 = class("NewEducateTalentLayer", import("view.newEducate.base.NewEducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateTalentUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.animCom = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.animEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))

	arg_2_0.animEvent:SetTriggerEvent(function()
		arg_2_0.animEvent:SetEndEvent(nil)
		arg_2_0:RefreshView()
	end)

	arg_2_0.rootTF = arg_2_0._tf:Find("root")
	arg_2_0.bgTF = arg_2_0.rootTF:Find("bg")

	local var_2_0 = arg_2_0.rootTF:Find("window/content")

	arg_2_0.uiList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	arg_2_0.uiList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_4_2.name = arg_4_1 + 1

			local var_4_0 = arg_2_0.talentList[arg_4_1 + 1]

			arg_2_0:UpdateItem(var_4_0, arg_4_2)
		end
	end)
end

function var_0_0.didEnter(arg_5_0)
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_5_0._tf, {
		pbList = {
			arg_5_0.bgTF
		},
		groupName = LayerWeightConst.GROUP_EDUCATE,
		weight = arg_5_0:getWeightFromData() + 1
	})
	NewEducateGuideSequence.CheckGuide(arg_5_0.__cname)
end

function var_0_0.GetRarityBg(arg_6_0, arg_6_1)
	return switch(arg_6_1, {
		[NewEducateBuff.RARITY.BLUE] = function()
			return "bg_blue"
		end,
		[NewEducateBuff.RARITY.PURPLE] = function()
			return "bg_purple"
		end,
		[NewEducateBuff.RARITY.GOLD] = function()
			return "bg_gold"
		end,
		[NewEducateBuff.RARITY.COLOURS] = function()
			return "bg_colours"
		end
	})
end

function var_0_0.UpdateItem(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = pg.child2_benefit_list[arg_11_1]

	setText(arg_11_2:Find("name/Text"), var_11_0.name)
	setText(arg_11_2:Find("desc/Text"), var_11_0.desc)
	LoadImageSpriteAtlasAsync("ui/neweducatetalentui_atlas", arg_11_0:GetRarityBg(var_11_0.rare), arg_11_2, true)
	LoadImageSpriteAsync("neweducateicon/" .. var_11_0.item_icon, arg_11_2:Find("icon"), true)

	local var_11_1 = not table.contains(arg_11_0.reTalentList, arg_11_1)

	setGray(arg_11_2:Find("refresh_btn"), not var_11_1)
	onButton(arg_11_0, arg_11_2:Find("refresh_btn"), function()
		if arg_11_0.isPlaying then
			return
		end

		if not var_11_1 then
			return
		end

		arg_11_0:emit(NewEducateTalentMediator.ON_REFRESH_TALENT, arg_11_1, tonumber(arg_11_2.name))
	end, SFX_PANEL)
	setText(arg_11_2:Find("refresh_btn/Text"), var_11_1 and 1 or 0)
	onButton(arg_11_0, arg_11_2, function()
		if arg_11_0.isPlaying then
			return
		end

		arg_11_0:emit(NewEducateTalentMediator.ON_SELECT_TALENT, arg_11_1, tonumber(arg_11_2.name))
	end, SFX_PANEL)
end

function var_0_0.RefreshView(arg_14_0)
	local var_14_0 = arg_14_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.TALENT)

	arg_14_0.talentList = var_14_0:GetTalents()
	arg_14_0.reTalentList = var_14_0:GetReTalents()

	arg_14_0.uiList:align(#arg_14_0.talentList)
end

function var_0_0.OnRefreshTalent(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.TALENT)

	arg_15_0.talentList = var_15_0:GetTalents()
	arg_15_0.reTalentList = var_15_0:GetReTalents()

	eachChild(arg_15_0.uiList.container, function(arg_16_0)
		if tonumber(arg_16_0.name) == arg_15_1 then
			local var_16_0 = arg_16_0:GetComponent(typeof(DftAniEvent))

			var_16_0:SetTriggerEvent(function()
				var_16_0:SetEndEvent(nil)

				arg_15_0.isPlaying = false

				arg_15_0:UpdateItem(arg_15_2, arg_16_0)
			end)
			arg_16_0:GetComponent(typeof(Animation)):Play("Anim_educate_talent_tpl_change")

			arg_15_0.isPlaying = true
		end
	end)
end

function var_0_0.OnSelectedDone(arg_18_0, arg_18_1)
	arg_18_0.animEvent:SetEndEvent(function()
		arg_18_0.animEvent:SetEndEvent(nil)

		arg_18_0.isPlaying = false

		arg_18_0:closeView()
	end)
	arg_18_0.animCom:Play("Anim_educate_talent_select")

	arg_18_0.isPlaying = true

	eachChild(arg_18_0.uiList.container, function(arg_20_0)
		if tonumber(arg_20_0.name) ~= arg_18_1 then
			arg_20_0:GetComponent(typeof(Animation)):Play("Anim_educate_talent_tpl_out")
		end
	end)
end

function var_0_0.onBackPressed(arg_21_0)
	return
end

function var_0_0.willExit(arg_22_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_22_0._tf)
	existCall(arg_22_0.contextData.onExit)
end

return var_0_0
