package com.salesianos.triana.easycook.EasyCook.dto;

import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.models.RecetaCategoria;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;


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
                .recetaCategoria(RecetaCategoria.valueOf(r.getRecetaCategoria().toString()).toString())
                .build();



    }

    public GetRecetaDto getRecetaToRecetaDto(Receta r){

        return GetRecetaDto.builder()

                .id(r.getId())
                .ingredientes(r.getIngredientes())
                .preparacion(r.getPreparacion())
                .tiempoCocinar(r.getTiempoCocinar())
                .fotoReceta(r.getFotoReceta())
                .nick(r.getUser().getNick())
                .user(r.getUser())
                .recetaCategoria(r.getRecetaCategoria())
                .build();
    }
}


