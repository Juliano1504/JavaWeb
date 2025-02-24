package com.aulas.aulas.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
   
	@GetMapping("/index")
    public String index(Model model) {
        model.addAttribute("boasvindas", "Hello world");
        return "index";
    } 
	
	@GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("message", "Bem-vindo ao Thymeleaf!");
        model.addAttribute("Aula","Enfrentando problemas de pluggin");
        model.addAttribute("Logado",true);
        return "home";
    }
	
	@GetMapping("/cestadefrutas")
	public String lista(Model model) {
	    List<String> lista = new ArrayList<>();
	    lista.add("Maça");
	    lista.add("Pera");
	    lista.add("Laranja");
	    
	    model.addAttribute("frutas", lista);
		return "cesta";
	}
}
