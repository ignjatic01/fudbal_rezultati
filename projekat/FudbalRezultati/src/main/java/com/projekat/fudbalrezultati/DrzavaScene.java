package com.projekat.fudbalrezultati;

import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class DrzavaScene
{
    public static void ucitajScenu(Stage stage, Scene previous)
    {

        stage.setTitle("Naslov aplikacije");

        Button button, backButton;

        button = new Button();
        button.setText("Click");
        button.setOnAction(e -> {
            System.out.println("Radi");
            System.out.println("I ovo radi");
        });

        backButton = new Button("Back");

        VBox layout = new VBox();
        layout.getChildren().add(button);
        button.setOnAction(e -> {
            stage.setScene(previous);
        });

        Scene scene = new Scene(layout, 300, 250);
        stage.setScene(scene);
        stage.show();
    }
}
