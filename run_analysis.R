run.analysis <- function() {
    # calculate average values per subject per activity per variable
    result <- get.uci.har.data() %>%
        group_by(subject, activity) %>%
        summarise_each('mean')
    
    # add 'AVG' to column names to distinguish them from original variables
    res.names <- names(result)
    names(result) <- c(res.names[1:2],
                       sapply(res.names[3:length(res.names)], function(x) paste(x, 'AVG')))
    
    # write results
    write.table(result, 'UCI_HAR_tidy_dataset.csv', sep=',', row.names=FALSE)
    message('UCI_HAR_tidy_dataset.csv file is written')
    
    result
}

get.uci.har.data <- function() {
    # Function reads dataset, and prepares it accordingly to steps 1-4 of task descrition:
    # 1. Merges the training and the test sets to create one data set.
    # 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    # 3. Uses descriptive activity names to name the activities in the data set
    # 4. Appropriately labels the data set with descriptive variable names. 
    
    download.uci.har.dataset ()
    library(dplyr)
    
    message('Loading and processing data...')
    
    dataset.dirname <- 'UCI HAR Dataset'
    setwd(dataset.dirname)
    
    # load activity labels as list
    activity.labels <- read.dictionary('activity_labels.txt')

    # load feature names
    feature.names <- unlist(read.dictionary('features.txt'))
    selected.feature.idx = sort(c(
        grep('mean\\(\\)', feature.names),
        grep('std\\(\\)', feature.names)
    ))
    
    data <- NULL
    for (setname in c('train', 'test')) {
        # load subjects
        subj <- read.table(file.path(setname, paste('subject_', setname, '.txt', sep='')),
                           stringsAsFactors = FALSE, col.names=c('subject'))
        
        # load activity codes, and convert them to activity names
        y <- read.table(file.path(setname, paste('y_', setname, '.txt', sep='')),
                        stringsAsFactors = FALSE) %>%
            rowwise() %>%
            mutate(activity=activity.labels[[V1]]) %>%
            select(-V1)
        
        # load feature values
        X <- read.table(file.path(setname, paste('X_', setname, '.txt', sep='')),
                        stringsAsFactors = FALSE)
        # subset features: only mean and std
        X <- X[, selected.feature.idx]
        # set column names
        names(X) <- feature.names[selected.feature.idx]
        
        dir.data <- bind_cols(subj, y, X)
        if (is.null(data)) {
            data <- dir.data
        }
        else {
            data <- bind_rows(data, dir.data)
        }
    }
    setwd('..')
    message('Training and test data are loaded, subset and combined')
    data
}

download.uci.har.dataset <- function() {
    # Function downloads and unzips dataset if necessary
    
    # if we are in dataset directory, lets go one level up
    # otherwise we would download dataset again
    if (length(grep('UCI HAR Dataset$', getwd())) != 0) {
        setwd('..')
    }
    
    message('Checking if we have dataset source files...')
    dataset.zip.filename <- 'UCI_HAR_dataset.zip'
    dataset.setname <- 'UCI HAR Dataset'
    if (!file.exists(dataset.setname)) {
        if (!file.exists(dataset.zip.filename)) {
            message('UCI HAR dataset archive does not exist locally, downloading it...')
            download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ',
                          dataset.zip.filename,
                          method = 'curl')
            message('UCI HAR dataset source archive downloaded.')
        }
        unzip(dataset.zip.filename, exdir = './')
        message('UCI HAR dataset source files extracted')
    }
    else {
        message('UCI HAR dataset source files is already present')
    }
}

read.dictionary <- function(filename) {
    # Helper function that reads file with two columns,
    # and returns a list with names from a first column,
    #   and values from a second column.
    # For a purpose of this course project, no checks are performed
    #   on a file (are there two columns, are values in first column unique, etc.).
    
    d <- read.table(filename, stringsAsFactors = FALSE)
    lapply(split(d, d$V1), function(x) as.character(x$V2))
}

run.analysis()