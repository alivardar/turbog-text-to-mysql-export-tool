unit MainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtDlgs, DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, ZAbstractConnection, ZConnection, DBCtrls;

type
  TMainForm = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button2: TButton;
    Label7: TLabel;
    Label8: TLabel;
    OpenTextFileDialog1: TOpenTextFileDialog;
    ZConnection1: TZConnection;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit5: TEdit;
    Button3: TButton;
    Button4: TButton;
    ZTable1: TZTable;
    Label9: TLabel;
    Label10: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ZConnection1AfterConnect(Sender: TObject);
    procedure ZConnection1AfterDisconnect(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.Button1Click(Sender: TObject);
begin
ZConnection1.Connected:=False;
Application.Terminate;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
try
ZConnection1.Connected:=False;
ZConnection1.Hostname:=Edit1.Text;
ZConnection1.User:=Edit2.Text;
ZConnection1.Password:=Edit3.Text;
ZConnection1.Database:=Edit4.Text;
ZConnection1.Connected:=True;

ZReadOnlyQuery1.Active:=False;
ZReadOnlyQuery1.SQL.Clear;
ZReadOnlyQuery1.SQL.Add('show tables;');
ZReadOnlyQuery1.Active:=True;
ZReadOnlyQuery1.First;
ComboBox1.Items.Clear;
While Not ZReadOnlyQuery1.Eof Do
begin
ComboBox1.Items.Add( ZReadOnlyQuery1.Fields[0].AsString);
ZReadOnlyQuery1.Next;
End;

except
  Showmessage('Check your connection settings!');
  Exit;
end;



end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  OpenTextFileDialog1.Options := [ofAllowMultiSelect];
  if OpenTextFileDialog1.Execute  then Edit5.Text:=OpenTextFileDialog1.FileName;
end;

procedure TMainForm.Button4Click(Sender: TObject);
var
i : Integer;
dosya:TextFile;
okunan:String;
begin

if MessageDlg('Are you sure?',mtWarning, mbOKCancel, 0) = mrCancel then exit;

ZTable1.Active:=False;
ZTable1.TableName:=ComboBox1.Text;
ZTable1.Active:=True;

  // Display the selected file names
    for i := 0 to OpenTextFileDialog1.Files.Count-1 do
    begin
      AssignFile (dosya, OpenTextFileDialog1.Files[i] );
      reset(dosya);
      repeat
      ReadLn(dosya, okunan);
      try
       ZTable1.Append;
       ZTable1.FieldByName(Combobox2.Text).AsString:=okunan;
       ZTable1.Post;
        except
         ShowMessage('Please control your database settings or connections!');
         Exit;
       end;
       until eof(dosya);
    end;

end;

procedure TMainForm.ComboBox1Change(Sender: TObject);
begin
ZReadOnlyQuery1.Active:=False;
ZReadOnlyQuery1.SQL.Clear;
ZReadOnlyQuery1.SQL.Append('select COLUMN_NAME '+
' from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '''+
Combobox1.Text +'''; ');
ZReadOnlyQuery1.Active:=True;
ZReadOnlyQuery1.First;
ComboBox2.Items.Clear;
While Not ZReadOnlyQuery1.Eof Do
begin
ComboBox2.Items.Add( ZReadOnlyQuery1.Fields[0].AsString);
ZReadOnlyQuery1.Next;
End;


end;

procedure TMainForm.ZConnection1AfterConnect(Sender: TObject);
begin
  Label8.Caption:='Connected';
end;

procedure TMainForm.ZConnection1AfterDisconnect(Sender: TObject);
begin
  Label8.Caption:='Disconnected';
end;

end.
