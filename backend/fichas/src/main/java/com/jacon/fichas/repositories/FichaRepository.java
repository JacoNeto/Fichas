package com.jacon.fichas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jacon.fichas.entities.Ficha;

public interface FichaRepository extends JpaRepository<Ficha, Long>{

}
