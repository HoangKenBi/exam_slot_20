package com.example.spring_boot_api.repository;

import com.example.spring_boot_api.entity.Place;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PlaceRepository extends JpaRepository<Place, Long> {
    // You can add custom queries if needed
}
