package com.salesianos.triana.easycook.EasyCook.users.dto;

import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetUserDto {

    private UUID id;

    private String nombre;

    private String nick;

    private String email;

    private String avatar;

    private String fondo;

    private String rol;




}
