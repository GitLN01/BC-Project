table 50103 Oprema
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; OpremaID; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'OpremaID';
            NotBlank = true;
        }

        field(2; Naziv; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Naziv';
            NotBlank = true;
        }

        field(3; Opis; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Opis';
        }
    }

    keys
    {
        key(PK; OpremaID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; OpremaID, Naziv)
        {
            Caption = 'Proizvođač';
        }
    }

    trigger OnInsert()
    begin
        if (Naziv = '') then
            Error('Polje Naziv mora biti popunjeno.');
    end;

    trigger OnDelete()
    var
        OpremaVozila: Record OpremaVozila;
    begin
        OpremaVozila.SetRange(OpremaID, Rec.OpremaID);
        if not OpremaVozila.IsEmpty then
            OpremaVozila.DeleteAll();
    end;

}