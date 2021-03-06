# top-level file for shiny app
# last update: 2017-09-19

# app wide constants and functions
source('constants.R')

server <- function(input, output, session) {
        source('appLogic.R', local=TRUE)
        tr <- callModule(srvLocalization, 'oyd')
        notif <- callModule(srvNotification, 'oyd', tr)
        appStart <- callModule(appServer, 'oyd', tr, notif)
        callModule(srvModule, 'oyd', tr, notif, appStart)
}

shinyApp(ui = uiDesktop('oyd'), server = server)

# first start
# library(shiny); install.packages('~/oyd/base/oydapp/', repos=NULL, type='source'); library(oydapp); runApp('~/oyd/views/app-location', host='0.0.0.0', port=1252)
# afterwards
# detach('package:oydapp', unload = TRUE); install.packages('~/oyd/base/oydapp/', repos=NULL, type='source'); library(oydapp); runApp('~/oyd/views/app-location', host='0.0.0.0', port=1252)
