include: "/_base/retail_calendar.view.lkml"

view: +retail_calendar {
  filter: current_date_range {
    type: date
    view_label: "Period-over-Period"
    label: "1. Current Date Range"
    description: "Select the current date range you are interested in. Make sure any other filter on Event Date covers this period, or is removed."
    convert_tz: no
  }


  parameter: choose_breakdown {
    label: "Choose Grouping (Rows)"
    description: "Choose Period granularity for time series in X axis"
    view_label: "Period-over-Period"
    type: unquoted
    default_value: "Month"
    allowed_value: {label: "Month Name" value:"Month"}
    allowed_value: {label: "Day of Week" value: "DOW"}
    allowed_value: {label: "Day of Month" value: "DOM"}
  }

  parameter: choose_comparison {
    label: "Choose Comparison (Columns)"
    description: "Choose Period granularity for comparison in legend"
    view_label: "Period-over-Period"
    type: unquoted
    default_value: "Year"
    allowed_value: {value: "Year" }
    allowed_value: {value: "Month"}
    allowed_value: {value: "Week"}
  }

  # These dimensions are just to make sure the dimensions sort correctly
  dimension: sort_by1 {
    hidden: yes
    type: number
    sql:
        {% if choose_breakdown._parameter_value == 'Month' %} ${date_spine_month_num}
        {% elsif choose_breakdown._parameter_value == 'DOM' %} ${date_spine_day_of_month}
        {% elsif choose_breakdown._parameter_value == 'DOW' %} ${date_spine_day_of_week_index}
        {% else %}NULL{% endif %} ;;
  }

  dimension: sort_by2 {
    hidden: yes
    type: string
    sql:
        {% if choose_comparison._parameter_value == 'Year' %} ${date_spine_year}
        {% elsif choose_comparison._parameter_value == 'Month' %} ${date_spine_month_num}
        {% elsif choose_comparison._parameter_value == 'Week' %} ${date_spine_week}
        {% else %}NULL{% endif %} ;;
  }

  dimension: pop_row  {
    view_label: "Period-over-Period"
    description: "Time series breakdown, controlled by parameter Choose Grouping (Rows)"
    label_from_parameter: choose_breakdown
    type: string
    order_by_field: sort_by1 # Important
    sql:
        {% if choose_breakdown._parameter_value == 'Month' %} ${date_spine_month_name}
        {% elsif choose_breakdown._parameter_value == 'DOM' %} ${date_spine_day_of_month}
        {% elsif choose_breakdown._parameter_value == 'DOW' %} ${date_spine_day_of_week}
        {% else %}NULL{% endif %} ;;
  }

  dimension: pop_pivot {
    view_label: "Period-over-Period"
    description: "Time series comparison, controlled by paremeter Choose Comparison (Columns)"
    label_from_parameter: choose_comparison
    type: string
    order_by_field: sort_by2 # Important
    sql:
        {% if choose_comparison._parameter_value == 'Year' %} ${date_spine_year}
        {% elsif choose_comparison._parameter_value == 'Month' %} ${date_spine_month_name}
        {% elsif choose_comparison._parameter_value == 'Week' %} ${date_spine_week}
        {% else %}NULL{% endif %} ;;
  }
}
