**Results:**

- **Data Preparation and Diagnostics**

The raw dataset revealed severe skewness and kurtosis, especially in
FDI, public debt, and inflation. These distributions risked biasing
regression estimates. To correct this, logarithmic transformations were
applied, which normalized most variables. Winsorization further
mitigated the impact of extreme outliers. Scatterplots and correlation
matrices confirmed intuitive relationships: GDP and trade openness were
positively correlated with FDI, while inflation and debt showed negative
associations. Importantly, inflation (proxied by GDP deflator) and
public debt were found to be almost perfectly correlated (correlation ≈
0.99), raising concerns of multicollinearity. To address this, inflation
was excluded from the final regression models.

**Descriptive Statistics**

+:----------------+:----------------+:----------------+:----------------+:----------------+:----------------+:----------------+:----------------+:----------------+:----------------+
| Variables       | Obs             | Mean            | Std. Dev.       | Min             | Max             | p1              | p99             | Skew.           | Kurt.           |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| FDI             | 675             | 13.03           | 56.561          | -444.70         | 452.221         | -41.65          | 307.087         | 3.214           | 37.24           |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| GDP gro         | 675             | 2.465           | 3.836           | -16.04          | 24.616          | -8.868          | 12.632          | -.243           | 7.465           |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| Inf             | 675             | 3.166           | 3.742           | -9.899          | 43.181          | -1.96           | 16.015          | 4.151           | 35.992          |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| Pub Debt        | 675             | 1460000         | 5480000         | 315.6           | 59875234        | 640.1           | 29972179        | 6.833           | 56.1            |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| Trade op        | 675             | 120.069         | 59.849          | 45.141          | 412.177         | 47.894          | 361.865         | 1.802           | 7.752           |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| Unemp-Rate      | 675             | 8.235           | 4.238           | 1.805           | 27.686          | 2.472           | 24.441          | 1.53            | 5.835           |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| Poli Stability  | 675             | .764            | .393            | -.475           | 1.759           | -.236           | 1.638           | -.124           | 3.101           |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
|                                                                                                                                                                                   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

This table provides a summary of the untransformed variables. It\'s
crucial for understanding the raw data before applied any
transformations. All variables have 675 observations, confirming that
dataset is complete and balanced, with no missing values for the
selected variables. It clearly shows that most of variables had
problematic distributions with extreme skewness and kurtosis. It proves
that data cleaning steps (like winsorization and log transformations)
are necessary. The high skewness and kurtosis values for most variables,
especially public debt and inflation, confirm that they contained
extreme outliers that would have biased results if hadn\'t treated them.

**Descriptive Statistics**

+:---------------+:---------------+:---------------+:---------------+:---------------+:---------------+:---------------+:---------------+:---------------+:---------------+
| Variables      | Obs            | Mean           | Std. Dev.      | Min            | Max            | p1             | p99            | Skew.          | Kurt.          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log fdi        | 675            | .679           | .633           | -2.819         | 2.655          | -.897          | 2.533          | -.095          | 6.945          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log gdp        | 675            | .41            | .397           | -1.368         | 1.391          | -1.01          | 1.101          | -1.145         | 5.222          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log gdpdef     | 675            | .701           | .093           | .398           | .891           | .448           | .874           | -.573          | 2.811          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log pd         | 675            | 5.137          | 1.042          | 2.499          | 7.777          | 2.806          | 7.477          | -.124          | 2.404          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log to         | 675            | 2.035          | .193           | 1.655          | 2.615          | 1.68           | 2.559          | .336           | 2.806          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log unemp      | 675            | .866           | .206           | .256           | 1.442          | .393           | 1.388          | .142           | 3.008          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log polstb     | 675            | -.179          | .304           | -2.44          | .245           | -1.44          | .214           | -2.546         | 14.185         |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
|                                                                                                                                                                         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

By comparing this table to the previous one for the raw variables, it
can be seen that the transformations successfully addressed the high
skewness and kurtosis that were present in raw data.

The most dramatic improvement is seen in log_pd, log_to, and log_fdi.
The skewness values for these variables are now much closer to zero, and
the kurtosis values are much closer to 3 (which is the value for a
normal distribution). This confirms that transformations successfully
normalized these variables, making them suitable for a linear regression
model.

The only variable that still shows significant skewness and kurtosis is
log_polstb (Political Stability). While the transformation helped, the
high skewness (-2.546) and kurtosis (14.185) indicate that this variable
remains the most non-normal in dataset.

