package JavaFiles;

import weka.classifiers.trees.J48;
import weka.core.Attribute;
import weka.core.Instances;
import weka.core.SerializationHelper;
import weka.core.DenseInstance;

import java.util.ArrayList;


public class TrainModel {
	 public static J48 trainModel()  throws Exception {
        // Create attribute information (names and types)
        ArrayList<Attribute> attributes = new ArrayList<>();

        attributes.add(new Attribute("DangerLevel"));
        attributes.add(new Attribute("Day1"));
        attributes.add(new Attribute("Day2"));
        attributes.add(new Attribute("Day3"));
        attributes.add(new Attribute("Day4"));
        attributes.add(new Attribute("Day5"));
        attributes.add(new Attribute("Day6"));
        attributes.add(new Attribute("Day7"));
        attributes.add(new Attribute("ContributionCountInLast3Days"));
        attributes.add(new Attribute("AskForHelpInLast3Days"));

        // Create class attribute "CriticalHelpNeeded"
        ArrayList<String> classValues = new ArrayList<>();
        classValues.add("0"); // Not needed
        classValues.add("1"); // Critical help needed
        Attribute classAttribute = new Attribute("CriticalHelpNeeded", classValues);

        attributes.add(classAttribute);

        // Create dataset
        Instances dataset = new Instances("ReliefCenterData", attributes, 0);
        dataset.setClassIndex(attributes.size() - 1); // Set class attribute
        
       
        

        // Add data instances (replace with your data)
        String[] dataLines = {
            "10.80,7.28,6.98,6.77,6.67,6.77,6.97,7.19,2,2,0",
            "10.80,9.28,9.98,9.77,9.67,10.77,9.97,9.19,1,5,1",
            "10.80,7.28,6.98,6.77,6.67,6.77,6.97,7.19,3,7,1",
            "10.80,11.28,9.98,11.77,9.67,10.77,9.97,9.19,1,1,0",
            "10.80,10.28,11.98,11.77,9.67,10.77,9.97,9.19,2,4,1"
        };

        for (String dataLine : dataLines) {
            String[] values = dataLine.split(",");
            double[] instanceValues = new double[attributes.size()];

            for (int i = 0; i < values.length; i++) {
                if (i == attributes.size() - 1) {
                    // Set class attribute
                    instanceValues[i] = classAttribute.indexOfValue(values[i]);
                } else {
                    instanceValues[i] = Double.parseDouble(values[i]);
                }
            }

            dataset.add(new DenseInstance(1.0, instanceValues));
        }

        // Create and train a J48 decision tree classifier
        J48 tree = new J48();
        tree.buildClassifier(dataset);

        // Save the trained model to a file
        

        System.out.println("Model trained and saved successfully.");
        return tree;
	 
	 }
}