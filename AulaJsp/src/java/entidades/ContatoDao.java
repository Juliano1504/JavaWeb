/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

import java.util.ArrayList;
import java.util.List;


public class ContatoDao {
    private static List<Contato> contatos = new ArrayList<Contato>();
    
    public static void inserir(Contato contato){
       contatos.add(contato);
    }
    
    public static List<Contato> getContatos(){
        return contatos;
    }
}
