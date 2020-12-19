# Spam classification with nearest neighbors and Logistic Regression

*This is a part of LiU's Machine Learning(732A99) curriculum (Lab1 Block1, Assignment 1)*

The given problem statements are solved as per the instructions to achieve better accuracy compare the models for determining best to the given dataset.

The problem statements are listed as follows:

The data file spambase.xlsx contains information about the frequency of various
words, characters etc for a total of 2740 e-mails. Furthermore, these e-mails have
been manually classified as spams (spam = 1) or regular e-mails (spam = 0).

1. Import the data into R and divide it into training and test sets (50%/50%) by using
the following code:
n=dim(data)[1]
set.seed(12345)
id=sample(1:n, floor(n*0.5))
train=data[id,]
test=data[-id,]

2. Use logistic regression (functions glm(), predict()) to classify the training and test
data by the classification principle: 
          for P(Y=1|X) > 0.5, Y = 1, otherwise, Y = 0
and report the confusion matrices (use table()) and the misclassification rates for
training and test data. Analyse the obtained results.


3. Use logistic regression to classify the test data by the classification principle
              for P(Y=1|X) > 0.8, Y = 1, otherwise, Y = 0
and report the confusion matrices (use table()) and the misclassification rates for
training and test data. Compare the results. What effect did the new rule have?

4. Use standard classifier kknn() with K=30 from package kknn, report the the
misclassification rates for the training and test data and compare the results with
step 2.

5. Repeat step 4 for K=1 and compare the results with step 4. What effect does the
decrease of K lead to and why?
