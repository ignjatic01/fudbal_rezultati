package com.projekat.fudbalrezultati;

import com.projekat.contoller.ControllerKlub;
import com.projekat.contoller.ControllerLiga;
import com.projekat.contoller.ControllerStadion;
import com.projekat.contoller.ControllerUtakmica;
import com.projekat.model.Klub;
import com.projekat.model.Liga;
import com.projekat.model.Stadion;
import com.projekat.model.Utakmica;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.ObservableSet;
import javafx.geometry.Insets;
import javafx.geometry.Orientation;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.util.Duration;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.concurrent.atomic.AtomicReference;

public class UtakmicaScene
{
    public static void ucitajScenu(Stage stage)
    {
        stage.setTitle("Utakmice");
        MenuBar menuBar = HelloApplication.createMenuBar(stage);

        TableColumn<Utakmica, Integer> idUtakmicaColumn = new TableColumn<>("ID");
        idUtakmicaColumn.setMinWidth(50);
        idUtakmicaColumn.setCellValueFactory(new PropertyValueFactory<>("idUtakmica"));

        TableColumn<Utakmica, String> ligaUtakmicaColumn = new TableColumn<>("Liga");
        ligaUtakmicaColumn.setMinWidth(100);
        ligaUtakmicaColumn.setCellValueFactory(new PropertyValueFactory<>("liga"));

        TableColumn<Utakmica, String> domaciKlubColumn = new TableColumn<>("Domaći");
        domaciKlubColumn.setMinWidth(150);
        domaciKlubColumn.setCellValueFactory(new PropertyValueFactory<>("domaciKlub"));

        TableColumn<Utakmica, String> gostiKlubColumn = new TableColumn<>("Gosti");
        gostiKlubColumn.setMinWidth(150);
        gostiKlubColumn.setCellValueFactory(new PropertyValueFactory<>("gostiKlub"));

        TableColumn<Utakmica, String> stadionColumn = new TableColumn<>("Stadion");
        stadionColumn.setMinWidth(75);
        stadionColumn.setCellValueFactory(new PropertyValueFactory<>("stadion"));

        TableColumn<Utakmica, Date> datumColumn = new TableColumn<>("Datum");
        datumColumn.setMinWidth(75);
        datumColumn.setCellValueFactory(new PropertyValueFactory<>("datum"));

        TableColumn<Utakmica, Time> vrijemeColumn = new TableColumn<>("Vrijeme");
        vrijemeColumn.setMinWidth(75);
        vrijemeColumn.setCellValueFactory(new PropertyValueFactory<>("vrijeme"));

        TableColumn<Utakmica, Integer> goloviDomaciColumn = new TableColumn<>("1");
        goloviDomaciColumn.setMinWidth(25);
        goloviDomaciColumn.setCellValueFactory(new PropertyValueFactory<>("goloviDomaci"));

        TableColumn<Utakmica, Integer> goloviGostiColumn = new TableColumn<>("2");
        goloviGostiColumn.setMinWidth(25);
        goloviGostiColumn.setCellValueFactory(new PropertyValueFactory<>("goloviGosti"));

        TableColumn<Utakmica, Integer> koloColumn = new TableColumn<>("Kolo");
        koloColumn.setMinWidth(25);
        koloColumn.setCellValueFactory(new PropertyValueFactory<>("kolo"));

        TableView<Utakmica> table = new TableView<>();
        table.setItems(getUtakmica());
        table.getColumns().addAll(idUtakmicaColumn, ligaUtakmicaColumn, domaciKlubColumn, gostiKlubColumn, stadionColumn,
                goloviDomaciColumn, goloviGostiColumn, datumColumn, vrijemeColumn, koloColumn);

        //Filter
        Label filterLabel = new Label("Filter");
        filterLabel.setPadding(new Insets(10, 0, 0, 10));

        Label choiceLigaFilterLabel = new Label("Liga:");
        ControllerLiga controllerLiga = new ControllerLiga();
        ObservableList<Liga> lige = FXCollections.observableArrayList(controllerLiga.getAll());
        ChoiceBox<Liga> choiceLigaFilter = new ChoiceBox<>(lige);
        VBox vBoxLF = new VBox();
        vBoxLF.setPadding(new Insets(5));
        vBoxLF.getChildren().addAll(choiceLigaFilterLabel, choiceLigaFilter);

        Label koloFilterLabel = new Label("Kolo:");
        TextField koloFilter = new TextField();
        VBox vBoxKF = new VBox();
        vBoxKF.setPadding(new Insets(5));
        vBoxKF.getChildren().addAll(koloFilterLabel, koloFilter);

        Button btnFilter = new Button("Filtriraj");
        btnFilter.setOnAction(e -> filterTable(choiceLigaFilter, koloFilter, table));
        btnFilter.setStyle("-fx-background-color: #9E9E9E; -fx-text-fill: white;");
        StackPane spBtnFiltr = new StackPane();
        spBtnFiltr.setPadding(new Insets(20, 10, 10, 10));
        spBtnFiltr.getChildren().add(btnFilter);

        HBox hBoxFilter = new HBox();
        hBoxFilter.setPadding(new Insets(10, 10, 10, 10));
        hBoxFilter.setSpacing(30);
        hBoxFilter.getChildren().addAll(vBoxLF, vBoxKF, spBtnFiltr);

        //Insert
        Label insertLabel = new Label("Unos podataka");
        insertLabel.setPadding(new Insets(10, 0, 0, 10));

        GridPane gridUnos = new GridPane();
        gridUnos.setPadding(new Insets(10, 10, 10, 15));
        gridUnos.setVgap(8);
        gridUnos.setHgap(10);

        Label choiceLigaInsertLabel = new Label("Liga:");
        ChoiceBox<Liga> choiceLigaInsert = new ChoiceBox<>(lige);
        choiceLigaInsert.setMaxWidth(200);
        choiceLigaInsert.setMinWidth(200);
        VBox vBoxCLI = new VBox();
        vBoxCLI.getChildren().addAll(choiceLigaInsertLabel, choiceLigaInsert);
        GridPane.setConstraints(vBoxCLI, 0, 0);

        ControllerKlub controllerKlub = new ControllerKlub();
        ObservableList<Klub> klubovi = FXCollections.observableArrayList(controllerKlub.getAll());

        Label koloInputLabel = new Label("Kolo:");
        TextField koloInput = new TextField();
        koloInput.setMinWidth(200);
        koloInput.setMaxWidth(200);
        VBox vBoxKI = new VBox();
        vBoxKI.getChildren().addAll(koloInputLabel, koloInput);
        GridPane.setConstraints(vBoxKI, 1, 0);

        Label choiceDomaciInsertLabel = new Label("Domaći:");
        ChoiceBox<Klub> choiceDomaciInsert = new ChoiceBox<>(klubovi);
        choiceDomaciInsert.setMaxWidth(200);
        VBox vBoxCDI = new VBox();
        vBoxCDI.getChildren().addAll(choiceDomaciInsertLabel, choiceDomaciInsert);
        GridPane.setConstraints(vBoxCDI, 0, 1);

        Label choiceGostiInsertLabel = new Label("Gosti:");
        ChoiceBox<Klub> choiceGostiInsert = new ChoiceBox<>(klubovi);
        choiceGostiInsert.setMaxWidth(200);
        VBox vBoxCGI = new VBox();
        vBoxCGI.getChildren().addAll(choiceGostiInsertLabel, choiceGostiInsert);
        GridPane.setConstraints(vBoxCGI, 1, 1);

        AtomicReference<ObservableList<Klub>> kluboviReference = new AtomicReference<>(klubovi);
        choiceLigaInsert.getSelectionModel().selectedItemProperty().addListener((observable, oldValue, newValue) ->{
            if(newValue != null)
            {
                kluboviReference.set(FXCollections.observableArrayList(controllerKlub.getByLiga(choiceLigaInsert.getValue().getIdLiga())));
                choiceDomaciInsert.setItems(kluboviReference.get());
                choiceGostiInsert.setItems(kluboviReference.get());
                for(Klub k : kluboviReference.get())
                {
                    System.out.println(k);
                }
            }
        });

        Label datePickerInputLabel = new Label("Datum");
        DatePicker datePickerInput = new DatePicker();
        datePickerInput.setMinWidth(200);
        datePickerInput.setMaxWidth(200);
        VBox vBoxDPI = new VBox();
        vBoxDPI.getChildren().addAll(datePickerInputLabel, datePickerInput);
        GridPane.setConstraints(vBoxDPI, 0, 2);

        Label vrijemeInputLabel = new Label("Vrijeme:");
        TextField vrijemeInput = new TextField();
        vrijemeInput.setPromptText("hh:mm::ss");
        vrijemeInput.setMinWidth(200);
        vrijemeInput.setMaxWidth(200);
        VBox vBoxVI = new VBox();
        vBoxVI.getChildren().addAll(vrijemeInputLabel, vrijemeInput);
        GridPane.setConstraints(vBoxVI, 1, 2);

        Label choiceStadionInputLabel = new Label("Stadion");
        ControllerStadion controllerStadion = new ControllerStadion();
        ObservableList<Stadion> stadioni = FXCollections.observableArrayList(controllerStadion.getAll());
        ChoiceBox<Stadion> choiceStadionInput = new ChoiceBox<>(stadioni);
        choiceStadionInput.setMaxWidth(200);
        VBox vBoxCSI = new VBox();
        vBoxCSI.getChildren().addAll(choiceStadionInputLabel, choiceStadionInput);
        GridPane.setConstraints(vBoxCSI, 0 , 3);

        Button addButton = new Button("Dodaj");
        addButton.setStyle("-fx-background-color: #4caf50; -fx-text-fill: white;");
        addButton.setMinSize(128, 25);
        addButton.setOnAction(e -> insertUtakmica(table, choiceDomaciInsert, choiceGostiInsert, choiceStadionInput, datePickerInput,
                vrijemeInput, choiceLigaInsert, koloInput));
        StackPane spBtn = new StackPane();
        spBtn.setPadding(new Insets(15, 10, 10, 10));
        spBtn.getChildren().add(addButton);
        GridPane.setConstraints(spBtn, 1, 3);

        gridUnos.getChildren().addAll(vBoxCLI, vBoxKI, vBoxCDI, vBoxCGI, vBoxDPI, vBoxVI, vBoxCSI, spBtn);

        //Update
        Label updateLabel = new Label("Izmjena podataka");
        updateLabel.setPadding(new Insets(10, 0, 0, 10));

        GridPane gridUpdate = new GridPane();
        gridUpdate.setPadding(new Insets(10, 10, 15, 10));
        gridUpdate.setVgap(8);
        gridUpdate.setHgap(10);

        Label idUtakmicaUpdateLabel = new Label("ID");
        TextField idUtakmicaUpdate = new TextField();
        idUtakmicaUpdate.setMaxWidth(200);
        idUtakmicaUpdate.setMinWidth(200);
        VBox vBoxIUU = new VBox();
        vBoxIUU.getChildren().addAll(idUtakmicaUpdateLabel, idUtakmicaUpdate);
        GridPane.setConstraints(vBoxIUU, 0, 0);

        Label choiceLigaUpdateLabel = new Label("Liga:");
        ChoiceBox<Liga> choiceLigaUpdate = new ChoiceBox<>(lige);
        choiceLigaUpdate.setMaxWidth(200);
        choiceLigaUpdate.setMinWidth(200);
        VBox vBoxCLU = new VBox();
        vBoxCLU.getChildren().addAll(choiceLigaUpdateLabel, choiceLigaUpdate);
        GridPane.setConstraints(vBoxCLU, 1, 0);

        Label choiceDomaciUpdateLabel = new Label("Domaći");
        ChoiceBox<Klub> choiceDomaciUpdate = new ChoiceBox<>(klubovi);
        choiceDomaciUpdate.setMaxWidth(200);
        VBox vBoxCDU = new VBox();
        vBoxCDU.getChildren().addAll(choiceDomaciUpdateLabel, choiceDomaciUpdate);
        GridPane.setConstraints(vBoxCDU, 0, 1);

        Label choiceGostiUpdateLabel = new Label("Gosti:");
        ChoiceBox<Klub> choiceGostiUpdate = new ChoiceBox<>(klubovi);
        choiceGostiUpdate.setMaxWidth(200);
        VBox vBoxCGU = new VBox();
        vBoxCGU.getChildren().addAll(choiceGostiUpdateLabel, choiceGostiUpdate);
        GridPane.setConstraints(vBoxCGU, 1, 1);

        choiceLigaUpdate.getSelectionModel().selectedItemProperty().addListener((observable, oldValue, newValue) ->{
            if(newValue != null)
            {
                kluboviReference.set(FXCollections.observableArrayList(controllerKlub.getByLiga(choiceLigaUpdate.getValue().getIdLiga())));
                choiceDomaciUpdate.setItems(kluboviReference.get());
                choiceGostiUpdate.setItems(kluboviReference.get());
            }
        });

        Label datePickerUpdateLabel = new Label("Datum");
        DatePicker datePickerUpdate = new DatePicker();
        datePickerUpdate.setMinWidth(200);
        datePickerUpdate.setMaxWidth(200);
        VBox vBoxDPU = new VBox();
        vBoxDPU.getChildren().addAll(datePickerUpdateLabel, datePickerUpdate);
        GridPane.setConstraints(vBoxDPU, 0, 2);

        Label vrijemeUpdateLabel = new Label("Vrijeme:");
        TextField vrijemeUpdate = new TextField();
        vrijemeUpdate.setPromptText("hh:mm::ss");
        vrijemeUpdate.setMinWidth(200);
        vrijemeUpdate.setMaxWidth(200);
        VBox vBoxVU = new VBox();
        vBoxVU.getChildren().addAll(vrijemeUpdateLabel, vrijemeUpdate);
        GridPane.setConstraints(vBoxVU, 1, 2);

        Label koloUpdateLabel = new Label("Kolo:");
        TextField koloUpdate = new TextField();
        koloUpdate.setMinWidth(200);
        koloUpdate.setMaxWidth(200);
        VBox vBoxKU = new VBox();
        vBoxKU.getChildren().addAll(koloUpdateLabel, koloUpdate);
        GridPane.setConstraints(vBoxKU, 0, 3);

        Label choiceStadionUpdateLabel = new Label("Stadion");
        ChoiceBox<Stadion> choiceStadionUpdate = new ChoiceBox<>(stadioni);
        choiceStadionUpdate.setMaxWidth(200);
        VBox vBoxCSU = new VBox();
        vBoxCSU.getChildren().addAll(choiceStadionUpdateLabel, choiceStadionUpdate);
        GridPane.setConstraints(vBoxCSU, 1 , 3);

        Button updateButton = new Button("Ažuriraj");
        updateButton.setStyle("-fx-background-color: #2196F3; -fx-text-fill: white;");
        updateButton.setMinSize(128, 25);
        updateButton.setOnAction(e -> updateUtakmica(table, idUtakmicaUpdate, choiceDomaciUpdate, choiceGostiUpdate, choiceStadionUpdate,
                datePickerUpdate, vrijemeUpdate, choiceLigaUpdate, koloUpdate));
        StackPane spBtnU = new StackPane();
        //spBtnU.setPadding(new Insets(20, 10, 10, 70));
        spBtnU.getChildren().add(updateButton);
        GridPane.setConstraints(spBtnU, 0, 4);

        Button detailsButton = new Button("Detalji");
        detailsButton.setStyle("-fx-background-color: #FFC107; -fx-text-fill: white;");
        detailsButton.setMinSize(128, 25);
        detailsButton.setOnAction(e -> prikaziDetalje(idUtakmicaUpdate));
        StackPane spBtnDetails = new StackPane();
        //spBtnU.setPadding(new Insets(20, 10, 10, 70));
        spBtnDetails.getChildren().add(detailsButton);
        GridPane.setConstraints(spBtnDetails, 1, 4);

        gridUpdate.getChildren().addAll(vBoxIUU, vBoxCLU, vBoxCDU, vBoxCGU, vBoxDPU, vBoxVU, vBoxKU, vBoxCSU, spBtnU, spBtnDetails);

        HBox hBoxUnosUpdate = new HBox();
        hBoxUnosUpdate.getChildren().addAll(gridUnos, new Separator(Orientation.VERTICAL), gridUpdate);

        //Delete
        Label deleteLabel = new Label("Brisanje podataka");
        deleteLabel.setPadding(new Insets(10, 0, 0, 10));

        Label idUtakmicaDeleteLabel = new Label("ID utakmice:");
        TextField idUtakmicaDelete = new TextField();
        idUtakmicaDelete.setMinWidth(200);

        VBox vBoxIUD = new VBox();
        vBoxIUD.setPadding(new Insets(5));
        vBoxIUD.getChildren().addAll(idUtakmicaDeleteLabel, idUtakmicaDelete);

        Button deleteButton = new Button("Obriši");
        Label dummy = new Label();
        deleteButton.setStyle("-fx-background-color: #FF5252; -fx-text-fill: white;");
        deleteButton.setOnAction(e -> deleteUtakmica(idUtakmicaDelete, table));
        VBox spDBtn = new VBox();
        spDBtn.setPadding(new Insets(4, 0, -5, 15));
        spDBtn.getChildren().addAll(dummy ,deleteButton);

        HBox hBoxDelete = new HBox();
        hBoxDelete.setPadding(new Insets(10, 40, 10, 10));
        hBoxDelete.setSpacing(10);
        hBoxDelete.getChildren().addAll(vBoxIUD, spDBtn);
        hBoxDelete.setAlignment(Pos.CENTER);

        SelectionModel<Utakmica> selectionModel = table.getSelectionModel();
        selectionModel.selectedItemProperty().addListener( (obs, oldSelection, newSelection) -> {
            if(newSelection != null)
            {
                idUtakmicaUpdate.setText(String.valueOf(newSelection.getIdUtakmica()));

                ControllerLiga controllerLiga1 = new ControllerLiga();
                choiceLigaUpdate.setValue(controllerLiga1.getById(newSelection.getIdLiga()));

                choiceDomaciUpdate.setValue(controllerKlub.getById(newSelection.getIdDomaci()));
                choiceGostiUpdate.setValue(controllerKlub.getById(newSelection.getIdGosti()));

                datePickerUpdate.setValue(newSelection.getDatum().toLocalDate());
                vrijemeUpdate.setText(newSelection.getVrijeme().toString());

                choiceStadionUpdate.setValue(controllerStadion.getById(newSelection.getIdStadion()));

                koloUpdate.setText(String.valueOf(newSelection.getKolo()));

                idUtakmicaDelete.setText(String.valueOf(newSelection.getIdUtakmica()));
            }
        });

        VBox layout =  new VBox();
        layout.getChildren().addAll(menuBar, table, filterLabel, hBoxFilter, new Separator(), hBoxUnosUpdate, new Separator(), deleteLabel, hBoxDelete);
        Scene scene = new Scene(layout, 885, 750);
        stage.setScene(scene);
        stage.show();
    }

