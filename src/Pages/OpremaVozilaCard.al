page 50106 "Oprema Vozila Card"
{
    PageType = Card;
    SourceTable = OpremaVozila;
    Caption = 'Oprema Vozila Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(VoziloID; Rec.VoziloID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja VoziloID';
                    ShowMandatory = true;
                }

                field(OpremaID; Rec.OpremaID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja OpremaID';
                    ShowMandatory = true;
                }
            }
        }
    }

}