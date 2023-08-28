unit uLobby;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  DBGrids, StdCtrls, DBCtrls, RLPDFFilter, RLHTMLFilter, RLXLSXFilter,
  ZConnection, ZDataset, DateTimePicker, uRelatUsuarios, uRelatLivros, uRelatQtd, DateUtils;

type

  { TFormLobby }

  TFormLobby = class(TForm)
    Autores: TPage;
    btAddAutor: TSpeedButton;
    btAddCat: TSpeedButton;
    btAddLivro: TSpeedButton;
    btEditAutor: TSpeedButton;
    btEditCat: TSpeedButton;
    btEditUsuario: TSpeedButton;
    btDevolucao: TSpeedButton;
    btRemoveUsuario: TSpeedButton;
    btImprimirRelat: TSpeedButton;
    btPreviewRelat: TSpeedButton;
    btDefinirDataRelat: TSpeedButton;
    btSalvarUsuario: TSpeedButton;
    btRemovCat: TSpeedButton;
    btEditLivro: TSpeedButton;
    btEmprestimo: TSpeedButton;
    btEmprestimo1: TSpeedButton;
    btEmprestimo2: TSpeedButton;
    btRemovAutor: TSpeedButton;
    btRemoveLivro: TSpeedButton;
    btSalvarUsuaria2: TSpeedButton;
    Categorias: TPage;
    CheckBoxOrdenar: TCheckBox;
    DataSourceEmprestimo: TDataSource;
    DataSourceAutores: TDataSource;
    DataSourceCategorias: TDataSource;
    DataSourceLivros: TDataSource;
    DataSourceUsuarios: TDataSource;
    DataSourceAcesso: TDataSource;
    DateNasc: TDateTimePicker;
    DatePub: TDateTimePicker;
    DateEmprestimo: TDateTimePicker;
    DateDevolucao: TDateTimePicker;
    DBGridLivros: TDBGrid;
    DBGridLivros1: TDBGrid;
    DBGridLivros2: TDBGrid;
    DBGridLivrosUsuario: TDBGrid;
    RadioGroup1: TRadioGroup;
    RBQtdLi: TRadioButton;
    RBRelatLi: TRadioButton;
    RBRelatUsu: TRadioButton;
    StartDate: TDateTimePicker;
    EndDate: TDateTimePicker;
    DBGridAutores: TDBGrid;
    DBGridCategorias: TDBGrid;
    cbxAutores: TDBLookupComboBox;
    cbxCategorias: TDBLookupComboBox;
    DBGridGerenciamento: TDBGrid;
    cbxNivelAcesso: TDBLookupComboBox;
    edtEmailGerenciamento: TLabeledEdit;
    edtIDCat: TLabeledEdit;
    edtIDAutor: TLabeledEdit;
    edtIDLivro: TLabeledEdit;
    edtIDEmprestimo: TLabeledEdit;
    edtIDUsuarioE: TLabeledEdit;
    edtQtdLivro: TLabeledEdit;
    edtIDUsuario: TLabeledEdit;
    edtIDUsuarioGerenciamento: TLabeledEdit;
    edtNacionalidade: TLabeledEdit;
    edtNomeAutor: TLabeledEdit;
    edtNomeCategoria: TLabeledEdit;
    edtNomeLivro: TLabeledEdit;
    edtSenhaGerenciamento: TLabeledEdit;
    edtUsuario: TLabeledEdit;
    edtPrecoLivro: TLabeledEdit;
    edtSearchCat: TEdit;
    edtSearchAutor: TEdit;
    edtSearchLivros: TEdit;
    edtEmailUsuario: TLabeledEdit;
    edtSenhaUsuario: TLabeledEdit;
    edtUsuarioGerenciamento: TLabeledEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtIDLivroE: TLabeledEdit;
    lDate: TLabel;
    lHour: TLabel;
    Livros: TPage;
    lName: TLabel;
    lqtdLivros: TLabel;
    nbPaginas: TNotebook;
    Gerenciamento: TPage;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel4: TPanel;
    Panel9: TPanel;
    RLHTMLFilter1: TRLHTMLFilter;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    Shape14: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Usuario: TPage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    pMenu: TPanel;
    pNavButton: TPanel;
    pOptions: TPanel;
    pUser: TPanel;
    sbtAutroes: TSpeedButton;
    sbtUsuario: TSpeedButton;
    sbtGerencia: TSpeedButton;
    sbtCategorias: TSpeedButton;
    sbtLivros: TSpeedButton;
    sbtSair: TSpeedButton;
    Shape1: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    TimerLobby: TTimer;
    ZConnectionLobby: TZConnection;
    ZQueryAcesso: TZQuery;
    ZQueryCategoriasCategoria: TStringField;
    ZQueryCategoriasID_Categoria: TLongintField;
    ZQueryEmprestimo: TZQuery;
    ZQueryAutores: TZQuery;
    ZQueryCategorias: TZQuery;
    ZQueryLivros: TZQuery;
    ZQueryUsuarios: TZQuery;
    procedure btAddAutorClick(Sender: TObject);
    procedure btAddCatClick(Sender: TObject);
    procedure btAddLivroClick(Sender: TObject);
    procedure btDefinirDataRelatClick(Sender: TObject);
    procedure btDevolucaoClick(Sender: TObject);
    procedure btEditAutorClick(Sender: TObject);
    procedure btEditCatClick(Sender: TObject);
    procedure btEditLivroClick(Sender: TObject);
    procedure btEditUsuarioClick(Sender: TObject);
    procedure btEmprestimoClick(Sender: TObject);
    procedure btImprimirRelatClick(Sender: TObject);
    procedure btPreviewRelatClick(Sender: TObject);
    procedure btRemovAutorClick(Sender: TObject);
    procedure btRemovCatClick(Sender: TObject);
    procedure btRemoveLivroClick(Sender: TObject);
    procedure btRemoveUsuarioClick(Sender: TObject);
    procedure btSalvarUsuaria2Click(Sender: TObject);
    procedure btSalvarUsuarioClick(Sender: TObject);
    procedure DBGridAutoresDblClick(Sender: TObject);
    procedure DBGridCategoriasDblClick(Sender: TObject);
    procedure DBGridGerenciamentoDblClick(Sender: TObject);
    procedure DBGridLivrosDblClick(Sender: TObject);
    procedure DBGridLivrosUsuarioDblClick(Sender: TObject);
    procedure edtSearchAutorChange(Sender: TObject);
    procedure edtSearchCatChange(Sender: TObject);
    procedure edtSearchLivrosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image4DblClick(Sender: TObject);
    procedure RBQtdLiChange(Sender: TObject);
    procedure RBRelatLiChange(Sender: TObject);
    procedure RBRelatUsuChange(Sender: TObject);
    procedure sbtNavClick(Sender: TObject);
    procedure sbtSairClick(Sender: TObject);
    procedure TimerLobbyTimer(Sender: TObject);
  private
    procedure FiltroLivro(DataSet: TDataSet; var Accept: Boolean);
    procedure FiltroCat(DataSet: TDataSet; var Accept: Boolean);
    procedure FiltroAutor(DataSet: TDataSet; var Accept: Boolean);
    procedure ApplyFiltroLivro;
    procedure ApplyFiltroCat;
    procedure ApplyFiltroAutor;
  public

  end;

