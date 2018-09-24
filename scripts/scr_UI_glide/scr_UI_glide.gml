var accl, accl2, stoppoint, positionX, positionY

stoppoint = 1080

positionX = argument[0]
positionY = argument[1]

accl = 0
accl2 = 5

accl = accl2 + .1

if ((x != positionX) and (y != positionY))
{
	accl = accl2 + .2
	move_towards_point(positionX,positionY,accl)
}