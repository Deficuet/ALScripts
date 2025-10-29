local var_0_0 = class("StoryAwardPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("bg")
	arg_1_0.itemTpl = arg_1_0._tf:Find("Item")
	arg_1_0.taskItemTpl = arg_1_0._tf:Find("TaskItem")
	arg_1_0.scrollTF = arg_1_0._tf:Find("Mask/ScrollView")
	arg_1_0.container = arg_1_0._tf:Find("Mask/ScrollView/Content")
	arg_1_0.arrow = arg_1_0._tf:Find("Mask/Arrow")
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.config = pg.activity_event_chapter_award[arg_2_0.activity:getConfig("config_id")]
	arg_2_0.chapterIDList = arg_2_0.config.chapter
end

function var_0_0.OnFirstFlush(arg_3_0)
	for iter_3_0 = 1, #arg_3_0.chapterIDList do
		local var_3_0 = arg_3_0.chapterIDList[iter_3_0]
		local var_3_1 = pg.chapter_template[var_3_0].chapter_name
		local var_3_2 = cloneTplTo(arg_3_0.taskItemTpl, arg_3_0.container, "TaskItem" .. tostring(iter_3_0))
		local var_3_3 = var_3_2:Find("TaskTitle/LevelBum")
		local var_3_4 = var_3_2:Find("ItemListContainer")
		local var_3_5 = var_3_2:Find("GotTag")
		local var_3_6 = var_3_2:Find("GetBtn")

		setText(var_3_3, var_3_1)

		for iter_3_1 = 1, #arg_3_0.config.award_display[iter_3_0] do
			local var_3_7 = cloneTplTo(arg_3_0.itemTpl, var_3_4)
			local var_3_8 = arg_3_0.config.award_display[iter_3_0][iter_3_1]
			local var_3_9 = {
				type = var_3_8[1],
				id = var_3_8[2],
				count = var_3_8[3]
			}

			updateDrop(var_3_7, var_3_9)
			onButton(arg_3_0, var_3_7, function()
				arg_3_0:emit(BaseUI.ON_DROP, var_3_9)
			end, SFX_PANEL)
		end

		onButton(arg_3_0, var_3_6, function()
			arg_3_0:emit(ActivityMediator.EVENT_OPERATION, {
				cmd = 1,
				activity_id = arg_3_0.activity.id,
				arg1 = var_3_0
			})
		end, SFX_PANEL)
	end

	onScroll(arg_3_0, arg_3_0.scrollTF, function(arg_6_0)
		setActive(arg_3_0.arrow, arg_6_0.y >= 0.01)
	end)
end

function var_0_0.OnUpdateFlush(arg_7_0)
	for iter_7_0 = 1, #arg_7_0.chapterIDList do
		local var_7_0 = arg_7_0.chapterIDList[iter_7_0]
		local var_7_1 = arg_7_0.container:Find("TaskItem" .. tostring(iter_7_0))
		local var_7_2 = var_7_1:Find("GotTag")
		local var_7_3 = var_7_1:Find("GetBtn")
		local var_7_4 = _.include(arg_7_0.activity.data1_list, var_7_0)

		if var_7_4 then
			var_7_1.transform:SetAsLastSibling()
		end

		local var_7_5 = var_7_1:Find("TaskTitle")
		local var_7_6 = var_7_1:Find("ItemListContainer")

		setGray(var_7_5, var_7_4)
		setGray(var_7_6, var_7_4)
		setActive(var_7_2, var_7_4)
		setActive(var_7_3, getProxy(ChapterProxy):isClear(var_7_0) and not var_7_4)
	end
end

function var_0_0.OnDestroy(arg_8_0)
	return
end

return var_0_0
