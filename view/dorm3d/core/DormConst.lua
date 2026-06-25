local var_0_0 = class("DormConst")

var_0_0.boneMap = {
	Head = "Bip001 Head",
	LeftUpperArm = "Bip001 L UpperArm",
	RightThigh = "Bip001 R Thigh",
	LeftFoot = "Bip001 L Foot",
	RightFoot = "Bip001 R Foot",
	Spine1 = "Bip001 Spine1",
	RightCalf = "Bip001 R Calf",
	RightHand = "Bip001 R Hand",
	LeftThigh = "Bip001 L Thigh",
	Spine = "Bip001 Spine",
	RightUpperArm = "Bip001 R UpperArm",
	Spine2 = "Bip001 Spine2",
	LeftHand = "Bip001 L Hand",
	Pelvis = "Bip001 Pelvis",
	LeftForeArm = "Bip001 L Forearm",
	RightForeArm = "Bip001 R Forearm",
	LeftCalf = "Bip001 L Calf"
}
var_0_0.BONE_TO_TOUCH = {
	Head = "head",
	LeftUpperArm = "hand",
	RightThigh = "leg",
	LeftFoot = "leg",
	RightUpperArm = "hand",
	RightLowerArm = "hand",
	Chest = "chest",
	Butt = "butt",
	RightHand = "hand",
	LeftLowerArm = "hand",
	LeftThigh = "leg",
	RightCalf = "leg",
	RightFoot = "leg",
	LeftHand = "hand",
	Back = "back",
	LeftCalf = "leg",
	Belly = "belly"
}

function var_0_0.GetDefaultSystemClasses()
	return {
		SlideExtraSystem,
		Dorm3dStockingMgr,
		TeleportSystem,
		RoomIKSystem,
		RoomTouchSystem,
		AimIKSystem
	}
end

var_0_0.DEFAULT_ANIM_FADE_IN_TIME = 0.25
var_0_0.LADY_MOVE_SPEED = 0.85
var_0_0.LADY_ROTATE_SPEED = 10
var_0_0.TRANSPARENCY_MIN_DISTANCE = 0.6
var_0_0.TRANSPARENCY_MAX_DISTANCE = 1.2
var_0_0.CHARACTER_CONTROLLER = {
	stepOffset = 0.2,
	radius = 0.08,
	height = 1.49,
	center = Vector3(0, 0.78, 0)
}

return var_0_0
