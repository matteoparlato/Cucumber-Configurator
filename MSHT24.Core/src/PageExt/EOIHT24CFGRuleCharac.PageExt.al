pageextension 65001 "EOIHT24 Rule Charac. Ext." extends "EOS028 CFG Rule Charac."
{
    actions
    {
        addlast(Processing)
        {
            action("Create with Copilot")
            {
                ApplicationArea = All;
                Image = Sparkle;
                Caption = 'Open Copilot';

                trigger OnAction()
                var
                    EOIHT24PromptDialog: Page "EOIHT24 Explain Rule Dialog";
                begin
                    Clear(EOIHT24PromptDialog);
                    EOIHT24PromptDialog.InitOpenPage(Rec);
                    EOIHT24PromptDialog.Run();
                end;
            }
        }
    }
}