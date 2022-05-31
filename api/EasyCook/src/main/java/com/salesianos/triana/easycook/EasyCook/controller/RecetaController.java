package com.salesianos.triana.easycook.EasyCook.controller;

import com.salesianos.triana.easycook.EasyCook.dto.CreateRecetaDto;
import com.salesianos.triana.easycook.EasyCook.dto.GetRecetaDto;
import com.salesianos.triana.easycook.EasyCook.dto.RecetaDtoConverter;
import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.repositorios.RecetaRepository;
import com.salesianos.triana.easycook.EasyCook.services.impl.RecetaServiceImpl;
import com.salesianos.triana.easycook.EasyCook.users.dto.CreateUserDto;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
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

    @PutMapping("/receta/{id}")
    public ResponseEntity<GetRecetaDto> edit(@PathVariable Long id, @RequestPart("receta") CreateRecetaDto createRecetaDto, @RequestPart("recetaImagen")MultipartFile file3, @AuthenticationPrincipal CreateUserDto createUserDto){

        Receta newReceta = recetaService.editReceta(id,createRecetaDto,file3,createUserDto);
        GetRecetaDto newRecetaDto = recetaDtoConverter.getRecetaToRecetaDto(newReceta);
        return ResponseEntity.status(HttpStatus.CREATED).body(newRecetaDto);
    }

    @GetMapping("/receta/all")
    public ResponseEntity<?> listadoCompleto(){
        return ResponseEntity.ok(recetaService.findAll());
    }

    @DeleteMapping("/receta/{id}")
    public ResponseEntity<?> removeRecetaById(@PathVariable Long id,@AuthenticationPrincipal User user ) throws IOException {

        recetaService.removeRecetaById(id,user);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/receta/{id}")
    public ResponseEntity<?> findOne(@PathVariable Long id,@AuthenticationPrincipal User user){

        GetRecetaDto recetaDto = recetaService.findOne(id,user);
        return ResponseEntity.ok().body(recetaDto);
    }
}
