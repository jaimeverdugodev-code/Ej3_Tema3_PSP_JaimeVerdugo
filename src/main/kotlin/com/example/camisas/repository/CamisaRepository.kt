package com.example.camisas.repository

import com.example.camisas.domain.Camisa
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query

interface CamisaRepository : JpaRepository<Camisa, Long> {

    @Query("SELECT c FROM Camisa c JOIN FETCH c.tipo")
    fun findAllWithTipo(): List<Camisa>

    @Query("SELECT c FROM Camisa c JOIN FETCH c.tipo WHERE c.id = :id")
    fun findByIdWithTipo(id: Long): Camisa?
}
