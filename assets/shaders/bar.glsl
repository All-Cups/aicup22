varying vec4 v_color;

uniform mat4 u_projection_matrix;
uniform mat4 u_view_matrix;

#ifdef VERTEX_SHADER
attribute vec3 a_pos;
attribute vec3 i_position;
attribute mat4 i_local_matrix;
attribute vec4 i_color;
void main() {
    v_color = i_color;
    vec4 local_pos = i_local_matrix * vec4(a_pos, 1.0);
    gl_Position = u_projection_matrix * (u_view_matrix * vec4(i_position, 1.0) + vec4(local_pos.xyz, 0.0));
}
#endif

#ifdef FRAGMENT_SHADER

void main() {
    gl_FragColor = v_color;
}
#endif