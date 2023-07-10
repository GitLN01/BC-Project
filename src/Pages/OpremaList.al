page 50108 "Oprema List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = Oprema;
    Caption = 'Oprema List';
    UsageCategory = Lists;
    CardPageId = "Oprema Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(OpremaID; Rec.OpremaID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja OpremaID';

                    trigger OnDrillDown()
                    var
                        Oprema: Record Oprema;
                    begin
                        Oprema.Get(Rec.OpremaID);
                        Page.RunModal(Page::"Oprema Card", Oprema);
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
    }

    actions
    {
        area(Processing)
        {
            action("Izlistaj svu opremu")
            {
                ApplicationArea = All;
                Caption = 'Izlistaj svu opremu';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    IzlistajSvuOpremu();
                end;
            }
        }
    }

    local procedure IzlistajSvuOpremu()
    var
        Oprema: Record Oprema;
        ListaOpreme: Text;
    begin
        if Oprema.IsEmpty() then
            exit;
        Oprema.FindSet();
        repeat
            ListaOpreme += Oprema.Naziv + '\';
        until Oprema.Next() = 0;
        Message(ListaOpreme);
    end;

}