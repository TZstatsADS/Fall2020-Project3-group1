# Project: Can you recognize the emotion from an image of a face? 
<img src="figs/CE.jpg" alt="Compound Emotions" width="500"/>
(Image source: https://www.pnas.org/content/111/15/E1454)

### [Full Project Description](doc/project3_desc.md)

Term: Fall 2020

+ Team 1
+ Team members
	+ team member 1 Kristen Akey
	+ team member 2 Levi Lee
	+ team member 3 Yiran Lin
	+ team member 4 Hanyi Wang
	+ team member 5 Wen Yin

+ Project summary: 

In this project, we created a classification engine for facial emotion recognition. Our group tried out four typical machine learning algorithms, trained them on the given data set, cross-validated to find the optimized parameters, and provided fair evaluation for all four of them. The evaluation process considered the mean error, the area under the ROC curve, and running time to give a thorough comparison of the four methods. 

**Contribution statement**: ([default](doc/a_note_on_contributions.md)) All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contributions statement. 

Kristen implemented and cross-validated the xgboost and random forest with weights models. She also prepared the slidedeck for the presentation.

Levi created the basic cross-validation, training, and testing scripts from the starter code. He also implemented, cross-validated the gbm model and also partly cross-validated the xgboost model, created the basic organizational framework for the main.Rmd file, and wrote a preliminary script to be used on the testing data. 

Yiran implemented and cross validated the PCA+SVM model.

Hanyi helped with the implementation of the gbm and xgboost model. She also organized the final report.

Wen implemented and cross validated the unweighted random forest model.

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is organized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
