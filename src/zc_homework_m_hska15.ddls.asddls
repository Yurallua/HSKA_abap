@EndUserText.label: 'Language projection view - Processor'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true

define root view entity ZC_HOMEWORK_M_HSKA15
  as projection on ZI_HOMEWORK_M_HSKA15
{


      @UI.facet: [ { id:              'Language',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Language',
                     position:        10 } ]

      @UI.hidden: true
        key mykey           as TravelUUID,


      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'Programming language name' } ] }
      @Search.defaultSearchElement: true
      name            as Name,

      @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20, label: 'Creation year [ex.: 1990]' } ] }
      @Search.defaultSearchElement: true
      creation_year   as CreationYear,

      @UI: {
      lineItem:       [ { position: 30, importance: #HIGH } ],
      identification: [ { position: 30, label: 'Example of usage' } ] }
      @Search.defaultSearchElement: true
      field_of_use    as FieldOfUse,

      @UI: {
       lineItem:       [ { position: 30, importance: #HIGH } ],
       identification: [ { position: 30, label: 'features' } ] }
      @Search.defaultSearchElement: true
      features        as Features,

      @UI: {
       lineItem:       [ { position: 40, importance: #HIGH } ],
       identification: [ { position: 40, label: 'Website URL' } ] }
      @Search.defaultSearchElement: true
      site_url        as Website,


      @UI: {
      lineItem:       [ { position: 50, importance: #HIGH } ],
      identification: [ { position: 50, label: 'Independent  rating' } ] }
      @Search.defaultSearchElement: true
      site_rating     as SiteRating,


                     
      @UI: {
         lineItem:       [ { position: 70, importance: #HIGH, type: #AS_DATAPOINT } ],
         dataPoint: { title: 'Rating', visualization: #RATING, targetValue: 5 },
         identification: [ { position: 70, label: 'Rating [1-5]' } ] }
      rating          as Rating,

      @UI: { 
          lineItem:       [ { position: 60, importance: #HIGH },
                            { type: #FOR_ACTION, dataAction: 'makeFavorite', label: 'Make Favorite' },
                            { type: #FOR_ACTION, dataAction: 'unFavorite', label: 'Unmake Favorite' } ],
        identification: [ { position: 60, label: 'Favorite Status [N(Nope)|Y(Yes)]' } ] }
      @Search.defaultSearchElement: true
      favourite       as Favourite,

      @UI.hidden: true
      last_changed_at as LastChangedAt

}
