// Verifica se a tecla de mover para frente está pressionada (W ou seta para cima)
if (keyboard_check(vk_up)) {
    speed += acceleration; // Acelera a nave
}

// Verifica se a tecla de mover para trás está pressionada (S ou seta para baixo)
if (keyboard_check(vk_down)) {
    //speed -= acceleration; // Acelera para trás (reversa)
	speed -= acceleration;
}

// Limita a velocidade para a velocidade máxima
if (speed > max_speed) {
    speed = max_speed;
} else if (speed < -max_speed) {
    speed = -max_speed;
}

// Limita a velocidade reversa para a velocidade máxima reversa
if (speed < max_reverse_speed) {
    speed = max_reverse_speed;
}

// Aplica a desaceleração quando nenhuma tecla está pressionada
if (!keyboard_check(vk_up) && !keyboard_check(vk_down)) {
    if (abs(speed) > friction) {
        speed -= sign(speed) * friction; // Reduz a velocidade gradualmente
    } else {
        speed = 0; // Para completamente quando a velocidade for baixa
    }
}

// Muda a direção da nave (A e D ou setas esquerda/direita)
if (keyboard_check(vk_left)) {
    direction += 4; // Gira a nave para a esquerda
}

if (keyboard_check(vk_right)) {
    direction -= 4; // Gira a nave para a direita
}

// Atualiza o ângulo da sprite com base na direção da nave
image_angle = direction - 90;

// Aplica o movimento da nave de acordo com a velocidade e direção
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Calcula o movimento desejado baseado na velocidade e direção atuais
var _new_x = x + lengthdir_x(speed, direction); // Calcula a nova posição em X
var _new_y = y + lengthdir_y(speed, direction); // Calcula a nova posição em Y

// Atualizar a posição da nave
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Verifica se a nova posição colidiria com um objeto sólido
if (!place_meeting(_new_x, _new_y, all)) {
    // Se não houver colisão, mova a nave
    x = _new_x;
    y = _new_y;
} else {
	// Se houver colisão, pare a nave
     move_bounce_solid(true); 
		 
}
// Redirecionar a nave
if (!place_meeting(_new_x, _new_y, obj_colider_redirector)) {
    // Se não houver colisão, mova a nave
    x = _new_x;
    y = _new_y;
} else {
    // Se houver colisão, redirecione a nave
	direction = direction + 90
}

