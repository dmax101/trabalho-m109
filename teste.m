clear
pkg load statistics
y = [16,14,12,13,10,13,17,14,11,13,17,14,16,11,15,15,13,18,12,15,15,16,12,14,14,16,15,14,13,12]

m = mean(y)
s = std(y, 0)

[pval, ks] = kolmogorov_smirnov_test(y, 'norm', m, s, "<>")