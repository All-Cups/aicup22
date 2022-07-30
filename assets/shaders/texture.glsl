varying vec4 v_color;
varying vec2 v_vt;

#ifdef VERTEX_SHADER
attribute vec2 a_pos;
attribute vec2 a_vt;
attribute vec4 i_color;
uniform mat4 u_projection_matrix;
uniform mat4 u_view_matrix;
attribute mat3 i_model_matrix;
void main() {
    v_vt = a_vt;
    v_color = i_color;
    vec3 pos = i_model_matrix * vec3(a_pos, 1.0);
    gl_Position = u_projection_matrix * u_view_matrix * vec4(pos.xy, 0.0, pos.z);
}
#endif

#ifdef FRAGMENT_SHADER
uniform vec4 u_color;
uniform sampler2D u_texture;
void main() {
    gl_FragColor = texture2D(u_texture, v_vt) * v_color * u_color;
}
#endif