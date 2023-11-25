package com.projekat.fudbalrezultati;



import com.projekat.contoller.ControllerDrzava;
import com.projekat.model.Drzava;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;


import java.io.IOException;

public class HelloApplication extends Application {

    Button button;

    //String food;

    Stage window;
    @Override
    public void start(Stage stage) throws IOException {
        window = stage;
        window.setTitle("Menu");

        MenuBar menuBar = createMenuBar(window);

        BorderPane layout = new BorderPane();
        layout.setTop(menuBar);
        Scene scene = new Scene(layout, 400, 300);
        window.setScene(scene);
        window.show();
    }

    public static void main(String[] args)
    {
        launch();
        ControllerDrzava cDrzava = new ControllerDrzava();
//        System.out.println(cDrzava.delete(62));
    }

    public static MenuBar createMenuBar(Stage window)
    {
        Menu sifarnici = new Menu("Šifarnici");

        MenuItem drzava = new MenuItem("Drzava");
        drzava.setOnAction(e ->DrzavaScene.ucitajScenu(window));

        MenuItem liga = new MenuItem("Liga");
        liga.setOnAction(e -> LigaScene.ucitajScenu(window));

        sifarnici.getItems().addAll(drzava, liga);

        Menu opcije = new Menu("Opcije");

        MenuItem osvjezi = new MenuItem("Osvježi");
        osvjezi.setOnAction(e -> {
            Scene scene = window.getScene();
            if (scene != null)
            {
                Parent root = scene.getRoot();
                if (root != null)
                {
                    root.requestLayout();
                    root.applyCss();
                }
            }
        });
        opcije.getItems().add(osvjezi);

        MenuBar menuBar = new MenuBar();
        menuBar.getMenus().addAll(sifarnici, opcije);

        return menuBar;
    }
}