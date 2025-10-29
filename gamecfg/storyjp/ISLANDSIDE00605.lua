return {
	id = "ISLANDSIDE00605",
	mode = 10,
	map = {},
	scripts = {
		{
			withoutName = true,
			camera = "StoryCameraSideTask1",
			withoutIcon = true,
			say = "持っていた小さな袋から、羊の好物のエサをひとつまみ取り出し、ゆっくりと近づいた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			style = 2,
			sequence = {
				{
					"<size=45>羊は警戒して頭を上げたが、少し戸惑いながらもゆっくりと近づいてきた。</size>",
					2
				},
				{
					"<size=45>その隙に持ってきた投げ縄を手際よく首にかけた。</size>",
					4
				}
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――よ～し、おとなしくしてくれよ……大丈夫だ、家に帰ろう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――アメリゴのところへ戻ろう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
