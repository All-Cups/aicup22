varying vec2 v_vt;
varying float v_diffuse;
varying float v_zone;
varying vec3 v_pos;
varying vec4 v_color;

uniform mat4 u_projection_matrix;
uniform mat4 u_view_matrix;
uniform vec3 u_light_direction;

float fromLinear(float x) {
    if (x > 0.0031308) {
        return 1.055 * pow(x, 1.0 / 2.4) - 0.055;
    } else {
        return x * 12.92;
    }
}

float toLinear(float x) {
    if (x > 0.04045) {
        return pow((x + 0.055) / 1.055, 2.4);
    } else {
        return x / 12.92;
    }
}

// Converts a color from linear light gamma to sRGB gamma
vec4 fromLinear(vec4 color)
{
    return vec4(fromLinear(color.x), fromLinear(color.y), fromLinear(color.z), color.w);
}

// Converts a color from sRGB gamma to linear light gamma
vec4 toLinear(vec4 color)
{
    return vec4(toLinear(color.x), toLinear(color.y), toLinear(color.z), color.w);
}

#ifdef VERTEX_SHADER
attribute vec3 a_v;
attribute vec3 a_vn;
attribute vec2 a_vt;
attribute mat4 i_model_matrix;
attribute vec4 i_color;
uniform vec2 u_zone_center;
uniform float u_zone_inner_radius;
uniform float u_zone_outer_radius;
void main() {
    v_vt = a_vt;
    v_color = i_color;
    v_diffuse = max(a_vn.y, 0.0);
    vec4 pos = i_model_matrix * vec4(a_v.x, a_v.z, a_v.y, 1.0);
    v_pos = pos.xyz;
    v_zone = clamp((length(pos.xy - u_zone_center) - u_zone_inner_radius) / (u_zone_outer_radius - u_zone_inner_radius), 0.0, 1.0);
    gl_Position = u_projection_matrix * u_view_matrix * pos;
}
#endif

#ifdef FRAGMENT_SHADER
uniform sampler2D u_texture;
uniform vec4 u_ambient_color;
uniform vec4 u_diffuse_color;
uniform vec4 u_zone_color;
uniform sampler2D u_shadow_map;

float get_shadow_from(vec3 pos, sampler2D shadow_map) {
    float my_height = pos.z / 100.0;
    pos -= u_light_direction * pos.z / u_light_direction.z;
    vec4 screen_pos = u_projection_matrix * u_view_matrix * vec4(pos, 1.0);
    float height = unpack4(texture2D(shadow_map, screen_pos.xy / screen_pos.w / 2.0 + 0.5));
    if (my_height + 1e-3 < height) {
        return 1.0;
    } else {
        return 0.0;
    }
}

void main() {
    float ambient = 0.8;
    float diffuse = (1.0 - ambient) * v_diffuse;
    vec4 diffuse_color = fromLinear(u_diffuse_color);
    vec4 light_color = diffuse_color * diffuse + diffuse_color * ambient; // + u_ambient_color * ambient;
    float shadow = get_shadow_from(v_pos, u_shadow_map) * 0.5;
    light_color = light_color * (1.0 - shadow) + diffuse_color * ambient * shadow;
    gl_FragColor = texture2D(u_texture, v_vt) * vec4(vec3(light_color), 1.0) * (1.0 - v_zone) + v_zone * u_zone_color;
    // gl_FragColor.w = 1.0;
    gl_FragColor *= v_color;
}
#endif