This project is an implementation of Course Project for "Getting and Cleaning Data" Corsera course version 14.

All the code is implemented in a single file run_analysis.R.
It requires dplyr package, which is not installed as a part of script execution.
Script is executed on load.

Dataset is downloaded into current working directory as a part of script execution,
if no dataset forlder exists already.

Script performs the following operations:

- *download.uci.har.dataset function*: Checks if 'UCI HAR Dataset' folder exists in current working directory. If not, downloads dataset zip file (if not already downloaded), and unzips it.
- *get.uci.har.data function*:
	- For trainining and test sets (train and test folders in dataset directory), loads information about subjects (subject_[setname].txt), activities (y_[setname].txt) and variables (X_[setname].txt).
		- Replaces activity codes with activity names as per activity_labels.txt file
		- Subset only variables which name (according to features.txt file) contains "mean()" or "std()"
		- Assigns names from features.txt file to corresponding loaded columns.
		- Combines data from training and test set into single data.frame
	- Returns data.frame prepared as described above (steps 1-4 from course project description).
- *run.analysis function*:
	- Ensures dataset availability using download.uci.har.dataset function.
	- Loads data using get.uci.har.data function.
	- Calculates avarage values of each variable in data.frame obtained from get.uci.har.data function, grouped by pairs of subject and activity.
	- Writes results into UCI_HAR_tidy_dataset.csv file in current working directory.
	
Code book for UCI_HAR_tidy_dataset.csv is provided as a separate file in this repository: tidy_dataset_codebook.md

