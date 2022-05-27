package com.salesianos.triana.easycook.EasyCook.users.dto;

import com.salesianos.triana.easycook.EasyCook.users.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.UUID;

@RequiredArgsConstructor
@Component
public class UserDtoConverter {


public GetUserDto convertUserToUserDto(User user)   {

    return GetUserDto.builder()
            .id(user.getId())
            .nombre(user.getNombre())
            .nick(user.getNick())
            .email(user.getEmail())
            .avatar(user.getAvatar())
            .fondo(user.getFondo())
            .rol(user.getRol().name())
            .build();
}

    public CreateUserDto convertUserToCreateUserDto(User user){
        return CreateUserDto.builder()
                .nombre(user.getNombre())
                .apellidos(user.getApellidos())
                .nick(user.getNick())
                .ciudad(user.getCiudad())
                .email(user.getEmail())
                .password(user.getPassword())
                .repetirPassword(user.getRepetirPassword())
                .avatar(user.getAvatar())
                .fondo(user.getFondo())
                .build();
    }




}
