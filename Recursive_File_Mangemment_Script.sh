#!/bin/bash

# Function to search for a file in a directory (including subdirectory)
search_file() {
  local directory="$1"
  local filename="$2"
}
  # Check if the directory exists
  if [ ! -d "$directory" ]; then
    echo "Enter a valid directory path."
    exit 1
  fi

  # Search for the file in the directory and its subdirectories
  local found_file="$(find "$directory" -type f -name "$filename)"

  if [ -z "$found_file" ]; then
    echo "File '$filename' not found in '$directory' or its subdirectory 
    exit 1
  fi

  echo "File '$filename' found at: $found_file"

  # Ask the user what to do with the file
  select action in "View" "Edit" "Delete" "Exit"; do
    case "$action" in
      "View")
        cat "$found_file"
        ;;
      "Edit")
        nano "$found_file"
        ;;
      "Delete")
        rm "$found_file"
        ;;
      "Exit")
        exit
        ;;
