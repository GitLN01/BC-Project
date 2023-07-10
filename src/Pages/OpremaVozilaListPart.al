page 50119 OpremaVozilaListPart
{
    Caption = 'OpremaVozilaListPart';
    PageType = ListPart;
    SourceTable = OpremaVozila;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(OpremaID; Rec.OpremaID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja OpremaID';

                    trigger OnDrillDown()
                    var
                        OpremaVozila: Record OpremaVozila;
                    begin
                        OpremaVozila.Get(Rec.VoziloID, Rec.OpremaID);
                        Page.RunModal(Page::"Oprema Vozila Card", OpremaVozila);
                    end;
                }
                field(VoziloID; Rec.VoziloID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja VoziloID';

                    trigger OnDrillDown()
                    var
                        OpremaVozila: Record OpremaVozila;
                    begin
                        OpremaVozila.Get(Rec.VoziloID, Rec.OpremaID);
                        Page.RunModal(Page::"Oprema Vozila Card", OpremaVozila);
                    end;
                }
            }
        }
    }
}
