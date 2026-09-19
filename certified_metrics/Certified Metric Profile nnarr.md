**Certified Metric Profile: Net New ARR**

**Status:** Draft  
**Business Owner:** Finance  
**Reporting Type:** Operational or Financial Closed

**PLEASE READ:** IMPORTANT TO UNDERSTAND THE CONSTRUCTS OF THIS METRIC AND HOW IT IS USED WITHIN DIFFERENT PARTS OF THE BUSINESS: 

This specific metric is segmented in 3 key ways. Always confirm the 3 items before moving forward with Claude prompts and choosing in Snowflake or Tableau reporting. Claude will confirm the following items if its a financial/billing metric:

1. **Financial Billings closed vs Operational Real-Time Data:** Billings closed (also known as Snapshot or Frozen data) is a locked number that can be reported external and does not change. This billings closed number is used in: SLT QBR, External Reporting, Flash report, and other financial reporting. Operational data is real-time in month and in-quarter data to see pacing (also known as Live data). This number can change historically due to data enrichment, so it is considered live data. This number is used in in month and in quarter monitoring, run the business calls, and in go to market in month and quarter reporting   
2. **Customer Hierarchy:** Billing-level metrics can be aggregated differently based on the PD customer hierarchy. Finance pulls data at the customer hierarchy level. Go to market teams look at comp theater/ account aggregations. [See more info here](https://pagerduty.atlassian.net/wiki/spaces/BIRD/pages/1534460882/UNDER+CONSTRUCTION+ARR+Account+vs+Customer+What+makes+them+different)   
3. **Date Aggregation**: Daily/ Monthly/Quarterly. This is contextual for a claude / snowflake user to know which specific table to use, as there are different tables for this level of aggregation 

**GENERAL BUSINESS CONTEXT:** 

|  | What it Means  | Output  |
| :---- | :---- | :---- |
| Metric Name | Friendly name of the metric that the business uses | Net New Annual Recurring Revenue l |
| Definition | Laymen’s term explanation of the metric | This metric represents the net change in Annual Recurring Revenue during a selected period. It reflects the ARR gained though new customers, reactivations, and expansions, offset by ARR lost through downgrades and churn. |
| Abbreviation | Shorthand metric name | nnARR   |
| Status | Is it certified or being worked on | Draft |
| Metric Owner | Single owner in the business of the metric \- who to go to for questions and accountability of accuracy. Quarterly review cycle to QA owner.  | Heather |
| Department Owner | Dept owner in the business of the metric \- who to go to for questions and accountability of accuracy. Quarterly review cycle to QA owner.   | Finance |
| Calculation | Laymen’s terms calculation | new arr \+ reactivation arr \+ upgrade arr \+ downgrade arr  |
| Maintainer | Person responsible for keeping the metric governance up to date | TBD |
| Why it matters | The reason we follow this metric | The single cleanest read on whether the business grew. Positive means we added more recurring revenue than we lost. |
| What it tells you | What we learn from this metric | How much our recurring revenue increased or decreased after accounting for all major ARR movements during the selected period. |
| What it does not tell you | What we cannot learn from this metric | It is not total ARR, a retention rate, and not how ARR is credited to sales representatives and territories. |
| How to ask for it | Prerequisites to get the right answer for the business question you want to answer | 3 items: Specify the type (operational or billings closed),  customer hierarchy  date aggregation **Example**: Show operational customer nnARR for FY27 Q3 by Product Unit. For official Finance numbers ask for Finance snapshot |
| Unit of Measurement | Metric format  | $ |
| Segment Grain  | "Grain" refers to the level of detail (the "what does one row represent") in a table or dataset — the finest level at which a fact is recorded before any aggregation. These are key cuts of data based on the company revenue size and what products they are using in PD Reliability Platform. | Revenue Segment Revenue Segment Group Product Product Unit |
| Access Concerns | Who can view this metric in Tableau, Snowflake, and Claude  | SLT & Embedded Analysts |
| Targets  | Plan goals/ marker of success  | Yes \- internal and external targets Quarterly and Monthly |
| Directionality | Whether a higher value, a lower value, or a value close to a target represents better performance. It sets the correct interpretation for trends, conditional formatting, alerting, and variance-to-target reads | Higher is better |
| Where to see it | Where can I access this metric | Tableau: n/a Claude: n/a |
| Data lives in | Source  | Snowflake and Claude MCP |
| Data available from | Historical data backdate  | FY2023 Q1 |
| Approval date | Date | TBD |
| QA by | Person | TBD |
| Next Review Date | Date | TBD |
| Change Log | Log of any changes made after first approval date |  |
| Version | If changes are made this updates | v1 |

**Choose the right segmentation**

| What are you trying to do? | Use this version | Why |
| :---- | :---- | :---- |
| Report the official Finance number post quarter | Customer Snapshot | This is the finalized value used by Finance |
| Monitor the current month or quarter | Customer Live | Reflects current activity and changes with daily updates |
| Review financial historical performance | Customer Snapshot | Contains certified completed period results |
| Analyze by product unit | Customer Product Unit Live | Uses enriched customer and product unit attribution data |
| Analyze comp theater  | Comp Theater Live | Uses enriched account data and comp theater alignment attribution data |
| Analyze historical comp theater attainment | Comp Theater Snapshot | The finalized value aligned with Finance used by Field leadership |

\<page break\>  
**Net New ARR: Technical Detail**

|  | What it means | Output |
| :---- | :---- | :---- |
| Native Source  | Identifies the authoritative system of record where the metric's underlying data originates and is first captured | Billing System \[Zuora\] |
| ETL/Data Owner | Person | Carl Ghoreichi |
| Calculation behavior | Describes how the metric accumulates and resets over time — whether it builds cumulatively within a period and starts over at a boundary, rolls forward continuously, or is a fresh point-in-time value each period. | Resets each quarter |
| Grain Additivity | to prevent invalid calculations (such as averaging ratios or summing non-additive metrics) and to ensure correct usage of daily, monthly, and quarterly tables | Non-Additive |

**SQL Queries**

| Entity Grain | Reporting State | Supported Time Views | Reporting Source Table | SQL Link |
| :---- | :---- | :---- | :---- | :---- |
| Customer | Snapshot | Completed Months  | TBD | TBD |
| Customer | Snapshot | Completed Quarters | CLAUDE\_MCP\_DB.DATA.ANAPLAN\_FINANCIAL\_EFFICIENCY\_METRICS | [nnarr\_customer\_snapshot\_quarterly.sql](https://github.com/dricksPD/test_CMP/blob/main/nnarr_customer_snapshot_quarterly.sql) |
| Customer | Live | MTD | CLAUDE\_MCP\_DB.DATA.DW\_AGG\_MONTHLY\_BILLING\_CUSTOMER | [nnarr\_customer\_live\_mtd.sql](https://github.com/dricksPD/test_CMP/blob/main/nnarr_customer_live_mtd.sql) |
| Customer | Live | QTD | CLAUDE\_MCP\_DB.DATA.DW\_AGG\_QUARTERLY\_BILLING\_CUSTOMER | [nnarr\_customer\_live\_qtd.sql](https://github.com/dricksPD/test_CMP/blob/main/nnarr_customer_live_qtd.sql) |
| Customer | Live | Daily,  | CLAUDE\_MCP\_DB.DATA.DW\_AGG\_DAILY\_SMOOTHED\_BILLING\_CUSTOMER | [Nnarr\_customer\_live\_daily.sql](https://github.com/dricksPD/test_CMP/blob/main/nnarr_customer_live_daily.sql)  |
| Customer  | Live | Weekly | CLAUDE\_MCP\_DB.DATA.DW\_AGG\_DAILY\_SMOOTHED\_BILLING\_CUSTOMER | [nnarr\_customer\_live\_weekly.sql](https://github.com/dricksPD/test_CMP/blob/main/nnarr_customer_live_weekly.sql) |
| Customer Product Unit | Live | MTD | CLAUDE\_MCP\_DB.DATA.DW\_AGG\_MONTHLY\_BILLING\_PRODUCT\_UNIT\_CUSTOMER | [nnarr\_customer\_prodcutunit\_live\_mtd.sql](https://github.com/dricksPD/test_CMP/blob/main/nnarr_customer_prodcutunit_live_mtd.sql) |
| Customer Product Unit | Live | QTD | CLAUDE\_MCP\_DB.DATA.DW\_AGG\_QUARTERLY\_BILLING\_PRODUCT\_UNIT\_CUSTOMER | [nnarr\_customer\_prodcutunit\_live\_qtd.sql](https://github.com/dricksPD/test_CMP/blob/main/nnarr_customer_prodcutunit_live_qtd.sql) |
| Comp Theater | Live | MTD | CLAUDE\_MCP\_DB.DATA.DW\_AGG\_MONTHLY\_BILLING\_COMP\_THEATER | [nnarr\_comptheater\_live\_mtd.sql](https://github.com/dricksPD/test_CMP/blob/main/nnarr_comptheater_live_mtd.sql) |
| Comp Theater | Live | QTD | CLAUDE\_MCP\_DB.DATA.DW\_AGG\_QUARTERLY\_BILLING\_COMP\_THEATER | [nnarr\_comptheater\_live\_qtd.sql](https://github.com/dricksPD/test_CMP/blob/main/nnarr_comptheater_live_qtd.sql) |
| Comp Theater | Live | Daily | CLAUDE\_MCP\_DB.DATA.DW\_AGG\_DAILY\_SMOOTHED\_BILLING\_COMP\_THEATER | [Nnarr\_comptheater\_live\_daily.sql](https://github.com/dricksPD/test_CMP/blob/main/nnarr_comptheater_live_daily.sql)  |
| Comp Theater | Live | Weekly | CLAUDE\_MCP\_DB.DATA.DW\_AGG\_DAILY\_SMOOTHED\_BILLING\_COMP\_THEATER | [nnarr\_comptheater\_live\_weekly.sql](https://github.com/dricksPD/test_CMP/blob/main/nnarr_comptheater_live_weekly.sql) |
| Comp Theater | Snapshot | Completed Months  | TBD | TBD |
| Comp Theater | Snapshot | Completed Quarters | TBD | TBD |

