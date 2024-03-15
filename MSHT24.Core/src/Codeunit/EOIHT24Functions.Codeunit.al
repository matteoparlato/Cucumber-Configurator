codeunit 65004 "EOIHT24 Functions"
{
    procedure ExplainRule(Rule: Record "EOS028 CFG Rule"; var FinalSystemPrompt: Text; var FinalUserPrompt: Text)
    var
        JOPrompt: JsonObject;
        FinalLineArray: JsonArray;
        FinalJsonOutput: Text;
    begin
        JOPrompt.Add('rules', CreateRuleJSON(Rule));
        JOPrompt.WriteTo(FinalJsonOutput);

        FinalSystemPrompt := '';

        FinalUserPrompt := FinalJsonOutput;
    end;

    procedure CreateRuleJSON(Rule: Record "EOS028 CFG Rule"): Text
    var
        RuleCharacteristic: Record "EOS028 CFG Rule Characteristic";
        RuleCharacteristicValue: Record "EOS028 CFG Rule Charac. Value";
        JObjectRuleObject, JObjectCharacteristicObject, JObjectCharacteristicValueObject : JsonObject;
        JArrayCharacteristics, JArrayCharacteristicValues : JsonArray;
        JsonText: Text;
    begin
        Clear(JObjectRuleObject);
        JObjectRuleObject.Add('rule', Rule.Code);

        Clear(JArrayCharacteristics);
        RuleCharacteristic.Reset();
        RuleCharacteristic.SetRange("Rule Code", Rule.Code);
        if RuleCharacteristic.FindSet() then
            repeat
                Clear(JObjectCharacteristicObject);
                JObjectCharacteristicObject.Add('characteristicCode', RuleCharacteristic."Characteristic Code");
                JObjectCharacteristicObject.Add('characteristicDescription', RuleCharacteristic."Characteristic Description");
                JObjectCharacteristicObject.Add('characteristicMandatory', RuleCharacteristic.Mandatory);

                Clear(JArrayCharacteristicValues);
                RuleCharacteristicValue.Reset();
                RuleCharacteristicValue.SetRange("Rule Code", Rule.Code);
                RuleCharacteristicValue.SetRange("Characteristic Code", RuleCharacteristic."Characteristic Code");
                if RuleCharacteristicValue.FindSet() then
                    repeat
                        Clear(JObjectCharacteristicValueObject);
                        JObjectCharacteristicValueObject.Add('characteristicValueCode', RuleCharacteristicValue."Characteristic Value");
                        JObjectCharacteristicValueObject.Add('characteristicValueDescription', RuleCharacteristicValue."Charac. Value Description");
                        JArrayCharacteristicValues.Insert(1, JObjectCharacteristicValueObject);
                    until RuleCharacteristicValue.Next() = 0;

                JObjectCharacteristicObject.Add('characteristicValues', JArrayCharacteristicValues);
                JArrayCharacteristics.Insert(1, JObjectCharacteristicObject);
            until RuleCharacteristic.Next() = 0;

        JObjectRuleObject.Add('characteristics', JArrayCharacteristics);
        JObjectRuleObject.WriteTo(JsonText);
    end;
}