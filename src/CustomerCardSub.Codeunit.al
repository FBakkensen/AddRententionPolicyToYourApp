namespace FBA.AddRententionPolicyToYourApp;
using Microsoft.Sales.Customer;

codeunit 50100 "CustomerCardSub"
{
    Access = Internal;

    [EventSubscriber(ObjectType::Page, Page::"Customer Card", OnAfterGetCurrRecordEvent, '', false, false)]
    local procedure CustomerCard_OnAfterGetCurrentRecord(var Rec: Record Customer)
    var
        CustomerViewLog: Record "Customer View Log";
    begin
        CustomerViewLog.InsertCustomerViewLog(Rec."No.");
    end;
}
