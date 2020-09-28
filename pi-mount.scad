//rounded_cube2([20,30,2], 2);
module rounded_cube2(v, r){
  $fs = 1;
  if(v[2]){
    union(){
      translate([r,0,0])           cube([v[0]-2*r, v[1]    , v[2]]);
      translate([0,r,0])           cube([v[0]    , v[1]-2*r, v[2]]);
      translate([r,r,0])           cylinder(h=v[2], r=r);
      translate([v[0]-r,r,0])      cylinder(h=v[2], r=r);
      translate([v[0]-r,v[1]-r,0]) cylinder(h=v[2], r=r);
      translate([r,v[1]-r,0])      cylinder(h=v[2], r=r);
    }
  } else {
    union(){
      translate([r,0])           square([v[0]-2*r, v[1]    ]);
      translate([0,r])           square([v[0]    , v[1]-2*r]);
      translate([r,r])           circle(r=r);
      translate([v[0]-r,r])      circle(r=r);
      translate([v[0]-r,v[1]-r]) circle(r=r);
      translate([r,v[1]-r])      circle(r=r);
    }
  }
}

translate([0,0,8])
%pi();
module pi(){
  difference(){
    rounded_cube2([85,56,3], 3);
    for(i=[0,1])
      for(j=[0,1])
        translate([3.5+i*58, 3.5+j*49, -1])
          cylinder(d=2.7, h=5, $fn=12);
  }
}

pimount();
module pimount() {
  difference(){
    union() {
      rounded_cube2([65,56,3.5], 3.5, $fn=32);
      for(i=[0,1])
        for(j=[0,1])
          translate([3.5+i*58, 3.5+j*49, 3.499])
            cylinder(d1=7, d2=5.5, h=4.5, $fn=32);
    }
    for(i=[0,1])
      for(j=[0,1])
        translate([3.5+i*58, 3.5+j*49, -1]) {
          cylinder(d=2.7, h=10, $fn=12);
          cylinder(d=5/cos(30), h=3, $fn=6);
        }
    translate([6, 6, -1])
    rounded_cube2([65-12,56-12,5], 3);
  }
}
