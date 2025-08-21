# Taiwan Climate Change Rainfall Risk Dashboard - Technical Documentation

## Architecture Overview

This Shiny application follows a modular architecture with clear separation of concerns between UI, server logic, and global utilities.

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│      ui.R       │    │    server.R     │    │    global.R     │
│                 │    │                 │    │                 │
│ • Layout        │◄──►│ • Reactivity    │◄──►│ • Functions     │
│ • Components    │    │ • Event Logic   │    │ • Variables     │
│ • Styling       │    │ • Data Binding  │    │ • Utilities     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
          │                       │                       │
          └───────────────────────┼───────────────────────┘
                                  │
                         ┌─────────────────┐
                         │   Static Assets │
                         │                 │
                         │ • CSS Files     │
                         │ • Images        │
                         │ • JavaScript    │
                         └─────────────────┘
```

## File Structure and Responsibilities

### Core Application Files

#### `ui.R` - User Interface Definition
- **Purpose**: Defines the complete user interface structure
- **Key Components**:
  - HTML head configuration (meta tags, fonts, social sharing)
  - Responsive layout using Bootstrap grid system
  - Conditional panels for different visualization modes
  - Interactive controls (sliders, buttons)

#### `server.R` - Server Logic
- **Purpose**: Handles all server-side logic and reactivity
- **Key Functions**:
  - Event observers for user interactions
  - Dynamic UI updates based on user input
  - URL parameter parsing for deep linking
  - Image rendering logic

#### `global.R` - Shared Resources
- **Purpose**: Contains shared functions, variables, and utilities
- **Key Elements**:
  - Data configurations and constants
  - UI component generators
  - Utility functions for city name mapping
  - Reusable UI modules

### Static Assets (`www/` directory)

#### `custom555.css` - Custom Styling
- **Purpose**: Application-specific styling and responsive design
- **Features**:
  - Custom color scheme
  - Responsive breakpoints
  - Typography settings
  - Animation effects

#### Image Assets
- **`img/Taiwan_80mm/`**: Heavy rain projection maps (1980-2100)
- **`img/Taiwan_200mm/`**: Torrential rain projection maps (1980-2100)
- **`img/legend_*.png`**: Color scale legends
- **`img/logo.png`**: Application branding

## Technical Specifications

### R Dependencies

```r
# Core Shiny Framework
library(shiny)           # Version: 1.7.0+
library(shinycssloaders) # Loading animations
library(shinyWidgets)    # Enhanced UI widgets

# Data Manipulation
library(magrittr)        # Pipe operators
library(dplyr)          # Data manipulation
library(tidyr)          # Data tidying
```

### Browser Compatibility
- **Chrome**: 80+ ✅
- **Firefox**: 75+ ✅
- **Safari**: 13+ ✅
- **Edge**: 80+ ✅
- **Mobile Safari**: iOS 12+ ✅
- **Chrome Mobile**: Android 8+ ✅

### Performance Considerations

#### Image Optimization
- **Format**: PNG with lossless compression
- **Size**: 800x600 pixels (optimized for web)
- **Loading**: Conditional loading based on user selection
- **Caching**: Browser caching enabled for static assets

#### Memory Management
- **Lazy Loading**: Images loaded only when needed
- **State Management**: Minimal server-side state storage
- **Reactivity**: Efficient reactive expressions to minimize computation

## Data Flow Architecture

```
User Interaction
       │
       ▼
Input Processing (server.R)
       │
       ▼
State Update
       │
       ▼
UI Re-rendering
       │
       ▼
