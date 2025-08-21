library(shiny)
library(shinycssloaders)

# Define server logic required to draw a histogram
shinyServer(function(session, input, output) {


    observeEvent(input$yearSelection2_TP,{
        selectedYear = input$yearSelection2_TP

        output$map_200mm <- renderUI({
            div(class='map-and-rain', 
                style=paste0("background: url(img/Taiwan_200mm/",selectedYear,".png);
                              background-repeat: no-repeat; 
                              background-position: center; 
                              width: 100%; 
                              height: 100%")
            )
        })
        
    })

 
    # btn control tabsetPanel -------------------------------------------------
    
    ### TP ###
    observeEvent(input$btn_80mm_TP, {
        updateTabsetPanel(session, "presentType_TP",
                          selected = "page80mm")
    })
    
    observeEvent(input$btn_200mm_TP, {
        updateTabsetPanel(session, "presentType_TP",
                          selected = "page200mm")
    })
    
    
    
    
    
    
    
    # page control ------------------------------------------------------------    
    observe({
        query <- parseQueryString(session$clientData$url_search)

        #?location=NT
        location = query$location
        
        tryCatch({
            page = paste('tab', location, sep="-")
            updateTabsetPanel(session, inputId = "senario", selected = page)    
        }, error = function(e){
            message("沒有這個頁面")
        })
    })

})
