package com.projekat.contoller;

import com.projekat.model.Gol;
import com.projekat.wrapper.WrapperGol;

import java.util.List;

public class ControllerGol
{
    public List<Gol> getAllByUtakmica(int idUtakmica)
    {
        return WrapperGol.selectByUtakmica(idUtakmica);
    }

    public boolean save(Gol g)
    {
        return WrapperGol.insert(g) == 1;
    }
}
