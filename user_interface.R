
library(shiny)
library(googledrive)
library(googlesheets4)


shinyApp(
  # UI stuff
  ui = fluidPage(
    titlePanel("Google Drive File Lister"),
    sidebarLayout(
      sidebarPanel(
        textInput("folder_id", "Enter Folder ID:", ""),
        actionButton("list_files", "List Files")
      ),
      mainPanel(
        tableOutput("file_table")
      )
    )
  ),
  
  # Server stuff
  server = function(input, output) {
    observeEvent(input$list_files, {
      # Authenticate Google Drive and Google Sheets
      drive_auth()
      sheets_auth()
      
      # Get list of files in the folder
      files_in_folder <- drive_ls(path = as_id(input$folder_id))
      
      # Extract the names of files into a data frame
      file_names <- data.frame(Files = files_in_folder$name)
      
      # Output the file names
      output$file_table <- renderTable(file_names)
      
      # Create a new Google Sheets file
      new_sheet <- sheet_create("My New Sheet")
      
      # Write the data frame to the new Google Sheets file
      sheet_write(file_names, ss = new_sheet, sheet = 1, range = "A1")
    })
  }
)
