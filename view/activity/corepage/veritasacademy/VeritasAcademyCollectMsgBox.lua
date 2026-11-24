local var_0_0 = class("VeritasAcademyCollectMsgBox", import("view.activity.CorePage.DOA.DOACoreActivityMsgBox"))

function var_0_0.getUIName(arg_1_0)
	return "VeritasAcademyCollectMsgBox"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.window = arg_2_0._tf:Find("window")
	arg_2_0.page = arg_2_0._tf:Find("window/page")
	arg_2_0.title = arg_2_0.page:Find("name_mask/name")
	arg_2_0.owner = arg_2_0.page:Find("owner")

	setText(arg_2_0.owner:Find("title"), i18n("collect_page_got"))

	arg_2_0.ownerLimit = arg_2_0.page:Find("owner_limit")

	setText(arg_2_0.ownerLimit:Find("title"), i18n("collect_page_got"))

	arg_2_0.iconTF = arg_2_0.page:Find("left/IconTpl")
	arg_2_0.ownTF = arg_2_0.page:Find("left/own")
	arg_2_0.detailTF = arg_2_0.page:Find("left/detail")
	arg_2_0.desc = arg_2_0.page:Find("content/desc")
	arg_2_0.list = arg_2_0.window:Find("skipable_list")
	arg_2_0.tpl = arg_2_0.list:Find("tpl")
end

function var_0_0.setWindowSize(arg_3_0, arg_3_1)
	return
end

return var_0_0
