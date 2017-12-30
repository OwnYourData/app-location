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
                items <- readItems(app, repo_url)
                notif$readItemsNotification(items)
        }
        
        return(appStart)
}

# App specific code =======================================
output$record_count <- renderUI({
        app <- setupApp(session$userData$piaUrl,
                        session$userData$appKey,
                        session$userData$appSecret,
                        session$userData$keyItems)
        repo_url <- itemsUrl(app$url, appRepoDefault)
        items <- readItems(app, repo_url)
        as.character(nrow(items))
})
