local var_0_0 = class("NewGuildScene", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewGuildUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"commonbg/camp_bg",
		"clutter/blhx_icon",
		"clutter/cszz_icon"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.ResUISettings(arg_3_0)
	return true
end

function var_0_0.setPlayer(arg_4_0, arg_4_1)
	arg_4_0.playerVO = arg_4_1
end

function var_0_0.init(arg_5_0)
	arg_5_0.createPanel = arg_5_0._tf:Find("create_panel")
	arg_5_0.factionPanel = arg_5_0._tf:Find("faction_panel")
	arg_5_0.createBtn = arg_5_0._tf:Find("create_panel/frame/create_btn")
	arg_5_0.joinBtn = arg_5_0._tf:Find("create_panel/frame/join_btn")
	arg_5_0.topPanel = arg_5_0._tf:Find("blur_panel/adapt/top")
	arg_5_0.publicGuildBtn = arg_5_0._tf:Find("create_panel/frame/public_btn")
	arg_5_0.backBtn = arg_5_0.topPanel:Find("back")

	setActive(arg_5_0.factionPanel, false)

	arg_5_0.mask = arg_5_0._tf:Find("mask")

	SetActive(arg_5_0.mask, false)

	arg_5_0.mainRedPage = NewGuildMainRedPage.New(arg_5_0._tf, arg_5_0.event)
	arg_5_0.mainBluePage = NewGuildMainBluePage.New(arg_5_0._tf, arg_5_0.event)
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:startCreate()
	onButton(arg_6_0, arg_6_0.createBtn, function()
		arg_6_0:createGuild()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.joinBtn, function()
		arg_6_0:emit(NewGuildMediator.OPEN_GUILD_LIST)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.createPanel, function()
		arg_6_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)
	onButton(arg_6_0, arg_6_0.publicGuildBtn, function()
		arg_6_0:emit(NewGuildMediator.OPEN_PUBLIC_GUILD)
	end, SOUND_BACK)
	onButton(arg_6_0, arg_6_0.backBtn, function()
		if go(arg_6_0.createPanel).activeSelf then
			arg_6_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
end

function var_0_0.startCreate(arg_12_0)
	setActive(arg_12_0.createPanel, true)
end

function var_0_0.createGuild(arg_13_0)
	setActive(arg_13_0.createPanel, false)
	setActive(arg_13_0.factionPanel, false)

	arg_13_0.createProcess = coroutine.wrap(function()
		setActive(arg_13_0.createPanel, false)

		local var_14_0 = Guild.New({})

		arg_13_0:selectFaction(var_14_0, arg_13_0.createProcess)
		coroutine.yield()
		arg_13_0:setDescInfo(var_14_0)
	end)

	arg_13_0.createProcess()
end

function var_0_0.selectFaction(arg_15_0, arg_15_1, arg_15_2)
	local function var_15_0(arg_16_0, arg_16_1)
		arg_15_0.isPlaying = true

		local var_16_0 = arg_16_0:Find("bg")

		setActive(var_16_0, true)

		local var_16_1 = var_16_0:GetComponent("CanvasGroup")

		LeanTween.value(go(var_16_0), 1, 3, 0.5):setOnUpdate(System.Action_float(function(arg_17_0)
			var_16_0.localScale = Vector3(arg_17_0, arg_17_0, 1)
			var_16_1.alpha = 1 - arg_17_0 / 3
		end)):setOnComplete(System.Action(function()
			setActive(var_16_0, false)

			var_16_0.localScale = Vector3(1, 1, 1)
			arg_15_0.isPlaying = false

			arg_16_1()
		end))
	end

	setActive(arg_15_0.factionPanel, true)

	local var_15_1 = arg_15_0.factionPanel:Find("panel")
	local var_15_2 = var_15_1:Find("blhx")
	local var_15_3 = var_15_1:Find("cszz")
	local var_15_4 = var_15_1:Find("bg")

	if not arg_15_0.isInitFaction then
		setImageSprite(var_15_4, GetSpriteFromAtlas("commonbg/camp_bg", ""))
		setImageSprite(var_15_2:Find("bg"), GetSpriteFromAtlas("clutter/blhx_icon", ""))
		setImageSprite(var_15_3:Find("bg"), GetSpriteFromAtlas("clutter/cszz_icon", ""))
		setActive(var_15_2:Find("bg"), false)
		setActive(var_15_3:Find("bg"), false)

		arg_15_0.isInitFaction = true
	end

	onButton(arg_15_0, var_15_2, function()
		if arg_15_0.isPlaying then
			return
		end

		arg_15_1:setFaction(GuildConst.FACTION_TYPE_BLHX)

		if arg_15_2 then
			arg_15_2()
		else
			return
		end

		var_15_0(var_15_2, function()
			arg_15_2 = nil
		end)
	end, SFX_PANEL)
	onButton(arg_15_0, var_15_3, function()
		if arg_15_0.isPlaying then
			return
		end

		arg_15_1:setFaction(GuildConst.FACTION_TYPE_CSZZ)

		if arg_15_2 then
			arg_15_2()
		else
			return
		end

		var_15_0(var_15_3, function()
			arg_15_2 = nil
		end)
	end)
	onButton(arg_15_0, arg_15_0.backBtn, function()
		if arg_15_0.isPlaying then
			return
		end

		arg_15_0.createProcess = nil

		setActive(arg_15_0.createPanel, true)
		setActive(arg_15_0.factionPanel, false)
		onButton(arg_15_0, arg_15_0.backBtn, function()
			arg_15_0:emit(var_0_0.ON_BACK)
		end, SFX_CANCEL)
	end, SFX_CANCEL)
	setActive(arg_15_0.topPanel, true)
end

function var_0_0.setDescInfo(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1:getFaction()

	if var_25_0 == GuildConst.FACTION_TYPE_BLHX then
		arg_25_0.mainPage = arg_25_0.mainBluePage
	elseif var_25_0 == GuildConst.FACTION_TYPE_CSZZ then
		arg_25_0.mainPage = arg_25_0.mainRedPage
	end

	local function var_25_1()
		if not arg_25_0.mainPage:GetLoaded() or arg_25_0.mainPage:IsPlaying() then
			return
		end

		arg_25_0.createProcess = nil

		arg_25_0:createGuild()
		arg_25_0.mainPage:Hide()
	end

	arg_25_0.mainPage:ExecuteAction("Show", arg_25_1, arg_25_0.playerVO, function()
		setActive(arg_25_0.factionPanel, false)
	end, var_25_1)
	onButton(arg_25_0, arg_25_0.backBtn, var_25_1, SFX_CANCEL)
end

function var_0_0.ClosePage(arg_28_0)
	if arg_28_0.page and arg_28_0.page:GetLoaded() and arg_28_0.page:isShowing() then
		arg_28_0.page:Hide()
	end
end

function var_0_0.onBackPressed(arg_29_0)
	if arg_29_0.createProcess ~= nil then
		triggerButton(arg_29_0.backBtn)
	else
		triggerButton(arg_29_0.createPanel)
	end
end

function var_0_0.willExit(arg_30_0)
	arg_30_0.mainRedPage:Destroy()
	arg_30_0.mainBluePage:Destroy()
end

return var_0_0
