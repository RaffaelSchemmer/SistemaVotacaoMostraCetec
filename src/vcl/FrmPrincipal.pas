unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  System.Generics.Collections, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Timer1: TTimer;
    IdHTTP1: TIdHTTP;
    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel13Click(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure criaTrabalhos(min: Integer; max: Integer; panelo: TPanel;
      area: Integer);
    procedure Votacao(Sender: TObject);

    procedure ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  listavotacao: TStringList;
  trabalhos: TStringList;
  listaareas: TStringList;
  listatrabalhos: TObjectList<TPanel>;
  I: Integer;
  panel: TPanel;
  ScrollBox1: TScrollBox;

implementation

{$R *.dfm}

procedure TForm1.criaTrabalhos(min, max: Integer; panelo: TPanel;
  area: Integer);
begin

  ScrollBox1 := TScrollBox.Create(Self);
  with ScrollBox1 do
  begin
    Parent := Form1;
    ParentColor := True;
    Align := AlClient;
    AutoScroll := True;
    VertScrollBar.Smooth := True;
    Color := panelo.Color;
  end;

  ScrollBox1.onMouseWheelDown := ScrollBox1MouseWheelDown;
  ScrollBox1.onMouseWheelUp := ScrollBox1MouseWheelUp;

  ScrollBox1.Align := AlClient;
  ScrollBox1.Visible := True;
  for I := min to max do
  begin

    panel := TPanel.Create(ScrollBox1);
    with panel do
    begin
      Parent := ScrollBox1;
      ParentColor := True;
      Align := alTop;
      Height := 300;
      BorderWidth := 1;
      Font.Quality := fqClearTypeNatural;
      Font.Name := 'PMingLiU-Ext';
      Font.Height := -27;
      Font.Color := clMenuHighlight;
      caption := trabalhos[I - 1];
      Hint := inttostr(area) + ':' + inttostr(I - 1);
      onClick := Votacao;

    end;

  end;
  panel := TPanel.Create(ScrollBox1);
  with panel do
  begin
    Parent := ScrollBox1;
    ParentColor := True;
    Align := alTop;
    Height := 300;
    BorderWidth := 1;
    Font.Quality := fqClearTypeNatural;
    Font.Name := 'PMingLiU-Ext';

    Font.Height := -37;
    Font.Color := clBlue;
    caption := listaareas[area - 1];
    Hint := '-1:-1';
    onClick := Votacao;

  end;

  GridPanel1.Visible := False;
end;

procedure TForm1.Votacao(Sender: TObject);
var
  tupla: String;
  pos: Integer;
  lURL: String;
  lResponse: TStringStream;
  lista: TStringList;
  Parte: TStringList;
begin

  tupla := (Sender as TPanel).Hint;
  Parte := TStringList.Create;

  Parte.Delimiter := ':';
  Parte.DelimitedText := tupla;

  pos := strtoint(Parte[1]);
  if pos <> -1 then
  begin
    listavotacao[pos] := inttostr(strtoint(listavotacao[pos]) + 1);
    lResponse := TStringStream.Create('');
    lista := TStringList.Create();
    try
      lURL := 'http://35.199.122.71/insereVoto.php?nmusuario=admin' +
        '&nmsenha=123' + '&nmarea=' + Parte[0];
      IdHTTP1.Get(lURL, lResponse);
      lResponse.Position := 0;
      lista.LoadFromStream(lResponse);
    finally
      lResponse.Free();
    end;

  end;

  ScrollBox1.Destroy;
  GridPanel1.Visible := True;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  listavotacao := TStringList.Create();
  listavotacao.LoadFromFile('mostra.txt');
  trabalhos := TStringList.Create();
  trabalhos.LoadFromFile('trabalhos.txt', TEncoding.UTF8);
  listaareas := TStringList.Create();
  listaareas.LoadFromFile('areas.txt');

  Timer1.Enabled := True;

end;

procedure TForm1.Panel11Click(Sender: TObject);
begin

  // 92 até 96
  criaTrabalhos(92, 96, Panel11, 9);

end;

procedure TForm1.Panel12Click(Sender: TObject);
begin
  // 97 até 103
  criaTrabalhos(97, 103, Panel12, 10);
end;

procedure TForm1.Panel13Click(Sender: TObject);
begin
  // 104 até 117
  criaTrabalhos(104, 117, Panel13, 11);
end;

procedure TForm1.Panel14Click(Sender: TObject);
begin
  // 118 até 126
  criaTrabalhos(118, 126, Panel14, 12);
end;

procedure TForm1.Panel15Click(Sender: TObject);
begin
  // 127 até 147
  criaTrabalhos(127, 147, Panel15, 13);
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin
  // 1 até 18
  criaTrabalhos(1, 18, Panel1, 1);
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin
  // 19 até 20
  criaTrabalhos(19, 20, Panel2, 2);
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
  // 21 até 36
  criaTrabalhos(21, 36, Panel3, 3);
end;

procedure TForm1.Panel4Click(Sender: TObject);
begin
  // 37 até 42
  criaTrabalhos(37, 42, Panel4, 4);
end;

procedure TForm1.Panel5Click(Sender: TObject);
begin
  // 43 até 47
  criaTrabalhos(43, 47, Panel5, 5);
end;

procedure TForm1.Panel7Click(Sender: TObject);
begin
  ScrollBox1.Visible := True;
  // 48 até 86
  criaTrabalhos(48, 86, Panel7, 6);
end;

procedure TForm1.Panel8Click(Sender: TObject);
begin
  ScrollBox1.Visible := True;
  // 87 até 89
  criaTrabalhos(87, 89, panel, 7);
end;

procedure TForm1.Panel9Click(Sender: TObject);
begin
  ScrollBox1.Visible := True;
  // 90 até 91
  criaTrabalhos(90, 91, Panel9, 8);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  listavotacao.SaveToFile('mostra.txt');
end;

procedure TForm1.ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  With ScrollBox1.VertScrollBar Do
  Begin
    If (ScrollBox1.VertScrollBar.Position <= (ScrollBox1.VertScrollBar.Range -
      ScrollBox1.VertScrollBar.Increment)) Then
    begin
      ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position +
        ScrollBox1.VertScrollBar.Increment
    end
    Else
    begin
      ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Range -
        ScrollBox1.VertScrollBar.Increment;
    end;
  End;
end;

procedure TForm1.ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  With ScrollBox1.VertScrollBar Do
  Begin
    If (ScrollBox1.VertScrollBar.Position >=
      ScrollBox1.VertScrollBar.Increment) Then
    begin
      ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position -
        ScrollBox1.VertScrollBar.Increment
    end
    Else
    begin
      ScrollBox1.VertScrollBar.Position := 0;
    end;
  End;
end;

end.
