local var_0_0 = class("GuildTechnologyPage", import("...base.GuildBasePage"))

var_0_0.PAGE_DEV = 1
var_0_0.PAGE_UPGRADE = 2
var_0_0.PAGE_DEV_ITEM = 3

function var_0_0.getTargetUI(arg_1_0)
	return "TechnologyBluePage", "TechnologyRedPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.frame = arg_2_0:findTF("frame")
	arg_2_0.toggle = arg_2_0:findTF("frame/toggle")
	arg_2_0.upgradeList = UIItemList.New(arg_2_0:findTF("frame/upgrade/content"), arg_2_0:findTF("frame/upgrade/content/tpl"))
	arg_2_0.breakOutList = UIItemList.New(arg_2_0:findTF("frame/breakout/content"), arg_2_0:findTF("frame/upgrade/content/tpl"))
	arg_2_0.breakoutListPanel = arg_2_0:findTF("frame/breakout")
	arg_2_0.upgradePanel = arg_2_0:findTF("frame/upgrade")
	arg_2_0.inDevelopmentPanel = arg_2_0:findTF("frame/dev")
	arg_2_0.inDevelopmentIcon = arg_2_0:findTF("item/icon", arg_2_0.inDevelopmentPanel):GetComponent(typeof(Image))
	arg_2_0.inDevelopmentName = arg_2_0:findTF("item/name", arg_2_0.inDevelopmentPanel):GetComponent(typeof(Text))
	arg_2_0.inDevelopmentLevel1Txt = arg_2_0:findTF("level1/Text", arg_2_0.inDevelopmentPanel):GetComponent(typeof(Text))
	arg_2_0.inDevelopmentLevel2Txt = arg_2_0:findTF("level2/Text", arg_2_0.inDevelopmentPanel):GetComponent(typeof(Text))
	arg_2_0.inDevelopmentLevel1Desc = arg_2_0:findTF("level1/level/Text", arg_2_0.inDevelopmentPanel):GetComponent(typeof(Text))
	arg_2_0.inDevelopmentLevel2Desc = arg_2_0:findTF("level2/level/Text", arg_2_0.inDevelopmentPanel):GetComponent(typeof(Text))
	arg_2_0.inDevelopmentProgress = arg_2_0:findTF("progress/bar", arg_2_0.inDevelopmentPanel)
	arg_2_0.inDevelopmentProgressTxt = arg_2_0:findTF("progress/Text", arg_2_0.inDevelopmentPanel):GetComponent(typeof(Text))
	arg_2_0.donateBtn = arg_2_0:findTF("skin_btn", arg_2_0.inDevelopmentPanel)
	arg_2_0.cancelBtn = arg_2_0:findTF("cancel_btn", arg_2_0.inDevelopmentPanel)

	setText(arg_2_0:findTF("level1/level/label", arg_2_0.inDevelopmentPanel), i18n("guild_tech_label_max_level"))
	setText(arg_2_0:findTF("level2/level/label", arg_2_0.inDevelopmentPanel), i18n("guild_tech_label_max_level"))
	setText(arg_2_0:findTF("progress/title/Text", arg_2_0.inDevelopmentPanel), i18n("guild_tech_label_dev_progress"))
	setText(arg_2_0:findTF("progress/title/label", arg_2_0.inDevelopmentPanel), i18n("guild_tech_label_condition"))
end

function var_0_0.OnInit(arg_3_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_3_0.frame, {
		pbList = {
			arg_3_0.frame
		}
	})
	setActive(arg_3_0._tf, true)
	onToggle(arg_3_0, arg_3_0.toggle, function(arg_4_0)
		if arg_4_0 then
			arg_3_0:UpdateBreakOutList()
		else
			arg_3_0:UpdateUpgradeList()
		end

		setActive(arg_3_0.toggle:Find("on"), arg_4_0)
		setActive(arg_3_0.toggle:Find("off"), not arg_4_0)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.donateBtn, function()
		arg_3_0:emit(GuildTechnologyMediator.ON_OPEN_OFFICE)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.cancelBtn, function()
		arg_3_0:Switch2BreakOutList()
	end, SFX_PANEL)
end

function var_0_0.SetUp(arg_7_0, arg_7_1)
	arg_7_0:Update(arg_7_1)
	triggerToggle(arg_7_0.toggle, false)
end

function var_0_0.Update(arg_8_0, arg_8_1)
	arg_8_0.guildVO = arg_8_1
	arg_8_0.technologyVOs = arg_8_0.guildVO:getTechnologys()
	arg_8_0.technologyGroupVOs = arg_8_0.guildVO:getTechnologyGroups()
	arg_8_0.activityGroup = _.detect(arg_8_0.technologyGroupVOs, function(arg_9_0)
		return arg_9_0:GetState() == GuildTechnologyGroup.STATE_START
	end)
	arg_8_0.isAdmin = GuildMember.IsAdministrator(arg_8_1:getSelfDuty())
end

function var_0_0.Flush(arg_10_0)
	if var_0_0.PAGE_DEV == arg_10_0.page then
		arg_10_0:InitBreakOutList()
	elseif var_0_0.PAGE_UPGRADE == arg_10_0.page then
		arg_10_0:UpdateUpgradeList()
	elseif var_0_0.PAGE_DEV_ITEM == arg_10_0.page then
		arg_10_0:InitDevingItem()
	end
