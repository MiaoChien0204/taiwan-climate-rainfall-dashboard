# 台灣氣候變遷降雨風險儀表板-大雨日趨勢圖

[![Shiny](https://img.shields.io/badge/Shiny-1.7.0+-blue.svg)](https://shiny.rstudio.com/)
[![R](https://img.shields.io/badge/R-4.0+-green.svg)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Live Demo](https://img.shields.io/badge/Demo-Live-brightgreen.svg)](https://miaochien.shinyapps.io/ccdashboard-rain/)

> 互動式網頁儀表板，展示台灣在氣候變遷情境下的未來降雨模式和極端天氣風險。

## 🌍 專案概述

本專案為一個基於 R Shiny 開發的互動式氣候變遷視覺化工具，呈現 1980 年至 2100 年台灣地區的降雨趨勢預測。重點關注大雨（80毫米以上）和豪雨（200毫米以上）模式，幫助使用者了解在 RCP8.5 氣候情境下（最不積極減碳路徑），氣候變遷如何影響台灣的極端降雨事件。

### 核心功能
- **時間軸互動**: 以 5 年為間隔探索 1980-2100 年降雨模式
- **雙重雨量強度視圖**: 大雨（24小時80毫米以上）與豪雨（24小時200毫米以上）
- **響應式設計**: 針對桌面和行動裝置優化
- **即時動畫**: 播放時間軸以觀察降雨模式演變
- **區域覆蓋**: 聚焦台灣主要都會區

## 🎯 技術特色

### 前端技術
- **框架**: R Shiny 響應式網頁應用程式
- **樣式**: 自訂 CSS 與 Bootstrap 網格系統
- **字體**: 台北黑體 (Taipei Sans TC) 優化中文顯示
- **互動**: JavaScript 與 HTML5 整合

### 後端架構
- **資料處理**: R 語言資料操作管道
- **視覺化**: 預處理地圖影像與動態載入
- **部署**: Shinyapps.io 雲端平台

### 資料來源
- **TCCIP 平台**: 台灣氣候變遷推估資訊與調適知識平台
- **氣候模型**: GFDL-CM3
- **氣象局**: 降雨分級標準

## 🚀 現場演示

🔗 **線上展示**: [台灣降雨風險儀表板](https://miaochien.shinyapps.io/ccdashboard-rain/)

![Desktop Dashboard](www/img/2020_heavyRainRisk.gif)


## 📊 視覺化特色

### 地圖視覺化
- **空間分析**: 120+ 年降雨資料地理視覺化
- **風險評估**: 不同區域的顏色編碼風險等級
- **圖例系統**: 清楚的降雨日數指標

### 使用者介面
- **直覺控制**: 簡單的滑桿和按鈕導航
- **響應式佈局**: 適應不同螢幕尺寸
- **無障礙設計**: 清晰的標籤和導航結構

## 🌡️ 氣候情境說明

本儀表板採用 **RCP8.5 情境**，代表：
- 最高溫室氣體濃度軌跡
- "一切照舊" 碳排放模式
- 最保守的氣候行動假設

## ⚠️ 風險評估

### 大雨（80毫米以上）風險：
- 山區可能發生山洪暴發
- 落石和坍方
- 平地低窪處易發生積淹水

### 豪雨（200毫米以上）風險：
- 嚴重山洪暴發
- 大規模山崩和土石流
- 廣泛都市淹水

## 🛠️ 本地開發設定

### 系統需求
- R (版本 4.0 以上)
- RStudio (建議使用)

### 安裝相依套件
```r
install.packages(c(
  "shiny",
  "shinycssloaders", 
  "shinyWidgets",
  "magrittr",
  "dplyr",
  "tidyr"
))
```

### 執行應用程式
1. 複製此儲存庫：
```bash
git clone https://github.com/[your-username]/taiwan-climate-rainfall-dashboard.git
cd taiwan-climate-rainfall-dashboard
```

2. 開啟 R/RStudio 並設定工作目錄到專案資料夾

3. 執行應用程式：
```r
shiny::runApp()
```

4. 在瀏覽器中開啟 `http://localhost:3838`

## 📁 專案結構

```
├── ui.R                    # 使用者介面定義
├── server.R                # 伺服器邏輯與反應性
├── global.R                # 全域變數與函數
├── www/                    # 靜態網頁資源
│   ├── custom555.css       # 自訂樣式
│   └── img/                # 圖片與降雨地圖
│       ├── Taiwan_80mm/    # 大雨預測地圖
│       ├── Taiwan_200mm/   # 豪雨預測地圖
│       └── legend_*.png    # 地圖圖例
└── rsconnect/              # 部署設定
```

## 🎨 設計特色

### 視覺設計
- **色彩系統**: 藍綠漸層（大雨）、橙紅漸層（豪雨）
- **字體設計**: 台北黑體提升中文閱讀體驗
- **互動回饋**: 即時載入動畫與狀態指示

### 使用者體驗
- **簡潔介面**: 最小化學習曲線
- **直覺操作**: 拖拉滑桿即可探索時間變化
- **資訊層次**: 清楚的內容組織與視覺階層

## 🔬 科學價值

### 氣候科學
- **長期趨勢**: 120年時間跨度分析
- **極端事件**: 聚焦高影響天氣現象
- **政策相關**: 支援氣候調適規劃

### 教育意義
- **公眾教育**: 提升氣候變遷認知
- **視覺化學習**: 複雜資料的直覺呈現
- **互動探索**: 使用者主導的學習體驗

## 🤝 貢獻指南

歡迎各種形式的貢獻！請參閱 [CONTRIBUTING.md](CONTRIBUTING.md) 了解詳細指南。

### 貢獻類型
- 錯誤回報與修正
- 功能建議與實作
- 文件改善
- 效能優化
- 翻譯協助

## 📄 授權條款

本專案採用 MIT 授權條款 - 詳見 [LICENSE](LICENSE) 檔案。

## 🙏 致謝

- 台灣氣候變遷推估資訊與調適知識平台 (TCCIP)
- 國家災害防救科技中心
- 中央氣象局
- 綠色和平台灣辦公室（原始專案背景）

---

*本儀表板旨在提升對氣候變遷對台灣極端天氣模式影響的認知，支持基於實證的氣候調適規劃。*

## English Version

For the English version of this README, please see [README.md](README.md).
