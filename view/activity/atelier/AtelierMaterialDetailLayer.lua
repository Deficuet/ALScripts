local var_0_0 = class("AtelierMaterialDetailLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AtelierMaterialDetailUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.layerItemDetail = arg_2_0._tf
	arg_2_0.loader = AutoLoader.New()
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.layerItemDetail:Find("BG"), function()
		arg_3_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.layerItemDetail:Find("Window/Close"), function()
		arg_3_0:closeView()
	end, SFX_CANCEL)
	arg_3_0:UpdateItemDetail()
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0.layerItemDetail, nil, {
		weight = LayerWeightConst.SECOND_LAYER
	})
end

function var_0_0.UpdateItemDetail(arg_6_0)
	local var_6_0 = arg_6_0.contextData.material

	arg_6_0:UpdateRyzaItem(arg_6_0.layerItemDetail:Find("Window/IconBG"), var_6_0)
	setText(arg_6_0.layerItemDetail:Find("Window/Name"), var_6_0:GetName())
	setText(arg_6_0.layerItemDetail:Find("Window/Description/Text"), var_6_0:GetDesc())

	local var_6_1 = var_6_0:GetSource()

	setText(arg_6_0.layerItemDetail:Find("Window/Source"), var_6_1[1])
	onButton(arg_6_0, arg_6_0.layerItemDetail:Find("Window/Go"), function()
		if var_6_1.chapterid then
			local var_7_0 = getProxy(ChapterProxy):getChapterById(var_6_1.chapterid)
			local var_7_1 = getProxy(ChapterProxy):getMapById(var_7_0:getConfig("map"))
			local var_7_2 = getProxy(ActivityProxy):getActivityByType(var_7_1:getConfig("on_activity"))

			if not var_7_2 or var_7_2:isEnd() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			local var_7_3, var_7_4 = var_7_1:isUnlock()

			if not var_7_3 then
				pg.TipsMgr.GetInstance():ShowTips(var_7_4)

				return
			end

			if not var_7_0:isUnlock() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_chapter_lock"))

				return
			end

			arg_6_0:emit(GAME.GO_SCENE, SCENE.LEVEL, {
				openChapterId = var_6_1.chapterid,
				chapterId = var_6_1.chapterid,
				mapIdx = var_7_1.id
			})
		elseif var_6_1.recipeid then
			local var_7_5 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

			if not var_7_5 or var_7_5:isEnd() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			local var_7_6 = var_7_5:GetFormulas()[var_6_1.recipeid]

			if var_7_6:GetType() ~= AtelierFormula.TYPE.TOOL and not var_7_5:IsCompleteAllTools(var_7_6:getConfig("version")) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_unlock_all_tools"))

				return
			end

			if not var_7_6:IsAvaliable() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_composite_invalid"))

				return
			end

			arg_6_0:emit(AtelierMaterialDetailMediator.GO_RECIPE, var_6_1.recipeid)
		elseif var_6_1.taskid then
			local var_7_7 = getProxy(ActivityProxy):getActivityById(ActivityConst.RYZA_TASK)

			if not var_7_7 or var_7_7:isEnd() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			arg_6_0:emit(GAME.GO_SCENE, SCENE.CORE_ACTIVITY, {
				coreName = var_7_7:getConfig("page_core"),
				id = var_7_7.id
			})
		end
	end, SFX_PANEL)
end

local var_0_1 = "ui/AtelierCommonUI_atlas"

function var_0_0.UpdateRyzaItem(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = "icon_frame_" .. arg_8_2:GetRarity()

	if arg_8_3 then
		var_8_0 = var_8_0 .. "_small"
	end

	arg_8_0.loader:GetSpriteQuiet(var_0_1, var_8_0, arg_8_1)
	arg_8_0.loader:GetSpriteQuiet(arg_8_2:GetIconPath(), "", arg_8_1:Find("Icon"))

	if not IsNil(arg_8_1:Find("Lv")) then
		setText(arg_8_1:Find("Lv/Text"), arg_8_2:GetLevel())
	end

	local var_8_1 = arg_8_2:GetProps()
	local var_8_2 = CustomIndexLayer.Clone2Full(arg_8_1:Find("List"), #var_8_1)

	for iter_8_0, iter_8_1 in ipairs(var_8_2) do
		arg_8_0.loader:GetSpriteQuiet(var_0_1, "element_" .. AtelierFormulaCircle.ELEMENT_NAME[var_8_1[iter_8_0]], iter_8_1)
	end

	if not IsNil(arg_8_1:Find("Text")) then
		setText(arg_8_1:Find("Text"), arg_8_2.count or "")
	end
end

function var_0_0.willExit(arg_9_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_9_0.layerItemDetail)
	arg_9_0.loader:Clear()
end

return var_0_0
