package com.projekat.fudbalrezultati;

import com.projekat.contoller.ControllerDrzava;
import com.projekat.contoller.ControllerKategorija;
import com.projekat.contoller.ControllerLiga;
import com.projekat.model.Drzava;
import com.projekat.model.Kategorija;
import com.projekat.model.Liga;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.util.Duration;

import java.time.LocalDate;
import java.sql.Date;

public class LigaScene
{
    public static void ucitajScenu(Stage stage)
    {
        stage.setTitle("Liga");
        MenuBar menuBar = HelloApplication.createMenuBar(stage);

        TableColumn<Liga, Integer> idLigaColumn = new TableColumn<>("ID");
        idLigaColumn.setMinWidth(50);
        idLigaColumn.setCellValueFactory(new PropertyValueFactory<>("idLiga"));

        TableColumn<Liga, String> nazivLigeColumn = new TableColumn<>("Naziv");
        nazivLigeColumn.setMinWidth(200);
        nazivLigeColumn.setCellValueFactory(new PropertyValueFactory<>("nazivLige"));

        TableColumn<Liga, String> drzavaColumn = new TableColumn<>("Država");
        drzavaColumn.setMinWidth(200);
        drzavaColumn.setCellValueFactory(new PropertyValueFactory<>("drzava"));

        TableColumn<Liga, Date> datumPocetkaColumn = new TableColumn<>("Datum početka");
        datumPocetkaColumn.setMinWidth(100);
        datumPocetkaColumn.setCellValueFactory(new PropertyValueFactory<>("datumPocetka"));

        TableColumn<Liga, Date> datumKrajaColumn = new TableColumn<>("Datum kraja");
        datumKrajaColumn.setMinWidth(100);
        datumKrajaColumn.setCellValueFactory(new PropertyValueFactory<>("datumKraja"));

        TableColumn<Liga, String> kategorijaColumn = new TableColumn<>("Kategorija");
        kategorijaColumn.setMinWidth(200);
        kategorijaColumn.setCellValueFactory(new PropertyValueFactory<>("kategorija"));

        TableView<Liga> table = new TableView<>();
        table.setItems(getLiga());
        table.getColumns().addAll(idLigaColumn, nazivLigeColumn, drzavaColumn, datumPocetkaColumn, datumKrajaColumn,
                kategorijaColumn);

        //Insert
        Label inputLabel = new Label("Unos nove lige");
        inputLabel.setPadding(new Insets(10, 0, 0, 10));

        Label nazivLigeInputLabel = new Label("Naziv lige:");
        TextField nazivLigeInput = new TextField();
        nazivLigeInput.setMinWidth(220);
        VBox vBoxNLI = new VBox();
        vBoxNLI.setPadding(new Insets(5));
        vBoxNLI.getChildren().addAll(nazivLigeInputLabel, nazivLigeInput);

        Label choiceDrzavaInputLabel = new Label("Država:");
        ControllerDrzava cDrzava = new ControllerDrzava();
        ObservableList<Drzava> drzave = FXCollections.observableArrayList(cDrzava.getAll());
        ChoiceBox<Drzava> choiceDrzavaInput = new ChoiceBox<>(drzave);
        choiceDrzavaInput.setMinWidth(300);
        choiceDrzavaInput.setMaxWidth(300);
        //choiceDrzavaInput.setStyle("-fx-pref-height: 10; -fx-background-insets: 0;");
        VBox vBoxCDI = new VBox();
        vBoxCDI.setPadding(new Insets(5));
        vBoxCDI.getChildren().addAll(choiceDrzavaInputLabel, choiceDrzavaInput);

        Label datePickerPocetakInputLabel = new Label("Datum početka:");
        DatePicker datePickerPocetakInput = new DatePicker();
        VBox vBoxDPI = new VBox();
        vBoxDPI.setPadding(new Insets(5));
        vBoxDPI.getChildren().addAll(datePickerPocetakInputLabel, datePickerPocetakInput);

        HBox hBoxInput1 = new HBox();
        hBoxInput1.setPadding(new Insets(10, 10, 10, 10));
        hBoxInput1.setSpacing(30);
        hBoxInput1.getChildren().addAll(vBoxNLI, vBoxCDI, vBoxDPI);

        Label datePickerKrajInputLabel = new Label("Datum kraja:");
        DatePicker datePickerKrajInput = new DatePicker();
        VBox vBoxDKI = new VBox();
        vBoxDKI.setPadding(new Insets(5));
        vBoxDKI.getChildren().addAll(datePickerKrajInputLabel, datePickerKrajInput);

        Label choiceKategorijaInputLabel = new Label("Kategorija:");
        ControllerKategorija cKategorija = new ControllerKategorija();
        ObservableList<Kategorija> kategorije = FXCollections.observableArrayList(cKategorija.getAll());
        ChoiceBox<Kategorija> choiceKategorijaInput = new ChoiceBox<>(kategorije);
        choiceKategorijaInput.setMinWidth(300);
        choiceKategorijaInput.setMaxWidth(300);
        VBox vBoxCKI = new VBox();
        vBoxCKI.setPadding(new Insets(5, 5, 5, 26));
        vBoxCKI.getChildren().addAll(choiceKategorijaInputLabel, choiceKategorijaInput);

        Button addButton = new Button("Dodaj");
        addButton.setStyle("-fx-background-color: #4caf50; -fx-text-fill: white;");
        addButton.setMinSize(128, 25);
        StackPane spBtn = new StackPane();
        spBtn.setPadding(new Insets(20, 10, 10, 75));
        spBtn.getChildren().add(addButton);
        addButton.setOnAction(e -> insertLiga(table, nazivLigeInput, choiceDrzavaInput, datePickerPocetakInput,
                datePickerKrajInput, choiceKategorijaInput));

        HBox hBoxInput2 = new HBox();
        hBoxInput2.setPadding(new Insets(10, 10, 10, 10));
        hBoxInput2.setSpacing(30);
        hBoxInput2.getChildren().addAll(vBoxDKI, vBoxCKI, spBtn);

        //Update
        Label updateLabel = new Label("Ažuriranje podataka");
        updateLabel.setPadding(new Insets(10, 0, 0, 10));

        Label idLigeUpdateLabel = new Label("ID lige:");
        TextField idLigaUpdate = new TextField();
        idLigaUpdate.setMaxWidth(137);
        idLigaUpdate.setMinWidth(115);
        VBox vBoxIDU = new VBox();
        vBoxIDU.setPadding(new Insets(5));
        vBoxIDU.getChildren().addAll(idLigeUpdateLabel, idLigaUpdate);

        Label nazivLigeUpdateLabel = new Label("Naziv lige:");
        TextField nazivLigeUpdate = new TextField();
        nazivLigeUpdate.setMaxWidth(300);
        nazivLigeUpdate.setMinWidth(220);
        VBox vBoxNLU = new VBox();
        vBoxNLU.setPadding(new Insets(5));
        vBoxNLU.getChildren().addAll(nazivLigeUpdateLabel, nazivLigeUpdate);

        Label choiceDrzavaUpdateLabel = new Label("Država");
        ChoiceBox<Drzava> choiceDrzavaUpdate = new ChoiceBox<>(drzave);
        choiceDrzavaUpdate.setMinWidth(300);
        choiceDrzavaUpdate.setMaxWidth(300);
        VBox vBoxCDU = new VBox();
        vBoxCDU.setPadding(new Insets(5));
        vBoxCDU.getChildren().addAll(choiceDrzavaUpdateLabel, choiceDrzavaUpdate);

        HBox hBoxUpdate1 = new HBox();
        hBoxUpdate1.setPadding(new Insets(10, 10, 10, 10));
        hBoxUpdate1.setSpacing(60);
        hBoxUpdate1.getChildren().addAll(vBoxIDU, vBoxNLU, vBoxCDU);

        SelectionModel<Liga> selectionModel = table.getSelectionModel();
        selectionModel.selectedItemProperty().addListener( (obs, oldSelection, newSelection) -> {
            if(newSelection != null)
            {
                idLigaUpdate.setText(String.valueOf(newSelection.getIdLiga()));
                nazivLigeUpdate.setText(newSelection.getNazivLige());

                ControllerDrzava controllerDrzava = new ControllerDrzava();
                choiceDrzavaUpdate.setValue(controllerDrzava.getById(newSelection.getIdDrzava()));
            }
        });

        VBox layout =  new VBox();
        layout.getChildren().addAll(menuBar, table, inputLabel, hBoxInput1, hBoxInput2, new Separator(), updateLabel, hBoxUpdate1);
        Scene scene = new Scene(layout, 850, 620);
        stage.setScene(scene);
        stage.show();
    }

