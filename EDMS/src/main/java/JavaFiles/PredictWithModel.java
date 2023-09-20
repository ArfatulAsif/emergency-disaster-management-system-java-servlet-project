package JavaFiles;

import weka.classifiers.Classifier;
import weka.core.Instances;
import weka.core.SerializationHelper;
import weka.core.DenseInstance;
import weka.core.Attribute;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class PredictWithModel {
	
    public int Predict(String District , int contribution , int askHelp) throws Exception {
    	
    	
        // Load the pre-trained model (replace "trained_model.model" with the actual model file)
    	
        Classifier model = TrainModel.trainModel();

        // Define the attributes (excluding the class attribute)
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

        // Create a new Instances object for prediction
        Instances newInstance = new Instances("PredictionData", attributes, 0);
        
        // Create a class attribute "CriticalHelpNeeded" (replace with the actual class values)
        ArrayList<String> classValues = new ArrayList<String>();
        classValues.add("0"); // Not needed
        classValues.add("1"); // Critical help needed
        Attribute classAttribute = new Attribute("CriticalHelpNeeded", classValues);
        
        newInstance.insertAttributeAt(classAttribute, newInstance.numAttributes());

        // Set class index to the newly added class attribute
        newInstance.setClassIndex(newInstance.numAttributes() - 1);

        // Create a new instance for prediction (replace with your data)
        
        
        
        String Sylhet[]=new String[10];
        String Moulvibazar[]=new String[10];
        Document doc = Jsoup.connect("http://www.ffwc.gov.bd/ffwc_charts/waterlevelfcast.php").get();
		Element table = doc.select("table").get(0);
		Elements rows = table.select("tr");

        for (int i = 3; i < rows.size(); i++) {
            Element row = rows.get(i);
            Elements td = row.getAllElements();
            try {
            if(td.get(1).text().equals("Brahmaputra Basin")||td.get(1).text().equals("Ganges Basin")||td.get(1).text().equals("Meghna Basin")||td.get(1).text().equals("South Eastern Hill Basin")) {
            	System.out.println(td.get(1).text());
            	System.out.println();
            }else {
            	if(td.get(2).text().equals("Sylhet")) {
            		Sylhet[0]=td.get(3).text();
            		Sylhet[1]=td.get(4).text();
            		Sylhet[2]=td.get(5).text();
            		Sylhet[3]=td.get(6).text();
            		Sylhet[4]=td.get(7).text();
            		Sylhet[5]=td.get(8).text();
            		Sylhet[6]=td.get(9).text();
            		Sylhet[7]=td.get(10).text();
            	}
            	if(td.get(2).text().equals("Moulvibazar")) {
            		Moulvibazar[0]=td.get(3).text();
            		Moulvibazar[1]=td.get(4).text();
            		Moulvibazar[2]=td.get(5).text();
            		Moulvibazar[3]=td.get(6).text();
            		Moulvibazar[4]=td.get(7).text();
            		Moulvibazar[5]=td.get(8).text();
            		Moulvibazar[6]=td.get(9).text();
            		Moulvibazar[7]=td.get(10).text();
            	}
            //System.out.println("River Name: "+td.get(1).text()+"   Station Name: "+td.get(2).text()+"   Danger Level: "+td.get(3).text()+"   Observe Level: "+td.get(4).text());System.out.println();
            }
            }catch(Exception e) {
            	System.out.print("");
            }
        }
        
        
        double[] newValues = new double[10];
        
        if(District == "Sylhet")
        {
        	for(int i=0;i<8;i++)
        	{
        		newValues[i] = Double.parseDouble(Sylhet[i]);
        	}
        }
        else 
        {
        	
            	for(int i=0;i<8;i++)
            	{
            		newValues[i] = Double.parseDouble(Moulvibazar[i]);
            	}
        }
        
        newValues[8] = contribution;
        newValues[9] = askHelp;
        
        
        
        
        
        DenseInstance instance = new DenseInstance(attributes.size() + 1); // +1 for the class attribute

        for (int i = 0; i < newValues.length; i++) {
            if (i == attributes.size()) {
                // Set class attribute
                instance.setValue(classAttribute, newValues[i]);
            } else {
                instance.setValue(attributes.get(i), newValues[i]);
            }
        }

        // Add the instance to the Instances object
        newInstance.add(instance);

        // Classify the new instance
        double predictedClass = model.classifyInstance(newInstance.firstInstance());

        // Get the predicted class label
        String predictedDecision = newInstance.attribute(newInstance.numAttributes() - 1).value((int) predictedClass);
        System.out.println("Predicted Decision: " + predictedDecision);
        
         int val = Integer.parseInt(predictedDecision);
         
         return val;
    }
}