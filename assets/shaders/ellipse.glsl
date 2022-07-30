uniform mat4 u_projection_matrix;
uniform mat4 u_view_matrix;
uniform ivec2 u_framebuffer_size;
varying float v_inner_cut;

varying mat3 v_model_matrix;
varying vec4 v_inner_color;
varying vec4 v_outer_color;
varying vec2 v_quad_pos;

#ifdef VERTEX_SHADER
attribute mat3 i_model_matrix;
attribute vec4 i_inner_color;
attribute vec4 i_outer_color;
attribute float i_inner_cut;
attribute vec2 a_pos;
void main() {
    v_inner_cut = i_inner_cut;
    v_quad_pos = a_pos;
    v_model_matrix = i_model_matrix;
    v_inner_color = i_inner_color;
    v_outer_color = i_outer_color;
    vec3 pos = v_model_matrix * vec3(a_pos, 1.0);
    gl_Position = u_projection_matrix * u_view_matrix * vec4(pos.xy, 0.0, pos.z);
}
#endif

#ifdef FRAGMENT_SHADER
void main() {
    if (length(v_quad_pos) > 1.0) {
        discard;
    }
    if (length(v_quad_pos) < v_inner_cut) {
        discard;
    }
    float outer = (length(v_quad_pos) - v_inner_cut) / (1.0 - v_inner_cut);
    gl_FragColor = v_inner_color * (1.0 - outer) + v_outer_color * outer;
}
#endif