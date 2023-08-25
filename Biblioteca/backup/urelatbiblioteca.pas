unit uRelatUsuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport, RLPDFFilter,
  RLXLSXFilter, RLHTMLFilter;

type

  { TFormRelatUsu }

  TFormRelatUsu = class(TForm)
    RLBand6: TRLBand;
    RLDBText5: TRLDBText;
    RLHTMLFilter1: TRLHTMLFilter;
    RLPDFFilter1: TRLPDFFilter;
    RLSenha: TRLLabel;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand7: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLEmail: TRLLabel;
    RLGroup1: TRLGroup;
    RLId: TRLLabel;
    RLNome: TRLLabel;
    RLTitleUsu: TRLLabel;
    RLReportUsu: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLXLSXFilter1: TRLXLSXFilter;
  private

  public

  end;

var
  FormRelatUsu: TFormRelatUsu;

implementation

uses
  uLobby;

{$R *.lfm}

end.

