# The name of this view in Looker is "Infectados"
view: infectados {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dalpa_academy_covid19.infectados`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Departamento" in Explore.

  dimension: departamento {
    type: string
    sql: ${TABLE}.DEPARTAMENTO ;;
  }

  dimension: distrito {
    type: string
    sql: ${TABLE}.DISTRITO ;;
  }

  dimension: edad {
    type: number
    sql: ${TABLE}.EDAD ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_edad {
    type: sum
    sql: ${edad} ;;
  }

  measure: average_edad {
    type: average
    sql: ${edad} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha_resultado {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_RESULTADO ;;
  }

  dimension: metododx {
    type: string
    sql: ${TABLE}.METODODX ;;
  }

  dimension: provincia {
    type: string
    sql: ${TABLE}.PROVINCIA ;;
  }

  dimension: sexo {
    type: string
    sql: ${TABLE}.SEXO ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.UUID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
