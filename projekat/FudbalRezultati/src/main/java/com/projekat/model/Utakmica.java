package com.projekat.model;

import java.sql.Date;
import java.sql.Time;

public class Utakmica
{
    private Integer idUtakmica;
    private Integer idDomaci;
    private Integer idGosti;
    private Integer idStadion;
    private Date datum;
    private Time vrijeme;
    private Integer goloviDomaci;
    private Integer goloviGosti;
    private Integer idLiga;
    private Integer kolo;

    //Pomocni podaci
    private String domaciKlub;
    private String gostiKlub;
    private String stadion;
    private String liga;

    public Utakmica() {
    }

    public Utakmica(Integer idDomaci, Integer idGosti, Integer idStadion, Date datum, Time vrijeme, Integer goloviDomaci,
                    Integer goloviGosti, Integer idLiga, Integer kolo, String domaciKlub, String gostiKlub, String stadion, String liga) {
        this.idDomaci = idDomaci;
        this.idGosti = idGosti;
        this.idStadion = idStadion;
        this.datum = datum;
        this.vrijeme = vrijeme;
        this.goloviDomaci = goloviDomaci;
        this.goloviGosti = goloviGosti;
        this.idLiga = idLiga;
        this.kolo = kolo;
        this.domaciKlub = domaciKlub;
        this.gostiKlub = gostiKlub;
        this.stadion = stadion;
        this.liga = liga;
    }

    public Utakmica(Integer idUtakmica, Integer idDomaci, Integer idGosti, Integer idStadion, Date datum, Time vrijeme,
                    Integer goloviDomaci, Integer goloviGosti, Integer idLiga, Integer kolo, String domaciKlub,
                    String gostiKlub, String stadion, String liga) {
        this.idUtakmica = idUtakmica;
        this.idDomaci = idDomaci;
        this.idGosti = idGosti;
        this.idStadion = idStadion;
        this.datum = datum;
        this.vrijeme = vrijeme;
        this.goloviDomaci = goloviDomaci;
        this.goloviGosti = goloviGosti;
        this.idLiga = idLiga;
        this.kolo = kolo;
        this.domaciKlub = domaciKlub;
        this.gostiKlub = gostiKlub;
        this.stadion = stadion;
        this.liga = liga;
    }

    public Integer getIdUtakmica() {
        return idUtakmica;
    }

    public void setIdUtakmica(Integer idUtakmica) {
        this.idUtakmica = idUtakmica;
    }

    public Integer getIdDomaci() {
        return idDomaci;
    }

    public void setIdDomaci(Integer idDomaci) {
        this.idDomaci = idDomaci;
    }

    public Integer getIdGosti() {
        return idGosti;
    }

    public void setIdGosti(Integer idGosti) {
        this.idGosti = idGosti;
    }

    public Integer getIdStadion() {
        return idStadion;
    }

    public void setIdStadion(Integer idStadion) {
        this.idStadion = idStadion;
    }

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
        this.datum = datum;
    }

    public Time getVrijeme() {
        return vrijeme;
    }

    public void setVrijeme(Time vrijeme) {
        this.vrijeme = vrijeme;
    }

    public Integer getGoloviDomaci() {
        return goloviDomaci;
    }

    public void setGoloviDomaci(Integer goloviDomaci) {
        this.goloviDomaci = goloviDomaci;
    }

    public Integer getGoloviGosti() {
        return goloviGosti;
    }

    public void setGoloviGosti(Integer goloviGosti) {
        this.goloviGosti = goloviGosti;
    }

    public Integer getIdLiga() {
        return idLiga;
    }

    public void setIdLiga(Integer idLiga) {
        this.idLiga = idLiga;
    }

    public Integer getKolo() {
        return kolo;
    }

    public void setKolo(Integer kolo) {
        this.kolo = kolo;
    }

    public String getDomaciKlub() {
        return domaciKlub;
    }

    public void setDomaciKlub(String domaciKlub) {
        this.domaciKlub = domaciKlub;
    }

    public String getGostiKlub() {
        return gostiKlub;
    }

    public void setGostiKlub(String gostiKlub) {
        this.gostiKlub = gostiKlub;
    }

    public String getStadion() {
        return stadion;
    }

    public void setStadion(String stadion) {
        this.stadion = stadion;
    }

    public String getLiga() {
        return liga;
    }

    public void setLiga(String liga) {
        this.liga = liga;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Utakmica utakmica = (Utakmica) o;

        return idUtakmica.equals(utakmica.idUtakmica);
    }

    @Override
    public int hashCode() {
        return idUtakmica.hashCode();
    }

    @Override
    public String toString() {
        return  domaciKlub + " - " + gostiKlub + " - " + datum;
    }
}
