--Certified_Metric_Profile: Net New ARR
--Entity_Grain: Customer 
--Reporting Grain: Live 
--Time_Grain: Weekly
--Segment_Grain: revenue_segment_group, value_segment, revenue_segment, contract_type, renewal_bucket, region, industry, is_customer_new
select d.week_id     as fiscal_week
, MAX(b.date_value)  as as_of_date
, SUM(b.ARR_NET_NEW) as ARR_NET_NEW
from CLAUDE_MCP_DB.DATA.DW_AGG_DAILY_SMOOTHED_BILLING_CUSTOMER b
JOIN CLAUDE_MCP_DB.DATA.DW_DATE_DIM d ON b.date_value = d.date_value
group by 1
order by fiscal_week;
