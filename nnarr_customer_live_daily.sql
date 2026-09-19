--Certified_Metric_Profile: Net New ARR
--Entity_Grain: Customer 
--Reporting Grain: Live 
--Time_Grain: Daily
--Segment_Grain: revenue_segment_group, value_segment, revenue_segment, contract_type, renewal_bucket, region, industry, is_customer_new
select date_value  as as_of_date
, SUM(ARR_NET_NEW) as ARR_NET_NEW
select top 1 * from CLAUDE_MCP_DB.DATA.DW_AGG_DAILY_SMOOTHED_BILLING_CUSTOMER
group by 1
order by as_of_date;