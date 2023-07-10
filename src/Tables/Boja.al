table 50101 Boja
{
    DataClassification = CustomerContent;
    Caption = 'Boja';

    fields
    {
        field(1; BojaID; Code[15])
        {
            DataClassification = CustomerContent;
            Caption = 'BojaID';
            NotBlank = true;
        }

        field(2; Naziv; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Naziv';
        }

        field(3; Opis; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Opis';
        }

        field(4; "Broj automobila sa ovom bojom"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count(Vozilo WHERE(BojaID = field(BojaID)));

            Caption = 'Broj automobila sa ovom bojom';
        }
    }

    keys
    {
        key(PK; BojaID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; BojaID, Naziv)
        {
            Caption = 'Boja';
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
        Vozilo.SetRange(BojaID, Rec.BojaID);
        if not Vozilo.IsEmpty then begin
            Vozilo.ModifyAll(BojaID, '');
        end;
    end;
}