
--Certified_Metric_Profile: Net New ARR
--Entity_Grain: Comp Theater
--Reporting Grain: Live 
--Time_Grain: Daily
--Segment_Grain: revenue_segment_group, owner_user_team, value_segment, revenue_segment, contract_type, renewal_bucket, region, is_customer_new
select date_value  as as_of_date
, SALES_THEATER    as comp_theater
, SUM(ARR_NET_NEW) as ARR_NET_NEW
from CLAUDE_MCP_DB.DATA.DW_AGG_DAILY_SMOOTHED_BILLING_COMP_THEATER
group by 1,2
order by as_of_date, comp_theater;