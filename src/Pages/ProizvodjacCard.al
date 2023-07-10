page 50100 "Proizvodjac Card"
{
    PageType = Card;
    Caption = 'Proizvođač Card';
    SourceTable = Proizvodjac;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ProizvodjacID; Rec.ProizvodjacID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja ProizvođačID';
                    ShowMandatory = true;
                }

                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja Naziv';
                    ShowMandatory = true;
                }
            }
            Part(ListaModela; "Model Subpage")
            {
                ApplicationArea = All;
                SubPageLink = ProizvodjacID = field(ProizvodjacID);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Obriši sva vozila ovog proizvođača")
            {
                ApplicationArea = All;
                Caption = 'Obriši sva vozila ovog proizvođača';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ObrisiVozilaSaProizvodjacem();
                end;
            }
        }
    }

    local procedure ObrisiVozilaSaProizvodjacem()
    var
        Vozilo: Record Vozilo;
        Answer: Boolean;
    begin
        Vozilo.SetRange(ProizvodjacID, Rec.ProizvodjacID);
        Answer := Dialog.Confirm('Da li ste sigurni da želite obrisati sva vozila sa ovim proizvođačem?', true, false);
        if not Vozilo.IsEmpty() and Answer then
            Vozilo.DeleteAll();
    end;

}