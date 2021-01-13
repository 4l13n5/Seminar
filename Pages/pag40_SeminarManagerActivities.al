page 50140 "CSD Seminar Manager Activities"
{
    Caption = 'Seminar Manager Activities';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Cue";
    Editable = false;

    layout
    {
        area(Content)
        {
            cuegroup(Registrations)
            {
                field(Planned; Rec.Planned)
                {
                    Caption = 'Planned';
                    ApplicationArea = All;

                }
                field(Registered; Rec.Registered)
                {
                    Caption = 'Registered';
                    ApplicationArea = All;

                }
                actions
                {
                    action(New)
                    {
                        Caption = 'New';
                        RunObject = page "CSD Seminar Registration";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("For Posting")
            {
                field(Closed; rec.Closed)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
    trigger onOpenPage()
    begin
        if not rec.Get() then begin
            Rec.Init();
            rec.Insert();
        end;
    end;
}