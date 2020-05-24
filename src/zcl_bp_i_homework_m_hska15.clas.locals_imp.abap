CLASS lhc_PL DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS validateYear FOR VALIDATION pl~validateYear
      IMPORTING keys FOR pl.

    METHODS validateFavorite FOR VALIDATION pl~validateFavorite
      IMPORTING keys FOR pl.

    METHODS makeFavorite FOR MODIFY
      IMPORTING keys FOR ACTION pl~makeFavorite RESULT result.

      METHODS unFavorite FOR MODIFY
      IMPORTING keys FOR ACTION pl~unFavorite RESULT result.

    METHODS get_features FOR FEATURES
      IMPORTING keys REQUEST requested_features FOR pl RESULT result.

 "   DATA: refernceYear TYPE i.
DATA: lv_increment TYPE i.

ENDCLASS.

CLASS lhc_PL IMPLEMENTATION.

  METHOD validateYear.


* CAN BE CHANGED
   " refernceYear = 1940.

    READ ENTITY zi_homework_m_hska15\\pl FROM VALUE #(
        FOR <root_key> IN keys ( %key     = <root_key>
                                 %control = VALUE #( creation_year = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_language_result).

    LOOP AT lt_language_result INTO DATA(ls_language_result).



      IF ls_language_result-creation_year IS INITIAL OR NOT ( ls_language_result-creation_year CO '0123456789' ).
        APPEND VALUE #(  %key        = ls_language_result-%key
                        mykey = ls_language_result-mykey ) TO failed.
        APPEND VALUE #(  %key        = ls_language_result-%key
                         %msg     = new_message( id       = 'ZHSKA15_2'
                                                number   = '001'
                                                severity = if_abap_behv_message=>severity-error )
                         %element-mykey = if_abap_behv=>mk-on ) TO reported.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

    METHOD validateFavorite.


* CAN BE CHANGED

    READ ENTITY zi_homework_m_hska15\\pl FROM VALUE #(
        FOR <root_key> IN keys ( %key     = <root_key>
                                 %control = VALUE #( favourite = if_abap_behv=>mk-on ) ) )
        RESULT DATA(lt_language_result).

    LOOP AT lt_language_result INTO DATA(ls_language_result).
      IF ls_language_result-favourite IS INITIAL OR NOT ( ls_language_result-favourite CO 'YN' ).
        APPEND VALUE #(  %key        = ls_language_result-%key
                        mykey = ls_language_result-mykey ) TO failed.
        APPEND VALUE #(  %key        = ls_language_result-%key
                         %msg     = new_message( id       = 'ZHSKA15_2'
                                                number   = '002'
                                                severity = if_abap_behv_message=>severity-error )
                         %element-mykey = if_abap_behv=>mk-on ) TO reported.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD makeFavorite.

    " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF zi_homework_m_hska15 IN LOCAL MODE
           ENTITY pl
              UPDATE FROM VALUE #( FOR key IN keys ( mykey = key-mykey
                                                     favourite = 'Y' " Yes
                                                     %control-favourite = if_abap_behv=>mk-on ) )
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zi_homework_m_hska15 IN LOCAL MODE
         ENTITY pl
         FROM VALUE #( FOR key IN keys (  mykey = key-mykey
                                          %control = VALUE #(
                                            name       = if_abap_behv=>mk-on
                                            creation_year     = if_abap_behv=>mk-on
                                            field_of_use      = if_abap_behv=>mk-on
                                            features        = if_abap_behv=>mk-on
                                            site_url     = if_abap_behv=>mk-on
                                            site_rating     = if_abap_behv=>mk-on
                                            rating   = if_abap_behv=>mk-on
                                            favourite  = if_abap_behv=>mk-on
                                            created_by      = if_abap_behv=>mk-on
                                            created_at      = if_abap_behv=>mk-on
                                            last_changed_by = if_abap_behv=>mk-on
                                            last_changed_at = if_abap_behv=>mk-on
                                          ) ) )
         RESULT DATA(lt_language).

    result = VALUE #( FOR language IN lt_language ( mykey = language-mykey
                                                %param    = language ) ).


  ENDMETHOD.

 METHOD unFavorite.
    MODIFY ENTITIES OF zi_homework_m_hska15 IN LOCAL MODE
           ENTITY pl
              UPDATE FROM VALUE #( FOR key IN keys ( mykey = key-mykey
                                                     favourite = 'N' " No
                                                     %control-favourite = if_abap_behv=>mk-on ) )
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zi_homework_m_hska15 IN LOCAL MODE
         ENTITY pl
         FROM VALUE #( FOR key IN keys (  mykey = key-mykey
                                          %control = VALUE #(
                                            name       = if_abap_behv=>mk-on
                                            creation_year     = if_abap_behv=>mk-on
                                            field_of_use      = if_abap_behv=>mk-on
                                            features        = if_abap_behv=>mk-on
                                            site_url     = if_abap_behv=>mk-on
                                            site_rating     = if_abap_behv=>mk-on
                                            rating   = if_abap_behv=>mk-on
                                            favourite  = if_abap_behv=>mk-on
                                            created_by      = if_abap_behv=>mk-on
                                            created_at      = if_abap_behv=>mk-on
                                            last_changed_by = if_abap_behv=>mk-on
                                            last_changed_at = if_abap_behv=>mk-on
                                          ) ) )
         RESULT DATA(lt_language).

    result = VALUE #( FOR language IN lt_language ( mykey = language-mykey
                                                %param    = language ) ).

  ENDMETHOD.

  METHOD get_features.
    "%control-<fieldname> specifies which fields are read from the entities

    READ ENTITY zi_homework_m_hska15 FROM VALUE #( FOR keyval IN keys
                                                      (  %key                    = keyval-%key

                                                         %control-favourite = if_abap_behv=>mk-on
                                                        ) )
                                RESULT DATA(lt_language_result).


    result = VALUE #( FOR ls_language IN lt_language_result
                       ( %key                           = ls_language-%key
                         %features-%action-makeFavorite = COND #( WHEN ls_language-favourite = 'Y'
                                                                    THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled   )
                      ) ).

  ENDMETHOD.

ENDCLASS.
