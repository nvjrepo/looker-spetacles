include: "/_standard/*.layer.lkml"

view: order_stat {
  measure: total_revenue_past_7d {
    type: sum
    sql: ${fct_orders.unit_price}*${fct_orders.quantity} ;;
    filters: [
      fct_orders.invoice_date: "7 days ago"
    ]
  }

  measure: total_revenue_with_quantity_more_1 {
    type: sum
    sql: ${fct_orders.unit_price}*${fct_orders.quantity} ;;
    filters: [
      fct_orders.quantity: "> 1"
    ]
  }

  measure: total_revenue_of_pizza {
    type: sum
    sql: ${fct_orders.unit_price}*${fct_orders.quantity} ;;
    filters: [
      fct_orders.description: "%PIZZA%"
    ]
  }
}

explore: fct_orders {
  label: "Ecommerce Order & Stat"
  view_label: "Ecommerce Order"
  join: order_stat {
    view_label: "Metrics"
    relationship: one_to_one
    sql: ;;
  type: left_outer
}

join: retail_calendar {
  view_label: "Date"
  type: left_outer
  relationship: many_to_one
  sql_on: ${fct_orders.invoice_date} = ${retail_calendar.fiscal_date}  ;;
}
}