Image Display Update
```

### Reactive Programming Pattern

```r
# Example reactive pattern
observeEvent(input$yearSelection1_TP, {
  # 1. Capture user input
  selected_year <- input$yearSelection1_TP
  
  # 2. Update UI based on input
  output$rainfall_map <- renderUI({
    # 3. Generate appropriate visualization
    img(src = paste0("img/Taiwan_80mm/", selected_year, ".png"))
  })
})
```

## Component Documentation

### UI Components

#### Year Selection Slider
```r
ui_sliderInput(num, cName)
```
- **Parameters**:
  - `num`: Slider instance number (1 or 2)
  - `cName`: City code identifier
- **Returns**: Shiny slider input with animation controls
- **Range**: 1980-2100 (5-year steps)

#### Rain Type Buttons
```r
ui_btn1(cName)  # Heavy rain (80mm+)
ui_btn2(cName)  # Torrential rain (200mm+)
```
- **Purpose**: Toggle between rain intensity visualizations
- **Styling**: Pill-shaped buttons with primary color scheme

#### Content Panels
```r
content_map(cName, targetName)     # Heavy rain description
content_timeline(cName, targetName) # Torrential rain description
```
- **Responsive**: Different content for desktop/mobile
- **Localization**: Traditional Chinese text with climate science context

### Server Functions

#### Event Handling
```r
observeEvent(input$btn_80mm_TP, {
  updateTabsetPanel(session, "presentType_TP", selected = "page80mm")
})
```
- **Pattern**: Observer pattern for UI state management
- **Scope**: Each city has independent event handlers

#### URL Parameter Processing
```r
observe({
  query <- parseQueryString(session$clientData$url_search)
  location <- query$location
  # Update active tab based on URL parameter
})
```
- **Deep Linking**: Support for direct city access via URL
- **Error Handling**: Graceful fallback for invalid parameters

## Deployment Configuration

### Shinyapps.io Deployment
- **Platform**: RStudio's Shinyapps.io
- **Configuration**: Located in `rsconnect/shinyapps.io/`
- **Scaling**: Automatic scaling based on usage
- **Monitoring**: Built-in application metrics

### Environment Variables
```r
# Production settings
options(shiny.maxRequestSize = 30*1024^2)  # 30MB max upload
options(shiny.sanitize.errors = TRUE)      # Sanitize error messages
```

## Security Considerations

### Input Validation
- **Year Selection**: Bounded to valid range (1980-2100)
- **City Selection**: Validated against predefined list
- **URL Parameters**: Sanitized and validated

### XSS Prevention
- **HTML Escaping**: User inputs properly escaped
- **Content Security Policy**: Restrictive CSP headers
- **Input Sanitization**: All user inputs validated

## Accessibility Features

### WCAG 2.1 Compliance
- **Keyboard Navigation**: Full keyboard accessibility
- **Screen Reader Support**: Proper ARIA labels
- **Color Contrast**: Meets AA standard contrast ratios
- **Alternative Text**: All images have descriptive alt text

### Responsive Design
- **Mobile First**: Optimized for mobile devices
- **Breakpoints**: 
  - Mobile: < 768px
  - Tablet: 768px - 1024px
  - Desktop: > 1024px

## Monitoring and Analytics

### Performance Metrics
- **Load Time**: < 3 seconds initial load
- **Time to Interactive**: < 5 seconds
- **Image Loading**: Progressive loading with indicators

### Error Handling
```r
tryCatch({
  # Application logic
}, error = function(e) {
  # Log error and show user-friendly message
  message("Application error occurred")
})
```

## Development Workflow

### Local Development
1. **Setup**: Install R dependencies
2. **Testing**: Use `shiny::runApp()` for local testing
3. **Debugging**: Utilize RStudio's debugging tools
4. **Performance**: Profile with `profvis` package

### Deployment Process
1. **Testing**: Comprehensive local testing
2. **Staging**: Deploy to staging environment
3. **Validation**: Validate all functionality
4. **Production**: Deploy to production with monitoring

## Future Enhancements

### Planned Features
- **Multi-language Support**: English/Chinese toggle
- **Additional Cities**: Extend coverage to all Taiwan cities
- **Data Export**: Download functionality for visualizations
- **API Integration**: Real-time data updates
- **Advanced Analytics**: Statistical trend analysis

### Technical Improvements
- **Progressive Web App**: Offline functionality
- **WebGL Rendering**: Enhanced visualization performance
- **Lazy Loading**: Improved image loading strategy
- **Caching Strategy**: Advanced caching for better performance

## Troubleshooting Guide

### Common Issues

#### Images Not Loading
- **Cause**: Incorrect file paths or missing images
- **Solution**: Verify file structure and paths in `global.R`

#### Slider Not Responding
- **Cause**: JavaScript conflicts or event handler issues
- **Solution**: Check browser console for errors

#### Layout Issues on Mobile
- **Cause**: CSS responsive design problems
- **Solution**: Test and adjust breakpoints in `custom555.css`

### Debugging Tools
- **Shiny**: `options(shiny.trace = TRUE)` for detailed logging
- **Browser**: Developer tools for client-side debugging
- **R**: RStudio debugger for server-side issues

---

*Last Updated: August 2025*
*Version: 1.0*
