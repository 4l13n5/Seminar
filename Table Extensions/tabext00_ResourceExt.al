tableextension 50100 "CSD Resource Ext" extends Resource
{
    fields
    {
        // Add changes to table fields here
        field(50101; "CSD Resource Type"; Option)
        {
            DataClassification = AccountData;
            OptionMembers = Internal,External;
            Caption = 'Resource Type';
            OptionCaption = 'Internal,External';
        }
        field(50102; "CSD Maximum Participants"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'Maximum Participants';
        }
        field(50103; "CSD Quantity Per Day"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantity Per Day';
        }
        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                Rec.TestField("Unit Cost");
            end;
        }
    }
}