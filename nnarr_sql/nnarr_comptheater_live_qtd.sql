
--Certified_Metric_Profile: Net New ARR
--Entity_Grain: Comp Theater
--Reporting Grain: Live 
--Time_Grain: QTD
--Segment_Grain: sales_rep, sales_theater_end, customer_success_manager, owner_user_team_end, revenue_segment, revenue_segment_group, global_2000_account, region, sales_segment, industry_pagerduty
select d.fiscal_quarter_id as fiscal_quarter
, d.DATE_VALUE             as as_of_date
, b.SALES_THEATER_END      as comp_theater
, SUM(b.ARR_NET_NEW)       as ARR_NET_NEW
from CLAUDE_MCP_DB.DATA.DW_AGG_MONTHLY_BILLING_COMP_THEATER b
JOIN CLAUDE_MCP_DB.DATA.DW_DATE_DIM d ON b.date_id = d.date_id
group by 1,2,3
ORDER BY fiscal_quarter;