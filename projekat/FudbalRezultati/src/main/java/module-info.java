module com.projekat.fudbalrezultati {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.kordamp.bootstrapfx.core;
    requires java.sql;

    opens com.projekat.fudbalrezultati to javafx.fxml;
    opens com.projekat.model to javafx.base;
    exports com.projekat.fudbalrezultati;
}