var
  FormLobby: TFormLobby;

implementation
{$R *.lfm}

uses
  uLogin;

{ TFormLobby }

procedure TFormLobby.sbtNavClick(Sender: TObject);
begin
  nbPaginas.PageIndex:= (Sender as TSpeedButton).Tag;

  edtIDAutor.Clear;
  edtIDLivro.Clear;
  edtIDCat.Clear;
  edtNacionalidade.Clear;
  edtNomeAutor.Clear;
  edtNomeCategoria.Clear;
  edtNomeLivro.Clear;
  edtPrecoLivro.Clear;
  edtQtdLivro.Clear;
  edtSearchAutor.Clear;
  edtSearchCat.Clear;
  edtSearchLivros.Clear;
  cbxAutores.ClearSelection;
  cbxCategorias.ClearSelection;
  DateNasc.Date:=00/00/0000;
  DatePub.Date:=00/00/0000;
  edtUsuarioGerenciamento.Clear;
  edtSenhaGerenciamento.Clear;
  edtEmailGerenciamento.Clear;
  edtIDUsuarioGerenciamento.Clear;
  cbxNivelAcesso.ClearSelection;
  edtIDEmprestimo.Clear;
  edtIDLivroE.Clear;
  edtIDUsuarioE.Clear;
  DateEmprestimo.Date:=00/00/0000;
  DateDevolucao.Date:=00/00/0000;

  btEmprestimo.Visible:=False;
  btEmprestimo1.Visible:=False;
  btEmprestimo2.Visible:=False;
  btDevolucao.Visible:=False;

  ZQueryLivros.Close;
  ZQueryLivros.SQL.Clear;
  ZQueryLivros.SQL.Add('select A.*, B.*, C.* from Adm.tbl_livro A inner join Adm.tbl_autores B on A.ID_Autor = B.ID_Autor inner join Adm.tbl_categorias C on A.ID_Categoria = C.ID_Categoria where A.Qtd_Livro <> 0');
  ZQueryLivros.Open;

  ZQueryEmprestimo.Close;
  ZQueryEmprestimo.SQL.Clear;
  ZQueryEmprestimo.SQL.Add('select A.*, L.*, U.* from Adm.tbl_emprestimos A inner join Adm.tbl_livro L on A.ID_Livro = L.ID_Livro inner join Adm.tbl_usuarios U on A.ID_Usuario = U.ID_Usuario where A.ID_Usuario = ' + QuotedStr(edtIDUsuario.Text));
  ZQueryEmprestimo.Open;

  ZQueryCategorias.Close;
  ZQueryCategorias.SQL.Clear;
  ZQueryCategorias.SQL.Add('select * from Adm.tbl_categorias');
  ZQueryCategorias.Open;

  ZQueryAutores.Close;
  ZQueryAutores.SQL.Clear;
  ZQueryAutores.SQL.Add('select * from Adm.tbl_autores');
  ZQueryAutores.Open;

end;

procedure TFormLobby.FormCreate(Sender: TObject);
begin

  ZQueryLivros.Close;
  ZQueryLivros.Active:=True;

  ZQueryCategorias.Close;
  ZQueryCategorias.Active:=True;

  ZQueryAutores.Close;
  ZQueryAutores.Active:=True;

  ZQueryUsuarios.Close;
  ZQueryUsuarios.Active:=True;

  ZQueryAcesso.Close;
  ZQueryAcesso.Active:=True;

  ZQueryEmprestimo.Close;
  ZQueryEmprestimo.Active:=True;

  if not ZQueryLivros.EOF then
  lqtdLivros.Caption:=IntToStr(ZQueryLivros.RecordCount);

  lDate.Caption:=DateToStr(Now);

  FormRelatLi:=TFormRelatLi.Create(Nil);
  FormRelatU:=TFormRelatU.Create(Nil);

  edtQtdLivro.NumbersOnly:=True;

end;

procedure TFormLobby.FormShow(Sender: TObject);
begin
      FormLogin.Hide;
end;

procedure TFormLobby.Image4Click(Sender: TObject);
begin
  edtSenhaGerenciamento.PasswordChar:=#0;
end;

procedure TFormLobby.Image4DblClick(Sender: TObject);
begin
  edtSenhaGerenciamento.PasswordChar:='*';
end;

procedure TFormLobby.RBQtdLiChange(Sender: TObject);
begin
  CheckBoxOrdenar.Enabled:=True;
  StartDate.Enabled:=False;
  StartDate.Date:=NullDate;
  EndDate.Enabled:=False;
  EndDate.Date:=NullDate;
  btDefinirDataRelat.Enabled:=False;
end;

procedure TFormLobby.RBRelatLiChange(Sender: TObject);
begin
  CheckBoxOrdenar.Enabled:=False;
  StartDate.Enabled:=True;
  EndDate.Enabled:=True;
  btDefinirDataRelat.Enabled:=True;
end;

procedure TFormLobby.RBRelatUsuChange(Sender: TObject);
begin
  CheckBoxOrdenar.Enabled:=True;
  CheckBoxOrdenar.Checked:=False;
  StartDate.Enabled:=False;
  StartDate.Date:=NullDate;
  EndDate.Enabled:=False;
  EndDate.Date:=NullDate;
  btDefinirDataRelat.Enabled:=False;
end;

procedure TFormLobby.edtSearchLivrosChange(Sender: TObject);
begin
  if Trim(edtSearchLivros.Text) <> '' then
  begin
  ApplyFiltroLivro;
  end
  else
  begin
  ZQueryLivros.Filtered:=False;
  end;
end;

procedure TFormLobby.edtSearchCatChange(Sender: TObject);
begin
  if Trim(edtSearchCat.Text) <> '' then
  begin
  ApplyFiltroCat;
  end
  else
  begin
  ZQueryCategorias.Filtered:=False;
  end;
end;

procedure TFormLobby.edtSearchAutorChange(Sender: TObject);
begin
  if Trim(edtSearchAutor.Text) <> '' then
  begin
  ApplyFiltroAutor;
  end
  else
  begin
  ZQueryAutores.Filtered:=False;
  end;
end;

procedure TFormLobby.DBGridLivrosDblClick(Sender: TObject);
begin
  edtIDLivro.Text:=ZQueryLivros.FieldByName('ID_Livro').AsString;
  edtNomeLivro.Text:=ZQueryLivros.FieldByName('Nome_Livro').AsString;
  edtPrecoLivro.Text:=FormatFloat('#,##',(ZQueryLivros.FieldByName('Preco_Livro').AsFloat));
  DatePub.DateTime:=ZQueryLivros.FieldByName('Data_Pub').AsDateTime;
  cbxCategorias.KeyValue:=ZQueryLivros.FieldByName('ID_Categoria').AsInteger;
  cbxAutores.KeyValue:=ZQueryLivros.FieldByName('ID_Autor').AsInteger;
  edtQtdLivro.Text:=ZQueryLivros.FieldByName('Qtd_Livro').AsString;
  btEmprestimo.Visible:=True;
  btEmprestimo1.Visible:=True;
  btEmprestimo2.Visible:=True;
end;

