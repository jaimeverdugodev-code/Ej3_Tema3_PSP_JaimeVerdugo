package com.example.camisas.web

import com.example.camisas.repository.TipoCamisaRepository
import com.example.camisas.repository.CamisaRepository
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class DebugController(
    private val tipoCamisaRepository: TipoCamisaRepository,
    private val camisaRepository: CamisaRepository
) {

    @GetMapping("/debug/tipos")
    fun getTipos() = tipoCamisaRepository.findAll()

    @GetMapping("/debug/camisas")
    fun getCamisas() = camisaRepository.findAll()
}
