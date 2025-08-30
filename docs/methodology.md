**Methodology**

The empirical analysis is based on a balanced panel dataset covering
**27 EU countries from 2001 to 2025**. The panel framework allows to
exploit both the **time-series variation within countries** and the
**cross-sectional variation across countries**. This is particularly
appropriate given that FDI inflows are shaped by both long-run
country-specific characteristics (institutions, geography, legal
systems) and short-run macroeconomic fluctuations.

The study follows a stepwise approach:

1.  **Exploratory Data Analysis (EDA):** Descriptive statistics,
    histograms, skewness--kurtosis tests, and correlation matrices to
    assess variable distributions and relationships.

2.  **Data Transformations:** Logarithmic transformations to reduce
    skewness, winsorization to mitigate the effect of outliers, and
    exclusion of highly collinear variables (e.g., inflation vs. public
    debt).

3.  **Panel Estimation:** Fixed Effects (FE) and Random Effects (RE)
    models are estimated, with the Hausman test guiding the model
    choice.

**Variables**

- **Dependent Variable:** *FDI inflows* (Inv, and its log-transformed
  version log_fdi).

- **Key Independent Variables:**

  - *Market size:* log of GDP (log_gdp).

  - *Price stability:* log of GDP deflator (log_gdpdef, initially
    considered but later excluded due to collinearity).

  - *Public debt:* log of public debt (log_pd).

  - *Trade openness:* log of trade-to-GDP ratio (log_to).

  - *Unemployment:* log of unemployment rate (log_unemp).

  - *Institutional environment:* log of political stability index
    (log_polstb).

**Model Specification**

The baseline panel regression model is:

FDI~it~=α+β~1~ GDP~it~+β~2~ Debt~it~+β~3~ Trade~it~+β~4~ Unemp~it~+β~5 ~PolStab~it~+γ~t~+u~i~+ϵ~it~

Where:

- i = country

- t = year

- γt= year fixed effects

- ui​ = unobserved country-specific effects

- ϵit​ = idiosyncratic error term

**Fixed Effects vs. Random Effects**

- **Fixed Effects (FE):** Controls for unobserved, time-invariant
  heterogeneity across EU countries (e.g., geography, legal traditions,
  long-run institutional quality). FE is consistent when country effects
  are correlated with regressors.

- **Random Effects (RE):** Assumes unobserved effects are uncorrelated
  with regressors, enabling more efficient estimates if valid.

The **Hausman test** is used to decide between FE and RE. A significant
result rejects RE in favor of FE. In this study, the Hausman test
strongly supported the FE specification, implying that unobserved
heterogeneity is systematically correlated with FDI determinants in the
EU.
