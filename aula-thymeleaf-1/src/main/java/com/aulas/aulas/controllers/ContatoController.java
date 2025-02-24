package com.aulas.aulas.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.aulas.aulas.modelos.Contato;

@Controller
public class ContatoController {
    private static List<Contato> lista = new ArrayList<>();
	
    public ContatoController() {
      lista.add(new Contato(1,"ana","(47)9090-2345","ana@gmail.com"));
      lista.add(new Contato(2,"maria","(47)9090-2345","maria@gmail.com"));
      lista.add(new Contato(3,"josé","(47)9090-2345","jose@gmail.com"));
      lista.add(new Contato(4,"maria","(47)9090-2345","maria@gmail.com"));
    }
    
	@GetMapping("/contatos/index")
	public String index(Model model) {
		model.addAttribute("contatos",lista);
		return "contatos/index";
	}
	
	@GetMapping("/contatos/add")
	public String add(Model model) {
		model.addAttribute("contato", new Contato());
		return "contatos/create";
	}
	
	@PostMapping("/contatos/save")
    public String salvar(@ModelAttribute Contato contato) {
        lista.add(contato);
        return "redirect:/contatos/index";
    }
}
