package com.aulas.aulas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aulas.aulas.interfaces.ContatoRepository;
import com.aulas.aulas.modelos.Contato;

@Service
public class ContatoService {
	@Autowired
	ContatoRepository repository;

	public Contato salvar(Contato contato) throws Exception {
		if (contato.getNome().isBlank()) {
			throw new Exception("O nome deve ser informado");
		}
		if (contato.getEmail().isBlank()) {
			throw new Exception("O email deve ser informado");
		}
		if (contato.getTelefone().isBlank()) {
			throw new Exception("O telefone deve ser informado");
		}
		
		Optional<Contato> contatoExistente = repository.findById(contato.getId());
		if (contatoExistente.isPresent()) {
			Contato existente = contatoExistente.get();
			existente.setNome(contato.getNome());
			existente.setEmail(contato.getEmail());
			existente.setTelefone(contato.getTelefone());			
			return repository.save(existente);		  
		}		
		return repository.save(contato);
	}

	public List<Contato> findAll() {
		return repository.findAll();
	}
}