In summary, this table provides powerful evidence that data cleaning and
transformation steps were successful. The new, normalized variables are
now much better suited to meet the assumptions of a linear regression
model, which improves the reliability of findings.

**Descriptive Statistics**

+:---------------+:---------------+:---------------+:---------------+:---------------+:---------------+:---------------+:---------------+:---------------+:---------------+
| Variables      | Obs            | Mean           | Std. Dev.      | Min            | Max            | p1             | p99            | Skew.          | Kurt.          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log fdi        | 675            | .685           | .513           | -.186          | 1.843          | -.186          | 1.843          | .521           | 2.828          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log gdp        | 675            | .42            | .341           | -.359          | .914           | -.359          | .914           | -.631          | 2.694          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log gdpdef     | 675            | .701           | .093           | .398           | .891           | .448           | .874           | -.573          | 2.811          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log pd         | 675            | 5.137          | 1.042          | 2.499          | 7.777          | 2.806          | 7.477          | -.124          | 2.404          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log to         | 675            | 2.035          | .193           | 1.655          | 2.615          | 1.68           | 2.559          | .336           | 2.806          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log unemp      | 675            | .866           | .206           | .256           | 1.442          | .393           | 1.388          | .142           | 3.008          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
| log polstb     | 675            | -.161          | .227           | -.7            | .153           | -.7            | .153           | -.755          | 2.841          |
+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+
|                                                                                                                                                                         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

This table is a final, visual, and statistical confirmation that data
cleaning process was successful. The winsorization has effectively
addressed the outliers in log_fdi, log_gdp, and log_polstb, leaving a
clean and well-prepared dataset for a robust regression analysis.

The graphs show that the distributions are now **approximately normal**.
The bars of the histogram closely follow the shape of the superimposed
normal curve. It visually confirms that log transformation and
winsorization successfully normalized the highly skewed distribution of
the original variables.

![](media/image1.png){width="4.947916666666667in"
height="3.6041666666666665in"}

![](media/image2.png){width="4.947916666666667in"
height="3.6041666666666665in"}

![](media/image3.png){width="4.947916666666667in"
height="3.6041666666666665in"}

![](media/image4.png){width="4.947916666666667in"
height="3.6041666666666665in"}

![](media/image5.png){width="4.249810804899387in"
height="3.095651793525809in"}

![](media/image6.png){width="4.947916666666667in"
height="3.6041666666666665in"}

![](media/image7.png){width="4.747825896762905in"
height="3.1033770778652667in"}

**Interpretation of the Scatter Plot**

![](media/image8.png){width="4.947916666666667in"
height="3.6041666666666665in"}

Scatter plot is a powerful visual tool used to understand the
relationship between two of key variables, log_fdi and log_gdp.

- **X-Axis:** This represents independent variable, **log_gdp**.

- **Y-Axis:** This represents dependent variable, **log_fdi.**

The primary purpose of creating this plot is to **visually check the
relationship** between these two variables before running a regression.

The plot shows a clear **positive relationship** between log_fdi and
log_gdp. As the value of log_gdp increases (indicating a larger
economy), the value of log_fdi also tends to increase.

The points are somewhat dispersed, which suggests a **moderate positive
relationship**, but the upward trend is undeniable. This visual finding
is consistent with the positive correlation coefficient of **0.2804**
found in correlation matrix. It also confirms that a linear model is an
appropriate way to analyze this relationship.

![](media/image9.png){width="4.947916666666667in"
height="3.6041666666666665in"}

The plot shows a **clear negative relationship**. As the value of
log_gdpdef increases (indicating higher inflation), the value of log_fdi
tends to decrease. The points are moderately dispersed, which suggests a
**moderate negative relationship**. This visual finding is consistent
with the negative correlation coefficient of **-0.2797** that found in
correlation matrix.

![](media/image10.png){width="4.947916666666667in"
height="3.6041666666666665in"}

![](media/image11.png){width="4.947916666666667in"
height="3.6041666666666665in"}

The plot shows a **clear and strong positive relationship** between the
two variables. As a country\'s trade openness increases, its FDI tends
to increase significantly as well. The points are relatively tightly
clustered around a clear upward trend, which visually confirms the
strong association. This visual finding is consistent with the high
positive correlation coefficient of **0.6023** that is found in the
correlation matrix.

