package com.projekat.contoller;

import com.projekat.model.Liga;
import com.projekat.wrapper.WrapperLiga;

import java.util.List;

public class ControllerLiga
{
    public List<Liga> getAll()
    {
        return WrapperLiga.selectAll();
    }

    public boolean save(Liga l)
    {
        return WrapperLiga.insert(l) == 1;
    }

    public int update(Liga l)
    {
        return WrapperLiga.update(l);
    }

    public int delete(int id)
    {
        return WrapperLiga.delete(id);
    }

    public Liga getById(int id)
    {
        return WrapperLiga.selectById(id);
    }
}
