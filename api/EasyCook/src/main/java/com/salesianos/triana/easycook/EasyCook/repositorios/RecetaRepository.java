package com.salesianos.triana.easycook.EasyCook.repositorios;

import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.models.RecetaCategoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import java.util.List;


public interface RecetaRepository extends JpaRepository <Receta,Long> {




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



    @Modifying
    @Query("delete Receta r where r.id = :id")
    int deleteRecetaById(@Param("id") Long id);




}
