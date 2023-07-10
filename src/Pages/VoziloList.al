page 50111 "Vozilo List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = Vozilo;
    Caption = 'Vozilo List';
    UsageCategory = Lists;
    CardPageId = "Vozilo Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(VoziloID; Rec.VoziloID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja VoziloID';

                    trigger OnDrillDown()
                    var
                        Vozilo: Record Vozilo;
                    begin
                        Vozilo.Get(Rec.VoziloID);
                        Page.RunModal(Page::"Vozilo Card", Vozilo);
                    end;
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

    actions
    {
        area(Processing)
        {
            action("Izlistaj sva vozila")
            {
                trigger OnAction()
                var
                    Vozilo: Record Vozilo;
                    VoziloMgt: Codeunit "Vozilo Mgt.";
                    ListaVozila: Text;
                begin
                    if not Vozilo.IsEmpty() then begin
                        repeat
                            ListaVozila += VoziloMgt.DisplayVoziloName(Vozilo);
                        until Vozilo.Next() = 0;
                    end;
                    Message(ListaVozila);
                end;
            }

            action("Pronadji najskuplje vozilo")
            {
                trigger OnAction()
                begin
                    GetVoziloWithHighestCena();
                end;
            }

            action("Pronadji najeftinije vozilo")
            {
                trigger OnAction()
                begin
                    GetVoziloWithLowestCena();
                end;
            }

            action("Pronadji prosečnu cenu vozila")
            {
                trigger OnAction()
                begin
                    ProsecnaCenaVozila();
                end;
            }
        }


    }

    local procedure GetVoziloWithLowestCena()
    var
        Vozilo: Record Vozilo;
        NazivVozila: Text;
        VoziloMgt: Codeunit "Vozilo Mgt.";
    begin
        Vozilo.SetCurrentKey(Cena);
        Vozilo.Ascending(true);
        if Vozilo.IsEmpty() then
            exit;
        Vozilo.FindFirst();
        NazivVozila := VoziloMgt.DisplayVoziloName(Vozilo);
        NazivVozila += 'Cena: ' + Format(Vozilo.Cena);
        Message(NazivVozila);
    end;

    local procedure GetVoziloWithHighestCena()
    var
        Vozilo: Record Vozilo;
        NazivVozila: Text;
        VoziloMgt: Codeunit "Vozilo Mgt.";
    begin
        Vozilo.SetCurrentKey(Cena);
        Vozilo.Ascending(false);
        if Vozilo.IsEmpty() then
            exit;
        Vozilo.FindFirst();
        NazivVozila := VoziloMgt.DisplayVoziloName(Vozilo);
        NazivVozila += 'Cena: ' + Format(Vozilo.Cena);
        Message(NazivVozila);
    end;

    local procedure ProsecnaCenaVozila()
    var
        Vozilo: Record Vozilo;
        ProsecnaCena: Decimal;
        BrojacVozila: Integer;
    begin
        BrojacVozila := 0;
        ProsecnaCena := 0.0;
        Vozilo.FindSet();
        repeat
            ProsecnaCena += Vozilo.Cena;
            BrojacVozila += 1;
        until Vozilo.Next() = 0;
        ProsecnaCena := ProsecnaCena / BrojacVozila;
        Message('Prosečna cena vozila iznosi: ' + Format(ProsecnaCena));
    end;

}