![](media/image12.png){width="4.947916666666667in"
height="3.6041666666666665in"}

The plot shows a **weak negative relationship** between the two
variables. As the unemployment rate increases, FDI tends to slightly
decrease. However, the points are very widely dispersed, suggesting that
the relationship is not very strong.

The logic behind the weak negative relationship between Foreign Direct
Investment (FDI) and Unemployment is rooted in a foreign investor\'s
assessment of a country\'s economic health and risk.

- **Indicator of a Weak Economy:** High unemployment rates are often a
  sign of a struggling or stagnant economy. Foreign investors are
  seeking profitable opportunities, and a weak economy implies lower
  consumer demand, which can limit potential returns.

- **Reduced Market Potential:** A large unemployed population translates
  to less disposable income and reduced purchasing power within the
  domestic market. This makes the country a less attractive target for
  FDI, particularly for investments in consumer-facing industries.

- **Signal of Instability:** Persistently high unemployment can be a
  precursor to social unrest or political instability, which increases
  the risk for foreign investors.

While the correlation is negative as expected, it is relatively weak
because unemployment is just one of many factors that influence an
investor\'s decision. Other factors, such as market size (log_gdp),
trade openness (log_to), and public debt (log_pd), often have a more
direct and significant impact, as confirmed by final regression results.

![](media/image13.png){width="4.947916666666667in"
height="3.6041666666666665in"}

The plot shows a **weak positive relationship** between the two
variables. As the political stability index increases, FDI tends to
slightly increase. However, the points are very widely dispersed,
suggesting that the relationship is not very strong.

![](media/image14.png){width="4.947916666666667in"
height="3.6041666666666665in"}

This box plot is a perfect visual representation of data after all the
transformations and winsorization have been applied. The x-axis lists
the independent and dependent variables from model: FDI, Public Debt,
GDP, Trade Openness, Unemployment, and Political Stability. The y-axis
shows the **standardized scale** of each variable, with a mean of zero.
This is a critical point: it allows to directly compare the
distributions of all variables on the same scale, regardless of their
original units.

This type of plot is created as a final diagnostic tool to **visually
confirm the success of data cleaning process**. After performing
logarithmic transformations and winsorization to handle skewness,
kurtosis, and outliers.

The most important finding is that there are **no outliers** (dots or
asterisks) outside of the whiskers for any of the variables. This
visually confirms that winsorization process was highly successful in
capping the extreme values, creating a clean dataset.

The boxes and whiskers for all variables are now well-contained,
symmetrical, and centered around a mean of zero.

The plot shows that GDP and Trade Openness have the most compact
distributions, indicating less variation within the sample. FDI and
Political Stability have a slightly wider range, suggesting more
inherent variation.

**Pairwise correlations**

+:--------------+:--------------+:--------------+:--------------+:--------------+:--------------+:--------------+:--------------+
| Variables     | \(1\)         | \(2\)         | \(3\)         | \(4\)         | \(5\)         | \(6\)         | \(7\)         |
+---------------+---------------+---------------+---------------+---------------+---------------+---------------+---------------+
| \(1\) log_fdi | 1.000         |               |               |               |               |               |               |
+---------------+---------------+---------------+---------------+---------------+---------------+---------------+---------------+
| \(2\) log_gdp | 0.280\*       | 1.000         |               |               |               |               |               |
+---------------+---------------+---------------+---------------+---------------+---------------+---------------+---------------+
| \(3\)         | -0.280\*      | -0.340\*      | 1.000         |               |               |               |               |
| log_gdpdef    |               |               |               |               |               |               |               |
+---------------+---------------+---------------+---------------+---------------+---------------+---------------+---------------+
| \(4\) log_pd  | -0.264\*      | -0.323\*      | 0.992\*       | 1.000         |               |               |               |
+---------------+---------------+---------------+---------------+---------------+---------------+---------------+---------------+
| \(5\) log_to  | 0.602\*       | 0.252\*       | -0.391\*      | -0.379\*      | 1.000         |               |               |
+---------------+---------------+---------------+---------------+---------------+---------------+---------------+---------------+
| \(6\)         | -0.225\*      | -0.123\*      | -0.079\*      | -0.087\*      | -0.378\*      | 1.000         |               |
| log_unemp     |               |               |               |               |               |               |               |
+---------------+---------------+---------------+---------------+---------------+---------------+---------------+---------------+
| \(7\)         | 0.235\*       | 0.063         | -0.088\*      | -0.083\*      | 0.403\*       | -0.367\*      | 1.000         |
| log_polstb    |               |               |               |               |               |               |               |
+---------------+---------------+---------------+---------------+---------------+---------------+---------------+---------------+
| *\*\*\* p\<0.01, \*\* p\<0.05, \* p\<0.1*                                                                                     |
+-------------------------------------------------------------------------------------------------------------------------------+

