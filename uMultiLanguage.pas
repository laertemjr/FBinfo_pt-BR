unit uMultiLanguage;

interface

// uses

//type

   procedure ptBR();
   procedure en();
// private


// public
// end;

// var

implementation

uses
   uFBInfo;

procedure ptBR();
begin
   frmFBInfo.Caption := 'FBINFO - Identifica o banco de dados Firebird (compat�vel com as vers�es 1.x - 4.x)';
   frmFBInfo.btnBrowse.Caption := '&Procurar';
   frmFBInfo.btnCancel.Caption := '&Cancelar';

   if frmFBInfo.btnEdit.Caption = '&Edit' then
      frmFBInfo.btnEdit.Caption := '&Alterar'
   else if frmFBInfo.btnEdit.Caption = '&Save' then
      frmFBInfo.btnEdit.Caption := '&Gravar';

   frmFBInfo.Label6.Caption := 'Selecione o banco de dados Firebird :';
   frmFBInfo.Label1.Caption := 'Banco de dados: ';
   frmFBInfo.Label2.Caption := 'Vers�o do servidor Firebird que o banco de dados est� conectado :';
   frmFBInfo.Label3.Caption := 'Vers�o ODS do banco de dados :';
   frmFBInfo.Label4.Caption := 'Vers�o do banco de dados Firebird :';
   frmFBInfo.Label5.Caption := 'Outras informa��es :';
   frmFBInfo.Label8.Caption := 'Configura��o das portas dos servidores Firebird :';
   frmFBInfo.Label7.Caption := 'Desenvolvido em Delphi 12.1, componentes IBX, vers�o 0.3 (2025)';
   frmFBInfo.OpenDialog1.Filter := 'Bancos de dados Firebird|*.GDB;*.FDB;';
   strngs[0] := 'N�o � um banco de dados Firebird.';
   strngs[1] := 'Firebird vers�o desconhecida.';
   strngs[2] := 'N�o foi poss�vel a conex�o com o banco de dados';
   strngs[3] := '&Gravar';
   strngs[4] := '&Alterar';
end;

procedure en();
begin
   frmFBInfo.Caption := 'FBINFO - Identifies the Firebird database (compatible with versions 1.x - 4.x)';
   frmFBInfo.btnBrowse.Caption := '&Browse';
   frmFBInfo.btnCancel.Caption := '&Cancel';

   if frmFBInfo.btnEdit.Caption = '&Alterar' then
      frmFBInfo.btnEdit.Caption := '&Edit'
   else if frmFBInfo.btnEdit.Caption = '&Gravar' then
      frmFBInfo.btnEdit.Caption := '&Save';

   frmFBInfo.Label6.Caption := 'Select Firebird database :';
   frmFBInfo.Label1.Caption := 'Database: ';
   frmFBInfo.Label2.Caption := 'Firebird server version that the database is connected to :';
   frmFBInfo.Label3.Caption := 'ODS version of the database :';
   frmFBInfo.Label4.Caption := 'Firebird Database Version :';
   frmFBInfo.Label5.Caption := 'Other information :';
   frmFBInfo.Label8.Caption := 'Firebird server port configuration :';
   frmFBInfo.Label7.Caption := 'Developed in Delphi 12.1, IBX components, version 0.3 (2025)';
   frmFBInfo.OpenDialog1.Filter := 'Firebird databases|*.GDB;*.FDB;';
   strngs[0] := 'It is not a Firebird database.';
   strngs[1] := 'Firebird unknown version.';
   strngs[2] := 'Unable to connect to database';
   strngs[3] := '&Save';
   strngs[4] := '&Edit';
end;

end.
