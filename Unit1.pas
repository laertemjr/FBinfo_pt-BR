unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IBX.IBDatabaseInfo, Vcl.StdCtrls,
  Data.DB, IBX.IBDatabase, StrUtils; // StrUtils para poder usar funções string

type
  TForm1 = class(TForm)
    IBDatabaseInfo1: TIBDatabaseInfo;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    IBDatabase1: TIBDatabase;
    Label1: TLabel;
    Label2: TLabel;
    lblFBserver: TLabel;
    Label3: TLabel;
    lbODS: TLabel;
    Label4: TLabel;
    lbFBv: TLabel;
    lblPorta: TLabel;
    lblPS: TLabel;
    Label5: TLabel;
    lblDialetoSQL: TLabel;
    edtBD: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure limpar();
  private
    { Private declarations }
    const porta:array[0..3] of string = ('3040','3030','3025', '3015');
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ Conexões Firebird e bancos de dados:
• Servidor Firebird 5.0: porta 3055
•	Servidor Firebird 4.0: porta 3040
•	Servidor Firebird 3.0: porta 3030
•	Servidor Firebird 2.5: porta 3025, compatível com as versões 2.1, 2.0
•	Servidor Firebird 1.5: porta 3015, compatível com a versão 1.0
}
procedure TForm1.Button1Click(Sender: TObject);
var
  i:integer;
  s:string;
begin
  limpar;
  OpenDialog1.Filter := 'Bancos de Dados Firebird|*.GDB;*.FDB;';
  if OpenDialog1.Execute then
  begin
    for i:= 0 to High(porta) do
    begin
    try
      edtBD.Text := OpenDialog1.FileName;
      s := UpperCase(RightStr(edtBD.Text,3));
      if (s <> 'FDB') AND (s <> 'GDB')then
      begin
        ShowMessage('Não é um banco de dados Firebird.');
        edtBD.Text := EmptyStr;
        Break;
      end;
      // Configura a conexão com o BD através do IBDatabase
      IBDatabaseInfo1.Database := IBDatabase1;
      IBDatabase1.DatabaseName := '127.0.0.1/' + porta[i] + ':' + edtBD.Text;
      IBDatabase1.LoginPrompt := False;
      IBDatabase1.Params.Add('user_name=SYSDBA');
      IBDatabase1.Params.Add('password=masterkey');
      IBDatabase1.SQLDialect := 3;
      IBDatabase1.Connected := True;
      lblFBserver.Caption := IBDatabaseInfo1.Version;
      lbODS.Caption := IntToStr(IBDatabaseInfo1.ODSMajorVersion) + '.' + IntToStr(IBDatabaseInfo1.ODSMinorVersion);
      lblPorta.Caption := 'Porta: ' + porta[i];
      lblPS.Caption := 'Page Size: ' + IntToStr(IBDatabaseInfo1.PageSize) + ' bytes';
      lblDialetoSQL.Caption := 'Dialeto SQL: ' + IntToStr(IBDatabaseInfo1.DBSQLDialect);
      // Identifica a versão Firebird com base na ODS
     case IBDatabaseInfo1.ODSMajorVersion of
        13:
        begin
          case IBDatabaseInfo1.ODSMinorVersion of
            //1: lbFBv.Caption := 'Firebird 5.0';
            0: lbFBv.Caption := 'Firebird 4.0';
            else lbFBv.Caption := 'Firebird versão desconhecida';
          end;
        end;

        12: lbFBv.Caption := 'Firebird 3.0';

        11:
        begin
          case IBDatabaseInfo1.ODSMinorVersion of
            2: lbFBv.Caption := 'Firebird 2.5';
            1: lbFBv.Caption := 'Firebird 2.1';
            0: lbFBv.Caption := 'Firebird 2.0';
            else lbFBv.Caption := 'Firebird versão desconhecida';
          end;
        end;

        10:
        begin
          case IBDatabaseInfo1.ODSMinorVersion of
            1: lbFBv.Caption := 'Firebird 1.5';
            0: lbFBv.Caption := 'Firebird 1.0';
            else lbFBv.Caption := 'Firebird versão desconhecida';
          end;
        end;

        else lbFBv.Caption := 'Firebird versão desconhecida';
      end;
      IBDatabase1.Connected := False;
      Break;
    except
      if i = High(porta) then
      begin
        ShowMessage('Não foi possível a conexão com o banco de dados');
        limpar;
      end;
      continue;
    end;
    end;
  end
  else
  begin
    edtBD.Text := EmptyStr;
    OpenDialog1.FileName := EmptyStr;
  end;
end;

procedure TForm1.limpar;
begin
   edtBD.Text := EmptyStr;
   lblFBserver.Caption := EmptyStr;
   lbODS.Caption := EmptyStr;
   lbFBv.Caption := EmptyStr;
   lblPorta.Caption := EmptyStr;
   lblPS.Caption := EmptyStr;
   lblDialetoSQL.Caption := EmptyStr;
end;

end.
