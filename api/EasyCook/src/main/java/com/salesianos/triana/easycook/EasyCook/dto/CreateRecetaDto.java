package com.salesianos.triana.easycook.EasyCook.dto;

import com.salesianos.triana.easycook.EasyCook.models.RecetaCategoria;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import lombok.*;

import javax.persistence.Lob;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateRecetaDto {

    private UUID id;

    private String ingredientes;

    @Lob
    private String preparacion;

    private String tiempoCocinar;

    //private String recetaCategoria;

    private String fotoReceta;


}
