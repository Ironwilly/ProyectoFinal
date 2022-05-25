package com.salesianos.triana.easycook.EasyCook.models;


import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Table (name = "receta")

public class Receta {

    @Id
    @GeneratedValue
    private Long id;

    private String ingredientes;


    private String preparacion;
}
