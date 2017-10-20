unit Assignment2u;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ActnList, Spin, ExtCtrls;

type

  { TAssignment2_PetShop }

  TAssignment2_PetShop = class(TForm)
    bntNewReport: TButton;
    btnAddNew: TButton;
    btnDelete: TButton;
    btnReplace: TButton;
    btnStep4: TButton;
    btnEnd: TButton;
    edtProducts: TEdit;
    grpSelectProduct: TGroupBox;
    grpNumberofCrates: TGroupBox;
    grpNumberofItems: TGroupBox;
    grpProductMaintainance: TGroupBox;
    Image1: TImage;
    lblProduct: TLabel;
    lblRepeat: TLabel;
    lblStep3: TLabel;
    lblStep2: TLabel;
    lblStep1: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    sedItems: TSpinEdit;
    sedCrates: TSpinEdit;
    procedure bntNewReportClick(Sender: TObject);
    procedure btnAddNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEndClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure btnStep4Click(Sender: TObject);
    procedure edtProductsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grpSelectProductClick(Sender: TObject);
    procedure lblProductClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure sedCratesChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    var Report_Started : Boolean;

    var Report_Footer : String;
  end;

var
  Assignment2_PetShop: TAssignment2_PetShop;

implementation

{$R *.lfm}

{ TAssignment2_PetShop }

procedure TAssignment2_PetShop.bntNewReportClick(Sender: TObject);
begin
  ListBox2.Clear;
  Report_Started := FALSE;
  btnEnd.Enabled := FALSE;
end;

procedure TAssignment2_PetShop.btnAddNewClick(Sender: TObject);
var NewText :String;
begin
  NewText :=  edtProducts.Text;
  if Length(NewText) > 0 then begin
     edtProducts.Clear;
     edtProducts.SetFocus;
     ListBox1.Items.Add(NewText);
  end;

end;

procedure TAssignment2_PetShop.btnDeleteClick(Sender: TObject);
var i: integer;
begin
   if ListBox1.SelCount > 0 then begin
      For i := ListBox1.Items.Count - 1 downto 0 do
       if ListBox1.Selected [i] then
        ListBox1.Items.Delete (i);
   end;
end;

procedure TAssignment2_PetShop.btnEndClick(Sender: TObject);
begin
   if Report_Started then begin
     ListBox2.Items.Add('***** END OF REPORT *****' + formatdatetime('yyyy/mm/dd', date));
     Report_Started := FALSE;
  end;
end;

procedure TAssignment2_PetShop.btnReplaceClick(Sender: TObject);
var i: integer;
var NewText :String;
begin
  NewText :=  edtProducts.Text;
  if Length(NewText) > 0 then begin
     if ListBox1.SelCount > 0 then begin
      For i := ListBox1.Items.Count - 1 downto 0 do
       if ListBox1.Selected [i] then
        ListBox1.Items.Delete (i);
        ListBox1.Items.Add(NewText);
      end;
  end;
end;

procedure TAssignment2_PetShop.btnStep4Click(Sender: TObject);
begin
  if not Report_Started then begin
     ListBox2.Items.Add('***** START OF REPORT *****');
     Report_Started := TRUE;
     btnEnd.Enabled := TRUE;
  end;

  ListBox2.Items.Add(sedItems.Caption  + ' crates of ' + lblProduct.Caption + ' ('+ sedCrates.Caption + ' per crate)');
end;

procedure TAssignment2_PetShop.edtProductsChange(Sender: TObject);
begin

end;

procedure TAssignment2_PetShop.FormCreate(Sender: TObject);
begin
     Listbox1.items.add('Bowl');
     Listbox1.items.add('Collar');
     Listbox1.items.add('Large pack of chews');
     Listbox1.items.add('Medium pack of chews');
     Listbox1.items.add('Pet grooming kit');
     Listbox1.items.add('Tick shampoo');
     Listbox1.items.add('Toy set');
     Listbox1.items.add('Vitamim supplement');
     Listbox1.Sorted := TRUE;
     btnStep4.Enabled := FALSE;
     Report_Started := FALSE;
     btnEnd.Enabled := FALSE;
     btnDelete.Enabled := FALSE;

end;

procedure TAssignment2_PetShop.grpSelectProductClick(Sender: TObject);
begin

end;

procedure TAssignment2_PetShop.lblProductClick(Sender: TObject);
begin

end;

procedure TAssignment2_PetShop.ListBox1Click(Sender: TObject);
begin
  lblProduct.Caption := ListBox1.Items[ListBox1.ItemIndex];
  btnStep4.Enabled := TRUE;
  btnDelete.Enabled := TRUE;
end;

procedure TAssignment2_PetShop.ListBox2Click(Sender: TObject);
begin

end;

procedure TAssignment2_PetShop.sedCratesChange(Sender: TObject);
begin

end;

end.

