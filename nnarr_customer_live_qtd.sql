--Certified_Metric_Profile: Net New ARR
--Entity_Grain: Customer 
--Reporting_Grain: Live 
--Time_Grain: QTD
--Segment_Grain: industry, region, revenue_segment, revenue_segment_group, renewal_bucket, contract_type, term_duration_months, arr_new_logo_type, is_customer_new, is_customer_churn, value_segment
select d.fiscal_quarter_id as fiscal_quarter
, d.DATE_VALUE          as as_of_date
, SUM(b.ARR_NET_NEW)       as ARR_NET_NEW
from CLAUDE_MCP_DB.DATA.DW_AGG_QUARTERLY_BILLING_CUSTOMER b
JOIN CLAUDE_MCP_DB.DATA.DW_DATE_DIM d ON b.date_id = d.date_id
group by 1,2
ORDER BY fiscal_quarter;