    private static void prikaziDetalje(TextField idUtakmicaUpdate)
    {
        ControllerUtakmica controllerUtakmica = new ControllerUtakmica();
        Utakmica utakmica = controllerUtakmica.selectById(Integer.parseInt(idUtakmicaUpdate.getText()));
        UtakmicaApp.ucitajStage(utakmica);
    }

    private static void deleteUtakmica(TextField idUtakmicaDelete, TableView<Utakmica> table)
    {
        int id = Integer.parseInt(idUtakmicaDelete.getText());
        int index = -1;
        for(int i = 0; i < table.getItems().size(); i++)
        {
            if(table.getItems().get(i).getIdUtakmica() == id)
            {
                index = i;
                break;
            }
        }

        ControllerUtakmica controllerUtakmica = new ControllerUtakmica();
        if(controllerUtakmica.delete(id) == 1 && index != -1)
        {
            idUtakmicaDelete.clear();
            table.getItems().remove(index);
            table.refresh();
        }
        else
        {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Brisanje neuspjesno");
            alert.setHeaderText("Id ne postoji ili neki drugi podatak zavisi od izabranog podatka");
            javafx.animation.KeyFrame keyFrame = new javafx.animation.KeyFrame(Duration.seconds(5), e -> alert.close());
            javafx.animation.Timeline timeline = new javafx.animation.Timeline(keyFrame);
            timeline.play();

            alert.show();
        }
    }

