/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entitdades;

/**
 *
 * @author aluno
 */
public class Imc {
    private float peso;
    private float altura;

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public float getAltura() {
        return altura;
    }

    public void setAltura(float altura) {
        this.altura = altura;
    }
    
    public String getResultado(){
        float indice = peso/(altura * altura);
        //return String.valueOf(indice);
        return String.format("%.2f", indice);
    }
}
