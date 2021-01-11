table 50101 "CSD Seminar"
{
    DataClassification = AccountData;
    Caption = 'Seminar';
    LookupPageId = "CSD Seminar List";
    DrillDownPageId = "CSD Seminar List";

    fields
    {
        field(10; "No."; code[20])
        {
            DataClassification = AccountData;
            Caption = 'No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.Get();
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos");
                    "No Series" := '';
                end;
            end;
        }
        field(20; "Name"; Text[50])
        {
            DataClassification = AccountData;
            Caption = 'Name';
            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) then begin
                    "Search Name" := Name;
                end;
            end;
        }
        field(30; "Seminar Duration"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
        }
        field(40; "Minimum Participants"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'Minimum Participants';
        }
        field(50; "Maximum Participants"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'Maximum Participants';
        }
        field(60; "Search Name"; code[50])
        {
            DataClassification = AccountData;
            Caption = 'Search Name';
        }
        field(70; "Blocked"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Blocked';
        }
        field(80; "Last Date Modified"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(90; "Comment"; Boolean)
        {

            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            //CalcFormula=exist(semin)

        }
        field(100; "Seminar Price"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(110; "Gen. Prod. Posting Group"; code[10])
        {
            DataClassification = AccountData;
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate()
            begin
                if GenProdPostGroup.ValidateVatProdPostingGroup(GenProdPostGroup, "Gen. Prod. Posting Group") then
                    "VAT Prod Posting Group" := GenProdPostGroup."Def. VAT Prod. Posting Group";
            end;
        }
        field(120; "VAT Prod Posting Group"; code[10])
        {
            DataClassification = AccountData;
            Caption = 'VAT Prod Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(130; "No Series"; code[10])
        {
            DataClassification = AccountData;
            Caption = 'No Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(SearchName; "Search Name")
        {
            //Clustered=true;
        }
    }
    var
        SeminarSetup: Record "CSD Seminar Setup";
        Seminar: Record "CSD Seminar";
        GenProdPostGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            SeminarSetup.Get();
            SeminarSetup.TestField("Seminar Nos");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos", xRec."No Series", 0D, "No.", "No Series");
        end;

    end;

    trigger OnModify()
    begin
        Rec."Last Date Modified" := Today;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin
        Rec."Last Date Modified" := Today;
    end;

    procedure AssistEdit(): Boolean
    var
    begin
        SeminarSetup.Get();
        SeminarSetup.TestField("Seminar Nos");
        if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos", xRec."No Series", "No Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;
}