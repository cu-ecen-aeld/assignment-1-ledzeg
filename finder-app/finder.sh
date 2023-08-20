#!/usr/bin/env bash

# Parameters 
filesdir=$1
searchstr=$2
printf "The directory to search: $filesdir\nThe string to search: $searchstr\n" 

# Exits with return value 1 error and print statements if any of the parameters above were not specified
if ! [ "$#" -eq 2 ]; then
    echo "Invalid number of arguments. Please provide exactly 2 arguments."
    exit 1
fi

# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
if ! [ -d "$filesdir" ]; then  
    echo "The directory pass doesn't exit"
    exit 1
fi

# Find the files and pass the output to grep
files_found=$(find "$filesdir" -type f)
total_files=$(echo "$files_found" | wc -l)
echo "Files found: $files_found"

total_lines=0
for file in "$filesdir"/*; do
    count=$(grep -c "$searchstr" "$file")
    total_lines=$((total_lines + count))
done 
    echo $total_lines
echo "The number of files are $total_files and the number of matching lines are $total_lines"