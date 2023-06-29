connection: "argolis_asw"

include: "/pipeline_health/*.view.lkml"                # include all views in the views/ folder in this project
include: "/z_model_output/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: model_outputs {}

explore: scenario_planning {}

explore: pipeline_health {}

explore: recruiting_pipeline {
  join: recruiting_pipeline_daily_snapshot {
    relationship: one_to_many
    sql_on: ${recruiting_pipeline.application_id} = ${recruiting_pipeline_daily_snapshot.application_id} ;;
  }
}

explore: hca_hrg_model_outputs_actual_predicted_by_division {}

explore: feature_importance {}

explore: hca_hrg_model_outputs_unpivot {}

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
