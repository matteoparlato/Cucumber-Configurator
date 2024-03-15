pageextension 65002 "EOIHT24 CFG Rules Ext." extends "EOS028 CFG Rules"
{
    actions
    {
        addlast(Processing)
        {
            action("Explain with Copilot")
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
            action("Create with Copilot")
            {
                ApplicationArea = All;
                Image = Sparkle;
                Caption = 'Open Copilot';

                trigger OnAction()
                var
                    EOIHT24PromptDialog: Page "EOIHT24 Create Rule Dialog";
                begin
                    Clear(EOIHT24PromptDialog);
                    EOIHT24PromptDialog.InitOpenPage(Rec);
                    EOIHT24PromptDialog.Run();
                end;
            }
        }
    }
}