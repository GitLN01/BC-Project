report 50100 Automobili
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Lista Automobila Proizvođača';
    DefaultLayout = Word;
    WordLayout = './src/Reports/Layout/ListaAutomobilaProizvodjaca.docx';


    dataset
    {
        dataitem(Proizvodjac; Proizvodjac)
        {
            column(NazivProizvodjaca; Proizvodjac.Naziv)
            {

            }

            column(BrojAutomobila; BrojAutomobila)
            {

            }

            column(ProsecnaCena; ProsecnaCena)
            {

            }

            dataitem(Vozilo; Vozilo)
            {
                DataItemLinkReference = Proizvodjac;
                DataItemLink = ProizvodjacID = field(ProizvodjacID);

                column(GodinaProizvodnje; GodinaProizvodnje)
                {

                }

                column(PredjenoKM; PredjenoKM)
                {

                }

                column(Cena; Cena)
                {

                }

                dataitem(Model; Model)
                {
                    DataItemLinkReference = Vozilo;
                    DataItemLink = ModelID = field(ModelID);

                    column(NazivModela; Model.Naziv)
                    {

                    }
                }

                dataitem(Boja; Boja)
                {
                    DataItemLinkReference = Vozilo;
                    DataItemLink = BojaID = field(BojaID);

                    column(NazivBoje; Boja.Naziv)
                    {

                    }
                }

                dataitem(Gorivo; Gorivo)
                {
                    DataItemLinkReference = Vozilo;
                    DataItemLink = GorivoID = field(GorivoID);

                    column(NazivGoriva; Gorivo.GorivoID)
                    {

                    }
                }

            }

            trigger OnAfterGetRecord()
            begin
                CountAutomobiles();
            end;

        }

    }

    local procedure CountAutomobiles()
    var
        Vozilo: Record Vozilo;
    begin
        Vozilo.SetRange(ProizvodjacID, Proizvodjac.ProizvodjacID);
        BrojAutomobila := Vozilo.Count();
        if BrojAutomobila = 0 then begin
            ProsecnaCena := 0.0;
            exit;
        end;
        repeat
            ProsecnaCena := ProsecnaCena + Vozilo.Cena;
        until Vozilo.Next() = 0;
        ProsecnaCena := ProsecnaCena / BrojAutomobila;
    end;

    var
        BrojAutomobila: Integer;
        ProsecnaCena: Decimal;
}