pg = pg or {}
pg.island_interact_point = rawget(pg, "island_interact_point") or setmetatable({
	__name = "island_interact_point"
}, confNEO)
pg.island_interact_point.all = {
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
	12,
	13,
	14,
	15,
	16,
	17,
	18,
	19
}
pg.base = pg.base or {}
pg.base.island_interact_point = {}

;(function()
	pg.base.island_interact_point[1] = {
		id = 1,
		slot_cnt = 1,
		attach = "pre_item_05_50128(Clone)/hudong_pre/50128A/pre_item_05_50128A",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			1
		},
		param = {
			{}
		},
		offset = {
			-3.92,
			0,
			6.56
		}
	}
	pg.base.island_interact_point[2] = {
		id = 2,
		slot_cnt = 3,
		attach = "pre_item_05_50128(Clone)/hudong_pre/pre_item_05_50128B",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			2
		},
		param = {
			{}
		},
		offset = {
			7.38,
			0,
			-0.37
		}
	}
	pg.base.island_interact_point[3] = {
		id = 3,
		slot_cnt = 2,
		attach = "pre_item_05_50128(Clone)/hudong_pre/pre_item_05_50128C",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			3
		},
		param = {
			{}
		},
		offset = {
			0.04,
			0,
			4.06
		}
	}
	pg.base.island_interact_point[4] = {
		id = 4,
		slot_cnt = 2,
		attach = "pre_item_05_50104(Clone)",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			4
		},
		param = {
			{}
		},
		offset = {
			0,
			0,
			0
		}
	}
	pg.base.island_interact_point[5] = {
		id = 5,
		slot_cnt = 1,
		attach = "pre_item_05_50105(Clone)",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			5
		},
		param = {
			{}
		},
		offset = {
			0,
			0,
			0
		}
	}
	pg.base.island_interact_point[6] = {
		id = 6,
		slot_cnt = 1,
		attach = "pre_item_05_50103(Clone)",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			6
		},
		param = {
			{}
		},
		offset = {
			0,
			0,
			0
		}
	}
	pg.base.island_interact_point[7] = {
		id = 7,
		slot_cnt = 1,
		attach = "pre_item_05_50107(Clone)",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			7
		},
		param = {
			{}
		},
		offset = {
			0,
			0,
			0
		}
	}
	pg.base.island_interact_point[8] = {
		id = 8,
		slot_cnt = 2,
		attach = "pre_item_05_50119(Clone)",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			8
		},
		param = {
			{}
		},
		offset = {
			0,
			0,
			0
		}
	}
	pg.base.island_interact_point[9] = {
		id = 9,
		slot_cnt = 2,
		attach = "pre_item_05_50201(Clone)/hudong_pre/pre_item_05_50201a",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			9
		},
		param = {
			{}
		},
		offset = {
			-3.25,
			0,
			5.01
		}
	}
	pg.base.island_interact_point[10] = {
		id = 10,
		slot_cnt = 1,
		attach = "pre_item_05_50201(Clone)/hudong_pre/pre_item_05_50201b",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			10
		},
		param = {
			{}
		},
		offset = {
			-7.35,
			0,
			1.27
		}
	}
	pg.base.island_interact_point[11] = {
		id = 11,
		slot_cnt = 1,
		attach = "pre_item_05_50202(Clone)",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			11
		},
		param = {
			{}
		},
		offset = {
			0,
			0,
			0
		}
	}
	pg.base.island_interact_point[12] = {
		id = 12,
		slot_cnt = 1,
		attach = "pre_item_05_50205(Clone)",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			12
		},
		param = {
			{}
		},
		offset = {
			0,
			0,
			0
		}
	}
	pg.base.island_interact_point[13] = {
		id = 13,
		slot_cnt = 1,
		attach = "pre_item_05_50212(Clone)",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			13
		},
		param = {
			{}
		},
		offset = {
			0,
			0,
			0
		}
	}
	pg.base.island_interact_point[14] = {
		id = 14,
		slot_cnt = 1,
		attach = "pre_item_05_50251(Clone)",
		bt = "island/nodecanvas/agora/agora_50251",
		timeline = {
			17
		},
		param = {
			{}
		},
		offset = {
			1.4,
			0,
			-0.088
		}
	}
	pg.base.island_interact_point[15] = {
		id = 15,
		slot_cnt = 1,
		attach = "pre_item_05_50251(Clone)",
		bt = "island/nodecanvas/agora/agora_50251",
		timeline = {
			18
		},
		param = {
			{}
		},
		offset = {
			4.635,
			0,
			0.839
		}
	}
	pg.base.island_interact_point[16] = {
		id = 16,
		slot_cnt = 4,
		attach = "pre_item_05_50277(Clone)",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			19
		},
		param = {
			{}
		},
		offset = {
			0,
			0,
			0
		}
	}
	pg.base.island_interact_point[17] = {
		id = 17,
		slot_cnt = 1,
		attach = "pre_item_05_50253(Clone)",
		bt = "island/nodecanvas/agora/agora_common",
		timeline = {
			20
		},
		param = {
			{}
		},
		offset = {
			0,
			0,
			0
		}
	}
	pg.base.island_interact_point[18] = {
		id = 18,
		slot_cnt = 1,
		attach = "pre_item_05_50254(Clone)",
		bt = "island/nodecanvas/agora/agora_50254",
		timeline = {
			21
		},
		param = {
			{}
		},
		offset = {
			0,
			0,
			0
		}
	}
	pg.base.island_interact_point[19] = {
		id = 19,
		slot_cnt = 1,
		attach = "pre_item_05_50257(Clone)",
		bt = "island/nodecanvas/agora/agora_switch_model",
		timeline = {
			22,
			23,
			24
		},
		param = {
			{
				"interactionGroup",
				"84"
			},
			{
				"interactionGroup",
				"85"
			},
			{
				"interactionGroup",
				"83"
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
end)()
