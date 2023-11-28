package com.projekat.contoller;

import com.projekat.model.Stadion;
import com.projekat.wrapper.WrapperStadion;

import java.util.List;

public class ControllerStadion
{
    public List<Stadion> getAll()
    {
        return WrapperStadion.selectAll();
    }
    public Stadion getById(int id)
    {
        return WrapperStadion.selectById(id);
    }
}
