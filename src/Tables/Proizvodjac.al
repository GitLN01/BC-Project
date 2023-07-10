table 50100 Proizvodjac
{
    DataClassification = CustomerContent;
    Caption = 'Proizvođač';

    fields
    {
        field(1; ProizvodjacID; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'ProizvodjacID';
            NotBlank = true;
        }

        field(2; Naziv; Text[20])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
            Caption = 'Naziv';
        }
    }

    keys
    {
        key(PK; ProizvodjacID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; ProizvodjacID, Naziv)
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
        Model: Record Model;
        Vozilo: Record Vozilo;
    begin
        Model.SetRange(ProizvodjacID, Rec.ProizvodjacID);
        if not Model.IsEmpty() then
            Model.DeleteAll();

        Vozilo.SetRange(ProizvodjacID, Rec.ProizvodjacID);
        if not Vozilo.IsEmpty() then
            Vozilo.DeleteAll();
    end;
}