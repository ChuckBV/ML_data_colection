################################################################################
#github- zsdawson
#idea- getting object names form google drive to speed up the process for getting
#a image directory 
################################################################################

install.packages(googlesheets4)
library(googlesheets4)
library(googledrive)



gs4_auth(
  email = gargle::gargle_oauth_email(),# more used when using token
  path = NULL,
  scopes = "https://www.googleapis.com/auth/spreadsheets",
  cache = gargle::gargle_oauth_cache(),
  use_oob = gargle::gargle_oob_default(),
  token = NULL
)



gargle::token_fetch()





