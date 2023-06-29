view: feature_importance {
  sql_table_name: `hca-sandbox-aaron-argolis.hrg.feature_importance`
    ;;

  dimension: feature {
    type: string
    sql: ${TABLE}.feature ;;
  }

  dimension: importance_raw {
    type: number
    sql: ${TABLE}.importance_raw ;;
  }

  dimension: importance_scaled {
    type: number
    sql: ${TABLE}.importance_scaled * 100 ;;
  }

  dimension: percentile {
    type: number
    sql: ${TABLE}.percentile ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: theme {
    type: string
    sql: ${TABLE}.theme ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_importance {
    type: sum
    sql: ${importance_scaled} ;;
    value_format_name: decimal_1
  }

  measure: average_importance {
    type: average
    sql: ${importance_scaled} ;;
    value_format_name: decimal_1
  }

  measure: count_top_50 {
    type: count
    filters: [rank: "<=50"]
  }

  measure: list_features {
    type: list
    list_field: feature
  }
}
