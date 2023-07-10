page 50104 "Boja Card"
{
    PageType = Card;
    SourceTable = Boja;
    Caption = 'Boja Card';
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(BojaID; Rec.BojaID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja BojaID';
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

                field("Broj automobila sa ovom bojom"; Rec."Broj automobila sa ovom bojom")
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na broj automobila koji sadrže ovu boju u polju BojaID';
                }
            }

            part(ListaVozila; "Vozilo Subpage")
            {
                ApplicationArea = All;
                SubPageLink = BojaID = field(BojaID);
            }
        }
    }

}