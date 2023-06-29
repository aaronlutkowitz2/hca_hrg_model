# view: pipeline_health_metrics_recruiting_pipeline_sample_data_widen {
#   sql_table_name: `hca-sandbox-aaron-argolis.hrg.pipeline_health_metrics_recruiting_pipeline_sample_data_widen`
#     ;;

#   dimension: accept_hire {
#     type: yesno
#     sql: ${TABLE}.accept_hire ;;
#   }

#   dimension_group: accept_offer {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.accept_offer_date ;;
#   }

#   dimension: app_screen {
#     type: yesno
#     sql: ${TABLE}.app_screen ;;
#   }

#   dimension_group: application {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.application_date ;;
#   }

#   dimension: application_id {
#     type: number
#     sql: ${TABLE}.application_id ;;
#   }

#   dimension: coid {
#     type: number
#     value_format_name: id
#     sql: ${TABLE}.coid ;;
#   }

#   dimension_group: decline_offer {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.decline_offer_date ;;
#   }

#   dimension: division_name {
#     type: string
#     sql: ${TABLE}.division_name ;;
#   }

#   dimension: emp_status {
#     type: string
#     sql: ${TABLE}.emp_status ;;
#   }

#   dimension_group: extend_offer {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.extend_offer_date ;;
#   }

#   dimension: facility_name {
#     type: string
#     sql: ${TABLE}.facility_name ;;
#   }

#   dimension: functional_dept_desc {
#     type: string
#     sql: ${TABLE}.functional_dept_desc ;;
#   }

#   dimension: ghr_requisition_num {
#     type: number
#     sql: ${TABLE}.GHR_Requisition_Num ;;
#   }

#   dimension: group_name {
#     type: string
#     sql: ${TABLE}.group_name ;;
#   }

#   dimension: int_offer {
#     type: yesno
#     sql: ${TABLE}.int_offer ;;
#   }

#   dimension_group: interview {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.interview_date ;;
#   }

#   dimension: last_disposition_date {
#     type: string
#     sql: ${TABLE}.last_disposition_date ;;
#   }

#   dimension: lat {
#     type: number
#     sql: ${TABLE}.lat ;;
#   }

#   dimension: lawson_company_num {
#     type: number
#     sql: ${TABLE}.lawson_company_num ;;
#   }

#   dimension: lawson_requisition_num {
#     type: number
#     sql: ${TABLE}.lawson_requisition_num ;;
#   }

#   dimension: long {
#     type: number
#     sql: ${TABLE}.long ;;
#   }

#   dimension: market_name {
#     type: string
#     sql: ${TABLE}.market_name ;;
#   }

#   dimension: month {
#     type: number
#     sql: ${TABLE}.Month ;;
#   }

#   dimension: offer_accept {
#     type: yesno
#     sql: ${TABLE}.offer_accept ;;
#   }

#   dimension_group: offer_start {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.offer_start_date ;;
#   }

#   dimension: recruitment_requisition_sid {
#     type: number
#     value_format_name: id
#     sql: ${TABLE}.recruitment_requisition_sid ;;
#   }

#   dimension: rejection_reason {
#     type: string
#     sql: ${TABLE}.rejection_reason ;;
#   }

#   dimension_group: review {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.review_date ;;
#   }

#   dimension: rn_experience {
#     type: string
#     sql: ${TABLE}.rn_experience ;;
#   }

#   dimension_group: rn_xp {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.RN_XP_Date ;;
#   }

#   dimension_group: screen {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.screen_date ;;
#   }

#   dimension: screen_int {
#     type: yesno
#     sql: ${TABLE}.screen_int ;;
#   }

#   dimension: skill_mix {
#     type: number
#     sql: ${TABLE}.SkillMix ;;
#   }

#   dimension: sub_functional_dept_desc {
#     type: string
#     sql: ${TABLE}.sub_functional_dept_desc ;;
#   }

#   dimension: year {
#     type: number
#     sql: ${TABLE}.Year ;;
#   }

#   measure: count {
#     type: count
#     drill_fields: [group_name, facility_name, market_name, division_name]
#   }
# }
