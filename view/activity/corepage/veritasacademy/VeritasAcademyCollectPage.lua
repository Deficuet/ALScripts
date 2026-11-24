local var_0_0 = class("VeritasAcademyCollectPage", import("view.activity.CorePage.EscapeManor.EscapeManorCollectPage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.msgBox = VeritasAcademyCollectMsgBox.New(arg_1_0._tf, arg_1_0.event)
end

return var_0_0
