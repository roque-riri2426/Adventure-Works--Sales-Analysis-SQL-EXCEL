# Adventure Works Sales Analysis

<div align="center">
  <img src="https://github.com/roque-riri2426/sql-excel/blob/main/adventure_works_dashboard.png" width="100%">
</div>

---

### Table of Contents <a name="toc"></a>

[1. Background](#background)  <br>
[2. Objective](#objective)<br>
[3. Key Insights](#insights-deep-dive) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[3.1. Key Metrics and Insights of Adventure Works](#key-metrics)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;[3.2. Monthly Sales Trend](#monthly-sales-trend)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;[3.3. Top Customers](#top-customers)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;[3.4. Top Models](#top-models)  <br>
[4. Recommendations](#recommendations)  <br>
[5. Key Takeaways](#key-takeaways)  <br>

---

## 1. Background <a name="background"></a>

<p align="justify">
This dataset is all about the Adventure Works, which is a global bicycle manufacturer and distributor analyzed using four years of historical sales data. This project explores overall sales performance, channel distribution, product category trends, top customers, and seasonal patterns, while also assessing profitability and pricing dynamics. Key findings reveal a strong reliance on reseller channels, a high-volume yet low-margin business model, and opportunities to grow profit through increased direct internet sales.
</p>

---

## 2. Objective <a name="objective"></a>

<p align="justify">
The objective of this analysis is to provide an end-to-end examination of Adventure Works' sales data, focusing on sales performance across different countries, sales channels, product categories, and customer segments. The goal is to uncover actionable insights that can support management in making informed decisions, enhancing operational efficiency, increasing sales, and strengthening Adventure Works’ competitiveness in the retail industry.
</p>

---
## 3. Key Insights <a name="insights-deep-dive"></a>
<a href="#toc">[ back to contents ]</a>

### 3.1. Key Metrics and Insights of Adventure Works <a name="key-metrics"></a>  <a href="#toc">[↑]</a>

<div align="center">
  <img src="https://github.com/roque-riri2426/sql-excel/blob/main/key_metrics_1.png" width="60%">
  <img src="https://github.com/roque-riri2426/sql-excel/blob/main/AD_sales_by_category.png" width="40%">
</div> <br>

- <p align="justify">The total sales over the four-year period reached $109.8M, demonstrating strong performance across different regions and countries, largely driven by reseller partnerships. Resellers accounted for 73% of total sales, boosting brand presence and market reach, while internet sales contributed only 27%. Bikes dominated the product mix, generating $94.6M in sales (86.17% of total revenue), whereas clothing, components, and accessories recorded relatively low sales.  </p>

<div align="center">
  <img src="https://github.com/roque-riri2426/sql-excel/blob/main/AD_sales_by_channel.png" width="40%">
</div> <br>

- <p align="justify"> Despite this strong sales volume, gross profit over the four years was only $12.6M, reflecting the impact of a reseller-focused model. Because resellers require competitive wholesale prices to maintain their own margins, Adventure Works sells products to them at lower costs, resulting in thinner or lower profit margins. This heavy reliance on resellers limits the company’s ability to sell more products at retail prices, contributing to lower overall profitability. Additionally, the underperformance of the internet channel further restricts higher-margin sales opportunities. </p>

<div align="center">
  <img src="https://github.com/roque-riri2426/sql-excel/blob/main/key_metrics_2.png" width="60%">
</div> <br>

- <p align="justify"> Over the four-year period, Adventure Works served 18.5K customers, averaging around 4,625 per year. This relatively modest customer count, alongside an average order value of $3.5K, reflects the company’s heavy reliance on resellers making large-volume purchases rather than numerous smaller direct-to-consumer transactions. While this bulk-order model drives high sales volume, it operates at low margins due to competitive wholesale pricing, which limits profitability. Expanding internet sales could diversify the customer base, lower the average order size, and increase profit margins by enabling more sales at retail prices. </p>

---
### 3.2. Monthly Sales Trend <a name="monthly-sales-trend"></a>  <a href="#toc">[↑]</a>
<div align="center">
  <img src="https://github.com/roque-riri2426/sql-excel/blob/main/monthly_sales_trend.png" width="60%">
</div> <br>

- <p align="justify"> Over the four years, sales consistently peaked in February, May, August, September, and November, showing clear demand cycles throughout the year. Since most sales come from resellers, these spikes are likely tied to bulk restocking schedules and seasonal promotions rather than just direct customer purchases. Knowing when these surges happen can help Adventure Works plan production, manage inventory, and time promotions more effectively, while also finding ways to boost sales in the quieter months through direct-to-consumer efforts. </p>

---
### 3.3. Top 5 Customers <a name="top-customers"></a>  <a href="#toc">[↑]</a>

<div align="center">
  <img src="https://github.com/roque-riri2426/sql-excel/blob/main/top-5-customers.png" width="60%">
</div> <br>

- <p align="justify"> Over the four-year period, the top customers contributed only a small share of the total $109.8M in sales, indicating that no single retail buyer plays a major role in overall revenue. This reflects Adventure Works’ reseller-focused approach, where most large sales volumes come from business accounts or bulk orders that are spread across multiple customer records. As a result, individual end-customer purchases have little impact, and the company’s revenue is largely fueled by high-volume B2B transactions rather than repeat high-value retail customers. </p>

---
### 3.4. Top 5 Models <a name="top-models"></a>  <a href="#toc">[↑]</a>

<div align="center">
  <img src="https://github.com/roque-riri2426/sql-excel/blob/main/top-5-models.png" width="60%">
</div> <br>

- <p align="justify"> These top models dominate product sales, with the Mountain-200 alone bringing in $22.3M over four years. All five are high-end bike models, which shows that Adventure Works’ revenue is heavily concentrated in its bicycle line rather than in accessories, clothing, or components. This focus on premium bikes likely drives high sales volume but also ties performance closely to the cycling market’s seasonal and economic trends, making the business more vulnerable to shifts in demand for these specific models.</p>

---
###  Recommendations <a name="recommendations"></a>
- <p align="justify">Strengthen Internet Sales Channel
Invest in e-commerce infrastructure, digital marketing, and customer loyalty programs to increase direct-to-consumer sales. This will help improve profit margins by reducing dependence on low-margin reseller transactions.</p>

- <p align="justify">Rebalance Channel Mix
Gradually shift 5–10% of reseller sales toward internet sales while maintaining reseller relationships. This can be done by offering exclusive online promotions or product bundles that encourage direct purchases.</p>

- <p align="justify">Optimize Product Mix
Encourage sales of higher-margin categories such as accessories, clothing, and components, which currently have low sales share. Use targeted promotions or bundle these with bike purchases to boost cross-selling.</p>

- <p align="justify">Leverage Seasonal Sales Trends
Plan inventory and marketing campaigns around peak months (February, May, August, September, and November). Coordinate with resellers to align bulk orders with these periods while also running direct online promotions.</p>

- <p align="justify">Analyze and Reward High-Performing Resellers
Identify top-performing reseller accounts and offer incentive programs, marketing support, or priority inventory allocation to encourage sustained performance and loyalty.</p>

- <p align="justify">Implementing these recommendations will help Adventure Works improve profitability, balance its sales channels, and reduce over-reliance on bulk reseller orders. A phased approach will ensure steady growth without risking reseller relationships.</p>

---
###  Key Takeaways <a name="key-takeaways"></a>
- <p align="justify">Reseller Dependency
73% of total sales come from resellers, driving high volume but resulting in lower profit margins due to competitive wholesale pricing.</p>

- <p align="justify">Low Internet Sales Share
Internet sales account for only 27% of revenue, limiting opportunities for higher-margin direct sales.</p>

- <p align="justify">Product Sales Concentration
Bikes generate 86.17% of sales ($94.6M), while accessories, clothing, and components make up a small share, signaling low diversification in revenue sources.</p>

- <p align="justify">Seasonal Peaks
Sales consistently spike in February, May, August, September, and November, likely driven by reseller restocking schedules and seasonal market demand.</p>

- <p align="justify">Scattered High-Value Customers
Top customers individually contribute small sales amounts, suggesting that revenue is widely distributed across multiple reseller accounts rather than concentrated in a few large retail buyers.</p>

---

### Tools & Technologies Used

- MS Excel (Interactive Dashboard & Visuals)  
- MYSQL (Exploratory Data Analysis)  
- Power Query and Power Pivot (Data Manipulation, Cleaning and Modeling)


