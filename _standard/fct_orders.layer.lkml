include: "/_base/fct_orders.view.lkml"

view: +fct_orders {
  dimension: invoice_no {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.InvoiceNo ;;
  }

  dimension_group: invoice {
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
    convert_tz: yes
    sql: ${TABLE}.InvoiceDate ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
    hidden: yes
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.UnitPrice ;;
    hidden: yes
  }


  measure: total_quantity {
    view_label: "Metrics"
    type: sum
    sql: ${quantity} ;;
  }

  measure: total_revenue {
    view_label: "Metrics"
    type: sum
    sql: ${unit_price}*${quantity} ;;
  }

}
