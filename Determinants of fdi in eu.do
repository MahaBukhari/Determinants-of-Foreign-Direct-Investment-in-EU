import excel "C:\Users\Shekhani Laptops\Documents\FDI determinants in EU.xlsx", sheet("Sheet1") firstrow
asdoc sum Inv GDP_gro Inf Pub_Debt Trade_op Unemplo_Rate Poli_Stability, detail append
asdoc describe, append
asdoc sum Inv GDP_gro Inf Pub_Debt Trade_op Unemplo_Rate Poli_Stability, detail append
asdoc sum log_fdi log_gdp log_gdpdef log_pd log_to log_unemp log_polstb, detail append
winsor2 log_fdi , cuts(5 95) replace
winsor2 log_gdp , cuts(5 95) replace
winsor2 log_polstb , cuts(5 95) replace
asdoc sum log_fdi log_gdp log_gdpdef log_pd log_to log_unemp log_polstb, detail append
histogram log_gdp , normal
histogram log_gdpdef , normal
histogram log_pd , normal
histogram log_to , normal
histogram log_unemp , normal
histogram log_polstb , normal
twoway (scatter log_fdi log_gdp ) (lfit log_fdi log_gdp )
twoway (scatter log_fdi log_gdpdef ) (lfit log_fdi log_gdpdef )
twoway (scatter log_fdi log_pd ) (lfit log_fdi log_pd )
twoway (scatter log_fdi log_to ) (lfit log_fdi log_to )
twoway (scatter log_fdi log_unemp ) (lfit log_fdi log_unemp )
twoway (scatter log_fdi log_polstb ) (lfit log_fdi log_polstb )
graph box log_fdi log_gdp log_gdpdef log_pd log_unemp log_to log_polstb
asdoc pwcorr log_fdi log_gdp log_gdpdef log_pd log_to log_unemp log_polstb, save(Correlations.doc) star(0.05) append
asdoc pwcorr log_fdi log_gdp log_pd log_to log_unemp log_polstb, save(Correlations.doc) star(0.05) append
asdoc regress log_fdi log_gdp log_pd log_pd log_to log_unemp log_polstb
asdoc vif, append
xtset ID Year
estat hettest
asdoc estat hettest, append
asdoc xtreg log_fdi log_gdp log_pd log_to log_unemp log_polstb i.year, fe
asdoc xtreg log_fdi log_gdp log_pd log_to log_unemp log_polstb i.year, fe append
estimate store fe
asdoc xtreg log_fdi log_gdp log_pd log_to log_unemp log_polstb i.year, re append
estimate store re
asdoc hausman fe re, append
outreg2 using "eg.doc", word append
asdoc xtreg log_fdi log_gdp log_pd log_to log_unemp log_polstb i.year, fe vce(robust) append