procedure TFormLobby.DBGridLivrosUsuarioDblClick(Sender: TObject);
begin
  DateEmprestimo.Date:=ZQueryEmprestimo.FieldByName('Data_Emprestimo').AsDateTime;
  DateDevolucao.Date:=Now;
  edtIDLivroE.Text:=ZQueryEmprestimo.FieldByName('ID_Livro').AsString;
  edtIDUsuarioE.Text:=ZQueryEmprestimo.FieldByName('ID_Usuario').AsString;
  edtIDEmprestimo.Text:=ZQueryEmprestimo.FieldByName('ID_Emprestimo').AsString;
  btDevolucao.Visible:=True;
end;

procedure TFormLobby.DBGridCategoriasDblClick(Sender: TObject);
begin
  edtIDCat.Text:=ZQueryCategorias.FieldByName('ID_Categoria').AsString;
  edtNomeCategoria.Text:=ZQueryCategorias.FieldByName('Categoria').AsString;
  ZQueryLivros.Close;
  ZQueryLivros.SQL.Clear;
  ZQueryLivros.SQL.Add('select A.*, B.*, C.* from Adm.tbl_livro A inner join Adm.tbl_autores B on A.ID_Autor = B.ID_Autor inner join Adm.tbl_categorias C on A.ID_Categoria = C.ID_Categoria where A.Qtd_Livro <> 0 and A.ID_Categoria = ' + edtIDCat.Text);
  ZQueryLivros.Open;
end;

procedure TFormLobby.DBGridGerenciamentoDblClick(Sender: TObject);
var
  ID_Usuario : integer;
begin

  ID_Usuario := ZQueryUsuarios.FieldByName('ID_Usuario').AsInteger;
  if ID_Usuario = 1 then
    begin
     cbxNivelAcesso.Enabled:=False;
     btRemoveUsuario.Enabled:=False;
    end
    else
    begin
     cbxNivelAcesso.Enabled:=True;
     btRemoveUsuario.Enabled:=True;
    end;

  edtIDUsuarioGerenciamento.Text:=ZQueryUsuarios.FieldByName('ID_Usuario').AsString;
  edtEmailGerenciamento.Text:=ZQueryUsuarios.FieldByName('Email_Usuario').AsString;
  edtSenhaGerenciamento.Text:=ZQueryUsuarios.FieldByName('Senha_Usuario').AsString;
  edtUsuarioGerenciamento.Text:=ZQueryUsuarios.FieldByName('Nome_Usuario').AsString;
  cbxNivelAcesso.KeyValue:=ZQueryUsuarios.FieldByName('Nivel_Acesso').AsInteger;

  edtSenhaGerenciamento.PasswordChar:='*';

end;

procedure TFormLobby.DBGridAutoresDblClick(Sender: TObject);
begin
  edtNomeAutor.Text:=ZQueryAutores.FieldByName('Nome_Autor').AsString;
  DateNasc.DateTime:=ZQueryAutores.FieldByName('Data_Nascimento').AsDateTime;
  edtIDAutor.Text:=ZQueryAutores.FieldByName('ID_Autor').AsString;
  edtNacionalidade.Text:=ZQueryAutores.FieldByName('Nacionalidade').AsString;
  ZQueryLivros.Close;
  ZQueryLivros.SQL.Clear;
  ZQueryLivros.SQL.Add('select A.*, B.*, C.* from Adm.tbl_livro A inner join Adm.tbl_autores B on A.ID_Autor = B.ID_Autor inner join Adm.tbl_categorias C on A.ID_Categoria = C.ID_Categoria where A.Qtd_Livro <> 0 and A.ID_Autor = ' + edtIDAutor.Text);
  ZQueryLivros.Open;
end;

    procedure TFormLobby.btAddAutorClick(Sender: TObject);
begin
  if (edtNomeAutor.Text = '') and (edtNacionalidade.Text = '') and (DateNasc.DateTime = NullDate) then
  begin
    ShowMessage('Dados incompletos!');
    Abort;
  end
  else
  begin
     ZQueryAutores.Close;
     ZQueryAutores.SQL.Clear;
     ZQueryAutores.SQL.Add('select * from Adm.tbl_autores where Nome_Autor = :AAutor and Data_Nascimento = :ANasc and Nacionalidade = :ANacio');
     ZQueryAutores.ParamByName('AAutor').AsString:=edtNomeAutor.Text;
     ZQueryAutores.ParamByName('ANasc').AsDate:=DateNasc.Date;
     ZQueryAutores.ParamByName('ANacio').AsString:=edtNacionalidade.Text;
     ZQueryAutores.Open;
    if ZQueryAutores.Fields[0].AsInteger > 0 then
    begin
      ZQueryAutores.Close;
      ZQueryAutores.SQL.Clear;
      ZQueryAutores.SQL.Add('select * from Adm.tbl_autores');
      ZQueryAutores.Open;

      ShowMessage('Autor já cadastrado!');
      edtNomeAutor.SetFocus;
      Abort;
    end
    else
  try
    ZQueryAutores.Close;
    ZQueryAutores.SQL.Clear;
    ZQueryAutores.SQL.Add('insert into Adm.tbl_autores');
    ZQueryAutores.SQL.Add('(Nome_Autor, Data_Nascimento, Nacionalidade)');
    ZQueryAutores.SQL.Add('values');
    ZQueryAutores.SQL.Add('(:ANome, :ANascim, :ANacio)');
    ZQueryAutores.ParamByName('ANome').AsString:=edtNomeAutor.Text;
    ZQueryAutores.ParamByName('ANascim').AsDate:=DateNasc.Date;
    ZQueryAutores.ParamByName('ANacio').AsString:=edtNacionalidade.Text;
    ZQueryAutores.ExecSQL;

    ZQueryAutores.Close;
    ZQueryAutores.SQL.Clear;
    ZQueryAutores.SQL.Add('select * from Adm.tbl_autores');
    ZQueryAutores.Open;

    ShowMessage('Adicionado com sucesso!');

  except
    on e:exception do
    begin
      ShowMessage('Ocorreu um erro: '+ e.Message);
    end;
  end;
end;
end;

procedure TFormLobby.btEditAutorClick(Sender: TObject);
begin
  if edtIDAutor.Text = '' then
  begin
  ShowMessage('Nenhum autor selecionado!');
  Abort;
  end
  else
  if (edtNomeAutor.Text = '') or (edtNacionalidade.Text = '') or (DateNasc.Date = NullDate) then
  begin
  ShowMessage('Dados não podem ser nulos!');
  Abort;
  end
  else
    try
      ZQueryAutores.Edit;

      ZQueryAutores.FieldByName('Nome_Autor').AsString:=edtNomeAutor.Text;
      ZQueryAutores.FieldByName('Data_Nascimento').AsDateTime:=DateNasc.Date;
      ZQueryAutores.FieldByName('Nacionalidade').AsString:=edtNacionalidade.Text;

      ZQueryAutores.Post;

      ShowMessage('Editado com sucesso!');
    except
      on e:exception do
        begin
          ShowMessage('Ocorreu um erro: '+ e.Message);
        end;
    end;
  end;

