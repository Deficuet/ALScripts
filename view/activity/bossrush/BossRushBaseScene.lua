local var_0_0 = class("BossRushBaseScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return nil
end

function var_0_0.Ctor(arg_2_0)
	var_0_0.super.Ctor(arg_2_0)

	arg_2_0.chapterAutoDetailPanel = ChapterAutoDetailPanelTypeRush.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)

	arg_2_0.chapterAutoDetailPanel:RegisterView(arg_2_0)
end

function var_0_0.CheckChapterAutoOccupied(arg_3_0, arg_3_1)
	local var_3_0 = getProxy(ChapterAutoProxy):GetCommissionList()[1]:GetOccupiedName()

	switch(arg_3_1, {
		[ChapterAutoProxy.TYPE.SLG] = function()
			local var_4_0 = getProxy(ChapterProxy):GetAutoChapterId()
			local var_4_1 = pg.chapter_template[var_4_0].map

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("auto_drop_is_activation", var_3_0),
				onYes = function()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
						chapterId = var_4_0,
						mapIdx = var_4_1
					})
				end,
				yesText = i18n("auto_drop_is_activation_go"),
				noText = i18n("auto_drop_is_activation_cancle")
			})
		end,
		[ChapterAutoProxy.TYPE.BOSS] = function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("auto_drop_is_activation", var_3_0),
				onYes = function()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACT_BOSS_BATTLE)
				end,
				yesText = i18n("auto_drop_is_activation_go"),
				noText = i18n("auto_drop_is_activation_cancle")
			})
		end,
		[ChapterAutoProxy.TYPE.RUSH] = function()
			local var_8_0 = getProxy(ChapterAutoProxy):GetCommissionList()[1]:GetID()

			arg_3_0.chapterAutoDetailPanel:ExecuteAction("Enter", var_8_0)
		end
	})
end

function var_0_0.UpdateView(arg_9_0)
	return
end

function var_0_0.OnStartChapterAuto(arg_10_0, arg_10_1)
	arg_10_0:UpdateView()
end

function var_0_0.OnEndChapterAuto(arg_11_0)
	arg_11_0.chapterAutoDetailPanel:ExecuteAction("Hide")
	arg_11_0:UpdateView()
end

function var_0_0.willExit(arg_12_0)
	var_0_0.super.willExit(arg_12_0)

	if arg_12_0.chapterAutoDetailPanel then
		arg_12_0.chapterAutoDetailPanel:Destroy()

		arg_12_0.chapterAutoDetailPanel = nil
	end
end

return var_0_0
