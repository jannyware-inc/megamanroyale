randomdrop = irandom(10);

if(randomdrop < 2){
//small energy
instance_create_depth(centerx,centery,depth-1,obj_pickup_1up);
return;
}
if(randomdrop < 4){
//small health
instance_create_depth(centerx,centery,depth-1,obj_pickup_etank);
return;
}
if(randomdrop < 8){
//big energy
instance_create_depth(centerx,centery,depth-1,obj_pickup_energyBig);
return;
}
if(randomdrop < 12){
//big hp
instance_create_depth(centerx,centery,depth-1,obj_pickup_healthBig);
return;
}
