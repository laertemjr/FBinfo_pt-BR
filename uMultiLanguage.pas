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
   With frmFBInfo do
   begin
      Caption := 'FBINFO - Identifica o banco de dados Firebird (compat�vel com as vers�es 1.x - 4.x)';
      btnBrowse.Caption := '&Procurar';
      btnCancel.Caption := '&Cancelar';

      if btnEdit.Caption = '&Edit' then
         btnEdit.Caption := '&Alterar'
      else if btnEdit.Caption = '&Save' then
         btnEdit.Caption := '&Gravar';

      Label6.Caption := 'Selecione o banco de dados Firebird :';
      Label1.Caption := 'Banco de dados: ';
      Label2.Caption := 'Vers�o do servidor Firebird que o banco de dados est� conectado :';
      Label3.Caption := 'Vers�o ODS do banco de dados :';
      Label4.Caption := 'Vers�o do banco de dados Firebird :';
      Label5.Caption := 'Outras informa��es :';
      Label8.Caption := 'Configura��o das portas dos servidores Firebird :';
      Label7.Caption := 'Desenvolvido em Delphi 12.1, componentes IBX, vers�o 0.3 (2025)';
      OpenDialog1.Filter := 'Bancos de dados Firebird|*.GDB;*.FDB;';
   end;

   strngs[0] := 'N�o � um banco de dados Firebird.';
   strngs[1] := 'Firebird vers�o desconhecida.';
   strngs[2] := 'N�o foi poss�vel a conex�o com o banco de dados';
   strngs[3] := '&Gravar';
   strngs[4] := '&Alterar';
end;

procedure en();
begin
   with frmFBInfo do
   begin
      Caption := 'FBINFO - Identifies the Firebird database (compatible with versions 1.x - 4.x)';
      btnBrowse.Caption := '&Browse';
      btnCancel.Caption := '&Cancel';

      if btnEdit.Caption = '&Alterar' then
         btnEdit.Caption := '&Edit'
      else if btnEdit.Caption = '&Gravar' then
         btnEdit.Caption := '&Save';

      Label6.Caption := 'Select Firebird database :';
      Label1.Caption := 'Database: ';
      Label2.Caption := 'Firebird server version that the database is connected to :';
      Label3.Caption := 'ODS version of the database :';
      Label4.Caption := 'Firebird Database Version :';
      Label5.Caption := 'Other information :';
      Label8.Caption := 'Firebird server port configuration :';
      Label7.Caption := 'Developed in Delphi 12.1, IBX components, version 0.3 (2025)';
      OpenDialog1.Filter := 'Firebird databases|*.GDB;*.FDB;';
   end;

   strngs[0] := 'It is not a Firebird database.';
   strngs[1] := 'Firebird unknown version.';
   strngs[2] := 'Unable to connect to database';
   strngs[3] := '&Save';
   strngs[4] := '&Edit';
end;

end.
