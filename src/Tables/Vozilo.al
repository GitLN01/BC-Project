table 50105 Vozilo
{

    DataClassification = CustomerContent;
    Caption = 'Vozilo';

    fields
    {
        field(1; VoziloID; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'VoziloID';
            NotBlank = true;
        }

        field(2; ProizvodjacID; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'ProizvodjacID';
            TableRelation = Proizvodjac.ProizvodjacID;
            NotBlank = true;
        }

        field(3; ModelID; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'ModelID';
            TableRelation = Model.ModelID where(ProizvodjacID = field(ProizvodjacID));
            NotBlank = true;
        }

        field(4; GodinaProizvodnje; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Godina Proizvodnje';
        }

        field(5; BojaID; Code[15])
        {
            DataClassification = CustomerContent;
            Caption = 'BojaID';
            TableRelation = Boja;
        }

        field(6; GorivoID; Code[15])
        {
            DataClassification = CustomerContent;
            Caption = 'GorivoID';
            TableRelation = Gorivo;
        }

        field(7; PredjenoKM; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'PredjenoKM';
            InitValue = 0.0;
        }

        field(8; Cena; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Cena';
            InitValue = 0.0;
        }
    }

    keys
    {
        key(PK; VoziloID)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if (ProizvodjacID = '') then
            Error('Polje ProizvodjacID mora biti popunjeno.');
        if (ModelID = '') then
            Error('Polje ModelID mora biti popunjeno.');
    end;

    trigger OnDelete()
    var
        OpremaVozila: Record OpremaVozila;
    begin
        OpremaVozila.SetRange(VoziloID, Rec.VoziloID);
        if not OpremaVozila.IsEmpty then
            OpremaVozila.DeleteAll();
    end;

}