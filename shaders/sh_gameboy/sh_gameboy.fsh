//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 col_000; // Darkest color
uniform vec3 col_033; // Dark color
uniform vec3 col_066; // Bright color
uniform vec3 col_100; // Brightest color

void main()
{
	vec4 src = texture2D( gm_BaseTexture, v_vTexcoord );
	
	float temp = src.r + src.g + src.b;
	float col = floor(abs(temp) + 0.5);
	
	vec3 final = mix(col_000, col_033, clamp(col, 0.0, 1.0));
	final = mix(final, col_066, clamp(col - 1.0, 0.0, 1.0));
	final = mix(final, col_100, clamp(col - 2.0, 0.0, 1.0));
	
	gl_FragColor = vec4(vec3(final.rgb), src.a);
}
