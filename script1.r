
install.packages("googledrive")
install.packages("googlesheets4")
library(googledrive)
library(googlesheets4)

# Authenticate Google Drive and Google Sheets
drive_auth()
sheets_auth()

# Define folder ID and get list of files in the folder
folder_id <- "1UBDhxkbMnaAwFEAeBzS-FlRbsMc9g0xC"  # Replace with your folder ID
files_in_folder <- drive_ls(path = as_id(folder_id))

# Extract the names of files into a data frame
file_names <- data.frame(Files = files_in_folder$name)

# Create a new Google Sheets file
new_sheet <- gs4_create("NOW_img_dir")

# Write the data frame to the new Google Sheets file
sheet_write(file_names, ss = new_sheet, sheet = 1)

