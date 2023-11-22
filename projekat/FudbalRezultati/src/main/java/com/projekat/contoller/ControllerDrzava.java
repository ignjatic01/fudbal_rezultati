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
}
