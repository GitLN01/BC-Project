page 50107 "Proizvodjac List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = Proizvodjac;
    Caption = 'Proizvođač List';
    UsageCategory = Lists;
    CardPageId = "Proizvodjac Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ProizvodjacID; Rec.ProizvodjacID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja ProizvođačID';

                    trigger OnDrillDown()
                    var
                        Proizvodjac: Record Proizvodjac;
                    begin
                        Proizvodjac.Get(Rec.ProizvodjacID);
                        Page.RunModal(Page::"Proizvodjac Card", Proizvodjac);
                    end;
                }

                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja Naziv';
                }
            }
        }

        area(FactBoxes)
        {
            part(ModelInfoFB; "Model Factbox")
            {
                ApplicationArea = All;
                Caption = 'Model Factbox';
                SubPageLink = ProizvodjacID = field(ProizvodjacID);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Izlistaj sve proizvođače")
            {
                ApplicationArea = All;
                Caption = 'Izlistaj sve proizvođače';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    IzlistajProizvodjace();
                end;
            }
        }
    }

    local procedure IzlistajProizvodjace()
    var
        Proizvodjac: Record Proizvodjac;
        ListaProizvodjaca: Text;
    begin
        if Proizvodjac.IsEmpty() then
            exit;
        Proizvodjac.FindSet();
        repeat
            ListaProizvodjaca += Proizvodjac.Naziv + '\';
        until Proizvodjac.Next() = 0;
        Message(ListaProizvodjaca);
    end;

}