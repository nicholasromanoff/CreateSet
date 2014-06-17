import controlP5.*;
import java.util.*;
import java.io.*;

ControlP5 cp5;
PFont font1, font2, font3;
String[] termValues = new String[6];
String[] defValues = new String[6];
ArrayList<Flashcard> flashcards;
int lowestIndex, current;
boolean onTerm;


void setup() {
  
  size(700, 600);
  background(188, 210, 238);
  
  stroke(188, 210, 238);
  fill(188, 210, 238);
  rect(0, 0, 700, 100);
  stroke(191, 193, 193);
  fill(191, 193, 193);
  rect(0, 100, 700, 550);
  
  stroke(75, 75, 75);
  strokeWeight(2);
  line(0, 100, 700, 100);
  
  font1 = createFont("Futura-CondensedMedium", 24);
  font2 = createFont("CenturyGothic-Bold", 36);
  font3 = createFont("CenturyGothic-Bold", 30);
  
  setupCPBoxes();
  setupCPButtons();
  
  fill(85, 85, 85);
  textFont(font2, 35);
  textAlign(CENTER);
  text("Term", 182.5, 150);
  text("Definition", 477.5, 150);
  
  onTerm = true;
  current = 0;
  lowestIndex = 0;
  flashcards = new ArrayList<Flashcard>();
  
  for (int i = 0; i < 6; i++) {
      fill(85, 85, 85);
      textFont(font2, 32);
      textAlign(CENTER);
      text(lowestIndex + i + 1 + "", 27.5, 195 + (60 * i));
      flashcards.add(new Flashcard("", ""));
  }
}

void draw() {
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    Integer index = lowestIndex + Integer.parseInt(theEvent.getName().substring(1, 2));
    if (theEvent.getName().substring(0, 1).equals("t")) {
      flashcards.get(index).setTerm(theEvent.getStringValue());
      test();
    }
    else if (theEvent.getName().substring(0, 1).equals("d")) {
      flashcards.get(index).setDefinition(theEvent.getStringValue());
      test();
    }
  }
  else if (theEvent.isAssignableFrom(Button.class) && (theEvent.getName().equals("addCard"))) {
    flashcards.add(new Flashcard("", ""));
    lowestIndex++;
    updateNumbers();
  }
}

void setupCPBoxes() {
  for (int x = 0; x < 6; x++) {
    termValues[x] = x + "";
    defValues[x] = x + "";
    cp5 = new ControlP5(this);
    String name = "t" + x;
    cp5.addTextfield(name)
       .setPosition(55, 165 + (60 * x))
       .setSize(255, 40)
       .setColor(color(60, 60, 60))
       .setCaptionLabel("")
       .setColorForeground(color(75, 75, 75))
       .setColorBackground(color(255, 255, 255))
       .setFont(font1)
       .setFocus(x == 0)
       .setAutoClear(false);
    
    name = "d" + x;
    cp5.addTextfield(name)
       .setPosition(350, 165 + (60 * x))
       .setSize(255, 40)
       .setColor(color(60, 60, 60))
       .setCaptionLabel("")
       .setColorForeground(color(75, 75, 75))
       .setColorBackground(color(255, 255, 255))
       .setFont(font1)
       .setFocus(false)
       .setAutoClear(false);
  }
}

void setupCPButtons() {
  cp5.addButton("addCard")
     .setOff()
     .setPosition(248, 547)
     .setSize(170, 37)
     .setColorForeground(color(15, 133, 88))
     .setColorBackground(color(183, 217, 177))
     .setColorCaptionLabel(color(85, 85, 85))
     .align(290, 525, 100, 400)
     .setCaptionLabel("");
     
     fill(85, 85, 85);
     textFont(font3, 27);
     textAlign(CENTER);
     text("Add Card", 333, 538);
  
  cp5.addButton("test")
     .setOff()
     .setPosition(10, 10)
     .setSize(50, 50)
     .setColorForeground(color(15, 133, 88))
     .setColorBackground(color(183, 217, 177));
}   

void updateNumbers() {
  stroke(191, 193, 193);
  fill(191, 193, 193);
  rect(5, 160, 40, 500);
  for (int i = 0; i < 6; i++) {
      fill(85, 85, 85);
      textFont(font2, 32);
      textAlign(CENTER);
      text(lowestIndex + i + 1 + "", 27.5, 195 + (60 * i));
  }  
}

String getCurrent() {
  if (onTerm) {
    return "t" + current;
  }
  else {
    return "r" + current;
  }
}
  
  
void test() {
  println("-----");
  for (int x = 0; x < flashcards.size(); x++) {
    println((x + 1) + " - " + flashcards.get(x));
    }
  println("-----");
}

