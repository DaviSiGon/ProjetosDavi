unit uRelatLivros;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, RLReport,
  RLPDFFilter, RLXLSXFilter, RLHTMLFilter;

type

  { TFormRelatLi }

  TFormRelatLi = class(TForm)
    LBEndDate: TRLLabel;
    LBStartDate: TRLLabel;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
    RLEmail: TRLLabel;
    RLGroup1: TRLGroup;
    RLHTMLFilter1: TRLHTMLFilter;
    RLId: TRLLabel;
    RLNome: TRLLabel;
    RLNome1: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLReportLi: TRLReport;
    RLSenha: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLTitleLi: TRLLabel;
    RLXLSXFilter1: TRLXLSXFilter;
  private

  public

  end;

var
  FormRelatLi: TFormRelatLi;

implementation

{$R *.lfm}

end.

