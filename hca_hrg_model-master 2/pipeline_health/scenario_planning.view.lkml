view: scenario_planning {
  sql_table_name: `hca-sandbox-aaron-argolis.hrg.pipeline_health_metrics_what_if_scenario`
    ;;

###################
### Regular Dimensions
###################

### ID
  dimension: coid_func_sub_func_id {
    group_label: "ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.coid_func_sub_func_id ;;
  }

### Hierarchy Facility
  dimension: enterprise_name {
    group_label: "Hierarchy Facility"
    label: "1 Enterprise"
    type: string
    sql: 'HCA' ;;
    drill_fields: [group_name, division_name, functional_dept_desc, sub_functional_dept_desc]
  }
  dimension: group_name {
    group_label: "Hierarchy Facility"
    label: "2 Group"
    drill_fields: [division_name, market_name, functional_dept_desc, sub_functional_dept_desc]
  }
  dimension: division_name {
    group_label: "Hierarchy Facility"
    label: "3 Division"
    sql: left(${TABLE}.division_name, length(${TABLE}.division_name) - 9) ;;
    drill_fields: [market_name, facility_name, functional_dept_desc, sub_functional_dept_desc]
  }
  dimension: market_name {
    group_label: "Hierarchy Facility"
    label: "4 Market"
    drill_fields: [facility_name, functional_dept_desc, sub_functional_dept_desc]
  }
  dimension: facility_name {
    group_label: "Hierarchy Facility"
    label: "5a Facility Name"
    sql: ${TABLE}.coid_name ;;
    drill_fields: [functional_dept_desc, sub_functional_dept_desc]
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
    drill_fields: [sub_functional_dept_desc, market_name, facility_name]
  }
  dimension: sub_functional_dept_desc {
    group_label: "Hierarchy Department"
    label: "2 Sub-Functional Dept"
    type: string
    sql: ${TABLE}.sub_functional_dept_desc ;;
    drill_fields: [market_name, facility_name]
  }

### Dynamic
  dimension: facility_functional {
    type: string
    sql: ${facility_name} || ' - ' || ${functional_dept_desc} ;;
  }
  dimension: facility_sub_functional {
    type: string
    sql: ${facility_name} || ' - ' || ${sub_functional_dept_desc} ;;
  }
  dimension: functional_sub_functional {
    type: string
    sql: ${functional_dept_desc} || ' - ' || ${sub_functional_dept_desc} ;;
  }

###################
### KPIs
###################

### Parameters - General
  parameter: param_num_months {
    group_label: "KPI - 0 General"
    label: "# Months"
    type: number
    default_value: "6"
  }
  parameter: param_hire_type {
    group_label: "KPI - 0 General"
    type: unquoted
    allowed_value: {label: "Recruiting Funnel" value: "recruiting_funnel"}
    allowed_value: {label: "Flow Diagram" value: "flow_diagram"}
    default_value: "flow_diagram"
  }
  parameter: dim_selector {
    type: unquoted
    default_value: "facility"
    allowed_value: {label: "Market" value: "market_name"}
    allowed_value: {label: "Facility" value: "facility_name"}
    allowed_value: {label: "Functional Dept" value: "functional_dept_desc"}
    allowed_value: {label: "Sub Func Dept" value: "sub_functional_dept_desc"}
    allowed_value: {label: "Facility - Func Dept" value: "facility_functional"}
    allowed_value: {label: "Facility - Sub Func Dept" value: "facility_sub_functional"}
    allowed_value: {label: "Func - Sub Func Dept" value: "functional_sub_functional"}
  }
  dimension: dim_dynamic {
    type: string
    sql:
      {% if    dim_selector._parameter_value == 'facility_name' %}              ${facility_name}
      {% elsif dim_selector._parameter_value == 'market_name' %}                ${market_name}
      {% elsif dim_selector._parameter_value == 'functional_dept_desc' %}       ${functional_dept_desc}
      {% elsif dim_selector._parameter_value == 'sub_functional_dept_desc' %}   ${sub_functional_dept_desc}
      {% elsif dim_selector._parameter_value == 'facility_functional' %}        ${facility_functional}
      {% elsif dim_selector._parameter_value == 'facility_sub_functional' %}    ${facility_sub_functional}
      {% elsif dim_selector._parameter_value == 'functional_sub_functional' %}  ${functional_sub_functional}
      {% else %}                                                                ${facility_name}
      {% endif %}
    ;;
    drill_fields: [facility_name, functional_dept_desc, sub_functional_dept_desc]
  }

### Parameters - Headcount
  parameter: param_target_headcount_change {
    group_label: "KPI - 1 Headcount"
    type: number
    default_value: "0"
  }
### KPIs - Headcount
  dimension: total_headcount_start {
    group_label: "KPI - 1 Headcount"
    type: number
    sql: ${TABLE}.total_headcount ;;
  }
  dimension: total_target_headcount_start {
    group_label: "KPI - 1 Headcount"
    type: number
    sql: ${TABLE}.total_target_headcount;;
  }
  # dimension: total_headcount_end {
  #   group_label: "KPI - 1 Headcount"
  #   type: number
  #   sql: ${total_headcount_start} + ${avg_hires} + ${avg_skillmix_in} + ${avg_skillmix_out} + ${avg_status_change_in} + ${avg_status_change_out} + ${avg_terms} ;;
  # }
  dimension: total_target_headcount_end {
    group_label: "KPI - 1 Headcount"
    type: number
    sql: ${total_target_headcount_start} * (1 + ({% parameter param_target_headcount_change %}/100)) ;;
  }

### Parameters - Flow
  parameter: param_avg_hires {
    group_label: "KPI - 2 Flow"
    type: number
    default_value: "0"
  }
  parameter: param_avg_skillmix_in {
    group_label: "KPI - 2 Flow"
    type: number
    default_value: "0"
  }
  parameter: param_avg_skillmix_out {
    group_label: "KPI - 2 Flow"
    type: number
    default_value: "0"
  }
  parameter: param_avg_status_change_in {
    group_label: "KPI - 2 Flow"
    type: number
    default_value: "0"
  }
  parameter: param_avg_status_change_out {
    group_label: "KPI - 2 Flow"
    type: number
    default_value: "0"
  }
  parameter: param_avg_terms {
    group_label: "KPI - 2 Flow"
    type: number
    default_value: "0"
  }
### KPIs - Flow
  dimension: avg_hires {
    group_label: "KPI - 2 Flow"
    type: number
    sql: ${TABLE}.avg_hires * (1 + ({% parameter param_target_headcount_change %}/100)) * {% parameter param_num_months %} ;;
  }
  dimension: avg_skillmix_in {
    group_label: "KPI - 2 Flow"
    type: number
    sql: ${TABLE}.avg_skillmix_in * (1 + ({% parameter param_avg_skillmix_in %}/100)) * {% parameter param_num_months %} ;;
  }
  dimension: avg_skillmix_out {
    group_label: "KPI - 2 Flow"
    type: number
    sql: ${TABLE}.avg_skillmix_out * (1 + ({% parameter param_avg_skillmix_out %}/100)) * {% parameter param_num_months %} ;;
  }
  dimension: avg_status_change_in {
    group_label: "KPI - 2 Flow"
    type: number
    sql: ${TABLE}.avg_status_change_in * (1 + ({% parameter param_avg_status_change_in %}/100)) * {% parameter param_num_months %} ;;
  }
  dimension: avg_status_change_out {
    group_label: "KPI - 2 Flow"
    type: number
    sql: ${TABLE}.avg_status_change_out * (1 + ({% parameter param_avg_status_change_out %}/100)) * {% parameter param_num_months %} ;;
  }
  dimension: avg_terms {
    group_label: "KPI - 2 Flow"
    type: number
    sql: ${TABLE}.avg_terms * (1 + ({% parameter param_avg_terms %}/100)) * {% parameter param_num_months %} ;;
  }

### Parmaeters - Recruiting Pipeline
  parameter: param_perc_app_screen {
    group_label: "KPI - 4 Recruiting Pipeline %"
    label: "Param B % Application to Screen"
    type: number
    default_value: "0"
  }
  parameter: param_perc_screen_int {
    group_label: "KPI - 4 Recruiting Pipeline %"
    label: "Param C % Screen to Interview"
    type: number
    default_value: "0"
  }
  parameter: param_perc_int_offer {
    group_label: "KPI - 4 Recruiting Pipeline %"
    label: "Param D % Interview to Offer"
    type: number
    default_value: "0"
  }
  parameter: param_perc_offer_accept {
    group_label: "KPI - 4 Recruiting Pipeline %"
    label: "Param E % Offer to Accept"
    type: number
    default_value: "0"
  }
  parameter: param_perc_accept_hire {
    group_label: "KPI - 4 Recruiting Pipeline %"
    label: "Param F % Accept to Hire"
    type: number
    default_value: "0"
  }
  parameter: param_avg_applicants {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "Param A # Applicantions"
    type: number
    default_value: "0"
  }
### KPIs - Recruiting Pipeline
  dimension: perc_app_screen {
    group_label: "KPI - 4 Recruiting Pipeline %"
    label: "B % Application to Screen"
    type: number
    sql: ${TABLE}.perc_app_screen * (1 + ({% parameter param_perc_app_screen %}/100)) ;;
  }
  dimension: perc_screen_int {
    group_label: "KPI - 4 Recruiting Pipeline %"
    label: "C % Screen to Interview"
    type: number
    sql: ${TABLE}.perc_screen_int * (1 + ({% parameter param_perc_screen_int %}/100)) ;;
  }
  dimension: perc_int_offer {
    group_label: "KPI - 4 Recruiting Pipeline %"
    label: "D % Interview to Offer"
    type: number
    sql: ${TABLE}.perc_int_offer * (1 + ({% parameter param_perc_int_offer %}/100)) ;;
  }
  dimension: perc_offer_accept {
    group_label: "KPI - 4 Recruiting Pipeline %"
    label: "E % Offer to Accept"
    type: number
    sql: ${TABLE}.perc_offer_accept * (1 + ({% parameter param_perc_offer_accept %}/100)) ;;
  }
  dimension: perc_accept_hire {
    group_label: "KPI - 4 Recruiting Pipeline %"
    label: "F % Accept to Hire"
    type: number
    sql: ${TABLE}.perc_accept_hire * (1 + ({% parameter param_perc_accept_hire %}/100)) ;;
  }
  dimension: avg_applicants {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "A # Applicantions"
    type: number
    sql: ${TABLE}.avg_applicants * (1 + ({% parameter param_avg_applicants %}/100)) * {% parameter param_num_months %} ;;
  }
  dimension: avg_screen {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "B # Screens"
    type: number
    sql: ${avg_applicants} * ${perc_app_screen} ;;
  }
  dimension: avg_interview {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "C # Interviews"
    type: number
    sql: ${avg_applicants} * ${perc_app_screen} * ${perc_screen_int} ;;
  }
  dimension: avg_offer {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "D # Offers"
    type: number
    sql: ${avg_applicants} * ${perc_app_screen} * ${perc_screen_int} * ${perc_int_offer} ;;
  }
  dimension: avg_accept {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "E # Accepts"
    type: number
    sql: ${avg_applicants} * ${perc_app_screen} * ${perc_screen_int} * ${perc_int_offer} * ${perc_offer_accept} ;;
  }
  dimension: avg_hire {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "F # Hires"
    type: number
    sql: ${avg_applicants} * ${perc_app_screen} * ${perc_screen_int} * ${perc_int_offer} * ${perc_offer_accept} * ${perc_accept_hire} ;;
  }

### KPIs - Recruiting Timeline
  dimension: perc_hire_01_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 01 Month"
    type: number
    sql: ${TABLE}.perc_hire_01_month ;;
    value_format_name: percent_1
  }
  dimension: perc_hire_02_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 02 Month"
    type: number
    sql: ${TABLE}.perc_hire_02_month ;;
    value_format_name: percent_1
  }
  dimension: perc_hire_03_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 03 Month"
    type: number
    sql: ${TABLE}.perc_hire_03_month ;;
    value_format_name: percent_1
  }
  dimension: perc_hire_04_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 04 Month"
    type: number
    sql: ${TABLE}.perc_hire_04_month ;;
    value_format_name: percent_1
  }
  dimension: perc_hire_05_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 05 Month"
    type: number
    sql: ${TABLE}.perc_hire_05_month ;;
    value_format_name: percent_1
  }
  dimension: perc_hire_06_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 06 Month"
    type: number
    sql: ${TABLE}.perc_hire_06_month ;;
    value_format_name: percent_1
  }
  dimension: perc_hire_07_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 07 Month"
    type: number
    sql: ${TABLE}.perc_hire_07_month ;;
    value_format_name: percent_1
  }
  dimension: perc_hire_08_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 08 Month"
    type: number
    sql: ${TABLE}.perc_hire_08_month ;;
    value_format_name: percent_1
  }
  dimension: perc_hire_09_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 09 Month"
    type: number
    sql: ${TABLE}.perc_hire_09_month ;;
    value_format_name: percent_1
  }
  dimension: perc_hire_10_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 10 Month"
    type: number
    sql: ${TABLE}.perc_hire_10_month ;;
    value_format_name: percent_1
  }
  dimension: perc_hire_11_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 11 Month"
    type: number
    sql: ${TABLE}.perc_hire_11_month ;;
    value_format_name: percent_1
  }
  dimension: perc_hire_12_month {
    group_label: "KPI - 5 Hire Timeline %"
    label: "% Hire in 12 Month"
    type: number
    sql: ${TABLE}.perc_hire_12_month ;;
    value_format_name: percent_1
  }

  measure: count {
    type: count
    # drill_fields: [coid_name, group_name, market_name, division_name]
  }