procedure TFormLobby.btRemovAutorClick(Sender: TObject);
begin
  if edtIDAutor.Text = '' then
  begin
  ShowMessage('Nenhum autor selecionado!');
  Abort;
  end
  else
      ZQueryLivros.Close;
      ZQueryLivros.SQL.Clear;
      ZQueryLivros.SQL.Add('select count(*) from  Adm.tbl_livro inner join Adm.tbl_autores on Adm.tbl_livro.ID_Autor = tbl_autores.ID_Autor where Adm.tbl_livro.ID_Autor = tbl_autores.ID_Autor and tbl_livro.ID_Autor = ' + QuotedStr(edtIDAutor.Text));
      ZQueryLivros.Open;

      if ZQueryEmprestimo.Fields[0].AsInteger > 0 then
    begin

      ShowMessage('Não é possivel deletar autor relacionada a um livro da biblioteca!');
      Abort;
    end
      else
   try
    ZQueryAutores.Close;
    ZQueryAutores.SQL.Clear;
    ZQueryAutores.SQL.Add('delete from Adm.tbl_autores where ID_Autor = ' + edtIDAutor.Text);
    ZQueryAutores.ExecSQL;

    ZQueryAutores.Close;
    ZQueryAutores.SQL.Clear;
    ZQueryAutores.SQL.Add('select * from Adm.tbl_autores');
    ZQueryAutores.Open;

    ShowMessage('Removido com sucesso!');

      ZQueryLivros.Close;
      ZQueryLivros.SQL.Clear;
      ZQueryLivros.SQL.Add('select A.*, B.*, C.* from Adm.tbl_livro A inner join Adm.tbl_autores B on A.ID_Autor = B.ID_Autor inner join Adm.tbl_categorias C on A.ID_Categoria = C.ID_Categoria where A.Qtd_Livro <> 0');
      ZQueryLivros.Open;

  except
    on e:exception do
    begin
      ShowMessage('Ocorreu um erro: '+ e.Message);
    end;
  end;
end;

procedure TFormLobby.btAddCatClick(Sender: TObject);
begin
  if edtNomeCategoria.Text = '' then
  begin
  ShowMessage('Preencha o nome da categoria!');
  Abort;
  end
  else
  begin
     ZQueryCategorias.Close;
     ZQueryCategorias.SQL.Clear;
     ZQueryCategorias.SQL.Add('select * from Adm.tbl_categorias where Categoria = :ACat');
     ZQueryCategorias.ParamByName('ACat').AsString := edtNomeCategoria.Text;
     ZQueryCategorias.Open;

    if ZQueryCategorias.Fields[0].AsInteger > 0 then
    begin
      ZQueryCategorias.Close;
      ZQueryCategorias.SQL.Clear;
      ZQueryCategorias.SQL.Add('select * from Adm.tbl_categorias');
      ZQueryCategorias.Open;

      ShowMessage('Categoria já cadastrado!');
      edtNomeCategoria.SetFocus;
      Abort;
    end
    else
  try
    ZQueryCategorias.Close;
    ZQueryCategorias.SQL.Clear;
    ZQueryCategorias.SQL.Add('insert into Adm.tbl_categorias');
    ZQueryCategorias.SQL.Add('(Categoria)');
    ZQueryCategorias.SQL.Add('values');
    ZQueryCategorias.SQL.Add('(:ACategoria)');
    ZQueryCategorias.ParamByName('ACategoria').AsString:=edtNomeCategoria.Text;
    ZQueryCategorias.ExecSQL;

    ZQueryCategorias.Close;
    ZQueryCategorias.SQL.Clear;
    ZQueryCategorias.SQL.Add('select * from Adm.tbl_categorias');
    ZQueryCategorias.Open;

    ShowMessage('Adcionado com sucesso!');

  except
    on e:exception do
    begin
      ShowMessage('Ocorreu um erro: '+ e.Message);
    end;
  end;
end;

end;

procedure TFormLobby.btEditCatClick(Sender: TObject);
begin
  if edtIDCat.Text = '' then
  begin
  ShowMessage('Nenhuma categoria selecionada!');
  Abort;
  end
  else
  if edtNomeCategoria.Text = '' then
  begin
  ShowMessage('Categoria sem nome!');
  Abort;
  end
  else
    try
      ZQueryCategorias.Edit;

      ZQueryCategorias.FieldByName('Categoria').AsString:=edtNomeCategoria.Text;

      ZQueryCategorias.Post;

      ShowMessage('Editado com sucesso!');

    except
      on e:exception do
        begin
          ShowMessage('Ocorreu um erro: '+ e.Message);
        end;
    end;
  end;

procedure TFormLobby.btRemovCatClick(Sender: TObject);
begin
  if edtIDCat.Text = '' then
  begin
  ShowMessage('Nenhuma categoria selecionada!');
  Abort;
  end
  else
      ZQueryLivros.Close;
      ZQueryLivros.SQL.Clear;
      ZQueryLivros.SQL.Add('select count(*) from  Adm.tbl_livro inner join Adm.tbl_categorias on Adm.tbl_livro.ID_Categoria = tbl_categorias.ID_Categoria where Adm.tbl_livro.ID_Categoria = tbl_categorias.ID_Categoria and tbl_livro.ID_Categoria = ' + QuotedStr(edtIDCat.Text));
      ZQueryLivros.Open;

      if ZQueryEmprestimo.Fields[0].AsInteger > 0 then
    begin

      ShowMessage('Não é possivel deletar categoria relacionada a um livro da biblioteca!');
      Abort;
    end
      else
   try
    ZQueryCategorias.Close;
    ZQueryCategorias.SQL.Clear;
    ZQueryCategorias.SQL.Add('delete from Adm.tbl_categorias where ID_Categoria = ' + edtIDCat.Text);
    ZQueryCategorias.ExecSQL;

    ZQueryCategorias.Close;
    ZQueryCategorias.SQL.Clear;
    ZQueryCategorias.SQL.Add('select * from Adm.tbl_categorias');
    ZQueryCategorias.Open;

    ShowMessage('Removido com sucesso!');

      ZQueryLivros.Close;
      ZQueryLivros.SQL.Clear;
      ZQueryLivros.SQL.Add('select A.*, B.*, C.* from Adm.tbl_livro A inner join Adm.tbl_autores B on A.ID_Autor = B.ID_Autor inner join Adm.tbl_categorias C on A.ID_Categoria = C.ID_Categoria where A.Qtd_Livro <> 0');
      ZQueryLivros.Open;

  except
    on e:exception do
    begin
      ShowMessage('Ocorreu um erro: '+ e.Message);
    end;
  end;
  end;

