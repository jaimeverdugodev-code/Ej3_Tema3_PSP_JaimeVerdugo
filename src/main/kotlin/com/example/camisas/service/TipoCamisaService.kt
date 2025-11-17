package com.example.camisas.service

import com.example.camisas.domain.TipoCamisa
import com.example.camisas.repository.TipoCamisaRepository
import com.example.camisas.web.dto.TipoCamisaRequest
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class TipoCamisaService(
    private val repo: TipoCamisaRepository
) {

    @Transactional(readOnly = true)
    fun list(): List<TipoCamisa> = repo.findAllTipos().sortedBy { it.id }

    @Transactional(readOnly = true)
    fun get(id: Long): TipoCamisa =
        repo.findByIdTipo(id) ?: throw NotFoundException("TipoCamisa id=$id no encontrada")

    @Transactional
    fun create(req: TipoCamisaRequest): TipoCamisa {
        val entity = TipoCamisa(
            nombre = req.nombre,
            descripcion = req.descripcion
        )
        return repo.save(entity)
    }

    @Transactional
    fun update(id: Long, req: TipoCamisaRequest): TipoCamisa {
        val current = get(id)
        val updated = current.copy(
            nombre = req.nombre,
            descripcion = req.descripcion
        )
        return repo.save(updated)
    }

    @Transactional
    fun delete(id: Long) {
        if (!repo.existsById(id)) throw NotFoundException("TipoCamisa id=$id no encontrada")
        repo.deleteById(id)
    }
}
