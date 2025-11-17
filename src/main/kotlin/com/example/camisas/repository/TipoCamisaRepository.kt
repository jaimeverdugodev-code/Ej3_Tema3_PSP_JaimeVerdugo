package com.example.camisas.repository

import com.example.camisas.domain.TipoCamisa
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query

interface TipoCamisaRepository : JpaRepository<TipoCamisa, Long> {

    fun existsByNombreIgnoreCase(nombre: String): Boolean

    @Query("SELECT t FROM TipoCamisa t")
    fun findAllTipos(): List<TipoCamisa>

    @Query("SELECT t FROM TipoCamisa t WHERE t.id = :id")
    fun findByIdTipo(id: Long): TipoCamisa?
}
