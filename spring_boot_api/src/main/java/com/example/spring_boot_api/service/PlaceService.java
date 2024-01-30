package com.example.spring_boot_api.service;

import com.example.spring_boot_api.entity.Place;
import com.example.spring_boot_api.repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceService {

    @Autowired
    private PlaceRepository placeRepository;

    public List<Place> getAllPlaces() {
        return placeRepository.findAll();
    }
}