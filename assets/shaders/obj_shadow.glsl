#ifdef VERTEX_SHADER
attribute vec3 a_v;
uniform mat4 u_projection_matrix;
uniform mat4 u_view_matrix;
attribute mat4 i_model_matrix;
uniform vec3 u_light_direction;
void main() {
    vec3 pos = (i_model_matrix * vec4(a_v.x, a_v.z, a_v.y, 1.0)).xyz;
    float height = pos.z / 100.0;
    vec3 ground_pos = pos - u_light_direction * pos.z / u_light_direction.z;
    gl_Position = u_projection_matrix * u_view_matrix * vec4(ground_pos, 1.0);
    if (gl_Position.z > 0.0) {
        gl_Position = vec4(gl_Position.xy / gl_Position.w, height * 2.0 - 1.0, 1.0);
    }
}
#endif

#ifdef FRAGMENT_SHADER
void main() {
    gl_FragColor = pack4(gl_FragCoord.z);
}
#endif