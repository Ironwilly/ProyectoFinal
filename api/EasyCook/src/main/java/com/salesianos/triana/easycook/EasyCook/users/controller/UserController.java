package com.salesianos.triana.easycook.EasyCook.users.controller;

import com.salesianos.triana.easycook.EasyCook.errors.exceptions.ListNotFoundException;
import com.salesianos.triana.easycook.EasyCook.services.StorageService;
import com.salesianos.triana.easycook.EasyCook.users.dto.CreateUserDto;
import com.salesianos.triana.easycook.EasyCook.users.dto.GetUserDto;
import com.salesianos.triana.easycook.EasyCook.users.dto.UserDtoConverter;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import com.salesianos.triana.easycook.EasyCook.users.services.impl.UserServiceImpl;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserServiceImpl userService;
    private final UserDtoConverter userDtoConverter;
    private final StorageService storageService;


    @ApiResponses(value = {
            @ApiResponse(responseCode = "201",
                    description = "Se ha creado el usuario",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = User.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha creado el usuario",
                    content = @Content),
    })
    @PostMapping("/auth/register")
    public ResponseEntity<GetUserDto> register(@RequestPart("user")CreateUserDto newUser, @RequestPart("avatar")
            MultipartFile file1) throws IOException{

        User userSaved = userService.saveUser(newUser,file1);
        if(userSaved == null){
            return ResponseEntity.badRequest().build();
        }else {
            return ResponseEntity.ok(userDtoConverter.convertUserToUserDto(userSaved));
        }
    }

    @PutMapping("profile/me")
    public ResponseEntity<Optional<GetUserDto>> editarPerfil (@AuthenticationPrincipal User user,@RequestPart("user") CreateUserDto createUserDto,@RequestPart("avatar")MultipartFile file1) throws  ListNotFoundException {
        return ResponseEntity.ok(userService.editUser(createUserDto,user,file1));
    }
}
