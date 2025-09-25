local var_0_0 = class("EducateArchivePanel", import("...base.BaseSubView"))
local var_0_1 = 0.005

function var_0_0.getUIName(arg_1_0)
	return "EducateArchivePanel"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.config = pg.child_attr
	arg_2_0.foldPanelTF = arg_2_0:findTF("fold_panel")
	arg_2_0.showBtn = arg_2_0:findTF("show_btn", arg_2_0.foldPanelTF)
	arg_2_0.showPanelTF = arg_2_0:findTF("show_panel")
	arg_2_0.showAnim = arg_2_0.showPanelTF:GetComponent(typeof(Animation))
	arg_2_0.showAnimEvent = arg_2_0.showPanelTF:GetComponent(typeof(DftAniEvent))

	arg_2_0.showAnimEvent:SetEndEvent(function()
		setActive(arg_2_0.showPanelTF, false)
	end)

	arg_2_0.blurBg = arg_2_0:findTF("panel", arg_2_0.showPanelTF)
	arg_2_0.foldBtn = arg_2_0:findTF("fold_btn", arg_2_0.showPanelTF)
	arg_2_0.pageSnap = arg_2_0:findTF("panel/event", arg_2_0.showPanelTF):GetComponent("HScrollSnap")

	arg_2_0.pageSnap:Init()

	arg_2_0.page1 = arg_2_0:findTF("panel/event/content/page1", arg_2_0.showPanelTF)

	setText(arg_2_0:findTF("title/name_title/name", arg_2_0.page1), i18n("child_archive_name"))
	setText(arg_2_0:findTF("attr_title/Text", arg_2_0.page1), i18n("child_attr_name1"))
	setText(arg_2_0:findTF("buff_title/Text", arg_2_0.page1), i18n("child_buff_name"))

	arg_2_0.avatarImageTF = arg_2_0:findTF("title/avatar", arg_2_0.page1)
	arg_2_0.attrsList1 = UIItemList.New(arg_2_0:findTF("attrs/content", arg_2_0.page1), arg_2_0:findTF("attrs/tpl", arg_2_0.page1))
	arg_2_0.gradientBgTF = arg_2_0:findTF("attrs/bg_gradient", arg_2_0.page1)
	arg_2_0.buffContentTF = arg_2_0:findTF("buff/content", arg_2_0.page1)
	arg_2_0.buffItemList = UIItemList.New(arg_2_0:findTF("buff/content/content", arg_2_0.page1), arg_2_0:findTF("buff/tpl", arg_2_0.page1))
	arg_2_0.buffLockTF = arg_2_0:findTF("buff/lock", arg_2_0.page1)
	arg_2_0.page2 = arg_2_0:findTF("panel/event/content/page2", arg_2_0.showPanelTF)

	setText(arg_2_0:findTF("attr_title/Text", arg_2_0.page2), i18n("child_attr_name2"))

	arg_2_0.attr3UnlockTF = arg_2_0:findTF("attrs/unlock", arg_2_0.page2)
	arg_2_0.attr3LockTF = arg_2_0:findTF("attrs/lock", arg_2_0.page2)
	arg_2_0.attrsList2 = UIItemList.New(arg_2_0:findTF("content", arg_2_0.attr3UnlockTF), arg_2_0:findTF("tpl", arg_2_0.attr3UnlockTF))
	arg_2_0.attr2UnlockTF = arg_2_0:findTF("nature/unlock", arg_2_0.page2)
	arg_2_0.attr2LockTF = arg_2_0:findTF("nature/lock", arg_2_0.page2)
	arg_2_0.natureContent = arg_2_0:findTF("content", arg_2_0.attr2UnlockTF)
	arg_2_0.avatarTF = arg_2_0:findTF("avatar", arg_2_0.page2)

	arg_2_0:addListener()
	arg_2_0:initAttrsPanel()
	arg_2_0:OverlayPanel(arg_2_0._tf, {
		groupDelta = -1,
		pbList = {
			arg_2_0.blurBg
		}
	})
	setActive(arg_2_0.foldPanelTF, true)
	setActive(arg_2_0.showPanelTF, false)

	if arg_2_0.contextData and arg_2_0.contextData.isShow then
		if arg_2_0.contextData.isMainEnter then
			onDelayTick(function()
				arg_2_0:showPanel()
			end, 0.396)
		else
			arg_2_0:showPanel()
		end
	end
end

function var_0_0.addListener(arg_5_0)
	onButton(arg_5_0, arg_5_0.showBtn, function()
		arg_5_0:showPanel()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.foldBtn, function()
		arg_5_0:hidePanel()
	end, SFX_PANEL)
end

function var_0_0.showPanel(arg_8_0)
	setActive(arg_8_0.foldPanelTF, false)
	setActive(arg_8_0.showPanelTF, true)
end

function var_0_0.hidePanel(arg_9_0)
	setActive(arg_9_0.foldPanelTF, true)
	arg_9_0.showAnim:Play("anim_educate_archive_show_out")
end

function var_0_0.initAttrsPanel(arg_10_0)
	arg_10_0.attrsList1:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			arg_10_0:updateAttr1Item(arg_11_1, arg_11_2)
		end
	end)
	arg_10_0.buffItemList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			arg_10_0:updateBuffItem(arg_12_1, arg_12_2)
		end
	end)
	arg_10_0.attrsList2:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			arg_10_0:updateAttr2Item(arg_13_1, arg_13_2)
		end
	end)
	arg_10_0:Flush()
