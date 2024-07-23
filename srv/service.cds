using tuesday as db from '../db/data-model';


service CatalogService {

    entity businesspartner                        as projection on db.bp;
    entity address                                as projection on db.ad;

    /// combo is mix of bp and ad tables for sake of change

    // otesting with ohav
    entity combo @(cds.redirection.target: false) as
        projection on db.bp {
            BP_ID,
            BP_ROLE,
            EMAIL_ADDRESS,
            PHONE_NUMBER,
            FAX_NUMBER,
            WEB_ADDRESS,
            COMPANY_NAME,
            LEGAL_FORM,
            APPROVAL_STATUS,
            ADDRESS_GUID.ADDRESS_TYPE,
            ADDRESS_GUID.BUILDING,
            ADDRESS_GUID.CITY,
            ADDRESS_GUID.COUNTRY,
            ADDRESS_GUID.LATITUDE,
            ADDRESS_GUID.LONGITUDE,
            ADDRESS_GUID.POSTAL_CODE
        };
}
