pageextension 50101 "CSD ResourceListExt" extends "Resource List"
{
    layout
    {
        addafter(Type)
        {
            field("CSD Resource Type"; Rec."CSD Resource Type")
            {
                ApplicationArea = all;
            }
            field("CSD Maximum Participants"; Rec."CSD Maximum Participants")
            {
                ApplicationArea = all;
                Visible = ShowMaxField;
            }
        }
        modify(Type)
        {
            Visible = ShowType;
        }
    }

    trigger OnOpenPage()
    begin
        ShowType := (Rec.GetFilter(Type) = '');
        ShowMaxField := (Rec.GetFilter(Type) = format(Rec.Type::Machine));
    end;

    var
        [InDataSet]
        ShowType: Boolean;
        [InDataSet]
        ShowMaxField: Boolean;
}