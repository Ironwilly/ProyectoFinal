package com.salesianos.triana.easycook.EasyCook.repositorios;

import com.salesianos.triana.easycook.EasyCook.models.Receta;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;

import java.util.List;


public interface RecetaRepository extends JpaRepository <Receta,Long> {

    @Query (value = """
            SELECT * FROM Receta
            """,nativeQuery = true)
    List<Receta> findAll();
}
