program UniFortes;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uConfigDB in 'uConfigDB.pas' {frmConfigDB},
  Util in 'Util.pas',
  Enumeradores in 'Enumeradores.pas',
  Atributos in 'Atributos.pas',
  Tabelas in 'Tabelas.pas',
  tbl.Professores in 'tbl.Professores.pas',
  tbl.Disciplinas in 'tbl.Disciplinas.pas',
  tbl.Alunos in 'tbl.Alunos.pas',
  tbl.Aulas in 'tbl.Aulas.pas',
  tbl.Atribuicao in 'tbl.Atribuicao.pas',
  uCadBase in 'uCadBase.pas' {frmCadBase},
  uPsqBase in 'uPsqBase.pas' {frmPsqBase},
  uCadDISCIPLINAS in 'uCadDISCIPLINAS.pas' {frmCadDISCIPLINAS},
  uCadDALUNOS in 'uCadDALUNOS.pas' {frmCadALUNOS},
  uCadPROFESSORES in 'uCadPROFESSORES.pas' {frmCadPROFESSORES},
  uControleAulas in 'uControleAulas.pas' {frmControleAulas},
  uCadAULAS in 'uCadAULAS.pas' {frmCadAULAS},
  uDefRelatorios in 'uDefRelatorios.pas' {frmDefRelatorios},
  uRelatorios in 'uRelatorios.pas' {frmRelatorios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
