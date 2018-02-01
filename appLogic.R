# application specific logic
# last update: 2017-06-11

# Code required for every app ========================
# initialization
session$userData$piaUrl <- ''
session$userData$appKey <- ''
session$userData$appSecret <- ''
session$userData$keyItems <- data.frame()
session$userData$initFlag <- TRUE
session$userData$openDialog <- ''

appServer <- function(input, output, session, tr, notif){
        source('srvLocation.R', local = TRUE)       

        appStart <- function(){
                ns <- session$ns
                app <- setupApp(session$userData$piaUrl,
                                session$userData$appKey,
                                session$userData$appSecret,
                                session$userData$keyItems)
                repo_url <- itemsUrl(app$url, appRepoDefault)
                save(app, repo_url, file='tmpInv.RData')
                items <- readItems(app, repo_url)
                notif$readItemsNotification(items)
                output$record_count <- renderUI({
                        as.character(nrow(items))
                })
                output$location_items = DT::renderDataTable({
                        items
                })
        }
        
        return(appStart)
}

# App specific code =======================================
