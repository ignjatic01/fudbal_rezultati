package com.projekat.contoller;

import com.projekat.model.Utakmica;
import com.projekat.wrapper.WrapperUtakmica;

import java.util.List;

public class ControllerUtakmica
{
    public List<Utakmica> getAll()
    {
        return WrapperUtakmica.selectAll();
    }

    public List<Utakmica> getByIdLiga(int idLiga)
    {
        return  WrapperUtakmica.selectByLigaID(idLiga);
    }

    public List<Utakmica> getByLigaKolo(int idLiga, int kolo)
    {
        return WrapperUtakmica.getByIdLigaKolo(idLiga, kolo);
    }

    public boolean save(Utakmica u)
    {
        return WrapperUtakmica.insert(u) == 1;
    }


}
