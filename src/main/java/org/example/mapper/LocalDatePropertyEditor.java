package org.example.mapper;

import java.beans.PropertyEditorSupport;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class LocalDatePropertyEditor extends PropertyEditorSupport {

    // Convert String to LocalDate
    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if (text == null || text.isEmpty()) {
            setValue(null);  // If the input is null or empty, set LocalDate as null
        } else {
            try {
                LocalDate date = LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                setValue(date);
            } catch (DateTimeParseException e) {
                throw new IllegalArgumentException("Invalid date format: " + text);
            }
        }
    }

    // Convert LocalDate to String
    @Override
    public String getAsText() {
        LocalDate date = (LocalDate) getValue();
        return (date != null) ? date.toString() : "";
    }
}
