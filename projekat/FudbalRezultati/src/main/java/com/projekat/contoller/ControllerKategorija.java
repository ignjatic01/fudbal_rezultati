package com.projekat.contoller;

import com.projekat.model.Kategorija;
import com.projekat.wrapper.WrapperKategorija;

import java.util.List;

public class ControllerKategorija
{
    public List<Kategorija> getAll()
    {
        return WrapperKategorija.selectAll();
    }
}
