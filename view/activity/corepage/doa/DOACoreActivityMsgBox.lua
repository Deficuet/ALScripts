local var_0_0 = class("DOACoreActivityMsgBox", import("view.base.BaseSubView"))

var_0_0.SKIP_TYPE_SCENE = 2
var_0_0.SKIP_TYPE_ACTIVITY = 3

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
end

function var_0_0.getUIName(arg_2_0)
	return "DOACoreActivityMsgBox"
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0.bg = arg_3_0._tf:Find("bg")
	arg_3_0.btnClose = arg_3_0._tf:Find("window/top/btnBack")

	onButton(arg_3_0, arg_3_0.btnClose, function()
		arg_3_0:Hide()
	end, SOUND_BACK)
	onButton(arg_3_0, arg_3_0.bg, function()
		arg_3_0:Hide()
	end, SOUND_BACK)
end

function var_0_0.OnInit(arg_6_0)
	arg_6_0.window = arg_6_0._tf:Find("window")
	arg_6_0.page = arg_6_0._tf:Find("window/page")
	arg_6_0.title = arg_6_0.page:Find("name_mask/name")
	arg_6_0.owner = arg_6_0.page:Find("owner")

	setText(arg_6_0.owner:Find("title"), i18n("collect_page_got"))

	arg_6_0.ownerLimit = arg_6_0.page:Find("owner_limit")

	setText(arg_6_0.ownerLimit:Find("title"), i18n("collect_page_got"))

	arg_6_0.iconTF = arg_6_0.page:Find("left/IconTpl")
	arg_6_0.ownTF = arg_6_0.page:Find("left/own")
	arg_6_0.detailTF = arg_6_0.page:Find("left/detail")
	arg_6_0.desc = arg_6_0.page:Find("content/desc")
	arg_6_0.list = arg_6_0.page:Find("content/skipable_list")
	arg_6_0.tpl = arg_6_0.list:Find("tpl")
end

function var_0_0.Show(arg_7_0, arg_7_1)
	var_0_0.super.Show(arg_7_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_7_0._tf, {
		staticBlur = true
	})

	local var_7_0 = Drop.New({
		type = arg_7_1.drop_type,
		id = arg_7_1.drop_id
	})

	updateDrop(arg_7_0.iconTF, var_7_0)
	UpdateOwnDisplay(arg_7_0.ownTF, var_7_0)

	local var_7_1 = var_7_0.cfg

	changeToScrollText(arg_7_0.title, var_7_1.name)
	setText(arg_7_0.desc, var_7_0.desc)
	setActive(arg_7_0.owner, false)
	setActive(arg_7_0.ownerLimit, true)
	setText(arg_7_0.ownerLimit:Find("Text"), arg_7_1.count .. "/" .. (arg_7_1.count_limit or 0))

	local var_7_2 = #arg_7_1.skipable_list

	if var_7_2 > 1 then
		arg_7_0:setWindowSize(var_7_2 - 1)
	end

	UIItemList.StaticAlign(arg_7_0.list, arg_7_0.tpl, var_7_2, function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = arg_7_1.skipable_list[arg_8_1 + 1]
			local var_8_1 = var_8_0[1]
			local var_8_2 = var_8_0[2]
			local var_8_3 = var_8_0[3]

			changeToScrollText(arg_8_2:Find("mask/title"), var_8_3)

			local var_8_4 = arg_8_2:Find("skip_btn")

			onButton(arg_7_0, var_8_4, function()
				if var_8_1 == var_0_0.SKIP_TYPE_SCENE then
					pg.m02:sendNotification(GAME.GO_SCENE, var_8_2[1], var_8_2[2] or {})
				elseif var_8_1 == var_0_0.SKIP_TYPE_ACTIVITY then
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
						id = var_8_2
					})
				end

				arg_7_0:Hide()
			end, SFX_PANEL)
			Canvas.ForceUpdateCanvases()
		end
	end)
end

function var_0_0.setWindowSize(arg_10_0, arg_10_1)
	setSizeDelta(arg_10_0.window, Vector2(716, 391 + 50 * arg_10_1))
end

function var_0_0.Hide(arg_11_0)
	if arg_11_0:isShowing() then
		var_0_0.super.Hide(arg_11_0)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0._tf, arg_11_0._parentTf)
	end
end

return var_0_0
