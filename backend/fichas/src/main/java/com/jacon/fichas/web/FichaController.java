package com.jacon.fichas.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jacon.fichas.entities.Ficha;
import com.jacon.fichas.repositories.FichaRepository;

@RestController
public class FichaController {
	@Autowired
	FichaRepository fichaRepo;
	
	@RequestMapping("/fichas")
	public List<Ficha> getFichas() {
		return fichaRepo.findAll();
	}
}
