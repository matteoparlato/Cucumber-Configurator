codeunit 65000 "EOIHT24 AI Helper"
{
    procedure SetAIAuthorization(var AzureOpenAI: Codeunit "Azure OpenAI")
    var
        EOIHT24AISetup: Codeunit "EOIHT24 AI Setup";
    begin
        AzureOpenAI.SetAuthorization(
                    "AOAI Model Type"::"Chat Completions",
                    EOIHT24AISetup.GetEndpoint(), EOIHT24AISetup.GetAiModel(), EOIHT24AISetup.GetApiKey());
    end;

    procedure GetJsonPrompt(): Text
    var
        JsonPromptTxt: Label 'Provide your response in a JSON format.';
    begin
        exit(JsonPromptTxt);
    end;
}