package com.salesianos.triana.easycook.EasyCook.dto;

import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateRecetaDto {

    private UUID id;

    private String ingredientes;

    private String preparacion;

    private String tiempoCocinar;

    private String fotoReceta;
}
