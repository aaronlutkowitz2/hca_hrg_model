view: hca_hrg_model_outputs_actual_predicted_by_division {
  sql_table_name: `hca-sandbox-aaron-argolis.hrg.hca_hrg_model_outputs_actual_predicted_by_division`
    ;;

  dimension: actual {
    type: number
    sql: ${TABLE}.actual ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: division_code {
    type: string
    sql: ${TABLE}.division_code ;;
  }

  dimension: gcp_predicted_terms {
    type: number
    sql: ${TABLE}.gcp_predicted_terms ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: original_predicted_terms {
    type: number
    sql: ${TABLE}.original_predicted_terms ;;
  }

  dimension: predicted {
    type: number
    sql: ${TABLE}.predicted ;;
  }

  dimension: predicted_original {
    type: number
    sql: ${TABLE}.predicted_original ;;
  }

  dimension: start22_headcount {
    type: number
    sql: ${TABLE}.start22_Headcount ;;
  }

  measure: count {
    type: count
    drill_fields: [group_name]
  }

  measure: average_predicted {
    label: "Predicted Term % - GCP"
    type: average
    sql: ${predicted} ;;
    value_format_name: percent_1
  }

  measure: average_predicted_original {
    label: "Predicted Term % - Original"
    type: average
    sql: ${predicted_original} ;;
    value_format_name: percent_1
  }

  measure: gap_in_prediction {
    type: number
    sql: ${average_predicted} - ${average_predicted_original} ;;
    value_format_name: percent_1
  }

  measure: average_terms_gcp {
    label: "# Terms - GCP"
    type: average
    sql: ${gcp_predicted_terms} ;;
    value_format_name: decimal_0
  }

  measure: average_terms_origianl {
    label: "# Terms - Original"
    type: average
    sql: ${original_predicted_terms} ;;
    value_format_name: decimal_0
  }

  measure: gap_in_average_terms {
    type: number
    sql: ${average_terms_gcp} - ${average_terms_origianl} ;;
    value_format_name: decimal_0
  }

}
