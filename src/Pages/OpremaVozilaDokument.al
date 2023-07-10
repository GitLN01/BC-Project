page 50118 "Oprema Vozila Dokument"
{
    Caption = 'Oprema Vozila Dokument';
    PageType = Document;
    SourceTable = Vozilo;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(VoziloID; Rec.VoziloID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja VoziloID';
                }
                field(ProizvodjacID; Rec.ProizvodjacID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja ProizvodjacID';
                }
                field(ModelID; Rec.ModelID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja ModelID';
                }
                field(GodinaProizvodnje; Rec.GodinaProizvodnje)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja GodinaProizvodnje';
                }
                field(Cena; Rec.Cena)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja Cena';
                }
                field(PredjenoKM; Rec.PredjenoKM)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja PredjenoKM';
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
            }
            group("Oprema za dato vozilo")
            {
                part(OpremaVozilaListPart; OpremaVozilaListPart)
                {
                    ApplicationArea = All;
                    SubPageLink = VoziloID = field(VoziloID);
                }
            }
        }
    }
}
