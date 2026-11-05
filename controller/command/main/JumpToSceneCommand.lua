local var_0_0 = class("JumpToSceneCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.sceneData
	local var_1_2 = SCENE[var_1_1[1]]
	local var_1_3 = var_1_1[2]
	local var_1_4 = var_1_0.activityID

	if var_1_4 and var_1_4 ~= 0 then
		local var_1_5 = getProxy(ActivityProxy):getActivityById(var_1_4)

		if not var_1_5 or var_1_5:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_end_tip"))

			return
		end
	end

	switch(var_1_2, {
		[SCENE.SHOP] = function()
			arg_1_0:JumpToShop(var_1_2, var_1_3)
		end,
		[SCENE.LEVEL] = function()
			arg_1_0:JumpToLevel(var_1_2, var_1_3)
		end,
		[SCENE.COLLECTSHIP] = function()
			arg_1_0:JumpToCollectShip(var_1_2, var_1_3)
		end
	}, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, var_1_2, var_1_3)
	end)
end

function var_0_0.JumpToShop(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_2.warp == NewShopsScene.TYPE_MILITARY_SHOP and not pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getData().level, "MilitaryExerciseMediator") then
		pg.TipsMgr.GetInstance():ShowTips(i18n("military_shop_no_open_tip"))

		return
	end

	arg_6_0:sendNotification(GAME.GO_SCENE, arg_6_1, arg_6_2)
end

function var_0_0.JumpToLevel(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_2.chapterid
	local var_7_1 = getProxy(ChapterProxy)
	local var_7_2 = var_7_1:getChapterById(var_7_0)

	if var_7_2:isUnlock() then
		local var_7_3 = var_7_1:getActiveChapter()

		if var_7_3 and var_7_3.id ~= var_7_0 then
			arg_7_0:ShowMsgBox({
				content = i18n("collect_chapter_is_activation"),
				onYes = function()
					arg_7_0:sendNotification(GAME.CHAPTER_OP, {
						type = ChapterConst.OpRetreat
					})
				end
			})

			return
		else
			local var_7_4 = {
				mapIdx = var_7_2:getConfig("map")
			}

			if var_7_2.active then
				var_7_4.chapterId = var_7_2.id
			else
				var_7_4.openChapterId = var_7_0
			end

			arg_7_0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, var_7_4)
		end
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("acquisitionmode_is_not_open"))

		return
	end
end

function var_0_0.JumpToCollectShip(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0:sendNotification(GAME.GO_SCENE, SCENE.COLLECTSHIP, {
		toggle = 2,
		displayGroupId = arg_9_2.shipGroupId
	})
end

return var_0_0
