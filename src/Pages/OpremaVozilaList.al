page 50113 "Oprema Vozila List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = OpremaVozila;
    Caption = 'Oprema Vozila List';
    UsageCategory = Lists;
    CardPageId = "Oprema Vozila Card";

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
                        OpremaVozila: Record OpremaVozila;
                    begin
                        OpremaVozila.Get(Rec.VoziloID, Rec.OpremaID);
                        Page.RunModal(Page::"Oprema Vozila Card", OpremaVozila);
                    end;
                }

                field(OpremaID; Rec.OpremaID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja OpremaID';
                }
            }
        }
    }

}