local var_0_0 = class("DreamTourMedalDetailPanel", import("view.mediaCollection.album.MedalDetailPanel"))

function var_0_0.InitUI(arg_1_0)
	var_0_0.super.InitUI(arg_1_0)

	arg_1_0._stateBg = findTF(arg_1_0._tf, "state_bg")
	arg_1_0._progressLockText = findTF(arg_1_0._tf, "progress/lock/label")

	setText(arg_1_0._progressLockText, i18n("word_lock"))
end

function var_0_0.UpdateMedal(arg_2_0)
	var_0_0.super.UpdateMedal(arg_2_0)

	local var_2_0 = arg_2_0._medalGroup:GetMedalGroupState()

	SetActive(arg_2_0._stateBg, var_2_0 ~= ActivityMedalGroup.STATE_ACTIVE)
end

return var_0_0