This table shows the pairwise correlation coefficients between key
variables. Each value represents the strength and direction of the
linear relationship between two variables. An asterisk \* indicates that
the correlation is statistically significant at the 5% level.

- **Positive and Significant Relationships**:

  - **log_to (Trade Openness)**: This variable has the strongest
    positive correlation with FDI (**0.6023**). This indicates that
    countries with more open economies tend to attract significantly
    more FDI.

  - **log_gdp (GDP)**: There is a positive correlation of **0.2804**,
    suggesting that countries with a larger economic output also attract
    more FDI.

  - **log_polstb (Political Stability)**: There is a positive
    correlation of **0.2349**, suggesting that politically stable
    countries tend to receive more FDI.

- **Negative and Significant Relationships**:

  - **log_gdpdef (GDP Deflator)**: There is a negative correlation of
    **-0.2797**. This suggests that as a country\'s price level (a proxy
    for inflation) rises, FDI tends to decrease.

  - **log_pd (Public Debt)**: There is a negative correlation of
    **-0.2640**, indicating that higher levels of public debt are
    associated with lower FDI.

  - **log_unemp (Unemployment Rate)**: There is a negative correlation
    of **-0.2249**, suggesting that as unemployment rises, FDI tends to
    fall.

**Multicollinearity Warning**

- **log_gdpdef and log_pd**: The correlation between these two variables
  is **extremely high at 0.9920**. This is a major finding and a
  significant red flag. It indicates severe **multicollinearity**,
  meaning these two variables are almost perfectly correlated. Including
  both in the same regression model would make it difficult to
  distinguish their individual effects and could lead to unreliable and
  inflated standard errors. So, log_gdpdef is dropped.

- **Pairwise correlations**

+:----------------+:----------------+:----------------+:----------------+:----------------+:----------------+:----------------+
| Variables       | \(1\)           | \(2\)           | \(3\)           | \(4\)           | \(5\)           | \(6\)           |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(1\) log_fdi   | 1.000           |                 |                 |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(2\) log_gdp   | 0.280\*         | 1.000           |                 |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(3\) log_pd    | -0.264\*        | -0.323\*        | 1.000           |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(4\) log_to    | 0.602\*         | 0.252\*         | -0.379\*        | 1.000           |                 |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(5\) log_unemp | -0.225\*        | -0.123\*        | -0.087\*        | -0.378\*        | 1.000           |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(6\)           | 0.235\*         | 0.063           | -0.083\*        | 0.403\*         | -0.367\*        | 1.000           |
| log_polstb      |                 |                 |                 |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| *\*\*\* p\<0.01, \*\* p\<0.05, \* p\<0.1*                                                                                   |
+-----------------------------------------------------------------------------------------------------------------------------+

**Pairwise correlations**

+:----------------+:----------------+:----------------+:----------------+:----------------+:----------------+:----------------+
| Variables       | \(1\)           | \(2\)           | \(3\)           | \(4\)           | \(5\)           | \(6\)           |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(1\) log_fdi   | 1.000           |                 |                 |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(2\) log_gdp   | 0.280\*         | 1.000           |                 |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(3\) log_pd    | -0.264\*        | -0.323\*        | 1.000           |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(4\) log_to    | 0.602\*         | 0.252\*         | -0.379\*        | 1.000           |                 |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(5\) log_unemp | -0.225\*        | -0.123\*        | -0.087\*        | -0.378\*        | 1.000           |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| \(6\)           | 0.235\*         | 0.063           | -0.083\*        | 0.403\*         | -0.367\*        | 1.000           |
| log_polstb      |                 |                 |                 |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+-----------------+
| *\*\*\* p\<0.01, \*\* p\<0.05, \* p\<0.1*                                                                                   |
+-----------------------------------------------------------------------------------------------------------------------------+

