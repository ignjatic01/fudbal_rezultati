package com.projekat.contoller;

import com.projekat.model.IgracNaUtakmici;
import com.projekat.wrapper.WrapperIgracNaUtakmici;

import java.util.List;

public class ControllerIgracNaUtakmici
{
    public List<IgracNaUtakmici> getAllById(int idKlub, int idUtakmica)
    {
        return WrapperIgracNaUtakmici.selectById(idKlub, idUtakmica);
    }

    public boolean save(IgracNaUtakmici inu)
    {
        return WrapperIgracNaUtakmici.insert(inu) == 1;
    }

    public int delete(int idIgrac, int idUtakmica)
    {
        return WrapperIgracNaUtakmici.delete(idIgrac, idUtakmica);
    }
}
