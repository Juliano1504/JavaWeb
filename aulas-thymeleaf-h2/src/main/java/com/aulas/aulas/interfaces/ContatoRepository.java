package com.aulas.aulas.interfaces;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.aulas.aulas.modelos.Contato;

@Repository
public interface ContatoRepository extends JpaRepository<Contato, Integer> {

}
