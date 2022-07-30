varying vec2 v_pos;
varying vec2 v_vt;

#ifdef VERTEX_SHADER
attribute vec2 a_pos;
uniform mat4 u_projection_matrix;
uniform mat4 u_view_matrix;
uniform mat3 u_storm_matrix;
void main() {
    v_pos = a_pos;
    v_vt = (u_storm_matrix * vec3(a_pos, 1.0)).xy;
    gl_Position = u_projection_matrix * u_view_matrix * vec4(a_pos, 0.0, 1.0);
}
#endif

#ifdef FRAGMENT_SHADER
uniform sampler2D u_texture;
uniform vec2 u_texture_size;
uniform float u_texture_scale;
uniform vec4 u_color;
uniform vec2 u_zone_center;
uniform float u_zone_inner_radius;
uniform float u_zone_outer_radius;
void main() {
    float border = (u_zone_outer_radius - u_zone_inner_radius) / 10.0;
    float zone = clamp((length(v_pos - u_zone_center) - u_zone_inner_radius) / border, 0.0, 1.0);
    gl_FragColor = texture2D(u_texture, v_vt * u_texture_scale / u_texture_size) * u_color;
    gl_FragColor.w *= zone;
}
#endif