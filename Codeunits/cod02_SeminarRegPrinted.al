codeunit 50102 "CSD SeminarRegPrinted"
{
    TableNo = "CSD Seminar Reg. Header";

    trigger OnRun()
    begin
        Rec.Find();
        Rec."No. Printed" += 1;
        rec.Modify();
        Commit();
    end;

    var
        myInt: Integer;
}