include: "/_standard/*.layer.lkml"
view: ga_stat {
  dimension: traffic_type {
    type: string
    sql:
        case
            when ${fct_ga_sessions.device_browser} = 'google' and ${fct_ga_sessions.traffic_source} like '%google%' then 'partner'
            else 'non-partner'
        end

      ;;
  }

  measure: total_page_views_from_partner {
    type: sum
    sql: ${fct_ga_sessions.number_of_page_views} ;;
    filters: [
      traffic_type: "partner"
    ]
  }
}

explore: fct_ga_sessions {
  label: "GA Traffic"
  view_label: "GA Sessions"
  join: ga_stat {
    view_label: "Metrics"
    relationship: one_to_one
    sql: ;;
  type: left_outer
  }

  join: retail_calendar {
    view_label: "Date"
    type: left_outer
    relationship: many_to_one
    sql_on: ${fct_ga_sessions.started_date} = ${retail_calendar.fiscal_date}  ;;
  }
}
