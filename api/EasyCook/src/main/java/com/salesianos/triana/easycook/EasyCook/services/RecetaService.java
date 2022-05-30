package com.salesianos.triana.easycook.EasyCook.services;

import com.salesianos.triana.easycook.EasyCook.dto.CreateRecetaDto;
import com.salesianos.triana.easycook.EasyCook.dto.GetRecetaDto;
import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.users.dto.CreateUserDto;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface RecetaService {


    List<GetRecetaDto> findAll();
    GetRecetaDto findOne(Long id, User user);
    CreateRecetaDto saveReceta(CreateRecetaDto createRecetaDto, MultipartFile file3, User user);
    Receta editReceta(Long id,CreateRecetaDto createRecetaDto,MultipartFile file3,CreateUserDto createUserDto);
    void removeRecetaById(Long id,User user) throws IOException;
}
