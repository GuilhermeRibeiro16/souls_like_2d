//profundidade
depth = -y;
//recuperando poise
poise = min(poise_max, poise + poise_max * 0.001);
//nao roda o estado
if (gerado) exit;
//rodando estado
roda_estado();