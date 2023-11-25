package com.projekat.model;

public class Drzava
{
    public Integer idDrzava;
    public String drzava;
    public String kod;

    public Drzava(Integer idDrzava, String drzava, String kod)
    {
        this.idDrzava = idDrzava;
        this.drzava = drzava;
        this.kod = kod;
    }

    public Drzava(String drzava, String kod)
    {
        this.drzava = drzava;
        this.kod = kod;
    }

    public Drzava()
    {
        super();
    }

    public Integer getIdDrzava() {
        return idDrzava;
    }

    public void setIdDrzava(Integer idDrzava) {
        this.idDrzava = idDrzava;
    }

    public String getDrzava() {
        return drzava;
    }

    public void setDrzava(String drzava) {
        this.drzava = drzava;
    }

    public String getKod() {
        return kod;
    }

    public void setKod(String kod) {
        this.kod = kod;
    }

    @Override
    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Drzava drzava = (Drzava) o;

        return idDrzava.equals(drzava.idDrzava);
    }

    @Override
    public int hashCode()
    {
        return idDrzava.hashCode();
    }

    @Override
    public String toString()
    {
        return idDrzava + " - " + drzava  + " - " + kod;
    }
}
