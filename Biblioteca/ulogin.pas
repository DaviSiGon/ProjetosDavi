unit uLogin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids, ZDataset, ZConnection, uLobby;

type

  { TFormLogin }

  TFormLogin = class(TForm)
    btLogin: TSpeedButton;
    btRegistrar: TSpeedButton;
    btRegistro: TSpeedButton;
    btVoltar: TSpeedButton;
    DataSourceLogin: TDataSource;
    edtEmail: TLabeledEdit;
    edtSenha: TLabeledEdit;
    edtSenhaReg: TLabeledEdit;
    edtUsuario: TLabeledEdit;
    edtUsuarioReg: TLabeledEdit;
    FadeIn: TTimer;
    FadeOut: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    ZConnectionLogin: TZConnection;
    ZQueryLogin: TZQuery;
    procedure btLoginClick(Sender: TObject);
    procedure btRegistrarClick(Sender: TObject);
    procedure btRegistroClick(Sender: TObject);
    procedure btVoltarClick(Sender: TObject);
    procedure edtEmailChange(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: char);
    procedure FadeInTimer(Sender: TObject);
    procedure FadeOutTimer(Sender: TObject);
  private

  public
    var
       Nivel_Acesso : integer;
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.lfm}

{ TFormLogin }

procedure TFormLogin.FadeInTimer(Sender: TObject);
begin

    FormLogin.Width := FormLogin.Width + 5;
  FadeIn.Enabled := not (FormLogin.Width = 650);
  if FormLogin.Width > 649 then
  begin
   FadeIn.Enabled := False;
  end;

end;

procedure TFormLogin.btRegistrarClick(Sender: TObject);
begin

    if btRegistrar.Tag = 0 then
  begin
   btRegistrar.Tag:=1;
   FadeIn.Enabled:=True;
  end
    else
      begin
        btRegistrar.Tag:=0;
        FadeOut.Enabled:=True;
      end;

end;

procedure TFormLogin.btRegistroClick(Sender: TObject);
begin

  if (edtUsuarioReg.Text='') or (edtSenhaReg.Text='') or (edtEmail.Text='') then
    begin
        ShowMessage('Dados incompletos!');
        Abort;
    end

  else
       begin
          ZQueryLogin.Close;
          ZQueryLogin.SQL.Clear;
          ZQueryLogin.SQL.Add('select count(*) from Adm.tbl_usuarios where Email_Usuario = :AEmail');
          ZQueryLogin.ParamByName('AEmail').AsString:=edtEmail.Text;
          ZQueryLogin.Open;
         if ZQueryLogin.Fields[0].AsInteger > 0 then
         begin
           ShowMessage('Email já cadastrado!');
           edtUsuarioReg.SetFocus;
           edtSenhaReg.Clear;
           edtEmail.Clear;
           Abort;
         end
         else
            try

      begin
         ZQueryLogin.Close;
         ZQueryLogin.SQL.Clear;
         ZQueryLogin.SQL.Add('insert into Adm.tbl_usuarios');
         ZQueryLogin.SQL.Add('(Nome_Usuario, Email_Usuario, Senha_Usuario)');
         ZQueryLogin.SQL.Add('values(:ANome, :AEmail, :ASenha)');
         ZQueryLogin.ParamByName('ANome').AsString:=edtUsuarioReg.Text;
         ZQueryLogin.ParamByName('AEmail').AsString:=edtEmail.Text;
         ZQueryLogin.ParamByName('ASenha').AsString:=edtSenhaReg.Text;
         ZQueryLogin.ExecSQL;

       end;

     ShowMessage('Registrado com sucesso!');

    btRegistrar.Tag:=0;
    FadeOut.Enabled:=True;

    edtUsuario.Clear;
    edtSenha.Clear;
    edtEmail.Clear;
    edtUsuarioReg.Clear;
    edtSenhaReg.Clear;

  except
    on e:exception do
    begin
      ShowMessage('Ocorreu um erro: '+ e.Message);
    end
  end;

end;

end;

