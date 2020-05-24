CLASS zcl_generate_data_hska15 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GENERATE_DATA_HSKA15 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA:itab TYPE TABLE OF YHSKA_15.

*   read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

*   fill internal travel table (itab)
    itab = VALUE #(
  ( mykey = '02D5290E594C1EDA93815057FD946624' name = 'Python' creation_year = '1990' field_of_use = 'DataScience, CV, ML' features = 'Easy and sexy'
  site_url = 'https://www.python.org/' site_rating = '4' rating = '0' favourite =  'N'
    created_by = 'MUSTERMANN' created_at = '20190612133945.5960060' last_changed_by = 'MUSTERFRAU' last_changed_at = '20190702105400.3647680' )
  ( mykey = '02D5290E594C1EDA93815057FD946623' name = 'Java' creation_year = '1995' field_of_use = 'SWE, Back-End' features = 'Slow but steady car with automatic GC, OOP and apinfull convention'
  site_url = 'https://www.java.com/en/' site_rating = '3' rating = '0' favourite =  'N'
    created_by = 'MUSTERMANN' created_at = '20190612133945.5960060' last_changed_by = 'MUSTERFRAU' last_changed_at = '20190702105400.3647680' )
  ( mykey = '02D5290E594C1EDA93815057FD946622' name = 'C' creation_year = '1972' field_of_use = 'Embeded Software and HSKA Labors' features = 'Old but good'
    site_url = 'https://www.linux.org/' site_rating = '4' rating = '0' favourite =  'N'
    created_by = 'MUSTERMANN' created_at = '20190612133945.5960060' last_changed_by = 'MUSTERFRAU' last_changed_at = '20190702105400.3647680' )
  ( mykey = '02D5290E594C1EDA93815057FD946621' name = 'C++' creation_year = '1985' field_of_use = 'Embeded Software and HSKA Labors' features = 'C++, just interate it with OOP'
  site_url = 'https://www.linux.org/' site_rating = '4'  rating = '0' favourite =  'N'
    created_by = 'MUSTERMANN' created_at = '20190612133945.5960060' last_changed_by = 'MUSTERFRAU' last_changed_at = '20190702105400.3647680' )
    ( mykey = '02D5290E594C1EDA93815057FD946626' name = 'HTML' creation_year = '1993' field_of_use = 'Web' features = 'It is not a programming language :D '
  site_url = 'https://whatwg.org/' site_rating = '10\10' rating = '0' favourite =  'N'
    created_by = 'MUSTERMANN' created_at = '20190612133945.5960060' last_changed_by = 'MUSTERFRAU' last_changed_at = '20190702105400.3647680' )
    ( mykey = '02D5290E594C1EDA93815057FD946627' name = 'Brainfuck' creation_year = '1993' field_of_use = 'Really?' features = 'Brainfuck is an esoteric programming language, and is notable for it`s unrealistic usage '
  site_url = 'https://www.bing.com/' site_rating = '+++++[-]' rating = '0' favourite =  'N'
    created_by = 'MUSTERMANN' created_at = '20190612133945.5960060' last_changed_by = 'MUSTERFRAU' last_changed_at = '20190702105400.3647680' )
  ).

*   delete existing entries in the database table
    DELETE FROM yhska_15.

*   insert the new table entries
    INSERT yhska_15 FROM TABLE @itab.

*   check the result
    SELECT * FROM yhska_15 INTO TABLE @itab.
    out->write( sy-dbcnt ).
    out->write( 'Travel data inserted successfully!').

  ENDMETHOD.
ENDCLASS.
