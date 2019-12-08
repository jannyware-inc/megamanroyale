randomdrop = irandom(128);

if(randomdrop < 25){
//small energy
instance_create_depth(centerx,centery,depth-1,obj_pickup_energySmall);
return;
}
if(randomdrop < 40){
//small health
instance_create_depth(centerx,centery,depth-1,obj_pickup_healthSmall);
return;
}
if(randomdrop < 45){
//big energy
instance_create_depth(centerx,centery,depth-1,obj_pickup_energyBig);
return;
}
if(randomdrop < 49){
//big hp
instance_create_depth(centerx,centery,depth-1,obj_pickup_healthBig);
return;
}
if(randomdrop < 50){
//1up
instance_create_depth(centerx,centery,depth-1,obj_pickup_1up);
return;
}

