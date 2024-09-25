/// @description Insert description here
// You can write your code in this editor
if (spawn_count < spawn_amount) {
	instance_create_depth(x,y,-1,obj_customer);
	spawn_count++;
	alarm[0] = spawn_rate;
}