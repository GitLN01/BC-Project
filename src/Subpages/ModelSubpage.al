page 50114 "Model Subpage"
{
    Caption = 'Model Subpage';
    PageType = ListPart;
    SourceTable = Model;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ModelID; Rec.ModelID)
                {
                    ApplicationArea = All;
                }
                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}