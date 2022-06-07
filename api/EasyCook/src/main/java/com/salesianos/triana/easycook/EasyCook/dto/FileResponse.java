package com.salesianos.triana.easycook.EasyCook.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class FileResponse {

    private String name;
    private String uri;
    private String type;
    private long size;
}