end

function var_0_0.UpdateUpgradeList(arg_11_0)
	table.sort(arg_11_0.technologyVOs, function(arg_12_0, arg_12_1)
		return arg_12_0.id < arg_12_1.id
	end)
	arg_11_0.upgradeList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = arg_11_0.technologyVOs[arg_13_1 + 1]

			GuildTechnologyCard.New(arg_13_2:Find("content"), arg_11_0):Update(var_13_0, arg_11_0.activityGroup)
			setActive(arg_13_2:Find("back"), false)
		end
	end)
	arg_11_0.upgradeList:align(#arg_11_0.technologyVOs)
	setActive(arg_11_0.upgradePanel, true)
	setActive(arg_11_0.inDevelopmentPanel, false)
	setActive(arg_11_0.breakoutListPanel, false)

	arg_11_0.page = var_0_0.PAGE_UPGRADE
end

function var_0_0.UpdateBreakOutList(arg_14_0)
	if arg_14_0.activityGroup then
		arg_14_0:InitDevingItem()
	else
		arg_14_0:InitBreakOutList()
	end

	setActive(arg_14_0.upgradePanel, false)
	setActive(arg_14_0.inDevelopmentPanel, arg_14_0.activityGroup)
	setActive(arg_14_0.breakoutListPanel, not arg_14_0.activityGroup)
end

function var_0_0.Switch2BreakOutList(arg_15_0)
	setActive(arg_15_0.upgradePanel, false)
	setActive(arg_15_0.inDevelopmentPanel, false)
	setActive(arg_15_0.breakoutListPanel, true)
	arg_15_0:InitBreakOutList(true)
end

function var_0_0.InitBreakOutList(arg_16_0, arg_16_1)
	table.sort(arg_16_0.technologyGroupVOs, function(arg_17_0, arg_17_1)
		return arg_17_0.pid < arg_17_1.pid
	end)
	arg_16_0.breakOutList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			local var_18_0 = arg_16_0.technologyGroupVOs[arg_18_1 + 1]
			local var_18_1 = GuildTechnologyGroupCard.New(arg_18_2:Find("content"), arg_16_0)

			var_18_1:Update(var_18_0, arg_16_0.activityGroup, arg_16_0.isAdmin)

			local var_18_2 = arg_16_1 and arg_16_0.activityGroup and arg_16_0.activityGroup.id == var_18_0.id

			setActive(var_18_1._tf, not var_18_2)
			setActive(arg_18_2:Find("back"), var_18_2)

			if var_18_2 then
				onButton(arg_16_0, arg_18_2:Find("back"), function()
					arg_16_0:UpdateBreakOutList()
				end, SFX_PANEL)
				arg_18_2:SetAsFirstSibling()
			end
		end
	end)
	arg_16_0.breakOutList:align(#arg_16_0.technologyGroupVOs)

	arg_16_0.page = var_0_0.PAGE_DEV
end

function var_0_0.InitDevingItem(arg_20_0)
	local var_20_0 = arg_20_0.activityGroup
	local var_20_1 = var_20_0.id

	arg_20_0.inDevelopmentIcon.sprite = GetSpriteFromAtlas("GuildTechnology", var_20_1)
	arg_20_0.inDevelopmentName.text = var_20_0:getConfig("name")

	local var_20_2 = var_20_0:bindConfigTable()
	local var_20_3 = var_20_2[var_20_0.pid].next_tech
	local var_20_4
	local var_20_5
	local var_20_6
	local var_20_7
	local var_20_8
	local var_20_9

	if var_20_3 ~= 0 then
		var_20_4 = var_20_0:GetLevel()

		local var_20_10 = var_20_2[var_20_3]

		var_20_5 = var_20_10.level
		var_20_6 = GuildConst.GET_TECHNOLOGY_DESC(var_20_0:getConfig("effect_args"), var_20_0:getConfig("num"))
		var_20_7 = GuildConst.GET_TECHNOLOGY_DESC(var_20_10.effect_args, var_20_10.num)
		var_20_8 = var_20_0:GetProgress()
		var_20_9 = var_20_0:GetTargetProgress()
	else
		var_20_4 = var_20_0:GetLevel()
		var_20_5 = "MAX"
		var_20_6 = GuildConst.GET_TECHNOLOGY_DESC(var_20_0:getConfig("effect_args"), var_20_0:getConfig("num"))
		var_20_7 = ""
		var_20_8 = 1
		var_20_9 = 1
	end

	arg_20_0.inDevelopmentLevel1Txt.text = var_20_6
	arg_20_0.inDevelopmentLevel1Desc.text = "Lv" .. var_20_4
	arg_20_0.inDevelopmentLevel2Desc.text = "Lv" .. var_20_5
	arg_20_0.inDevelopmentLevel2Txt.text = var_20_7

	setFillAmount(arg_20_0.inDevelopmentProgress, var_20_8 / var_20_9)

	arg_20_0.inDevelopmentProgressTxt.text = var_20_8 .. "/" .. var_20_9
	arg_20_0.page = var_0_0.PAGE_DEV_ITEM
end

function var_0_0.OnDestroy(arg_21_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_21_0.frame, arg_21_0._tf)
end

return var_0_0
