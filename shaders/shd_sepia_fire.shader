attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~

varying vec2 v_texcoord;

uniform float strength;

void main()
{ 
    vec4 c = texture2D(gm_BaseTexture, v_texcoord);
    vec3 sepia = vec3(0.0);
    sepia.r = dot(c.rgb, vec3(0.7,0.4,0.3));
    sepia.g = dot(c.rgb, vec3(0.6,0.3,0.2));
    sepia.b = dot(c.rgb, vec3(0.5,0.2,0.1));
    gl_FragColor.rgb = mix(c.rgb,sepia.rgb, strength);
    gl_FragColor.a = c.a;
}
