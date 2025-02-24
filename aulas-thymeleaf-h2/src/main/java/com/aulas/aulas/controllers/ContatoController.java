package com.aulas.aulas.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.aulas.aulas.interfaces.ContatoRepository;
import com.aulas.aulas.modelos.Contato;
import com.aulas.aulas.services.ContatoService;

@Controller
public class ContatoController {
    private static List<Contato> lista = new ArrayList<>();
	
    @Autowired
    ContatoService service;
    
    @Autowired
    ContatoRepository repository;
    
    public ContatoController() {
    }
    
	@GetMapping("/contatos/index")
	public String index(Model model) {
		lista = service.findAll();
		model.addAttribute("contatos",lista);
		return "contatos/index";
	}
	
	@GetMapping("/contato/editar/{Id}")
	public String editar(@PathVariable("Id") int Id, Model model) {
		Contato contato = repository.findById(Id).get();
		model.addAttribute("contato",contato);
		return "/contatos/edit";
	}
	
	@GetMapping("/contato/excluir/{Id}")
	public String excluir(@PathVariable("Id") int Id, Model model) {
		Contato contato = repository.findById(Id).get();
		model.addAttribute("contato",contato);
		return "/contatos/excluir";
	}
	
	@PostMapping("/contato/excluir/{Id}")
	public String confirmaExcluir(@PathVariable("Id") int Id) {
		repository.deleteById(Id);		
		return "redirect:/contatos/index";
	}
	
	@GetMapping("/contatos/add")
	public String add(Model model) {
		model.addAttribute("contato", new Contato());
		return "contatos/create";
	}
	
	@PostMapping("/contatos/save")
    public String salvar(Model model, @ModelAttribute Contato contato) {
        try {
			service.salvar(contato);
			return "redirect:/contatos/index";
			
		} catch (Exception e) {
			model.addAttribute("erro", e.getMessage());
			return "/contatos/create";
		}        
    }
	
	@PostMapping("/contatos/edit/save")
    public String editSave(Model model, @ModelAttribute Contato contato) {
        try {
        	service.salvar(contato);        	
			return "redirect:/contatos/index";
			
		} catch (Exception e) {
			model.addAttribute("erro", e.getMessage());
			return "/contatos/edit";
		}        
    }
}
