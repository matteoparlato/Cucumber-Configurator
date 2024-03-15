codeunit 65001 "EOIHT24 AI Setup"
{
    var
        EndpointTxt: Label 'https://hackathon2024umbertosoffia.openai.azure.com/';
        AiModelTxt: Label 'hackathon2024umbertosoffia';
        ApiKeyTxt: Label '441440f8bdda4ab5b148cdddb5ca1e80';

    procedure GetEndpoint(): Text
    begin
        exit(EndpointTxt);
    end;

    procedure GetAiModel(): Text
    begin
        exit(AiModelTxt);
    end;

    procedure GetApiKey(): Text
    begin
        exit(ApiKeyTxt);
    end;
}