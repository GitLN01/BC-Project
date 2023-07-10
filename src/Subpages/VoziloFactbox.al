page 50117 "Vozilo Factbox"
{
    Caption = 'Vozilo Factbox';
    PageType = ListPart;
    SourceTable = Vozilo;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(VoziloID; Rec.VoziloID)
                {
                    ApplicationArea = All;
                }

                field(ProizvodjacID; Rec.ProizvodjacID)
                {
                    ApplicationArea = All;
                }

                field(ModelID; Rec.ModelID)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}