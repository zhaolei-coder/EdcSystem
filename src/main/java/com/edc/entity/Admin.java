package com.edc.entity;

import org.springframework.stereotype.Component;

@Component
public class Admin {
    private int a_id;
    private String a_name;
    private String a_code;
    private String a_pwd;

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
    }

    public String getA_code() {
        return a_code;
    }

    public void setA_code(String a_code) {
        this.a_code = a_code;
    }

    public String getA_pwd() {
        return a_pwd;
    }

    public void setA_pwd(String a_pwd) {
        this.a_pwd = a_pwd;
    }

    public Admin() {
    }

    public Admin(int a_id, String a_name, String a_code, String a_pwd) {
        super();
        this.a_id = a_id;
        this.a_name = a_name;
        this.a_code = a_code;
        this.a_pwd = a_pwd;
    }

    @Override
    public String toString() {
        return "Admin [a_id=" + a_id + ", a_name=" + a_name + ", a_code=" + a_code + ", a_pwd=" + a_pwd + "]";
    }

}
