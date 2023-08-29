CLASS zcl_itab_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab
           RETURNING
             VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
             VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_itab_basics IMPLEMENTATION.
  METHOD fill_itab.
    DATA: 
      w_initial_data like line of initial_data.
     
      w_initial_data-group = 'A'.
      w_initial_data-number = 10.
      w_initial_data-description = 'Group A-2'.

      APPEND  w_initial_data TO initial_data.
      CLEAR   w_initial_data.

      w_initial_data-group = 'B'.
      w_initial_data-number = 5.
      w_initial_data-description = 'Group B'.

      APPEND  w_initial_data TO initial_data.
      CLEAR   w_initial_data.

      w_initial_data-group = 'A'.
      w_initial_data-number = 6.
      w_initial_data-description = 'Group A-1'.

      APPEND  w_initial_data TO initial_data.
      CLEAR   w_initial_data.

      w_initial_data-group = 'C'.
      w_initial_data-number = 22.
      w_initial_data-description = 'Group C-1'.

      APPEND  w_initial_data TO initial_data.
      CLEAR   w_initial_data.

      w_initial_data-group = 'A'.
      w_initial_data-number = 13.
      w_initial_data-description = 'Group A-3'.

      APPEND  w_initial_data TO initial_data.
      CLEAR   w_initial_data.

      w_initial_data-group = 'C'.
      w_initial_data-number = 500.
      w_initial_data-description = 'Group C-2'.

      APPEND  w_initial_data TO initial_data.
      CLEAR   w_initial_data.

    
  ENDMETHOD.

  METHOD add_to_itab.
    updated_data = initial_data.

    DATA: w_updated_data like line of updated_data.

    w_updated_data-group = 'A'.
    w_updated_data-number = 19.
    w_updated_data-description = 'Group A-4'.

    APPEND  w_updated_data TO updated_data.
    CLEAR   w_updated_data.
  ENDMETHOD.

  METHOD sort_itab.
    updated_data = initial_data.
    SORT updated_data by group ASCENDING number DESCENDING.
  ENDMETHOD.

  METHOD search_itab.
    DATA: iv_data type itab_data_type,
          w_iv_data LIKE LINE OF iv_data.

          iv_data = initial_data. 
     
    LOOP AT iv_data into w_iv_data.
      if w_iv_data-number = 6.
        result_index = SY-TABIX.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
