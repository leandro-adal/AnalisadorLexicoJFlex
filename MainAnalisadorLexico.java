package main;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.Scanner;

import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;

public class TesteAnalisadorLexico {
	public static void main(String[] args) throws IOException {
		
		while (true) {
			Scanner sc = new Scanner(System.in);
			System.out.println("Escolha a entrada:");
			System.out.println("Digite 1 para escrever a entrada");
			System.out.println("Digite 2 para arquivo de teste");
			System.out.println("Digite 3 para escolher o arquivo a ser analisado");
			System.out.println("Digite -1 para encerrar");
			int a = sc.nextInt();
	        sc.nextLine();
			
			if (a == 1) {
				Scanner sc1 = new Scanner(System.in);
				System.out.printf("Digite um trecho de codigo: ");
				String b = sc1.nextLine();
				AnalisadorLexico lexico = new AnalisadorLexico(new StringReader(b));
				System.out.println(String.format("%-25s", "Lexema")+ "Descrição\n");
				lexico.yylex();
				System.out.println("");
			} else if (a == 2) {
				String path = "caminho do arquivo para teste";
				String arquivo = path + "teste";
				File file = new File(arquivo);
				AnalisadorLexico lexico2 = new AnalisadorLexico(new FileReader(file));
				System.out.println(String.format("%-25s", "Lexema")+ "Descrição\n");
				lexico2.yylex();
				System.out.println("");
			} else if (a == 3) {
				JFileChooser file1 = new JFileChooser();
				FileNameExtensionFilter filter = new FileNameExtensionFilter (
					"Selecione apenas arquivos .py",
					"py"
					);
				
				file1.setFileFilter(filter);
				
				int retorno = file1.showOpenDialog(null);
				if (retorno == JFileChooser.APPROVE_OPTION) {

					AnalisadorLexico lexico3 = new AnalisadorLexico(new FileReader(file1.getSelectedFile().getAbsolutePath()));
					System.out.println(String.format("%-25s", "Lexema")+ "Descrição\n");
					lexico3.yylex();
					System.out.println("");
				}
			} else if (a == -1) {
				System.out.println("Encerrando aplicativo...");
				break;
;
			} else {
				System.out.println("Vc digitou um caractere errado! Por favor, digite uma das opções disponiveis");
			}
		}


	}

}
