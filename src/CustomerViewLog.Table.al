table 50100 "Customer View Log"
{
    Caption = 'Customer View Log';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = SystemMetadata;
        }
        field(3; "User Id"; Text[50])
        {
            Caption = 'User Id';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    internal procedure InsertCustomerViewLog(CustomerNo: Code[20])
    var
        EntryNo: Integer;
    begin
        EntryNo := GetNextEntryNo();
        Rec."Entry No." := EntryNo;
        Rec."Customer No." := CustomerNo;
        Rec."User Id" := CopyStr(UserId(), 1, MaxStrLen(Rec."User Id"));
        Rec.Insert(false);
    end;

    local procedure GetNextEntryNo(): Integer
    begin
        if not Rec.FindLast() then
            exit(1);

        exit(Rec."Entry No." + 1);
    end;
}
