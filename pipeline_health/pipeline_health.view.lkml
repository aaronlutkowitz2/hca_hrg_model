view: pipeline_health {
  sql_table_name: `hca-sandbox-aaron-argolis.hrg.pipeline_health_metrics_sample_1_month_widen`
    ;;

#####################
### Original Dimensions
#####################

### IDs
  dimension: row_id {
    primary_key: yes
    group_label: "ID"
    type: number
    sql: ${TABLE}.row_id ;;
  }
  dimension: entity_id {
    group_label: "ID"
    type: number
    sql: ${TABLE}.entity_id ;;
  }
  dimension: entity_status_date_id {
    group_label: "ID"
    type: number
    sql: ${TABLE}.entity_status_date_id ;;
  }
  dimension: entity_status_id {
    group_label: "ID"
    type: number
    sql: ${TABLE}.entity_status_id ;;
  }

### Date
  dimension_group: measurement {
    type: time
    timeframes: [
      raw,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.measurement_date ;;
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
    sql: ${TABLE}.status ;;
    drill_fields: [internal_external, contract_type, rn_experience, skillmix, emp_status, market_name, facility_name, functional_dept_desc, sub_functional_dept_desc]
  }
  dimension: internal_external {
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.`type` ;;
    drill_fields: [contract_type, rn_experience, skillmix, emp_status, market_name, facility_name, functional_dept_desc, sub_functional_dept_desc]
  }

### KPIs
  dimension: headcount {
    group_label: "KPIs"
    type: number
    sql: ${TABLE}.total_headcount ;;
  }
  dimension: hires {
    group_label: "KPIs"
    type: number
    sql: ${TABLE}.total_hires ;;
  }
  dimension: skillmix_in {
    group_label: "KPIs"
    type: number
    sql: ${TABLE}.total_skillmix_in ;;
  }
  dimension: skillmix_out {
    group_label: "KPIs"
    type: number
    sql: ${TABLE}.total_skillmix_out ;;
  }
  dimension: status_change_in {
    group_label: "KPIs"
    type: number
    sql: ${TABLE}.total_status_change_in ;;
  }
  dimension: status_change_out {
    group_label: "KPIs"
    type: number
    sql: ${TABLE}.total_status_change_out ;;
  }
  dimension: target_headcount {
    group_label: "KPIs"
    type: number
    sql: ${TABLE}.total_target_headcount ;;
  }
  dimension: terms {
    group_label: "KPIs"
    type: number
    sql: ${TABLE}.total_terms ;;
  }

### Random / not needed

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
  dimension: months_ago {
    hidden: yes
    type: number
    sql: ${TABLE}.months_ago ;;
  }

#####################
### Derived Dimensions
#####################

#####################
### Measures
#####################

  measure: count {
    type: count
    drill_fields: [facility_name, group_name, market_name, division_name]
  }

  measure: sum_headcount_actual {
    group_label: "1 Headcount"
    label: "1A Actual Headcount"
    type: sum
    sql: ${headcount} ;;
    drill_fields: [drill*, sum_headcount_actual, sum_headcount_target, vacancy_rate]
  }

  measure: sum_headcount_target {
    group_label: "1 Headcount"
    label: "1B Target Headcount"
    type: sum
    sql: ${target_headcount} ;;
    drill_fields: [drill*, sum_headcount_actual, sum_headcount_target, vacancy_rate]
  }

  measure: vacancy_rate {
    group_label: "1 Headcount"
    label: "1C Vacancy %"
    type: number
    sql: ${sum_headcount_actual} / nullif(${sum_headcount_target},0) ;;
    value_format_name: percent_1
    drill_fields: [drill*, sum_headcount_actual, sum_headcount_target, vacancy_rate]
  }

  ## Note: later we need to figure out how to make this a parameter instead of hard-coding
  measure: sum_headcount_actual_end {
    group_label: "1 Headcount"
    label: "1D Actual Headcount (End)"
    type: sum
    sql: ${headcount} ;;
    filters: [measurement_month: "2023-01"]
    drill_fields: [drill*, sum_headcount_actual, sum_headcount_target, vacancy_rate]
  }

  ## Note: later we need to figure out how to make this a parameter instead of hard-coding
  measure: sum_headcount_target_end {
    group_label: "1 Headcount"
    label: "1E Target Headcount (End)"
    type: sum
    sql: ${target_headcount} ;;
    filters: [measurement_month: "2023-01"]
    drill_fields: [drill*, sum_headcount_actual, sum_headcount_target, vacancy_rate]
  }

  ## Note: later we need to figure out how to make this a parameter instead of hard-coding
  measure: sum_headcount_start {
    group_label: "2 Patient Flow"
    label: "2A Headcount Start"
    type: sum
    sql: ${target_headcount} ;;
    filters: [measurement_month: "2022-02"]
    drill_fields: [drill*, sum_headcount_start, sum_headcount_end]
  }

  ## Note: later we need to figure out how to make this a parameter instead of hard-coding
  measure: sum_headcount_end {
    group_label: "2 Patient Flow"
    label: "2I Headcount End"
    type: sum
    sql: ${target_headcount} ;;
    filters: [measurement_month: "2023-01"]
    drill_fields: [drill*, sum_headcount_start, sum_headcount_end]
  }

  measure: sum_skillmix_in {
    group_label: "2 Patient Flow"
    label: "2B Skillmix In"
    type: sum
    sql: ${skillmix_in} ;;
    drill_fields: [drill*, sum_skillmix_in, sum_skillmix_out, sum_statuschange_in, sum_statuschange_out, sum_new_hires, sum_terms]
  }

  measure: sum_skillmix_out {
    group_label: "2 Patient Flow"
    label: "2C Skillmix Out"
    type: sum
    sql: ${skillmix_out} ;;
    drill_fields: [drill*, sum_skillmix_in, sum_skillmix_out, sum_statuschange_in, sum_statuschange_out, sum_new_hires, sum_terms]
  }

  measure: sum_statuschange_in {
    group_label: "2 Patient Flow"
    label: "2D Status Change In"
    type: sum
    sql: ${status_change_in} ;;
    drill_fields: [drill*, sum_skillmix_in, sum_skillmix_out, sum_statuschange_in, sum_statuschange_out, sum_new_hires, sum_terms]
  }

  measure: sum_statuschange_out {
    group_label: "2 Patient Flow"
    label: "2E Status Change Out"
    type: sum
    sql: ${status_change_out} ;;
    drill_fields: [drill*, sum_skillmix_in, sum_skillmix_out, sum_statuschange_in, sum_statuschange_out, sum_new_hires, sum_terms]
  }

  measure: sum_new_hires {
    group_label: "2 Patient Flow"
    label: "2F New Hires"
    type: sum
    sql: ${hires} ;;
    drill_fields: [drill*, sum_skillmix_in, sum_skillmix_out, sum_statuschange_in, sum_statuschange_out, sum_new_hires, sum_terms]
  }

  measure: sum_terms {
    group_label: "2 Patient Flow"
    label: "2G Terms"
    type: sum
    sql: ${terms} ;;
    drill_fields: [drill*, sum_skillmix_in, sum_skillmix_out, sum_statuschange_in, sum_statuschange_out, sum_new_hires, sum_terms]
  }

  measure: sum_transfers_total {
    group_label: "2 Patient Flow"
    label: "2H Total Transfers"
    type: number
    sql: ${sum_skillmix_in} + ${sum_skillmix_out} + ${sum_statuschange_in} + ${sum_statuschange_out} + ${sum_new_hires} + ${sum_terms} ;;
    drill_fields: [drill*, sum_skillmix_in, sum_skillmix_out, sum_statuschange_in, sum_statuschange_out, sum_new_hires, sum_terms]
  }

  set: drill {
    fields: [
        facility_name
      , functional_dept_desc
      , sub_functional_dept_desc
      , internal_external
      , contract_type
      , rn_experience
    ]
  }
}
