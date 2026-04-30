pg = pg or {}
pg.guild_mission_template = rawget(pg, "guild_mission_template") or setmetatable({
	__name = "guild_mission_template"
}, confNEO)
pg.guild_mission_template.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	12
}
pg.base = pg.base or {}
pg.base.guild_mission_template = {}

;(function()
	pg.base.guild_mission_template[1] = {
		award_capital_display = 15,
		name = "塞壬歼灭I-舰队累计完成【击沉任意敌人60艘】任务100次",
		max_num = 100,
		task_scale = 1,
		id = 1,
		task_id = 70001,
		guild_active = 5,
		award_display = 80
	}
	pg.base.guild_mission_template[2] = {
		award_capital_display = 25,
		name = "塞壬歼灭II-舰队累计完成【击沉任意敌人180艘】任务100次",
		max_num = 100,
		task_scale = 2,
		id = 2,
		task_id = 70002,
		guild_active = 5,
		award_display = 240
	}
	pg.base.guild_mission_template[3] = {
		award_capital_display = 35,
		name = "塞壬歼灭III-舰队累计完成【击沉任意敌人300艘】任务100次",
		max_num = 100,
		task_scale = 3,
		id = 3,
		task_id = 70003,
		guild_active = 5,
		award_display = 400
	}
	pg.base.guild_mission_template[4] = {
		award_capital_display = 15,
		name = "海域清扫I-舰队累计完成【舰队出征，获得15次战斗胜利】任务100次",
		max_num = 100,
		task_scale = 1,
		id = 4,
		task_id = 70011,
		guild_active = 5,
		award_display = 80
	}
	pg.base.guild_mission_template[5] = {
		award_capital_display = 25,
		name = "海域清扫II-舰队累计完成【舰队出征，获得45次战斗胜利】任务100次",
		max_num = 100,
		task_scale = 2,
		id = 5,
		task_id = 70012,
		guild_active = 5,
		award_display = 240
	}
	pg.base.guild_mission_template[6] = {
		award_capital_display = 35,
		name = "海域清扫III-舰队累计完成【舰队出征，获得75次战斗胜利】任务100次",
		max_num = 100,
		task_scale = 3,
		id = 6,
		task_id = 70013,
		guild_active = 5,
		award_display = 400
	}
	pg.base.guild_mission_template[7] = {
		award_capital_display = 15,
		name = "军需筹备I-舰队累计完成【执行军需筹备任务3次】任务100次",
		max_num = 100,
		task_scale = 1,
		id = 7,
		task_id = 70021,
		guild_active = 5,
		award_display = 80
	}
	pg.base.guild_mission_template[8] = {
		award_capital_display = 25,
		name = "军需筹备II-舰队累计完成【执行军需筹备任务9次】任务100次",
		max_num = 100,
		task_scale = 2,
		id = 8,
		task_id = 70022,
		guild_active = 5,
		award_display = 240
	}
	pg.base.guild_mission_template[9] = {
		award_capital_display = 35,
		name = "军需筹备III-舰队累计完成【执行军需筹备任务15次】任务100次",
		max_num = 100,
		task_scale = 3,
		id = 9,
		task_id = 70023,
		guild_active = 5,
		award_display = 400
	}
	pg.base.guild_mission_template[10] = {
		award_capital_display = 15,
		name = "大舰队作战I-舰队累计完成【参与1次大舰队作战任意事件】任务100次",
		max_num = 100,
		task_scale = 1,
		id = 10,
		task_id = 70031,
		guild_active = 5,
		award_display = 80
	}
	pg.base.guild_mission_template[11] = {
		award_capital_display = 25,
		name = "大舰队作战II-舰队累计完成【参与3次大舰队作战任意事件】任务100次",
		max_num = 100,
		task_scale = 2,
		id = 11,
		task_id = 70032,
		guild_active = 5,
		award_display = 240
	}
	pg.base.guild_mission_template[12] = {
		award_capital_display = 35,
		name = "大舰队作战III-舰队累计完成【参与5次大舰队作战任意事件】任务100次",
		max_num = 100,
		task_scale = 3,
		id = 12,
		task_id = 70033,
		guild_active = 5,
		award_display = 400
	}
end)()
