package com.projekat.model;

public class Klub
{
    private Integer idKlub;
    private String nazivKluba;
    private String grad;

    private Integer idBoja;

    public Klub() {
    }

    public Klub(String nazivKluba, String grad, Integer idBoja) {
        this.nazivKluba = nazivKluba;
        this.grad = grad;
        this.idBoja = idBoja;
    }

    public Klub(Integer idKlub, String nazivKluba, String grad, Integer idBoja) {
        this.idKlub = idKlub;
        this.nazivKluba = nazivKluba;
        this.grad = grad;
        this.idBoja = idBoja;
    }

    public Integer getIdKlub() {
        return idKlub;
    }

    public void setIdKlub(Integer idKlub) {
        this.idKlub = idKlub;
    }

    public String getNazivKluba() {
        return nazivKluba;
    }

    public void setNazivKluba(String nazivKluba) {
        this.nazivKluba = nazivKluba;
    }

    public String getGrad() {
        return grad;
    }

    public void setGrad(String grad) {
        this.grad = grad;
    }

    public Integer getIdBoja() {
        return idBoja;
    }

    public void setIdBoja(Integer idBoja) {
        this.idBoja = idBoja;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Klub klub = (Klub) o;

        return idKlub.equals(klub.idKlub);
    }

    @Override
    public int hashCode() {
        return idKlub.hashCode();
    }

    @Override
    public String toString() {
        return idKlub + " - " + nazivKluba + " " + grad;
    }
}
