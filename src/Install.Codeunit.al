namespace FBA.AddRententionPolicyToYourApp;
using System.DataAdministration;

codeunit 50101 Install
{
    Subtype = Install;
    Access = Internal;

    trigger OnInstallAppPerCompany()
    var
        RetenPolAllowedTables: Codeunit "Reten. Pol. Allowed Tables";
    begin
        RetenPolAllowedTables.AddAllowedTable(Database::"Customer View Log");
    end;
}
