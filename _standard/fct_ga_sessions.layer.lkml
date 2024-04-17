include: "/_base/fct_ga_sessions.view.lkml"

view: +fct_ga_sessions {

  dimension: traffic_browser {
    type: string
    sql: ${device_browser} ;;
  }

  dimension: number_of_page_views {
    type: number
    hidden: yes
    sql: ${TABLE}.number_of_page_views ;;
  }

  dimension: number_of_visit {
    type: number
    hidden: yes
    sql: ${TABLE}.number_of_visit ;;
  }

  dimension: unique_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.unique_id ;;
  }

  dimension: number_of_visit {
    type: number
    hidden: yes
    sql: ${TABLE}.number_of_visit ;;
  }

  measure: total_number_of_page_views {
    view_label: "Metrics"
    type: sum
    hidden: yes
    sql: ${number_of_page_views} ;;
  }

  measure: average_number_of_page_views {
    view_label: "Metrics"
    type: average
    hidden: yes
    sql: ${number_of_page_views} ;;
  }

  measure: average_page_views {
    view_label: "Metrics"
    type: number
    sql: ${number_of_page_views} ;;
  }

  measure: total_page_views {
    view_label: "Metrics"
    type: number
    sql: ${total_number_of_page_views} ;;
  }

  measure: total_visits {
    view_label: "Metrics"
    type: sum
    sql: ${number_of_visit} ;;
  }

  measure: average_visits {
    view_label: "Metrics"
    type: average
    sql: ${number_of_visit} ;;
  }

}