procedure TFormLogin.btLoginClick(Sender: TObject);
begin

 try
   begin
     ZQueryLogin.Close;
     ZQueryLogin.SQL.Clear;
     ZQueryLogin.SQL.Add('select * from Adm.tbl_usuarios where Nome_Usuario = :ANome and  Senha_Usuario = :ASenha');
     ZQueryLogin.ParamByName('ANome').AsString := edtUsuario.Text;
     ZQueryLogin.ParamByName('ASenha').AsString := edtSenha.Text;
     ZQueryLogin.ExecSQL;
     ZQueryLogin.Open;
     Nivel_Acesso:=ZQueryLogin.FieldByName('Nivel_Acesso').AsInteger;

     if  Nivel_Acesso = 1 then
       begin
       FormLobby:=TFormLobby.Create(Nil);
       FormLobby.sbtGerencia.Visible:=True;
       FormLobby.btAddLivro.Visible:=True;
       FormLobby.btEditLivro.Visible:=True;
       FormLobby.btRemoveLivro.Visible:=True;
       FormLobby.btAddCat.Visible:=True;
       FormLobby.btEditCat.Visible:=True;
       FormLobby.btAddAutor.Visible:=True;
       FormLobby.btEditAutor.Visible:=True;
       FormLobby.btRemovAutor.Visible:=True;
       FormLobby.btRemovCat.Visible:=True;
       FormLobby.edtNomeLivro.Enabled:=True;
       FormLobby.edtNomeAutor.Enabled:=True;
       FormLobby.edtNomeCategoria.Enabled:=True;
       FormLobby.DatePub.Enabled:=True;
       FormLobby.DateNasc.Enabled:=True;
       FormLobby.edtPrecoLivro.Enabled:=True;
       FormLobby.edtQtdLivro.Enabled:=True;
       FormLobby.cbxAutores.Enabled:=True;
       FormLobby.cbxCategorias.Enabled:=True;
       FormLobby.edtNacionalidade.Enabled:=True;

       end
     else
      begin
       FormLobby:=TFormLobby.Create(Nil);
       FormLobby.sbtGerencia.Visible:=False;
       FormLobby.btAddLivro.Visible:=False;
       FormLobby.btEditLivro.Visible:=False;
       FormLobby.btRemoveLivro.Visible:=False;
       FormLobby.btAddCat.Visible:=False;
       FormLobby.btEditCat.Visible:=False;
       FormLobby.btAddAutor.Visible:=False;
       FormLobby.btEditAutor.Visible:=False;
       FormLobby.btRemovAutor.Visible:=False;
       FormLobby.btRemovCat.Visible:=False;
       FormLobby.edtNomeLivro.Enabled:=False;
       FormLobby.edtNomeLivro.Enabled:=False;
       FormLobby.edtNomeAutor.Enabled:=False;
       FormLobby.edtNomeCategoria.Enabled:=False;
       FormLobby.DatePub.Enabled:=False;
       FormLobby.DateNasc.Enabled:=False;
       FormLobby.edtPrecoLivro.Enabled:=False;
       FormLobby.edtQtdLivro.Enabled:=False;
       FormLobby.cbxAutores.Enabled:=False;
       FormLobby.cbxCategorias.Enabled:=False;
       FormLobby.edtNacionalidade.Enabled:=False;
      end;

     if not ZQueryLogin.IsEmpty then

       begin
       FormLobby.lName.Caption:=ZQueryLogin.FieldByName('Nome_Usuario').AsString;
       FormLobby.edtEmailUsuario.Text:=ZQueryLogin.FieldByName('Email_Usuario').AsString;
       FormLobby.edtUsuario.Text:=ZQueryLogin.FieldByName('Nome_Usuario').AsString;
       FormLobby.edtSenhaUsuario.Text:=ZQueryLogin.FieldByName('Senha_Usuario').AsString;
       FormLobby.edtIDUsuario.Text:=ZQueryLogin.FieldByName('ID_Usuario').AsString;
       FormLobby.ShowModal;
     edtUsuario.Clear;
     edtSenha.Clear;
     edtEmail.Clear;
     edtUsuarioReg.Clear;
     edtSenhaReg.Clear;
       end

     else

       begin
       ShowMessage('Usuario ou senha incorretos!!');
       edtSenha.Clear;
       edtUsuario.SetFocus;
       end;
     end
  except
    on e:exception do
      begin
        ShowMessage('Ocorreu um erro: '+ e.Message);
      end
  end;

end;

procedure TFormLogin.btVoltarClick(Sender: TObject);
begin

    if btRegistrar.Tag=1 then
  begin
    btRegistrar.Tag:=0;
    FadeOut.Enabled:=True;
  end;

    edtUsuario.Clear;
    edtSenha.Clear;
    edtEmail.Clear;
    edtUsuarioReg.Clear;
    edtSenhaReg.Clear;

end;

procedure TFormLogin.edtEmailChange(Sender: TObject);
begin
  ZQueryLogin.Close;
  ZQueryLogin.SQL.Clear;
  ZQueryLogin.SQL.Add('select Email_Usuario from Adm.tbl_usuarios');
  ZQueryLogin.Open;

  if ZQueryLogin.FieldByName('Email_Usuario').AsString = edtEmail.Text  then
    begin
    ShowMessage('Email já cadastrado!');
    edtEmail.Clear;
    end
  else
  ZQueryLogin.Next;
end;

