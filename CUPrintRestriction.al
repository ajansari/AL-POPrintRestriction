codeunit 50090 PrintRestriction
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnBeforeActionEvent', '&Print', true, true)]

    local procedure POPrintRestriction(var Rec: Record "Purchase Header")
    begin
        if Rec.Status <> Rec.Status::Released then
            Error(ErrMsg001);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnBeforeActionEvent', 'SendCustom', true, true)]
    local procedure POSendRestriction(var Rec: Record "Purchase Header")
    begin
        if Rec.Status <> Rec.Status::Released then
            Error(ErrMsg001);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order List", 'OnBeforeActionEvent', 'Print', true, true)]
    local procedure POListPrintRestriction(var Rec: Record "Purchase Header")
    begin
        if Rec.Status <> Rec.Status::Released then
            Error(ErrMsg001);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order List", 'OnBeforeActionEvent', 'Send', true, true)]
    local procedure POListSendRestriction(var Rec: Record "Purchase Header")
    begin
        if Rec.Status <> Rec.Status::Released then
            Error(ErrMsg001);
    end;

    var
        ErrMsg001: TextConst ENU = 'Purchase Order must be in Released Status before it can be printed, exported, or e-mailed.';

}