end

function var_0_0.updateAttr1Item(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.char:GetAttrGroupByType(EducateChar.ATTR_TYPE_MAJOR)[arg_14_1 + 1][1]
	local var_14_1 = arg_14_0.config[var_14_0]

	GetImageSpriteFromAtlasAsync("ui/educatecommonui_atlas", "attr_" .. var_14_0, arg_14_0:findTF("icon_bg/icon", arg_14_2), true)
	setScrollText(arg_14_0:findTF("name_mask/name", arg_14_2), var_14_1.name)

	local var_14_2, var_14_3 = arg_14_0.char:GetAttrInfo(var_14_0)

	setText(arg_14_0:findTF("grade/Text", arg_14_2), var_14_2)
	setText(arg_14_0:findTF("value", arg_14_2), var_14_3)

	local var_14_4 = EducateConst.GRADE_2_COLOR[var_14_2][1]
	local var_14_5 = EducateConst.GRADE_2_COLOR[var_14_2][2]
	local var_14_6 = arg_14_0.gradientBgTF:GetChild(arg_14_1)

	setImageColor(var_14_6, Color.NewHex(var_14_4))
	setImageColor(arg_14_0:findTF("grade", arg_14_2), Color.NewHex(var_14_5))
end

function var_0_0.updateBuffItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.buffList[arg_15_1 + 1]

	LoadImageSpriteAsync("educateprops/" .. var_15_0:getConfig("icon"), arg_15_0:findTF("icon", arg_15_2))
	setText(arg_15_0:findTF("time/Text", arg_15_2), var_15_0:GetReaminWeek() .. i18n("word_week"))
	onButton(arg_15_0, arg_15_2, function()
		arg_15_0:showBuffBox(var_15_0.id)
	end, SFX_PANEL)
end

function var_0_0.showBuffBox(arg_17_0, arg_17_1)
	arg_17_0:emit(EducateBaseUI.EDUCATE_ON_ITEM, {
		drop = {
			number = 1,
			type = EducateConst.DROP_TYPE_BUFF,
			id = arg_17_1
		}
	})
end

function var_0_0.updateAttr2Item(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.char:GetAttrGroupByType(EducateChar.ATTR_TYPE_MINOR)[arg_18_1 + 1][1]
	local var_18_1 = arg_18_0.config[var_18_0]

	GetImageSpriteFromAtlasAsync("ui/educatecommonui_atlas", "attr_" .. var_18_0, arg_18_0:findTF("icon", arg_18_2), true)
	setText(arg_18_0:findTF("name", arg_18_2), var_18_1.name)
	setText(arg_18_0:findTF("value", arg_18_2), arg_18_0.char:GetAttrById(var_18_0))
end

function var_0_0.updateNature(arg_19_0)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0.char:GetAttrGroupByType(EducateChar.ATTR_TYPE_PERSONALITY)) do
		local var_19_0 = arg_19_0.natureContent:GetChild(iter_19_0 - 1)

		var_19_0.name = iter_19_1[1]

		setScrollText(arg_19_0:findTF("Text", var_19_0), arg_19_0.config[iter_19_1[1]].name .. " " .. iter_19_1[2])
	end
end

function var_0_0.Flush(arg_20_0)
	if not arg_20_0:GetLoaded() then
		return
	end

	arg_20_0.educateProxy = getProxy(EducateProxy)
	arg_20_0.char = arg_20_0.educateProxy:GetCharData()

	arg_20_0.attrsList1:align(#arg_20_0.char:GetAttrGroupByType(EducateChar.ATTR_TYPE_MAJOR))

	arg_20_0.buffList = arg_20_0.educateProxy:GetBuffList()

	arg_20_0.buffItemList:align(#arg_20_0.buffList)
	arg_20_0.attrsList2:align(#arg_20_0.char:GetAttrGroupByType(EducateChar.ATTR_TYPE_MINOR))

	local var_20_0 = arg_20_0.char:GetPaintingName()

	setImageSprite(arg_20_0.avatarImageTF, LoadSprite("educateavatar/" .. var_20_0), true)
	arg_20_0:updateNature()
	setImageSprite(arg_20_0:findTF("mask/Image", arg_20_0.avatarTF), LoadSprite("squareicon/" .. var_20_0), true)
	setText(arg_20_0:findTF("title/name/Text", arg_20_0.page1), arg_20_0.char:GetName())

	local var_20_1 = EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_BUFF)

	setActive(arg_20_0.buffContentTF, var_20_1)
	setActive(arg_20_0.buffLockTF, not var_20_1)

	local var_20_2 = EducateHelper.IsShowNature()

	setActive(arg_20_0.attr2UnlockTF, var_20_2)
	setActive(arg_20_0.attr2LockTF, not var_20_2)

	local var_20_3 = EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_ATTR_3)

	setActive(arg_20_0.attr3UnlockTF, var_20_3)
	setActive(arg_20_0.attr3LockTF, not var_20_3)

	local var_20_4 = var_20_3

	setActive(arg_20_0:findTF("pagination", arg_20_0.showPanelTF), var_20_4)
	setActive(arg_20_0.page2, var_20_4)

	arg_20_0.pageSnap.enabled = var_20_4
end

function var_0_0.OnDestroy(arg_21_0)
	arg_21_0:UnOverlayPanel(arg_21_0._tf)
end

return var_0_0
