package com.example.camisas.web.dto

import jakarta.validation.constraints.NotBlank
import java.math.BigDecimal

data class CamisaRequest(
    @field:NotBlank val nombre: String,
    val talla: String? = null,
    val color: String? = null,
    val precio: BigDecimal? = null,
    val imagenUrl: String? = null,
    val lat: Double? = null,
    val lng: Double? = null,
    val tipoId: Long   // FK al tipo
)