+:--------------+:--------------+:--------------+:--------------+:--------------+:--------------+:--------------+:--------------+:--------------+:--------------+:--------------+:--------------+
| log_fdi       | Coef.                         | St.Err.       | t-value                       | p-value       | \[95% Conf                    | Interval\]                    | Sig           |
+---------------+-------------------------------+---------------+-------------------------------+---------------+-------------------------------+-------------------------------+---------------+
| log_gdp       | .206                          | .049          | 4.17                          | 0             | .109                          | .303                          | \*\*\*        |
+---------------+-------------------------------+---------------+-------------------------------+---------------+-------------------------------+-------------------------------+---------------+
| log_pd        | -.002                         | .017          | -0.10                         | .919          | -.036                         | .033                          |               |
+---------------+-------------------------------+---------------+-------------------------------+---------------+-------------------------------+-------------------------------+---------------+
| log_to        | 1.514                         | .102          | 14.80                         | 0             | 1.313                         | 1.715                         | \*\*\*        |
+---------------+-------------------------------+---------------+-------------------------------+---------------+-------------------------------+-------------------------------+---------------+
| log_unemp     | .015                          | .088          | 0.17                          | .864          | -.158                         | .188                          |               |
+---------------+-------------------------------+---------------+-------------------------------+---------------+-------------------------------+-------------------------------+---------------+
| log_polstb    | -.004                         | .078          | -0.05                         | .963          | -.157                         | .15                           |               |
+---------------+-------------------------------+---------------+-------------------------------+---------------+-------------------------------+-------------------------------+---------------+
| Constant      | -2.487                        | .297          | -8.36                         | 0             | -3.071                        | -1.903                        | \*\*\*        |
+---------------+-------------------------------+---------------+-------------------------------+---------------+-------------------------------+-------------------------------+---------------+
|                                                                                                                                                                                               |
+-------------------------------+-----------------------------------------------+-----------------------------------------------+-------------------------------+---------------+---------------+
| Mean dependent var            | 0.685                                         | SD dependent var                              | 0.513                         |               |               |
+-------------------------------+-----------------------------------------------+-----------------------------------------------+-------------------------------+---------------+---------------+
| R-squared                     | 0.381                                         | Number of obs                                 | 675                           |               |               |
+-------------------------------+-----------------------------------------------+-----------------------------------------------+-------------------------------+---------------+---------------+
| F-test                        | 82.197                                        | Prob \> F                                     | 0.000                         |               |               |
+-------------------------------+-----------------------------------------------+-----------------------------------------------+-------------------------------+---------------+---------------+
| Akaike crit. (AIC)            | 702.432                                       | Bayesian crit. (BIC)                          | 729.521                       |               |               |
+-------------------------------+-----------------------------------------------+-----------------------------------------------+-------------------------------+---------------+---------------+
| *\*\*\* p\<.01, \*\* p\<.05, \* p\<.1*                                                                                                                                                        |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                                                                                                                               |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

This output presents the results of a simple Ordinary Least Squares
(OLS) regression, which pools all data together and does not account for
the country-specific fixed effects.

- **F(5, 669) = 82.20 & Prob \> F = 0.0000**: The F-statistic is highly
  significant, meaning that independent variables, as a group, have a
  statistically significant effect on the variation in FDI.

- **R-squared = 0.3805**: This indicates that approximately **38%** of
  the variation in FDI is explained by the independent variables in this
  simple model.

**Coefficients and Statistical Significance**

- **log_gdp**: The coefficient of **0.2057** is positive and highly
  significant (p-value \< 0.001).

- **log_to**: The coefficient of **1.5140** is also positive and highly
  significant (p-value \< 0.001). The large t-statistic of 14.80
  indicates a very strong relationship, suggesting that trade openness
  is a powerful determinant of FDI.

- **log_pd, log_unemp, and log_polstb**: The coefficients for public
  debt, unemployment, and political stability are **not statistically
  significant** in this model (p-values of 0.919, 0.864, and 0.963,
  respectively).

**Variance inflation factor**

  ----------------------- ----------------------- -----------------------
                          VIF                     1/VIF

  log to                  1.6                     .625

  log pd                  1.36                    .735

  log unemp               1.353                   .739

  log polstb              1.28                    .781

  log gdp                 1.158                   .864

  Mean VIF                1.35                    .
  ----------------------- ----------------------- -----------------------

