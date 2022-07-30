varying vec2 v_vt;

#ifdef VERTEX_SHADER
attribute vec2 a_vt;
attribute vec2 a_pos;
void main() {
    v_vt = a_vt;
    gl_Position = vec4(a_pos, 0.0, 1.0);
}
#endif

#ifdef FRAGMENT_SHADER
uniform sampler2D u_texture;
uniform vec4 u_color;
void main() {
    gl_FragColor = texture2D(u_texture, v_vt) * u_color;
}
#endif