### KPIs - Headcount
  measure: sum_total_headcount_start {
    group_label: "KPI - 1 Headcount"
    label: "Total Headcount Start"
    type: sum
    sql: ${total_headcount_start} ;;
    value_format_name: decimal_0
  }
  measure: sum_total_target_headcount_start {
    group_label: "KPI - 1 Headcount"
    label: "Total Target Headcount Start"
    type: sum
    sql: ${total_target_headcount_start} ;;
    value_format_name: decimal_0
  }
  measure: percent_vacancy_start {
    group_label: "KPI - 1 Headcount"
    label: "% Vacancy Start"
    type: number
    sql: 1 - (${sum_total_headcount_start} / nullif(${sum_total_target_headcount_start},0)) ;;
    value_format_name: percent_1
  }
  measure: vacancy_gap_start {
    group_label: "KPI - 1 Headcount"
    label: "Vacancy Gap - Start"
    type: number
    sql: ${sum_total_target_headcount_start} - ${sum_total_headcount_start} ;;
    value_format_name: decimal_0
  }
  measure: dynamic_hires {
    label: "Total Hires*"
    type: number
    sql:
      {% if    param_hire_type._parameter_value == 'flow_diagram' %} ${sum_avg_hires}
      {% elsif param_hire_type._parameter_value == 'recruiting_funnel' %} ${sum_avg_hire}
      {% else %} ${sum_avg_hires}
      {% endif %}
    ;;
  }
  measure: sum_total_headcount_end {
    group_label: "KPI - 1 Headcount"
    label: "Total Headcount End"
    type: number
    sql: ${sum_total_headcount_start} + ${dynamic_hires} + ${sum_avg_skillmix_in} + ${sum_avg_skillmix_out} + ${sum_avg_status_change_in} + ${sum_avg_status_change_out} + ${sum_avg_terms} ;;
    value_format_name: decimal_0
  }
  measure: sum_total_target_headcount_end {
    group_label: "KPI - 1 Headcount"
    label: "Total Target Headcount End"
    type: sum
    sql: ${total_target_headcount_end} ;;
    value_format_name: decimal_0
  }
  measure: percent_vacancy_end {
    group_label: "KPI - 1 Headcount"
    label: "% Vacancy End"
    type: number
    sql: 1 - (${sum_total_headcount_end} / nullif(${sum_total_target_headcount_end},0)) ;;
    value_format_name: percent_1
  }
  measure: vacancy_gap_end {
    group_label: "KPI - 1 Headcount"
    label: "Vacancy Gap - End"
    type: number
    sql: ${sum_total_target_headcount_end} - ${sum_total_headcount_end} ;;
    value_format_name: decimal_0
  }

  measure: sum_total_transfers_end {
    group_label: "KPI - 1 Headcount"
    label: "Total Transfers End"
    type: number
    sql: ${sum_avg_hires} + ${sum_avg_skillmix_in} + ${sum_avg_skillmix_out} + ${sum_avg_status_change_in} + ${sum_avg_status_change_out} + ${sum_avg_terms} ;;
    value_format_name: decimal_0
  }

