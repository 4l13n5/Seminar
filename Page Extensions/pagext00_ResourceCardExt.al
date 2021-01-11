pageextension 50100 "CSD Resource Card" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; Rec."CSD Resource Type")
            {
                ApplicationArea = all;
            }
            field("CSD Quantity Per Day"; Rec."CSD Quantity Per Day")
            {
                ApplicationArea = all;
            }
        }
        addlast(content)
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowRoomGroup;
                field("CSD Maximum Participants"; Rec."CSD Maximum Participants")
                {
                    ApplicationArea = all;
                }

            }
        }
    }
    var
        [InDataSet]
        ShowRoomGroup: Boolean;

    trigger OnAfterGetRecord()
    begin
        ShowRoomGroup := (Rec.Type = Rec.Type::Machine);
    end;

}