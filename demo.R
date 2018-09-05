#A simple introduction to Exploratory Factor Analysis using R
#By KG Wee
#https://www.r-bloggers.com/exploratory-factor-analysis-in-r/
#https://data.library.virginia.edu/getting-started-with-factor-analysis/
#data "Olympic" is from https://pbil.univ-lyon1.fr/ade4/ade4-html/olympic.html

#Factor Analysis
#Factor analysis starts with the assumption of hidden latent variables which cannot be observed directly but are reflected in the answers or variables of the data.

#Factor Loadings
#Suppose a psychologist has the hypothesis that there are two kinds of intelligence, "verbal intelligence" and "mathematical intelligence", neither of which is directly observed.
#The numbers for a particular subject, by which the two kinds of intelligence are multiplied to obtain the expected score, are posited by the hypothesis to be the same for all intelligence level pairs, and are called "factor loading" for this subject. For example, the hypothesis may hold that the average student's aptitude in the field of astronomy is
#{10 × the student's verbal intelligence} + {6 × the student's mathematical intelligence}.
#The numbers 10 and 6 are the factor loadings associated with astronomy.

#Oblique rotations
#https://en.wikiversity.org/wiki/Exploratory_factor_analysis
#Orthogonal (Varimax - in R): Factors are independent (i.e., correlations between factors are less than ~.3)
#Oblique (Oblimin - in R): Factors are related (i.e., at least some correlations between factors are greater than ~.3).
#If the researcher hypothesises uncorrelated factors, then use orthogonal rotation. If the researchers hypothesises correlated factors, then use oblique rotation.

#Demo
#Psych package in R which is a package for personality, psychometric, and psychological research. Contains useful methods
install.packages("psych")
install.packages("GPArotation")
library("psych")
library("GPArotation")

olympic_data <- read.csv("olympic.csv")
olympic_data <- olympic_data[complete.cases(olympic_data), ]

#correlation matrix
olympic_cor <- cor(olympic_data)

#Scree Plot
#The scree plot maps the factors with their eigenvalues and a cut-off point is determined wherever there is a sudden change in the slope of the line.
#scree plot using scree method
scree(olympic_cor)

#factor analysis with number of factors = 6, number of observation = 33
factors_data_2 <- fa(r = olympic_cor, nfactors = 2, n.obs = 33)
factors_data_3 <- fa(r = olympic_cor, nfactors = 3, n.obs = 33)
#h2 is communality estimate, measures the % of variance in an observed variable explained by the retained factors
#u2 uniqueness, 1-h2
#factors_data_varimax <- fa(r = olympic_cor, nfactors = 3, rotate = "varimax")
factors_data <- factors_data_2

#http://dwoll.de/rexrepos/posts/multFA.html
#factor plot to cluster loadings and assign items to clusters by their highest loading. Cut is the cut-off point. Choose flag specifies factors/clusters 
fa.plot(factors_data, cut = 0.5)
#Draw factor loadings
fa.diagram(factors_data, cut = 0.5)
