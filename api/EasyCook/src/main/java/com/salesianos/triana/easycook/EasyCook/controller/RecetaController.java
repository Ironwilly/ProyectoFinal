package com.salesianos.triana.easycook.EasyCook.controller;

import com.salesianos.triana.easycook.EasyCook.dto.CreateRecetaDto;
import com.salesianos.triana.easycook.EasyCook.dto.GetRecetaDto;
import com.salesianos.triana.easycook.EasyCook.dto.RecetaDtoConverter;
import com.salesianos.triana.easycook.EasyCook.errors.exceptions.ListEntityNotFoundException;
import com.salesianos.triana.easycook.EasyCook.errors.exceptions.ListNotFoundException;
import com.salesianos.triana.easycook.EasyCook.errors.exceptions.SingleEntityNotFoundException;
import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.models.RecetaCategoria;
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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
@RequestMapping("/receta")
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

    @PostMapping("/")
    public ResponseEntity<?> create(@RequestPart("receta") CreateRecetaDto createRecetaDto, @RequestPart("recetaImagen") MultipartFile file3,
                                    @AuthenticationPrincipal User user) throws IOException {

        return ResponseEntity.status(HttpStatus.CREATED).body(recetaService.saveReceta(createRecetaDto, file3, user));

    }

    @PutMapping("/{id}")
    public ResponseEntity<Optional<GetRecetaDto>> edit(@PathVariable Long id, @RequestPart("receta") CreateRecetaDto createRecetaDto, @RequestPart("recetaImagen") MultipartFile file3,
                                             @AuthenticationPrincipal User user) throws  ListNotFoundException {
 return ResponseEntity.status(HttpStatus.CREATED).body(recetaService.editReceta(id,createRecetaDto,file3,user));
    }

    @GetMapping("/all")
    public ResponseEntity<List<GetRecetaDto>> findAllRecetas(){

        if (recetaService.findAll().isEmpty()) {
            throw new ListEntityNotFoundException(Receta.class);
        } else {
            List<GetRecetaDto> list = recetaService.findAll().stream()
                    .map(recetaDtoConverter::getRecetaToRecetaDto)
                    .collect(Collectors.toList());
            return ResponseEntity.ok().body(list);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> removeRecetaById(@PathVariable Long id) throws SingleEntityNotFoundException {

        recetaService.removeRecetaById(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/id/{id}")
    public ResponseEntity<GetRecetaDto> findOne(@PathVariable Long id,@AuthenticationPrincipal User user) {

        Optional<Receta> receta = recetaService.findById(id);
        if(receta.isPresent()){
            return ResponseEntity.ok().body(recetaDtoConverter.getRecetaToRecetaDto(receta.get()));
        }else {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
        }

    }

    @GetMapping("/categoria")
    public List<Receta> getAllRecetaPorCategoria(@RequestPart("categoria") RecetaCategoria recetaCategoria, @AuthenticationPrincipal User user) {

        if (recetaCategoria.equals(recetaCategoria.OTROS)) {


            List<Receta> listaRecetas;
            return listaRecetas = recetaService.findRecetaByCategoriaOtros(recetaCategoria);
        } else if (recetaCategoria.equals(recetaCategoria.DULCES)) {
            List<Receta> listaRecetas;
            return listaRecetas = recetaService.findRecetaByCategoriaDulces(recetaCategoria);
        } else {
            List<Receta> listaRecetas;
            return listaRecetas = recetaService.findRecetaByCategoriaPastas(recetaCategoria);
        }
    }
}