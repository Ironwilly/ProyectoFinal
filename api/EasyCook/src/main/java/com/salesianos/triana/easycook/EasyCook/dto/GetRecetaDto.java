package com.salesianos.triana.easycook.EasyCook.dto;

import com.salesianos.triana.easycook.EasyCook.models.RecetaCategoria;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetRecetaDto {

    private Long id;

    private String ingredientes;

    private String preparacion;

    private String tiempoCocinar;

    private String fotoReceta;

    private String nickUsuario;

    private String nombreUsuario;

    private String avatarUsuario;

    private String ciudadUsuario;


}
