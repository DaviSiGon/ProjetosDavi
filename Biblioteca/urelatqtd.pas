unit uRelatQtd;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ZDataset,
  ZConnection, RLReport, RLPDFFilter, RLXLSXFilter, RLHTMLFilter;

type

  { TFormQtdLi }

  TFormQtdLi = class(TForm)
    DataSourceLivros: TDataSource;
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
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLAut: TRLLabel;
    RLGroup1: TRLGroup;
    RLHTMLFilter1: TRLHTMLFilter;
    RLNome: TRLLabel;
    RLCat: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLReportQtd: TRLReport;
    RLDat: TRLLabel;
    RLPrec: TRLLabel;
    RLQtd: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLTitleLi: TRLLabel;
    RLXLSXFilter1: TRLXLSXFilter;
    ZConnectionLobby: TZConnection;
    ZQueryEmprestimoData_Devolucao1: TStringField;
    ZQueryEmprestimoData_Emprestimo1: TStringField;
    ZQueryEmprestimoID_Emprestimo1: TSmallintField;
    ZQueryEmprestimoID_Livro1: TSmallintField;
    ZQueryEmprestimoID_Usuario1: TSmallintField;
    ZQueryLivros: TZQuery;
    ZQueryLivrosCategoria: TStringField;
    ZQueryLivrosData_Pub: TDateTimeField;
    ZQueryLivrosID_Autor: TSmallintField;
    ZQueryLivrosID_Categoria: TSmallintField;
    ZQueryLivrosID_Livro: TSmallintField;
    ZQueryLivrosNome_Autor: TStringField;
    ZQueryLivrosNome_Livro: TStringField;
    ZQueryLivrosPreco_Livro: TFloatField;
    ZQueryLivrosQtd_Livro: TLongintField;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FormQtdLi: TFormQtdLi;

implementation

{$R *.lfm}

{ TFormQtdLi }

procedure TFormQtdLi.FormCreate(Sender: TObject);
begin
  ZQueryLivros.Close;
  ZQueryLivros.Open;
end;

end.

