local var_0_0 = class("EscapeManorCollectMsgBox", import("view.activity.CorePage.DOA.DOACoreActivityMsgBox"))

function var_0_0.getUIName(arg_1_0)
	return "EscapeManorCollectMsgBox"
end

function var_0_0.Init(arg_2_0)
	var_0_0.super.Init(arg_2_0)
end

function var_0_0.Show(arg_3_0, arg_3_1)
	var_0_0.super.super.Show(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf, {
		staticBlur = true
	})

	local var_3_0 = Drop.New({
		type = arg_3_1.drop_type,
		id = arg_3_1.drop_id
	})

	updateDrop(arg_3_0.iconTF, var_3_0)
	UpdateOwnDisplay(arg_3_0.ownTF, var_3_0)

	local var_3_1 = var_3_0.cfg

	changeToScrollText(arg_3_0.title, var_3_1.name)
	setText(arg_3_0.desc, var_3_0.desc)
	setActive(arg_3_0.owner, false)
	setActive(arg_3_0.ownerLimit, true)
	setText(arg_3_0.ownerLimit:Find("Text"), arg_3_1.count .. "/" .. (arg_3_1.count_limit or 0))

	local var_3_2 = #arg_3_1.skipable_list

	if var_3_2 > 1 then
		arg_3_0.list.localPosition = Vector3(130, -49, 0)
	end

	UIItemList.StaticAlign(arg_3_0.list, arg_3_0.tpl, var_3_2, function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = arg_3_1.skipable_list[arg_4_1 + 1]
			local var_4_1 = var_4_0[1]
			local var_4_2 = var_4_0[2]
			local var_4_3 = var_4_0[3]

			changeToScrollText(arg_4_2:Find("mask/title"), var_4_3)

			local var_4_4 = arg_4_2:Find("skip_btn")

			setText(var_4_4:Find("text"), i18n("task_go"))
			onButton(arg_3_0, var_4_4, function()
				if var_4_1 == var_0_0.SKIP_TYPE_SCENE then
					pg.m02:sendNotification(GAME.GO_SCENE, var_4_2[1], var_4_2[2] or {})
				elseif var_4_1 == var_0_0.SKIP_TYPE_ACTIVITY then
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
						id = var_4_2
					})
				end

				arg_3_0:Hide()
			end, SFX_PANEL)
			Canvas.ForceUpdateCanvases()
		end
	end)
end

return var_0_0
