package com.projekat.contoller;

import com.projekat.model.Drzava;
import com.projekat.wrapper.WrapperDrzava;

import java.util.List;

public class ControllerDrzava
{
    public List<Drzava> getAll()
    {
        return WrapperDrzava.selectAll();
    }

    public boolean save(Drzava d)
    {
        return WrapperDrzava.insert(d) == 1;
    }

    public int update(Drzava d)
    {
        return WrapperDrzava.update(d);
    }

}
