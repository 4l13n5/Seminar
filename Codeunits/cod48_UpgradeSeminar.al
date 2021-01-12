codeunit 50148 "CSD Upgrade Seminar"
{
    Subtype = Upgrade;

    trigger OnCheckPreconditionsPerCompany()
    var
        ModuleInfo: ModuleInfo;
        AppId: Guid;
    begin
        AppId := 'f268684e-7b8a-477d-9870-10acd4babb5d';
        NavApp.GetModuleInfo(AppId, ModuleInfo);

        case Format(ModuleInfo.AppVersion) of
            '17.1':
                begin

                end;
            '17.2':
                begin

                end;
        end;
    end;

    trigger OnUpgradePerCompany()
    begin

    end;

    trigger OnValidateUpgradePerCompany()
    begin

    end;

    var
        myInt: Integer;
}