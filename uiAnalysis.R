# layout for Analysis section
# last update: 2017-06-11

uiAnalysis <- function(ns){
        tabsetPanel(type='tabs',
                tabPanel(uiOutput(ns('ctrlTrnsl_tabList')), br(),
                         span('records:'), 
                         uiOutput(ns('record_count'), inline = TRUE),
                         DT::dataTableOutput(ns('location_items'))
                )
        )
}
