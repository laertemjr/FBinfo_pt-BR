program FBinfo;

uses
  Vcl.Forms,
  uFBInfo in 'uFBInfo.pas' {frmFBInfo},
  uMultiLanguage in 'uMultiLanguage.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFBInfo, frmFBInfo);
  Application.Run;
end.
