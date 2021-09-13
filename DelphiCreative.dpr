program DelphiCreative;

uses
  System.StartUpCopy,
  FMX.Forms,
  dPrincipal in 'dPrincipal.pas' {dmPrincipal: TDataModule},
  uBuscaAvancada in 'uBuscaAvancada.pas' {fBuscaAvancada},
  uCadastroContatos in 'uCadastroContatos.pas' {fCadastrosContatos},
  uCadastroItens in 'uCadastroItens.pas' {fCadastrosItens},
  uCadastros in 'uCadastros.pas' {fCadastros},
  uCadastroTarefa in 'uCadastroTarefa.pas' {fCadastroTarefa},
  uCalendario in 'uCalendario.pas' {fCalendario},
  uCardAtendimento in 'uCardAtendimento.pas' {fCardAtendimento},
  uCardBasico in 'uCardBasico.pas' {fCardBasico},
  uCardClientes in 'uCardClientes.pas' {frmCardClientes},
  uCardTiposAtendimentos in 'uCardTiposAtendimentos.pas' {fCardTiposAtendimentos},
  uContatos in 'uContatos.pas',
  uFuncoes in 'uFuncoes.pas',
  uItens in 'uItens.pas',
  uLogin in 'uLogin.pas' {fLogin},
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  uReceitaWS in 'uReceitaWS.pas',
  uAlteraSenha in 'uAlteraSenha.pas' {fAlteraSenha},
  uCepWS in 'uCepWS.pas',
  uLancarContas in 'uLancarContas.pas' {fLancarContas},
  uContas in 'uContas.pas',
  uMovimentacao in 'uMovimentacao.pas' {fMovimentacao},
  uContasLiquidadas in 'uContasLiquidadas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfAlteraSenha, fAlteraSenha);
  Application.CreateForm(TfLancarContas, fLancarContas);
  Application.CreateForm(TfMovimentacao, fMovimentacao);
  Application.Run;
end.
