varying vec2 v_pos;

uniform mat4 u_projection_matrix;
uniform mat4 u_view_matrix;
uniform vec3 u_light_direction;

#ifdef VERTEX_SHADER
attribute vec2 a_pos;
void main() {
    v_pos = a_pos;
    gl_Position = u_projection_matrix * u_view_matrix * vec4(a_pos, 0.0, 1.0);
}
#endif

#ifdef FRAGMENT_SHADER
uniform vec4 u_color;
uniform vec4 u_zone_color;
uniform vec2 u_zone_center;
uniform float u_zone_inner_radius;
uniform float u_zone_outer_radius;
uniform sampler2D u_shadow_map;
uniform sampler2D u_texture;

float get_shadow_from(vec3 pos, sampler2D shadow_map) {
    float my_height = pos.z / 100.0;
    pos -= u_light_direction * pos.z / u_light_direction.z;
    vec4 screen_pos = u_projection_matrix * u_view_matrix * vec4(pos, 1.0);
    float height = unpack4(texture2D(shadow_map, screen_pos.xy / screen_pos.w / 2.0 + 0.5));
    if (my_height < height) {
        return 1.0;
    } else {
        return 0.0;
    }
}

void main() {
    float ambient = 0.8;
    float zone = clamp((length(v_pos - u_zone_center) - u_zone_inner_radius) / (u_zone_outer_radius - u_zone_inner_radius), 0.0, 1.0);
    zone = pow(zone, 0.3);
    float shadow = get_shadow_from(vec3(v_pos, 0.0), u_shadow_map);
    vec4 color = u_color * (texture2D(u_texture, v_pos / 128.0 / 5.0).x * 0.2 + 0.8);
    color = color * (1.0 - shadow) + color * ambient * shadow;
    gl_FragColor = color * (1.0 - zone) + zone * u_zone_color;
}
#endif