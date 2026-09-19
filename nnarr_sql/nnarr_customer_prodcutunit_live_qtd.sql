--Certified_Metric_Profile: Net New ARR
--Entity_Grain: Customer Product Unit
--Reporting Grain: Live 
--Time_Grain: QTD
----Segment_Grain: cutomer_name, sku_list, billing_country, employee_count, indsutry, revenue_segement, revenue_segment_group, owner_user_team, sales_segment, renewal_buscket, contract_type, customer_success_manager, customer_success_theater, arr_new_logo_type, is_customer_new, is_customer_churn, is_new_product_unit_customer, value_segment, value_segment_grouped
select d.fiscal_quarter_id  as fiscal_quarter
, d.DATE_VALUE    as as_of_date
, b.product_unit
, SUM(ARR_NET_NEW) as ARR_NET_NEW
from CLAUDE_MCP_DB.DATA.DW_AGG_QUARTERLY_BILLING_PRODUCT_UNIT_CUSTOMER b
JOIN CLAUDE_MCP_DB.DATA.DW_DATE_DIM d ON b.date_id = d.date_id
group by 1,2,3
ORDER BY fiscal_quarter;