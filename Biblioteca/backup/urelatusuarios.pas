unit uRelatUsuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport, RLPDFFilter,
  RLXLSXFilter, RLHTMLFilter;

type

  { TFormRelatU }

  TFormRelatU = class(TForm)
    RLHTMLFilter1: TRLHTMLFilter;
    RLPDFFilter1: TRLPDFFilter;
    RLSenha: TRLLabel;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLEmail: TRLLabel;
    RLGroup1: TRLGroup;
    RLId: TRLLabel;
    RLNome: TRLLabel;
    RLTitle: TRLLabel;
    RLReportU: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLXLSXFilter1: TRLXLSXFilter;
  private

  public

  end;

var
  FormRelatU: TFormRelatU;

implementation

{$R *.lfm}

end.

