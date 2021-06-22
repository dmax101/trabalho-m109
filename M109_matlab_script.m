%% *Implementação do teste Kolmogorov-Smirnov*
% % 
% *    Alunos:*
%% 
% * 1411 - Danilo Vidal Ribeiro
% * 1354 - Luana Gribel Ito
%% *Amostras para o exercício 7.32 - (sample75)*
fprintf('-----------------------\n')
fprintf('EXERCICIO 7.32\n')
fprintf('-----------------------\n')
samples = [16, 14, 12, 13, 10, 13, 17, 14, 11, 13, 17, 14, 16, 11, 15, 15, 13, 18, 12, 15, 15, 16, 12, 14, 14, 16, 15, 14, 13, 12];
significancia = 0.150;
%%
m = mean(samples);
s = std(samples);
l = length(samples);
%%
x = (samples - m) / s;
%%
[h,p,ksstat,cv] = kstest(x,"Alpha",significancia);
fprintf('-----------------------\n')
fprintf('Mean: %6.2f\n', m)
fprintf('StDev: %6.3f\n', s)
fprintf('N: %i\n', length(samples))
fprintf('KS: %6.3f\n', ksstat)
if(p >= significancia)
    fprintf('P-Value: > %6.3f\n', significancia)
elseif (p < significancia)
    fprintf('P-Value: < %6.3f\n', significancia)
end
fprintf('P-Value: %6.3f\n', p)
fprintf('-----------------------\n')
if(h == 0)
    fprintf('H%i: A amostra apresenta normalidade em suas distribuições\n', h)
elseif(h == 1)
    fprintf('H%i: A amostra NÃO apresenta normalidade em suas distribuições\n', h)
end
fprintf('Nível de significância: %6.2f porcento%\n', significancia * 100)
fprintf('-----------------------\n')
%%
figure
hold on
histogram(samples,9)
title("Histogram")
xlabel("Hours")
ylabel("Frequency")
%%
figure
hold on
normplot(samples)
title("Probability Plot of Hours")
xlabel("Hours")
ylabel("Probability")

%% *Amostras para o exercício 7.33 - (sample76)*
fprintf('-----------------------\n')
fprintf('EXERCICIO 7.33\n')
fprintf('-----------------------\n')
samples = [18, 17, 17, 16, 16, 16, 18, 16, 14, 11, 16, 12, 17, 18, 17, 18, 18, 16, 18, 18, 11, 13, 17, 17, 17, 15, 16, 17, 15, 10];
significancia = 0.150;
%%
m = mean(samples);
s = std(samples);
l = length(samples);
%%
x = (samples - m) / s;
%%
[h,p,ksstat,cv] = kstest(x,"Alpha",significancia);
fprintf('-----------------------\n')
fprintf('Mean: %6.2f\n', m)
fprintf('StDev: %6.3f\n', s)
fprintf('N: %i\n', length(samples))
fprintf('KS: %6.3f\n', ksstat)
if(p >= significancia)
    fprintf('P-Value: > %6.3f\n', significancia)
elseif (p < significancia)
    fprintf('P-Value: < %6.3f\n', significancia)
end
fprintf('P-Value: %6.3f\n', p)
fprintf('-----------------------\n')
if(h == 0)
    fprintf('H%i: A amostra apresenta normalidade em suas distribuições\n', h)
elseif(h == 1)
    fprintf('H%i: A amostra NÃO apresenta normalidade em suas distribuições\n', h)
end
fprintf('Nível de significância: %6.2f porcento%\n', significancia * 100)
fprintf('-----------------------\n')
%%
figure
hold on
histogram(samples,9)
title("Histogram")
xlabel("Hours")
ylabel("Frequency")
%%
figure
hold on
normplot(samples)
title("Probability Plot of Hours")
xlabel("Hours")
ylabel("Probability")