package com.projekat.model;

import java.sql.Date;
import java.util.Objects;

public class Liga
{
    private Integer idLiga;
    private String nazivLige;
    private Integer idDrzava;
    private Date datumPocetka;
    private Date datumKraja;
    private Integer idKategorija;

    //Pomocni
    private String drzava;
    private String kategorija;

    public Liga() {
    }

    public Liga(String nazivLige, Integer idDrzava, Date datumPocetka, Date datumKraja, Integer idKategorija) {
        this.nazivLige = nazivLige;
        this.idDrzava = idDrzava;
        this.datumPocetka = datumPocetka;
        this.datumKraja = datumKraja;
        this.idKategorija = idKategorija;
    }

    public Liga(Integer idLiga, String nazivLige, Integer idDrzava, Date datumPocetka, Date datumKraja, Integer idKategorija) {
        this.idLiga = idLiga;
        this.nazivLige = nazivLige;
        this.idDrzava = idDrzava;
        this.datumPocetka = datumPocetka;
        this.datumKraja = datumKraja;
        this.idKategorija = idKategorija;
    }

    public Liga(Integer idLiga, String nazivLige, Integer idDrzava, Date datumPocetka, Date datumKraja, Integer idKategorija, String drzava, String kategorija) {
        this.idLiga = idLiga;
        this.nazivLige = nazivLige;
        this.idDrzava = idDrzava;
        this.datumPocetka = datumPocetka;
        this.datumKraja = datumKraja;
        this.idKategorija = idKategorija;
        this.drzava = drzava;
        this.kategorija = kategorija;
    }

    public Integer getIdLiga() {
        return idLiga;
    }

    public void setIdLiga(Integer idLiga) {
        this.idLiga = idLiga;
    }

    public String getNazivLige() {
        return nazivLige;
    }

    public void setNazivLige(String nazivLige) {
        this.nazivLige = nazivLige;
    }

    public Integer getIdDrzava() {
        return idDrzava;
    }

    public void setIdDrzava(Integer idDrzava) {
        this.idDrzava = idDrzava;
    }

    public Date getDatumPocetka() {
        return datumPocetka;
    }

    public void setDatumPocetka(Date datumPocetka) {
        this.datumPocetka = datumPocetka;
    }

    public Date getDatumKraja() {
        return datumKraja;
    }

    public void setDatumKraja(Date datumKraja) {
        this.datumKraja = datumKraja;
    }

    public Integer getIdKategorija() {
        return idKategorija;
    }

    public void setIdKategorija(Integer idKategorija) {
        this.idKategorija = idKategorija;
    }

    @Override
    public String toString() {
        String drz = drzava == null ? "Svijet" : drzava;
        return  nazivLige + " - " + drz;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Liga liga = (Liga) o;

        return Objects.equals(idLiga, liga.idLiga);
    }

    @Override
    public int hashCode() {
        return idLiga != null ? idLiga.hashCode() : 0;
    }

    public String getDrzava() {
        return drzava;
    }

    public void setDrzava(String drzava) {
        this.drzava = drzava;
    }

    public String getKategorija() {
        return kategorija;
    }

    public void setKategorija(String kategorija) {
        this.kategorija = kategorija;
    }
}