### KPIs - Flow
  measure: sum_avg_hires {
    group_label: "KPI - 2 Flow"
    label: "Total Hires"
    type: sum
    sql: ${avg_hires} ;;
    value_format_name: decimal_0
  }
  measure: sum_avg_skillmix_in {
    group_label: "KPI - 2 Flow"
    label: "Total Skill Mix In"
    type: sum
    sql: ${avg_skillmix_in} ;;
    value_format_name: decimal_0
  }
  measure: sum_avg_skillmix_out {
    group_label: "KPI - 2 Flow"
    label: "Total Skill Mix Out"
    type: sum
    sql: ${avg_skillmix_out} ;;
    value_format_name: decimal_0
  }
  measure: sum_avg_status_change_in {
    group_label: "KPI - 2 Flow"
    label: "Total Status Change In"
    type: sum
    sql: ${avg_status_change_in} ;;
    value_format_name: decimal_0
  }
  measure: sum_avg_status_change_out {
    group_label: "KPI - 2 Flow"
    label: "Total Status Change Out"
    type: sum
    sql: ${avg_status_change_out} ;;
    value_format_name: decimal_0
  }
  measure: sum_avg_terms {
    group_label: "KPI - 2 Flow"
    label: "Total Terms"
    type: sum
    sql: ${avg_terms} ;;
    value_format_name: decimal_0
  }

