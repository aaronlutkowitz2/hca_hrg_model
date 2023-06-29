view: pipeline_health_metrics_recruiting_pipeline_sample_data_widen_daily_snapshot {
  sql_table_name: `hca-sandbox-aaron-argolis.hrg.pipeline_health_metrics_recruiting_pipeline_sample_data_widen_daily_snapshot`
    ;;

  dimension: application_id {
    type: number
    sql: ${TABLE}.application_id ;;
  }

  dimension: days_since_app {
    type: number
    sql: ${TABLE}.days_since_app ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
