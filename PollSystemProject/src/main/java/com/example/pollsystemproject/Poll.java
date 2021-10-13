package com.example.pollsystemproject;


import java.io.PrintWriter;
import java.io.Serializable;
import java.util.Hashtable;




public class Poll  implements Serializable {
    private String title;
    private String question;
    private status poll_status;
    private Hashtable<String,Integer> choice;
    public enum status{
        created,running,released
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public status getPoll_status() {
        return poll_status;
    }

    public void setPoll_status(status poll_status) {
        this.poll_status = poll_status;
    }

    public Hashtable<String,Integer> getChoice() {

        return choice;
    }

    public void setChoice(Hashtable<String,Integer> choice) {
        this.choice = choice;
    }

    public void create_Poll(String title, String question, Hashtable<String,Integer> choice)  {

        this.setTitle(title);
        this.setQuestion(question);
        this.setPoll_status(status.created);
        this.setChoice(choice);

    }
    public void update_Poll(String title, String question, Hashtable<String,Integer> choice){
        this.setTitle(title);
        this.setQuestion(question);
        this.setChoice(choice);
        this.setPoll_status(status.created);
    }

    public void clear_Poll(){
        //to do
    }

    public void close_Poll(){

    }
    public void run_Poll(){
        this.setPoll_status(status.running);

    }
    public void release_Poll(){

    }
    public void unrelease_Poll(){

    }
    public void vote(int id, String choice){

    }
    public Hashtable<String, Integer> get_Poll_Result(){
        Hashtable<String, Integer> result = new Hashtable<>();
        return result;
    }
    public void down_load_Poll_Details(PrintWriter output, String filename){

    }

}