procedure TFormLobby.btAddLivroClick(Sender: TObject);
begin
  if (edtNomeLivro.Text = '') and (edtPrecoLivro.Text = '') and (edtQtdLivro.Text = '') and (DatePub.DateTime = NullDate) and (cbxCategorias.KeyValue = Null) and (cbxAutores.KeyValue = Null) then
  begin
  ShowMessage('Dados insuficientes!');
  Abort;
  end
  else
  begin
     ZQueryLivros.Close;
     ZQueryLivros.SQL.Clear;
     ZQueryLivros.SQL.Add('select count(*) from Adm.tbl_livro where Qtd_Livro <> 0 and Nome_Livro = :ANomeL and ID_Autor = :AAutor and ID_Categoria = :ACat');
     ZQueryLivros.ParamByName('ANomeL').AsString:=edtNomeLivro.Text;
     ZQueryLivros.ParamByName('AAutor').AsInteger:=cbxAutores.KeyValue;
     ZQueryLivros.ParamByName('ACat').AsInteger:=cbxCategorias.KeyValue;
     ZQueryLivros.Open;

    if ZQueryLivros.Fields[0].AsInteger > 0 then
    begin
      ZQueryLivros.Close;
      ZQueryLivros.SQL.Clear;
      ZQueryLivros.SQL.Add('select A.*, B.*, C.* from Adm.tbl_livro A inner join Adm.tbl_autores B on A.ID_Autor = B.ID_Autor inner join Adm.tbl_categorias C on A.ID_Categoria = C.ID_Categoria where A.Qtd_Livro <> 0');
      ZQueryLivros.Open;

      ShowMessage('Livro já cadastrado!');
      edtNomeLivro.SetFocus;
      Abort;
    end
    else
  try
    ZQueryLivros.Close;
    ZQueryLivros.SQL.Clear;
    ZQueryLivros.SQL.Add('insert into Adm.tbl_livro');
    ZQueryLivros.SQL.Add('(Nome_Livro, Preco_Livro, ID_Categoria, ID_Autor, Data_Pub, Qtd_Livro)');
    ZQueryLivros.SQL.Add('values');
    ZQueryLivros.SQL.Add('(:ANome, :APreco, :ACat, :AAutor, :APub, :AQtd)');
    ZQueryLivros.ParamByName('ANome').AsString:=edtNomeLivro.Text;
    ZQueryLivros.ParamByName('APreco').AsFloat:=StrToFloatDef(edtPrecoLivro.Text, 0);
    ZQueryLivros.ParamByName('ACat').AsInteger:=cbxCategorias.KeyValue;
    ZQueryLivros.ParamByName('AAutor').AsInteger:=cbxAutores.KeyValue;
    ZQueryLivros.ParamByName('APub').AsDate:=DatePub.Date;
    ZQueryLivros.ParamByName('AQtd').AsInteger:=StrToInt(edtQtdLivro.Text);
    ZQueryLivros.ExecSQL;

    ZQueryLivros.Close;
    ZQueryLivros.SQL.Clear;
    ZQueryLivros.SQL.Add('select A.*, B.*, C.* from Adm.tbl_livro A inner join Adm.tbl_autores B on A.ID_Autor = B.ID_Autor inner join Adm.tbl_categorias C on A.ID_Categoria = C.ID_Categoria where A.Qtd_Livro <> 0');
    ZQueryLivros.Open;

      if not ZQueryLivros.EOF then
      lqtdLivros.Caption:=IntToStr(ZQueryLivros.RecordCount);


      ShowMessage('Livro adcionado com sucesso!');

  except
    on e:exception do
    begin
      ShowMessage('Ocorreu um erro: '+ e.Message);
    end;
  end;
end;

end;

procedure TFormLobby.btDefinirDataRelatClick(Sender: TObject);
var
  Sdate, Edate : TDateTime;
begin

  Sdate:=StartDate.DateTime;
  Edate:=EndDate.DateTime;

  if (Sdate = NullDate) and (Edate = NullDate) then

  begin
  ShowMessage('Data Invalida!');
  Abort;
  end

  else if (Sdate <> NullDate) and (Edate <> NullDate) then

  begin

  ZQueryEmprestimo.Close;
  ZQueryEmprestimo.SQL.Clear;
  ZQueryEmprestimo.SQL.Add('select A.*, L.*, U.* from Adm.tbl_emprestimos A inner join Adm.tbl_livro L on A.ID_Livro = L.ID_Livro inner join Adm.tbl_usuarios U on A.ID_Usuario = U.ID_Usuario where A.Data_Emprestimo >= :ASdate and A.Data_Emprestimo <= :AEdate');
  ZQueryEmprestimo.ParamByName('ASdate').AsDateTime:=Sdate;
  ZQueryEmprestimo.ParamByName('AEdate').AsDateTime:= Edate;
  ZQueryEmprestimo.Open;

  FormRelatLi:=TFormRelatLi.Create(Nil);

  FormRelatLi.LBStartDate.Visible:=True;
  FormRelatLi.LBEndDate.Visible:=True;
  FormRelatLi.LBStartDate.Caption:=DateToStr(Sdate);
  FormRelatLi.LBEndDate.Caption:=DateToStr(Edate);

  ShowMessage('Data definida!');

  end;

end;

procedure TFormLobby.btEditLivroClick(Sender: TObject);
begin
  if edtIDLivro.Text = '' then
  begin
  ShowMessage('Nenhum livro selecionado!');
  Abort;
  end
  else
  if (edtNomeLivro.Text = '') or (edtPrecoLivro.Text = '') or (edtQtdLivro.Text = '') or (DatePub.Date = NullDate) or (cbxAutores.KeyField = '') or (cbxCategorias.KeyField = '') then
  begin
  ShowMessage('Dados não podem ser nulos!');
  Abort;
  end
  else
  try

    ZQueryLivros.Close;
    ZQueryLivros.SQL.Clear;
    ZQueryLivros.SQL.Add('update Adm.tbl_livro set ');
    ZQueryLivros.SQL.Add('Nome_Livro = ' + QuotedStr(edtNomeLivro.Text) + ', ' );
    ZQueryLivros.SQL.Add('Data_Pub = ' + FormatDateTime('yyyy-mm-dd', DatePub.Date) + ', ');
    ZQueryLivros.SQL.Add('Preco_Livro = ' + edtPrecoLivro.Text + ', ');
    ZQueryLivros.SQL.Add('Qtd_Livro = ' + edtQtdLivro.Text + ', ');
    ZQueryLivros.SQL.Add('ID_Categoria = ' + QuotedStr(cbxCategorias.KeyValue) + ', ');
    ZQueryLivros.SQL.Add('ID_Autor = ' + QuotedStr(cbxAutores.KeyValue));
    ZQueryLivros.SQL.Add(' where ID_Livro = ' + edtIDLivro.Text);
    ZQueryLivros.ExecSQL;


    ZQueryLivros.Close;
    ZQueryLivros.SQL.Clear;
    ZQueryLivros.SQL.Add('select A.*, B.*, C.* from Adm.tbl_livro A inner join Adm.tbl_autores B on A.ID_Autor = B.ID_Autor inner join Adm.tbl_categorias C on A.ID_Categoria = C.ID_Categoria where A.Qtd_Livro <> 0');
    ZQueryLivros.Open;

    ShowMessage('Editado com sucesso!');

  except
    on e:exception do
      begin
        ShowMessage('Ocorreu um erro: '+ e.Message);
      end;
  end;
end;

