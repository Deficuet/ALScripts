return {
	id = "ISLANDSIDE01306",
	mode = 10,
	map = {
		{
			101400,
			10050003
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			animation = "hi",
			characterId = 101400,
			subName = "農園管理人",
			say = "指揮官、おかえり。それは……肥料！？",
			face2Face = {
				{
					0,
					101400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "助かった……これなら注文に間に合うはず！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101400,
			subName = "農園管理人",
			say = "でも、時間に余裕はないかも……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "あの…指揮官、ラベンダーの栽培を……手伝ってくれる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――いいよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101400,
			subName = "農園管理人",
			say = "ありがとう……北側は指揮官に任せるね。私は南側を……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "ちょうどラベンダーを収穫したところだし……今から新しい種を植えていこう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
