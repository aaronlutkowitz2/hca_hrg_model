view: recruiting_pipeline {
  sql_table_name: `hca-sandbox-aaron-argolis.hrg.pipeline_health_metrics_recruiting_pipeline_sample_data_widen`
    ;;

#####################
### Original Dimensions
#####################

### IDs
  dimension: application_id {
    group_label: "ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.application_id ;;
  }
  dimension: ghr_requisition_num {
    group_label: "ID"
    type: number
    sql: ${TABLE}.GHR_Requisition_Num ;;
  }
  dimension: lawson_company_num {
    group_label: "ID"
    type: number
    sql: ${TABLE}.lawson_company_num ;;
  }
  dimension: lawson_requisition_num {
    group_label: "ID"
    type: number
    sql: ${TABLE}.lawson_requisition_num ;;
  }
  dimension: recruitment_requisition_sid {
    group_label: "ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.recruitment_requisition_sid ;;
  }


### Hierarchy Facility
  dimension: enterprise_name {
    group_label: "Hierarchy Facility"
    label: "1 Enterprise"
    type: string
    sql: 'HCA' ;;
    drill_fields: [group_name, division_name, functional_dept_desc, sub_functional_dept_desc, internal_external, contract_type, rn_experience, skillmix, emp_status]
  }
  dimension: group_name {
    group_label: "Hierarchy Facility"
    label: "2 Group"
    drill_fields: [division_name, market_name, functional_dept_desc, sub_functional_dept_desc, internal_external, contract_type, rn_experience, skillmix, emp_status]
  }
  dimension: division_name {
    group_label: "Hierarchy Facility"
    label: "3 Division"
    sql: left(${TABLE}.division_name, length(${TABLE}.division_name) - 9) ;;
    drill_fields: [market_name, facility_name, functional_dept_desc, sub_functional_dept_desc, internal_external, contract_type, rn_experience, skillmix, emp_status]
  }
  dimension: market_name {
    group_label: "Hierarchy Facility"
    label: "4 Market"
    drill_fields: [facility_name, functional_dept_desc, sub_functional_dept_desc, internal_external, contract_type, rn_experience, skillmix, emp_status]
  }
  dimension: facility_name {
    group_label: "Hierarchy Facility"
    label: "5a Facility Name"
    drill_fields: [functional_dept_desc, sub_functional_dept_desc, internal_external, contract_type, rn_experience, skillmix, emp_status]
  }
  dimension: lat {
    hidden: yes
    type: number
  }
  dimension: long {
    hidden: yes
    type: number
  }
  dimension: location {
    group_label: "Hierarchy Facility"
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${long} ;;
  }
  dimension: coid {
    group_label: "Hierarchy Facility"
    label: "5b COID"
    type: number
    value_format_name: id
    sql: ${TABLE}.coid ;;
  }

### Hierarchy Department
  dimension: functional_dept_desc {
    group_label: "Hierarchy Department"
    label: "1 Functional Dept"
    type: string
    sql: ${TABLE}.functional_dept_desc ;;
    drill_fields: [sub_functional_dept_desc, market_name, facility_name, internal_external, contract_type, rn_experience, skillmix, emp_status]
  }
  dimension: sub_functional_dept_desc {
    group_label: "Hierarchy Department"
    label: "2 Sub-Functional Dept"
    type: string
    sql: ${TABLE}.sub_functional_dept_desc ;;
    drill_fields: [market_name, facility_name, internal_external, contract_type, rn_experience, skillmix, emp_status]
  }

### Employee Information
  dimension: contract_type {
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.contract_type ;;
    drill_fields: [internal_external, contract_type, rn_experience, skillmix, emp_status, market_name, facility_name, functional_dept_desc, sub_functional_dept_desc]
  }
  dimension: rn_experience {
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.rn_experience ;;
    drill_fields: [internal_external, contract_type, rn_experience, skillmix, emp_status, market_name, facility_name, functional_dept_desc, sub_functional_dept_desc]
  }
  dimension: skillmix {
    group_label: "Employee Info"
    type: number
    sql: ${TABLE}.skillmix ;;
    drill_fields: [internal_external, contract_type, rn_experience, skillmix, emp_status, market_name, facility_name, functional_dept_desc, sub_functional_dept_desc]
  }
  dimension: emp_status {
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.emp_status ;;
    drill_fields: [internal_external, contract_type, rn_experience, skillmix, emp_status, market_name, facility_name, functional_dept_desc, sub_functional_dept_desc]
  }
  dimension: internal_external {
    group_label: "Employee Info"
    type: string
    sql: 'External' ;;
    drill_fields: [contract_type, rn_experience, skillmix, emp_status, market_name, facility_name, functional_dept_desc, sub_functional_dept_desc]
  }
  dimension: rejection_reason {
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.rejection_reason ;;
  }

### Funnel
  dimension: app_screen {
    group_label: "Funnel"
    label: "A Application to Screen"
    type: yesno
    sql: ${TABLE}.app_screen ;;
  }
  dimension: screen_int {
    group_label: "Funnel"
    label: "B Screen to Interview"
    type: yesno
    sql: ${TABLE}.screen_int ;;
  }
  dimension: int_offer {
    group_label: "Funnel"
    label: "C Interview to Offer"
    type: yesno
    sql: ${TABLE}.int_offer ;;
  }
  dimension: offer_accept {
    group_label: "Funnel"
    label: "D Offer to Accept"
    type: yesno
    sql: ${TABLE}.offer_accept ;;
  }
  dimension: accept_hire {
    group_label: "Funnel"
    label: "E Accept to Hire"
    type: yesno
    sql: ${TABLE}.accept_hire ;;
  }

### Dates
  dimension_group: date_application {
    label: "Date A Application"
    type: time
    timeframes: [
      raw,
      date,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.application_date ;;
  }
  dimension_group: date_screen {
    label: "Date B Screen"
    type: time
    timeframes: [
      raw,
      date,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.screen_date ;;
  }
  dimension_group: date_interview {
    label: "Date C Interview"
    type: time
    timeframes: [
      raw,
      date,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.interview_date ;;
  }
  dimension_group: date_offer {
    label: "Date D Offer"
    type: time
    timeframes: [
      raw,
      date,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.extend_offer_date ;;
  }
  dimension_group: date_accept {
    label: "Date E Accept"
    type: time
    timeframes: [
      raw,
      date,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.accept_offer_date ;;
  }
  dimension_group: date_hire {
    label: "Date F Hire"
    type: time
    timeframes: [
      raw,
      date,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.offer_start_date ;;
  }

### Random
  dimension: month {
    hidden: yes
    type: number
    sql: ${TABLE}.Month ;;
  }
  dimension: year {
    hidden: yes
    type: number
    sql: ${TABLE}.Year ;;
  }

#####################
### Derived Dimensions
#####################

### Days Between
  dimension: days_app_screen {
    group_label: "Days Between"
    label: "A Days Application to Screen"
    type: number
    sql: date_diff(${date_screen_date},${date_application_date}, day) ;;
  }
  dimension: days_screen_int {
    group_label: "Days Between"
    label: "B Days Screen to Interview"
    type: number
    sql: date_diff(${date_interview_date},${date_screen_date}, day) ;;
  }
  dimension: days_int_offer {
    group_label: "Days Between"
    label: "C Days Interview to Offer"
    type: number
    sql: date_diff(${date_offer_date},${date_interview_date}, day) ;;
  }
  dimension: days_offer_accept {
    group_label: "Days Between"
    label: "D Days Offer to Accept"
    type: number
    sql: date_diff(${date_accept_date},${date_offer_date}, day) ;;
  }
  dimension: days_accept_hire {
    group_label: "Days Between"
    label: "E Days Accept to Hire"
    type: number
    sql: date_diff(${date_hire_date},${date_accept_date}, day) ;;
  }

#####################
### Measures
#####################

  measure: count {
    label: "1A Count Applications"
    type: count
  }
  measure: count_app_screen {
    label: "1B Count Screens"
    type: count
    filters: [app_screen: "Yes"]
  }
  measure: count_screen_int {
    label: "1C Count Interviews"
    type: count
    filters: [screen_int: "Yes"]
  }
  measure: count_int_offer {
    label: "1D Count Offers"
    type: count
    filters: [int_offer: "Yes"]
  }
  measure: count_offer_accept {
    label: "1E Count Accepts"
    type: count
    filters: [offer_accept: "Yes"]
  }
  measure: count_accept_hire {
    label: "1F Count Hires"
    type: count
    filters: [accept_hire: "Yes"]
  }
  measure: perc_app_screen {
    label: "2B % Application to Screen"
    type: number
    sql: ${count_app_screen} / nullif(${count},0) ;;
    value_format_name: percent_1
  }
  measure: perc_screen_int {
    label: "2C % Screen to Interview"
    type: number
    sql: ${count_screen_int} / nullif(${count_app_screen},0) ;;
    value_format_name: percent_1
  }
  measure: perc_int_offer {
    label: "2D % Interview to Offer"
    type: number
    sql: ${count_int_offer} / nullif(${count_screen_int},0) ;;
    value_format_name: percent_1
  }
  measure: perc_offer_accept {
    label: "2E % Offer to Accept"
    type: number
    sql: ${count_offer_accept} / nullif(${count_int_offer},0) ;;
    value_format_name: percent_1
  }
  measure: perc_accept_hire {
    label: "2F % Accept to Hire"
    type: number
    sql: ${count_accept_hire} / nullif(${count_offer_accept},0) ;;
    value_format_name: percent_1
  }
  measure: perc_app_screen2 {
    label: "3B % Application to Screen"
    type: number
    sql: ${count_app_screen} / nullif(${count},0) ;;
    value_format_name: percent_1
  }
  measure: perc_app_int {
    label: "3C % Application to Interview"
    type: number
    sql: ${count_screen_int} / nullif(${count},0) ;;
    value_format_name: percent_1
  }
  measure: perc_app_offer {
    label: "3D % Application to Offer"
    type: number
    sql: ${count_int_offer} / nullif(${count},0) ;;
    value_format_name: percent_1
  }
  measure: perc_app_accept {
    label: "3E % Application to Accept"
    type: number
    sql: ${count_offer_accept} / nullif(${count},0) ;;
    value_format_name: percent_1
  }
  measure: perc_app_hire {
    label: "3F % Application to Hire"
    type: number
    sql: ${count_accept_hire} / nullif(${count},0) ;;
    value_format_name: percent_1
  }

}

view: recruiting_pipeline_daily_snapshot {
  sql_table_name: `hca-sandbox-aaron-argolis.hrg.pipeline_health_metrics_recruiting_pipeline_sample_data_widen_daily_snapshot`
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${application_id} || '|' || ${days_since_app} ;;
  }
  dimension: application_id {
    hidden: yes
    type: number
    sql: ${TABLE}.application_id ;;
  }
  dimension: days_since_app {
    view_label: "Recruiting Pipeline"
    group_label: "Daily Snapshot"
    type: number
    sql: ${TABLE}.days_since_app ;;
  }
  dimension: status {
    view_label: "Recruiting Pipeline"
    group_label: "Daily Snapshot"
    type: string
    sql: ${TABLE}.status ;;
  }
  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
