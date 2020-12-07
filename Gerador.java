package main;

import java.io.File;

public class Gerador {

	public static void main(String[] args) {
		String path = "C:\\Users\\leand\\OneDrive\\Documentos\\Faculdade\\Programar\\Java\\Projeto\\Projeto1\\src\\main\\";
		String arquivo = path + "linguagem.flex";
		
		File file = new File(arquivo);
		jflex.Main.generate(file);

	}

}
