page 50102 "Gorivo Card"
{
    PageType = Card;
    Caption = 'Gorivo Card';
    SourceTable = Gorivo;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(GorivoID; Rec.GorivoID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja GorivoID';
                    ShowMandatory = true;
                }

                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja Naziv';
                    ShowMandatory = true;
                }

                field(Opis; Rec.Opis)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja Opis';
                }

            }

            part(ListaVozila; "Vozilo Subpage")
            {
                ApplicationArea = All;
                SubPageLink = GorivoID = field(GorivoID);
            }

        }

    }

}