    private static void insertLiga(TableView<Liga> table, TextField nazivLigeInput, ChoiceBox<Drzava> choiceDrzavaInput,
                                   DatePicker datePickerPocetakInput, DatePicker datePickerKrajInput,
                                   ChoiceBox<Kategorija> choiceKategorijaInput)
    {
        Liga liga = new Liga();

        liga.setNazivLige(nazivLigeInput.getText());
        if(choiceDrzavaInput.getValue() != null)
        {
            liga.setIdDrzava(choiceDrzavaInput.getValue().getIdDrzava());
            liga.setDrzava(choiceDrzavaInput.getValue().getDrzava());
        }

        LocalDate localDatePocetak = datePickerPocetakInput.getValue();
        Date sqlDatePocetak = Date.valueOf(localDatePocetak);
        liga.setDatumPocetka(sqlDatePocetak);

        LocalDate localDateKraj = datePickerKrajInput.getValue();
        Date sqlDateKraj = Date.valueOf(localDateKraj);
        liga.setDatumKraja(sqlDateKraj);

        liga.setIdKategorija(choiceKategorijaInput.getValue().getIdKategorija());
        String kategorija = choiceKategorijaInput.getValue().getStarosnaKategorija() + " " +
                choiceKategorijaInput.getValue().getNivoTakmicenja();
        liga.setKategorija(kategorija);

        ControllerLiga cLiga = new ControllerLiga();
        if(cLiga.save(liga))
        {
            nazivLigeInput.clear();
            choiceDrzavaInput.setValue(null);
            datePickerKrajInput.setValue(null);
            datePickerPocetakInput.setValue(null);
            choiceKategorijaInput.setValue(null);
            table.getItems().add(liga);
        }
        else
        {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Pogresan unos podataka");
            javafx.animation.KeyFrame keyFrame = new javafx.animation.KeyFrame(Duration.seconds(3), e -> alert.close());
            javafx.animation.Timeline timeline = new javafx.animation.Timeline(keyFrame);
            timeline.play();

            alert.show();
        }
    }

    public static ObservableList<Liga> getLiga()
    {
        ControllerLiga cLiga = new ControllerLiga();
        ObservableList<Liga> lige = FXCollections.observableArrayList(cLiga.getAll());
        return lige;
    }
}
