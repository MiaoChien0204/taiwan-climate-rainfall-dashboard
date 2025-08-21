library(magrittr)
library(dplyr)
library(tidyr)
library(shiny)
library(shinyWidgets)


#### Data ####
cityList = c("臺北市", "新北市", "桃園市", "臺中市", "臺南市", "高雄市")

# 起始年度
startYear = 1980

#時間軸最大Y
maxDay = 160

mapYear_200 = c(1979, 1984, 1990, 1997, 2000, 2007, 2012, 2018, 2027, 
                2029, 2032, 2036, 2039, 2046, 2053, 2057, 2061, 2067, 
                2072, 2075, 2082, 2086, 2090, 2095, 2100)

mapYear_80 = c(1981, 1985, 1990, 1997, 2000, 2007, 2012, 2017, 2018,
               2027, 2032, 2037, 2039, 2046, 2051, 2057, 2061, 2068,
               2072, 2078, 2083, 2086, 2093, 2096, 2098)


#### color schema ###

loader_schema = "#548929"


###### UI ######


getCityName = function(cName){
  cityName = switch( cName,
                     "TP" = "臺北市",
                     "NT" = "新北市",
                     "TY" = "桃園市",
                     "TC" = "臺中市",
                     "TN" = "臺南市",
                     "KS" = "高雄市"
  )
  cityName
}

getCityNameEng = function(eName){
  cityName = switch( eName,
                     "臺北市" = "TP" ,
                     "新北市" = "NT" ,
                     "桃園市" = "TY" ,
                     "臺中市" = "TC" ,
                     "臺南市" = "TN" ,
                     "高雄市" = "KS"
  )
  cityName
}



ui_sliderInput = function(num, cName){
  div(class="yearSelection",
      sliderInput(
        inputId=paste0("yearSelection",num,"_", cName), 
        label = div(class="yearSelection-label", "選擇年份"),
        min = startYear, max = 2100,
        value = startYear, 
        step = 5,
        sep = "",
        width = '100%',
        animate =  animationOptions(
          interval = 500, loop = FALSE,
          playButton = HTML("<span class='glyphicon glyphicon-play-circle'></span>")
        )
      ) 
  )
}

ui_sliderInput2 = function(cName){
  div(class="yearSelection",
      sliderInput(
        inputId=paste0("yearSelection2_", cName), 
        label = div(class="yearSelection-label", "選擇年份"),
        min = startYear, max = 2100,
        value = startYear, 
        step = 5,
        sep = "",
        width = '100%',
        animate =  animationOptions(
          interval = 500, loop = FALSE,
          playButton = HTML("<span class='glyphicon glyphicon-play-circle'></span>")
        )
      ) 
  )
}

## BTN ###


ui_btn1 = function(cName){
  shinyWidgets::actionBttn(
    inputId = paste0("btn_80mm_", cName),
    label = "降雨80毫米",
    style = "pill",
    color = "primary",
    size = "md"
  )
}

ui_btn2 = function(cName){
  shinyWidgets::actionBttn(
    inputId = paste0("btn_200mm_", cName),
    label = "降雨200毫米",
    style = "pill",
    color = "primary",
    size = "md"
  )
}

main_title1 = function(){
  div(id='main-title',
      p("大雨日趨勢圖")
  )
}

main_title2 = function(){
  div(id='main-title',
      p("豪雨日趨勢圖")
  )
}


#id="description-map" / id="description-timeline"
content_map = function(cName, targetName){
  cityName = getCityName(cName)
  
  div(
    div(class="description desktop", id="description-map",
        tags$span(p("圖為臺灣自 1980 年起的大雨日數變化")),
        tags$span(p("2020年後的推估資料是採用「最不積極減碳情境 (RCP8.5)」下的推估結果。")),
        tags$span(p("大雨將導致山區可能發生山洪暴發、落石和坍方；平地排水差或是低窪處易發生積淹水。")),
        p("大雨採用中央氣象局定義之 「24 小時累積雨量達 80 毫米以上之降雨現象」。依據科技部TCCIP平台所提供的「每日降雨量推估資料」，選用氣候模型GFDL-CM3數據呈現。")
    ),
    div(class="description mobile", id="description-map",
        tags$span(p("圖為臺灣自 1980 年起的大雨日數變化。2020年後的推估資料是採用「最不積極減碳情境 (RCP8.5)」下的推估結果。")),
        tags$span(p("大雨將導致山區可能發生山洪暴發、落石和坍方；平地排水差或是低窪處易發生積淹水。")),
        p("大雨採用中央氣象局定義之 「24 小時累積雨量達 80 毫米以上之降雨現象」。依據科技部TCCIP平台所提供的「每日降雨量推估資料」，選用氣候模型GFDL-CM3數據呈現。")
        
    )
  )
  
}

