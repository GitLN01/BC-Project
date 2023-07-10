table 50104 Model
{
    DataClassification = CustomerContent;
    Caption = 'Model';

    fields
    {
        field(1; ModelID; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'ModelID';
            NotBlank = true;
        }

        field(2; ProizvodjacID; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'ProizvodjacID';
            TableRelation = Proizvodjac.ProizvodjacID;
            NotBlank = true;
        }

        field(3; Naziv; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Naziv';
            NotBlank = true;
        }


    }

    keys
    {
        key(PK; ModelID, ProizvodjacID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; ModelID, Naziv)
        {
            Caption = 'Model';
        }
    }

    trigger OnInsert()
    begin
        if (Naziv = '') then
            Error('Polje Naziv mora biti popunjeno.');
        if (ProizvodjacID = '') then
            Error('Polje ProizvodjacID mora biti popunjeno.');
    end;

    trigger OnDelete()
    var
        Vozilo: Record Vozilo;
    begin
        Vozilo.SetRange(ModelID, Rec.ModelID);
        Vozilo.SetRange(ProizvodjacID, Rec.ProizvodjacID);
        if not Vozilo.IsEmpty() then
            Vozilo.DeleteAll();
    end;

}