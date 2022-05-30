package com.salesianos.triana.easycook.EasyCook.models;


import com.salesianos.triana.easycook.EasyCook.users.model.User;
import lombok.*;

import javax.persistence.*;

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

    private String tiempoCocinar;

    private String fotoReceta;

    @ManyToOne
    private User user;

    public Receta(String ingredientes, String preparacion, String tiempoCocinar,String fotoReceta, User user) {
        this.ingredientes = ingredientes;
        this.preparacion = preparacion;
        this.tiempoCocinar = tiempoCocinar;
        this.fotoReceta = fotoReceta;
        this.user = user;
    }

    public void addUser (User u){
        this.user = u;
        u.getRecetas().add(this);
    }

    public void deleteUser(User u){
        u.getRecetas().remove(this);
        this.user = null;
    }
}
