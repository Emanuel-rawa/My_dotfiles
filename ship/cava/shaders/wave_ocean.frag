#version 330 core

in vec2 fragCoord;
out vec4 FragColor;

uniform float time;
uniform vec2 resolution;
uniform sampler2D spectrum;

void main() {
    vec2 uv = fragCoord / resolution;

    // onda senoidal horizontal
    float wave = sin((uv.x * 12.0) + (time * 2.0)) * 0.03;

    // distorção vertical
    uv.y += wave;

    float intensity = texture(spectrum, vec2(uv.x, 0.0)).r;

    vec3 deep = vec3(0.06, 0.12, 0.15);
    vec3 mid  = vec3(0.18, 0.35, 0.40);
    vec3 foam = vec3(0.85, 0.83, 0.78);

    vec3 color = mix(deep, mid, intensity);
    color = mix(color, foam, pow(intensity, 3.0));

    FragColor = vec4(color, 1.0);
}
