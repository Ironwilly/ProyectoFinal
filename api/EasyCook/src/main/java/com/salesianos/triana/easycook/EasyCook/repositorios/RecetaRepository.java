package com.salesianos.triana.easycook.EasyCook.repositorios;

import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.models.RecetaCategoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import java.util.List;


public interface RecetaRepository extends JpaRepository <Receta,Long> {

    @Query (value = """
            SELECT * FROM Receta
            """,nativeQuery = true)
    List<Receta> findAll();


    @Query (value = """
            SELECT * FROM RECETA WHERE receta_Categoria = 'OTROS'
            """,nativeQuery = true)
    List<Receta> findRecetaByCategoriaOtros(RecetaCategoria recetaCategoria);

    @Query (value = """
            SELECT * FROM RECETA WHERE receta_Categoria = 'DULCES'
            """,nativeQuery = true)
    List<Receta> findRecetaByCategoriaDulces(RecetaCategoria recetaCategoria);

    @Query (value = """
            SELECT * FROM RECETA WHERE receta_Categoria = 'PASTAS'
            """,nativeQuery = true)
    List<Receta> findRecetaByCategoriaPastas(RecetaCategoria recetaCategoria);




}
