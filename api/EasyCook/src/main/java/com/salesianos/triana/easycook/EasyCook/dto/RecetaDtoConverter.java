package com.salesianos.triana.easycook.EasyCook.dto;

import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.models.RecetaCategoria;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import java.io.IOException;


@Component
@RequiredArgsConstructor
public class RecetaDtoConverter {

    public CreateRecetaDto convertRecetaToCreateRecetaDto(Receta r){

        return CreateRecetaDto.builder()

                .id(r.getUser().getId())
                .ingredientes(r.getIngredientes())
                .preparacion(r.getPreparacion())
                .tiempoCocinar(r.getTiempoCocinar())
                .fotoReceta(r.getFotoReceta())
                 .build();



    }

    public GetRecetaDto getRecetaToRecetaDto(Receta r){

        return GetRecetaDto.builder()

                .id(r.getId())
                .ingredientes(r.getIngredientes())
                .preparacion(r.getPreparacion())
                .tiempoCocinar(r.getTiempoCocinar())
                .fotoReceta(r.getFotoReceta())
                .nickUsuario(r.getUser().getNick())
                .nombreUsuario(r.getUser().getNombre())
                .ciudadUsuario(r.getUser().getCiudad())
                .avatarUsuario(r.getUser().getAvatar())
               .build();
    }

    public Receta createRecetaDtoToReceta(CreateRecetaDto createRecetaDto) throws IOException{



        return Receta.builder()

                .ingredientes(createRecetaDto.getIngredientes())
                .preparacion(createRecetaDto.getPreparacion())
                .tiempoCocinar(createRecetaDto.getTiempoCocinar())
                .fotoReceta(createRecetaDto.getFotoReceta())
              .build();



    }
}


