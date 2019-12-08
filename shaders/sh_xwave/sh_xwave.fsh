//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Time;
uniform vec2 Texel;

const float xspeed = 0.0003;
const float xfreq = 3.00;
const float xsize = 100.0;

void main()
{
	float xwave = sin(Time*xspeed + v_vTexcoord.y*xfreq) * (xsize*Texel.x);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord+vec2(xwave,0.0) );
}
