# cleanData
Part 1 - Data Used:
The analysis script loads and analyzes the following files from the Human Activity Data .zip:
1. X_train.txt -- the train set's observations (561 variables)
2. X_test.txt -- the test set's observations (561 variables)
3. Y_train.txt -- the corresponding activity (1-6) for each observation in the train set
4. Y_test.txt -- same as Y_train, but for the test set
5. subject_train.txt -- the corresponding subject for each observation in the train set
6. subject_test.txt -- same as subject_train, but for the test set
7. features.txt -- the names of each variable
8. activity_labels.txt -- the corresponding name of each activity number

Part 2: Analysis performed:
The script does the following (in order):
1. Gives each dataset descriptive variable names.
2. Uses cbind to merge the subject* and y* datasets each with their corresponding x* datasets.
3. Uses rbind to merge the two resulting data sets created by (2) into one dataset, named _all_.
4. Extracts subset within _all_  of measurements for variables with names containing "mean" or "std" (standard deviation). Stored in _meanStd_
5. Renames activity values in _all_ from numeric to their appropriate activity description (following the key from activity_labels)
6. Extracts average of every variable by activity and subject. Stored in _summarized_.

