import pprint as pp
import pandas as pd
from pathlib import Path
from scipy import stats
import numpy as np
import matplotlib.pyplot as plt
import math
from collections import Counter

def main():
    path = Path("doc", "table75.csv")
    table = pd.read_csv(path, header=None)
    samples = table[0].values

    bins = 9 # 9

    res = stats.cumfreq(samples, numbins=bins)

    x = res.lowerlimit + np.linspace(
        0,
        res.binsize * res.cumcount.size,
        res.cumcount.size
    )

    fig = plt.figure(figsize=(10, 4))
    ax1 = fig.add_subplot(1, 2, 1)
    ax2 = fig.add_subplot(1, 2, 2)
    ax1.hist(samples, bins=bins)

    mu = samples.mean(axis=0)
    std = samples.std(axis=0)
    xmin, xmax = plt.xlim()
    p = stats.norm.pdf(x, mu, std)

    freq = math.ceil(Counter(samples).most_common(1)[0][1] / p.max())

    ax1.plot(x, p * freq, 'r', linewidth=1)

    ax1.set_title('Histogram')

    # ax2.bar(x, (res.cumcount / len(samples)) * 100, width=res.binsize)
    ax2.scatter(x, (res.cumcount / len(samples)) * 100)
    
    ax2.set_title('Cumulative histogram')
    ax2.set_xlim([x.min(), x.max()])
    # ax2.set_ylim([0,100])

    plt.show()

    media = samples.mean(axis=0)
    std_dev = samples.std(axis=0)
    n = len(samples)
    statistic, pvalue = stats.kstest(
        samples,
        'norm',
        args=(media, std_dev),
        N=n,
        alternative='two-sided',
    )

    print(50 * "-")
    print("Estatísticas")
    print(50 * "-")
    print("Média: {:.3f}".format(media))
    print("Desvio Padrão: {:.3f}".format(std_dev))
    print("N: {}".format(n))
    print("KS: {:.3f}".format(statistic))
    print("P-Value: {:.3f}".format(pvalue))

if __name__ == '__main__':
    main()