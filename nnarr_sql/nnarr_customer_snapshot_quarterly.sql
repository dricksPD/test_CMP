
--Certified_Metric_Profile: Net New ARR
--Entity_Grain: Comp Theater
--Reporting Grain: Live 
--Time_Grain: Quarter (Completed)
--Segment_Grain: none
select concat(fiscal_year, 'Q', fiscal_quarter) as fiscal_quarter
, fiscal_quarter_start
, NN_ARR as ARR_NET_NEW
from CLAUDE_MCP_DB.DATA.ANAPLAN_FINANCIAL_EFFICIENCY_METRICS
order by fiscal_quarter_start;