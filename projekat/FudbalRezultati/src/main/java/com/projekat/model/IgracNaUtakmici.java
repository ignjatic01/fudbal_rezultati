package com.projekat.model;

import java.util.Objects;

public class IgracNaUtakmici
{
    private Integer idIgrac;
    private String ime;
    private String prezime;
    private Integer brojDresa;
    private String oznakaPozicije;
    private Integer idKlub;
    private Integer idUtakmica;
    private Boolean uIgri;

    public IgracNaUtakmici() {
    }

    public IgracNaUtakmici(String ime, String prezime, Integer brojDresa, String oznakaPozicije, Integer idKlub,
                           Integer idUtakmica, Boolean uIgri) {
        this.ime = ime;
        this.prezime = prezime;
        this.brojDresa = brojDresa;
        this.oznakaPozicije = oznakaPozicije;
        this.idKlub = idKlub;
        this.idUtakmica = idUtakmica;
        this.uIgri = uIgri;
    }

    public IgracNaUtakmici(Integer idIgrac, String ime, String prezime, Integer brojDresa, String oznakaPozicije,
                           Integer idKlub, Integer idUtakmica, Boolean uIgri) {
        this.idIgrac = idIgrac;
        this.ime = ime;
        this.prezime = prezime;
        this.brojDresa = brojDresa;
        this.oznakaPozicije = oznakaPozicije;
        this.idKlub = idKlub;
        this.idUtakmica = idUtakmica;
        this.uIgri = uIgri;
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

    public String getOznakaPozicije() {
        return oznakaPozicije;
    }

    public void setOznakaPozicije(String oznakaPozicije) {
        this.oznakaPozicije = oznakaPozicije;
    }

    public Integer getIdKlub() {
        return idKlub;
    }

    public void setIdKlub(Integer idKlub) {
        this.idKlub = idKlub;
    }

    public Integer getIdUtakmica() {
        return idUtakmica;
    }

    public void setIdUtakmica(Integer idUtakmica) {
        this.idUtakmica = idUtakmica;
    }

    public Boolean getuIgri() {
        return uIgri;
    }

    public void setuIgri(Boolean uIgri) {
        this.uIgri = uIgri;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        IgracNaUtakmici that = (IgracNaUtakmici) o;

        return Objects.equals(idIgrac, that.idIgrac);
    }

    @Override
    public int hashCode() {
        return idIgrac != null ? idIgrac.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "IgracNaUtakmici{" +
                "prezime='" + prezime + '\'' +
                ", brojDresa=" + brojDresa +
                ", oznakaPozicije='" + oznakaPozicije + '\'' +
                ", idUtakmica=" + idUtakmica +
                ", uIgri=" + uIgri +
                '}';
    }
}
