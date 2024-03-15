table 65000 "EOIHT24 AI Entries"
{
    DataClassification = CustomerContent;
    Caption = 'AI Entries (EOIHT24)';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.';
        }
        field(10; "Source ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Source ID';
        }
        field(11; "Date Time Stamp"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'DateTime Stamp';
        }
    }

    keys
    {
        key(PK_; "Entry No.") { Clustered = true; }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
}