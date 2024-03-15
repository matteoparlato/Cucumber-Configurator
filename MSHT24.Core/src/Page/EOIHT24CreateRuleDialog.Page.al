page 65002 "EOIHT24 Create Rule Dialog"
{
    ApplicationArea = All;
    Caption = 'Ask Copilot';
    DataCaptionExpression = '';
    DeleteAllowed = false;
    InsertAllowed = false;
    InstructionalText = 'Copilot';
    ModifyAllowed = false;
    PageType = PromptDialog;
    Extensible = false;

    layout
    {
        area(Prompt)
        {
            field(PromptTxt; PromptTxt)
            {
                ApplicationArea = All;
                ShowCaption = false;
                MultiLine = true;
            }
        }
        area(Content)
        {
            field(CopilotResponse; ResponseTxt)
            {
                ApplicationArea = All;
                ShowCaption = false;
                MultiLine = true;
            }
        }
    }
    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                Caption = 'Generate';

                trigger OnAction()
                begin
                    RunGeneration();
                end;
            }
            systemaction(Ok)
            {
                Caption = 'Confirm';
            }
            systemaction(Regenerate)
            {
                Caption = 'Regenerate';
            }
            systemaction(Cancel)
            {
                Caption = 'Cancel';
            }
        }
    }
    procedure InitOpenPage(SetSource: Variant)
    begin
        PromptTxt := 'Please, select an Option';
    end;

    local procedure RunGeneration()
    var
        TempCustomer: Record Customer temporary;
        BusinessFunctions: Codeunit "EOIHT24 Business Functions";
        EOIHT24Functions: Codeunit "EOIHT24 Functions";
        FinalSystemPrompt: Text;
        FinalUserPrompt: Text;
    begin
        EOIHT24Functions.ExplainRule(Rule, FinalSystemPrompt, FinalUserPrompt);
        BusinessFunctions.SetParameters(0, FinalUserPrompt, FinalSystemPrompt, 0.5);
        BusinessFunctions.Run();
        BusinessFunctions.GetAIResponse(ResponseTxt);
    end;

    procedure SetSource(Source: Record "EOS028 CFG Rule")
    begin
        Rule := Source;
    end;

    var
        Rule: Record "EOS028 CFG Rule";
        PromptTxt: Text;
        ResponseTxt: Text;
}