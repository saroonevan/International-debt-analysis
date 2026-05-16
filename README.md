# International Debt Analysis 
## Project Overview
A comprehensive analysis of international debt statistics across 134 developing countries from 2000 to 2024, using World Bank IDS (International Debt Statistics) data. The project combines Python EDA, MySQL queries, and Power BI visualizations.

## Datasets Used
| File | Description | Records |
|------|-------------|---------|
| IDS_ALLCountries_Data.csv | Debt values by country, series, year | 1.46M rows |
| IDS_CountryMetaData.csv | Country metadata (region, income group) | 134 countries |
| IDS_SeriesMetaData.csv | Indicator definitions and descriptions | 501 indicators |
| IDS_FootNoteMetaData.csv | Data footnotes and quality flags | 1,445 records |

## Tools & Technologies
- **Python** — pandas, numpy, matplotlib, seaborn
- **MySQL** — data storage and SQL analysis
- **Power BI** — interactive dashboard (6 pages)
- **Jupyter Notebook** — EDA and data cleaning
- **GitHub** — version control

## Key Insights
- **134 countries** analyzed across **6 regions**
- **501 debt indicators** tracked over **25 years** (2000–2024)
- **China** holds the highest external debt at **$2.42 Trillion** in 2024
- **East Asia & Pacific** dominates with **40%** of total developing world debt
- **South Asia** is the fastest growing region — **593% increase** since 2000
- **Sub-Saharan Africa** debt grew **310%** since 2000

## Power BI Dashboard Pages
1. **Overview** — KPI cards, regional line chart, donut chart
2. **Performance** — Top 10 countries, debt service, income group comparison
3. **Footnotes Data** — Footnote activity timeline, most footnoted countries
4. **Geographic** — World map with debt bubbles
5. **Debt vs Quality** — Treemap, waterfall, combo chart
6. **Regional Analysis** — Area chart, ribbon chart, funnel chart

## SQL Analysis
- Total debt per country and indicator
- Countries above global average debt
- Ranking countries by debt using window functions
- Percentage contribution of each country to global debt
- Most dominant indicator per country

## Python EDA Steps
1. Data loading and inspection
2. Handling missing values
3. Wide to long format using pd.melt()
4. Merging 5 datasets on Country Code and Series Code
5. Outlier detection and handling
6. Groupby analysis and aggregations

## Author
**Saroon** — Team Lead, AnnexMed | Data Science Learner
- Domain: US Healthcare RCM | AR Follow-up | Denials Management
- GitHub: github.com/saroonevan

