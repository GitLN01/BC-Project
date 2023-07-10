page 50101 "Model Card"
{
    SourceTable = Model;
    Caption = 'Model Card';
    PageType = Card;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ModelID; Rec.ModelID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja ModelID';
                    ShowMandatory = true;
                }

                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja Naziv';
                    ShowMandatory = true;
                }

                field(ProizvodjacID; Rec.ProizvodjacID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja ProizvodjacID';
                    ShowMandatory = true;
                }
            }
            Part(ListaVozila; "Vozilo Subpage")
            {
                ApplicationArea = All;
                SubPageLink = ModelID = field(ModelID);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Obriši sva vozila sa ovim modelom")
            {
                ApplicationArea = All;
                Caption = 'Obriši sva vozila sa ovim modelom';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ObrisiVozilaSaModelom();
                end;
            }

        }
    }

    local procedure ObrisiVozilaSaModelom()
    var
        Vozilo: Record Vozilo;
        Answer: Boolean;
    begin
        Vozilo.SetRange(ModelID, Rec.ModelID);
        Vozilo.SetRange(ProizvodjacID, Rec.ProizvodjacID);
        Answer := Dialog.Confirm('Da li ste sigurni da želite obrisati sva vozila sa ovim modelom?', true, false);
        if not Vozilo.IsEmpty() and Answer then
            Vozilo.DeleteAll();
    end;

}