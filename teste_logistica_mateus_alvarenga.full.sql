SELECT DISTINCT
 lc.id
,lc.status
,lc.provider
,lc.state
,lc.city
,lc.sales_order_created_at::DATE
,lc.device_order_created_at::DATE 
,DATEDIFF (lc.device_order_created_at,lc.sales_order_created_at) as SOC_to_DOC_diff
,lc.processing_at::DATE
,DATEDIFF (lc.processing_at,lc.device_order_created_at) as DOC_to_PROC_diff
,lc.in_transit_to_local_distribution_at::DATE
,DATEDIFF (lc.in_transit_to_local_distribution_at,lc.processing_at) as PROC_to_TLDT_diff
,lc.local_distribution_at::DATE
,DATEDIFF (lc.local_distribution_at,lc.in_transit_to_local_distribution_at) as TLDT_to_LD_diff
,lc.in_transit_to_deliver::DATE
,DATEDIFF (lc.in_transit_to_deliver,local_distribution_at) as LD_to_TDL_diff
,lc.delivered_at::DATE
,DATEDIFF (lc.delivered_at,lc.in_transit_to_deliver) as TDL_to_D_diff
,lc.delivery_estimate_date::DATE
,CASE WHEN
 lc.delivered_at::DATE is null and lc.delivery_estimate_date::DATE < current_date then 0
  lc.delivered_at::DATE is null and lc.delivery_estimate_date::DATE > current_date then 1
   lc.delivered_at::DATE <= delivery_estimate_date::DATE then 1 else 0 end as is_delivery_ontime
,(1) as Quantity
,round(100 * sum(is_delivery_ontime::decimal(32,3)) / sum(Quantity::decimal(32,3)),1) as delivery_performance
,lc.supply_name
,lc.shipment_cost
,DATEPART(WEEK, lc.sales_order_created_at) - DATEPART(WEEK, DATEADD(MONTH, DATEDIFF(MONTH, 0, lc.sales_order_created_at), 0)) + 1 AS sale_order_week
,DATEPART(MONTH,lc.sales_order_created_at) as sale_order_month
,DATEPART(YEAR,lc.sales_order_created_at) as sale_order_year
FROM schema_test.logistic_case_v4
Group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27
;