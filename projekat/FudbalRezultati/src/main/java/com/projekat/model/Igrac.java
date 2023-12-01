package com.projekat.model;

import java.util.Objects;

public class Igrac
{
    private Integer idIgrac;
    private String ime;
    private String prezime;
    private Integer brojDresa;
    private Integer godine;
    private Integer idDrzava;
    private Integer idKlub;
    private String oznakaPozicije;
    private Integer visina;
    private String klub;
    private String drzava;


    public Igrac() {
    }

    public Igrac(String ime, String prezime, Integer brojDresa, Integer godine, Integer idDrzava, Integer idKlub,
                 String oznakaPozicije, Integer visina, String klub, String drzava) {
        this.ime = ime;
        this.prezime = prezime;
        this.brojDresa = brojDresa;
        this.godine = godine;
        this.idDrzava = idDrzava;
        this.idKlub = idKlub;
        this.oznakaPozicije = oznakaPozicije;
        this.visina = visina;
        this.klub = klub;
        this.drzava = drzava;
    }

    public Igrac(Integer idIgrac, String ime, String prezime, Integer brojDresa, Integer godine, Integer idDrzava,
                 Integer idKlub, String oznakaPozicije, Integer visina, String klub, String drzava) {
        this.idIgrac = idIgrac;
        this.ime = ime;
        this.prezime = prezime;
        this.brojDresa = brojDresa;
        this.godine = godine;
        this.idDrzava = idDrzava;
        this.idKlub = idKlub;
        this.oznakaPozicije = oznakaPozicije;
        this.visina = visina;
        this.klub = klub;
        this.drzava = drzava;
    }

    public Integer getIdIgrac() {
        return idIgrac;
    }

    public void setIdIgrac(Integer idIgrac) {
        this.idIgrac = idIgrac;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public Integer getBrojDresa() {
        return brojDresa;
    }

    public void setBrojDresa(Integer brojDresa) {
        this.brojDresa = brojDresa;
    }

    public Integer getGodine() {
        return godine;
    }

    public void setGodine(Integer godine) {
        this.godine = godine;
    }

    public Integer getIdDrzava() {
        return idDrzava;
    }

    public void setIdDrzava(Integer idDrzava) {
        this.idDrzava = idDrzava;
    }

    public Integer getIdKlub() {
        return idKlub;
    }

    public void setIdKlub(Integer idKlub) {
        this.idKlub = idKlub;
    }

    public String getOznakaPozicije() {
        return oznakaPozicije;
    }

    public void setOznakaPozicije(String oznakaPozicije) {
        this.oznakaPozicije = oznakaPozicije;
    }

    public Integer getVisina() {
        return visina;
    }

    public void setVisina(Integer visina) {
        this.visina = visina;
    }

    public String getKlub() {
        return klub;
    }

    public void setKlub(String klub) {
        this.klub = klub;
    }

    public String getDrzava() {
        return drzava;
    }

    public void setDrzava(String drzava) {
        this.drzava = drzava;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Igrac igrac = (Igrac) o;

        return Objects.equals(idIgrac, igrac.idIgrac);
    }

    @Override
    public int hashCode() {
        return idIgrac != null ? idIgrac.hashCode() : 0;
    }

    @Override
    public String toString() {
        return ime + " " + prezime + " " + brojDresa + " - " + oznakaPozicije + " - "+ klub;
    }
}
