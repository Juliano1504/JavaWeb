/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daos;

import entidades.Contato;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author aluno
 */
public class DaoContato {
   static String user = "postgres";
   static  String password = "admin";
   static String url = "jdbc:postgresql://localhost:5432/db-aula-jw";
    
    public static void Delete(int id){
        try {           
           //consultar do banco de dados
           Class.forName("org.postgresql.Driver");
           Connection conn = DriverManager.getConnection(url, user, password);
         
           String sql = "delete from tb_contatos where id = " + id;
           PreparedStatement stm = conn.prepareStatement(sql);
           
           stm.execute();
         } catch (Exception ex) {
          
       }
    }
    
   public static Contato GetOne(int id){
        Contato ct = new Contato();
        try {           
           //consultar do banco de dados
           Class.forName("org.postgresql.Driver");
           Connection conn = DriverManager.getConnection(url, user, password);
         
           String sql = "select * from tb_contatos where id = " + id;
           PreparedStatement stm = conn.prepareStatement(sql);
           
           ResultSet rs = stm.executeQuery();
           if(rs.next()){
               ct.setId(rs.getInt("Id"));
               ct.setNome(rs.getString("Nome"));
               ct.setEmail(rs.getString("Email"));
               ct.setFone(rs.getString("Fone"));
          }
         } catch (Exception ex) {
          
       }
       return ct;
    }
   
   
    public static List<Contato> GetAll(){
      List<Contato> contatos = new ArrayList<>();
        try {           
           //consultar do banco de dados
           Class.forName("org.postgresql.Driver");
           Connection conn = DriverManager.getConnection(url, user, password);
         
           PreparedStatement stm = conn.prepareStatement("select * from tb_contatos");
           ResultSet rs = stm.executeQuery();
           while(rs.next()){
               Contato ct = new Contato();
               ct.setId(rs.getInt("Id"));
               ct.setNome(rs.getString("Nome"));
               ct.setEmail(rs.getString("Email"));
               ct.setFone(rs.getString("Fone"));
               
               contatos.add(ct);
           }
           return contatos;
       } catch (Exception ex) {
          
       }
       return contatos;
    }
    
    public static boolean Create(Contato contato){
        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            String insertQuery = "insert into tb_contatos(Nome, Email, Fone)values(?,?,?)";
            
            PreparedStatement stm = conn.prepareStatement(insertQuery);
            stm.setString(1, contato.getNome());
            stm.setString(2, contato.getEmail());
            stm.setString(3, contato.getFone());
            stm.execute();
            
            return true;
        } catch (Exception ex) {
            
        }
        return false;
    }
    
     public static boolean Update(Contato contato){
        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            String insertQuery = "update tb_contatos set Nome = ?, Email = ?, Fone = ? where id = ?";
            
            PreparedStatement stm = conn.prepareStatement(insertQuery);
            stm.setString(1, contato.getNome());
            stm.setString(2, contato.getEmail());
            stm.setString(3, contato.getFone());
            stm.setInt(4, contato.getId());
            stm.execute();
            
            return true;
        } catch (Exception ex) {
            
        }
        return false;
    }
}
