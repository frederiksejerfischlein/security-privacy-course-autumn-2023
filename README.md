# security-privacy-course-autumn-2023
security-privacy-course-autumn-2023

Consider following (hypothetical) scenario: for the latest local election, an unnamed country decided to experiment with electoral technologies and to provide a possibility to cast a vote online for voters in a selected municipality. The rest of the voters voted on paper in their polling station, as usual. The results of the election have shown that the votes cast electronically were distributed differently than the votes cast on paper. In order to investigate the possibility of election manipulation, as well as to study the demographics of voters who decided to cast their vote online, a survey was conducted (date of data collection 1/7/2023). For the sake of transparency, the statistical agency conducting the survey decided to release the results to the public. However, due to sensitive nature of the survey (in particular, the political preferences of the voters), the released dataset had to be anonymised beforehand.

In this project you will take the role of both the statistical agency (the anonymisers) and the adversary who attempts to learn the political preferences of the population from the released dataset (the deanonymisers). The project would therefore consist of two phases.



Phase 1 (12 days)

You will receive the following files (in all the file names, X stands for the letter assigned to your group):

– “private_dataX.xslx” representing the non-anonymised survey data,

– “public_data_registerX.xslx” representing the public population register,

– “public_data_resultsX.xslx” representing the published results of the election.

A description of the attributes in the datasets (same for all the groups) is furthermore available here.

During the first part, you will work with the non-anonymised dataset (“private_dataX.xslx”) containing the attributes as outlined above. Your task would be:



Anonymise and submit the anonymised version of the dataset. In this, you should consider following requirements on utility and risk of the anonymisation:
[Utility] One should be able to use the dataset to conduct the following analyses.
(A) Is there a significant difference between the political preferences as expressed in the survey and the election results for both electronic and polling station votes?
(B) Is there a significant difference between political preferences of the voters depending on their demographic attributes recorded in the survey (that is, age, gender, education level…)?
(C) Is there a significant difference between voter’s choice of the voting channel (that is, if they decide to vote either online or in person) depending on their demographic attributes recorded in the survey?
[Risk] It should be impossible to disclose voter's preferences of any voter from the anonymised dataset and public information.
Note, it is up to you to decide how to analyse the data to answer research questions A-C. The adversary is assumed to have access to the  data from the population register (“public_data_registerX.xslx”) and to the results of the election (“public_data_resultsX.xslx”)

Prepare auxillary data, which will contain the names of all the voters who participated in the survey. The auxillary data will be used by the opposing group in the second phase of the project to disclose the political preferences of these voters. Optionally, you can also add other information to the auxiliary data that you believe would be helpful for disclosing the preferences of the voters in your dataset by the opposing group (feel free to be creative!)
Prepare a report on your anonymisation process. Your report will consist of the following: 
Your analysis of research questions A-C, including the methodology (e.g. specific statistical tests/ML approaches you applied) and the results (that is, answers to questions A-C). The analysis should be based on anonymised data.
Your description of the anonymisation methods you applied to the dataset and the reasoning behind them.
Your submission should consist of the following files:

(a) the anonymised dataset as a .csv file named "anonymised_data_X.csv" with X as the letter assigned to your group

(b) the auxiliary data with the list of voters participating in the survey as a single .csv file named "auxiliary_dataX.csv". If you chose to include additional information in the auxillary data, submit a .zip archive with multiple files named "auxillary_dataX.zip" with X as the letter assigned to your group

(c) the report as a PDF file named “reportX.pdf” with X as the letter assigned to your group

(d) the population register and the public results of your dataset (that is, the files “public_data_registerX.xslx” and “public_data_resultsX.xslx” that you received)

The submission should happen via the following channels: 

Peergrade (see here). Note, you should submit to Peergrade as a group, and for this you will have to recreate the group you have on LearnIT (note, you can invite people to your group only once they have accessed Peergrade at least once). IMPORTANT: make sure that there is only one submission on Peergrade per group.
As a backup, via LearnIT as a submission to this assignment.
Submission deadline is: Wednesday 15. November, 23:59. 

NOTE: no extensions on the submission of the anonymised datasets will be granted, as these are necessary for the second part of the project.

Phase 2 (1 week)

You will get access to the anonymised datasets, the auxiliary data and the report from another group assigned as your “opponent” on Peergrade. Your task would be to learn the political preferences of as many voters as possible, and prepare a report on which techniques you used for this. As further auxiliary knowledge, you will have access to the population register and the public results of the opponent group dataset. You will also be asked to evaluate the report of the opponent group, commenting on the description of their analysis of the questions A-C as well as on their choice of anonymisation methods and reasoning behind them.

Your submission should be done via Peergrade as feedback for the assignment of the groups that is allocated to you, which would be your opposing group. Submission deadline is: Wednesday 22. November, 23:59.



Project workshop: 

Each group will present the result of their work on both anonymisation and disclosure attacks. The presentation will include information on their own anonymisation, including but not limited to.

Description of anonymisation methods they chose and discussion on why these methods were chosen
The effects of anonymisation on the utility of the dataset, e.g. as the resulting difference between the results of the analyses run on research questions (A)-(C) on anonymised vs non-anonymised dataset
The tactics they chose for attacking the dataset of the opposing group
More information on the presentation schedule and contents will follow. The submissions for each one of the two parts and the participation in the workshop are mandatory.

Frequently asked questions about the project will be answered in the forum.