This table shows the Variance Inflation Factor (VIF) for the independent
variables in regression model. The VIF is a measure of
multicollinearity, which is the degree to which an independent variable
is linearly related to other independent variables. A VIF value greater
than 5 (and certainly greater than 10) is typically a cause for concern,
as it indicates that the coefficient\'s standard error is being inflated
due to multicollinearity. This can make the coefficient\'s significance
unreliable. All of the VIF values in this table are very low. The
highest value is **1.61** for log_to, which is well below the common
threshold of 5. The mean VIF is also very low at **1.36**.

**Heterogeneity:**

Breusch-Pagan / Cook-Weisberg test for heteroskedasticity\
Ho: Constant variance\
Variables: fitted values of log_fdi\
chi2(1) = 24.66\
Prob \> chi2 = 0.0000\
This output shows the results of the Breusch-Pagan / Cook-Weisberg test
for heteroskedasticity.

- **Null Hypothesis (H0​)**: The test assumes that the variance of the
  residuals is constant (homoskedasticity).

- **P-value**: The Prob \> chi2 is the p-value, which is **0.0000**.

Since the p-value is less than 0.05, **reject the null hypothesis of
constant variance**.

**Conclusion:** The test indicates that model has a significant problem
with **heteroskedasticity**. This means the standard errors from a
standard OLS regression would be biased and unreliable. This finding
justifies use of the vce(robust) option in xtreg command, which
correctly handles this issue and provides reliable standard errors and
p-values.

**Autocorrelation:**

**Linear regression**

+---------------+---------------+--------------:+--------------:+--------------:+--------------:+--------------:+--------------:+--------------:+--------------:+--------------:+--------------:+
| e             | Coef.                         | St.Err.       | t-value                       | p-value       | \[95% Conf                    | Interval\]                    | Sig           |
+---------------+-------------------------------+---------------+-------------------------------+---------------+-------------------------------+-------------------------------+---------------+
| e_lag         | .707                          | .027          | 25.85                         | 0             | .653                          | .76                           | \*\*\*        |
+---------------+-------------------------------+---------------+-------------------------------+---------------+-------------------------------+-------------------------------+---------------+
| Constant      | -.005                         | .012          | -0.37                         | .708          | -.028                         | .019                          |               |
+---------------+-------------------------------+---------------+-------------------------------+---------------+-------------------------------+-------------------------------+---------------+
|                                                                                                                                                                                               |
+-------------------------------+-----------------------------------------------+-----------------------------------------------+-------------------------------+---------------+---------------+
| Mean dependent var            | -0.003                                        | SD dependent var                              | 0.440                         |               |               |
+-------------------------------+-----------------------------------------------+-----------------------------------------------+-------------------------------+---------------+---------------+
| R-squared                     | 0.508                                         | Number of obs                                 | 648                           |               |               |
+-------------------------------+-----------------------------------------------+-----------------------------------------------+-------------------------------+---------------+---------------+
| F-test                        | 668.051                                       | Prob \> F                                     | 0.000                         |               |               |
+-------------------------------+-----------------------------------------------+-----------------------------------------------+-------------------------------+---------------+---------------+
| Akaike crit. (AIC)            | 317.136                                       | Bayesian crit. (BIC)                          | 326.083                       |               |               |
+-------------------------------+-----------------------------------------------+-----------------------------------------------+-------------------------------+---------------+---------------+
| *\*\*\* p\<.01, \*\* p\<.05, \* p\<.1*                                                                                                                                                        |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Based on the regression of the residuals on their lagged values, there
is clear evidence of **positive autocorrelation**. The coefficient of
the lagged residual (e_lag) is 0.707, which is both large and positive,
indicating that current residuals are strongly influenced by residuals
from the previous period within each panel. The corresponding t-value of
25.85 and p-value of 0.000 show that this relationship is highly
statistically significant, meaning can confidently reject the null
hypothesis of no autocorrelation. This implies that the residuals are
not independent over time, and standard errors from a conventional
fixed-effects or random-effects regression may be biased. They are
adjusted in robust tests.

**Comparison to Fixed-Effects Model**

The pooled OLS model gives a good initial view, but it highlights the
importance of diagnostic tests. While it shows a higher R-squared value,
it is likely biased because it does not control for the unobserved,
time-invariant characteristics of each country.

**Hausman (1978) specification test**

  ----------------------------------------------- -----------------------
                                                  Coef.

  Chi-square test value                           17.731

  P-value                                         .003
  ----------------------------------------------- -----------------------

