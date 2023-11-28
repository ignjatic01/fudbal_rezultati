package com.projekat.model;

public class Stadion
{
    private Integer idStadion;
    private String naziv;
    private String grad;
    private Integer kapacitet;
    private Integer idVrsta_podloge;
    private String podloga;

    public Stadion() {
    }

    public Stadion(String naziv, String grad, Integer kapacitet, Integer idVrsta_podloge, String podloga) {
        this.naziv = naziv;
        this.grad = grad;
        this.kapacitet = kapacitet;
        this.idVrsta_podloge = idVrsta_podloge;
        this.podloga = podloga;
    }

    public Stadion(Integer idStadion, String naziv, String grad, Integer kapacitet, Integer idVrsta_podloge, String podloga) {
        this.idStadion = idStadion;
        this.naziv = naziv;
        this.grad = grad;
        this.kapacitet = kapacitet;
        this.idVrsta_podloge = idVrsta_podloge;
        this.podloga = podloga;
    }

    public Integer getIdStadion() {
        return idStadion;
    }

    public void setIdStadion(Integer idStadion) {
        this.idStadion = idStadion;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public String getGrad() {
        return grad;
    }

    public void setGrad(String grad) {
        this.grad = grad;
    }

    public Integer getKapacitet() {
        return kapacitet;
    }

    public void setKapacitet(Integer kapacitet) {
        this.kapacitet = kapacitet;
    }

    public Integer getIdVrsta_podloge() {
        return idVrsta_podloge;
    }

    public void setIdVrsta_podloge(Integer idVrsta_podloge) {
        this.idVrsta_podloge = idVrsta_podloge;
    }

    public String getPodloga() {
        return podloga;
    }

    public void setPodloga(String podloga) {
        this.podloga = podloga;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Stadion stadion = (Stadion) o;

        return idStadion.equals(stadion.idStadion);
    }

    @Override
    public int hashCode() {
        return idStadion.hashCode();
    }

    @Override
    public String toString() {
        return naziv + " - " + grad;
    }
}
