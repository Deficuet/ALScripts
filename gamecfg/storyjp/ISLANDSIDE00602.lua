return {
	id = "ISLANDSIDE00602",
	mode = 10,
	map = {
		{
			100500,
			10010003
		}
	},
	scripts = {
		{
			say = "――この辺りかな？かじった跡が新しい。きっと羊たちの仕業だ",
			camera = "StoryCameraSideTask3",
			characterId = 0,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――それに……ここの土を見て",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100500,
			subName = "牧場管理人",
			say = "あ！これは……足跡？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――ああ。羊の蹄の跡に違いない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――足跡の向きからして……あっちの森の方に向かったらしい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100500,
			subName = "牧場管理人",
			say = "も、森に？あの子たち、何のために森に？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――追ってみるよ。まだ跡が新しいし、そう遠くには行ってないはずだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――アメリゴは先に戻って牧場で待っててくれ。もしかしたらその間に帰ってくるかもしれない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100500,
			subName = "牧場管理人",
			say = "うん！指揮官の言うとおりにする、先に戻ってるね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
