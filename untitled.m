encrypt = [0.0623, 0.1407, 0.2500, 0.3435, 0.5928, 1.0490];
decrypt = [0.0627, 0.1561, 0.2342, 0.3750, 0.5779, 1.0622];
size = [1.73, 4.53, 7.30, 11, 17.70, 31.2];
throughput_encrypt = size ./ encrypt;
throughput_decrypt = size ./ decrypt;

figure();
plot(size, throughput_encrypt, 'LineWidth', 5);
title('Throughput vs size');
xlabel('Size [KB]');
ylabel('Throughput [KB/s]');
hold on
plot(size, throughput_decrypt, 'LineWidth', 5);
legend("encrypt", "desencrypt");
