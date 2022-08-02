using System;
//using System.Globalization;
using System.Threading;

class Program 
{
	public static string opcao = "0";
	public static string senhaCadastrada = " ";
	public static bool dadosForamCadastrados = false; 
	public static bool senhaFoiCadastrada = false;
	public static float saldo = 0.0f;

	public static bool possuiEmprestimo = false;
	public static float valorEmprestimo = 0.0f;

	public static string[] extrato = new string[10] {" ", " ", " ", " ", " ", " ", " ", " ", " ", " "};
	public static int posicaoExtrato = 0;

	public static string nome = "";
	public static string dataNascimento = " ";
	public static string cpf = "  .   .   -  ";
	public static string genero = " ";
	public static int idade = 0 ;

	public static void Main () 
	{
		Menu();
	
	  void Menu()
	  {
		  Console.Clear();
		
		  Console.WriteLine("Bem vindo ao Banco SENAC LTDA!\n");
		  Console.WriteLine("\nDigite a opção desejada:\n");

		  if(dadosForamCadastrados == true) //firula
		  {
			  Console.WriteLine("1 - Informar dados cadastrais do cliente - OK\n");
		  }
		  else
		  {
			  Console.WriteLine("1 - Informar dados cadastrais do cliente\n");
		  }

		  if(senhaFoiCadastrada == true) //firula
		  {
			  Console.WriteLine("2 - Informar senha do cliente - OK\n");
		  }
		  else
		  {
			  Console.WriteLine("2 - Informar senha do cliente\n");
		  }
		
		  Console.WriteLine("0 - Sair\n\n");
		  opcao = Console.ReadLine();

		  if(opcao == "1")
		  {
			  InformarOuAtualizarDadosCadastrais(0);
		  }
		  else if(opcao == "2")
		  {
			  InformarOuAtualizarSenha(0);
		  }
		  else if(opcao == "0")
		  {
			  Console.Clear();
			  Console.WriteLine("Obrigado por usar nossos serviços! Até logo!\n");
		  }
		  else
		  {
			  Menu();
		  }
		
	  }

	  void InformarOuAtualizarDadosCadastrais (int informarAtualizar) //1 //1
	  {
		  Console.Clear();
		
		  if(informarAtualizar == 0)
		  {
			  Console.WriteLine("1 - Informar Dados Cadastrais:\n");
		  }
		  else
		  {
			  Console.WriteLine("1 - Atualizar Dados Cadastrais:\n");
			  Console.WriteLine("\nDados Cadastrados:\n");
			  Console.WriteLine("\nNome: " + nome + "   CPF: " + cpf + "\n");
			  Console.WriteLine("Data de Nascimento: " + dataNascimento + "   Idade: " +idade + "   Gênero: " + genero + "\n");
		  }
		
		  Console.WriteLine("\nDigite o nome: ");
		  nome = Console.ReadLine();
		
		  Console.WriteLine("Digite a data de nascimento: ");
		  dataNascimento = Console.ReadLine();
		
		  Console.WriteLine("Digite a idade: ");
		  idade = int.Parse(Console.ReadLine());
		
		  Console.WriteLine("Digite o gênero: ");
		  genero = Console.ReadLine();
		
		  Console.WriteLine("Digite o CPF: ");
		  cpf = Console.ReadLine();
			
		  dadosForamCadastrados = true;

		  if(dadosForamCadastrados == true && senhaFoiCadastrada == true)
		  {
			  MenuPrincipal();
		  }
		  else
		  {
			  Menu();
		  }
	  }

	  void InformarOuAtualizarSenha (int informarOuAtualizar) //2 //2
	  {	
		  if(informarOuAtualizar == 0)
		  {
			  Console.Clear();

			  Console.WriteLine("2 - Informar senha do cliente\n");
			  Console.WriteLine("\nDigite a senha: ");
			  senhaCadastrada = Console.ReadLine();
			
			  senhaFoiCadastrada = true;
			
			  if(dadosForamCadastrados == true && senhaFoiCadastrada == true)
			  {
				  MenuPrincipal();
			  }
			  else
			  {
				  Menu();
			  }
		  }
		  else
		  {
			  if(Digitar_ConferirSenha() == true)
			  {
				  Console.Clear();
				
				  Console.WriteLine("2 - Atualizar Senha do cliente\n");
				  Console.WriteLine("\nDigite a nova senha: ");
				  senhaCadastrada = Console.ReadLine();
			  }
		  }
	  }

	  void MenuPrincipal ()
	  {
		  opcao = "1704";
		
		  while(opcao != "0")
		  {
			  Console.Clear();
			  Console.WriteLine("Bem vindo ao banco SENAC LTDA!\n"); // usar o nome do cliente?
			  Console.WriteLine("\nDigite a opção desjada:\n");
			  Console.WriteLine("1 - Atualizar dados cadastrais do cliente\n");
			  Console.WriteLine("2 - Atualizar senha do cliente\n");
			  Console.WriteLine("3 - Realizar depósito\n");
			  Console.WriteLine("4 - Realizar saque\n");
			  Console.WriteLine("5 - Realizar empréstimo\n");
			  Console.WriteLine("6 - Visualizar saldo\n");
			  Console.WriteLine("7 - Visualizar extrato\n");
			  Console.WriteLine("0 - Sair\n\n");

			  opcao = Console.ReadLine();

			  switch(opcao)
			  {
				  case "0":
					  Console.Clear();
					  Console.WriteLine("Obrigado por usar nossos serviços Sr(a) " + nome + "! Até logo!\n");
					  break;
				  case "1":
					  InformarOuAtualizarDadosCadastrais(1);
					  break;
				  case "2":
					  InformarOuAtualizarSenha(1); 
					  break;
				  case "3":
					  RealizarDeposito();
					  break;
				  case "4":
					  RealizarSaque();
					  break;
				  case "5":
					  RealiizarEmprestimo();
					  break;
				  case "6":
					  VisualizarSaldo();
					  break;
				  case "7":
					  VisualizarExtrato();
					  break;
				  default:
					  MenuPrincipal();
					  break;
			  }
		  }
	  }

	  bool Digitar_ConferirSenha ()
	  {
		  string conferirSenha = " ";
		
		  Console.Clear();
		
		  Console.WriteLine("Digite a Sua Senha: ");
		  conferirSenha = Console.ReadLine();

		  if(conferirSenha == senhaCadastrada)
		  {
			  return true;
		  }
		  else
		  {
			  string enter = " ";
			
			  Console.WriteLine("\nSenha Incorreta! Tecle Enter para Tentar Novamente ou Digite 0 para Voltar ao Menu\n");
			  enter = Console.ReadLine(); // gambiarra

			  if(enter == "0")
			  {
				  MenuPrincipal();
			  }
			  else
			  {
				  if(opcao == "2")
				  {
					  InformarOuAtualizarSenha(1);
				  }
				  else if(opcao == "3")
				  {
					  RealizarDeposito();
				  }
				  else if(opcao == "4")
				  {
					  RealizarSaque();
				  }
				  else if(opcao == "5")
				  {
					  RealiizarEmprestimo();
				  }
				  else if(opcao == "7")
				  {
					  VisualizarExtrato();
				  }
			  }
			
			  return false;
		  }
	  }

	  void RealizarDeposito () //3
	  {
		  if(Digitar_ConferirSenha() == true)
		  {		
			  float valorDeposito = 0.0f;

			  Console.Clear();
			  Console.WriteLine("3 - Realizar Depósito:\n");
			  Console.WriteLine("\nSaldo Atual: R$" + saldo + "\n");
			  Console.WriteLine("\nInforme o Valor que Deseja Depositar: ");
			  valorDeposito = float.Parse(Console.ReadLine());

			  AdicionarAoExtrato("Deposito de R$ ", valorDeposito);
		
			  saldo += valorDeposito;	

			  Console.WriteLine("\nDeposito Realizado Com Sucesso");
			  Thread.Sleep(1000);
		  }
	  }

	  void RealizarSaque () //4
	  {
		  if(saldo < 1)
		  {
			  Console.Clear();
			  Console.WriteLine("4 - Realizar Saque:\n");
			  Console.WriteLine("\nSaldo Insuficiente.\n");
			  Thread.Sleep(1000);	
			  return;
		  }
		  if(Digitar_ConferirSenha() == true)
		  {	
			  float valorSaque = 0.0f;

			  Console.Clear();
			  Console.WriteLine("4 - Realizar Saque:\n");
			  Console.WriteLine("\nSaldo Disponível: R$ " + saldo + "\n");
			  Console.WriteLine("\nInforme o Valor que Deseja Sacar: ");
			  valorSaque = float.Parse(Console.ReadLine());

			  if(valorSaque > saldo)
			  {
				  string enter = "";
				
				  Console.WriteLine("\nSaldo Insuficiente. \nTecle Enter para Tentar Novamente\n");
			  	enter = Console.ReadLine();
				  RealizarSaque();
			  }
			  else if(valorSaque < 1)
			  {
				  string enter = "";
				
				  Console.WriteLine("\nErro: Digite um Valor Válido. \n\nTecle Enter para Tentar Novamente\n");
				  enter = Console.ReadLine();
				  RealizarSaque();
			  }
			  else
			  {
				  AdicionarAoExtrato("Saque de R$ ", valorSaque);
				
				  saldo -= valorSaque;

				  Console.WriteLine("\nSaque Realizado Com Sucesso");
				  Thread.Sleep(1000);
			  }
		  }
	  }

	  void RealiizarEmprestimo ()
	  {
		  if(possuiEmprestimo == true)
		  {			
			  Console.Clear();
			
			  Console.WriteLine("5 - Realizar Empréstimo:\n");
			  Console.WriteLine("\nVocê já Possui um Empréstimo no Valor de: R$ " + valorEmprestimo + ".\n\nNão é Permitido Ter Mais de 1 Empréstimo na Conta.\n");
			  Thread.Sleep(2000);
		  }
		  else
		  {
			  if(Digitar_ConferirSenha() == true)
			  {	
				  Console.Clear();
				
				  if(saldo == 0)
				  {
					  Console.WriteLine("5 - Realizar Empréstimo:\n");
					  Console.WriteLine("\nVocê não Possui Saldo para Realizar Empréstimo\n");
					  Thread.Sleep(1500);
				  }
				  else
				  {
					  float valorEmprestimoDisponivel = saldo * 0.5f;
					  char aceitaRecusa;

					  Console.WriteLine("5 - Realizar Empréstimo:\n");
					  Console.WriteLine("\nVocê Possui R$ " + valorEmprestimoDisponivel + " Disponível para Empréstimo.\n\nDeseja Realizar Esse Empréstimo?\n\nDigite 'S' para Confirmar ou 'N' para Cancelar\n");
					  aceitaRecusa = Console.ReadLine()[0];

					  if(aceitaRecusa == 's' || aceitaRecusa == 'S')
					  {
						  saldo += valorEmprestimoDisponivel;
						  valorEmprestimo = valorEmprestimoDisponivel;
						  possuiEmprestimo = true;

						  AdicionarAoExtrato("Empréstimo de R$ ", valorEmprestimo);
					
						  Console.WriteLine("\nEmpréstimo Realizado Com Sucesso");
						  Thread.Sleep(1000);
					
					  }
					  else if(aceitaRecusa == 'n' || aceitaRecusa == 'N')
					  {
						  Console.WriteLine("\nEmpréstimo Não Realizado");
						  Thread.Sleep(1000);
					  }
					  else
					  {
						  Console.WriteLine("\nErro: "); // terminar aqui?
					  }
				  }
			  }
		  }
	  }

	  void VisualizarSaldo () //6
	  {
		  string enter = "";
					
		  Console.Clear();
		
		  Console.WriteLine("6 - Visualizar Saldo:\n");
		  Console.WriteLine("\nSeu Saldo é: R$" + saldo + "\n");
		  Console.WriteLine("\nTecle Enter para Voltar ao Menu\n");
		  enter = Console.ReadLine();
	  }

	  void AdicionarAoExtrato (string texto, float valor)
    {
      DateTime dataHora = DateTime.Now;
		
		  if(posicaoExtrato > 9)
		  {
			  int aux = 1;
			
			  for(int i = 0; i < 9; i++)
			  {
				  extrato[i] = extrato[aux];
				  aux++;
			  }
			  extrato[9] = dataHora + " " + texto + valor;
		  }
		  else
		  {
			  extrato[posicaoExtrato] = dataHora + "    " + texto + valor;
			  posicaoExtrato++;
		  }
	  }

	  void VisualizarExtrato () //7 
	  {
		  if(Digitar_ConferirSenha() == true)
		  {
			  Console.Clear();

			  Console.WriteLine("7 - Visualizar Extrato:\n");
		
			  for(int i = 0; i < 10; i++)
			  {
				  Console.WriteLine(extrato[i]);
			  }

			  string enter = " ";

			  Console.WriteLine("\n\nTecle Enter para Voltar ao Menu:\n");
			  enter = Console.ReadLine();
		  }
	  }
  }
}
