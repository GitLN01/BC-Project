page 50109 "Model List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = Model;
    Caption = 'Model List';
    UsageCategory = Lists;
    CardPageId = "Model Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ModelID; Rec.ModelID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja ModelID';

                    trigger OnDrillDown()
                    var
                        Model: Record Model;
                    begin
                        Model.Get(Rec.ModelID, Rec.ProizvodjacID);
                        Page.RunModal(Page::"Model Card", Model);
                    end;
                }

                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja Naziv';
                }

                field(ProizvodjacID; Rec.ProizvodjacID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja ProizvodjacID';
                }

            }

        }
        area(FactBoxes)
        {
            part(VoziloInfoFB; "Vozilo Factbox")
            {
                ApplicationArea = All;
                Caption = 'Vozilo Factbox';
                SubPageLink = ModelID = field(ModelID);
            }
        }
    }

}