package com.salesianos.triana.easycook.EasyCook.services;

import com.salesianos.triana.easycook.EasyCook.dto.CreateRecetaDto;
import com.salesianos.triana.easycook.EasyCook.dto.GetRecetaDto;
import com.salesianos.triana.easycook.EasyCook.errors.exceptions.ListNotFoundException;
import com.salesianos.triana.easycook.EasyCook.errors.exceptions.SingleEntityNotFoundException;
import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.models.RecetaCategoria;
import com.salesianos.triana.easycook.EasyCook.repositorios.RecetaRepository;
import com.salesianos.triana.easycook.EasyCook.services.base.BaseService;
import com.salesianos.triana.easycook.EasyCook.users.dto.CreateUserDto;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

public interface RecetaService  {




    CreateRecetaDto saveReceta(CreateRecetaDto createRecetaDto, MultipartFile file3, User user);
    Optional<GetRecetaDto> editReceta(Long id, CreateRecetaDto createRecetaDto, MultipartFile file3, User user) throws ListNotFoundException;
    void removeRecetaById(Long id) throws SingleEntityNotFoundException;
    List<Receta> findAll();
    List<Receta> findRecetaByCategoriaOtros(RecetaCategoria recetaCategoria);
    List<Receta> findRecetaByCategoriaDulces(RecetaCategoria recetaCategoria);
    List<Receta> findRecetaByCategoriaPastas(RecetaCategoria recetaCategoria);
    }

