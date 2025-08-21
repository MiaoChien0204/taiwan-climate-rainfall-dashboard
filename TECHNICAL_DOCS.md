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
