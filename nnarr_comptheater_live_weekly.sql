--Certified_Metric_Profile: Net New ARR
--Entity_Grain: Comp Theater
--Reporting Grain: Live 
--Time_Grain: Weekly
--Segment_Grain: revenue_segment_group, owner_user_team, value_segment, revenue_segment, contract_type, renewal_bucket, region, is_customer_new
select concat(fiscal_year,'W',d.week ) as fiscal_week
, MAX(b.date_value)  as as_of_date
, b.SALES_THEATER    as comp_theater
, SUM(b.ARR_NET_NEW) as ARR_NET_NEW
from CLAUDE_MCP_DB.DATA.DW_AGG_DAILY_SMOOTHED_BILLING_COMP_THEATER b
JOIN CLAUDE_MCP_DB.DATA.DW_DATE_DIM d ON b.date_value = d.date_value
group by 1,3
order by as_of_date;