page 50116 "Vozilo Subpage"
{
    Caption = 'Vozilo Subpage';
    PageType = ListPart;
    SourceTable = Vozilo;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(VoziloID; Rec.VoziloID)
                {
                    ApplicationArea = All;
                }

                field(ProizvodjacID; Rec.ProizvodjacID)
                {
                    ApplicationArea = All;
                }

                field(ModelID; Rec.ModelID)
                {
                    ApplicationArea = All;
                }

                field(GodinaProizvodnje; Rec.GodinaProizvodnje)
                {
                    ApplicationArea = All;
                }

                field(PredjenoKM; Rec.PredjenoKM)
                {
                    ApplicationArea = All;
                }

                field(Cena; Rec.Cena)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}