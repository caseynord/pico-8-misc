pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
x = 64 y = 64

function v_add(a,b)
	a.x=a.x+b.x
	a.y=a.y+b.y
end

function v_mult(a,length)
	a.x=a.x*length
	a.y=a.y*length
end

--[[
function apply()
	v_add(ball.velocity,ball.acceleration)
	v_add(ball.position,ball.velocity)
	if (velocity > topspeed) then velocity = topspeed end
end ]]


function _init()
	ball = {
		position = {x=0,y=0},
		velocity = {x=0,y=0},
		acceleration = {x=0,y=0},
		magnitude = 0
	--	topspeed = 5
	}
	wind = {x=0.1,y=0}
	gravity = {x=0,y=0.2}
end

function _update()		
	v_add(ball.acceleration,gravity)
	v_add(ball.acceleration,wind)
	v_add(ball.velocity,ball.acceleration)
	v_add(ball.position,ball.velocity)

if(ball.position.x<0) then
	ball.position.x=0
	ball.velocity.x=ball.velocity.x*-1
elseif(ball.position.x>125) then
	ball.position.x=125
	ball.velocity.x=ball.velocity.x*-1
end
if(ball.position.y<0) then
	ball.position.y=0
	ball.velocity.y=ball.velocity.y*-1
elseif(ball.position.y>125) then
	ball.position.y=125
	ball.velocity.y=ball.velocity.y*-1
end	

	v_mult(ball.acceleration,0)
	
--	if (btn(0)) then x=x-1 end
--	if (btn(1)) then x=x+1 end
--	if (btn(2)) then y=y-1 end
--	if (btn(3)) then y=y+1 end
end

function _draw()
	rectfill(0,0,127,127,5)
	circfill(ball.position.x,ball.position.y,3,14)
end