content_timeline = function(cName, targetName){
  cityName = getCityName(cName)
  
  div(
    div(class="description desktop", id="description-timeline",
        tags$span(p("圖為臺灣自 1980 年起的豪雨日數變化。")),
        tags$span(p("2020年後的推估資料是採用「最不積極減碳情境 (RCP8.5)」下的推估結果。")),
        tags$span(p("豪雨將導致山區山洪暴發、落石、坍方和土石流；平地易發生積淹水。")),
        p("豪雨採用中央氣象局定義之 「24 小時累積雨量達 200 毫米以上之降雨現象」。依據科技部TCCIP平台所提供的「每日降雨量推估資料」，選用氣候模型GFDL-CM3數據呈現。")
    ),
    div(class="description mobile", id="description-timeline",
        tags$span(p("圖為臺灣自 1980 年起的豪雨日數變化。2020年後的推估資料是採用「最不積極減碳情境 (RCP8.5)」下的推估結果。")),
        tags$span(p("豪雨將導致山區山洪暴發、落石、坍方和土石流；平地易發生積淹水。")),
        p("豪雨採用中央氣象局定義之 「24 小時累積雨量達 200 毫米以上之降雨現象」。依據科技部TCCIP平台所提供的「每日降雨量推估資料」，選用氣候模型GFDL-CM3數據呈現。")
        
    )
  )
}



legend_map = function(type=c("80mm", "200mm")){
  if(type=="80mm"){
    legendName = "img/legend_rain80.png"
    rainType = "大雨"
  }else{
    legendName = "img/legend_rain200.png"
    rainType = "豪雨"
  }
  
  div(class="legend", id="legend-map",
      p(paste0("一年之中 ",type," ", rainType,"降雨日數")),
      img(id='legend-img', src=legendName)
  )
}

note = function(targetName, rwd=c("desktop", "mobile")){
  
    div(class=paste0("description ", rwd), id='note-panel',
        tags$span(p("資料來源")),
        HTML("<p><a href='https://tccip.ncdr.nat.gov.tw/ds_01.aspx' target='_blank'>科技部「臺灣氣候變遷推估資訊與調適知識平台計畫」（TCCIP）/國家災害防救科技中心</a></p>")
    )
  
  
}


menuHTML = function(){
  HTML("<nav role='navigation'>
    <div id='menuToggle'>
      <!--
      A fake / hidden checkbox is used as click reciever,
    so you can use the :checked selector on it.
    -->
      <input type='checkbox' />
        
        <!--
        Some spans to act as a hamburger.
      
      They are acting like a real hamburger,
      not that McDonalds stuff.
      -->
        <span></span>
        <span></span>
        <span></span>
        
        <!--
        Too bad the menu has to be inside of the button
      but hey, it's pure CSS magic.
    -->
    <ul id='menu'>
      <a target='_self' href='https://miaochien.shinyapps.io/ccdashboard-housekeeper/'><li>查看高溫風險圖</li></a>
      <a target='_self' href='https://cloud.greentw.greenpeace.org/petition-climate-emergency'><li>遊戲體驗</li></a>
      <a target='_self' href='https://change.greenpeace.org.tw/2020/petition/zh-TW.2020.climate.emergency.signup.mc/events-tpe.html'><li>極端氣候事件簿</li></a>
      <a target='_self' href='https://change.greenpeace.org.tw/2020/petition/zh-TW.2020.climate.emergency.signup.mc/sign.html'><li>加入連署</li></a>
    </ul>
  </div>
</nav>")
}



