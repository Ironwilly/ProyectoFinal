package com.salesianos.triana.easycook.EasyCook.security.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JwtUsuarioResponse {

    private String nombre;

    private String apellidos;

    private String nick;

    private String email;

    private String avatar;

    private String fondo;

    private String token;
}
