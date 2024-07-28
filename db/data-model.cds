namespace tuesday;

entity bp {

    key NODE_KEY        : String(100);
        CLIENT          : String(3);
        BP_ROLE         : String(100);
        EMAIL_ADDRESS   : String(100);
        PHONE_NUMBER    : String(15);
        FAX_NUMBER      : String(100);
        WEB_ADDRESS     : String(100);
        ADDRESS_GUID    : Composition of ad;
        BP_ID           : String(100);
        COMPANY_NAME    : String(100);
        LEGAL_FORM      : String(100);
        APPROVAL_STATUS : String(100);

}

entity ad {
    key NODE_KEY       : String(100);
        CLIENT         : String(3);
        CITY           : String(100);
        POSTAL_CODE    : String(100);
        STREET         : String(100);
        BUILDING       : String(100);
        COUNTRY        : String(100);
        ADDRESS_TYPE   : String(10);
        VAL_START_DATE : String(100);
        VAL_END_DATE   : String(100);
        LATITUDE       : String(100);
        LONGITUDE      : String(100);
        address        : Association to one bp
                             on address.ADDRESS_GUID = $self
}

entity po {
        CLIENT           : String(3);
    key NODE_KEY         : String(100);
        PO_ID            : String(100);
        CREATED_BY       : String(100);
        CREATED_AT       : String(100);
        CHANGED_BY       : String(100);
        CHANGED_AT       : String(100);
        NOTE_GUID        : String(100);
        PARTNER_GUID     : String(100);
        CURRENCY_CODE    : String(100);
        GROSS_AMOUNT     : String(40);
        NET_AMOUNT       : String(40);
        TAX_AMOUNT       : String(40);
        LIFECYCLE_STATUS : String(10);
        APPROVAL_STATUS  : String(10);
        CONFIRM_STATUS   : String(10);
        ORDERING_STATUS  : String(10);
        INVOICING_STATUS : String(10);
        OVERALL_STATUS   : String(10);
        items            : Composition of many po.po_i
                               on items.PARENT_KEY = $self
}

entity po.po_i {
    CLIENT        : String(3);
    NODE_KEY      : String(100);
    PARENT_KEY    : Association to one po;
    PO_ITEM_POS   : String(10);
    PRODUCT_GUID  : String(100);
    NOTE_GUID     : String(100);
    CURRENCY_CODE : String(100);
    GROSS_AMOUNT  : String(100);
    NET_AMOUNT    : String(100);
    TAX_AMOUNT    : String(100);
}

define view po_summed as
    select from po.po_i {

        NODE_KEY,
        sum(GROSS_AMOUNT) as ga : Integer,
        sum(NET_AMOUNT)   as na : Integer,
        sum(TAX_AMOUNT)   as ta : Integer

    } group by 
    NODE_KEY;
