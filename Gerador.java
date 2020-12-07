package main;

import java.io.File;

public class Gerador {

	public static void main(String[] args) {
		String path = "caminho da pasta";
		String arquivo = path + "linguagem.flex";
		
		File file = new File(arquivo);
		jflex.Main.generate(file);

	}

}
