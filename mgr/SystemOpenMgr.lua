pg = pg or {}
pg.SystemOpenMgr = singletonClass("SystemOpenMgr")

local var_0_0 = pg.SystemOpenMgr
local var_0_1 = true
local var_0_2 = pg.open_systems_limited

function var_0_0.Init(arg_1_0, arg_1_1)
	print("initializing SystemOpenMgr manager...")
	arg_1_1()
end

local var_0_3 = pm.Facade.sendNotification

function pm.Facade.sendNotification(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if var_0_1 and arg_2_1 == GAME.LOAD_SCENE and arg_2_2.context.mediator then
		local var_2_0 = getProxy(PlayerProxy)
		local var_2_1 = arg_2_2.context.mediator.__cname

		if var_2_0 then
			local var_2_2 = var_2_0:getRawData()

			if var_2_2 then
				local var_2_3, var_2_4 = pg.SystemOpenMgr.GetInstance():isOpenSystem(var_2_2.level, var_2_1)

				if not var_2_3 then
					pg.TipsMgr.GetInstance():ShowTips(var_2_4)

					return
				end
			end
		end

		if HXSet.isHxSkin() and var_2_1 == "NewSkinShopMediator" then
			return
		end

		var_0_3(arg_2_0, GAME.CHECK_HOTFIX_VER, {
			mediatorName = var_2_1
		})
	end

	if arg_2_1 == GAME.BEGIN_STAGE then
		pg.GuildMsgBoxMgr.GetInstance():OnBeginBattle()
	end

	if arg_2_1 == GAME.FINISH_STAGE_DONE then
		pg.GuildMsgBoxMgr.GetInstance():OnFinishBattle(arg_2_2)
	end

	var_0_3(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
end

local function var_0_4(arg_3_0)
	local var_3_0 = var_0_2[14].level
	local var_3_1 = var_0_2[14].name

	if var_3_0 == arg_3_0 then
		if pg.NewStoryMgr.GetInstance():IsPlayed("ZHIHUIMIAO1") or IsUnityEditor then
			return true
		else
			return false, i18n("no_open_system_tip", var_3_1, var_3_0)
		end
	elseif var_3_0 < arg_3_0 then
		return true
	else
		return false, i18n("no_open_system_tip", var_3_1, var_3_0)
	end
end

function var_0_0.isOpenSystem(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_2 == "EquipmentTransformTreeMediator" and LOCK_EQUIPMENT_TRANSFORM then
		return false
	end

	if arg_4_2 == "CommanderCatMediator" then
		return var_0_4(arg_4_1)
	else
		for iter_4_0, iter_4_1 in pairs(var_0_2.all) do
			if var_0_2[iter_4_1].mediator == arg_4_2 and arg_4_1 < var_0_2[iter_4_1].level then
				return false, i18n("no_open_system_tip", var_0_2[iter_4_1].name, var_0_2[iter_4_1].level)
			end
		end

		return true
	end
end

local function var_0_5(arg_5_0)
	local var_5_0 = _.sort(var_0_2.all, function(arg_6_0, arg_6_1)
		return var_0_2[arg_6_0].level > var_0_2[arg_6_1].level
	end)

	for iter_5_0, iter_5_1 in pairs(var_5_0) do
		local var_5_1 = var_0_2[iter_5_1]

		if arg_5_0 >= var_5_1.level then
			return var_5_1
		end
	end
end

function var_0_0.notification(arg_7_0, arg_7_1)
	if not var_0_1 then
		return
	end

	local var_7_0 = var_0_5(arg_7_1)

	if var_7_0 and not pg.MsgboxMgr.GetInstance()._go.activeSelf and var_7_0.story_id and var_7_0.story_id ~= "" and not arg_7_0.active and not pg.NewStoryMgr.GetInstance():IsPlayed(var_7_0.story_id) and not pg.SeriesGuideMgr.GetInstance():isNotFinish() then
		arg_7_0.active = true

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideNo = true,
			hideClose = true,
			content = i18n("open_system_tip", var_7_0.name),
			onYes = function()
				arg_7_0:doSystemGuide(var_7_0.id)
			end
		})
	end
end

function var_0_0.doSystemGuide(arg_9_0, arg_9_1)
	if IsUnityEditor and not ENABLE_GUIDE then
		return
	end

	local var_9_0 = pg.open_systems_limited[arg_9_1]
	local var_9_1 = var_9_0.story_id

	if var_9_1 and var_9_1 ~= "" then
		if getProxy(ContextProxy):getCurrentContext().scene ~= SCENE[var_9_0.scene] then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE[var_9_0.scene])
		end

		pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_9_1, {}, function()
			arg_9_0.active = nil
		end)
	end
end
