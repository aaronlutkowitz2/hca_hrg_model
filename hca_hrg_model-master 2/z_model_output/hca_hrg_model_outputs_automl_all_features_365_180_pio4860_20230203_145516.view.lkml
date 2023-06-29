view: hca_hrg_model_outputs_automl_all_features_365_180_pio4860_20230203_145516 {
  sql_table_name: `hca-sandbox-aaron-argolis.hrg.hca_hrg_model_outputs_automl_all_features_365_180_pio4860_20230203_145516`
    ;;

  dimension: age_at_hire {
    type: number
    sql: ${TABLE}.age_at_hire ;;
  }

  dimension: auxiliary_job_status {
    type: string
    sql: ${TABLE}.auxiliary_job_status ;;
  }

  dimension: avg_call_off_hours {
    type: number
    sql: ${TABLE}.avg_call_off_hours ;;
  }

  dimension: avg_float_hours_perc {
    type: number
    sql: ${TABLE}.avg_float_hours_perc ;;
  }

  dimension: avg_overtime_hours {
    type: number
    sql: ${TABLE}.avg_overtime_hours ;;
  }

  dimension: avg_past_6_tot_term_101 {
    type: number
    sql: ${TABLE}.avg_past_6_tot_term_101 ;;
  }

  dimension: avg_past_6_tot_term_102 {
    type: number
    sql: ${TABLE}.avg_past_6_tot_term_102 ;;
  }

  dimension: avg_past_6_tot_term_103 {
    type: number
    sql: ${TABLE}.avg_past_6_tot_term_103 ;;
  }

  dimension: avg_past_6_ve_term_103 {
    type: number
    sql: ${TABLE}.avg_past_6_ve_term_103 ;;
  }

  dimension: avg_pto_hours {
    type: number
    sql: ${TABLE}.avg_pto_hours ;;
  }

  dimension: avg_time_between_shifts {
    type: number
    sql: ${TABLE}.avg_time_between_shifts ;;
  }

  dimension: avg_worked_hours {
    type: number
    sql: ${TABLE}.avg_worked_hours ;;
  }

  dimension: base_pay_rate_midpoint {
    type: number
    sql: ${TABLE}.base_pay_rate_midpoint ;;
  }

  dimension: call_off_hours_used {
    type: number
    sql: ${TABLE}.call_off_hours_used ;;
  }

  dimension: critical_need_hours {
    type: number
    sql: ${TABLE}.critical_need_hours ;;
  }

  dimension: current_to_historic_overtime_hours {
    type: number
    sql: ${TABLE}.current_to_historic_overtime_hours ;;
  }

  dimension: current_to_historic_pto_hours {
    type: number
    sql: ${TABLE}.current_to_historic_pto_hours ;;
  }

  dimension: current_to_historic_worked_hours {
    type: number
    sql: ${TABLE}.current_to_historic_worked_hours ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: early_position_flag {
    type: number
    sql: ${TABLE}.early_position_flag ;;
  }

  dimension: ext_new_hire_perc_101 {
    type: number
    sql: ${TABLE}.ext_new_hire_perc_101 ;;
  }

  dimension: ext_new_hire_perc_102 {
    type: number
    sql: ${TABLE}.ext_new_hire_perc_102 ;;
  }

  dimension: ext_new_hire_perc_103 {
    type: number
    sql: ${TABLE}.ext_new_hire_perc_103 ;;
  }

  dimension: ext_new_hire_perc_104 {
    type: number
    sql: ${TABLE}.ext_new_hire_perc_104 ;;
  }

  dimension: ext_new_hire_perc_105 {
    type: number
    sql: ${TABLE}.ext_new_hire_perc_105 ;;
  }

  dimension: extreme_vacancy_hours {
    type: number
    sql: ${TABLE}.extreme_vacancy_hours ;;
  }

  dimension: facility_coid {
    type: number
    value_format_name: id
    sql: ${TABLE}.facility_coid ;;
  }

  dimension: fte_percent {
    type: number
    sql: ${TABLE}.fte_percent ;;
  }

  dimension: functional_dept_desc {
    type: string
    sql: ${TABLE}.functional_dept_desc ;;
  }

  dimension: hire_tenure {
    type: number
    sql: ${TABLE}.hire_tenure ;;
  }

  dimension: hospital_level_code {
    type: string
    sql: ${TABLE}.hospital_level_code ;;
  }

  dimension: ie_term_rate_101 {
    type: number
    sql: ${TABLE}.ie_term_rate_101 ;;
  }

  dimension: ie_term_rate_102 {
    type: number
    sql: ${TABLE}.ie_term_rate_102 ;;
  }

  dimension: ie_term_rate_103 {
    type: number
    sql: ${TABLE}.ie_term_rate_103 ;;
  }

  dimension: ie_term_rate_104 {
    type: number
    sql: ${TABLE}.ie_term_rate_104 ;;
  }

  dimension: ie_term_rate_105 {
    type: number
    sql: ${TABLE}.ie_term_rate_105 ;;
  }

  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: int_new_hire_perc_101 {
    type: number
    sql: ${TABLE}.int_new_hire_perc_101 ;;
  }

  dimension: int_new_hire_perc_102 {
    type: number
    sql: ${TABLE}.int_new_hire_perc_102 ;;
  }

  dimension: int_new_hire_perc_103 {
    type: number
    sql: ${TABLE}.int_new_hire_perc_103 ;;
  }

  dimension: int_new_hire_perc_104 {
    type: number
    sql: ${TABLE}.int_new_hire_perc_104 ;;
  }

  dimension: int_new_hire_perc_105 {
    type: number
    sql: ${TABLE}.int_new_hire_perc_105 ;;
  }

  dimension: internal_external_hire {
    type: string
    sql: ${TABLE}.internal_external_hire ;;
  }

  dimension: job_code_desc {
    type: string
    sql: ${TABLE}.job_code_desc ;;
  }

  dimension: last_pay_increase {
    type: number
    sql: ${TABLE}.last_pay_increase ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: max_float_hours_perc {
    type: number
    sql: ${TABLE}.max_float_hours_perc ;;
  }

  dimension: max_overtime {
    type: number
    sql: ${TABLE}.max_overtime ;;
  }

  dimension: max_past_6_tot_term_101 {
    type: number
    sql: ${TABLE}.max_past_6_tot_term_101 ;;
  }

  dimension: max_past_6_tot_term_102 {
    type: number
    sql: ${TABLE}.max_past_6_tot_term_102 ;;
  }

  dimension: max_past_6_tot_term_103 {
    type: number
    sql: ${TABLE}.max_past_6_tot_term_103 ;;
  }

  dimension: max_past_6_ve_term_103 {
    type: number
    sql: ${TABLE}.max_past_6_ve_term_103 ;;
  }

  dimension: max_time_between_shifts {
    type: number
    sql: ${TABLE}.max_time_between_shifts ;;
  }

  dimension: max_to_p1_tot_term_101 {
    type: number
    sql: ${TABLE}.max_to_p1_tot_term_101 ;;
  }

  dimension: max_to_p1_tot_term_102 {
    type: number
    sql: ${TABLE}.max_to_p1_tot_term_102 ;;
  }

  dimension: max_to_p1_tot_term_103 {
    type: number
    sql: ${TABLE}.max_to_p1_tot_term_103 ;;
  }

  dimension: max_to_p1_ve_term_103 {
    type: number
    sql: ${TABLE}.max_to_p1_ve_term_103 ;;
  }

  dimension: mid_pay_dept {
    type: number
    sql: ${TABLE}.mid_pay_dept ;;
  }

  dimension: mid_pay_sched {
    type: number
    sql: ${TABLE}.mid_pay_sched ;;
  }

  dimension: min_past_6_tot_term_101 {
    type: number
    sql: ${TABLE}.min_past_6_tot_term_101 ;;
  }

  dimension: min_past_6_tot_term_102 {
    type: number
    sql: ${TABLE}.min_past_6_tot_term_102 ;;
  }

  dimension: min_past_6_tot_term_103 {
    type: number
    sql: ${TABLE}.min_past_6_tot_term_103 ;;
  }

  dimension: min_past_6_ve_term_103 {
    type: number
    sql: ${TABLE}.min_past_6_ve_term_103 ;;
  }

  dimension: min_time_between_shifts {
    type: number
    sql: ${TABLE}.min_time_between_shifts ;;
  }

  dimension: new_grad {
    type: number
    sql: ${TABLE}.new_grad ;;
  }

  dimension: new_hire_perc_101 {
    type: number
    sql: ${TABLE}.new_hire_perc_101 ;;
  }

  dimension: new_hire_perc_101_lag1 {
    type: number
    sql: ${TABLE}.new_hire_perc_101_lag1 ;;
  }

  dimension: new_hire_perc_101_lag2 {
    type: number
    sql: ${TABLE}.new_hire_perc_101_lag2 ;;
  }

  dimension: new_hire_perc_101_lag3 {
    type: number
    sql: ${TABLE}.new_hire_perc_101_lag3 ;;
  }

  dimension: new_hire_perc_101_lag4 {
    type: number
    sql: ${TABLE}.new_hire_perc_101_lag4 ;;
  }

  dimension: new_hire_perc_101_lag5 {
    type: number
    sql: ${TABLE}.new_hire_perc_101_lag5 ;;
  }

  dimension: new_hire_perc_102 {
    type: number
    sql: ${TABLE}.new_hire_perc_102 ;;
  }

  dimension: new_hire_perc_102_lag1 {
    type: number
    sql: ${TABLE}.new_hire_perc_102_lag1 ;;
  }

  dimension: new_hire_perc_102_lag2 {
    type: number
    sql: ${TABLE}.new_hire_perc_102_lag2 ;;
  }

  dimension: new_hire_perc_102_lag3 {
    type: number
    sql: ${TABLE}.new_hire_perc_102_lag3 ;;
  }

  dimension: new_hire_perc_102_lag4 {
    type: number
    sql: ${TABLE}.new_hire_perc_102_lag4 ;;
  }

  dimension: new_hire_perc_102_lag5 {
    type: number
    sql: ${TABLE}.new_hire_perc_102_lag5 ;;
  }

  dimension: new_hire_perc_103 {
    type: number
    sql: ${TABLE}.new_hire_perc_103 ;;
  }

  dimension: new_hire_perc_103_lag1 {
    type: number
    sql: ${TABLE}.new_hire_perc_103_lag1 ;;
  }

  dimension: new_hire_perc_103_lag2 {
    type: number
    sql: ${TABLE}.new_hire_perc_103_lag2 ;;
  }

  dimension: new_hire_perc_103_lag3 {
    type: number
    sql: ${TABLE}.new_hire_perc_103_lag3 ;;
  }

  dimension: new_hire_perc_103_lag4 {
    type: number
    sql: ${TABLE}.new_hire_perc_103_lag4 ;;
  }

  dimension: new_hire_perc_103_lag5 {
    type: number
    sql: ${TABLE}.new_hire_perc_103_lag5 ;;
  }

  dimension: new_hire_perc_104 {
    type: number
    sql: ${TABLE}.new_hire_perc_104 ;;
  }

  dimension: new_hire_perc_104_lag1 {
    type: number
    sql: ${TABLE}.new_hire_perc_104_lag1 ;;
  }

  dimension: new_hire_perc_104_lag2 {
    type: number
    sql: ${TABLE}.new_hire_perc_104_lag2 ;;
  }

  dimension: new_hire_perc_104_lag3 {
    type: number
    sql: ${TABLE}.new_hire_perc_104_lag3 ;;
  }

  dimension: new_hire_perc_104_lag4 {
    type: number
    sql: ${TABLE}.new_hire_perc_104_lag4 ;;
  }

  dimension: new_hire_perc_104_lag5 {
    type: number
    sql: ${TABLE}.new_hire_perc_104_lag5 ;;
  }

  dimension: new_hire_perc_105 {
    type: number
    sql: ${TABLE}.new_hire_perc_105 ;;
  }

  dimension: new_hire_perc_105_lag1 {
    type: number
    sql: ${TABLE}.new_hire_perc_105_lag1 ;;
  }

  dimension: new_hire_perc_105_lag2 {
    type: number
    sql: ${TABLE}.new_hire_perc_105_lag2 ;;
  }

  dimension: new_hire_perc_105_lag3 {
    type: number
    sql: ${TABLE}.new_hire_perc_105_lag3 ;;
  }

  dimension: new_hire_perc_105_lag4 {
    type: number
    sql: ${TABLE}.new_hire_perc_105_lag4 ;;
  }

  dimension: new_hire_perc_105_lag5 {
    type: number
    sql: ${TABLE}.new_hire_perc_105_lag5 ;;
  }

  dimension: num_change_status {
    type: number
    sql: ${TABLE}.num_change_status ;;
  }

  dimension: num_coids {
    type: number
    sql: ${TABLE}.num_coids ;;
  }

  dimension: num_leave_hours {
    type: number
    sql: ${TABLE}.num_leave_hours ;;
  }

  dimension: num_of_demotions {
    type: number
    sql: ${TABLE}.num_of_demotions ;;
  }

  dimension: num_of_pos_sids {
    type: number
    sql: ${TABLE}.num_of_pos_sids ;;
  }

  dimension: num_of_promotions {
    type: number
    sql: ${TABLE}.num_of_promotions ;;
  }

  dimension: num_over_20_hr_weeks {
    type: number
    sql: ${TABLE}.num_over_20_hr_weeks ;;
  }

  dimension: num_over_3_12hrs_consec_days {
    type: number
    sql: ${TABLE}.num_over_3_12hrs_consec_days ;;
  }

  dimension: num_over_40_hr_weeks {
    type: number
    sql: ${TABLE}.num_over_40_hr_weeks ;;
  }

  dimension: num_over_4_10hrs_consec_days {
    type: number
    sql: ${TABLE}.num_over_4_10hrs_consec_days ;;
  }

  dimension: num_over_5_8hrs_consec_days {
    type: number
    sql: ${TABLE}.num_over_5_8hrs_consec_days ;;
  }

  dimension: num_over_5_consec_days {
    type: number
    sql: ${TABLE}.num_over_5_consec_days ;;
  }

  dimension: num_pay_changes {
    type: number
    sql: ${TABLE}.num_pay_changes ;;
  }

  dimension: num_rn_dept {
    type: number
    sql: ${TABLE}.num_rn_dept ;;
  }

  dimension: overtime_every_week {
    type: number
    sql: ${TABLE}.overtime_every_week ;;
  }

  dimension: p1_delta_tot_term_101 {
    type: number
    sql: ${TABLE}.p1_delta_tot_term_101 ;;
  }

  dimension: p1_delta_tot_term_102 {
    type: number
    sql: ${TABLE}.p1_delta_tot_term_102 ;;
  }

  dimension: p1_delta_tot_term_103 {
    type: number
    sql: ${TABLE}.p1_delta_tot_term_103 ;;
  }

  dimension: p1_delta_ve_term_103 {
    type: number
    sql: ${TABLE}.p1_delta_ve_term_103 ;;
  }

  dimension: p2_delta_tot_term_101 {
    type: number
    sql: ${TABLE}.p2_delta_tot_term_101 ;;
  }

  dimension: p2_delta_tot_term_102 {
    type: number
    sql: ${TABLE}.p2_delta_tot_term_102 ;;
  }

  dimension: p2_delta_tot_term_103 {
    type: number
    sql: ${TABLE}.p2_delta_tot_term_103 ;;
  }

  dimension: p2_delta_ve_term_103 {
    type: number
    sql: ${TABLE}.p2_delta_ve_term_103 ;;
  }

  dimension: p3_delta_tot_term_101 {
    type: number
    sql: ${TABLE}.p3_delta_tot_term_101 ;;
  }

  dimension: p3_delta_tot_term_102 {
    type: number
    sql: ${TABLE}.p3_delta_tot_term_102 ;;
  }

  dimension: p3_delta_tot_term_103 {
    type: number
    sql: ${TABLE}.p3_delta_tot_term_103 ;;
  }

  dimension: p3_delta_ve_term_103 {
    type: number
    sql: ${TABLE}.p3_delta_ve_term_103 ;;
  }

  dimension: p4_delta_tot_term_101 {
    type: number
    sql: ${TABLE}.p4_delta_tot_term_101 ;;
  }

  dimension: p4_delta_tot_term_102 {
    type: number
    sql: ${TABLE}.p4_delta_tot_term_102 ;;
  }

  dimension: p4_delta_tot_term_103 {
    type: number
    sql: ${TABLE}.p4_delta_tot_term_103 ;;
  }

  dimension: p4_delta_ve_term_103 {
    type: number
    sql: ${TABLE}.p4_delta_ve_term_103 ;;
  }

  dimension: pct_ratio_103 {
    type: number
    sql: ${TABLE}.pct_ratio_103 ;;
  }

  dimension: pct_ratio_103_lag1 {
    type: number
    sql: ${TABLE}.pct_ratio_103_lag1 ;;
  }

  dimension: pct_ratio_103_lag2 {
    type: number
    sql: ${TABLE}.pct_ratio_103_lag2 ;;
  }

  dimension: pct_ratio_103_lag3 {
    type: number
    sql: ${TABLE}.pct_ratio_103_lag3 ;;
  }

  dimension: pct_ratio_103_lag4 {
    type: number
    sql: ${TABLE}.pct_ratio_103_lag4 ;;
  }

  dimension: pct_ratio_103_lag5 {
    type: number
    sql: ${TABLE}.pct_ratio_103_lag5 ;;
  }

  dimension: pos_tenure {
    type: number
    sql: ${TABLE}.pos_tenure ;;
  }

  dimension: predicted_target {
    type: string
    sql: ${TABLE}.predicted_target ;;
  }

  dimension: promo_move_ratio {
    type: number
    sql: ${TABLE}.promo_move_ratio ;;
  }

  dimension: pto_hours_used {
    type: number
    sql: ${TABLE}.pto_hours_used ;;
  }

  dimension: rate_delta_l03 {
    type: number
    sql: ${TABLE}.rate_delta_l03 ;;
  }

  dimension: rate_delta_l03_lag1 {
    type: number
    sql: ${TABLE}.rate_delta_l03_lag1 ;;
  }

  dimension: rate_delta_l03_lag2 {
    type: number
    sql: ${TABLE}.rate_delta_l03_lag2 ;;
  }

  dimension: rate_delta_l03_lag3 {
    type: number
    sql: ${TABLE}.rate_delta_l03_lag3 ;;
  }

  dimension: rate_delta_l03_lag4 {
    type: number
    sql: ${TABLE}.rate_delta_l03_lag4 ;;
  }

  dimension: rate_delta_l03_lag5 {
    type: number
    sql: ${TABLE}.rate_delta_l03_lag5 ;;
  }

  dimension: rn_xp_bucket {
    type: string
    sql: ${TABLE}.rn_xp_bucket ;;
  }

  dimension: sub_functional_dept_desc {
    type: string
    sql: ${TABLE}.sub_functional_dept_desc ;;
  }

  dimension: target {
    type: number
    sql: ${TABLE}.target ;;
  }

  dimension: term_type_latest {
    type: string
    sql: ${TABLE}.term_type_latest ;;
  }

  dimension: tot_term_101_lag1 {
    type: number
    sql: ${TABLE}.tot_term_101_lag1 ;;
  }

  dimension: tot_term_101_lag2 {
    type: number
    sql: ${TABLE}.tot_term_101_lag2 ;;
  }

  dimension: tot_term_101_lag3 {
    type: number
    sql: ${TABLE}.tot_term_101_lag3 ;;
  }

  dimension: tot_term_101_lag4 {
    type: number
    sql: ${TABLE}.tot_term_101_lag4 ;;
  }

  dimension: tot_term_101_lag5 {
    type: number
    sql: ${TABLE}.tot_term_101_lag5 ;;
  }

  dimension: tot_term_102_lag1 {
    type: number
    sql: ${TABLE}.tot_term_102_lag1 ;;
  }

  dimension: tot_term_102_lag2 {
    type: number
    sql: ${TABLE}.tot_term_102_lag2 ;;
  }

  dimension: tot_term_102_lag3 {
    type: number
    sql: ${TABLE}.tot_term_102_lag3 ;;
  }

  dimension: tot_term_102_lag4 {
    type: number
    sql: ${TABLE}.tot_term_102_lag4 ;;
  }

  dimension: tot_term_102_lag5 {
    type: number
    sql: ${TABLE}.tot_term_102_lag5 ;;
  }

  dimension: tot_term_103_lag1 {
    type: number
    sql: ${TABLE}.tot_term_103_lag1 ;;
  }

  dimension: tot_term_103_lag2 {
    type: number
    sql: ${TABLE}.tot_term_103_lag2 ;;
  }

  dimension: tot_term_103_lag3 {
    type: number
    sql: ${TABLE}.tot_term_103_lag3 ;;
  }

  dimension: tot_term_103_lag4 {
    type: number
    sql: ${TABLE}.tot_term_103_lag4 ;;
  }

  dimension: tot_term_103_lag5 {
    type: number
    sql: ${TABLE}.tot_term_103_lag5 ;;
  }

  dimension: tot_term_104_lag1 {
    type: number
    sql: ${TABLE}.tot_term_104_lag1 ;;
  }

  dimension: tot_term_104_lag2 {
    type: number
    sql: ${TABLE}.tot_term_104_lag2 ;;
  }

  dimension: tot_term_104_lag3 {
    type: number
    sql: ${TABLE}.tot_term_104_lag3 ;;
  }

  dimension: tot_term_104_lag4 {
    type: number
    sql: ${TABLE}.tot_term_104_lag4 ;;
  }

  dimension: tot_term_104_lag5 {
    type: number
    sql: ${TABLE}.tot_term_104_lag5 ;;
  }

  dimension: tot_term_105_lag1 {
    type: number
    sql: ${TABLE}.tot_term_105_lag1 ;;
  }

  dimension: tot_term_105_lag2 {
    type: number
    sql: ${TABLE}.tot_term_105_lag2 ;;
  }

  dimension: tot_term_105_lag3 {
    type: number
    sql: ${TABLE}.tot_term_105_lag3 ;;
  }

  dimension: tot_term_105_lag4 {
    type: number
    sql: ${TABLE}.tot_term_105_lag4 ;;
  }

  dimension: tot_term_105_lag5 {
    type: number
    sql: ${TABLE}.tot_term_105_lag5 ;;
  }

  dimension: tot_term_rate_101 {
    type: number
    sql: ${TABLE}.tot_term_rate_101 ;;
  }

  dimension: tot_term_rate_102 {
    type: number
    sql: ${TABLE}.tot_term_rate_102 ;;
  }

  dimension: tot_term_rate_103 {
    type: number
    sql: ${TABLE}.tot_term_rate_103 ;;
  }

  dimension: tot_term_rate_104 {
    type: number
    sql: ${TABLE}.tot_term_rate_104 ;;
  }

  dimension: tot_term_rate_105 {
    type: number
    sql: ${TABLE}.tot_term_rate_105 ;;
  }

  dimension: total_charge_hours {
    type: number
    sql: ${TABLE}.total_charge_hours ;;
  }

  dimension: total_less_than_12hrs_between_shifts {
    type: number
    sql: ${TABLE}.total_less_than_12hrs_between_shifts ;;
  }

  dimension: total_more_than_12hrs_worked_in_24 {
    type: number
    sql: ${TABLE}.total_more_than_12hrs_worked_in_24 ;;
  }

  dimension: total_overtime_hours {
    type: number
    sql: ${TABLE}.total_overtime_hours ;;
  }

  dimension: union_indicator {
    type: number
    sql: ${TABLE}.union_indicator ;;
  }

  dimension: ve_term_101_lag1 {
    type: number
    sql: ${TABLE}.ve_term_101_lag1 ;;
  }

  dimension: ve_term_101_lag2 {
    type: number
    sql: ${TABLE}.ve_term_101_lag2 ;;
  }

  dimension: ve_term_101_lag3 {
    type: number
    sql: ${TABLE}.ve_term_101_lag3 ;;
  }

  dimension: ve_term_101_lag4 {
    type: number
    sql: ${TABLE}.ve_term_101_lag4 ;;
  }

  dimension: ve_term_101_lag5 {
    type: number
    sql: ${TABLE}.ve_term_101_lag5 ;;
  }

  dimension: ve_term_102_lag1 {
    type: number
    sql: ${TABLE}.ve_term_102_lag1 ;;
  }

  dimension: ve_term_102_lag2 {
    type: number
    sql: ${TABLE}.ve_term_102_lag2 ;;
  }

  dimension: ve_term_102_lag3 {
    type: number
    sql: ${TABLE}.ve_term_102_lag3 ;;
  }

  dimension: ve_term_102_lag4 {
    type: number
    sql: ${TABLE}.ve_term_102_lag4 ;;
  }

  dimension: ve_term_102_lag5 {
    type: number
    sql: ${TABLE}.ve_term_102_lag5 ;;
  }

  dimension: ve_term_103_lag1 {
    type: number
    sql: ${TABLE}.ve_term_103_lag1 ;;
  }

  dimension: ve_term_103_lag2 {
    type: number
    sql: ${TABLE}.ve_term_103_lag2 ;;
  }

  dimension: ve_term_103_lag3 {
    type: number
    sql: ${TABLE}.ve_term_103_lag3 ;;
  }

  dimension: ve_term_103_lag4 {
    type: number
    sql: ${TABLE}.ve_term_103_lag4 ;;
  }

  dimension: ve_term_103_lag5 {
    type: number
    sql: ${TABLE}.ve_term_103_lag5 ;;
  }

  dimension: ve_term_104_lag1 {
    type: number
    sql: ${TABLE}.ve_term_104_lag1 ;;
  }

  dimension: ve_term_104_lag2 {
    type: number
    sql: ${TABLE}.ve_term_104_lag2 ;;
  }

  dimension: ve_term_104_lag3 {
    type: number
    sql: ${TABLE}.ve_term_104_lag3 ;;
  }

  dimension: ve_term_104_lag4 {
    type: number
    sql: ${TABLE}.ve_term_104_lag4 ;;
  }

  dimension: ve_term_104_lag5 {
    type: number
    sql: ${TABLE}.ve_term_104_lag5 ;;
  }

  dimension: ve_term_105_lag1 {
    type: number
    sql: ${TABLE}.ve_term_105_lag1 ;;
  }

  dimension: ve_term_105_lag2 {
    type: number
    sql: ${TABLE}.ve_term_105_lag2 ;;
  }

  dimension: ve_term_105_lag3 {
    type: number
    sql: ${TABLE}.ve_term_105_lag3 ;;
  }

  dimension: ve_term_105_lag4 {
    type: number
    sql: ${TABLE}.ve_term_105_lag4 ;;
  }

  dimension: ve_term_105_lag5 {
    type: number
    sql: ${TABLE}.ve_term_105_lag5 ;;
  }

  dimension: ve_term_rate_101 {
    type: number
    sql: ${TABLE}.ve_term_rate_101 ;;
  }

  dimension: ve_term_rate_102 {
    type: number
    sql: ${TABLE}.ve_term_rate_102 ;;
  }

  dimension: ve_term_rate_103 {
    type: number
    sql: ${TABLE}.ve_term_rate_103 ;;
  }

  dimension: ve_term_rate_104 {
    type: number
    sql: ${TABLE}.ve_term_rate_104 ;;
  }

  dimension: ve_term_rate_105 {
    type: number
    sql: ${TABLE}.ve_term_rate_105 ;;
  }

  dimension: vi_term_rate_101 {
    type: number
    sql: ${TABLE}.vi_term_rate_101 ;;
  }

  dimension: vi_term_rate_102 {
    type: number
    sql: ${TABLE}.vi_term_rate_102 ;;
  }

  dimension: vi_term_rate_103 {
    type: number
    sql: ${TABLE}.vi_term_rate_103 ;;
  }

  dimension: vi_term_rate_104 {
    type: number
    sql: ${TABLE}.vi_term_rate_104 ;;
  }

  dimension: vi_term_rate_105 {
    type: number
    sql: ${TABLE}.vi_term_rate_105 ;;
  }

  dimension: wage_compression {
    type: number
    sql: ${TABLE}.wage_compression ;;
  }

  dimension: wage_index {
    type: number
    sql: ${TABLE}.wage_index ;;
  }

  dimension: wage_index_initial {
    type: number
    sql: ${TABLE}.wage_index_initial ;;
  }

  dimension: work_ratio {
    type: number
    sql: ${TABLE}.work_ratio ;;
  }

  dimension: work_schedule_desc {
    type: string
    sql: ${TABLE}.work_schedule_desc ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
