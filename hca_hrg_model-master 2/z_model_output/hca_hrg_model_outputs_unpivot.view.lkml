view: hca_hrg_model_outputs_unpivot {
  sql_table_name: `hca-sandbox-aaron-argolis.hrg.hca_hrg_model_outputs_unpivot`
    ;;

  dimension: actual {
    type: number
    sql: ${TABLE}.actual ;;
  }

  dimension: factor_name {
    type: string
    sql: ${TABLE}.factor_name ;;
  }

  dimension: factor_value {
    type: string
    sql: ${TABLE}.factor_value ;;
  }

  dimension: factor_value_num {
    type: number
    sql: safe_cast(${factor_value} as float64) ;;
  }

  dimension: factor_value_num_int {
    type: number
    sql: round(${factor_value_num},0) ;;
  }

  dimension: prediction {
    type: number
    sql: ${TABLE}.prediction ;;
  }

  dimension: row_id {
    type: number
    sql: ${TABLE}.row_id ;;
  }

  measure: count {
    type: count
    drill_fields: [factor_name]
  }

  measure: average_prediction {
    label: "Predicted % Term"
    type: average
    sql: ${prediction} ;;
    value_format_name: percent_1
  }
}