procedure TFormLobby.btRemoveLivroClick(Sender: TObject);
begin
  if edtIDLivro.Text = '' then
  begin
  ShowMessage('Nenhum Livro Selecionado!');
  Abort;
  end
  else
      ZQueryEmprestimo.Close;
      ZQueryEmprestimo.SQL.Clear;
      ZQueryEmprestimo.SQL.Add('select count(*) from  Adm.tbl_emprestimos inner join Adm.tbl_livro on Adm.tbl_emprestimos.ID_Livro = tbl_livro.ID_Livro where Adm.tbl_emprestimos.ID_Livro = tbl_livro.ID_Livro and tbl_livro.ID_livro = ' + QuotedStr(edtIDLivro.Text));
      ZQueryEmprestimo.Open;

      if ZQueryEmprestimo.Fields[0].AsInteger > 0 then
    begin

      ShowMessage('Não é possivel deletar livros emprestados!');
      Abort;
    end
  else
  try
    ZQueryLivros.Close;
    ZQueryLivros.SQL.Clear;
    ZQueryLivros.SQL.Add('delete from Adm.tbl_livro where ID_Livro = ' + edtIDLivro.Text);
    ZQueryLivros.ExecSQL;

    ZQueryLivros.Close;
    ZQueryLivros.SQL.Clear;
    ZQueryLivros.SQL.Add('select A.*, B.*, C.* from Adm.tbl_livro A inner join Adm.tbl_autores B on A.ID_Autor = B.ID_Autor inner join Adm.tbl_categorias C on A.ID_Categoria = C.ID_Categoria where A.Qtd_Livro <> 0');
    ZQueryLivros.Open;

      if not ZQueryLivros.EOF then
      lqtdLivros.Caption:=IntToStr(ZQueryLivros.RecordCount);

      ShowMessage('Livro removido com sucesso!');

      if not ZQueryLivros.EOF then
      lqtdLivros.Caption:=IntToStr(ZQueryLivros.RecordCount);

      ZQueryEmprestimo.Close;
      ZQueryEmprestimo.SQL.Clear;
      ZQueryEmprestimo.SQL.Add('select A.*, L.*, U.* from Adm.tbl_emprestimos A inner join Adm.tbl_livro L on A.ID_Livro = L.ID_Livro inner join Adm.tbl_usuarios U on A.ID_Usuario = U.ID_Usuario');
      ZQueryEmprestimo.Open;

      edtNomeLivro.Clear;
      DatePub.Date:=00/00/0000;
      edtIDLivro.Clear;
      edtPrecoLivro.Clear;
      edtQtdLivro.Clear;
      cbxAutores.ClearSelection;
      cbxCategorias.ClearSelection;

  except
    on e:exception do
    begin
      ShowMessage('Ocorreu um erro: '+ e.Message);
    end;
  end;
end;

procedure TFormLobby.btSalvarUsuarioClick(Sender: TObject);
begin
  if (edtUsuario.Text = '') or (edtEmailUsuario.Text = '') or (edtSenhaUsuario.Text = '') then
  begin
  ShowMessage('Dados não podem ser nulos!');
  edtUsuario.SetFocus;
  Abort;
  end
  else
    try

    ZQueryUsuarios.Close;
    ZQueryUsuarios.SQL.Clear;
    ZQueryUsuarios.SQL.Add('update Adm.tbl_usuarios set ');
    ZQueryUsuarios.SQL.Add('Nome_Usuario = ' + QuotedStr(edtUsuario.Text) + ', ' );
    ZQueryUsuarios.SQL.Add('Email_Usuario = ' + QuotedStr(edtEmailUsuario.Text) + ', ');
    ZQueryUsuarios.SQL.Add('Senha_Usuario = ' + QuotedStr(edtSenhaUsuario.Text));
    ZQueryUsuarios.SQL.Add(' where ID_Usuario = ' + edtIDUsuario.Text);
    ZQueryUsuarios.ExecSQL;

    ShowMessage('Dados salvos!');

    ZQueryUsuarios.Close;
    ZQueryUsuarios.SQL.Clear;
    ZQueryUsuarios.SQL.Add('select * from Adm.tbl_usuarios');
    ZQueryUsuarios.Open;

      btSalvarUsuario.Visible:=False;
      btEditUsuario.Visible:=True;
      edtUsuario.Enabled:=False;
      edtEmailUsuario.Enabled:=False;
      edtSenhaUsuario.PasswordChar:='*';
      edtSenhaUsuario.Enabled:=False;

  except
    on e:exception do
      begin
        ShowMessage('Ocorreu um erro: '+ e.Message);
      end;
  end;
end;

procedure TFormLobby.btEditUsuarioClick(Sender: TObject);
begin
  btSalvarUsuario.Visible:=True;
  btEditUsuario.Visible:=False;
  edtUsuario.Enabled:=True;
  edtEmailUsuario.Enabled:=True;
  edtSenhaUsuario.PasswordChar:=#0;
  edtSenhaUsuario.Enabled:=True;
end;

