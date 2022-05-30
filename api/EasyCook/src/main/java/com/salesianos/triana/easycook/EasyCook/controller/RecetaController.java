package com.salesianos.triana.easycook.EasyCook.controller;

import com.salesianos.triana.easycook.EasyCook.dto.CreateRecetaDto;
import com.salesianos.triana.easycook.EasyCook.dto.RecetaDtoConverter;
import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.repositorios.RecetaRepository;
import com.salesianos.triana.easycook.EasyCook.services.impl.RecetaServiceImpl;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequiredArgsConstructor
public class RecetaController {

    private final RecetaServiceImpl recetaService;
    private final RecetaDtoConverter recetaDtoConverter;


    @ApiResponses(value = {
            @ApiResponse(responseCode = "201",
                    description = "Se ha creado la receta",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Receta.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha creado la receta",
                    content = @Content),
    })

    @PostMapping("/receta")
    public ResponseEntity<?> create(@RequestPart("receta")CreateRecetaDto createRecetaDto, @RequestPart("recetaImagen")MultipartFile file3, @AuthenticationPrincipal User user) throws IOException{

        return ResponseEntity.status(HttpStatus.CREATED).body(recetaService.saveReceta(createRecetaDto,file3,user));

    }

}