### KPIs - Recruiting Pipeline
  measure: sum_avg_applicants {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "A # Applicantions"
    type: sum
    sql: ${avg_applicants} ;;
    value_format_name: decimal_0
  }
  measure: sum_avg_screen {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "B # Screens"
    type: sum
    sql: ${avg_screen} ;;
    value_format_name: decimal_0
  }
  measure: sum_avg_interview {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "C # Interviews"
    type: sum
    sql: ${avg_interview} ;;
    value_format_name: decimal_0
  }
  measure: sum_avg_offer {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "D # Offers"
    type: sum
    sql: ${avg_offer} ;;
    value_format_name: decimal_0
  }
  measure: sum_avg_accept {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "E # Accepts"
    type: sum
    sql: ${avg_accept} ;;
    value_format_name: decimal_0
  }
  measure: sum_avg_hire {
    group_label: "KPI - 3 Recruiting Pipeline"
    label: "F # Hires"
    type: sum
    sql: ${avg_hire} ;;
    value_format_name: decimal_0
  }
  measure: percent_app_hire {
    type: number
    sql: ${sum_avg_hire} / nullif(${sum_avg_applicants},0) ;;
    value_format_name: percent_1
  }

}



# dimension: total_headcount_start {
#   group_label: "KPI - 1 Headcount"
#   type: number
#   sql: ${TABLE}.total_headcount ;;
# }
# dimension: total_target_headcount_start {
#   group_label: "KPI - 1 Headcount"
#   type: number
#   sql: ${TABLE}.total_target_headcount;;
# }
# dimension: total_headcount_end {
#   group_label: "KPI - 1 Headcount"
#   type: number
#   sql: ${total_headcount_start} + ${avg_hires} + ${avg_skillmix_in} + ${avg_skillmix_out} + ${avg_status_change_in} + ${avg_status_change_out} + ${avg_terms};;
# }
# dimension: total_target_headcount_end {
#   group_label: "KPI - 1 Headcount"
#   type: number
#   sql: ${total_target_headcount_start} * (1 + ({% parameter param_target_headcount_change %}/100)) ;;
# }