This output is the result of the Hausman test, which is used to decide
between a fixed-effects (FE) model and a random-effects (RE) model for
panel data.

- **Null Hypothesis (H0​)**: The test\'s null hypothesis is that there is
  no systematic difference between the coefficients of the FE and RE
  models. If this were true, the random-effects model would be a more
  efficient choice.

- **P-value**: The Prob\>chi2 value is **0.0066**. Because this p-value
  is less than the standard significance level of 0.05, **reject the
  null hypothesis**.

**Conclusion:** By rejecting the null hypothesis, it is concluded that
there is a systematic difference between the coefficients of the two
models. Therefore, the **fixed-effects model is the correct and
preferred choice** for the analysis. This result confirms that the
unobserved, country-specific effects in data are correlated with
independent variables, and the FE model is the only one that can
properly account for this

  ------------------------------------------------------------------------
  Variable      \(1\) Pooled    \(2\)            \(3\) Fixed-Effects
                OLS             Fixed-Effects    (Robust SE)
  ------------- --------------- ---------------- -------------------------
  log_gdp       0.206 \*\*\*    0.160 \*\*\*     0.160 \*\*

                (-0.049)        (-0.041)         (-0.054)

                \[4.17\]        \[3.91\]         \[2.95\]

  log_pd        -0.002          -0.139 \*\*      -0.139\*\*

                (-0.017)        (-0.07)          (-0.09)

                \[-0.10\]       \[-1.98\]        \[-1.97\]

  log_to        1.514 \*\*\*    0.719 \*\*\*     0.719 \*\*

                (-0.102)        (-0.276)         (-0.327)

                \[14.80\]       \[2.60\]         \[2.20\]

  log_unemp     0.015           0.131            0.131

                (-0.088)        (-0.08)          (-0.131)

                \[0.17\]        \[1.65\]         \[1.01\]

  log_polstb    -0.004          0.008            0.008

                (-0.078)        (-0.102)         (-0.14)

                \[-0.05\]       \[0.08\]         \[0.05\]

  \_cons        -2.487 \*\*\*   -0.244           -0.244

                (-0.297)        (-0.42)          (-0.567)

                \[-8.36\]       \[-0.58\]        \[-0.43\]

  R-squared     0.38            0.28             0.26

  F-statistic   82.2            5.9              4.42

  Prob \> F     0               0                0.005

  N             675             675              675
  ------------------------------------------------------------------------

Coefficients are listed first, with standard errors in parentheses ()
and t-values in brackets \[\]. \*\*\* p \< 0.01, \*\* p \< 0.05, \* p \<
0.1

This table provides a powerful and logical comparison of regression
results, highlighting the importance of using the correct estimation
technique for the data.

**1. Pooled OLS (Column 1)**

This model treats all observations as independent, ignoring the panel
structure.

**Interpretation:** It shows a strong positive relationship between FDI
and **log_gdp** (market size) and **log_to** (trade openness). This is
highly logical for the EU: investors are attracted to the largest
markets and the bloc\'s highly integrated trade environment.

This model, however, is likely **biased** because it doesn\'t account
for unobserved, time-invariant differences between countries, such as a
country\'s culture, legal system, or long-term institutional framework.
For example, some EU countries might have consistently higher FDI due to
their established position, regardless of changes in variables.

**2. Fixed-Effects (Column 2)**

This model corrects for the bias of the pooled OLS by controlling for
the unique characteristics of each of the 27 EU countries.

**Interpretation:** The coefficients change significantly, indicating
that the OLS model was indeed biased. The coefficients for **log_gdp**
and **log_to** remain positive and highly significant, confirming their
robust importance.

The coefficient for **log_pd** (public debt) becomes **significant** (t
= -1.98), showing a negative relationship. This is a crucial finding
that only emerged once country-specific effects were accounted for.

**3. Fixed-Effects with Robust Standard Errors (Column 3)**

This is the most reliable and final model. It not only controls for
country-specific effects but also corrects for heteroskedasticity and
autocorrelation, ensuring that standard errors and significance levels
are accurate.

**log_gdp** and **log_to** remain significant, making them the most
robust determinants of FDI in the EU. **log_pd** is also significant (t
= -1.97), reinforcing the negative relationship between public debt and
FDI. This is a key finding, as it suggests that even after controlling
for fiscal risks over time, a country\'s debt level still deters foreign
investors.
