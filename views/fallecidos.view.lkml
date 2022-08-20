# The name of this view in Looker is "Fallecidos"
view: fallecidos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dalpa_academy_covid19.fallecidos`
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

  dimension: edad_declarada {
    type: number
    sql: ${TABLE}.EDAD_DECLARADA ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_edad_declarada {
    type: sum
    sql: ${edad_declarada} ;;
  }

  measure: average_edad_declarada {
    type: average
    sql: ${edad_declarada} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha_fallecimiento {
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
    sql: ${TABLE}.FECHA_FALLECIMIENTO ;;
  }

  dimension_group: fecha_nac {
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
    sql: ${TABLE}.FECHA_NAC ;;
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
