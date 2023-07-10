page 50115 "Model Factbox"
{
    Caption = 'Model Factbox';
    PageType = ListPart;
    SourceTable = Model;

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