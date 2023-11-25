package com.projekat.model;

public class Kategorija
{
    public Integer idKategorija;
    public String starosnaKategorija;
    public String nivoTakmicenja;

    public Kategorija() {
    }

    public Kategorija(String starosnaKategorija, String nivoTakmicenja) {
        this.starosnaKategorija = starosnaKategorija;
        this.nivoTakmicenja = nivoTakmicenja;
    }

    public Kategorija(Integer idKategorija, String starosnaKategorija, String nivoTakmicenja) {
        this.idKategorija = idKategorija;
        this.starosnaKategorija = starosnaKategorija;
        this.nivoTakmicenja = nivoTakmicenja;
    }

    public Integer getIdKategorija() {
        return idKategorija;
    }

    public void setIdKategorija(Integer idKategorija) {
        this.idKategorija = idKategorija;
    }

    public String getStarosnaKategorija() {
        return starosnaKategorija;
    }

    public void setStarosnaKategorija(String starosnaKategorija) {
        this.starosnaKategorija = starosnaKategorija;
    }

    public String getNivoTakmicenja() {
        return nivoTakmicenja;
    }

    public void setNivoTakmicenja(String nivoTakmicenja) {
        this.nivoTakmicenja = nivoTakmicenja;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Kategorija that = (Kategorija) o;

        return idKategorija.equals(that.idKategorija);
    }

    @Override
    public int hashCode() {
        return idKategorija.hashCode();
    }

    @Override
    public String toString() {
        return idKategorija + " - " + starosnaKategorija + " - " + nivoTakmicenja;
    }
}
