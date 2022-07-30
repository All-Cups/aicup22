varying vec2 v_vt;
varying float v_zone;
varying vec4 v_color;

uniform mat4 u_projection_matrix;
uniform mat4 u_view_matrix;
uniform vec3 u_light_direction;

#ifdef VERTEX_SHADER
attribute vec3 a_pos;
attribute vec2 a_vt;
attribute vec4 a_color;
attribute vec3 i_position;
attribute mat4 i_local_matrix;
attribute vec4 i_color;
uniform vec2 u_zone_center;
uniform float u_zone_inner_radius;
uniform float u_zone_outer_radius;
void main() {
    v_vt = a_vt;
    v_color = i_color * a_color;
    vec4 pos = i_local_matrix * vec4(a_pos, 1.0) + vec4(i_position, 0.0);
    v_zone = clamp((length(pos.xy - u_zone_center) - u_zone_inner_radius) / (u_zone_outer_radius - u_zone_inner_radius), 0.0, 1.0);
    gl_Position = u_projection_matrix * u_view_matrix * pos;
}
#endif

#ifdef FRAGMENT_SHADER
uniform sampler2D u_texture;
uniform vec4 u_zone_color;

void main() {
    gl_FragColor = texture2D(u_texture, v_vt);
    gl_FragColor.xyz = gl_FragColor.xyz * (1.0 - v_zone) + v_zone * u_zone_color.xyz;
    gl_FragColor *= v_color;
}
#endif