# Springboard Data Science Career Track


## Introduction

This is the repository of mini assignments and projects I completed for the [Springboard Data Science Career Track](https://www.springboard.com/workshops/data-science-career-track) program. Capstone Projects, which combine most, if not all of the technical skills and concepts learned from these projects, can be found in the following separate repositories. 

[Capstone 1: Predicting H1-B Visa Status for Applicants]()   

[Capstone 2:]() (In progress)

_______
## Table of Contents

| Chapter | Project Title | Link |
| --- | --- | --- |
|  Data wrangling | Basic JSON exercise | [Learn More]() | 
| | Basic SQL | [Learn More]() | 
| | Basic API usage with Quandl API | [Learn More]() | 
| Inferential Statistics | Analyzing Hospital Medical Charges with Frequentist Statistics  | [Learn More]() | 
| | Analyzing Hospital Medical Charges with Bootstrapping | [Learn More]() | 
| | Analyzing Hospital Medical Charges with Bayesian Methods (PyMC3)  | [Learn More]() | 
| Machine Learning | Performing Linear regression on Boston housing dataset | [Learn More]() | 
| | Performing Logistic regression on heights and weights dataset | [Learn More]() | 
| | Predicting movie ratings from RT reviews using Multinomial Naive Bayes | [Learn More]() | 
| | Customer segmentation using Clustering Methods | [Learn More]() | 



_______
### Brief Project Descriptions: 

***Data Wrangling***

**Basic JSON exercise:** This simple exercise demonstrates ability to work with JSON files. The dataset comes from the ***2013 World Bank data*** on projects funded by the World Bank and is in a JSON file format. I also fill in missing values using a lookup table. Data wrangling reveals that *China, Indonesia, and Vietnam* had the most projects funded by the World Bank in 2013. The most popular project themes were *Environment and natural resources management, Rural development, and Human development.*

**Basic SQL:** This project demonstrates ability to write simple SQL scripts to join, manipulate, and extract data from three tables in **country clubhouse** data. The SQL database is hosted on a separate Springboard server and the scripts are written in response to the specific questions provided by Springboard. 


**Basic API usage with Quandl API:** This exercise demonstrates ability to use *requests* package to retrieve data from [Quandl](https://www.quandl.com/) using API keys. For 2017 Franfurt Stock Exchange data (ticker AFX_X), I am able to find out that the lowest opening price was $34.0, the highest opening price was $53.11, and that the median trading volume during 2017 was 76286.000, among other simple financial metrics. 



***Inferential Statistics***

This section is divided into three parts that build on top of each other. Each section uses different statistical methods to gain insights on medical charges data (Source: [Kaggle](https://www.kaggle.com/easonlai/sample-insurance-claim-prediction-dataset))

**Analyzing Hospital Medical Charges with Frequentist Statistics:** Using classical frequentist methods such as the z-statistic and t-statistic and the scipy statistics package, this section investigates two questions: 
1) whether the hospital's revenue stream fell below a key threshold of $12,000 
2) whether people with insurance are charged a different amount to those without 
Performing statistics on the first question reveals that the lower limit of the 95% confidence interval for the population mean is $12,725.48. Thus it is highly unlikely that the hospital's revenue stream fell below the threshold of $12,000. For the second question, using Welch's t-test gives us a t-value of -13.29. Thus we reject the null hypothesis and conclude that there *is* a difference in the amount charged between the two groups

**Analyzing Hospital Medical Charges with Bootstrapping:** This section explores the same two questions above but analyzes it using bootstrapping methods. For the first question: When we generate 10,000 bootstrap replicates, we obtain $12724.46 (exact value might vary due to bootstrapping) for the lower limit of the 95% confidence interval, validating our frequentist approach above. For the second question, we conclude that there is no practical need to perform bootstrapping since the obtained t-value is already so low (t-value of -13.29). We do however perform bootstrapping methods to verify that the variances of the two groups (insured vs. non-insured) were unequal, validating our choice of using Welch's t-test in the previous section.

**Analyzing Hospital Medical Charges with Bayesian Methods (PyMC3):** This section is mostly focused on using and familiarizing oneself with the PyMC3 library. As an exercise, this section models 'no-insurance' group's individual medical charges using Bayesian inferential modeling.

***Machine Learning***


**Performing Linear regression on Boston housing dataset:**

**Performing Logistic regression on heights and weights dataset:**

**Predicting movie ratings from RT reviews using Multinomial Naive Bayes:**

**Customer segmentation using Clustering Methods:**




Machine Learning
Linear Regression with Boston Housing Dataset: I use scikit-learn library to build a linear regression model to predict the housing prices in Boston. The various features include per capita crime rate, average number of rooms per dwelling, and pupil-teacher ratio by town. I also split the data into training and testing sets in order to measure how well the model built with the training set can predict the 'unseen' data in the test set. I show how multiple rounds of cross-validation performed on different partitions help limit the problem of overfitting a particular training subset and thus reduce variability of the model.

Classification and Logistic Regression: I use cross-validation and grid search to find the best regularization parameter C for the logistic regression. Regularization applies a penalty for increasing the coefficient estimates in order to reduce overfitting. The regularization parameter C in scikit-learn is the inverse of the shrinkage parameter lambda. Larger lambda or smaller C increases the shrinkage pentalty and shrinks the coefficient estimates toward zero. By default scikit-learn sets C=1 in logistic regression, so some amount of regularization is used even if C is not specified. Regularization is good at reducing the variance of the predictions but increasing the bias at the same time. GridSearchCV performs a cross-validated grid-search over a parameter grid. We need to specify an estimation method, parameter values for the estimator and a scoring method. The results show the best estimator, the score of the best estimator, and the parameter setting that yields the best score.

Text Classification with Naive Bayes: I analyze the movie reviews from the rotten tomatoes database. The goal is to train a classifier to predict whether a critic's movie review is 'fresh' or 'rotten.' To preprocess the text, CountVectorizer allows us convert the collection of movie reviews into a matrix of token counts. The parameter min_df is used to removed terms that are too rare, and max_df is used to remove terms that are too common. I then train a multinomial Naive Bayes classifier assuming that features are conditionally independent given the class. In Naive Bayes, alpha is an additive (Laplace/Lidstone) smoothing parameter. A larger alpha will reduce the variance of the model (and overfitting) but increase bias at the same time. We can think of alpha as a pseudocount of the number of times a word has been seen. In the following code, I use grid search to find the best alpha as well as the best min_df that will maximize the probability of observing the training data.

For feature selection, we can create an identity matrix with the size of the number of features/words, each row representing exactly one feature/word. We then use any one word to predict the probabilitiy of freshness or rottenness of a review that contains this word. If one single word can generate high probability of a review being fresh or rotten, that implies this feature has a high predictive power. Reviews containing words such as perfect, touching and masterpiece are likely to be fresh, while words like unfortunately, dull and worst tend to predict rotten reviews.

I also made some improvements of the model in different ways: (1) Include both bigrams and unigrams to capture two-word phrases; (2) Vectorize the reviews based on Term Frequency and Inverse Document Frequency (TF-IDF); and (3) Train a Random Forest classifier with the optimal number of trees chosen by cross-validation.

Customer Segmentation using Clustering: The dataset contains wine offers that were e-mailed to the customers and data on which offers they purchased. Important features of wine offers include wine varietal, the minimum quantity, discount, country of origin and whether or not it is past peak. I merge two spreadsheets and create a pandas dataframe with each row representing a customer and each column representing a wine offer. I first apply K-Means Clustering and use both the elbow method and the Silhouette method to choose the number of clusters. To visualize the clusters, I use Principal Component Analysis to reduce the 32 features into two dimensions. I also compare results from other clustering algorithms: affinity propagation, spectral clustering, agglomerative clustering, and DBSCAN.

For this dataset, the agglomerative clustering performs well in identifying a group who favor Pinot Noir, a group who tend to choose offers requiring only a minimum quantity of six, and two other groups who tend to purchase large quantities of Champagne (one also purchase Chardonnay and the other Espumante and Prosecco). DBSCAN does not perform well because the sparse dataset of 32 features makes it difficult to find clusters and as a result more than half of the data points are classified as noise. The clustering result from affinity propagation is also not very convincing since some of the clusters tend to overlap in the two-dimensional PCA feature space. Spectral clustering is capable of identifying the Pinot-Noir group, the small-offers group and the Champagne group, but the fourth group does not have a clear pattern. Overall, what is consistent across different clustering methods is that some customers tend to purchase Pinot Noir almost exclusively, some tend to focus only on small offers regardless of the wine varitals, and the rest tend to buy Champagne in bulk.
