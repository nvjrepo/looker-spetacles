# The name of this view in Looker is "Fct Ga Sessions"
view: fct_ga_sessions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `joon-sandbox.nam_data.fct_ga_sessions`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Device Browser" in Explore.

  dimension: device_browser {
    type: string
    sql: ${TABLE}.device_browser ;;
  }

  dimension: full_visitor_id {
    type: string
    sql: ${TABLE}.full_visitor_id ;;
  }

  dimension: number_of_page_views {
    type: number
    sql: ${TABLE}.number_of_page_views ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_page_views {
    type: sum
    sql: ${number_of_page_views} ;;
  }

  measure: average_number_of_page_views {
    type: average
    sql: ${number_of_page_views} ;;
  }

  dimension: number_of_visit {
    type: number
    sql: ${TABLE}.number_of_visit ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: started {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.started_at ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}.unique_id ;;
  }

  dimension: visit_id {
    type: number
    sql: ${TABLE}.visit_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
