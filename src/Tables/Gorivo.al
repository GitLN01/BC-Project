table 50102 Gorivo
{
    DataClassification = CustomerContent;
    Caption = 'Gorivo';

    fields
    {
        field(1; GorivoID; Code[15])
        {
            DataClassification = CustomerContent;
            Caption = 'GorivoID';
            NotBlank = true;
        }

        field(2; Naziv; Text[20])
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

        field(4; "Br. automobila sa ovim gorivom"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count(Vozilo WHERE(GorivoID = field(GorivoID)));

            Caption = 'Broj automobila koji koriste ovo gorivo';
        }
    }

    keys
    {
        key(PK; GorivoID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; GorivoID, Naziv)
        {
            Caption = 'Gorivo';
        }
    }

    trigger OnInsert()
    begin
        if (Naziv = '') then
            Error('Polje Naziv mora biti popunjeno.');
    end;

    trigger OnDelete()
    var
        Vozilo: Record Vozilo;
    begin
        Vozilo.SetRange(GorivoID, Rec.GorivoID);
        if not Vozilo.IsEmpty then
            Vozilo.ModifyAll(GorivoID, '');
    end;

}