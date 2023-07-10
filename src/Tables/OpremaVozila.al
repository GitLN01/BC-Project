table 50106 OpremaVozila
{
    DataClassification = CustomerContent;
    Caption = 'Oprema Vozila';

    fields
    {
        field(1; VoziloID; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Vozilo.VoziloID;
            Caption = 'VoziloID';
            NotBlank = true;
        }

        field(2; OpremaID; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Oprema.OpremaID;
            Caption = 'OpremaID';
            NotBlank = true;
        }
    }

    keys
    {
        key(PK; VoziloID, OpremaID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; OpremaID, VoziloID)
        {
            Caption = 'Proizvođač';
        }
    }

}