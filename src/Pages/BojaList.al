page 50112 "Boja List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = Boja;
    Caption = 'Boja List';
    UsageCategory = Lists;
    CardPageId = "Boja Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(BojaID; Rec.BojaID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja BojaID';

                    trigger OnDrillDown()
                    var
                        Boja: Record Boja;
                    begin
                        Boja.Get(Rec.BojaID);
                        Page.RunModal(Page::"Boja Card", Boja);
                    end;
                }

                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja Naziv';
                }

                field(Opis; Rec.Opis)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja Opis';
                }
            }

        }

        area(FactBoxes)
        {
            part(VoziloInfoFB; "Vozilo Factbox")
            {
                ApplicationArea = All;
                Caption = 'Vozilo Factbox';
                SubPageLink = BojaID = field(BojaID);
            }
        }
    }
}