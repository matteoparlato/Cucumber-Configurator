page 65000 "EOIHT24 AI Entry List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "EOIHT24 AI Entries";
    Editable = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(AIEntries_)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Source ID"; Rec."Source ID") { ApplicationArea = All; }
                field("Date Time Stamp"; Rec."Date Time Stamp") { ApplicationArea = All; }
            }
        }
    }
}