# Data Sources and Methodology

## Primary Data Sources

### Taiwan Climate Change Projection Information and Adaptation Knowledge Platform (TCCIP)
- **Organization**: National Science and Technology Center for Disaster Reduction
- **Website**: https://tccip.ncdr.nat.gov.tw/index_eng.aspx
- **Data Type**: Daily precipitation projections
- **Temporal Coverage**: 1980-2100
- **Spatial Resolution**: Taiwan regional grid
- **Update Frequency**: Periodic updates based on latest climate models

### Central Weather Bureau Standards
- **Heavy Rain Definition**: 24-hour cumulative rainfall ≥ 80mm
- **Torrential Rain Definition**: 24-hour cumulative rainfall ≥ 200mm
- **Reference**: Central Weather Bureau meteorological classifications

## Climate Model Information

### GFDL-CM3 Model
- **Full Name**: Geophysical Fluid Dynamics Laboratory Climate Model 3
- **Institution**: NOAA/Geophysical Fluid Dynamics Laboratory
- **Model Type**: Earth System Model
- **Resolution**: ~200km horizontal resolution
- **Components**: Atmosphere, ocean, land, sea ice

### RCP8.5 Scenario
- **Name**: Representative Concentration Pathway 8.5
- **Description**: High greenhouse gas concentration scenario
- **CO2 Equivalent**: ~1370 ppm by 2100
- **Characteristics**: "Business as usual" emissions pathway
- **Temperature Increase**: 3.2-5.4°C global average by 2100

## Data Processing Methodology

### Temporal Analysis
1. **Historical Period**: 1980-2019 (observed/reanalysis data)
2. **Projection Period**: 2020-2100 (model projections)
3. **Time Step**: Daily precipitation values
4. **Aggregation**: Annual count of days exceeding thresholds

### Threshold Analysis
```
Heavy Rain Days = Count(Daily Precipitation ≥ 80mm) per year
Torrential Rain Days = Count(Daily Precipitation ≥ 200mm) per year
```

### Spatial Processing
1. **Grid Point Extraction**: Taiwan land area grid points
2. **Quality Control**: Outlier detection and removal
3. **Interpolation**: Spatial interpolation for visualization
4. **Projection**: Geographic coordinate system (WGS84)

## Uncertainty and Limitations

### Model Uncertainty
- Single climate model (GFDL-CM3) representation
- Model bias in precipitation simulation
- Downscaling uncertainty for local projections
- Natural climate variability not fully captured

### Scenario Limitations
- RCP8.5 represents high-emission pathway only
- Does not account for future emission reduction policies
- Socioeconomic assumptions may not reflect actual development

### Temporal Limitations
- Projection uncertainty increases with time
- Decadal variability may mask long-term trends
- Extreme events may be underrepresented

## Data Quality Assurance

### Validation Methods
1. **Historical Validation**: Comparison with observed rainfall data
2. **Consistency Checks**: Inter-annual and spatial consistency
3. **Extreme Value Analysis**: Statistical validation of extreme events
4. **Peer Review**: TCCIP platform data undergoes scientific review

### Known Limitations
- Mountain precipitation may be underestimated
- Urban heat island effects not explicitly modeled
- Sub-daily precipitation patterns not captured
- Localized convective events may be missed

## Visualization Methodology

### Color Mapping
- **Heavy Rain (80mm)**: Blue-green gradient scale
- **Torrential Rain (200mm)**: Orange-red gradient scale
- **Scale**: 0-160+ days per year
- **Intervals**: 20-day increments for visual clarity

### Temporal Smoothing
- 5-year intervals for timeline visualization
- Moving averages applied for trend clarity
- Year selection represents center of 5-year window

## References and Citations

### Primary Literature
1. TCCIP (2020). Taiwan Climate Change Projection Information and Adaptation Knowledge Platform. National Science and Technology Center for Disaster Reduction.

2. Donner, L. J., et al. (2011). The dynamical core, physical parameterizations, and basic simulation characteristics of the atmospheric component AM3 of the GFDL global coupled model CM3. Journal of Climate, 24(13), 3484-3519.

3. Riahi, K., et al. (2011). RCP 8.5—A scenario of comparatively high greenhouse gas emissions. Climatic Change, 109(1-2), 33-57.

### Data Attribution
```
Data Source: Taiwan Climate Change Projection Information and Adaptation Knowledge Platform (TCCIP)
Climate Model: GFDL-CM3
Scenario: RCP8.5
Processing: Custom analysis for precipitation threshold exceedance
Visualization: Interactive web dashboard (R Shiny)
```

## Technical Implementation Details

### Data Storage
- Image format: PNG (optimized for web)
- Resolution: 800x600 pixels
- Compression: Lossless PNG compression
- File naming: `[year].png` in respective threshold folders

### Performance Optimization
- Pre-processed visualization images
- Lazy loading for improved performance
- Responsive image sizing
- Minimal server-side computation

## Contact for Data Questions

For technical questions about the underlying climate data:
- **TCCIP Platform**: https://tccip.ncdr.nat.gov.tw/index_eng.aspx
- **Contact**: TCCIP support team

For questions about this specific implementation:
- **Project Maintainer**: [Your contact information]
- **GitHub Issues**: Use repository issue tracker for technical questions

---

*Last Updated: August 2025*
*Version: 1.0*
