package com.projekat.contoller;

import com.projekat.model.Igrac;
import com.projekat.wrapper.WrapperIgrac;

import java.util.List;

public class ControllerIgrac
{
    public List<Igrac> getAll()
    {
        return WrapperIgrac.selectAll();
    }

    public List<Igrac> getByKlubID(int idKlub)
    {
        return WrapperIgrac.selectByKlubID(idKlub);
    }
}
