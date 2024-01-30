package com.example.spring_boot_api.entity;

import javax.persistence.*;

@Entity
@Table(name = "place")
public class Place {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String imageUrl;
    private String name;
    private String description;
    private double rating;

    // Constructors

    public Place() {
    }

    public Place(String imageUrl, String name, String description, double rating) {
        this.imageUrl = imageUrl;
        this.name = name;
        this.description = description;
        this.rating = rating;
    }

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    // toString method for easy debugging

    @Override
    public String toString() {
        return "Place{" +
                "id=" + id +
                ", imageUrl='" + imageUrl + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", rating=" + rating +
                '}';
    }
}
