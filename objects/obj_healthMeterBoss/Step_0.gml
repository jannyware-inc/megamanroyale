if(instance_exists(enemy)){
	maxHp = enemy.hpMax;
	currentHp = enemy.hp;
} else {
	instance_destroy();
}