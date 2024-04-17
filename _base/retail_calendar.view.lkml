view: retail_calendar {
  sql_table_name: ${db_name}.${dataset_name}.retail_calendar ;;
  drill_fields: [unique_id]

  dimension: unique_id {
    primary_key: yes
    type: string
    hidden:  yes
    sql: ${TABLE}.date ;;
  }

  dimension_group: date_spine {
    label: "Retail"
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year,
      hour_of_day,
      day_of_week,
      day_of_month,
      week_of_year,
      month_name,
      month_num,
      day_of_week_index
    ]
    sql: timestamp(${TABLE}.formatted_date) ;;
    convert_tz: no
  }

  dimension_group: fiscal {
    label: "Retail"
    type: time
    datatype: timestamp
    hidden:  yes
    timeframes: [
      date,
      day_of_week,
      day_of_year,
      year
    ]
    sql: timestamp(${TABLE}.formatted_date) ;;
    convert_tz: no
  }

  dimension: retail_period_number {
    hidden: yes
    group_label: "Retail Date"
    label: "Retail Month (number)"
    type: number
    sql: ${TABLE}.period_number ;;
  }

  dimension: retail_day_of_year {
    label: "Retail Day of Year"
    group_label: "Retail Date"
    type: number
    sql: ${TABLE}.day_of_retail_year ;;
  }



  dimension: retail_year {
    label: "Retail Year"
    group_label: "Retail Date"
    type: number
    sql: ${TABLE}.retail_year ;;
  }

  dimension: retail_week_number {
    label: "Retail Week"
    group_label: "Retail Date"
    type: number
    sql: ${TABLE}.week_number ;;
  }



}

