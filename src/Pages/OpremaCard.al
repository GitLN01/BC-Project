page 50103 "Oprema Card"
{
    PageType = Card;
    Caption = 'Oprema Card';
    SourceTable = Oprema;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(OpremaID; Rec.OpremaID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja OpremaID';
                    ShowMandatory = true;
                }

                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                    ToolTip = 'Odnosi se na vrednost polja Naziv';
                    ShowMandatory = true;
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}