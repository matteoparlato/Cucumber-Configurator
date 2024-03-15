codeunit 65002 "EOIHT24 Business Functions"
{
    trigger OnRun()
    begin
        case GlobalChannel of
            0:
                GetCopilotReturn(GlobalSystemPrompt, GlobalUserPrompt);
        end;
    end;

    local procedure GetCopilotReturn(SystemPrompt: Text; UserMessage: Text) ResponseAI: Text;
    var
        AzureOpenAI: Codeunit "Azure OpenAI";
        AOAIChatCompletionParams: Codeunit "AOAI Chat Completion Params";
        AOAIChatMessages: Codeunit "AOAI Chat Messages";
        AOAIOperationResponse: Codeunit "AOAI Operation Response";
        EOIHT24AIHelper: Codeunit "EOIHT24 AI Helper";
    begin
        EOIHT24AIHelper.SetAIAuthorization(AzureOpenAI);
        AzureOpenAI.SetCopilotCapability("Copilot Capability"::"EOIHT24 Test");
        AOAIChatCompletionParams.SetMaxTokens(2500);
        AOAIChatCompletionParams.SetTemperature(GlobalTemperature);
        AOAIChatMessages.AddSystemMessage(SystemPrompt);
        if UserMessage <> '' then
            AOAIChatMessages.AddUserMessage(UserMessage);
        AzureOpenAI.GenerateChatCompletion(AOAIChatMessages, AOAIChatCompletionParams, AOAIOperationResponse);

        IF AOAIOperationResponse.IsSuccess() then begin
            ResponseAI := AOAIChatMessages.GetLastMessage();
            GlobalResponseAI := ResponseAI;
        end else
            Error(AOAIOperationResponse.GetError());
    end;

    procedure SetParameters(SetChannel: Integer; SetUserPrompt: Text; SetSystemPrompt: Text; SetTemperature: Decimal)
    begin
        Clear(GlobalChannel);
        Clear(GlobalUserPrompt);
        Clear(GlobalSystemPrompt);
        Clear(GlobalTemperature);

        GlobalChannel := SetChannel;
        GlobalUserPrompt := SetUserPrompt;
        GlobalSystemPrompt := SetSystemPrompt;
        GlobalTemperature := SetTemperature;
    end;

    procedure GetAIResponse(var RetResponse: Text)
    begin
        RetResponse := GlobalResponseAI;
    end;

    var
        GlobalUserPrompt: Text;
        GlobalChannel: Integer;
        GlobalSystemPrompt: Text;
        GlobalResponseAI: Text;
        GlobalTemperature: Decimal;
}