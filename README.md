# Springboard Data Science Career Track


## Introduction

This is the repository of mini assignments and projects I completed for the [Springboard Data Science Career Track](https://www.springboard.com/workshops/data-science-career-track) program. Capstone Projects, which combine most, if not all of the technical skills and concepts learned from these projects, can be found in the following separate repositories. 

[Capstone 1: Predicting H1-B Visa Status for Applicants]()   

[Capstone 2:]() (In progress)

_______
## Table of Contents

| Chapter | Project Title | Link |
| --- | --- | --- |
|  Data wrangling | Basic JSON exercise | [Link to Notebook]() | 
| | Basic SQL | [Link to Notebook]() | 
| | Basic API usage with Quandl API | [Link to Notebook]() | 
| Inferential Statistics | Analyzing Hospital Medical Charges with Frequentist Statistics  | [Link to Notebook]() | 
| | Analyzing Hospital Medical Charges with Bootstrapping | [Link to Notebook]() | 
| | Analyzing Hospital Medical Charges with Bayesian Methods (PyMC3)  | [Link to Notebook]() | 
| Machine Learning | Performing Linear regression on Boston housing dataset | [Learn More]() | 
| | Performing Logistic regression on heights and weights dataset | [Learn More]() | 
| | Predicting movie ratings from RT reviews using Multinomial Naive Bayes | [Learn More]() | 
| | Customer segmentation using Clustering Methods | [Learn More]() | 



_______
### Brief Project Descriptions: 

***Data Wrangling***

**1. Basic JSON exercise:** This simple exercise demonstrates ability to work with JSON files. The dataset comes from the ***2013 World Bank data*** on projects funded by the World Bank and is in a JSON file format. I also fill in missing values using a lookup table. Data wrangling reveals that *China, Indonesia, and Vietnam* had the most projects funded by the World Bank in 2013. The most popular project themes were *Environment and natural resources management, Rural development, and Human development.*

**2. Basic SQL:** This project demonstrates ability to write simple SQL scripts to join, manipulate, and extract data from three tables in **country clubhouse** data. The SQL database is hosted on a separate Springboard server and the scripts are written in response to the specific questions provided by Springboard. 


**3. Basic API usage with Quandl API:** This exercise demonstrates ability to use *requests* package to retrieve data from [Quandl](https://www.quandl.com/) using API keys. For 2017 Franfurt Stock Exchange data (ticker AFX_X), I am able to find out that the lowest opening price was $34.0, the highest opening price was $53.11, and that the median trading volume during 2017 was 76286.000, among other simple financial metrics. 



***Inferential Statistics***

This section is divided into three parts that build on top of each other. Each section uses different statistical methods to gain insights on medical charges data (Source: [Kaggle](https://www.kaggle.com/easonlai/sample-insurance-claim-prediction-dataset))

**1. Analyzing Hospital Medical Charges with Frequentist Statistics:** Using classical frequentist methods such as the z-statistic and t-statistic and the scipy statistics package, this section investigates two questions: 
1) whether the hospital's revenue stream fell below a key threshold of $12,000 
2) whether people with insurance are charged a different amount to those without 
Performing statistics on the first question reveals that the lower limit of the 95% confidence interval for the population mean is $12,725.48. Thus it is highly unlikely that the hospital's revenue stream fell below the threshold of $12,000. For the second question, using Welch's t-test gives us a t-value of -13.29. Thus we reject the null hypothesis and conclude that there *is* a difference in the amount charged between the two groups

**2. Analyzing Hospital Medical Charges with Bootstrapping:** This section explores the same two questions above but analyzes it using bootstrapping methods. For the first question: When we generate 10,000 bootstrap replicates, we obtain $12724.46 (exact value might vary due to bootstrapping) for the lower limit of the 95% confidence interval, validating our frequentist approach above. For the second question, we conclude that there is no practical need to perform bootstrapping since the obtained t-value is already so low (t-value of -13.29). We do however perform bootstrapping methods to verify that the variances of the two groups (insured vs. non-insured) were unequal, validating our choice of using Welch's t-test in the previous section.

**3. Analyzing Hospital Medical Charges with Bayesian Methods (PyMC3):** This section is mostly focused on using and familiarizing oneself with the PyMC3 library. As an exercise, this section models 'no-insurance' group's individual medical charges using Bayesian inferential modeling.

***Machine Learning***


**1. Performing Linear regression on Boston housing dataset:** This section demonstrates my ability to build a linear regression model using `statsmodels` library to predict the housing prices in Boston. Boston housing dataset is a classic dataset in the machine learning community and includes various features such as *nitric oxide concentration, average number of rooms per dwelling, and full-value property-tax rate per $10,000*. Out of these features, I focus on three feature variables **(per capita crime rate, average number of rooms per dwelling, and pupil-teacher ratio by town)** to predict the median price of the houses. I use the R squared value and AIC as metrics to evaluate the model and exclude outliers and influence points to improve model predictability. 

* Exercised based on [Lab 4 of Harvard's CS109](https://github.com/cs109/2015lab4) course

**2. Performing Logistic regression on heights and weights dataset:** This section demonstrates ability to perform simple classification using a logistic regression model from `scikit-learn` library. Using cross-validation and grid search methods, I tune the model hyperparameters (In logistic regression models, the regularization parameter ***C***). For this particular dataset, using GridSearchCV yields an accuracy score of 0.9252 for the test set for the parameter C = 1. 

* Exercised based on [Lab 5 of Harvard's CS109](https://github.com/cs109/2015lab5) course

**3. Predicting movie ratings from RT reviews using Multinomial Naive Bayes:** The goal of this exercise is to predict whether a critic's movie review is 'fresh' or 'rotten'. The dataset comes from Rotten Tomatoes database. For text preprocessing, CountVectorizer is used to return a *term-document matrix*, where the matrix is stored as a sparse matrix. Some parameters to tune are `min_df` and `max_df`, where `min_df` is used to remove terms that are too rare and vice versa. Multinomial Naive Bayes is then used to classify the data and predict the freshness/rottenness of the review. 

For feature selection, we can create an identity matrix with the size of the number of features/words, each row representing exactly one feature/word. We then use any one word to predict the probabilitiy of freshness or rottenness of a review that contains this word. If one single word can generate high probability of a review being fresh or rotten, that implies this feature has a high predictive power. Reviews containing words such as perfect, touching and masterpiece are likely to be fresh, while words like unfortunately, dull and worst tend to predict rotten reviews. [Reference](https://github.com/andrewjsiu/Springboard-Coursework)

One shortcoming to note with the above approach. Because the classifier does not understand the semantics of the word (due to 'bag of words' approach), the classifier cannot accurately predict reviews with negation or sarcasm. 

* Exercise based on [Lab 10 of Harvard's CS109](https://github.com/cs109/2015lab10) course

**4. Customer segmentation using Clustering Methods:** This exercise delves into unsupervised machine learning, specifically K-Means Clustering techniques. The purpose of this exercise is to segment the customers with similar behavior in order to target them for specific promotions in the future. To choose `K`, the number of clusters, I use both the elbow method and the silhouette method and compare metrics against each approach. For visualizations, we turn to PCA techniques, since this dataset has 32 feature columns. We reduce the dimensionality into 2 dimensions and try to get a feel for how the different clusters are formed for different K-values. Additionally other clustering algorithms such as affinity propagation, spectral clustering, agglomerative clustering, and DBSCAN are used on the dataset and their respective Silhouette Scores are compared. 

* Exercise based on [this blog post](http://blog.yhat.com/posts/customer-segmentation-using-python.html) by yhat



