local var_0_0 = class("IdolTrainUI", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IdolTrainUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:InitUI()
	setActive(arg_2_0._tf, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf)
end

function var_0_0.OnDestroy(arg_3_0)
	arg_3_0.onTrain = nil

	pg.UIMgr.GetInstance():UnblurPanel(arg_3_0._tf, arg_3_0._parentTF)
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0.trainBtn = arg_4_0:findTF("panel/train_btn")
	arg_4_0.skills = arg_4_0:findTF("panel/skills")
	arg_4_0.info = arg_4_0:findTF("panel/info")
	arg_4_0.skillBtns = {}

	eachChild(arg_4_0.skills, function(arg_5_0)
		table.insert(arg_4_0.skillBtns, arg_5_0)
	end)

	arg_4_0.curBuff = arg_4_0:findTF("preview/current", arg_4_0.info)
	arg_4_0.nextBuff = arg_4_0:findTF("preview/next", arg_4_0.info)
	arg_4_0.currentBuffLv = arg_4_0:findTF("title/lv/current", arg_4_0.info)
	arg_4_0.nextBuffLv = arg_4_0:findTF("title/lv/next", arg_4_0.info)
end

function var_0_0.setCBFunc(arg_6_0, arg_6_1)
	arg_6_0.onTrain = arg_6_1
end

function var_0_0.set(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.buffInfos = arg_7_1
	arg_7_0.targetIndex = arg_7_2
	arg_7_0.selectIndex = nil
	arg_7_0.selectBuffId = nil
	arg_7_0.selectBuffLv = nil
	arg_7_0.selectNewBuffId = nil

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.skillBtns) do
		onButton(arg_7_0, iter_7_1, function()
			for iter_8_0, iter_8_1 in ipairs(arg_7_0.buffInfos) do
				if iter_7_0 == iter_8_1.group then
					if iter_8_1.next then
						arg_7_0.selectIndex = iter_7_0
						arg_7_0.selectBuffId = iter_8_1.id
						arg_7_0.selectNewBuffId = iter_8_1.next
						arg_7_0.selectBuffLv = iter_8_1.lv
					else
						arg_7_0.selectIndex = nil
						arg_7_0.selectBuffId = nil
						arg_7_0.selectNewBuffId = nil
						arg_7_0.selectBuffLv = nil
					end
				end
			end

			arg_7_0:flush()
		end, SFX_PANEL)
	end

	onButton(arg_7_0, arg_7_0.trainBtn, function()
		if arg_7_0.onTrain and arg_7_0.selectBuffId then
			local var_9_0 = pg.benefit_buff_template[arg_7_0.selectBuffId].name

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = "是否要对" .. var_9_0 .. "进行训练" .. arg_7_0.selectBuffId,
				onYes = function()
					arg_7_0.onTrain(arg_7_0.targetIndex, arg_7_0.selectNewBuffId, arg_7_0.selectBuffId)
					arg_7_0:Destroy()
				end
			})
		end
	end, SFX_PANEL)
	arg_7_0:flush()
end

function var_0_0.flush(arg_11_0)
	if arg_11_0.buffInfos then
		for iter_11_0, iter_11_1 in ipairs(arg_11_0.buffInfos) do
			if iter_11_1.next then
				setText(arg_11_0:findTF("lv", arg_11_0.skillBtns[iter_11_1.group]), "Lv." .. iter_11_1.lv)
			else
				setText(arg_11_0:findTF("lv", arg_11_0.skillBtns[iter_11_1.group]), "MAX")
			end
		end
	end

	for iter_11_2, iter_11_3 in ipairs(arg_11_0.skillBtns) do
		if iter_11_2 == arg_11_0.selectIndex then
			setActive(arg_11_0:findTF("selected", iter_11_3), true)
		else
			setActive(arg_11_0:findTF("selected", iter_11_3), false)
		end
	end

	if arg_11_0.selectIndex then
		setActive(arg_11_0.info, true)
		setActive(arg_11_0.trainBtn, true)
		setText(arg_11_0.curBuff, pg.benefit_buff_template[arg_11_0.selectBuffId].desc)
		setText(arg_11_0.nextBuff, pg.benefit_buff_template[arg_11_0.selectNewBuffId].desc)
		setText(arg_11_0.nextBuffLv, "Lv." .. arg_11_0.selectBuffLv + 1)
		setText(arg_11_0.currentBuffLv, "Lv." .. arg_11_0.selectBuffLv)
	else
		setActive(arg_11_0.info, false)
		setActive(arg_11_0.trainBtn, false)
	end
end

return var_0_0
