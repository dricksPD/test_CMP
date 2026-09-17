--Certified Metric Profile: Net New ARR
--nnARR by Customer Live MTD
select dd.month_id as fiscal_month
, dd.DATE_VALUE    as as_of_date
,SUM(ARR_NET_NEW)  as ARR_NET_NEW
from CLAUDE_MCP_DB.DATA.DW_AGG_MONTHLY_BILLING_CUSTOMER bcq
JOIN CLAUDE_MCP_DB.DATA.DW_DATE_DIM dd ON bcq.date_id = dd.date_id
group by 1,2
ORDER BY fiscal_month DESC;