page 50110 "Gorivo List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = Gorivo;
    Caption = 'Gorivo List';
    UsageCategory = Lists;
    CardPageId = "Gorivo Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(GorivoID; Rec.GorivoID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja GorivoID';

                    trigger OnDrillDown()
                    var
                        Gorivo: Record Gorivo;
                    begin
                        Gorivo.Get(Rec.GorivoID);
                        Page.RunModal(Page::"Gorivo Card", Gorivo);
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
        area(FactBoxes)
        {
            part(VoziloInfoFB; "Vozilo Factbox")
            {
                ApplicationArea = All;
                Caption = 'Vozilo Factbox';
                SubPageLink = GorivoID = field(GorivoID);
            }
        }
    }

}