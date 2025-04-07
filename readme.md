# First Quarto Markdown
Luke Catalano

# 

``` r
set.seed(5630)
S = 500 # 500 repetitions

c <- numeric(S)

#different values of n
n_vals <- c(10, 100, 1000, 10000)

par(mfrow=c(2,2))
for(i in n_vals){
  for(j in 1:S){
    x <- rnorm(i, 2, 1) 
    c[j] <- mean(x)
  }
  hist(c, probability = TRUE,main=paste("n = ", i),sub=paste('mean = '
                    ,round(mean(c),5),' variance = ',round(var(c),4)))
  abline(v=mean(c), col='red')
} #O(n^2) complexity
```

![](stat155.markdown_strict_files/figure-markdown_strict/unnamed-chunk-1-1.png)

## Description

-   μ approaches 2 as n -\> ∞. The variance of our estimator approaches
    0 as n -\> ∞.
