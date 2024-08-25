package org.example.entity;

public abstract class Person {

    private String name;
    private String email;
    private String password;
    private GENDER gender;


    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public GENDER getGender() {
        return gender;
    }
    public void setGender(GENDER gender) {
        this.gender = gender;
    }


}
