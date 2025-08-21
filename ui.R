library(shiny)
library(shinycssloaders)

# Define UI for application that draws a histogram
shinyUI(
    fluidPage(
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "custom555.css"),
            tags$script(src = "myscript.js"),
            # font
            tags$link(href='https://cdn.jsdelivr.net/gh/vdustr/taipei-sans-tc/packages/core/dist/Regular/TaipeiSansTCBeta-Regular.css', rel='stylesheet'),
            #tags$link(href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap", rel="stylesheet"),
            
            
            tags$meta(charset="UTF-8"),
            tags$meta(`http-equiv`="pragma", content="no-cache"),
            tags$meta(`http-equiv`="Cache-Control", content="no-cache, must-revalidate"),
            tags$meta(`http-equiv`="expires", content="0"),
            
            tags$title("臺灣未來的豪雨風險地圖"),
            
            tags$meta(name="title", content="臺灣未來的豪雨風險地圖"),
            tags$meta(name="description", content="在氣候變遷之下，再不減低碳排放量的臺灣豪雨日數有多少呢？"),
            
            tags$meta(property="og:type", content="website"),
            tags$meta(property="og:url", content="https://miaochien.shinyapps.io/ccdashboard-children/"),
            tags$meta(property="og:description", content="在氣候變遷之下，再不減低碳排放量的臺灣豪雨日數有多少呢？"),
            tags$meta(property="og:image", content="https://storage.googleapis.com/shiny-for-gp/rain-preview.png"),
            
            
            tags$meta(name="viewport", content="width=device-width, initial-scale=1.0")
        ),

        tabsetPanel(id='senario',
            tabPanel('tab-TP',
                fluidPage( class="inner",
                    menuHTML(),
                    # div(class='menu', 
                    #     div(class="menu-hamburger1"), div(class="menu-hamburger2"), div(class="menu-circle")
                    #     ),
                           
                    column(width=4, class="left-control-panel col-md-4 col-sm-12", 
                        div(class="block title",
                            div(class='block_logo',
                                img(class='logo', src="img/logo.png")
                            ),
                            
                            conditionalPanel( class='conditionPanel-description', id='cond-description-map',
                                  condition = "input.presentType_TP=='page80mm'",
                                  main_title1(),
                                  content_map('TP', targetName),
                            ),
                            conditionalPanel( class='conditionPanel-description', id='cond-description-map',
                                  condition = "input.presentType_TP=='page200mm'",
                                  main_title2(),
                                  content_timeline('TP', targetName),
                            ),
                            
                        ),

                        div(class='block btn-inline',
                            ui_btn1('TP'), ui_btn2('TP')
                        ),
                        conditionalPanel( class='block conditionPanel-info',
                            condition = "input.presentType_TP=='page80mm'",
                            ui_sliderInput(num="1", 'TP'),
                            legend_map("80mm")
                        ),
                        
                        conditionalPanel( class='block conditionPanel-info',
                            condition = "input.presentType_TP=='page200mm'",
                            ui_sliderInput(num="2", 'TP'),
                            legend_map("200mm")
                        ),
                        div(class="block note",
                            note(targetName, "desktop")
                        )
                      
                    ),
                    column(width=8, class="right-control-panel col-md-8 col-sm-12", 
                        tabsetPanel( id="presentType_TP",
                            tabPanel("page80mm",
                                     lapply(seq(from=1980, to=2100, by=5), FUN = function(i) {
                                         conditionalPanel(condition = paste0("input.yearSelection1_TP=='", i,"'"),
                                                          div(id="map_80mm",
                                                              div(class='map-and-rain', 
                                                                  img(class='rainMap', src=paste0("img/Taiwan_80mm/",i,".png"))
                                                              )))
                                     })
                            ),
                            tabPanel("page200mm",
                                     lapply(seq(from=1980, to=2100, by=5), FUN = function(i) {
                                         conditionalPanel(condition = paste0("input.yearSelection2_TP=='", i,"'"),
                                                          div(id="map_200mm",
                                                              div(class='map-and-rain', 
                                                                  img(class='rainMap', src=paste0("img/Taiwan_200mm/",i,".png"))
                                                              )))
                                     })
                            )
                        ),
                        note(targetName, "mobile")
                        
                    )
                )  
            ), 
            tabPanel('tab-NT',
            ), 
            tabPanel('tab-TY',

            ), 
            tabPanel('tab-TC',

            ), 
            tabPanel('tab-TN',

            ), 
            tabPanel('tab-KS',
                       
            )
        )
    )
)
