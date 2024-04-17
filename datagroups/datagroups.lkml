datagroup: working_hour_refresh {
  max_cache_age: "1 hour"
  sql_trigger: |
    select hour_trigger
    from (select extract(hour from current_datetime('America/Los_Angeles')) as hour_trigger) hours
    where hour_trigger not between 0 and 3
    ;;
}
