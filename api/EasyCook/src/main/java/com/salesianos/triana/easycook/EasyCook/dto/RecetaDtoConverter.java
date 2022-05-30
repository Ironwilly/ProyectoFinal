package com.salesianos.triana.easycook.EasyCook.dto;

import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import org.springframework.stereotype.Component;

import java.util.UUID;
@Component
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
                .build();
    }
}


