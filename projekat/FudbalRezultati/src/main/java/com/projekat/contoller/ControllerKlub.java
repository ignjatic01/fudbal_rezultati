package com.projekat.contoller;

import com.projekat.model.Klub;
import com.projekat.wrapper.WrapperKlub;

import java.util.List;

public class ControllerKlub
{
    public List<Klub> getAll()
    {
        return WrapperKlub.selectAll();
    }
}
