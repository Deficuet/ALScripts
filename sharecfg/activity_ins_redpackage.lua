pg = pg or {}
pg.activity_ins_redpackage = rawget(pg, "activity_ins_redpackage") or setmetatable({
	__name = "activity_ins_redpackage"
}, confNEO)
pg.activity_ins_redpackage.all = {
	1000,
	1001,
	1002,
	1003,
	1004,
	1005
}
pg.base = pg.base or {}
pg.base.activity_ins_redpackage = {}

;(function()
	pg.base.activity_ins_redpackage[1000] = {
		id = 1000,
		desc = "新年快乐，财源滚滚",
		type = 2,
		content = {
			1,
			1,
			648
		},
		group_receive = {
			{
				50102,
				1,
				1,
				46
			},
			{
				0,
				1,
				1,
				648
			},
			{
				50101,
				1,
				1,
				300
			}
		}
	}
	pg.base.activity_ins_redpackage[1001] = {
		id = 1001,
		desc = "新年吃好喝好！",
		type = 2,
		content = {
			1,
			1,
			233
		},
		group_receive = {
			{
				50102,
				1,
				1,
				15
			},
			{
				0,
				1,
				1,
				233
			},
			{
				50107,
				1,
				1,
				320
			},
			{
				50104,
				1,
				1,
				100
			}
		}
	}
	pg.base.activity_ins_redpackage[1002] = {
		id = 1002,
		desc = "新年天天开心",
		type = 2,
		content = {
			1,
			1,
			88
		},
		group_receive = {
			{
				50102,
				1,
				1,
				6
			},
			{
				0,
				1,
				1,
				88
			},
			{
				50602,
				1,
				1,
				426
			}
		}
	}
	pg.base.activity_ins_redpackage[1003] = {
		id = 1003,
		type = 1,
		desc = "指挥官新年快乐",
		group_receive = "",
		content = {
			1,
			1,
			888
		}
	}
	pg.base.activity_ins_redpackage[1004] = {
		id = 1004,
		desc = "新年红包来咯！",
		type = 2,
		content = {
			1,
			1,
			666
		},
		group_receive = {
			{
				50107,
				1,
				1,
				88
			},
			{
				0,
				1,
				1,
				666
			},
			{
				50210,
				1,
				1,
				202
			},
			{
				50109,
				1,
				1,
				188
			}
		}
	}
	pg.base.activity_ins_redpackage[1005] = {
		id = 1005,
		desc = "祝指挥官和大家万事如意！",
		type = 2,
		content = {
			1,
			1,
			888
		},
		group_receive = {
			{
				50301,
				1,
				1,
				12
			},
			{
				0,
				1,
				1,
				888
			},
			{
				50108,
				1,
				1,
				188
			}
		}
	}
end)()
