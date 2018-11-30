
# WELCOME TO MY PROJECT PAGE!

An overview of the project: exploring the New York Citi Bike trip data occur during the first week of July 2018.

### Possible analysis /questions:
- How frequent does overtime usage occur?
- Users demographic.
- Is there a peek of usage during rush hours?
- What are the popular trips for non-subscribers vs subscribers?

### Dataset description:
- Citi Bike is New York's fast growing bike share system. First launched in 2013, it now has 750 stations across the boroughs more than 100,000 annual subscribers.
- The dataset is Citi Bike's trip history in the first week of July 2018.
- Source: the data was taken from Citi Bike System Data: https://www.citibikenyc.com/system-data

### Dataset Descriptive Statistics:
- Trip duration's sample mean = 19.58409 (minutes)
- Trip duration's sample standard deviation = 297.9729 (minutes)
- Users's birth year's sample mean = 1979.192
- Users's birth year's sample standard deviation = 11.72437 (year)
- Bike pick up time (hour of the day)'s sample mean = 14.32145
- Bike pick up time's sample standard deviation = 4.909375
- Bike drop off time (hour of the day)'s sample mean = 14.47061
- Bike drop off time 's sample standard deviation = 4.985676

### Graphs:

![alt text](https://raw.githubusercontent.com/Hana87NH/MAT327_Statistics/master/graphs/Hist_gender.png)

The gender data has left-skewed distribution and appear to be platykurtic.

![alt text](https://raw.githubusercontent.com/Hana87NH/MAT327_Statistics/master/graphs/CitiBike_hist_birthyear.png)
![alt text](https://raw.githubusercontent.com/Hana87NH/MAT327_Statistics/master/graphs/Boxplot_birthYear.png)


The birth year data also has left-skewed distribution but appear to be leptokurtic. 75% of the data are within 1955 and 2002. The data also seem to have many outliers.

![alt text](https://raw.githubusercontent.com/Hana87NH/MAT327_Statistics/master/graphs/Citibike_boxplot_tripduration.png)

The trip duration data have many outliers.

![alt text](https://raw.githubusercontent.com/Hana87NH/MAT327_Statistics/master/graphs/Hist_PU_time.png)

The pick up time data seem to be slightly left skewed

![alt text](https://raw.githubusercontent.com/Hana87NH/MAT327_Statistics/master/graphs/Hist_DO_time.png)

The pick up time data seem to be slightly left skewed

![alt text](https://raw.githubusercontent.com/Hana87NH/MAT327_Statistics/master/graphs/Pareto_Gender.png)

There are more male subcribers than female subcribers (given that nonsubcribers gender is unknown)

![alt text](https://raw.githubusercontent.com/Hana87NH/MAT327_Statistics/master/graphs/Pareto_UserTypes.png)

More than 75% users are subcribers vs less than 25% non-subcribers

### Confidence Intervals:
- Trip duration's mean 95 percent confidence interval: (1122.071,1228.020)
- User birthyear's mean 95 percent confidence interval: (1979.151,1979.227)
- Start time mean 95 percent confidence interval: (14.3069,14.3360)

### Hypothesis Tests:
**Test 1:**
- Null hypothesis: The mean of users tripduaration on Wednesday and Saturday are the same
- Test result:
```
Welch Two Sample t-test
data:  wednesday$tripduration and saturday$tripduration
t = -11.107, df = 105030, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval: (-1.2555904 -0.8789393)
sample estimates: mean of x mean of y (6.75485  17.82211)
```
- Conclusion: reject null hypothesis.

**Test 2:**
- Null hypothesis: The mean of pickup time on Monday and Sunday are the same
- Test result:
```
Welch Two Sample t-test
data:  monday$starttime and sunday$starttime
t = -0.55705, df = 97693, p-value = 0.5775
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval: (-0.07978044  0.04446794)
sample estimates: mean of x mean of y (14.15878  14.17644) 
```
- Conclusion: fail to reject null hypothesis

**Test 3:**
- Null hypothesis: The proportion of number of Non-Subcriber using bike on Wednesday and Saturday are the same
- Test result:
```
2-sample test for equality of proportions with continuity correction
data:  c(wed_numNon, sat_numNon) out of c(nrow(wednesday), nrow(saturday))
X-squared = 26.181, df = 1, p-value = 3.108e-07
alternative hypothesis: two.sided
95 percent confidence interval: (-0.019330399 -0.008621317)
sample estimates:
   prop 1    prop 2 
0.2681493 0.2821252 
```
- Conclusion: reject null hypothesis

### ANOVA Tests:
**Test 1:**
- Null hypothesis: the mean of tripduration on each day of the week are the same
- Test result:
```
Analysis of Variance Table
Response: tripduration
                Df   Sum Sq Mean Sq F value    Pr(>F)    
day.of.week      6  1106171  184362  986.67 < 2.2e-16 ***
Residuals   376026 70261265     187                      
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```
- Conclusion: reject null hypothesis

**Test 2:**
- Null hypothesis: the mean of pick up time on each day of the week are the same
- Test result:
```
Analysis of Variance Table

Response: starttime
                Df  Sum Sq Mean Sq F value    Pr(>F)    
day.of.week      6   58658  9776.4  399.32 < 2.2e-16 ***
Residuals   376026 9206038    24.5                      
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```
- Conclusion: reject null hypothesis
