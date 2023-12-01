package com.projekat.model;

import java.util.Objects;

public class Gol
{
    private Integer idGol;
    private Integer idUtakmica;
    private Integer idKlub;
    private Integer idIgrac;
    private Integer minut;
    private String igrac;

    public Gol() {
    }

    public Gol(Integer idUtakmica, Integer idKlub, Integer idIgrac, Integer minut, String igrac) {
        this.idUtakmica = idUtakmica;
        this.idKlub = idKlub;
        this.idIgrac = idIgrac;
        this.minut = minut;
        this.igrac = igrac;
    }

    public Gol(Integer idGol, Integer idUtakmica, Integer idKlub, Integer idIgrac, Integer minut, String igrac) {
        this.idGol = idGol;
        this.idUtakmica = idUtakmica;
        this.idKlub = idKlub;
        this.idIgrac = idIgrac;
        this.minut = minut;
        this.igrac = igrac;
    }

    public Integer getIdGol() {
        return idGol;
    }

    public void setIdGol(Integer idGol) {
        this.idGol = idGol;
    }

    public Integer getIdUtakmica() {
        return idUtakmica;
    }

    public void setIdUtakmica(Integer idUtakmica) {
        this.idUtakmica = idUtakmica;
    }

    public Integer getIdKlub() {
        return idKlub;
    }

    public void setIdKlub(Integer idKlub) {
        this.idKlub = idKlub;
    }

    public Integer getIdIgrac() {
        return idIgrac;
    }

    public void setIdIgrac(Integer idIgrac) {
        this.idIgrac = idIgrac;
    }

    public Integer getMinut() {
        return minut;
    }

    public void setMinut(Integer minut) {
        this.minut = minut;
    }

    public String getIgrac() {
        return igrac;
    }

    public void setIgrac(String igrac) {
        this.igrac = igrac;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Gol gol = (Gol) o;

        return Objects.equals(idGol, gol.idGol);
    }

    @Override
    public int hashCode() {
        return idGol != null ? idGol.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "Gol: " + minut + "' " + igrac;
    }
}