procedure TFormLobby.btEmprestimoClick(Sender: TObject);
begin
  if MessageDlg('Deseja solicitar este livro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  DateEmprestimo.Date:=Now;
  DateDevolucao.Date:=(Now + IncMonth(1));

    if edtIDLivro.Text = '' then
      begin
        ShowMessage('Nenhum livro selecionado!');
        Abort;
      end
    else

         ZQueryEmprestimo.Close;
         ZQueryEmprestimo.SQL.Clear;
         ZQueryEmprestimo.SQL.Add('select count(*) as QtdL from  Adm.tbl_emprestimos inner join Adm.tbl_usuarios on Adm.tbl_emprestimos.ID_Usuario = tbl_usuarios.ID_Usuario where Adm.tbl_emprestimos.ID_Usuario = tbl_usuarios.ID_Usuario and tbl_emprestimos.ID_Usuario = ' + QuotedStr(edtIDUsuario.Text));
         ZQueryEmprestimo.Open;

         if ZQueryEmprestimo.FieldByName('QtdL').AsInteger > 3 then
       begin
         ShowMessage('Maximo de emprestimos realizados!' + #13 + 'Devolva algum livro para pegar outro!');
         Abort;
       end
     else
    if edtIDLivro.Text <> '' then
  try
    begin
    ZQueryEmprestimo.Close;
    ZQueryEmprestimo.SQL.Clear;
    ZQueryEmprestimo.SQL.Add('insert into Adm.tbl_emprestimos ');
    ZQueryEmprestimo.SQL.Add('(ID_Usuario, ID_Livro, Data_Emprestimo, Data_Devolucao) ');
    ZQueryEmprestimo.SQL.Add('values');
    ZQueryEmprestimo.SQL.Add('(:AUsuario, :ALivro, :ADataE, :ADataD) ');
    ZQueryEmprestimo.ParamByName('AUsuario').AsInteger:=StrToInt(edtIDUsuario.Text);
    ZQueryEmprestimo.ParamByName('ALivro').AsInteger:=StrToInt(edtIDLivro.Text);
    ZQueryEmprestimo.ParamByName('ADataE').AsDateTime:=DateEmprestimo.Date;
    ZQueryEmprestimo.ParamByName('ADataD').AsDateTime:=DateDevolucao.Date;
    ZQueryEmprestimo.ExecSQL;

    ZQueryEmprestimo.Close;
    ZQueryEmprestimo.SQL.Clear;
    ZQueryEmprestimo.SQL.Add('update Adm.tbl_livro set Qtd_Livro = (Qtd_Livro - 1) where ID_Livro = :ALivro');
    ZQueryEmprestimo.ParamByName('ALivro').AsInteger:=StrToInt(edtIDLivro.Text);
    ZQueryEmprestimo.ExecSQL;
    end;

    ZQueryLivros.Close;
    ZQueryLivros.SQL.Clear;
    ZQueryLivros.SQL.Add('select A.*, B.*, C.* from Adm.tbl_livro A inner join Adm.tbl_autores B on A.ID_Autor = B.ID_Autor inner join Adm.tbl_categorias C on A.ID_Categoria = C.ID_Categoria where A.Qtd_Livro <> 0');
    ZQueryLivros.Open;
    ZQueryEmprestimo.Close;
    ZQueryEmprestimo.SQL.Clear;
    ZQueryEmprestimo.SQL.Add('select * from Adm.tbl_emprestimos');
    ZQueryEmprestimo.Open;

    if not ZQueryLivros.EOF then
    lqtdLivros.Caption:=IntToStr(ZQueryLivros.RecordCount);

    ShowMessage('Emprestimo realizado!');

    btEmprestimo.Visible:=False;
    btEmprestimo1.Visible:=False;
    btEmprestimo2.Visible:=False;

  except
    on e:exception do
    begin
      ShowMessage('Ocorreu um erro: '+ e.Message);
    end;
  end;
  end
  else
  Abort;
end;

procedure TFormLobby.btImprimirRelatClick(Sender: TObject);
begin
  if RBRelatUsu.Checked = True then
    FormRelatU.RLReportU.Print
  else if RBRelatLi.Checked = True then
    FormRelatLi.RLReportLi.Print;
end;

procedure TFormLobby.btPreviewRelatClick(Sender: TObject);
begin

  if RBRelatUsu.Checked = True then
    begin

    FormRelatU.Close;
    FormRelatU:=TFormRelatU.Create(Nil);

    if CheckBoxOrdenar.Checked = False then
     FormRelatU.RLReportU.Preview()
    else if  CheckBoxOrdenar.Checked = True then
      begin
        FormRelatU.RLGroup1.DataFields:='Nivel_Acesso';
        FormRelatU.RLDBText5.DataField:='Nivel_Acesso';
        FormRelatU.RLBand6.Visible:=True;
        ZQueryUsuarios.SortedFields:='Nivel_Acesso';
        FormRelatU.RLReportU.Preview()
      end
  end



  else if  (RBRelatLi.Checked = True) and (StartDate.Date = NullDate) then
     begin
      FormRelatLi:=TFormRelatLi.Create(Nil);
       ZQueryEmprestimo.Close;
       ZQueryEmprestimo.SQL.Clear;
       ZQueryEmprestimo.SQL.Add('select A.*, L.*, U.* from Adm.tbl_emprestimos A inner join Adm.tbl_livro L on A.ID_Livro = L.ID_Livro inner join Adm.tbl_usuarios U on A.ID_Usuario = U.ID_Usuario');
       ZQueryEmprestimo.Open;
      FormRelatLi.RLReportLi.Preview()
     end
  else if  (RBRelatLi.Checked = True)then
   begin
     FormRelatLi.RLReportLi.Preview();
  end


  else if RBQtdLi.Checked = True then
  begin
    FormQtdLi:=TFormQtdLi.Create(Nil);

    if (StartDate.DateTime = NullDate) and (EndDate.DateTime = NullDate) and (CheckBoxOrdenar.Checked = False)then
    begin
      FormQtdLi.RLReportQtd.Preview();
    end
    else if  CheckBoxOrdenar.Checked = True then
      begin
        FormQtdLi.RLGroup1.DataFields:='Categoria';
        FormQtdLi.RLBand6.Visible:=True;
        FormQtdLi.ZQueryLivros.SortedFields:='Categoria';
        FormQtdLi.RLReportQtd.Preview()
      end
    else
      FormQtdLi.RLReportQtd.Preview()
  end;

end;

procedure TFormLobby.btDevolucaoClick(Sender: TObject);
begin
    if edtIDEmprestimo.Text = '' then
    begin
      ShowMessage('Nenhum livro selecionado!');
      Abort;
    end
    else

    if DateDevolucao.Date > ZQueryEmprestimo.FieldByName('Data_Devolucao').AsDateTime then
    begin
    if MessageDlg('Deseja devolver um livro atrasado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
    ZQueryEmprestimo.Close;
    ZQueryEmprestimo.SQL.Clear;
    ZQueryEmprestimo.SQL.Add('delete from Adm.tbl_emprestimos where ID_Emprestimo = ' + edtIDEmprestimo.Text);
    ZQueryEmprestimo.ExecSQL;

    ZQueryEmprestimo.Close;
    ZQueryEmprestimo.SQL.Clear;
    ZQueryEmprestimo.SQL.Add('update Adm.tbl_livro set Qtd_Livro = (Qtd_Livro + 1) where ID_Livro = (:ALivro) ');
    ZQueryEmprestimo.ParamByName('ALivro').AsInteger:=StrToInt(edtIDLivroE.Text);
    ZQueryEmprestimo.ExecSQL;
    end
    else
    Abort;
    end
    else
    begin
    ZQueryEmprestimo.Close;
    ZQueryEmprestimo.SQL.Clear;
    ZQueryEmprestimo.SQL.Add('delete from Adm.tbl_emprestimos where ID_Emprestimo = ' + edtIDEmprestimo.Text);
    ZQueryEmprestimo.ExecSQL;

    ZQueryEmprestimo.Close;
    ZQueryEmprestimo.SQL.Clear;
    ZQueryEmprestimo.SQL.Add('update Adm.tbl_livro set Qtd_Livro = (Qtd_Livro + 1) where ID_Livro = (:ALivro) ');
    ZQueryEmprestimo.ParamByName('ALivro').AsInteger:=StrToInt(edtIDLivroE.Text);
    ZQueryEmprestimo.ExecSQL;
    end;

    ZQueryLivros.Close;
    ZQueryLivros.SQL.Clear;
    ZQueryLivros.SQL.Add('select A.*, B.*, C.* from Adm.tbl_livro A inner join Adm.tbl_autores B on A.ID_Autor = B.ID_Autor inner join Adm.tbl_categorias C on A.ID_Categoria = C.ID_Categoria where A.Qtd_Livro <> 0');
    ZQueryLivros.Open;

    ZQueryEmprestimo.Close;
    ZQueryEmprestimo.SQL.Clear;
    ZQueryEmprestimo.SQL.Add('select A.*, L.*, U.* from Adm.tbl_emprestimos A inner join Adm.tbl_livro L on A.ID_Livro = L.ID_Livro inner join Adm.tbl_usuarios U on A.ID_Usuario = U.ID_Usuario where A.ID_Usuario = ' + edtIDUsuario.Text);
    ZQueryEmprestimo.Open;

    btDevolucao.Visible:=False;

    if not ZQueryLivros.EOF then
    lqtdLivros.Caption:=IntToStr(ZQueryLivros.RecordCount);

    ShowMessage('Devolução realizada!');
    end;

procedure TFormLobby.btRemoveUsuarioClick(Sender: TObject);
begin
    ZQueryUsuarios.Close;
    ZQueryUsuarios.SQL.Clear;
    ZQueryUsuarios.SQL.Add('select * from Adm.tbl_usuarios');
    ZQueryUsuarios.Open;

  if edtIDUsuarioGerenciamento.Text = '' then
  begin
  ShowMessage('Nenhum usuario selecionado!');
  Abort;
  end
  else
      ZQueryEmprestimo.Close;
      ZQueryEmprestimo.SQL.Clear;
      ZQueryEmprestimo.SQL.Add('select count(*) from  Adm.tbl_emprestimos inner join Adm.tbl_usuarios on Adm.tbl_emprestimos.ID_Usuario = tbl_usuarios.ID_Usuario where Adm.tbl_emprestimos.ID_Usuario = tbl_usuarios.ID_Usuario and tbl_emprestimos.ID_Usuario = ' + QuotedStr(edtIDUsuarioGerenciamento.Text));
      ZQueryEmprestimo.Open;

      if ZQueryEmprestimo.Fields[0].AsInteger > 0 then
    begin

      ShowMessage('Não é possivel deletar usuarios pendentes!');
      Abort;
    end
  else
    try
    ZQueryUsuarios.Close;
    ZQueryUsuarios.SQL.Clear;
    ZQueryUsuarios.SQL.Add('delete from Adm.tbl_usuarios where ID_Usuario = ' + edtIDUsuarioGerenciamento.Text);
    ZQueryUsuarios.ExecSQL;

    ShowMessage('Usuario excluido!');

    ZQueryUsuarios.Close;
    ZQueryUsuarios.SQL.Clear;
    ZQueryUsuarios.SQL.Add('select * from Adm.tbl_usuarios');
    ZQueryUsuarios.Open;

    ZQueryEmprestimo.Close;
    ZQueryEmprestimo.SQL.Clear;
    ZQueryEmprestimo.SQL.Add('select A.*, L.*, U.* from Adm.tbl_emprestimos A inner join Adm.tbl_livro L on A.ID_Livro = L.ID_Livro inner join Adm.tbl_usuarios U on A.ID_Usuario = U.ID_Usuario');
    ZQueryEmprestimo.Open;

  except
    on e:exception do
    begin
      ShowMessage('Ocorreu um erro: '+ e.Message);
    end;
  end;
end;

procedure TFormLobby.btSalvarUsuaria2Click(Sender: TObject);
begin
  if edtIDUsuarioGerenciamento.Text = '' then
  begin
    ShowMessage('Nenhum usuario selecionado!');
    Abort;
  end
  else
  if (edtUsuarioGerenciamento.Text = '') or (edtEmailGerenciamento.Text = '') or (edtSenhaGerenciamento.Text = '') then
  begin
   ShowMessage('Dados não podem ser nulos!');
   Abort;
  end
  else
    try

    ZQueryUsuarios.Close;
    ZQueryUsuarios.SQL.Clear;
    ZQueryUsuarios.SQL.Add('update Adm.tbl_usuarios set ');
    ZQueryUsuarios.SQL.Add('Nome_Usuario = ' + QuotedStr(edtUsuarioGerenciamento.Text) + ', ' );
    ZQueryUsuarios.SQL.Add('Email_Usuario = ' + QuotedStr(edtEmailGerenciamento.Text) + ', ');
    ZQueryUsuarios.SQL.Add('Senha_Usuario = ' + QuotedStr(edtSenhaGerenciamento.Text) + ', ');
    ZQueryUsuarios.SQL.Add('Nivel_Acesso = ' + QuotedStr(cbxNivelAcesso.KeyValue));
    ZQueryUsuarios.SQL.Add(' where ID_Usuario = ' + edtIDUsuarioGerenciamento.Text);
    ZQueryUsuarios.ExecSQL;

    ShowMessage('Dados salvos!');

    ZQueryUsuarios.Close;
    ZQueryUsuarios.SQL.Clear;
    ZQueryUsuarios.SQL.Add('select * from Adm.tbl_usuarios');
    ZQueryUsuarios.Open;

    edtSenhaGerenciamento.PasswordChar:='*';

  except
    on e:exception do
      begin
        ShowMessage('Ocorreu um erro: '+ e.Message);
      end;
  end;
  end;

procedure TFormLobby.sbtSairClick(Sender: TObject);
begin
  if MessageDlg('Realmente deseja sair?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  FormLogin.Show;
  FormLogin.edtUsuario.SetFocus;
  ZQueryLivros.Free;
  ZQueryEmprestimo.Free;
  ZQueryAcesso.Free;
  ZQueryAutores.Free;
  ZQueryCategorias.Free;
  ZQueryUsuarios.Free;
  Close;
  end
  else
  Abort;

end;

procedure TFormLobby.TimerLobbyTimer(Sender: TObject);
begin
  lHour.Caption:=TimeToStr(Time);
end;

procedure TFormLobby.FiltroLivro(DataSet: TDataSet; var Accept: Boolean);
var
  NameFilter : Boolean;
  sNome : String;
begin
  Accept := True;
  if Trim(edtSearchLivros.Text) <> '' then
  begin
    sNome := ZQueryLivros.FieldByName('Nome_Livro').AsString;
    NameFilter := Pos(LowerCase(edtSearchLivros.Text), LowerCase(sNome)) > 0;
    Accept := Accept and NameFilter;
  end;
end;

procedure TFormLobby.FiltroCat(DataSet: TDataSet; var Accept: Boolean);
var
  NameFilter : Boolean;
  sNome : String;
begin
  Accept := True;
  if Trim(edtSearchCat.Text) <> '' then
  begin
    sNome := ZQueryCategorias.FieldByName('Categoria').AsString;
    NameFilter := Pos(LowerCase(edtSearchCat.Text), LowerCase(sNome)) > 0;
    Accept := Accept and NameFilter;
  end;
end;

procedure TFormLobby.FiltroAutor(DataSet: TDataSet; var Accept: Boolean);
var
  NameFilter : Boolean;
  sNome : String;
begin
  Accept := True;
  if Trim(edtSearchAutor.Text) <> '' then
  begin
    sNome := ZQueryAutores.FieldByName('Nome_Autor').AsString;
    NameFilter := Pos(LowerCase(edtSearchAutor.Text), LowerCase(sNome)) > 0;
    Accept := Accept and NameFilter;
  end;
end;

procedure TFormLobby.ApplyFiltroLivro;
begin
  ZQueryLivros.Filtered := False;
  ZQueryLivros.OnFilterRecord := @FiltroLivro;
  ZQueryLivros.FilterOptions := [foCaseInsensitive];
  ZQueryLivros.Filtered := True;
end;

procedure TFormLobby.ApplyFiltroCat;
begin
  ZQueryCategorias.Filtered := False;
  ZQueryCategorias.OnFilterRecord := @FiltroCat;
  ZQueryCategorias.FilterOptions := [foCaseInsensitive];
  ZQueryCategorias.Filtered := True;
end;

procedure TFormLobby.ApplyFiltroAutor;
begin
  ZQueryAutores.Filtered := False;
  ZQueryAutores.OnFilterRecord := @FiltroAutor;
  ZQueryAutores.FilterOptions := [foCaseInsensitive];
  ZQueryAutores.Filtered := True;
end;

end.

