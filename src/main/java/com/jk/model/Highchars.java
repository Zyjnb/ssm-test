package com.jk.model;

public class Highchars {
    private  String name;
    private  Integer y;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getY() {
        return y;
    }

    public void setY(Integer y) {
        this.y = y;
    }

    @Override
    public String toString() {
        return "Highchars{" +
                "name='" + name + '\'' +
                ", y=" + y +
                '}';
    }
}