procedure TFormLogin.edtSenhaKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
    try
   begin
     ZQueryLogin.Close;
     ZQueryLogin.SQL.Clear;
     ZQueryLogin.SQL.Add('select * from Adm.tbl_usuarios where Nome_Usuario = :ANome and  Senha_Usuario = :ASenha');
     ZQueryLogin.ParamByName('ANome').AsString := edtUsuario.Text;
     ZQueryLogin.ParamByName('ASenha').AsString := edtSenha.Text;
     ZQueryLogin.ExecSQL;
     ZQueryLogin.Open;
     Nivel_Acesso:=ZQueryLogin.FieldByName('Nivel_Acesso').AsInteger;

     if  Nivel_Acesso = 1 then
       begin
       FormLobby:=TFormLobby.Create(Nil);
       FormLobby.sbtGerencia.Visible:=True;
       FormLobby.btAddLivro.Visible:=True;
       FormLobby.btEditLivro.Visible:=True;
       FormLobby.btRemoveLivro.Visible:=True;
       FormLobby.btAddCat.Visible:=True;
       FormLobby.btEditCat.Visible:=True;
       FormLobby.btAddAutor.Visible:=True;
       FormLobby.btEditAutor.Visible:=True;
       FormLobby.btRemovAutor.Visible:=True;
       FormLobby.btRemovCat.Visible:=True;
       FormLobby.edtNomeLivro.Enabled:=True;
       FormLobby.edtNomeAutor.Enabled:=True;
       FormLobby.edtNomeCategoria.Enabled:=True;
       FormLobby.DatePub.Enabled:=True;
       FormLobby.DateNasc.Enabled:=True;
       FormLobby.edtPrecoLivro.Enabled:=True;
       FormLobby.edtQtdLivro.Enabled:=True;
       FormLobby.cbxAutores.Enabled:=True;
       FormLobby.cbxCategorias.Enabled:=True;
       FormLobby.edtNacionalidade.Enabled:=True;

       end
     else
      begin
       FormLobby:=TFormLobby.Create(Nil);
       FormLobby.sbtGerencia.Visible:=False;
       FormLobby.btAddLivro.Visible:=False;
       FormLobby.btEditLivro.Visible:=False;
       FormLobby.btRemoveLivro.Visible:=False;
       FormLobby.btAddCat.Visible:=False;
       FormLobby.btEditCat.Visible:=False;
       FormLobby.btAddAutor.Visible:=False;
       FormLobby.btEditAutor.Visible:=False;
       FormLobby.btRemovAutor.Visible:=False;
       FormLobby.btRemovCat.Visible:=False;
       FormLobby.edtNomeLivro.Enabled:=False;
       FormLobby.edtNomeLivro.Enabled:=False;
       FormLobby.edtNomeAutor.Enabled:=False;
       FormLobby.edtNomeCategoria.Enabled:=False;
       FormLobby.DatePub.Enabled:=False;
       FormLobby.DateNasc.Enabled:=False;
       FormLobby.edtPrecoLivro.Enabled:=False;
       FormLobby.edtQtdLivro.Enabled:=False;
       FormLobby.cbxAutores.Enabled:=False;
       FormLobby.cbxCategorias.Enabled:=False;
       FormLobby.edtNacionalidade.Enabled:=False;
      end;

     if not ZQueryLogin.IsEmpty then

       begin
       FormLobby.lName.Caption:=ZQueryLogin.FieldByName('Nome_Usuario').AsString;
       FormLobby.edtEmailUsuario.Text:=ZQueryLogin.FieldByName('Email_Usuario').AsString;
       FormLobby.edtUsuario.Text:=ZQueryLogin.FieldByName('Nome_Usuario').AsString;
       FormLobby.edtSenhaUsuario.Text:=ZQueryLogin.FieldByName('Senha_Usuario').AsString;
       FormLobby.edtIDUsuario.Text:=ZQueryLogin.FieldByName('ID_Usuario').AsString;
       FormLobby.ShowModal;

     edtUsuario.Clear;
     edtSenha.Clear;
     edtEmail.Clear;
     edtUsuarioReg.Clear;
     edtSenhaReg.Clear;

     end

     else

       begin
       ShowMessage('Usuario ou senha incorretos!!');
       edtSenha.Clear;
       edtUsuario.SetFocus;
       end;
     end
  except
    on e:exception do
      begin
        ShowMessage('Ocorreu um erro: '+ e.Message);
      end
  end;

end;

procedure TFormLogin.FadeOutTimer(Sender: TObject);
begin
    FormLogin.Width := FormLogin.Width - 5;
  FadeOut.Enabled := not (FormLogin.Width = 320);
  if FormLogin.Width < 319 then
  begin
   FadeOut.Enabled := False;
  end;
end;

end.

