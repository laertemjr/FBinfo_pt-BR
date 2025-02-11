unit uFBInfo;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IBX.IBDatabaseInfo, Vcl.StdCtrls,
   Data.DB, IBX.IBDatabase, StrUtils, Vcl.ExtCtrls, System.IniFiles,
   System.ImageList, Vcl.ImgList, Vcl.Buttons;

type
   TfrmFBInfo = class(TForm)
      IBDatabaseInfo1: TIBDatabaseInfo;
      OpenDialog1: TOpenDialog;
      btnBrowse: TButton;
      IBDatabase1: TIBDatabase;
      Label1: TLabel;
      Label2: TLabel;
      lblFBserver: TLabel;
      Label3: TLabel;
      lblODS: TLabel;
      Label4: TLabel;
      lblFBv: TLabel;
      lblPort: TLabel;
      lblPS: TLabel;
      Label5: TLabel;
      lblSqlDialect: TLabel;
      edtBD: TEdit;
      Label6: TLabel;
      Label7: TLabel;
      Panel1: TPanel;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      edtFB15: TEdit;
      edtFB25: TEdit;
      Label11: TLabel;
      Label12: TLabel;
      btnEdit: TButton;
      btnCancel: TButton;
      edtFB30: TEdit;
      edtFB40: TEdit;
      ImageList1: TImageList;
      btn_ptBR: TSpeedButton;
      btn_en: TSpeedButton;
      procedure btnBrowseClick(Sender: TObject);
      procedure clean();
      procedure SetIniValue(pLocal, pSession, pSubSession, pValue:string);
      function GetIniValue(pLocal, PSession, pSubSession:string):string;
      procedure FormActivate(Sender: TObject);
      procedure btnEditClick(Sender: TObject);
      procedure btnCancelClick(Sender: TObject);
      procedure loadConfigINI();
      procedure EdtReadOnly(state:Boolean);
      procedure btn_ptBRClick(Sender: TObject);
      procedure btn_enClick(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   frmFBInfo: TfrmFBInfo;
   iniconf: TIniFile;
   port: array[0..3] of string = ('','','','');
   SoEdt: Boolean;
   strngs: array[0..4] of string = ('','','','','');

implementation

uses
   uMultiLanguage;

{$R *.dfm}

{ Suggested port configuration for Firebird servers:
•	Firebird 4.0 server: port 3040
•	Firebird 3.0 server: port 3030
•	Firebird 2.5 server: port 3025, compatible with versions 2.1, 2.0
•	Firebird 1.5 server: port 3015, compatible with the version 1.0
}

procedure TfrmFBInfo.FormActivate(Sender: TObject);
begin
   clean;
   iniconf := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
   loadConfigINI;
   EdtReadOnly(True);
   ptBR;
end;

procedure TfrmFBInfo.btnBrowseClick(Sender: TObject);
var
  i:integer;
  s:string;
begin

  clean;

  if OpenDialog1.Execute then
  begin
    for i:= 0 to High(port) do
    begin
       try
         edtBD.Text := OpenDialog1.FileName;
         s := UpperCase(RightStr(edtBD.Text,3));
         if (s <> 'FDB') AND (s <> 'GDB')then
         begin
           ShowMessage(strngs[0]); // 'It is not a Firebird database.'
           edtBD.Text := EmptyStr;
           Break;
         end;

         // Configures connection to the DB through IBDatabase
         Screen.Cursor := crHourGlass;
         IBDatabaseInfo1.Database := IBDatabase1;
         IBDatabase1.DatabaseName := '127.0.0.1/' + port[i] + ':' + edtBD.Text;
         IBDatabase1.LoginPrompt := False;

         IBDatabase1.Params.Add('user_name=SYSDBA');
         IBDatabase1.Params.Add('password=masterkey');
         IBDatabase1.Connected := True;

         lblFBserver.Caption := IBDatabaseInfo1.Version;
         lblODS.Caption := IntToStr(IBDatabaseInfo1.ODSMajorVersion) + '.' + IntToStr(IBDatabaseInfo1.ODSMinorVersion);
         lblPort.Caption := 'Port: ' + port[i];
         lblPS.Caption := 'Page Size: ' + IntToStr(IBDatabaseInfo1.PageSize) + ' bytes';
         lblSqlDialect.Caption := 'SQL Dialect: ' + IntToStr(IBDatabaseInfo1.DBSQLDialect);

         // Identifies Firebird version based on ODS
         case IBDatabaseInfo1.ODSMajorVersion of
           13:
           begin
             case IBDatabaseInfo1.ODSMinorVersion of
               //1: lbFBv.Caption := 'Firebird 5.0';
               0: lblFBv.Caption := 'Firebird 4.0';
             end;
           end;

           12: lblFBv.Caption := 'Firebird 3.0';

           11:
           begin
             case IBDatabaseInfo1.ODSMinorVersion of
               2: lblFBv.Caption := 'Firebird 2.5';
               1: lblFBv.Caption := 'Firebird 2.1';
               0: lblFBv.Caption := 'Firebird 2.0';
             end;
           end;

           10:
           begin
             case IBDatabaseInfo1.ODSMinorVersion of
               1: lblFBv.Caption := 'Firebird 1.5';
               0: lblFBv.Caption := 'Firebird 1.0';
             end;
           end;

           else lblFBv.Caption := strngs[1]; // 'Firebird unknown version.'
         end;
         IBDatabase1.Connected := False;
         Screen.Cursor := crDefault;
         Break;
       except
         if i = High(port) then
         begin
           ShowMessage(strngs[2]); // 'Unable to connect to database'
           Screen.Cursor := crDefault;
           clean;
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

procedure TfrmFBInfo.btnEditClick(Sender: TObject);
begin
   if btnEdit.Caption = strngs[3] then // &Save
   begin
      iniconf.WriteString('Port','FB15',edtFB15.Text);
      iniconf.WriteString('Port','FB25',edtFB25.Text);
      iniconf.WriteString('Port','FB30',edtFB30.Text);
      iniconf.WriteString('Port','FB40',edtFB40.Text);
      btnCancel.Enabled := False;
      btnEdit.Caption := strngs[4]; // Edit
      EdtReadOnly(True);
      loadConfigINI;
      Exit;
   end;

   btnEdit.Caption   := strngs[3]; // &Save
   btnCancel.Enabled := True;
   EdtReadOnly(False);
end;

procedure TfrmFBInfo.btnCancelClick(Sender: TObject);
begin
   loadConfigINI;
   btnCancel.Enabled := False;
   btnEdit.Caption := strngs[4]; // Edit
   EdtReadOnly(True);
end;

procedure TfrmFBInfo.clean;
begin
   OpenDialog1.FileName := EmptyStr;
   edtBD.Text := EmptyStr;
   lblFBserver.Caption := EmptyStr;
   lblODS.Caption := EmptyStr;
   lblFBv.Caption := EmptyStr;
   lblPort.Caption := EmptyStr;
   lblPS.Caption := EmptyStr;
   lblSqlDialect.Caption := EmptyStr;
end;

procedure TfrmFBInfo.SetIniValue(pLocal, pSession, pSubSession, pValue:string);
var vArquivo:TIniFile;
begin
   vArquivo:=TIniFile.Create(pLocal);
   vArquivo.WriteString(pSession, pSubSession, pValue);
   vArquivo.Free;
end;

function TfrmFBInfo.GetIniValue(pLocal, PSession, pSubSession:string):string;
var vArquivo:TIniFile;
begin
   vArquivo:=TIniFile.Create(plocal);
   Result:=vArquivo.ReadString(pSession, pSubSession, '');
   vArquivo.Free;
end;

procedure TfrmFBInfo.loadConfigINI;
begin
   edtFB15.Text := iniconf.ReadString('Port','FB15','');
   port[3] := edtFB15.Text;

   edtFB25.Text := iniconf.ReadString('Port','FB25','');
   port[2] := edtFB25.Text;

   edtFB30.Text := iniconf.ReadString('Port','FB30','');
   port[1] := edtFB30.Text;

   edtFB40.Text := iniconf.ReadString('Port','FB40','');
   port[0] := edtFB40.Text;
end;

procedure TfrmFBInfo.EdtReadOnly(state: Boolean);
begin
   edtFB15.ReadOnly := state;
   edtFB25.ReadOnly := state;
   edtFB30.ReadOnly := state;
   edtFB40.ReadOnly := state;
end;

procedure TfrmFBInfo.btn_enClick(Sender: TObject);
begin
   en;
end;

procedure TfrmFBInfo.btn_ptBRClick(Sender: TObject);
begin
   ptBR;
end;

end.
