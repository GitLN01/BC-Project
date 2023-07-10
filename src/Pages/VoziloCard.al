page 50105 "Vozilo Card"
{
    PageType = Card;
    SourceTable = Vozilo;
    Caption = 'Vozilo Card';
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(VoziloID; Rec.VoziloID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja VoziloID';
                    ShowMandatory = true;
                }

                field(ProizvodjacID; Rec.ProizvodjacID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja ProizvodjacID';
                    ShowMandatory = true;
                }

                field(ModelID; Rec.ModelID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja ModelID';
                    ShowMandatory = true;
                }

                field(GodinaProizvodnje; Rec.GodinaProizvodnje)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja GodinaProizvodnje';
                }

                field(BojaID; Rec.BojaID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja BojaID';
                }

                field(GorivoID; Rec.GorivoID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja GorivoID';
                }

                field(PredjenoKM; Rec.PredjenoKM)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja PredjenoKM';
                }

                field(Cena; Rec.Cena)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja Cena';
                }
            }
        }
    }

}