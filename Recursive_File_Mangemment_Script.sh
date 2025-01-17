#!/bin/bash

# Function to search for a file in a directory (including subdirectory)
search_file() {
  local directory="$1"
  local filename="$2"

  # Check if the directory exists
  if [ ! -d "$directory" ]; then
    echo "Enter a valid directory path."
    exit 1
  fi

  # Search for the file in the directory and its subdirectories
  local found_file="$(find "$directory" -type f -name "$filename")"

  if [ -z "$found_file" ]; then
    echo "File '$filename' not found in '$directory' or its subdirectories."
    exit 1
  fi

  echo "File '$filename' found at: $found_file"

  #  It will ask the user what to do with the file
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
      *)
        echo "Invalid option. Please select again."
        ;;
    esac
  done
}

# Main script execution
echo "Enter directory path:"
read directory
echo "Enter filename to search:"
read filename

search_file "$directory" "$filename"
