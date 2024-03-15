codeunit 65003 "EOIHT24 Capability Installer"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        RegisterCapability();
    end;

    local procedure RegisterCapability()
    var
        CopilotCapability: Codeunit "Copilot Capability";
    begin
        // * Put your capability in the Copilot Capability Enum quotations to register it.

        if not CopilotCapability.IsCapabilityRegistered("Copilot Capability"::"EOIHT24 Test") then
            CopilotCapability.RegisterCapability(
                "Copilot Capability"::"EOIHT24 Test",
                "Copilot Availability"::"Generally Available",
                '');
    end;
}