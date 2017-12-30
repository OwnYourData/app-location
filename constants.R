# global constants available to the app
# last update: 2017-06-11

# required Libraries
library(shiny)
library(shinyjs)
library(shinyBS)
library(rintrojs)
library(sodium)
library(oydapp)
library(shinyAce)

# sources for user specific UI
source('uiAnalysis.R')
source('uiSource.R')
source('uiReport.R')

# IMPORTANT NOTE: these variables are shared between ALL user sessions!

# constants required for every app
appName <- 'location'
appTitle <- 'Ortsdaten'
app_id <- 'eu.ownyourdata.location'
appRepoDefault <- app_id
helpUrl <- 'https://www.ownyourdata.eu/apps/orte'

# console logging
oydLog <- function(msg)
        cat(paste(Sys.time(), msg, "\n"))
oydLog('App start')

# Version information
currVersion <- "0.3.0"
verHistory <- data.frame(rbind(
        c(version = "0.3.0",
          text    = "erstes Release")
))

# translations for app specific localizations
localization <- list(
        'ctrlTrnsl_appTitle' = list('de' = 'Orte', 
                                    'en' = 'Locations'),
        'ctrlTrnsl_tabList' = list('de' = 'Liste', 
                                    'en' = 'List'),
        'ctrlTrnsl_repoName' = list('de' = 'Liste:', 'en' = 'Repo:')
)

# app specific constants ==================================