    private static void updateUtakmica(TableView<Utakmica> table, TextField idUtakmicaUpdate, ChoiceBox<Klub> choiceDomaciUpdate,
                                       ChoiceBox<Klub> choiceGostiUpdate, ChoiceBox<Stadion> choiceStadionUpdate,
                                       DatePicker datePickerUpdate, TextField vrijemeUpdate, ChoiceBox<Liga> choiceLigaUpdate,
                                       TextField koloUpdate)
    {
        Utakmica utakmica = new Utakmica();
        utakmica.setIdUtakmica(Integer.parseInt(idUtakmicaUpdate.getText()));
        utakmica.setIdLiga(choiceLigaUpdate.getValue().getIdLiga());
        utakmica.setLiga(choiceLigaUpdate.getValue().getNazivLige());
        utakmica.setIdDomaci(choiceDomaciUpdate.getValue().getIdKlub());
        utakmica.setDomaciKlub(choiceDomaciUpdate.getValue().getNazivKluba());
        utakmica.setIdGosti(choiceGostiUpdate.getValue().getIdKlub());
        utakmica.setGostiKlub(choiceGostiUpdate.getValue().getNazivKluba());
        utakmica.setIdStadion(choiceStadionUpdate.getValue().getIdStadion());
        utakmica.setStadion(choiceStadionUpdate.getValue().getNaziv());

        LocalDate localDate = datePickerUpdate.getValue();
        Date sqlDate = Date.valueOf(localDate);
        utakmica.setDatum(sqlDate);

        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
        try {
            java.util.Date parsedDate = dateFormat.parse(vrijemeUpdate.getText());
            Time time = new Time(parsedDate.getTime());
            utakmica.setVrijeme(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        utakmica.setGoloviDomaci(0);
        utakmica.setGoloviGosti(0);

        int index = -1;
        for(int i = 0; i < table.getItems().size(); i++)
        {
            if(table.getItems().get(i).getIdUtakmica() == utakmica.getIdUtakmica())
            {
                index = i;
                break;
            }
        }

        utakmica.setKolo(Integer.parseInt(koloUpdate.getText()));

        ControllerUtakmica controllerUtakmica = new ControllerUtakmica();
        if(controllerUtakmica.update(utakmica) == 1 && index != -1)
        {
            table.getItems().remove(index);
            table.getItems().add(index, utakmica);
            table.refresh();
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

    private static void insertUtakmica(TableView<Utakmica> table, ChoiceBox<Klub> choiceDomaciInsert,
                                       ChoiceBox<Klub> choiceGostiInsert, ChoiceBox<Stadion> choiceStadionInput,
                                       DatePicker datePickerInput, TextField vrijemeInput, ChoiceBox<Liga> choiceLigaInsert,
                                       TextField koloInput)
    {
        Utakmica utakmica = new Utakmica();

        utakmica.setIdDomaci(choiceDomaciInsert.getValue().getIdKlub());
        utakmica.setDomaciKlub(choiceDomaciInsert.getValue().getNazivKluba());
        utakmica.setIdGosti(choiceGostiInsert.getValue().getIdKlub());
        utakmica.setGostiKlub(choiceGostiInsert.getValue().getNazivKluba());
        utakmica.setIdStadion(choiceStadionInput.getValue().getIdStadion());
        utakmica.setStadion(choiceStadionInput.getValue().getNaziv());

        LocalDate localDate = datePickerInput.getValue();
        Date sqlDate = Date.valueOf(localDate);
        utakmica.setDatum(sqlDate);

        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
        try {
            java.util.Date parsedDate = dateFormat.parse(vrijemeInput.getText());
            Time time = new Time(parsedDate.getTime());
            utakmica.setVrijeme(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        utakmica.setGoloviDomaci(0);
        utakmica.setGoloviGosti(0);

        utakmica.setIdLiga(choiceLigaInsert.getValue().getIdLiga());
        utakmica.setLiga(choiceLigaInsert.getValue().getNazivLige());
        utakmica.setKolo(Integer.parseInt(koloInput.getText()));

        ControllerUtakmica controllerUtakmica = new ControllerUtakmica();
        if(controllerUtakmica.save(utakmica))
        {
            choiceLigaInsert.setValue(null);
            koloInput.clear();
            choiceDomaciInsert.setValue(null);
            choiceGostiInsert.setValue(null);
            datePickerInput.setValue(null);
            vrijemeInput.clear();
            choiceStadionInput.setValue(null);
            table.getItems().add(utakmica);
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

    private static void filterTable(ChoiceBox<Liga> choiceLigaFilter, TextField koloFilter, TableView<Utakmica> table)
    {
        ControllerUtakmica controllerUtakmica = new ControllerUtakmica();
        if(choiceLigaFilter.getValue() == null && "".equals(koloFilter.getText()))
        {
            //table.setItems(getUtakmica());
        }
        else if(choiceLigaFilter.getValue() != null && "".equals(koloFilter.getText()))
        {
            ObservableList<Utakmica> utakmicas = FXCollections.observableArrayList(controllerUtakmica.getByIdLiga(
                    choiceLigaFilter.getValue().getIdLiga()
            ));
            table.setItems(utakmicas);
        }
        else if(choiceLigaFilter.getValue() != null && !"".equals(koloFilter.getText()))
        {
            ObservableList<Utakmica> utakmicas = FXCollections.observableArrayList(controllerUtakmica.getByLigaKolo(
                    choiceLigaFilter.getValue().getIdLiga(), Integer.parseInt(koloFilter.getText())
            ));
            table.setItems(utakmicas);
        }
        else
        {
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Liga je obavezno polje");
            javafx.animation.KeyFrame keyFrame = new javafx.animation.KeyFrame(Duration.seconds(3), e -> alert.close());
            javafx.animation.Timeline timeline = new javafx.animation.Timeline(keyFrame);
            timeline.play();

            alert.show();
        }
        table.refresh();
    }

    public static ObservableList<Utakmica> getUtakmica()
    {
        ControllerUtakmica controllerUtakmica = new ControllerUtakmica();
        ObservableList<Utakmica> utakmice = FXCollections.observableArrayList(controllerUtakmica.getAll());
        return utakmice;
    }
}
