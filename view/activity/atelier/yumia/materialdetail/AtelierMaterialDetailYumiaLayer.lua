local var_0_0 = class("AtelierMaterialDetailYumiaLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AtelierMaterialYumiaDetailUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:InitCustom()
end

function var_0_0.InitCustom(arg_3_0)
	setText(arg_3_0:findTF("Window/Text"), i18n("yumia_atelier_tip13"))
	setText(arg_3_0:findTF("Window/titleBg/Name"), i18n("yumia_atelier_tip14"))
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0:findTF("BG"), function()
		arg_4_0:PlayCloseAni()
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0:findTF("Window/titleBg/closeBtn"), function()
		arg_4_0:PlayCloseAni()
	end, SFX_CANCEL)
	arg_4_0:UpdateItemDetail()
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
end

function var_0_0.PlayCloseAni(arg_7_0)
	local var_7_0 = GetComponent(arg_7_0._tf, typeof(Animation))

	var_7_0:Play("Anim_AtelierMaterialYumiaDetailUI_Out")
	pg.UIMgr.GetInstance():LoadingOn(false)

	arg_7_0.closeTimer = FrameTimer.New(function()
		if not var_7_0:IsPlaying("Anim_AtelierMaterialYumiaDetailUI_Out") then
			arg_7_0:StopCloseTimer()
			pg.UIMgr.GetInstance():LoadingOff()
			arg_7_0:closeView()
		end
	end, 1, -1)

	arg_7_0.closeTimer:Start()
end

function var_0_0.StopCloseTimer(arg_9_0)
	if arg_9_0.closeTimer then
		arg_9_0.closeTimer:Stop()

		arg_9_0.closeTimer = nil
	end
end

function var_0_0.UpdateItemDetail(arg_10_0)
	local var_10_0 = arg_10_0.contextData.material

	arg_10_0:UpdateRyzaItem(arg_10_0:findTF("Window/AtelierCommonYumiaItem"), var_10_0)
	setText(arg_10_0:findTF("Window/nameBg/Name"), var_10_0:GetName())
	setText(arg_10_0:findTF("Window/Description/Text"), var_10_0:GetDesc())

	local var_10_1 = var_10_0:GetSource()

	setScrollText(arg_10_0:findTF("Window/sourceBg/mask/sourceText"), var_10_1[1])
	onButton(arg_10_0, arg_10_0:findTF("Window/Go"), function()
		if var_10_1.chapterid then
			local var_11_0 = getProxy(ChapterProxy):getChapterById(var_10_1.chapterid)
			local var_11_1 = getProxy(ChapterProxy):getMapById(var_11_0:getConfig("map"))
			local var_11_2 = getProxy(ActivityProxy):getActivityByType(var_11_1:getConfig("on_activity"))

			if not var_11_2 or var_11_2:isEnd() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			local var_11_3, var_11_4 = var_11_1:isUnlock()

			if not var_11_3 then
				pg.TipsMgr.GetInstance():ShowTips(var_11_4)

				return
			end

			if not var_11_0:isUnlock() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_chapter_lock"))

				return
			end

			arg_10_0:emit(GAME.GO_SCENE, SCENE.LEVEL, {
				openChapterId = var_10_1.chapterid,
				chapterId = var_10_1.chapterid,
				mapIdx = var_11_1.id
			})
		elseif var_10_1.recipeid then
			local var_11_5 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

			if not var_11_5 or var_11_5:isEnd() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			local var_11_6 = var_11_5:GetFormulas()[var_10_1.recipeid]

			if var_11_6:GetType() ~= AtelierFormula.TYPE.TOOL and not var_11_5:IsCompleteAllTools(var_11_6:getConfig("version")) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_unlock_all_tools"))

				return
			end

			if not var_11_6:IsAvaliable() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_composite_invalid"))

				return
			end

			arg_10_0:emit(AtelierMaterialDetailMediator.GO_RECIPE, var_10_1.recipeid)
		elseif var_10_1.taskid then
			if not getProxy(TaskProxy):getTaskVO(var_10_1.taskid) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			arg_10_0:emit(GAME.GO_SCENE, SCENE.TASK, {
				targetId = var_10_1.taskid
			})
		elseif var_10_1.strongholdid then
			local var_11_7 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_STRONGHOLD)

			if not var_11_7 or var_11_7:isEnd() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			local var_11_8 = getProxy(ContextProxy):getCurrentContext()

			pg.m02:retrieveMediator(var_11_8.mediator.__cname):addSubLayers(Context.New({
				mediator = YoumiyaStrongholdMediator,
				viewComponent = YoumiyaStrongholdLayer
			}))
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateRyzaItem(arg_12_0, arg_12_1, arg_12_2)
	AtelierTools.UpdateYumiaItem(arg_12_1, arg_12_2)
end

function var_0_0.willExit(arg_13_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf)
end

return var_0_0
