select 
  region.region_name as '大区',
  region.province_name as '省份',
  sci.record_label,
  count(sci.id) as '拨打数'
from ods_t_du_send_center_info sci 
left join ods_t_du_ssdr_info ssdr on sci.ssdr_id=ssdr.id
left join dw.customer_dim customer on ssdr.court_code = customer.code
left join dw.dw_region_province region on  region.province_code = customer.province_code
left join ods_fayuansfy_area area on customer.city_code = area.area_code
where 1=1
and (sci.caller like '%10102368%' 
     or sci.caller like '%sAOsqMX1iYqOt0fxdEXwvA==%'
     or sci.phone like '%10102368%'
     or sci.phone like  '%sAOsqMX1iYqOt0fxdEXwvA==%')
and ssdr.is_delete=0
and sci.add_time is not null
and sci.add_time<='2020-11-07 23:59:59'
group by
  region.region_name,
  region.province_name,
  sci.record_label