@AbapCatalog.sqlViewName: 'ZVI_HOMEWORK_M15'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data model for language'
define root view ZI_HOMEWORK_M_HSKA15 
as select from yhska_15 {
    //yhska_15
    key mykey,
    name,
    creation_year,
    field_of_use,
    features,
    site_url,
    site_rating,
    rating,
    favourite,

      /*-- Admin data --*/
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at
}
