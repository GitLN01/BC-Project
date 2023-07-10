codeunit 50100 "Vozilo Mgt."
{

    #region Procedure koja ispisuje ime proizvođača i modela za određeno vozilo

    procedure DisplayVoziloName(Vozilo: Record Vozilo) NazivVozila: Text
    var
        Proizvodjac: Record Proizvodjac;
        Model: Record Model;
    begin
        NazivVozila := '';
        Proizvodjac.ProizvodjacID := Vozilo.ProizvodjacID;
        Model.ProizvodjacID := Vozilo.ProizvodjacID;
        Model.ModelID := Vozilo.ModelID;

        if Proizvodjac.Find('=') and Model.Find('=') then begin
            NazivVozila += Proizvodjac.Naziv + ' ';
            NazivVozila += Model.Naziv + '\';
        end;
    end;

    #endregion

}